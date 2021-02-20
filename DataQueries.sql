-- List the following details of each employee: employee number, last name, first name, sex and salary.

create view employee_salaries as
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary from employees as e
join salaries as s
on e.emp_no=s.emp_no

select * from employee_salaries


-- List first name, last name, and hire date for employees who were hired in 1986.

create view employees_1986 as
select e.first_name, e.last_name, e.hire_date from employees as e
where extract(year from e.hire_date)=1986

select * from employees_1986

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

create view manager_info as
select dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.first_name, employees.last_name from dept_manager
join departments
on dept_manager.dept_no=departments.dept_no
join employees
on dept_manager.emp_no=employees.emp_no

select * from manager_info

-- List the department of each employee with the following information: employee number, last name, first name, and department name.

create view employee_dept as
select employees.emp_no, employees.last_name, employees.first_name, departments.dept_name from employees
join dept_emp
on employees.emp_no=dept_emp.emp_no
join departments 
on dept_emp.dept_no=departments.dept_no

select * from employee_dept

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

create view hercules_b as 
select employees.first_name, employees.last_name from employees
where lower(employees.first_name)='hercules'
and lower(employees.last_name) like 'b%'

select * from hercules_b

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
create view sales_employees as 
select * from employee_dept
where lower(dept_name)='sales'

select * from sales_employees

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

create view sales_dev_employees as 
select * from employee_dept
where lower(dept_name)='sales'
or lower(dept_name)='development'

select * from sales_dev_employees


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
create view last_name_freq as 
select count(e.first_name),e.last_name from employees as e
group by last_name
order by count(e.first_name) desc

select * from last_name_freq