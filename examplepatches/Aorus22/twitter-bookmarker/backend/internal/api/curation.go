package api

import (
	"errors"
	"net/http"

	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

// Curation lives here rather than in gallery.go on purpose.
//
// The gallery API is read-only (API-07, PRD-2 §36): every one of its routes is
// GET, and a non-GET method is answered with 405. Deleting and moving are
// mutations a *user* asks for, so they belong on the bookmark resource under
// /v1/, next to the save that created the bookmark. That keeps the gallery's
// guarantee intact instead of carving an exception into it, and it means the
// "a read path can never be turned into a write path" property survives the
// feature.
//
// Neither handler trusts its path segment: the id is validated before it can
// reach a query, and the destination slug is validated again inside the store.

// writeCurationError maps a storage error onto the wire.
//
// It returns true when it wrote a response, so callers read as
// `if s.writeCurationError(w, err, "delete bookmark") { return }`.
//
// The 404 cases are deliberately distinct in the log but not on the wire: a
// caller that asks to delete a tweet nobody saved and a caller that asks to move
// it into a folder that does not exist both get "not found", because in both
// cases the requested change did not happen.
func (s *server) writeCurationError(w http.ResponseWriter, err error, op string) bool {
	var missing *storage.NotFoundError
	var noCollection *storage.CollectionNotFoundError
	var invalid *storage.ValidationError

	switch {
	case errors.As(err, &missing):
		writeJSON(w, http.StatusNotFound, model.ErrorResponse{
			Status: "error",
			Reason: "tweet is not saved",
		})
	case errors.As(err, &noCollection):
		writeJSON(w, http.StatusNotFound, model.ErrorResponse{
			Status: "error",
			Reason: "collection does not exist",
		})
	case errors.As(err, &invalid):
		s.log.InvalidRequest(invalid.Reason)
		writeJSON(w, http.StatusBadRequest, model.ErrorResponse{
			Status: "error",
			Reason: invalid.Reason,
		})
	default:
		s.log.FilesystemError(op, err)
		writeJSON(w, http.StatusInternalServerError, model.ErrorResponse{
			Status: "error",
			Reason: "internal error",
		})
	}
	return true
}

// writeValidationReason answers a path-parameter failure.
func (s *server) writeValidationReason(w http.ResponseWriter, err error) {
	s.log.InvalidRequest(err.Error())
	writeJSON(w, http.StatusBadRequest, model.ErrorResponse{
		Status: "error",
		Reason: err.Error(),
	})
}

// writeNoStore answers a request that arrived before a store existed.
func writeNoStore(w http.ResponseWriter) {
	writeJSON(w, http.StatusInternalServerError, model.ErrorResponse{
		Status: "error",
		Reason: "internal error",
	})
}

// handleDeleteBookmark answers DELETE /v1/bookmarks/{tweet_id} with 200.
//
// A body rather than 204, for two reasons: the web client parses every
// successful response as JSON, and the body can state the one thing that makes
// offering a delete safe at all — that the row moved to the trash and is still
// recoverable.
func (s *server) handleDeleteBookmark(w http.ResponseWriter, r *http.Request) {
	if s.store == nil {
		writeNoStore(w)
		return
	}

	tweetID := r.PathValue("tweet_id")
	if err := storage.ValidateTweetID(tweetID); err != nil {
		s.writeValidationReason(w, err)
		return
	}

	if err := s.store.Delete(tweetID); err != nil {
		s.writeCurationError(w, err, "delete bookmark")
		return
	}

	writeJSON(w, http.StatusOK, model.DeleteResponse{
		Status:      "deleted",
		TweetID:     tweetID,
		Recoverable: true,
	})
}

// handleReassignBookmark answers PUT /v1/bookmarks/{tweet_id}/collection with 200.
//
// PUT on a sub-resource rather than PATCH on the bookmark: the request sets one
// thing — which collection owns the bookmark — and doing it on its own path
// keeps `methodGate` a single-method gate and the intent unambiguous.
func (s *server) handleReassignBookmark(w http.ResponseWriter, r *http.Request) {
	if s.store == nil {
		writeNoStore(w)
		return
	}

	tweetID := r.PathValue("tweet_id")
	if err := storage.ValidateTweetID(tweetID); err != nil {
		s.writeValidationReason(w, err)
		return
	}

	var req model.ReassignRequest
	if reason, logReason := decodeJSONBody(w, r, &req); reason != "" {
		s.log.InvalidRequest(logReason)
		writeJSON(w, http.StatusBadRequest, model.ErrorResponse{
			Status: "error",
			Reason: reason,
		})
		return
	}

	if err := s.store.Reassign(tweetID, req.Slug); err != nil {
		s.writeCurationError(w, err, "move bookmark")
		return
	}

	writeJSON(w, http.StatusOK, model.ReassignResponse{
		Status:  "moved",
		TweetID: tweetID,
		Slug:    req.Slug,
	})
}
