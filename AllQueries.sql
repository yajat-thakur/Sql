Q 175.......
Select firstName,lastName,city,state from Person left join Address on Person.personId = Address.personId;
Q 181.......
select e1.name as Employee from Employee as e1 left join Employee as e2 on e1.managerId = e2.id where e1.salary > e2.salary;
Q 182.......
select email as Email from Person group by email having count(email)>1;
Q 183......
select c.name as Customers from Customers c where c.id not in (select c.id from Customers c inner join Orders o on c.id=o.customerId);
Q 577......
select e.name,b.bonus from Employee  as e left join Bonus as b on e.empId = b.empId
where b.bonus<1000 or b.bonus is null;
Q 584......
select name from Customer where referee_id <> 2 or referee_id is null ;
Q 586......
with cte as
(select customer_number,count(order_number) as c from Orders group by customer_number)
select customer_number from cte 
where c = (select max(c) from cte);
Q 595.....
select name,population,area from World where area >=3000000 or population >=25000000;
Q 596.....
select class from Courses group by class having count(student) >=5;
Q 610.....
select * ,
case 
  when x+y>z and y+z>x and x+z>y then "Yes"
  else "No"
end as Triangle
from Triangle;
Q 619....
with cte as
(select num from MyNumbers group by num having count(num) = 1 order by num desc)
select case when count(num)>0 then num else null end as num from cte limit 1;
Q 620....
select * from Cinema where id%2 <> 0 and description <> "boring" order by rating desc;
Q 627....
update Salary
set sex=case when sex = "f" then "m"
when sex = "m" then "f" end;
Q 1050...
select actor_id,director_id from ActorDirector group by director_id,actor_id having count(timestamp) >= 3; 
Q 1757....
select product_id from Products where low_fats = "Y" and recyclable = "Y";
Q 1148....
select distinct author_id as id from Views where author_id = viewer_id order by author_id asc;
Q 1683....
select tweet_id from Tweets where length(content) > 15;
Q 1378...
select unique_id,name from  Employees left join EmployeeUNI on Employees.id = EmployeeUNI.id ;
Q 1068...
select product_name,year,price from Sales left join Product on Sales.product_id = Product.product_id; 
Q 1581...
select  customer_id,count(*) as count_no_trans  from Visits left join Transactions on Visits.visit_id = Transactions.visit_id  where transaction_id is null group by customer_id; 
Q 570....
select Employee.name from Employee left join Employee as e on Employee.id = e.managerId
group by Employee.id having count(Employee.id) >=5 ;
Q 1934...
select s.user_id, round(avg(if(c.action="confirmed",1,0)),2) as confirmation_rate
from Signups as s left join Confirmations as c on s.user_id= c.user_id group by user_id;
Q 1193....
select
date_formate(trans_date,'%Y-%m') as month,country,count(id) as trans_count,sum(state = "approved") as approved_total_amount,sum(amount) as trans_total_amount,sum(if(state ="approved",amount,0)) as approved_total_amount;
Q 1907....
with categorized as (
  select case 
           when income < 20000 then 'Low Salary'
           when income between 20000 and 50000 then 'Average Salary'
           when income > 50000 then 'High Salary'
         end as category
  from accounts
),
categories as (
  select 'Low Salary' as category
  union all
  select 'Average Salary'
  union all
  select 'High Salary'
)
select c.category,count(cat.category) as accounts_count
from categories c
left join categorized cat on c.category=cat.category
group by c.category;

Q 1280....
with cte as (select * from Students cross join Subjects),
cte2 as (select student_id,subject_name,count(subject_name) as count
from Examinations group by student_id, subject_name)
select cte.student_id,cte.student_name,cte.subject_name, case when count is not null then count else 0 end as attended_exams
from cte left join cte2 on cte.student_id  = cte2.student_id and cte.subject_name = cte2.subject_name order by cte.student_id,cte.subject_name;

Q 1407....
# Write your MySQL query statement below
with cte as (select u.name,ifnull(sum(r.distance),0) as travelled_distance  from Users as u  left join Rides as r on u.id = r.user_id group by r.user_id order by name asc)
select name,travelled_distance from cte order by travelled_distance desc ;

Q 1484...
select sell_date, count( DISTINCT product ) as num_sold ,
    
    GROUP_CONCAT( DISTINCT product order by product ASC separator ',' ) as products
    
        FROM Activities GROUP BY sell_date order by sell_date ASC;

      