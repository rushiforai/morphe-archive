package api_test

import (
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"strings"
	"testing"

	"twitter-bookmarker/internal/api"
	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
)

// saveBody builds a valid POST /v1/bookmarks payload for a tweet id.
func saveBody(slug, tweetID string) string {
	return fmt.Sprintf(
		`{"slug":%q,"name":%q,"tweet":{"url":"https://x.com/foo/status/%s","author":"Foo Bar","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"text %s"}}`,
		slug, strings.ToUpper(slug[:1])+slug[1:], tweetID, tweetID,
	)
}

// mustSave saves a tweet through the API and fails the test if it was not a 201.
func mustSave(t *testing.T, h http.Handler, slug, tweetID string) {
	t.Helper()
	rec := do(h, http.MethodPost, "/v1/bookmarks", saveBody(slug, tweetID))
	if rec.Code != http.StatusCreated {
		t.Fatalf("save %s: status = %d, want 201 (body %s)", tweetID, rec.Code, rec.Body.String())
	}
}

// indexHas reports whether GET /v1/index currently claims the tweet is saved.
func indexHas(t *testing.T, h http.Handler, tweetID string) bool {
	t.Helper()
	rec := do(h, http.MethodGet, "/v1/index", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("index status = %d, want 200", rec.Code)
	}
	var body model.IndexResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode index: %v", err)
	}
	_, ok := body.Items[tweetID]
	return ok
}

// collectionHas reports whether the gallery lists the tweet in slug.
func collectionHas(t *testing.T, h http.Handler, slug, tweetID string) bool {
	t.Helper()
	rec := do(h, http.MethodGet, "/api/gallery/collections/"+slug+"/posts", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("gallery %s status = %d, want 200 (body %s)", slug, rec.Code, rec.Body.String())
	}
	var body galleryPostsDTO
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode gallery posts: %v", err)
	}
	for _, item := range body.Items {
		if item.TweetID == tweetID {
			return true
		}
	}
	return false
}

// apiOpenRW opens the same database the running server wrote, so a test can count
// rows or run the documented recovery statement.
func apiOpenRW(t *testing.T, dir string) *sql.DB {
	t.Helper()
	conn, err := db.OpenRW(config.DBPath(dir))
	if err != nil {
		t.Fatalf("open database read-write: %v", err)
	}
	t.Cleanup(func() { _ = conn.Close() })
	return conn
}

// --- delete ---------------------------------------------------------------

// TestDeleteBookmarkIsVisibleEverywhereItMatters walks the whole promise: a saved
// tweet is in the index and the gallery, deleting it takes it out of both, and the
// row survives in the trash.
//
// The index matters as much as the gallery: if a deleted tweet stayed in
// /v1/index the extension would keep showing "✓ Saved" and refuse to save it
// again, which is precisely the trap a soft delete has to avoid.
func TestDeleteBookmarkIsVisibleEverywhereItMatters(t *testing.T) {
	h, dir := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")

	if !indexHas(t, h, "111") {
		t.Fatal("the saved tweet is missing from /v1/index before the delete")
	}
	if !collectionHas(t, h, "linux", "111") {
		t.Fatal("the saved tweet is missing from the gallery before the delete")
	}

	rec := do(h, http.MethodDelete, "/v1/bookmarks/111", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("delete status = %d, want 200 (body %s)", rec.Code, rec.Body.String())
	}
	var body model.DeleteResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode delete body: %v", err)
	}
	if body.Status != "deleted" || body.TweetID != "111" || !body.Recoverable {
		t.Errorf("delete body = %+v, want status=deleted tweet_id=111 recoverable=true", body)
	}

	if indexHas(t, h, "111") {
		t.Error("the deleted tweet is still in /v1/index; the extension would call it saved")
	}
	if collectionHas(t, h, "linux", "111") {
		t.Error("the deleted tweet is still in the gallery")
	}

	// The row moved rather than vanished: that is what makes the delete
	// recoverable, and it is the whole reason the feature is safe to offer.
	if got := dbtest.Count(t, apiOpenRW(t, dir), `SELECT count(*) FROM deleted_bookmarks WHERE tweet_id = '111'`); got != 1 {
		t.Errorf("rows for the deleted tweet in the trash = %d, want 1", got)
	}
}

// TestDeleteBookmarkIsRecoverable proves the documented recovery recipe actually
// works against a real database. The README tells the user to restore a row by
// hand, so the statement is part of the contract and is tested as such.
func TestDeleteBookmarkIsRecoverable(t *testing.T) {
	h, dir := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")

	if rec := do(h, http.MethodDelete, "/v1/bookmarks/111", ""); rec.Code != http.StatusOK {
		t.Fatalf("delete status = %d, want 200", rec.Code)
	}
	if indexHas(t, h, "111") {
		t.Fatal("the tweet should be gone before we try to restore it")
	}

	// The exact statement the README documents. Kept verbatim on purpose: a test
	// that rewords it would stop proving that the printed recipe works.
	dbtest.MustExec(t, apiOpenRW(t, dir), `
		INSERT INTO bookmarks (tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		SELECT tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media
		  FROM deleted_bookmarks
		 WHERE tweet_id = '111'
		 ORDER BY deleted_at DESC
		 LIMIT 1`)

	if !indexHas(t, h, "111") {
		t.Error("the restored tweet is not in /v1/index")
	}
	if !collectionHas(t, h, "linux", "111") {
		t.Error("the restored tweet is not back in its collection")
	}
}

// TestDeleteUnknownBookmarkIs404 proves a stale UI action reports failure instead
// of a success that would make the page drop a row it never removed.
func TestDeleteUnknownBookmarkIs404(t *testing.T) {
	h, _ := newGalleryServer(t, nil)

	rec := do(h, http.MethodDelete, "/v1/bookmarks/404404", "")
	if rec.Code != http.StatusNotFound {
		t.Fatalf("delete unknown status = %d, want 404 (body %s)", rec.Code, rec.Body.String())
	}
	var body model.ErrorResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode 404 body: %v", err)
	}
	if body.Status != "error" || body.Reason == "" {
		t.Errorf("404 body = %+v, want the error envelope", body)
	}
}

// TestDeleteInvalidTweetIDIs400 proves the path segment is validated before it can
// reach a query.
func TestDeleteInvalidTweetIDIs400(t *testing.T) {
	h, _ := newGalleryServer(t, nil)

	for _, id := range []string{"abc", "12a", "1.5", strings.Repeat("9", 33)} {
		rec := do(h, http.MethodDelete, "/v1/bookmarks/"+id, "")
		if rec.Code != http.StatusBadRequest {
			t.Errorf("delete %q status = %d, want 400 (body %s)", id, rec.Code, rec.Body.String())
		}
	}
}

// --- reassign -------------------------------------------------------------

// TestReassignBookmarkMovesItBetweenCollections proves the move is real: the tweet
// leaves one gallery listing and appears in the other, and the trash is untouched
// because nothing was deleted.
func TestReassignBookmarkMovesItBetweenCollections(t *testing.T) {
	h, dir := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")
	mustSave(t, h, "ai", "222")

	rec := do(h, http.MethodPut, "/v1/bookmarks/111/collection", `{"slug":"ai"}`)
	if rec.Code != http.StatusOK {
		t.Fatalf("move status = %d, want 200 (body %s)", rec.Code, rec.Body.String())
	}
	var body model.ReassignResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode move body: %v", err)
	}
	if body.Status != "moved" || body.TweetID != "111" || body.Slug != "ai" {
		t.Errorf("move body = %+v, want status=moved tweet_id=111 slug=ai", body)
	}

	if collectionHas(t, h, "linux", "111") {
		t.Error("the moved tweet is still listed in its old collection")
	}
	if !collectionHas(t, h, "ai", "111") {
		t.Error("the moved tweet is not listed in its new collection")
	}
	// A move is not a delete: nothing may appear in the trash.
	if got := dbtest.Count(t, apiOpenRW(t, dir), `SELECT count(*) FROM deleted_bookmarks`); got != 0 {
		t.Errorf("trash rows after a move = %d, want 0", got)
	}
	// Both folders still exist.
	if got := dbtest.Count(t, apiOpenRW(t, dir), `SELECT count(*) FROM collections`); got != 2 {
		t.Errorf("collections = %d, want 2", got)
	}
}

// TestReassignToUnknownCollectionIs404 proves the web layer cannot conjure a
// folder: folder names belong to the extension, so an unknown slug is a stale
// picker rather than a request to invent a name from a slug.
func TestReassignToUnknownCollectionIs404(t *testing.T) {
	h, dir := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")

	rec := do(h, http.MethodPut, "/v1/bookmarks/111/collection", `{"slug":"nope"}`)
	if rec.Code != http.StatusNotFound {
		t.Fatalf("move to unknown collection status = %d, want 404 (body %s)", rec.Code, rec.Body.String())
	}

	// Nothing was created, and the bookmark did not move.
	if got := dbtest.Count(t, apiOpenRW(t, dir), `SELECT count(*) FROM collections`); got != 1 {
		t.Errorf("collections = %d, want the refused move to create nothing", got)
	}
	if !collectionHas(t, h, "linux", "111") {
		t.Error("the bookmark left its collection despite the refused move")
	}
}

// TestReassignUnknownBookmarkIs404 covers the other 404: the destination exists,
// the bookmark does not.
func TestReassignUnknownBookmarkIs404(t *testing.T) {
	h, _ := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")

	rec := do(h, http.MethodPut, "/v1/bookmarks/222/collection", `{"slug":"linux"}`)
	if rec.Code != http.StatusNotFound {
		t.Fatalf("move unknown bookmark status = %d, want 404 (body %s)", rec.Code, rec.Body.String())
	}
}

// TestReassignInvalidTweetIDIs400 covers the path parameter.
func TestReassignInvalidTweetIDIs400(t *testing.T) {
	h, _ := newGalleryServer(t, nil)

	rec := do(h, http.MethodPut, "/v1/bookmarks/abc/collection", `{"slug":"linux"}`)
	if rec.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want 400 (body %s)", rec.Code, rec.Body.String())
	}
}

// TestReassignRejectsBadBodies proves the body rules match handleSave: an invalid
// slug, an unknown field and trailing data are all 400, and an oversized body is
// refused rather than read.
func TestReassignRejectsBadBodies(t *testing.T) {
	h, _ := newGalleryServer(t, nil)
	mustSave(t, h, "linux", "111")

	cases := []struct {
		name string
		body string
	}{
		{"missing slug", `{}`},
		{"invalid slug", `{"slug":"../evil"}`},
		{"unknown field", `{"slug":"linux","extra":1}`},
		{"trailing data", `{"slug":"linux"}{"slug":"ai"}`},
		{"not json", `not json`},
		{"oversized", `{"slug":"` + strings.Repeat("a", 1<<21) + `"}`},
	}
	for _, tc := range cases {
		rec := do(h, http.MethodPut, "/v1/bookmarks/111/collection", tc.body)
		if rec.Code != http.StatusBadRequest {
			t.Errorf("%s: status = %d, want 400 (body %s)", tc.name, rec.Code, rec.Body.String())
		}
		var body model.ErrorResponse
		if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
			t.Errorf("%s: decode body %q: %v", tc.name, rec.Body.String(), err)
			continue
		}
		if body.Status != "error" || body.Reason == "" {
			t.Errorf("%s: body = %+v, want the error envelope", tc.name, body)
		}
	}
}

// --- method gating --------------------------------------------------------

// TestCurationRoutesAreMethodGated proves each curation pattern answers exactly
// one method and refuses the rest with 405 + Allow, rather than falling through to
// the SPA shell or to an API 404.
func TestCurationRoutesAreMethodGated(t *testing.T) {
	h, _ := newGalleryServer(t, nil)

	cases := []struct {
		method string
		path   string
		allow  string
	}{
		{http.MethodGet, "/v1/bookmarks/111", "DELETE"},
		{http.MethodPost, "/v1/bookmarks/111", "DELETE"},
		{http.MethodPut, "/v1/bookmarks/111", "DELETE"},
		{http.MethodGet, "/v1/bookmarks/111/collection", "PUT"},
		{http.MethodPost, "/v1/bookmarks/111/collection", "PUT"},
		{http.MethodDelete, "/v1/bookmarks/111/collection", "PUT"},
		{http.MethodPatch, "/v1/bookmarks/111/collection", "PUT"},
	}
	for _, tc := range cases {
		rec := do(h, tc.method, tc.path, `{"slug":"linux"}`)
		if rec.Code != http.StatusMethodNotAllowed {
			t.Errorf("%s %s status = %d, want 405 (body %s)", tc.method, tc.path, rec.Code, rec.Body.String())
			continue
		}
		if got := rec.Header().Get("Allow"); got != tc.allow {
			t.Errorf("%s %s Allow = %q, want %q", tc.method, tc.path, got, tc.allow)
		}
	}
}

// --- the gallery stays read-only -----------------------------------------

// TestGalleryHasNoHiddenMutationRoute is the regression guard for the amendment
// that added curation.
//
// Putting delete/move under /api/gallery would have been the obvious shortcut and
// would have broken API-07. This proves the gallery prefix gained nothing: a
// plausible mutation path under it is still an API 404, and the database is
// byte-identical afterwards.
func TestGalleryHasNoHiddenMutationRoute(t *testing.T) {
	h, dir := newGalleryServer(t, nil)
	seedLinux(t, dir)

	before := dbHash(t, dir)

	for _, tc := range []struct{ method, path string }{
		{http.MethodDelete, "/api/gallery/collections/linux/posts/1"},
		{http.MethodDelete, "/api/gallery/collections/linux"},
		{http.MethodPut, "/api/gallery/collections/linux/posts/1/collection"},
		{http.MethodPost, "/api/gallery/bookmarks/1"},
	} {
		rec := do(h, tc.method, tc.path, `{"slug":"ai"}`)
		if rec.Code != http.StatusNotFound && rec.Code != http.StatusMethodNotAllowed {
			t.Errorf("%s %s status = %d, want 404 or 405 (body %s)", tc.method, tc.path, rec.Code, rec.Body.String())
		}
	}

	if after := dbHash(t, dir); string(before) != string(after) {
		t.Error("a request under /api/gallery mutated the database")
	}
}

// --- failure mapping ------------------------------------------------------

// TestCurationStoreFailureIs500 proves a storage failure is a 500 with the opaque
// envelope, never a success and never a leaked path.
func TestCurationStoreFailureIs500(t *testing.T) {
	h := api.NewServer(stubStore{err: errors.New("disk on fire")}, logging.Discard())

	cases := []struct{ method, path, body string }{
		{http.MethodDelete, "/v1/bookmarks/111", ""},
		{http.MethodPut, "/v1/bookmarks/111/collection", `{"slug":"linux"}`},
	}
	for _, tc := range cases {
		rec := do(h, tc.method, tc.path, tc.body)
		if rec.Code != http.StatusInternalServerError {
			t.Fatalf("%s %s status = %d, want 500", tc.method, tc.path, rec.Code)
		}
		var body model.ErrorResponse
		if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
			t.Fatalf("decode 500 body: %v", err)
		}
		if body.Status != "error" || body.Reason != "internal error" {
			t.Errorf("%s %s body = %+v, want status=error reason=internal error", tc.method, tc.path, body)
		}
		if strings.Contains(rec.Body.String(), "disk on fire") {
			t.Errorf("%s %s leaked the internal error", tc.method, tc.path)
		}
	}
}

// TestCurationWithoutAStoreIs500 covers the nil-store construction.
func TestCurationWithoutAStoreIs500(t *testing.T) {
	h := api.NewServer(nil, logging.Discard())

	if rec := do(h, http.MethodDelete, "/v1/bookmarks/111", ""); rec.Code != http.StatusInternalServerError {
		t.Errorf("delete without a store status = %d, want 500", rec.Code)
	}
	if rec := do(h, http.MethodPut, "/v1/bookmarks/111/collection", `{"slug":"linux"}`); rec.Code != http.StatusInternalServerError {
		t.Errorf("move without a store status = %d, want 500", rec.Code)
	}
}
