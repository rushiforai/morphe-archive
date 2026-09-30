package storage

import (
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"strings"
	"sync"
	"time"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
)

// maxCollectionNameLen bounds the stored display name. The extension's own name
// input is capped far lower (60 characters), so this only ever rejects something
// that did not come from the UI.
const maxCollectionNameLen = 255

// Store reads and writes the bookmark database.
//
// The whole save critical section runs under one mutex and each save is a single
// committed transaction with synchronous=FULL, so a shutdown can never lose an
// acknowledged save.
type Store struct {
	dir  string
	conn *sql.DB
	log  *logging.Logger
	mu   sync.Mutex
}

// NewStore opens (creating it when absent) the database inside dir.
func NewStore(dir string, log *logging.Logger) (*Store, error) {
	if log == nil {
		log = logging.Discard()
	}
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		return nil, err
	}
	return &Store{dir: dir, conn: conn, log: log}, nil
}

// Dir returns the storage directory this store reads and writes.
func (s *Store) Dir() string { return s.dir }

// Close releases the database handle.
func (s *Store) Close() error {
	if s.conn == nil {
		return nil
	}
	return s.conn.Close()
}

// Save validates, normalizes, dedupes and persists one bookmark.
//
// Error classification:
//   - *ValidationError → caller maps to 400
//   - *DuplicateError  → caller maps to 409
//   - anything else    → caller maps to 500
//
// The bookmark insert, the collection upsert and the duplicate check share one
// transaction, so a save is either fully durable or not durable at all — which is
// what lets the extension unbookmark from X only after a 201.
func (s *Store) Save(req model.SaveRequest) (model.SaveResponse, error) {
	var resp model.SaveResponse

	if err := ValidateSlug(req.Slug); err != nil {
		return resp, err
	}

	canonicalURL, tweetID, err := NormalizeURL(req.Tweet.URL)
	if err != nil {
		return resp, err
	}

	author := strings.TrimSpace(req.Tweet.Author)
	if author == "" {
		return resp, &ValidationError{Reason: "author is required"}
	}
	username := strings.TrimSpace(req.Tweet.Username)
	if username == "" {
		return resp, &ValidationError{Reason: "username is required"}
	}
	tweetDate := strings.TrimSpace(req.Tweet.TweetDate)
	if tweetDate == "" {
		return resp, &ValidationError{Reason: "tweet_date is required"}
	}
	parsedDate, err := time.Parse(time.RFC3339, tweetDate)
	if err != nil {
		return resp, &ValidationError{Reason: "tweet_date must be RFC3339 (ISO 8601)"}
	}

	name, err := collectionName(req.Slug, req.Name)
	if err != nil {
		return resp, err
	}

	// Media is auxiliary: invalid entries are dropped, never rejected.
	mediaJSON, err := json.Marshal(NormalizeMedia(req.Tweet.Media))
	if err != nil {
		return resp, fmt.Errorf("encode media for %s: %w", req.Slug, err)
	}

	s.mu.Lock()
	defer s.mu.Unlock()

	if s.conn == nil {
		return resp, errors.New("store is not open")
	}

	tx, err := s.conn.Begin()
	if err != nil {
		return resp, fmt.Errorf("begin save %s: %w", req.Slug, err)
	}
	defer func() { _ = tx.Rollback() }()

	// Dedupe is global, across every collection: one tweet may only ever be
	// saved once. bookmarks.tweet_id is the primary key, so this check and the
	// insert below cannot disagree.
	//
	// The lookup reads the owning collection's slug along with the id, in the same
	// statement: a client told "duplicate" needs to know *where* it already lives,
	// and looking that up separately afterwards could disagree with this answer.
	var existing, existingSlug string
	switch err := tx.QueryRow(
		`SELECT b.tweet_id, c.slug
		   FROM bookmarks b
		   JOIN collections c ON c.id = b.collection_id
		  WHERE b.tweet_id = ?`, tweetID,
	).Scan(&existing, &existingSlug); {
	case err == nil:
		return resp, &DuplicateError{TweetID: tweetID, Slug: existingSlug}
	case !errors.Is(err, sql.ErrNoRows):
		return resp, fmt.Errorf("look up tweet %s: %w", tweetID, err)
	}

	savedAt := time.Now().UTC().Format(time.RFC3339)

	// Create the collection on first save and refresh its display name on every
	// later one, so the gallery always shows the name the user last used for a
	// given slug. created_at is deliberately left alone by the update.
	if _, err := tx.Exec(
		`INSERT INTO collections(slug, name, created_at) VALUES(?, ?, ?)
		 ON CONFLICT(slug) DO UPDATE SET name = excluded.name`,
		req.Slug, name, savedAt,
	); err != nil {
		return resp, fmt.Errorf("upsert collection %s: %w", req.Slug, err)
	}

	var collectionID int64
	if err := tx.QueryRow(`SELECT id FROM collections WHERE slug = ?`, req.Slug).Scan(&collectionID); err != nil {
		return resp, fmt.Errorf("resolve collection %s: %w", req.Slug, err)
	}

	if _, err := tx.Exec(
		`INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)`,
		tweetID, collectionID, canonicalURL, author, username,
		parsedDate.UTC().Format(time.RFC3339), savedAt, req.Tweet.Text, string(mediaJSON),
	); err != nil {
		return resp, fmt.Errorf("insert bookmark %s: %w", tweetID, err)
	}

	if err := tx.Commit(); err != nil {
		return resp, fmt.Errorf("commit save %s: %w", tweetID, err)
	}

	s.log.SaveSuccess(tweetID, req.Slug)

	return model.SaveResponse{
		Status:  "saved",
		TweetID: tweetID,
		URL:     canonicalURL,
		Slug:    req.Slug,
		SavedAt: savedAt,
	}, nil
}

// Delete removes a bookmark from the live set and keeps it, in one transaction.
//
// The row is *moved* to `deleted_bookmarks` rather than flagged in place. That
// choice is what keeps every read path correct without a `deleted_at IS NULL`
// filter — the reader, the index, the counts, the covers and the cursors all
// query `bookmarks` and keep meaning what they say. It also makes the delete
// genuinely recoverable: the trash holds the whole row, so restoring it later is
// an INSERT ... SELECT that needs no reconstruction.
//
// Nothing is destroyed, so a crash mid-way rolls back to "still saved" rather
// than "gone from the gallery and absent from the trash".
//
// Error classification:
//   - *ValidationError → caller maps to 400
//   - *NotFoundError   → caller maps to 404
//   - anything else    → caller maps to 500
func (s *Store) Delete(tweetID string) error {
	if err := ValidateTweetID(tweetID); err != nil {
		return err
	}

	s.mu.Lock()
	defer s.mu.Unlock()

	if s.conn == nil {
		return errors.New("store is not open")
	}

	tx, err := s.conn.Begin()
	if err != nil {
		return fmt.Errorf("begin delete %s: %w", tweetID, err)
	}
	defer func() { _ = tx.Rollback() }()

	deletedAt := time.Now().UTC().Format(time.RFC3339)

	// The archive INSERT doubles as the existence check: RowsAffected is 0 only
	// when the SELECT matched nothing, so there is no window where the two
	// statements disagree about whether the tweet was there.
	res, err := tx.Exec(
		`INSERT INTO deleted_bookmarks
		   (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media, deleted_at)
		 SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media, ?
		   FROM bookmarks
		  WHERE tweet_id = ?`,
		deletedAt, tweetID,
	)
	if err != nil {
		return fmt.Errorf("archive bookmark %s: %w", tweetID, err)
	}

	archived, err := res.RowsAffected()
	if err != nil {
		return fmt.Errorf("archive bookmark %s: %w", tweetID, err)
	}
	if archived == 0 {
		return &NotFoundError{TweetID: tweetID}
	}

	if _, err := tx.Exec(`DELETE FROM bookmarks WHERE tweet_id = ?`, tweetID); err != nil {
		return fmt.Errorf("delete bookmark %s: %w", tweetID, err)
	}

	if err := tx.Commit(); err != nil {
		return fmt.Errorf("commit delete %s: %w", tweetID, err)
	}

	s.log.DeleteSuccess(tweetID)

	return nil
}

// Reassign moves a bookmark into another existing collection.
//
// The target must already exist. Creating it here would mean inventing a display
// name from a slug, and the extension owns folder names; a slug the database does
// not know is a stale picker, which the caller should answer with 404.
//
// Error classification:
//   - *ValidationError           → caller maps to 400
//   - *NotFoundError             → caller maps to 404
//   - *CollectionNotFoundError   → caller maps to 404
//   - anything else              → caller maps to 500
func (s *Store) Reassign(tweetID, slug string) error {
	if err := ValidateTweetID(tweetID); err != nil {
		return err
	}
	if err := ValidateSlug(slug); err != nil {
		return err
	}

	s.mu.Lock()
	defer s.mu.Unlock()

	if s.conn == nil {
		return errors.New("store is not open")
	}

	tx, err := s.conn.Begin()
	if err != nil {
		return fmt.Errorf("begin move %s: %w", tweetID, err)
	}
	defer func() { _ = tx.Rollback() }()

	var collectionID int64
	switch err := tx.QueryRow(`SELECT id FROM collections WHERE slug = ?`, slug).Scan(&collectionID); {
	case errors.Is(err, sql.ErrNoRows):
		return &CollectionNotFoundError{Slug: slug}
	case err != nil:
		return fmt.Errorf("resolve collection %s: %w", slug, err)
	}

	res, err := tx.Exec(
		`UPDATE bookmarks SET collection_id = ? WHERE tweet_id = ?`,
		collectionID, tweetID,
	)
	if err != nil {
		return fmt.Errorf("move bookmark %s: %w", tweetID, err)
	}

	moved, err := res.RowsAffected()
	if err != nil {
		return fmt.Errorf("move bookmark %s: %w", tweetID, err)
	}
	if moved == 0 {
		return &NotFoundError{TweetID: tweetID}
	}

	if err := tx.Commit(); err != nil {
		return fmt.Errorf("commit move %s: %w", tweetID, err)
	}

	s.log.MoveSuccess(tweetID, slug)

	return nil
}

// Index returns every saved bookmark keyed by Tweet Status ID: the O(1)
// saved-tweet lookup the content script fetches once per page entry.
//
// It reads straight from the database, in the same statement shape as a save, so
// it can never be stale relative to what the gallery serves.
func (s *Store) Index() (map[string]model.IndexEntry, error) {
	if s.conn == nil {
		return nil, errors.New("store is not open")
	}
	rows, err := s.conn.Query(
		`SELECT b.tweet_id, b.url, c.slug, b.saved_at
		   FROM bookmarks b
		   JOIN collections c ON c.id = b.collection_id`,
	)
	if err != nil {
		return nil, fmt.Errorf("read index: %w", err)
	}
	defer rows.Close()

	items := make(map[string]model.IndexEntry)
	for rows.Next() {
		var tweetID string
		var entry model.IndexEntry
		if err := rows.Scan(&tweetID, &entry.URL, &entry.Slug, &entry.SavedAt); err != nil {
			return nil, fmt.Errorf("read index row: %w", err)
		}
		items[tweetID] = entry
	}
	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("read index: %w", err)
	}
	return items, nil
}

// Stats is a whole-database summary, used for the startup log.
type Stats struct {
	Collections int
	Posts       int
	Media       int
}

// Stats counts collections, bookmarks and media URLs.
//
// The media sum is guarded by json_valid because the read path deliberately
// tolerates a malformed media cell (stored verbatim by the importer), and
// json_array_length raises on malformed JSON.
func (s *Store) Stats() (Stats, error) {
	if s.conn == nil {
		return Stats{}, errors.New("store is not open")
	}
	var stats Stats
	err := s.conn.QueryRow(
		`SELECT (SELECT count(*) FROM collections),
		        count(*),
		        coalesce(sum(CASE WHEN json_valid(media) THEN json_array_length(media) ELSE 0 END), 0)
		   FROM bookmarks`,
	).Scan(&stats.Collections, &stats.Posts, &stats.Media)
	if err != nil {
		return Stats{}, fmt.Errorf("read stats: %w", err)
	}
	return stats, nil
}

// collectionName resolves the display name to store for a collection.
//
// A name the extension supplied wins (it is what the user actually typed, with
// its own spacing and capitalisation); anything else falls back to a name derived
// from the slug, which is what an older extension that sends no name gets.
func collectionName(slug, raw string) (string, error) {
	name := strings.TrimSpace(raw)
	if name == "" {
		return model.DeriveName(slug), nil
	}
	if len([]rune(name)) > maxCollectionNameLen {
		return "", &ValidationError{Reason: "name is too long"}
	}
	return name, nil
}
