// Package logging wraps log/slog with the small set of events the backend
// emits. Helpers deliberately accept only identifiers/metadata: tweet text is
// never logged.
package logging

import (
	"io"
	"log/slog"
)

// Logger is a thin, readable wrapper around a slog.Logger.
type Logger struct {
	l *slog.Logger
}

// New builds a text logger writing to w.
func New(w io.Writer) *Logger {
	return &Logger{
		l: slog.New(slog.NewTextHandler(w, &slog.HandlerOptions{Level: slog.LevelInfo})),
	}
}

// Discard returns a logger that drops everything (used by tests and as a
// nil-safety fallback).
func Discard() *Logger {
	return New(io.Discard)
}

// Slog exposes the underlying logger for packages that need it directly.
func (lg *Logger) Slog() *slog.Logger {
	if lg == nil || lg.l == nil {
		return slog.New(slog.NewTextHandler(io.Discard, nil))
	}
	return lg.l
}

// Startup reports the server name, listen address, storage dir and how much the
// database holds.
func (lg *Logger) Startup(name, addr, storageDir string, collections, bookmarks int) {
	lg.Slog().Info("Twitter Bookmarker server started",
		"server", name,
		"listening", addr,
		"storage", storageDir,
		"collections", collections,
		"bookmarks", bookmarks,
	)
}

// TokenRequired reports that every request from another host must present a
// bearer token. It is emitted once at startup, and only when that is actually
// true: a token configured on a loopback bind guards nothing, so silence is the
// honest report there. The token itself is never logged.
func (lg *Logger) TokenRequired(env string) {
	lg.Slog().Info("the API requires a bearer token from other hosts", "env", env)
}

// BasicAuthRequired reports that requests arriving through a proxy must present
// the browser's basic credentials, or the bearer token. Neither the user name nor
// the password is logged: the message names the variable to change instead.
func (lg *Logger) BasicAuthRequired(env string) {
	lg.Slog().Info("proxied requests require the browser password", "env", env)
}

// WebAssets reports the directory the built single-page app is served from
// (PRD-2 §11).
func (lg *Logger) WebAssets(dir string) {
	lg.Slog().Info("serving built web app", "web_dist", dir)
}

// WebAssetsMissing reports that web/dist is absent. The server keeps serving
// the API; the message names the expected directory and how to build it
// (PROD-05). It is emitted once, at construction, not per request.
func (lg *Logger) WebAssetsMissing(dir string) {
	lg.Slog().Warn("built web app not found; the API is still available",
		"web_dist", dir,
		"hint", "run `make web` (or `cd web && pnpm build`), or set TWITTER_BOOKMARKER_WEB_DIR",
	)
}

// SaveSuccess reports a persisted bookmark by id + collection slug only.
func (lg *Logger) SaveSuccess(tweetID, slug string) {
	lg.Slog().Info("bookmark saved",
		"tweet_id", tweetID,
		"slug", slug,
	)
}

// DeleteSuccess reports a bookmark moved into the trash. The move is the whole
// event: nothing was destroyed, so the log says where it went.
func (lg *Logger) DeleteSuccess(tweetID string) {
	lg.Slog().Info("bookmark deleted",
		"tweet_id", tweetID,
		"recoverable", true,
	)
}

// MoveSuccess reports a bookmark reassigned to another collection.
func (lg *Logger) MoveSuccess(tweetID, slug string) {
	lg.Slog().Info("bookmark moved",
		"tweet_id", tweetID,
		"slug", slug,
	)
}

// Duplicate reports a rejected duplicate save.
func (lg *Logger) Duplicate(tweetID string) {
	lg.Slog().Info("duplicate bookmark rejected", "tweet_id", tweetID)
}

// InvalidRequest reports a payload/validation failure.
func (lg *Logger) InvalidRequest(reason string) {
	lg.Slog().Warn("invalid request", "reason", reason)
}

// FilesystemError reports a storage failure.
func (lg *Logger) FilesystemError(op string, err error) {
	lg.Slog().Error("filesystem error", "op", op, "error", err)
}

// Shutdown reports that a termination signal was received.
func (lg *Logger) Shutdown() {
	lg.Slog().Info("shutdown signal received; draining requests")
}
