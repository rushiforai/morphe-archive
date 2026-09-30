// Package dbtest builds bookmark databases for tests.
//
// It is imported only from _test.go files, so it is never linked into the
// server. Keeping one fixture helper here means every package's tests create
// databases the same way, and a test that needs an unusual row (a malformed
// media cell, a hand-edited timestamp) can insert it directly instead of going
// through the writer under test.
package dbtest

import (
	"database/sql"
	"path"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
)

// Base is the reference instant every fixture timestamp derives from. It is
// fixed so that a fixture's saved_at/tweet_date ordering is identical on every
// run and in every time zone.
var Base = time.Date(2026, 9, 27, 2, 0, 0, 0, time.UTC)

// Stamp renders Base minus daysAgo days as UTC RFC3339.
func Stamp(daysAgo int) string {
	return Base.AddDate(0, 0, -daysAgo).Format(time.RFC3339)
}

// Open opens (creating the schema in) the database inside dir and registers its
// close as a test cleanup.
func Open(t *testing.T, dir string) *sql.DB {
	t.Helper()
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("dbtest: open database in %s: %v", dir, err)
	}
	t.Cleanup(func() { _ = conn.Close() })
	return conn
}

// Row is one bookmark to insert. Insert fills every empty field with a derived
// default, so a test states only the fields it actually asserts on.
type Row struct {
	TweetID   string
	URL       string
	Media     string
	Author    string
	Username  string
	TweetDate string
	SavedAt   string
	Text      string
}

// Insert writes one bookmark into collectionID and returns the tweet id it used.
func Insert(t *testing.T, conn *sql.DB, collectionID int64, row Row) string {
	t.Helper()

	tweetID := row.TweetID
	url := row.URL
	if url == "" {
		if tweetID == "" {
			t.Fatal("dbtest: a row needs a TweetID or a URL")
		}
		url = "https://x.com/testauthor/status/" + tweetID
	}
	if tweetID == "" {
		tweetID = path.Base(url)
	}
	if row.Author == "" {
		row.Author = "Test Author"
	}
	if row.Username == "" {
		row.Username = "@testauthor"
	}
	if row.TweetDate == "" {
		row.TweetDate = Stamp(0)
	}
	if row.SavedAt == "" {
		row.SavedAt = Stamp(0)
	}
	if row.Media == "" {
		row.Media = "[]"
	}

	MustExec(t, conn,
		`INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)`,
		tweetID, collectionID, url, row.Author, row.Username, row.TweetDate, row.SavedAt, row.Text, row.Media)
	return tweetID
}

// Collection inserts a collection and returns its id. An empty name falls back
// to the slug, which is what the schema requires (name is NOT NULL).
func Collection(t *testing.T, conn *sql.DB, slug, name string) int64 {
	t.Helper()
	if name == "" {
		name = slug
	}
	result, err := conn.Exec(
		`INSERT INTO collections(slug, name, created_at) VALUES(?, ?, ?)`,
		slug, name, Stamp(0),
	)
	if err != nil {
		t.Fatalf("dbtest: insert collection %s: %v", slug, err)
	}
	id, err := result.LastInsertId()
	if err != nil {
		t.Fatalf("dbtest: collection id for %s: %v", slug, err)
	}
	return id
}

// Seed creates a collection with rows and returns the number of rows written.
func Seed(t *testing.T, conn *sql.DB, slug, name string, rows ...Row) int64 {
	t.Helper()
	id := Collection(t, conn, slug, name)
	for _, row := range rows {
		Insert(t, conn, id, row)
	}
	return id
}

// MustExec runs a statement, failing the test on error.
func MustExec(t *testing.T, conn *sql.DB, query string, args ...any) {
	t.Helper()
	if _, err := conn.Exec(query, args...); err != nil {
		t.Fatalf("dbtest: exec %s: %v", oneLine(query), err)
	}
}

// Count runs a query expected to yield a single integer.
func Count(t *testing.T, conn *sql.DB, query string, args ...any) int {
	t.Helper()
	var value int
	if err := conn.QueryRow(query, args...).Scan(&value); err != nil {
		t.Fatalf("dbtest: query %s: %v", oneLine(query), err)
	}
	return value
}

// Text runs a query expected to yield a single string.
func Text(t *testing.T, conn *sql.DB, query string, args ...any) string {
	t.Helper()
	var value string
	if err := conn.QueryRow(query, args...).Scan(&value); err != nil {
		t.Fatalf("dbtest: query %s: %v", oneLine(query), err)
	}
	return value
}

// Tables lists the user tables in conn, sorted.
func Tables(t *testing.T, conn *sql.DB) []string {
	t.Helper()
	rows, err := conn.Query(
		`SELECT name FROM sqlite_master WHERE type = 'table' AND name NOT LIKE 'sqlite_%' ORDER BY name`)
	if err != nil {
		t.Fatalf("dbtest: list tables: %v", err)
	}
	defer rows.Close()

	var names []string
	for rows.Next() {
		var name string
		if err := rows.Scan(&name); err != nil {
			t.Fatalf("dbtest: scan table name: %v", err)
		}
		names = append(names, name)
	}
	return names
}

// Columns lists the column names of table, in declaration order.
func Columns(t *testing.T, conn *sql.DB, table string) []string {
	t.Helper()
	rows, err := conn.Query(`SELECT name FROM pragma_table_info(?)`, table)
	if err != nil {
		t.Fatalf("dbtest: columns of %s: %v", table, err)
	}
	defer rows.Close()

	var names []string
	for rows.Next() {
		var name string
		if err := rows.Scan(&name); err != nil {
			t.Fatalf("dbtest: scan column name: %v", err)
		}
		names = append(names, name)
	}
	return names
}

// oneLine collapses a query's whitespace so a failure message stays readable.
func oneLine(query string) string {
	return strings.Join(strings.Fields(query), " ")
}
