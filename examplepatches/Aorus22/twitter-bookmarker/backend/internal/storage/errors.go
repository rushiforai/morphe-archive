package storage

import "errors"

// ValidationError marks a request problem that the API must map to HTTP 400.
type ValidationError struct {
	Reason string
}

func (e *ValidationError) Error() string { return e.Reason }

// DuplicateError marks a globally duplicate Tweet Status ID (HTTP 409).
//
// Slug is the collection the tweet is already saved in, so the caller can offer
// to move it there instead of having to guess or ask again.
type DuplicateError struct {
	TweetID string
	Slug    string
}

func (e *DuplicateError) Error() string {
	return "tweet " + e.TweetID + " is already saved"
}

// Unwrap makes errors.Is(err, ErrDuplicate) work.
func (e *DuplicateError) Unwrap() error { return ErrDuplicate }

// ErrDuplicate is the sentinel duplicate error.
var ErrDuplicate = errors.New("duplicate tweet")

// NotFoundError marks a Tweet Status ID that is not in the live set (HTTP 404).
//
// A tweet that was deleted lives in `deleted_bookmarks`, not in `bookmarks`, so
// deleting or moving it twice is a not-found rather than a silent success: the
// caller asked for a change that did not happen.
type NotFoundError struct {
	TweetID string
}

func (e *NotFoundError) Error() string {
	return "tweet " + e.TweetID + " is not saved"
}

// Unwrap makes errors.Is(err, ErrNotFound) work.
func (e *NotFoundError) Unwrap() error { return ErrNotFound }

// ErrNotFound is the sentinel not-found error.
var ErrNotFound = errors.New("tweet not found")

// CollectionNotFoundError marks a move into a collection that does not exist
// (HTTP 404).
//
// The web layer never creates collections: the extension owns the user's folder
// names, so a slug the database does not know is a stale picker, not an
// instruction to invent a folder called after a slug.
type CollectionNotFoundError struct {
	Slug string
}

func (e *CollectionNotFoundError) Error() string {
	return "collection " + e.Slug + " does not exist"
}

// Unwrap makes errors.Is(err, ErrCollectionNotFound) work.
func (e *CollectionNotFoundError) Unwrap() error { return ErrCollectionNotFound }

// ErrCollectionNotFound is the sentinel collection-not-found error.
var ErrCollectionNotFound = errors.New("collection not found")
