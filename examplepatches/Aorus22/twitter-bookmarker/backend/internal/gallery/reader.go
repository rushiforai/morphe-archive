package gallery

import (
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"strings"
	"time"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/storage"
)

// Reader reads gallery collections out of one storage directory's database. It
// holds no derived state: every call opens a fresh read-only handle, so a
// bookmark saved while the server runs is visible on the next call (GAL-14).
type Reader struct {
	dir string
	log *logging.Logger
}

// New builds a Reader over dir. A nil logger is replaced by a discarding one.
func New(dir string, log *logging.Logger) *Reader {
	if log == nil {
		log = logging.Discard()
	}
	return &Reader{dir: dir, log: log}
}

// NewFromConfig resolves config.StorageDir() and builds a Reader over it.
//
// It is called per request rather than once at startup, which is what makes a
// changed TWITTER_BOOKMARKER_DIR take effect without a restart.
func NewFromConfig(log *logging.Logger) (*Reader, error) {
	dir, err := config.StorageDir()
	if err != nil {
		return nil, fmt.Errorf("gallery: resolve storage directory: %w", err)
	}
	return New(dir, log), nil
}

// Dir returns the storage directory the Reader was constructed with.
func (r *Reader) Dir() string { return r.dir }

// parsedRow is one valid bookmark row plus the parsed timestamps used for
// filtering, sorting and summary computation.
type parsedRow struct {
	post      Post
	tweetTime time.Time
	savedTime time.Time
}

// open returns a short-lived read-only handle on the database.
//
// A read-only handle never creates the file, so a missing database is reported
// as db.ErrNoDatabase rather than silently materialising an empty gallery.
func (r *Reader) open() (*sql.DB, error) {
	if r.dir == "" {
		return nil, fmt.Errorf("%w: no storage directory", db.ErrNoDatabase)
	}
	conn, err := db.OpenRO(config.DBPath(r.dir))
	if err != nil {
		if errors.Is(err, db.ErrNoDatabase) {
			return nil, err
		}
		return nil, fmt.Errorf("gallery: open database: %w", err)
	}
	return conn, nil
}

// listCollections returns every collection slug in the database, ordered by slug
// (GAL-01).
//
// The database is authoritative, so this is a plain SELECT: there is no
// directory scan and nothing to exclude. A slug that does not satisfy
// storage.ValidateSlug can only arrive through a hand-edited row, so it is
// skipped with a warning rather than trusted.
func (r *Reader) listCollections(conn *sql.DB) ([]string, error) {
	rows, err := conn.Query(`SELECT slug FROM collections ORDER BY slug`)
	if err != nil {
		return nil, fmt.Errorf("gallery: list collections: %w", err)
	}
	defer rows.Close()

	slugs := make([]string, 0, 16)
	for rows.Next() {
		var slug string
		if err := rows.Scan(&slug); err != nil {
			return nil, fmt.Errorf("gallery: list collections: %w", err)
		}
		if err := storage.ValidateSlug(slug); err != nil {
			r.warn("gallery: skipping collection with an unusable slug", "slug", slug)
			continue
		}
		slugs = append(slugs, slug)
	}
	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("gallery: list collections: %w", err)
	}
	return slugs, nil
}

// collectionName returns the stored display name for one slug.
func (r *Reader) collectionName(conn *sql.DB, slug string) (string, error) {
	var name string
	err := conn.QueryRow(`SELECT name FROM collections WHERE slug = ?`, slug).Scan(&name)
	if errors.Is(err, sql.ErrNoRows) {
		return "", fmt.Errorf("%w: %s", ErrCollectionNotFound, slug)
	}
	if err != nil {
		return "", fmt.Errorf("gallery: look up collection %s: %w", slug, err)
	}
	return name, nil
}

// bookmarkRow is one raw row as stored. Every value is read as TEXT and
// re-validated below, so a hand-edited row cannot produce an unrenderable post.
type bookmarkRow struct {
	tweetID   string
	url       string
	media     string
	author    string
	username  string
	tweetDate string
	savedAt   string
	text      string
}

// readRows loads one collection's bookmarks and parses them into valid rows.
//
// An invalid slug returns a *storage.ValidationError (mapped to 400 by the
// transport layer) and an unknown collection wraps ErrCollectionNotFound (404).
// A malformed row is skipped with a warning and never aborts the rest of the
// collection (GAL-07), so a row edited by hand cannot take a whole collection
// offline.
func (r *Reader) readRows(conn *sql.DB, slug string) ([]parsedRow, error) {
	if err := storage.ValidateSlug(slug); err != nil {
		return nil, err
	}
	if _, err := r.collectionName(conn, slug); err != nil {
		return nil, err
	}

	rows, err := conn.Query(
		`SELECT b.tweet_id, b.url, b.media, b.author, b.username, b.tweet_date, b.saved_at, b.text
		   FROM bookmarks b
		   JOIN collections c ON c.id = b.collection_id
		  WHERE c.slug = ?
		  ORDER BY b.saved_at, b.tweet_id`,
		slug,
	)
	if err != nil {
		return nil, fmt.Errorf("gallery: read collection %s: %w", slug, err)
	}
	defer rows.Close()

	parsed := make([]parsedRow, 0, 32)
	for rows.Next() {
		var raw bookmarkRow
		if err := rows.Scan(&raw.tweetID, &raw.url, &raw.media, &raw.author,
			&raw.username, &raw.tweetDate, &raw.savedAt, &raw.text); err != nil {
			return nil, fmt.Errorf("gallery: read collection %s: %w", slug, err)
		}
		row, reason := r.parseRow(slug, raw)
		if reason != "" {
			r.warn("gallery: skipping malformed bookmark",
				"slug", slug, "tweet_id", raw.tweetID, "reason", reason)
			continue
		}
		parsed = append(parsed, row)
	}
	if err := rows.Err(); err != nil {
		return nil, fmt.Errorf("gallery: read collection %s: %w", slug, err)
	}
	return parsed, nil
}

// parseRow validates one stored bookmark and builds a Post. It returns a
// non-empty reason when the row must be skipped.
func (r *Reader) parseRow(slug string, raw bookmarkRow) (parsedRow, string) {
	author := strings.TrimSpace(raw.author)
	username := strings.TrimSpace(raw.username)
	tweetDate := strings.TrimSpace(raw.tweetDate)
	savedAt := strings.TrimSpace(raw.savedAt)

	switch {
	case author == "":
		return parsedRow{}, "missing author"
	case username == "":
		return parsedRow{}, "missing username"
	case tweetDate == "":
		return parsedRow{}, "missing tweet_date"
	case savedAt == "":
		return parsedRow{}, "missing saved_at"
	}

	tweetTime, err := time.Parse(time.RFC3339, tweetDate)
	if err != nil {
		return parsedRow{}, "tweet_date is not RFC3339"
	}
	savedTime, err := time.Parse(time.RFC3339, savedAt)
	if err != nil {
		return parsedRow{}, "saved_at is not RFC3339"
	}

	// The Tweet Status ID is derived from the URL, not read from the tweet_id
	// column: it has always been derived data (GAL-08), and deriving it here
	// keeps the id and the URL it is served with consistent even if a row was
	// edited by hand.
	canonicalURL, tweetID, err := storage.NormalizeURL(strings.TrimSpace(raw.url))
	if err != nil {
		return parsedRow{}, "url is not a canonical tweet URL"
	}

	post := Post{
		TweetID:   tweetID,
		URL:       canonicalURL,
		Media:     r.parseMedia(slug, raw.tweetID, raw.media),
		Author:    author,
		Username:  username,
		TweetDate: tweetTime.UTC().Format(time.RFC3339),
		SavedAt:   savedTime.UTC().Format(time.RFC3339),
		Text:      raw.text,
	}
	return parsedRow{post: post, tweetTime: tweetTime, savedTime: savedTime}, ""
}

// parseMedia decodes the JSON `media` column. An empty value, `null` and invalid
// JSON all yield an empty non-nil slice; only invalid JSON logs a warning, and
// the post is still returned as a text card (GAL-06).
func (r *Reader) parseMedia(slug, tweetID, raw string) []string {
	cell := strings.TrimSpace(raw)
	if cell == "" {
		return []string{}
	}
	var media []string
	if err := json.Unmarshal([]byte(cell), &media); err != nil {
		r.warn("gallery: malformed media json; treating the row as media-less",
			"slug", slug, "tweet_id", tweetID)
		return []string{}
	}
	if media == nil {
		return []string{}
	}
	return media
}

// warn emits a read-layer warning through the shared structured logger. Only
// identifiers and metadata are logged, never tweet text.
func (r *Reader) warn(msg string, args ...any) {
	r.log.Slog().Warn(msg, args...)
}

// Collections returns one summary per collection, ordered by last_saved_at DESC
// with timestamp-less collections last (GAL-01…GAL-04). A single unreadable
// collection is skipped with a warning rather than failing every other one.
//
// A storage directory with no database yet is an empty gallery, not an error:
// that is the fresh-install state.
func (r *Reader) Collections() ([]Collection, error) {
	conn, err := r.open()
	if err != nil {
		if errors.Is(err, db.ErrNoDatabase) {
			return nil, nil
		}
		return nil, err
	}
	defer conn.Close()

	slugs, err := r.listCollections(conn)
	if err != nil {
		return nil, err
	}

	summaries := make([]collectionSummary, 0, len(slugs))
	for _, slug := range slugs {
		name, err := r.collectionName(conn, slug)
		if err != nil {
			r.warn("gallery: skipping unreadable collection", "slug", slug, "error", err)
			continue
		}
		rows, err := r.readRows(conn, slug)
		if err != nil {
			r.warn("gallery: skipping unreadable collection", "slug", slug, "error", err)
			continue
		}
		summaries = append(summaries, summarize(slug, name, rows))
	}
	sortSummaries(summaries)

	collections := make([]Collection, 0, len(summaries))
	for _, summary := range summaries {
		collections = append(collections, summary.collection)
	}
	return collections, nil
}
