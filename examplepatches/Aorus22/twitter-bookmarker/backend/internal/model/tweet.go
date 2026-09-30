// Package model holds the domain types shared by the persistence layer and
// the HTTP API. JSON tags are the wire contract with the extension and the web
// app.
package model

// TweetInput is the raw tweet metadata accepted from the extension.
// Text is the only field that may be empty (media-only tweets). Media is
// optional: an older extension omits it and the row is stored as `[]`.
type TweetInput struct {
	URL       string   `json:"url"`
	Media     []string `json:"media"`
	Author    string   `json:"author"`
	Username  string   `json:"username"`
	TweetDate string   `json:"tweet_date"`
	Text      string   `json:"text"`
}

// IndexEntry is one saved-bookmark record, keyed by Tweet Status ID.
type IndexEntry struct {
	URL     string `json:"url"`
	Slug    string `json:"slug"`
	SavedAt string `json:"saved_at"`
}

// SaveRequest is the POST /v1/bookmarks request body.
//
// Slug identifies the target collection. Name is the human category name the
// extension knows; it is optional, and a missing or empty value falls back to a
// name derived from the slug, so an older extension that sends only a slug still
// produces a readable collection.
type SaveRequest struct {
	Slug  string     `json:"slug"`
	Name  string     `json:"name"`
	Tweet TweetInput `json:"tweet"`
}

// SaveResponse is the 201 response body.
type SaveResponse struct {
	Status  string `json:"status"`
	TweetID string `json:"tweet_id"`
	URL     string `json:"url"`
	Slug    string `json:"slug"`
	SavedAt string `json:"saved_at"`
}

// DuplicateResponse is the 409 response body.
//
// Slug names the collection the tweet is already saved in, so a client can say
// where it lives instead of offering a save that cannot succeed. It is additive:
// a client that ignores it still gets the same status and tweet_id as before.
type DuplicateResponse struct {
	Status  string `json:"status"`
	TweetID string `json:"tweet_id"`
	Slug    string `json:"slug"`
}

// IndexResponse is the GET /v1/index response body.
type IndexResponse struct {
	Items map[string]IndexEntry `json:"items"`
}

// DeleteResponse is the 200 response body for DELETE /v1/bookmarks/{tweet_id}.
//
// The deletion is recoverable, and the body says so rather than leaving the
// caller to remember: `recoverable` is the contract that the row moved to the
// trash instead of being destroyed.
type DeleteResponse struct {
	Status      string `json:"status"`
	TweetID     string `json:"tweet_id"`
	Recoverable bool   `json:"recoverable"`
}

// ReassignRequest is the PUT /v1/bookmarks/{tweet_id}/collection body.
//
// Only the destination is accepted. A caller cannot rename the folder or create
// one by moving into it: the extension owns folder names, and an unknown slug is
// answered with 404 rather than turned into a new collection.
type ReassignRequest struct {
	Slug string `json:"slug"`
}

// ReassignResponse is the 200 response body for a successful move.
type ReassignResponse struct {
	Status  string `json:"status"`
	TweetID string `json:"tweet_id"`
	Slug    string `json:"slug"`
}

// HealthResponse is the GET /health response body.
type HealthResponse struct {
	Status string `json:"status"`
}

// ErrorResponse is the shape used for 400/500 responses. The exact error body
// shape is an implementation detail; only the status codes are contractual.
type ErrorResponse struct {
	Status string `json:"status"`
	Reason string `json:"reason"`
}
