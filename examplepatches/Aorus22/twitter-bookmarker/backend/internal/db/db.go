// Package db opens and initialises the SQLite database that holds every
// collection and bookmark.
//
// There is exactly one database file per storage directory (config.DBName), and
// it is the durable source of truth: the extension appends to it through
// POST /v1/bookmarks and the gallery reads from it. It is also the only thing
// the server reads, so there is no second format to keep in step.
//
// Two connection shapes exist:
//
//   - OpenRW: the single writer. One connection, foreign keys enforced, a
//     rollback journal and synchronous=FULL, so an acknowledged save is on disk
//     before the HTTP 201 is written.
//   - OpenRO: a short-lived reader for the gallery. It never writes and never
//     creates the file, and it holds no state between calls, so a bookmark
//     appended while the server runs is visible on the next request.
package db

import (
	"database/sql"
	"errors"
	"fmt"
	"net/url"
	"os"
	"strings"

	"twitter-bookmarker/internal/config"

	_ "modernc.org/sqlite"
)

// Version is the schema version this build writes and requires. It is stored in
// the database's own PRAGMA user_version, so a future change can recognise an
// old file instead of guessing at its shape.
//
// Version 2 moved a deleted bookmark out of `bookmarks` into `deleted_bookmarks`
// (see trashSchema). A version-1 file is upgraded in place, which only ever adds
// a table — no existing row is read, rewritten or dropped.
const Version = 2

// ErrNoDatabase reports that the database file does not exist. Callers use it to
// tell "this storage directory has no data yet" apart from a real failure.
var ErrNoDatabase = errors.New("database does not exist")

// ErrUnsupportedVersion reports a database written by a different schema
// version. It is never migrated implicitly: refusing is the only way to
// guarantee that no bookmarks are dropped or corrupted.
var ErrUnsupportedVersion = errors.New("unsupported database schema version")

// OpenRW opens (creating it when absent) the writable database at path and
// guarantees a usable schema.
//
// The pragmas are passed in the DSN rather than executed once after opening, so
// they apply to every connection the pool ever hands out — a pool that recycled
// its only connection would otherwise silently lose foreign-key enforcement.
func OpenRW(path string) (*sql.DB, error) {
	// Note whether this call is the one creating the file, so the mode below is
	// applied to a brand-new database and never to one the user already has.
	_, statErr := os.Stat(path)
	creating := errors.Is(statErr, os.ErrNotExist)

	conn, err := open(path, false)
	if err != nil {
		return nil, err
	}
	if err := ensureSchema(conn); err != nil {
		_ = conn.Close()
		return nil, err
	}
	if creating {
		if err := os.Chmod(path, config.DBFileMode); err != nil {
			_ = conn.Close()
			return nil, fmt.Errorf("secure database %s: %w", path, err)
		}
	}
	return conn, nil
}

// OpenRO opens path for reading only.
//
// It returns ErrNoDatabase when the file is absent: a read-only handle must
// never create an empty database, because that would turn a missing archive into
// a silently empty gallery.
func OpenRO(path string) (*sql.DB, error) {
	if _, err := os.Stat(path); err != nil {
		if errors.Is(err, os.ErrNotExist) {
			return nil, fmt.Errorf("%w: %s", ErrNoDatabase, path)
		}
		return nil, fmt.Errorf("stat database: %w", err)
	}
	return open(path, true)
}

// open builds the connection pool for path.
func open(path string, readonly bool) (*sql.DB, error) {
	pragmas := []string{"busy_timeout(5000)"}
	if readonly {
		// query_only is belt-and-braces: the DSN mode already refuses writes, and
		// this refuses them again at the SQL layer.
		pragmas = append(pragmas, "query_only(1)")
	} else {
		pragmas = append(pragmas,
			"foreign_keys(1)",
			// DELETE rather than WAL: the storage directory is a git repository
			// the user commits, and WAL sidecars (-wal/-shm) would let a
			// committed file be missing recent rows. DELETE keeps the directory
			// to one complete file.
			"journal_mode(delete)",
			// FULL fsyncs at every commit, which is what makes an acknowledged
			// save durable.
			"synchronous(full)",
		)
	}

	conn, err := sql.Open("sqlite", dsn(path, pragmas))
	if err != nil {
		return nil, fmt.Errorf("open database %s: %w", path, err)
	}

	// One connection, kept forever. SQLite is happiest with a single writer, and
	// this makes the pragmas above trivially predictable.
	conn.SetMaxOpenConns(1)
	conn.SetMaxIdleConns(1)
	conn.SetConnMaxLifetime(0)
	conn.SetConnMaxIdleTime(0)

	// Force a real connection now so a missing directory, a permission problem
	// or a file that is not a database fails here rather than at the first query.
	if err := conn.Ping(); err != nil {
		_ = conn.Close()
		if readonly {
			return nil, fmt.Errorf("open database %s read-only: %w", path, err)
		}
		return nil, fmt.Errorf("open database %s: %w", path, err)
	}
	return conn, nil
}

// dsn renders a SQLite URI with the pragmas applied to every new connection.
//
// The path is percent-encoded because a SQLite URI ends at the first "?", and a
// storage directory is allowed to contain spaces (and, in principle, "?" or
// "#"). Escaping keeps the query separator unambiguous.
func dsn(path string, pragmas []string) string {
	escape := (&url.URL{Path: path}).EscapedPath()
	var b strings.Builder
	b.WriteString("file:")
	b.WriteString(escape)
	for i, pragma := range pragmas {
		if i == 0 {
			b.WriteByte('?')
		} else {
			b.WriteByte('&')
		}
		b.WriteString("_pragma=")
		b.WriteString(url.QueryEscape(pragma))
	}
	return b.String()
}

// ensureSchema makes the database usable, or explains why it refuses to be.
//
// Five cases, and only the first two write:
//
//	fresh         no tables, version 0        -> create the schema
//	current       version == Version           -> verify the tables exist
//	upgradable    version 1, exactly v1Tables  -> add the version-2 table
//	foreign       tables but version 0         -> refuse (unrecognised file)
//	other version version != Version           -> refuse (never migrate silently)
//
// The upgrade case exists because refusing every older file would strand the
// archive the moment the schema grows. It is narrow on purpose: only the one
// version this build knows how to extend, and only when the file really has that
// version's exact table set.
func ensureSchema(conn *sql.DB) error {
	version, err := userVersion(conn)
	if err != nil {
		return err
	}
	tables, err := userTables(conn)
	if err != nil {
		return err
	}

	switch {
	case version == 0 && len(tables) == 0:
		return applySchema(conn)
	case version == Version:
		return verifySchema(conn)
	case version == 1 && equalStrings(tables, v1Tables):
		return upgradeV1toV2(conn)
	case version == 0:
		return fmt.Errorf(
			"database holds %d table(s) but declares no schema version; refusing to use an unrecognised file",
			len(tables),
		)
	default:
		return fmt.Errorf("%w: file is version %d, this build writes version %d",
			ErrUnsupportedVersion, version, Version)
	}
}

// equalStrings reports whether two table-name lists match exactly. Both sides are
// ordered by the queries that produced them (SQLite's `ORDER BY name` and the
// literal slices in schema.go), so a plain element-wise compare is enough.
func equalStrings(got, want []string) bool {
	if len(got) != len(want) {
		return false
	}
	for i := range got {
		if got[i] != want[i] {
			return false
		}
	}
	return true
}

// userVersion reads PRAGMA user_version, which is 0 for a brand-new file.
func userVersion(conn *sql.DB) (int, error) {
	var version int
	if err := conn.QueryRow(`PRAGMA user_version`).Scan(&version); err != nil {
		return 0, fmt.Errorf("read schema version: %w", err)
	}
	return version, nil
}

// userTables lists the tables this database owns, ordered by name, ignoring
// SQLite's own sqlite_master/sqlite_sequence bookkeeping. The order is what lets
// ensureSchema compare the result against a literal slice.
func userTables(conn *sql.DB) ([]string, error) {
	rows, err := conn.Query(
		`SELECT name FROM sqlite_master
		  WHERE type = 'table' AND name NOT LIKE 'sqlite_%'
		  ORDER BY name`,
	)
	if err != nil {
		return nil, fmt.Errorf("inspect database: %w", err)
	}
	defer rows.Close()

	tables := make([]string, 0, len(expectedTables))
	for rows.Next() {
		var name string
		if err := rows.Scan(&name); err != nil {
			return nil, fmt.Errorf("inspect database: %w", err)
		}
		tables = append(tables, name)
	}
	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("inspect database: %w", err)
	}
	return tables, nil
}

// applySchema creates every table and index and stamps the version, atomically:
// a crash halfway through leaves a version-0 file with no tables, which the next
// startup treats as fresh again.
func applySchema(conn *sql.DB) error {
	tx, err := conn.Begin()
	if err != nil {
		return fmt.Errorf("begin schema transaction: %w", err)
	}
	defer func() { _ = tx.Rollback() }()

	if _, err := tx.Exec(schema); err != nil {
		return fmt.Errorf("apply schema: %w", err)
	}
	if _, err := tx.Exec(fmt.Sprintf("PRAGMA user_version = %d", Version)); err != nil {
		return fmt.Errorf("stamp schema version: %w", err)
	}
	if err := tx.Commit(); err != nil {
		return fmt.Errorf("commit schema: %w", err)
	}
	return nil
}

// upgradeV1toV2 extends a version-1 file with the version-2 trash table.
//
// It only ever adds. Nothing reads, rewrites or drops a bookmark, so the upgrade
// is safe on the live archive and cannot lose a row — the whole reason it is
// allowed to touch an existing file at all. The stamp goes in the same
// transaction as the DDL, so a crash leaves a version-1 file that the next
// startup simply tries again.
//
// The caller has already checked that the file declares version 1 and holds
// exactly v1Tables, so an unrecognised file is refused rather than altered.
func upgradeV1toV2(conn *sql.DB) error {
	tx, err := conn.Begin()
	if err != nil {
		return fmt.Errorf("begin upgrade transaction: %w", err)
	}
	defer func() { _ = tx.Rollback() }()

	if _, err := tx.Exec(trashSchema); err != nil {
		return fmt.Errorf("upgrade schema to version %d: %w", Version, err)
	}
	if _, err := tx.Exec(fmt.Sprintf("PRAGMA user_version = %d", Version)); err != nil {
		return fmt.Errorf("stamp upgraded schema version: %w", err)
	}
	if err := tx.Commit(); err != nil {
		return fmt.Errorf("commit upgrade: %w", err)
	}
	return nil
}

// verifySchema confirms that a database claiming to be Version actually has the
// tables this build queries. A version stamp alone is not evidence: a truncated
// or hand-edited file can keep its user_version while losing a table.
func verifySchema(conn *sql.DB) error {
	for _, table := range expectedTables {
		var name string
		err := conn.QueryRow(
			`SELECT name FROM sqlite_master WHERE type = 'table' AND name = ?`, table,
		).Scan(&name)
		if errors.Is(err, sql.ErrNoRows) {
			return fmt.Errorf("database declares version %d but is missing table %q", Version, table)
		}
		if err != nil {
			return fmt.Errorf("inspect table %s: %w", table, err)
		}
	}
	return nil
}
