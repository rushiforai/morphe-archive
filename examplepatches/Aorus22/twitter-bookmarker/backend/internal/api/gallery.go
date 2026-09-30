package api

import (
	"errors"
	"net/http"

	"twitter-bookmarker/internal/gallery"
	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

// galleryCollectionsResponse is the GET /api/gallery/collections body
// (PRD-2 §37). The read layer already emits the PRD-2 §74 JSON tags.
type galleryCollectionsResponse struct {
	Collections []gallery.Collection `json:"collections"`
}

// galleryPostsResponse is the GET /api/gallery/collections/{slug}/posts body
// (PRD-2 §41). NextCursor is a pointer so an exhausted page serialises as JSON
// null rather than an empty string.
type galleryPostsResponse struct {
	Items      []gallery.Post `json:"items"`
	NextCursor *string        `json:"next_cursor"`
	HasMore    bool           `json:"has_more"`
}

// handleGalleryCollections serves the homepage collection list.
//
// The reader is rebuilt for every request (the constructor does no I/O), so a
// changed TWITTER_BOOKMARKER_DIR and bookmarks saved while the server runs are
// both visible without a restart (PRD-2 §39, §80.22).
func (s *server) handleGalleryCollections(w http.ResponseWriter, _ *http.Request) {
	reader, err := gallery.NewFromConfig(s.log)
	if err != nil {
		s.writeGalleryInternalError(w, "gallery collections", err)
		return
	}

	collections, err := reader.Collections()
	if err != nil {
		s.writeGalleryInternalError(w, "gallery collections", err)
		return
	}
	if collections == nil {
		collections = []gallery.Collection{}
	}
	// Defence in depth: the read layer already guarantees a non-nil cover
	// slice, but a null here would break the documented `[]` contract.
	for i := range collections {
		if collections[i].CoverMedia == nil {
			collections[i].CoverMedia = []string{}
		}
	}

	writeJSON(w, http.StatusOK, galleryCollectionsResponse{Collections: collections})
}

// handleGalleryPosts serves one page of a single collection.
func (s *server) handleGalleryPosts(w http.ResponseWriter, r *http.Request) {
	reader, err := gallery.NewFromConfig(s.log)
	if err != nil {
		s.writeGalleryInternalError(w, "gallery posts", err)
		return
	}

	// The path segment is handed to the read layer exactly as the mux unescaped
	// it. Nothing here decodes, cleans or expands it, so `../` (arriving as
	// %2e%2e%2f) and any other non-slug value reaches storage.ValidateSlug and
	// fails as 400.
	slug := r.PathValue("slug")

	values := r.URL.Query()
	query, err := gallery.RawQuery{
		Q:         values.Get("q"),
		TweetFrom: values.Get("tweet_from"),
		TweetTo:   values.Get("tweet_to"),
		SavedFrom: values.Get("saved_from"),
		SavedTo:   values.Get("saved_to"),
		Sort:      values.Get("sort"),
		Cursor:    values.Get("cursor"),
		Limit:     values.Get("limit"),
	}.Parse()
	if err != nil {
		s.writeGalleryQueryError(w, err)
		return
	}

	page, err := reader.Posts(slug, query)
	if err != nil {
		// A malformed cursor, an unsafe slug and an unknown collection all
		// surface here; only the parse step would miss the cursor.
		s.writeGalleryPostsError(w, err)
		return
	}

	resp := galleryPostsResponse{Items: page.Items, HasMore: page.HasMore}
	if resp.Items == nil {
		resp.Items = []gallery.Post{}
	}
	for i := range resp.Items {
		if resp.Items[i].Media == nil {
			resp.Items[i].Media = []string{}
		}
	}
	if page.NextCursor != "" {
		cursor := page.NextCursor
		resp.NextCursor = &cursor
	}

	writeJSON(w, http.StatusOK, resp)
}

// writeGalleryQueryError maps a RawQuery.Parse failure. Every documented
// failure is a *storage.ValidationError (400); anything else is treated as an
// internal error rather than guessed at.
func (s *server) writeGalleryQueryError(w http.ResponseWriter, err error) {
	var invalid *storage.ValidationError
	if errors.As(err, &invalid) {
		s.log.InvalidRequest(invalid.Reason)
		writeJSON(w, http.StatusBadRequest, model.ErrorResponse{
			Status: "error",
			Reason: invalid.Reason,
		})
		return
	}
	s.writeGalleryInternalError(w, "gallery query", err)
}

// writeGalleryPostsError maps a Reader.Posts failure: invalid input (including
// a malformed cursor) is 400, a missing collection is 404, everything else 500.
func (s *server) writeGalleryPostsError(w http.ResponseWriter, err error) {
	var invalid *storage.ValidationError
	switch {
	case errors.As(err, &invalid):
		s.log.InvalidRequest(invalid.Reason)
		writeJSON(w, http.StatusBadRequest, model.ErrorResponse{
			Status: "error",
			Reason: invalid.Reason,
		})
	case errors.Is(err, gallery.ErrCollectionNotFound):
		// The reason is fixed and never echoes the slug or the directory.
		s.log.InvalidRequest("gallery collection not found")
		writeJSON(w, http.StatusNotFound, model.ErrorResponse{
			Status: "error",
			Reason: "collection not found",
		})
	default:
		s.writeGalleryInternalError(w, "gallery posts", err)
	}
}

// writeGalleryInternalError answers a gallery failure without echoing the
// underlying error: wrapped os errors embed the absolute storage path, which
// PRD-2 §54 forbids exposing to the browser. The real error goes to the server
// log only.
func (s *server) writeGalleryInternalError(w http.ResponseWriter, op string, err error) {
	s.log.FilesystemError(op, err)
	writeJSON(w, http.StatusInternalServerError, model.ErrorResponse{
		Status: "error",
		Reason: "internal error",
	})
}
