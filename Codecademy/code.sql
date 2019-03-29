 SELECT *
 FROM survey
 LIMIT 10;
 
SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

 SELECT *
 FROM quiz
 LIMIT 5;
 
 SELECT *
 FROM home_try_on
 LIMIT 5;
 
 SELECT *
 FROM purchase
 LIMIT 5;
 
select q.user_id,
h.user_id is not null as 'is_home_try_on',
h.number_of_pairs,
p.user_id is not null as 'is_purchase'
from quiz q
left join home_try_on h
on q.user_id=h.user_id
left join purchase p
on q.user_id=p.user_id
LIMIT 10;

WITH data_set AS
(
 SELECT
   DISTINCT q.USER_ID,
   h.user_id IS NOT NULL AS is_home_try_on,
   h.number_of_pairs,
   p.user_id IS NOT NULL AS is_purchase
 FROM quiz q
 LEFT JOIN home_try_on h
 ON q.user_id = h.user_id
 LEFT JOIN purchase p
 ON q.user_id = p.user_id
)
 SELECT 
 number_of_pairs,count(*) ,
 SUM(is_home_try_on),
 SUM(is_purchase),
 1.0 * SUM(is_purchase)/SUM(is_home_try_on) as percentage
 FROM data_set
 GROUP BY number_of_pairs;