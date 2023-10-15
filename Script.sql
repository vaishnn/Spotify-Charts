-- Checking the data
SELECT *
FROM Spotify_data.charts;

-- Artist with Maximum Streams
SELECT artist, SUM(streams)
FROM Spotify_data.charts
GROUP BY artist
ORDER By SUM(streams) DESC 
LIMIT 50;

-- Artists and the date on which their songs were most Played
SELECT artist, SUM(streams), date
FROM Spotify_data.charts
GROUP BY artist, date
ORDER By SUM(streams) DESC 
LIMIT 50;

-- Most played title of artist on particular date
SELECT title, streams, date, artist
FROM Spotify_data.charts 
ORDER BY streams DESC
LIMIT 50;

SELECT title, SUM(streams), date, artist
FROM Spotify_data.charts
GROUP BY title, date, artist
ORDER BY SUM(streams) DESC
LIMIT 50;

SELECT COUNT(DISTINCT date)
FROM Spotify_data.charts;

SELECT DISTINCT chart
FROM Spotify_data.charts;

-- Top artist with most viral50 Songs 
SELECT artist, count(*)
FROM Spotify_data.charts
WHERE chart = "viral50"
GROUP BY artist
ORDER BY count(*) DESC
LIMIT 50;

-- Songs with most occurances of viral50 Charts
SELECT title, count(*), artist 
FROM Spotify_data.charts
WHERE chart = "viral50"
GROUP BY artist, title
ORDER BY count(*) DESC
LIMIT 50;

-- To Create the View of 1.5 Million rows
CREATE OR REPLACE VIEW `Spotify_Million_Points.Top200` AS
SELECT title, date, artist, streams
FROM `stone-victor-401810.Spotify_Million_Points.Music`
WHERE chart = "top200" AND 
      NOT LEFT(STRING(date),4) = "2017" AND
      NOT RIGHT(LEFT(STRING(date),7),2) in ("01","02");

-- To Drop the column as it doesnt serves any purpose in the project
ALTER TABLE Spotify_Million_Points.Music
DROP COLUMN url;

	

