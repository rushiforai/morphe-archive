package db_test

import (
	"database/sql"
	"errors"
	"os"
	"path/filepath"
	"reflect"
	"testing"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
)

// openRW opens the database inside a fresh temp directory.
func openRW(t *testing.T) (*sql.DB, string) {
	t.Helper()
	dir := t.TempDir()
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}
	t.Cleanup(func() { _ = conn.Close() })
	return conn, dir
}

// TestOpenRWCreatesTheSchema checks that a fresh directory yields a complete,
// versioned database.
func TestOpenRWCreatesTheSchema(t *testing.T) {
	conn, dir := openRW(t)

	if _, err := os.Stat(config.DBPath(dir)); err != nil {
		t.Fatalf("database file was not created: %v", err)
	}

	var version int
	if err := conn.QueryRow(`PRAGMA user_version`).Scan(&version); err != nil {
		t.Fatalf("read user_version: %v", err)
	}
	if version != db.Version {
		t.Errorf("user_version = %d, want %d", version, db.Version)
	}

	if got, want := dbtest.Tables(t, conn), []string{"bookmarks", "collections", "deleted_bookmarks"}; !reflect.DeepEqual(got, want) {
		t.Errorf("tables = %v, want %v", got, want)
	}
}

// TestOpenRWCreatesTheDatabaseUnreadableToOthers checks that a database this
// process creates is no more exposed than the CSVs it replaces.
//
// The directory is 0o700 as well, so this is defence in depth: it also covers the
// case where the storage directory already existed with wider permissions (a user
// who created ~/Personal/twitter-bookmarker by hand, for instance).
func TestOpenRWCreatesTheDatabaseUnreadableToOthers(t *testing.T) {
	_, dir := openRW(t)

	info, err := os.Stat(config.DBPath(dir))
	if err != nil {
		t.Fatalf("stat database: %v", err)
	}
	if got := info.Mode().Perm(); got != config.DBFileMode {
		t.Errorf("fresh database mode = %04o, want %04o", got, config.DBFileMode)
	}
}

// TestOpenRWDoesNotChangeAnExistingDatabaseMode checks the other half: the mode
// is applied on creation only, so a deliberate choice for an existing file wins.
func TestOpenRWDoesNotChangeAnExistingDatabaseMode(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := db.OpenRW(path)
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}
	_ = conn.Close()

	if err := os.Chmod(path, 0o640); err != nil {
		t.Fatalf("chmod: %v", err)
	}
	conn, err = db.OpenRW(path)
	if err != nil {
		t.Fatalf("reopen db.OpenRW() error = %v", err)
	}
	t.Cleanup(func() { _ = conn.Close() })

	info, err := os.Stat(path)
	if err != nil {
		t.Fatalf("stat database: %v", err)
	}
	if got := info.Mode().Perm(); got != 0o640 {
		t.Errorf("existing database mode = %04o, want 0640 (unchanged)", got)
	}
}

// TestSchemaColumnContract pins the exact column layout.
//
// It exists because the schema is a contract with everything that reads the
// database from outside this binary: a plain `sqlite3` shell, and the data
// repository's own scripts. A change here is a change to that contract, and this
// test is where it has to be made deliberately.
func TestSchemaColumnContract(t *testing.T) {
	conn, _ := openRW(t)

	collections := []string{"id", "slug", "name", "created_at"}
	if got := dbtest.Columns(t, conn, "collections"); !reflect.DeepEqual(got, collections) {
		t.Errorf("collections columns = %v, want %v", got, collections)
	}

	bookmarks := []string{
		"tweet_id", "collection_id", "url", "author", "username",
		"tweet_date", "saved_at", "text", "media",
	}
	if got := dbtest.Columns(t, conn, "bookmarks"); !reflect.DeepEqual(got, bookmarks) {
		t.Errorf("bookmarks columns = %v, want %v", got, bookmarks)
	}
}

// TestTweetIDIsGloballyUnique proves the "one tweet may only be saved once"
// invariant is a database constraint, not application bookkeeping.
func TestTweetIDIsGloballyUnique(t *testing.T) {
	conn, _ := openRW(t)

	linux := dbtest.Collection(t, conn, "linux", "Linux")
	ai := dbtest.Collection(t, conn, "ai", "AI")

	dbtest.Insert(t, conn, linux, dbtest.Row{TweetID: "123"})

	// The same tweet in a different collection must be rejected by the primary
	// key itself.
	_, err := conn.Exec(
		`INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES('123', ?, 'https://x.com/foo/status/123', 'A', '@a', ?, ?, '', '[]')`,
		ai, dbtest.Stamp(0), dbtest.Stamp(0))
	if err == nil {
		t.Fatal("inserting a duplicate tweet_id succeeded, want a constraint violation")
	}
}

// TestSlugIsUnique proves two collections cannot share a slug.
func TestSlugIsUnique(t *testing.T) {
	conn, _ := openRW(t)
	dbtest.Collection(t, conn, "linux", "Linux")

	if _, err := conn.Exec(
		`INSERT INTO collections(slug, name, created_at) VALUES('linux', 'Other', ?)`,
		dbtest.Stamp(0)); err == nil {
		t.Fatal("inserting a duplicate slug succeeded, want a constraint violation")
	}
}

// TestForeignKeyIsEnforced proves the bookmark→collection reference is real.
func TestForeignKeyIsEnforced(t *testing.T) {
	conn, _ := openRW(t)

	_, err := conn.Exec(
		`INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES('123', 999, 'https://x.com/foo/status/123', 'A', '@a', ?, ?, '', '[]')`,
		dbtest.Stamp(0), dbtest.Stamp(0))
	if err == nil {
		t.Fatal("inserting a bookmark with a missing collection succeeded, want a foreign key violation")
	}
}

// TestCascadeDeletesBookmarks proves ON DELETE CASCADE is in effect, so removing
// a collection cannot leave orphaned bookmarks behind.
func TestCascadeDeletesBookmarks(t *testing.T) {
	conn, _ := openRW(t)
	linux := dbtest.Collection(t, conn, "linux", "Linux")
	dbtest.Insert(t, conn, linux, dbtest.Row{TweetID: "123"})

	dbtest.MustExec(t, conn, `DELETE FROM collections WHERE id = ?`, linux)

	if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 0 {
		t.Errorf("bookmarks after deleting the collection = %d, want 0", got)
	}
}

// TestJournalModeIsDeleteAndLeavesNoSidecars proves the storage directory stays
// a single commit-able file.
//
// A WAL would leave -wal/-shm sidecars next to the database, and a committed
// tw-bookmarker.db could then be missing the newest rows. This test is what keeps
// that from being reintroduced silently.
func TestJournalModeIsDeleteAndLeavesNoSidecars(t *testing.T) {
	dir := t.TempDir()
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}

	var mode string
	if err := conn.QueryRow(`PRAGMA journal_mode`).Scan(&mode); err != nil {
		t.Fatalf("read journal_mode: %v", err)
	}
	if mode != "delete" {
		t.Errorf("journal_mode = %q, want delete", mode)
	}

	linux := dbtest.Collection(t, conn, "linux", "Linux")
	dbtest.Insert(t, conn, linux, dbtest.Row{TweetID: "123"})
	if err := conn.Close(); err != nil {
		t.Fatalf("close: %v", err)
	}

	for _, sidecar := range []string{"-wal", "-shm", "-journal"} {
		if _, err := os.Stat(config.DBPath(dir) + sidecar); err == nil {
			t.Errorf("sidecar %s was left behind", sidecar)
		}
	}
	entries, err := os.ReadDir(dir)
	if err != nil {
		t.Fatalf("read storage directory: %v", err)
	}
	if len(entries) != 1 || entries[0].Name() != config.DBName {
		var names []string
		for _, entry := range entries {
			names = append(names, entry.Name())
		}
		t.Errorf("storage directory = %v, want only %s", names, config.DBName)
	}
}

// TestSynchronousIsFull proves a commit fsyncs, which is what makes an
// acknowledged save durable.
func TestSynchronousIsFull(t *testing.T) {
	conn, _ := openRW(t)

	// PRAGMA synchronous reports an integer: 2 is FULL, 1 NORMAL, 0 OFF.
	var synchronous int
	if err := conn.QueryRow(`PRAGMA synchronous`).Scan(&synchronous); err != nil {
		t.Fatalf("read synchronous: %v", err)
	}
	if synchronous != 2 {
		t.Errorf("synchronous = %d, want 2 (FULL)", synchronous)
	}
}

// TestPragmasSurviveConnectionRecycling proves the pragmas are in the DSN rather
// than applied once, so a recycled connection cannot silently lose them.
func TestPragmasSurviveConnectionRecycling(t *testing.T) {
	conn, _ := openRW(t)

	// Drop the pooled connection and force a fresh one.
	conn.SetMaxIdleConns(0)
	if _, err := conn.Exec(`SELECT 1`); err != nil {
		t.Fatalf("recycle connection: %v", err)
	}

	var foreignKeys int
	if err := conn.QueryRow(`PRAGMA foreign_keys`).Scan(&foreignKeys); err != nil {
		t.Fatalf("read foreign_keys: %v", err)
	}
	if foreignKeys != 1 {
		t.Errorf("foreign_keys after recycling = %d, want 1", foreignKeys)
	}
}

// TestOpenRWIsIdempotent proves reopening an existing database neither fails nor
// rewrites it.
func TestOpenRWIsIdempotent(t *testing.T) {
	_, dir := openRW(t)

	for i := 0; i < 3; i++ {
		conn, err := db.OpenRW(config.DBPath(dir))
		if err != nil {
			t.Fatalf("reopen %d: %v", i, err)
		}
		if err := conn.Close(); err != nil {
			t.Fatalf("close %d: %v", i, err)
		}
	}

	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("final open: %v", err)
	}
	defer conn.Close()

	var version int
	if err := conn.QueryRow(`PRAGMA user_version`).Scan(&version); err != nil {
		t.Fatalf("read user_version: %v", err)
	}
	if version != db.Version {
		t.Errorf("user_version = %d, want %d", version, db.Version)
	}
}

// TestOpenRWRefusesAFutureVersion proves a database from a newer build is
// refused rather than opened and written with the wrong expectations.
func TestOpenRWRefusesAFutureVersion(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := db.OpenRW(path)
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}
	dbtest.MustExec(t, conn, `PRAGMA user_version = 99`)
	if err := conn.Close(); err != nil {
		t.Fatalf("close: %v", err)
	}

	_, err = db.OpenRW(path)
	if !errors.Is(err, db.ErrUnsupportedVersion) {
		t.Fatalf("db.OpenRW() error = %v, want db.ErrUnsupportedVersion", err)
	}
}

// schemaV1 is the version-1 DDL, written out here rather than imported from the
// package under test. The point of an upgrade test is to open a file that really
// has the *old* shape, so the fixture must not follow the code as it moves.
const schemaV1 = `
CREATE TABLE collections (
  id         INTEGER PRIMARY KEY,
  slug       TEXT NOT NULL UNIQUE,
  name       TEXT NOT NULL,
  created_at TEXT NOT NULL
);

CREATE TABLE bookmarks (
  tweet_id      TEXT PRIMARY KEY,
  collection_id INTEGER NOT NULL REFERENCES collections(id) ON DELETE CASCADE,
  url           TEXT NOT NULL,
  author        TEXT NOT NULL,
  username      TEXT NOT NULL,
  tweet_date    TEXT NOT NULL,
  saved_at      TEXT NOT NULL,
  text          TEXT NOT NULL DEFAULT '',
  media         TEXT NOT NULL DEFAULT '[]'
);

CREATE INDEX bookmarks_by_collection_saved
  ON bookmarks(collection_id, saved_at, tweet_id);

CREATE INDEX bookmarks_by_collection_tweet
  ON bookmarks(collection_id, tweet_date, tweet_id);
`

// writeV1 creates a version-1 database holding one collection and one bookmark,
// and returns the path. It deliberately uses raw SQL against schemaV1 so the file
// it produces is exactly what an older build would have left behind.
func writeV1(t *testing.T) string {
	t.Helper()
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := sql.Open("sqlite", "file:"+path)
	if err != nil {
		t.Fatalf("sql.Open() error = %v", err)
	}
	defer conn.Close()

	if _, err := conn.Exec(schemaV1); err != nil {
		t.Fatalf("apply version-1 schema: %v", err)
	}
	if _, err := conn.Exec(
		`INSERT INTO collections (id, slug, name, created_at) VALUES (1, 'linux', 'Linux', '2026-01-01T00:00:00Z')`,
	); err != nil {
		t.Fatalf("insert collection: %v", err)
	}
	if _, err := conn.Exec(
		`INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES ('123', 1, 'https://x.com/a/status/123', 'Ann', '@ann', '2026-02-02T00:00:00Z', '2026-03-03T00:00:00Z', 'hello', '["https://pbs.twimg.com/media/x.jpg"]')`,
	); err != nil {
		t.Fatalf("insert bookmark: %v", err)
	}
	if _, err := conn.Exec(`PRAGMA user_version = 1`); err != nil {
		t.Fatalf("stamp version 1: %v", err)
	}
	return path
}

// TestOpenRWUpgradesAVersionOneDatabase proves a version-1 file becomes usable
// instead of being refused, and that the upgrade *only adds*: every row survives
// with its values intact.
//
// Refusing older files outright would strand the archive the first time the
// schema grew, so the upgrade has to be real — and it has to be provably
// non-destructive on the one database the user cannot regenerate.
func TestOpenRWUpgradesAVersionOneDatabase(t *testing.T) {
	path := writeV1(t)

	conn, err := db.OpenRW(path)
	if err != nil {
		t.Fatalf("db.OpenRW() on a version-1 file error = %v", err)
	}
	defer conn.Close()

	var version int
	if err := conn.QueryRow(`PRAGMA user_version`).Scan(&version); err != nil {
		t.Fatalf("read user_version: %v", err)
	}
	if version != db.Version {
		t.Errorf("user_version after upgrade = %d, want %d", version, db.Version)
	}

	if got, want := dbtest.Tables(t, conn), []string{"bookmarks", "collections", "deleted_bookmarks"}; !reflect.DeepEqual(got, want) {
		t.Errorf("tables after upgrade = %v, want %v", got, want)
	}

	// The bookmark must still be there, byte for byte.
	var (
		tweetID, url, author, username, tweetDate, savedAt, text, media string
		collectionID                                                    int
	)
	err = conn.QueryRow(
		`SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media
		   FROM bookmarks WHERE tweet_id = '123'`,
	).Scan(&tweetID, &collectionID, &url, &author, &username, &tweetDate, &savedAt, &text, &media)
	if err != nil {
		t.Fatalf("read the bookmark back after upgrade: %v", err)
	}
	if url != "https://x.com/a/status/123" || author != "Ann" || text != "hello" || collectionID != 1 {
		t.Errorf("the upgrade changed the bookmark row: %+v", []any{collectionID, url, author, text})
	}
	if media != `["https://pbs.twimg.com/media/x.jpg"]` {
		t.Errorf("media after upgrade = %q, want the stored JSON untouched", media)
	}

	// The trash starts empty: upgrading is not the same as deleting.
	var trashed int
	if err := conn.QueryRow(`SELECT count(*) FROM deleted_bookmarks`).Scan(&trashed); err != nil {
		t.Fatalf("count trash: %v", err)
	}
	if trashed != 0 {
		t.Errorf("deleted_bookmarks after upgrade = %d, want 0", trashed)
	}
}

// TestOpenRWUpgradeIsIdempotent proves a second open finds a current database and
// writes nothing more.
func TestOpenRWUpgradeIsIdempotent(t *testing.T) {
	path := writeV1(t)

	for i := 0; i < 3; i++ {
		conn, err := db.OpenRW(path)
		if err != nil {
			t.Fatalf("open %d: %v", i, err)
		}
		if err := conn.Close(); err != nil {
			t.Fatalf("close %d: %v", i, err)
		}
	}
}

// TestOpenRWRefusesAVersionOneFileWithTheWrongShape proves the upgrade is narrow:
// a file that merely *claims* version 1 is refused rather than altered, because
// the stamp is not evidence of shape.
func TestOpenRWRefusesAVersionOneFileWithTheWrongShape(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := sql.Open("sqlite", "file:"+path)
	if err != nil {
		t.Fatalf("sql.Open() error = %v", err)
	}
	if _, err := conn.Exec(`CREATE TABLE collections (id INTEGER PRIMARY KEY)`); err != nil {
		t.Fatalf("create table: %v", err)
	}
	if _, err := conn.Exec(`PRAGMA user_version = 1`); err != nil {
		t.Fatalf("stamp version 1: %v", err)
	}
	if err := conn.Close(); err != nil {
		t.Fatalf("close: %v", err)
	}

	_, err = db.OpenRW(path)
	if !errors.Is(err, db.ErrUnsupportedVersion) {
		t.Fatalf("db.OpenRW() error = %v, want db.ErrUnsupportedVersion", err)
	}
}

// TestOpenRWRefusesATableWithoutAVersion proves an unrecognised file is not
// adopted by quietly layering the schema onto it.
func TestOpenRWRefusesATableWithoutAVersion(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := sql.Open("sqlite", "file:"+path)
	if err != nil {
		t.Fatalf("sql.Open() error = %v", err)
	}
	if _, err := conn.Exec(`CREATE TABLE something_else(id TEXT PRIMARY KEY)`); err != nil {
		t.Fatalf("create table: %v", err)
	}
	if err := conn.Close(); err != nil {
		t.Fatalf("close: %v", err)
	}

	if _, err := db.OpenRW(path); err == nil {
		t.Fatal("db.OpenRW() accepted a database with an unknown table, want a refusal")
	}
}

// TestOpenRWRefusesAMissingTable proves a version stamp alone is not evidence:
// a truncated database that kept its user_version is still refused.
func TestOpenRWRefusesAMissingTable(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)

	conn, err := db.OpenRW(path)
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}
	dbtest.MustExec(t, conn, `DROP TABLE bookmarks`)
	if err := conn.Close(); err != nil {
		t.Fatalf("close: %v", err)
	}

	if _, err := db.OpenRW(path); err == nil {
		t.Fatal("db.OpenRW() accepted a database missing the bookmarks table, want a refusal")
	}
}

// TestOpenRWRefusesAFileThatIsNotADatabase proves a corrupt file fails loudly
// instead of being replaced by a new empty database.
func TestOpenRWRefusesAFileThatIsNotADatabase(t *testing.T) {
	dir := t.TempDir()
	path := config.DBPath(dir)
	if err := os.WriteFile(path, []byte("this is not a sqlite file\n"), 0o600); err != nil {
		t.Fatalf("write fake database: %v", err)
	}

	if _, err := db.OpenRW(path); err == nil {
		t.Fatal("db.OpenRW() accepted a non-database file, want a refusal")
	}
	// The original bytes must survive: refusing means refusing to touch it.
	data, err := os.ReadFile(path)
	if err != nil {
		t.Fatalf("read back: %v", err)
	}
	if string(data) != "this is not a sqlite file\n" {
		t.Errorf("the file was modified: %q", data)
	}
}

// TestOpenRORefusesAMissingDatabase proves a read-only handle reports "no data"
// rather than creating an empty database, which would turn a missing archive into
// a silently empty gallery.
func TestOpenRORefusesAMissingDatabase(t *testing.T) {
	dir := t.TempDir()

	_, err := db.OpenRO(config.DBPath(dir))
	if !errors.Is(err, db.ErrNoDatabase) {
		t.Fatalf("db.OpenRO() error = %v, want db.ErrNoDatabase", err)
	}
	if _, err := os.Stat(config.DBPath(dir)); !errors.Is(err, os.ErrNotExist) {
		t.Errorf("db.OpenRO() created the database file; it must not")
	}
}

// TestOpenRORefusesWrites proves a read handle cannot write, even if a future
// caller tried to.
func TestOpenRORefusesWrites(t *testing.T) {
	_, dir := openRW(t)

	conn, err := db.OpenRO(config.DBPath(dir))
	if err != nil {
		t.Fatalf("db.OpenRO() error = %v", err)
	}
	defer conn.Close()

	if _, err := conn.Exec(
		`INSERT INTO collections(slug, name, created_at) VALUES('nope', 'Nope', ?)`,
		dbtest.Stamp(0)); err == nil {
		t.Fatal("a write through the read-only handle succeeded, want a refusal")
	}
}

// TestOpenROSeesWhatOpenRWCommitted proves the two handles address the same data,
// which is what lets the gallery read a database the writer is using.
func TestOpenROSeesWhatOpenRWCommitted(t *testing.T) {
	_, dir := openRW(t)

	writer, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("db.OpenRW() error = %v", err)
	}
	defer writer.Close()

	linux := dbtest.Collection(t, writer, "linux", "Linux")
	dbtest.Insert(t, writer, linux, dbtest.Row{TweetID: "123", Text: "hello"})

	reader, err := db.OpenRO(config.DBPath(dir))
	if err != nil {
		t.Fatalf("db.OpenRO() error = %v", err)
	}
	defer reader.Close()

	if got := dbtest.Count(t, reader, `SELECT count(*) FROM bookmarks`); got != 1 {
		t.Errorf("read-only bookmarks = %d, want 1", got)
	}
	if got := dbtest.Text(t, reader, `SELECT text FROM bookmarks WHERE tweet_id = '123'`); got != "hello" {
		t.Errorf("read-only text = %q, want hello", got)
	}
}

// TestMediaColumnSurvivesMalformedJSON proves the media column stores whatever it
// was given, which is what keeps the read path's tolerance meaningful: a
// malformed cell is preserved rather than rejected or rewritten.
func TestMediaColumnSurvivesMalformedJSON(t *testing.T) {
	conn, _ := openRW(t)
	linux := dbtest.Collection(t, conn, "linux", "Linux")
	dbtest.Insert(t, conn, linux, dbtest.Row{TweetID: "123", Media: "not-json"})

	if got := dbtest.Text(t, conn, `SELECT media FROM bookmarks WHERE tweet_id = '123'`); got != "not-json" {
		t.Errorf("media = %q, want the verbatim value", got)
	}

	// The stats query guards json_array_length with json_valid precisely because
	// it would otherwise raise on this row.
	guarded := dbtest.Count(t, conn,
		`SELECT coalesce(sum(CASE WHEN json_valid(media) THEN json_array_length(media) ELSE 0 END), 0) FROM bookmarks`)
	if guarded != 0 {
		t.Errorf("guarded media count = %d, want 0", guarded)
	}
}

// TestDatabasePathIsInsideTheStorageDirectory pins the one file the server owns.
func TestDatabasePathIsInsideTheStorageDirectory(t *testing.T) {
	dir := t.TempDir()
	want := filepath.Join(dir, config.DBName)
	if got := config.DBPath(dir); got != want {
		t.Errorf("config.DBPath(%q) = %q, want %q", dir, got, want)
	}
}
