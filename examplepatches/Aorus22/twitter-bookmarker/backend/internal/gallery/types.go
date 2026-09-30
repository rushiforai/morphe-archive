// Package gallery implements the read-only projection of the bookmark database:
// collection discovery, collection summaries, row parsing, search, two
// independent date filters, four sort modes and opaque cursor pagination.
//
// The package is deliberately transport-free. It exports no HTTP handlers,
// registers no routes and knows nothing about the server; internal/api is
// expected to call Reader.Collections and Reader.Posts and to map the exported
// error types onto status codes.
//
// Every call opens a fresh read-only handle on tw-bookmarker.db and holds no
// state between calls, so a bookmark saved while the server runs is visible on
// the next request (PRD-2 §48, §80.22).
package gallery

import (
	"errors"
	"time"
)

// Collection is the summary of one collection. It maps to a homepage card
// (PRD-2 §74).
type Collection struct {
	// Slug is the collection's public key: what the extension sends with a save
	// and what the gallery URL carries. It is not a filename.
	Slug string `json:"slug"`
	// Name is the display name the extension supplied, falling back to a name
	// derived from the slug for a collection that was never saved to by a
	// version of the extension that sends one.
	Name       string `json:"name"`
	PostCount  int    `json:"post_count"`
	MediaCount int    `json:"media_count"`
	// LastSavedAt is the maximum saved_at in the collection as UTC RFC3339, or
	// nil when it has no valid rows. JSON is null in that case.
	LastSavedAt *string `json:"last_saved_at"`
	// CoverMedia holds up to four media URLs taken from the newest-by-saved_at
	// rows, newest first. It is never nil, so it always encodes as [].
	CoverMedia []string `json:"cover_media"`
}

// Post is one bookmark row, ready to render as a gallery card (PRD-2 §75).
type Post struct {
	TweetID   string   `json:"tweet_id"`
	URL       string   `json:"url"`
	Media     []string `json:"media"`
	Author    string   `json:"author"`
	Username  string   `json:"username"`
	TweetDate string   `json:"tweet_date"`
	SavedAt   string   `json:"saved_at"`
	Text      string   `json:"text"`
}

// SortMode is the validated `sort` query value (PRD-2 §33).
type SortMode string

const (
	SortSavedDesc SortMode = "saved_desc"
	SortSavedAsc  SortMode = "saved_asc"
	SortTweetDesc SortMode = "tweet_desc"
	SortTweetAsc  SortMode = "tweet_asc"
)

const (
	// DefaultLimit is the page size when the caller supplies no limit.
	DefaultLimit = 30
	// MaxLimit is the largest page size the gallery will serve (PRD-2 §34).
	MaxLimit = 100
	// CoverMediaLimit is how many media URLs a collection cover shows.
	CoverMediaLimit = 4
)

// Query is a gallery posts query with typed, already-parsed values. HTTP
// callers should build a RawQuery and call Parse (which owns the rule that an
// explicit `limit=0` is invalid while an absent limit defaults to 30);
// programmatic callers may build a Query directly and let Posts normalize it,
// where Limit == 0 means "use DefaultLimit".
type Query struct {
	Q         string
	TweetFrom *time.Time
	TweetTo   *time.Time
	SavedFrom *time.Time
	SavedTo   *time.Time
	Sort      SortMode
	Cursor    string
	Limit     int
}

// RawQuery mirrors the HTTP query parameters as the strings they arrive as.
// An empty string means "not supplied".
type RawQuery struct {
	Q         string
	TweetFrom string
	TweetTo   string
	SavedFrom string
	SavedTo   string
	Sort      string
	Cursor    string
	Limit     string
}

// Page is one page of gallery posts plus its pagination state.
//
// It intentionally carries no JSON tags: its wire shape is the phase 2
// envelope `{"items":[...],"next_cursor":null|string,"has_more":bool}`, where
// an exhausted page reports a null cursor — something the transport layer
// decides, not the read layer.
type Page struct {
	Items      []Post
	NextCursor string
	HasMore    bool
}

// ErrCollectionNotFound is returned (wrapped) when a syntactically valid slug
// does not resolve to a collection, so the HTTP layer can answer 404 rather
// than 500 (PRD-2 §54).
var ErrCollectionNotFound = errors.New("gallery: collection not found")
