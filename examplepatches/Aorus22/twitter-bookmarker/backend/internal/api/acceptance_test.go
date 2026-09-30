// Acceptance suite for the backend criteria in PRD.md §65 (items 1-20).
//
// TestPRD65Acceptance locks every criterion that is observable through the HTTP
// API to a named subtest. Criteria whose authoritative proof lives in another
// package (process lifecycle, config, database storage, derived index) are
// mapped below to the test that proves them, so this file alone is an auditable
// index of §65 coverage.
//
//	#   §65 acceptance criterion                        Authoritative test(s)
//	1   executable Go runs manually                     cmd/server: TestProcessLiveServer
//	2   server binds loopback only                      config: TestFixedLoopbackAddress;
//	                                                    cmd/server: TestProcessLiveServer (startup log address)
//	3   ~/.twitter-bookmarker/ auto-created (0700)      config: TestEnsureStorageDirCreates0700AndRepairs;
//	                                                    cmd/server: TestProcessLiveServer
//	4   GET /health works                               TestPRD65Acceptance/item04_health
//	5   GET /v1/index works                             TestPRD65Acceptance/item05_index_endpoint
//	6   POST /v1/bookmarks creates the collection       TestPRD65Acceptance/item06_first_save_creates_collection
//	7   the collection row is created exactly once      TestPRD65Acceptance/item07_collection_created_once
//	8   subsequent saves append rows                    TestPRD65Acceptance/item08_subsequent_saves_append
//	9   URL normalized                                  TestPRD65Acceptance/item09_url_normalized
//	10  Tweet ID extracted                              TestPRD65Acceptance/item10_tweet_id_extracted
//	11  saved_at uses UTC                               TestPRD65Acceptance/item11_saved_at_is_utc
//	12  duplicate rejected with 409 (same collection)   TestPRD65Acceptance/item12_duplicate_same_collection_409
//	13  duplicate detection spans all collections       TestPRD65Acceptance/item13_duplicate_across_collections_409
//	14  index is derived from the database              TestPRD65Acceptance/item14_and_15_index_reflects_database
//	15  reading never damages the data                  TestPRD65Acceptance/item14_and_15_index_reflects_database
//	16  unicode/newline/comma valid in text             storage: TestSaveIsDurableAcrossReopen;
//	                                                    db: TestOpenROSeesWhatOpenRWCommitted
//	17  slug traversal rejected                         TestPRD65Acceptance/item17_slug_traversal_rejected
//	18  concurrent duplicates make exactly one row      storage: TestConcurrentSameTweetExactlyOneRow
//	19  no derived-index sidecar is required            TestPRD65Acceptance/item19_no_derived_index_sidecar
//	20  no settings/categories storage or endpoints     TestPRD65Acceptance/item20_no_categories_or_settings_surface
package api_test

import (
	"bytes"
	"encoding/json"
	"errors"
	"fmt"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/api"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

func TestPRD65Acceptance(t *testing.T) {
	t.Run("item04_health", func(t *testing.T) {
		h, _ := newTestServer(t)
		rec := do(h, http.MethodGet, "/health", "")
		if rec.Code != http.StatusOK {
			t.Fatalf("status = %d, want 200", rec.Code)
		}
		if got := decode[model.HealthResponse](t, rec).Status; got != "ok" {
			t.Fatalf("status field = %q, want ok", got)
		}
	})

	t.Run("item05_index_endpoint", func(t *testing.T) {
		h, _ := newTestServer(t)

		empty := do(h, http.MethodGet, "/v1/index", "")
		if empty.Code != http.StatusOK {
			t.Fatalf("empty index status = %d, want 200", empty.Code)
		}
		if got := decode[model.IndexResponse](t, empty); got.Items == nil || len(got.Items) != 0 {
			t.Fatalf("empty index items = %+v, want empty non-nil map", got.Items)
		}

		if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusCreated {
			t.Fatalf("save status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
		}
		rec := do(h, http.MethodGet, "/v1/index", "")
		if rec.Code != http.StatusOK {
			t.Fatalf("index status = %d, want 200", rec.Code)
		}
		items := decode[model.IndexResponse](t, rec).Items
		entry, ok := items["123"]
		if !ok {
			t.Fatalf("index missing tweet 123: %+v", items)
		}
		if entry.URL != "https://x.com/foo/status/123" || entry.Slug != "linux" {
			t.Fatalf("index entry = %+v, want canonical url + linux", entry)
		}
		if _, err := time.Parse(time.RFC3339, entry.SavedAt); err != nil {
			t.Fatalf("index saved_at %q is not RFC3339: %v", entry.SavedAt, err)
		}
	})

	t.Run("item06_first_save_creates_collection", func(t *testing.T) {
		h, dir := newTestServer(t)
		if got := collectionCount(t, dir); got != 0 {
			t.Fatalf("collections before the first save = %d, want 0", got)
		}

		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		if rec.Code != http.StatusCreated {
			t.Fatalf("status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
		}
		resp := decode[model.SaveResponse](t, rec)
		if resp.Slug != "linux" {
			t.Fatalf("slug = %q, want linux", resp.Slug)
		}

		conn := openRO(t, dir)
		if got := dbtest.Text(t, conn, `SELECT slug FROM collections`); got != "linux" {
			t.Fatalf("stored collection slug = %q, want linux", got)
		}
		if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 1 {
			t.Fatalf("stored bookmarks = %d, want 1", got)
		}
	})

	t.Run("item07_collection_created_once", func(t *testing.T) {
		h, dir := newTestServer(t)
		for _, body := range []string{
			validBody,
			`{"slug":"linux","tweet":{"url":"https://x.com/bar/status/456","author":"Bar","username":"@bar","tweet_date":"2026-09-27T02:00:00Z","text":"second"}}`,
		} {
			if rec := do(h, http.MethodPost, "/v1/bookmarks", body); rec.Code != http.StatusCreated {
				t.Fatalf("save status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
			}
		}

		conn := openRO(t, dir)
		if got := dbtest.Count(t, conn, `SELECT count(*) FROM collections WHERE slug = 'linux'`); got != 1 {
			t.Fatalf("linux collections = %d, want exactly 1", got)
		}
		if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 2 {
			t.Fatalf("bookmarks = %d, want 2", got)
		}
	})

	t.Run("item08_subsequent_saves_append", func(t *testing.T) {
		h, dir := newTestServer(t)
		bodies := []string{
			validBody,
			`{"slug":"linux","tweet":{"url":"https://x.com/bar/status/456","author":"Bar","username":"@bar","tweet_date":"2026-09-27T02:00:00Z","text":"second"}}`,
			`{"slug":"linux","tweet":{"url":"https://x.com/baz/status/789","author":"Baz","username":"@baz","tweet_date":"2026-09-27T03:00:00Z","text":"third"}}`,
		}
		for _, body := range bodies {
			if rec := do(h, http.MethodPost, "/v1/bookmarks", body); rec.Code != http.StatusCreated {
				t.Fatalf("save status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
			}
		}

		gotURLs := bookmarkURLs(t, dir)
		wantURLs := []string{
			"https://x.com/foo/status/123",
			"https://x.com/bar/status/456",
			"https://x.com/baz/status/789",
		}
		if len(gotURLs) != len(wantURLs) {
			t.Fatalf("stored urls = %v, want %d rows", gotURLs, len(wantURLs))
		}
		for i := range wantURLs {
			if gotURLs[i] != wantURLs[i] {
				t.Errorf("row %d url = %q, want %q", i, gotURLs[i], wantURLs[i])
			}
		}
	})

	t.Run("item09_url_normalized", func(t *testing.T) {
		h, dir := newTestServer(t)
		body := `{"slug":"linux","tweet":{"url":"https://twitter.com/foo/status/321?s=20#frag","author":"Foo","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"hi"}}`
		rec := do(h, http.MethodPost, "/v1/bookmarks", body)
		if rec.Code != http.StatusCreated {
			t.Fatalf("status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
		}
		resp := decode[model.SaveResponse](t, rec)
		if resp.URL != "https://x.com/foo/status/321" {
			t.Fatalf("response url = %q, want canonical https://x.com/foo/status/321", resp.URL)
		}
		if got := dbtest.Text(t, openRO(t, dir), `SELECT url FROM bookmarks WHERE tweet_id = '321'`); got != resp.URL {
			t.Fatalf("stored url = %q, want canonical %q", got, resp.URL)
		}
	})

	t.Run("item10_tweet_id_extracted", func(t *testing.T) {
		h, dir := newTestServer(t)
		body := `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/987654321?s=20","author":"Foo","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"hi"}}`
		rec := do(h, http.MethodPost, "/v1/bookmarks", body)
		if rec.Code != http.StatusCreated {
			t.Fatalf("status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
		}
		resp := decode[model.SaveResponse](t, rec)
		if resp.TweetID != "987654321" {
			t.Fatalf("response tweet_id = %q, want 987654321", resp.TweetID)
		}
		if items := decode[model.IndexResponse](t, do(h, http.MethodGet, "/v1/index", "")).Items; items["987654321"].URL != resp.URL {
			t.Fatalf("index is not keyed by the extracted id: %+v", items)
		}
		if got := dbtest.Text(t, openRO(t, dir), `SELECT url FROM bookmarks WHERE tweet_id = '987654321'`); !strings.HasSuffix(got, "/status/987654321") {
			t.Fatalf("stored url = %q, want /status/987654321 suffix", got)
		}
	})

	t.Run("item11_saved_at_is_utc", func(t *testing.T) {
		h, dir := newTestServer(t)
		before := time.Now().UTC().Add(-time.Minute)
		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		after := time.Now().UTC().Add(time.Minute)
		if rec.Code != http.StatusCreated {
			t.Fatalf("status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
		}
		resp := decode[model.SaveResponse](t, rec)

		parsed, err := time.Parse(time.RFC3339, resp.SavedAt)
		if err != nil {
			t.Fatalf("saved_at %q is not RFC3339: %v", resp.SavedAt, err)
		}
		if parsed.Location() != time.UTC {
			t.Fatalf("saved_at location = %v, want UTC", parsed.Location())
		}
		if parsed.Before(before) || parsed.After(after) {
			t.Fatalf("saved_at %v outside [%v, %v]", parsed, before, after)
		}
		if got := dbtest.Text(t, openRO(t, dir), `SELECT saved_at FROM bookmarks WHERE tweet_id = '123'`); got != resp.SavedAt {
			t.Fatalf("stored saved_at = %q, response saved_at = %q", got, resp.SavedAt)
		}
	})

	t.Run("item12_duplicate_same_collection_409", func(t *testing.T) {
		h, dir := newTestServer(t)
		if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusCreated {
			t.Fatalf("first save status = %d, want 201", rec.Code)
		}
		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		if rec.Code != http.StatusConflict {
			t.Fatalf("duplicate status = %d, want 409 (body %s)", rec.Code, rec.Body.String())
		}
		dup := decode[model.DuplicateResponse](t, rec)
		if dup.Status != "duplicate" || dup.TweetID != "123" {
			t.Fatalf("duplicate body = %+v, want status=duplicate tweet_id=123", dup)
		}
		if got := totalBookmarks(t, dir); got != 1 {
			t.Fatalf("bookmarks = %d, want 1 after duplicate", got)
		}
	})

	t.Run("item13_duplicate_across_collections_409", func(t *testing.T) {
		h, dir := newTestServer(t)
		if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusCreated {
			t.Fatalf("first save status = %d, want 201", rec.Code)
		}
		crossBody := `{"slug":"ai","tweet":{"url":"https://x.com/renamed/status/123?s=20","author":"Other","username":"@other","tweet_date":"2026-09-27T05:00:00Z","text":"dupe"}}`
		rec := do(h, http.MethodPost, "/v1/bookmarks", crossBody)
		if rec.Code != http.StatusConflict {
			t.Fatalf("cross-collection duplicate status = %d, want 409 (body %s)", rec.Code, rec.Body.String())
		}
		if got := collectionCount(t, dir); got != 1 {
			t.Fatalf("collections = %d, want 1: the duplicate must not create 'ai'", got)
		}
		if got := bookmarkCount(t, dir, "linux"); got != 1 {
			t.Fatalf("linux bookmarks = %d, want 1", got)
		}
	})

	t.Run("item14_and_15_index_reflects_database", func(t *testing.T) {
		dir := t.TempDir()
		conn := dbtest.Open(t, dir)
		dbtest.Seed(t, conn, "linux", "Linux", dbtest.Row{TweetID: "1"}, dbtest.Row{TweetID: "2"})
		dbtest.Seed(t, conn, "ai", "AI And LLM", dbtest.Row{TweetID: "3"})

		store, err := storage.NewStore(dir, logging.Discard())
		if err != nil {
			t.Fatalf("storage.NewStore() error = %v", err)
		}
		defer func() { _ = store.Close() }()

		items, err := store.Index()
		if err != nil {
			t.Fatalf("Store.Index() error = %v", err)
		}
		if items == nil {
			t.Fatalf("index items is nil, want a non-nil map")
		}
		for _, id := range []string{"1", "2", "3"} {
			if _, ok := items[id]; !ok {
				t.Errorf("index missing tweet %s: %+v", id, items)
			}
		}
		if len(items) != 3 {
			t.Errorf("index entries = %d, want 3", len(items))
		}

		// Reading the index is side-effect free: the database file is
		// byte-identical afterwards.
		before := dbHash(t, dir)
		if _, err := store.Index(); err != nil {
			t.Fatalf("second Store.Index() error = %v", err)
		}
		if after := dbHash(t, dir); !bytes.Equal(before, after) {
			t.Errorf("reading the index mutated the database")
		}
	})

	t.Run("item17_slug_traversal_rejected", func(t *testing.T) {
		cases := []string{
			"../evil",
			"../../etc/evil",
			"/etc/passwd",
			"sub/evil",
			`..\evil`,
			"~/.ssh/evil",
			"linux\x00",
			"..",
			".",
			"linux.txt",
			"Linux",
		}
		h, dir := newTestServer(t)
		for _, slug := range cases {
			t.Run(fmt.Sprintf("%q", slug), func(t *testing.T) {
				req := model.SaveRequest{
					Slug: slug,
					Tweet: model.TweetInput{
						URL:       "https://x.com/foo/status/123",
						Author:    "Foo",
						Username:  "@foo",
						TweetDate: "2026-09-27T01:00:00Z",
						Text:      "hi",
					},
				}
				payload, err := json.Marshal(req)
				if err != nil {
					t.Fatalf("marshal request: %v", err)
				}
				rec := do(h, http.MethodPost, "/v1/bookmarks", string(payload))
				if rec.Code != http.StatusBadRequest {
					t.Fatalf("slug %q status = %d, want 400 (body %s)", slug, rec.Code, rec.Body.String())
				}
				if body := decode[model.ErrorResponse](t, rec); body.Status != "error" {
					t.Fatalf("error body = %+v, want status=error", body)
				}
			})
		}

		if got := collectionCount(t, dir); got != 0 {
			t.Errorf("rejected traversal requests created %d collection(s)", got)
		}
		if got := totalBookmarks(t, dir); got != 0 {
			t.Errorf("rejected traversal requests wrote %d bookmark(s)", got)
		}
	})

	t.Run("item19_no_derived_index_sidecar", func(t *testing.T) {
		dir := t.TempDir()
		// A leftover derived-index artifact from the CSV era is inert: even a
		// non-empty directory named index.json cannot affect the database path.
		if err := os.Mkdir(filepath.Join(dir, "index.json"), 0o700); err != nil {
			t.Fatalf("mkdir index.json: %v", err)
		}
		store, err := storage.NewStore(dir, logging.Discard())
		if err != nil {
			t.Fatalf("storage.NewStore() error = %v", err)
		}
		defer func() { _ = store.Close() }()
		h := api.NewServer(store, logging.Discard())

		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		if rec.Code != http.StatusCreated {
			t.Fatalf("status = %d, want 201 despite the stray index.json (body %s)", rec.Code, rec.Body.String())
		}
		if resp := decode[model.SaveResponse](t, rec); resp.Status != "saved" || resp.Slug != "linux" {
			t.Fatalf("response = %+v, want status=saved slug=linux", resp)
		}
		if got := bookmarkCount(t, dir, "linux"); got != 1 {
			t.Fatalf("linux bookmarks = %d, want 1", got)
		}
		if items := decode[model.IndexResponse](t, do(h, http.MethodGet, "/v1/index", "")).Items; len(items) != 1 {
			t.Fatalf("index entries = %d, want 1", len(items))
		}
	})

	t.Run("item20_no_categories_or_settings_surface", func(t *testing.T) {
		h, _ := newTestServer(t)

		// There must be no categories/settings endpoint of any method.
		paths := []string{
			"/v1/categories",
			"/v1/categories/linux",
			"/v1/settings",
			"/v1/config",
			"/categories",
			"/settings",
		}
		methods := []string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodDelete}
		for _, p := range paths {
			for _, m := range methods {
				rec := do(h, m, p, "")
				if rec.Code != http.StatusNotFound {
					t.Errorf("%s %s status = %d, want 404 (no such endpoint)", m, p, rec.Code)
				}
			}
		}

		// Settings/category fields are not part of the save payload and are
		// rejected, so the backend persists no settings or category state.
		withUnknown := []string{
			`{"slug":"linux","settings":{"unbookmarkAfterSave":true},"tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`,
			`{"slug":"linux","categories":[{"name":"Linux"}],"tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`,
			`{"slug":"linux","category":{"name":"Linux"},"tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`,
		}
		for _, body := range withUnknown {
			if rec := do(h, http.MethodPost, "/v1/bookmarks", body); rec.Code != http.StatusBadRequest {
				t.Errorf("save with unknown settings/category field status = %d, want 400", rec.Code)
			}
		}

		// The success contract carries bookmark data only.
		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		if rec.Code != http.StatusCreated {
			t.Fatalf("save status = %d, want 201", rec.Code)
		}
		var keys map[string]any
		if err := json.Unmarshal(rec.Body.Bytes(), &keys); err != nil {
			t.Fatalf("decode: %v", err)
		}
		for _, forbidden := range []string{"settings", "category", "categories", "color", "order"} {
			if _, ok := keys[forbidden]; ok {
				t.Errorf("save response leaked %q: %v", forbidden, keys)
			}
		}
	})
}

// TestPRD65ValidationAndErrorMapping pins every 400 validation class and the
// 500 mapping that §65 references via PRD §21 (invalid payload → 400,
// filesystem/internal → 500).
func TestPRD65ValidationAndErrorMapping(t *testing.T) {
	t.Run("400_validation_cases", func(t *testing.T) {
		cases := []struct {
			item string
			body string
		}{
			{"invalid_slug", `{"slug":"../x","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
			{"invalid_x_url_host", `{"slug":"linux","tweet":{"url":"https://example.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
			{"invalid_x_url_scheme", `{"slug":"linux","tweet":{"url":"ftp://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
			{"missing_author", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
			{"missing_username", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"","tweet_date":"2026-09-27T01:00:00Z"}}`},
			{"invalid_tweet_date", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"27-09-2026"}}`},
			{"invalid_payload_malformed_json", `{`},
			{"invalid_payload_wrong_type", `[]`},
			{"invalid_payload_empty_body", ``},
		}
		for _, tc := range cases {
			t.Run(tc.item, func(t *testing.T) {
				h, dir := newTestServer(t)
				rec := do(h, http.MethodPost, "/v1/bookmarks", tc.body)
				if rec.Code != http.StatusBadRequest {
					t.Fatalf("status = %d, want 400 (body %s)", rec.Code, rec.Body.String())
				}
				if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
					t.Errorf("Content-Type = %q, want application/json", ct)
				}
				if body := decode[model.ErrorResponse](t, rec); body.Status != "error" {
					t.Errorf("error body = %+v, want status=error", body)
				}
				conn := openRO(t, dir)
				if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 0 {
					t.Errorf("rejected request wrote %d bookmark(s)", got)
				}
				if got := dbtest.Count(t, conn, `SELECT count(*) FROM collections`); got != 0 {
					t.Errorf("rejected request wrote %d collection(s)", got)
				}
			})
		}
	})

	t.Run("500_internal_error_mapping", func(t *testing.T) {
		h := api.NewServer(stubStore{err: errors.New("disk on fire")}, logging.Discard())
		rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)
		if rec.Code != http.StatusInternalServerError {
			t.Fatalf("status = %d, want 500", rec.Code)
		}
		body := decode[model.ErrorResponse](t, rec)
		if body.Status != "error" || body.Reason != "internal error" {
			t.Fatalf("body = %+v, want status=error reason=internal error", body)
		}
	})
}
