package api_test

import (
	"database/sql"
	"encoding/json"
	"errors"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/api"
	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

const validBody = `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123?s=20","author":"Foo Bar","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"Testing Linux today"}}`

// newTestServer builds the real handler over a fresh storage directory. The
// database is created (empty) by storage.NewStore, so a test sees the same
// construction path as cmd/server; only the persisted rows are made per test.
func newTestServer(t *testing.T) (http.Handler, string) {
	t.Helper()
	// NewServer reads the token from the environment, and these tests exercise
	// the loopback path with no authentication. Clearing the variable keeps a
	// developer's exported $TWITTER_BOOKMARKER_TOKEN from turning every case
	// here into a 401.
	t.Setenv(config.EnvToken, "")
	dir := t.TempDir()
	store, err := storage.NewStore(dir, logging.Discard())
	if err != nil {
		t.Fatalf("storage.NewStore() error = %v", err)
	}
	t.Cleanup(func() { _ = store.Close() })
	return api.NewServer(store, logging.Discard()), dir
}

func do(h http.Handler, method, path, body string) *httptest.ResponseRecorder {
	var req *http.Request
	if body == "" {
		req = httptest.NewRequest(method, path, nil)
	} else {
		req = httptest.NewRequest(method, path, strings.NewReader(body))
	}
	rec := httptest.NewRecorder()
	h.ServeHTTP(rec, req)
	return rec
}

func decode[T any](t *testing.T, rec *httptest.ResponseRecorder) T {
	t.Helper()
	var v T
	if err := json.Unmarshal(rec.Body.Bytes(), &v); err != nil {
		t.Fatalf("decode response %q: %v", rec.Body.String(), err)
	}
	return v
}

// --- database assertions ---------------------------------------------------

// openRO opens the database in dir independently of the server's writer, so
// assertions read what is actually on disk.
func openRO(t *testing.T, dir string) *sql.DB {
	t.Helper()
	conn, err := db.OpenRO(config.DBPath(dir))
	if err != nil {
		t.Fatalf("open database read-only: %v", err)
	}
	t.Cleanup(func() { _ = conn.Close() })
	return conn
}

// bookmarkCount counts the bookmarks in one collection, read from disk.
func bookmarkCount(t *testing.T, dir, slug string) int {
	t.Helper()
	return dbtest.Count(t, openRO(t, dir),
		`SELECT count(*) FROM bookmarks b JOIN collections c ON c.id = b.collection_id WHERE c.slug = ?`,
		slug)
}

// totalBookmarks counts every bookmark, read from disk.
func totalBookmarks(t *testing.T, dir string) int {
	t.Helper()
	return dbtest.Count(t, openRO(t, dir), `SELECT count(*) FROM bookmarks`)
}

// collectionCount counts every collection, read from disk.
func collectionCount(t *testing.T, dir string) int {
	t.Helper()
	return dbtest.Count(t, openRO(t, dir), `SELECT count(*) FROM collections`)
}

// bookmarkURLs lists every stored URL in append order, read from disk.
func bookmarkURLs(t *testing.T, dir string) []string {
	t.Helper()
	rows, err := openRO(t, dir).Query(`SELECT url FROM bookmarks ORDER BY saved_at, tweet_id`)
	if err != nil {
		t.Fatalf("query bookmark urls: %v", err)
	}
	defer rows.Close()

	var urls []string
	for rows.Next() {
		var url string
		if err := rows.Scan(&url); err != nil {
			t.Fatalf("scan bookmark url: %v", err)
		}
		urls = append(urls, url)
	}
	if err := rows.Err(); err != nil {
		t.Fatalf("iterate bookmark urls: %v", err)
	}
	return urls
}

// --- tests -----------------------------------------------------------------

func TestHealth(t *testing.T) {
	h, _ := newTestServer(t)
	rec := do(h, http.MethodGet, "/health", "")

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200", rec.Code)
	}
	if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
		t.Fatalf("Content-Type = %q, want application/json", ct)
	}
	if got := decode[model.HealthResponse](t, rec).Status; got != "ok" {
		t.Fatalf("status field = %q, want ok", got)
	}
}

func TestIndexEmptyShape(t *testing.T) {
	h, _ := newTestServer(t)
	rec := do(h, http.MethodGet, "/v1/index", "")

	if rec.Code != http.StatusOK {
		t.Fatalf("status = %d, want 200", rec.Code)
	}
	if !strings.Contains(rec.Body.String(), `"items":{}`) {
		t.Fatalf("body = %s, want items to be an empty object", rec.Body.String())
	}
}

func TestIndexAfterSave(t *testing.T) {
	h, _ := newTestServer(t)

	if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusCreated {
		t.Fatalf("save status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
	}

	rec := do(h, http.MethodGet, "/v1/index", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("index status = %d, want 200", rec.Code)
	}
	var body model.IndexResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode index: %v", err)
	}
	entry, ok := body.Items["123"]
	if !ok {
		t.Fatalf("items missing tweet 123: %+v", body.Items)
	}
	if entry.URL != "https://x.com/foo/status/123" {
		t.Errorf("entry.URL = %q, want canonical URL", entry.URL)
	}
	if entry.Slug != "linux" {
		t.Errorf("entry.Slug = %q, want linux", entry.Slug)
	}
	if _, err := time.Parse(time.RFC3339, entry.SavedAt); err != nil {
		t.Errorf("entry.SavedAt = %q, want RFC3339: %v", entry.SavedAt, err)
	}
}

func TestSaveCreatedContract(t *testing.T) {
	h, dir := newTestServer(t)
	rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)

	if rec.Code != http.StatusCreated {
		t.Fatalf("status = %d, want 201 (body %s)", rec.Code, rec.Body.String())
	}
	if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
		t.Fatalf("Content-Type = %q, want application/json", ct)
	}

	var keys map[string]any
	if err := json.Unmarshal(rec.Body.Bytes(), &keys); err != nil {
		t.Fatalf("decode: %v", err)
	}
	wantKeys := []string{"status", "tweet_id", "url", "slug", "saved_at"}
	if len(keys) != len(wantKeys) {
		t.Fatalf("response keys = %v, want exactly %v", keys, wantKeys)
	}
	for _, k := range wantKeys {
		if _, ok := keys[k]; !ok {
			t.Errorf("response missing key %q", k)
		}
	}

	resp := decode[model.SaveResponse](t, rec)
	if resp.Status != "saved" {
		t.Errorf("status = %q, want saved", resp.Status)
	}
	if resp.TweetID != "123" {
		t.Errorf("tweet_id = %q, want 123", resp.TweetID)
	}
	if resp.URL != "https://x.com/foo/status/123" {
		t.Errorf("url = %q, want canonical", resp.URL)
	}
	if resp.Slug != "linux" {
		t.Errorf("slug = %q, want linux", resp.Slug)
	}
	if _, err := time.Parse(time.RFC3339, resp.SavedAt); err != nil {
		t.Errorf("saved_at = %q, want RFC3339: %v", resp.SavedAt, err)
	}

	// The save is committed: one bookmark and its collection are on disk.
	conn := openRO(t, dir)
	if got := dbtest.Text(t, conn, `SELECT url FROM bookmarks WHERE tweet_id = '123'`); got != resp.URL {
		t.Errorf("stored url = %q, want %q", got, resp.URL)
	}
	if got := dbtest.Text(t, conn, `SELECT slug FROM collections`); got != "linux" {
		t.Errorf("stored collection slug = %q, want linux", got)
	}
}

func TestSaveDuplicateReturns409(t *testing.T) {
	h, dir := newTestServer(t)

	if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusCreated {
		t.Fatalf("first save status = %d, want 201", rec.Code)
	}

	dupBody := `{"slug":"ai","tweet":{"url":"https://x.com/other/status/123","author":"Foo Bar","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"dupe"}}`
	rec := do(h, http.MethodPost, "/v1/bookmarks", dupBody)
	if rec.Code != http.StatusConflict {
		t.Fatalf("duplicate status = %d, want 409 (body %s)", rec.Code, rec.Body.String())
	}

	var keys map[string]any
	if err := json.Unmarshal(rec.Body.Bytes(), &keys); err != nil {
		t.Fatalf("decode: %v", err)
	}
	if len(keys) != 3 {
		t.Fatalf("duplicate response keys = %v, want exactly status+tweet_id+slug", keys)
	}
	dup := decode[model.DuplicateResponse](t, rec)
	if dup.Status != "duplicate" || dup.TweetID != "123" {
		t.Fatalf("duplicate response = %+v, want status=duplicate tweet_id=123", dup)
	}
	// The slug names where the tweet already lives — the first save's collection,
	// not the one this second request asked for, so a client can say "already in
	// Linux" instead of silently retrying into "ai".
	if dup.Slug != "linux" {
		t.Fatalf("duplicate response slug = %q, want the owning collection linux", dup.Slug)
	}

	conn := openRO(t, dir)
	if got := dbtest.Count(t, conn, `SELECT count(*) FROM collections WHERE slug = 'ai'`); got != 0 {
		t.Errorf("the duplicate created a collection (count = %d)", got)
	}
	if got := bookmarkCount(t, dir, "linux"); got != 1 {
		t.Errorf("linux bookmarks = %d, want 1", got)
	}
}

func TestSaveInvalidRequestsReturn400(t *testing.T) {
	validTweet := `"tweet":{"url":"https://x.com/foo/status/123","author":"Foo Bar","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"hi"}`

	tests := []struct {
		name string
		body string
	}{
		{"empty body", ""},
		{"malformed json", `{`},
		{"json array", `[]`},
		{"unknown top-level field (settings)", `{"slug":"linux","settings":{},` + validTweet + `}`},
		{"unknown top-level field (category)", `{"slug":"linux","category":"Linux",` + validTweet + `}`},
		{"unknown nested field", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z","quoted_text":"nope"}}`},
		// A stale extension still sending the CSV-era "filename" key must be
		// rejected, not silently ignored: DisallowUnknownFields answers 400.
		{"legacy filename field", `{"filename":"linux",` + validTweet + `}`},
		{"wrong field type", `{"slug":123,` + validTweet + `}`},
		{"empty slug", `{"slug":"",` + validTweet + `}`},
		{"traversal slug", `{"slug":"../x",` + validTweet + `}`},
		{"absolute slug", `{"slug":"/etc/passwd",` + validTweet + `}`},
		{"unslugged slug", `{"slug":"Linux",` + validTweet + `}`},
		{"bad url host", `{"slug":"linux","tweet":{"url":"https://example.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
		{"no status id", `{"slug":"linux","tweet":{"url":"https://x.com/i/bookmarks","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
		{"missing author", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"","username":"@a","tweet_date":"2026-09-27T01:00:00Z"}}`},
		{"missing username", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"","tweet_date":"2026-09-27T01:00:00Z"}}`},
		{"missing tweet_date", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":""}}`},
		{"bad tweet_date", `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"27-09-2026"}}`},
		{"missing tweet object", `{"slug":"linux"}`},
		{"valid tweet, missing slug", `{` + validTweet + `}`},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			h, dir := newTestServer(t)
			rec := do(h, http.MethodPost, "/v1/bookmarks", tc.body)
			if rec.Code != http.StatusBadRequest {
				t.Fatalf("status = %d, want 400 (body %s)", rec.Code, rec.Body.String())
			}
			if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
				t.Errorf("Content-Type = %q, want application/json", ct)
			}
			var body model.ErrorResponse
			if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
				t.Fatalf("decode error body %q: %v", rec.Body.String(), err)
			}
			if body.Status != "error" {
				t.Errorf("error body status = %q, want error", body.Status)
			}
			// A rejected request must never leave a bookmark or a collection behind.
			conn := openRO(t, dir)
			if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 0 {
				t.Errorf("rejected request wrote %d bookmark(s)", got)
			}
			if got := dbtest.Count(t, conn, `SELECT count(*) FROM collections`); got != 0 {
				t.Errorf("rejected request wrote %d collection(s)", got)
			}
		})
	}
}

func TestSaveOversizedBodyReturns400(t *testing.T) {
	h, _ := newTestServer(t)

	body := `{"slug":"linux","tweet":{"url":"https://x.com/foo/status/123","author":"A","username":"@a","tweet_date":"2026-09-27T01:00:00Z","text":"` +
		strings.Repeat("x", 2<<20) + `"}}`
	rec := do(h, http.MethodPost, "/v1/bookmarks", body)
	if rec.Code != http.StatusBadRequest {
		t.Fatalf("status = %d, want 400 for oversized body", rec.Code)
	}
}

func TestMethodNotAllowedAndNotFound(t *testing.T) {
	h, _ := newTestServer(t)

	tests := []struct {
		method string
		path   string
		want   int
	}{
		{http.MethodDelete, "/health", http.StatusMethodNotAllowed},
		{http.MethodPost, "/health", http.StatusMethodNotAllowed},
		{http.MethodGet, "/v1/bookmarks", http.StatusMethodNotAllowed},
		{http.MethodGet, "/nope", http.StatusNotFound},
		{http.MethodGet, "/v2/index", http.StatusNotFound},
	}
	for _, tc := range tests {
		rec := do(h, tc.method, tc.path, "")
		if rec.Code != tc.want {
			t.Errorf("%s %s status = %d, want %d", tc.method, tc.path, rec.Code, tc.want)
		}
	}
}

func TestInternalErrorReturns500(t *testing.T) {
	h := api.NewServer(stubStore{err: errors.New("disk on fire")}, logging.Discard())
	rec := do(h, http.MethodPost, "/v1/bookmarks", validBody)

	if rec.Code != http.StatusInternalServerError {
		t.Fatalf("status = %d, want 500", rec.Code)
	}
	body := decode[model.ErrorResponse](t, rec)
	if body.Status != "error" || body.Reason != "internal error" {
		t.Fatalf("body = %+v, want status=error reason=internal error", body)
	}
}

func TestCORSOnlyForExtensionOrigins(t *testing.T) {
	h, _ := newTestServer(t)

	// Extension origin gets an echoed, non-wildcard grant plus a preflight.
	req := httptest.NewRequest(http.MethodGet, "/health", nil)
	req.Header.Set("Origin", "chrome-extension://abcdefghijklmnop")
	rec := httptest.NewRecorder()
	h.ServeHTTP(rec, req)
	if got := rec.Header().Get("Access-Control-Allow-Origin"); got != "chrome-extension://abcdefghijklmnop" {
		t.Errorf("ACAO = %q, want echoed extension origin", got)
	}

	preflight := httptest.NewRequest(http.MethodOptions, "/v1/bookmarks", nil)
	preflight.Header.Set("Origin", "chrome-extension://abcdefghijklmnop")
	preflightRec := httptest.NewRecorder()
	h.ServeHTTP(preflightRec, preflight)
	if preflightRec.Code != http.StatusNoContent {
		t.Errorf("preflight status = %d, want 204", preflightRec.Code)
	}
	if got := preflightRec.Header().Get("Access-Control-Allow-Methods"); !strings.Contains(got, "POST") {
		t.Errorf("preflight allow-methods = %q, want POST", got)
	}

	// Arbitrary web origin is never granted access.
	evil := httptest.NewRequest(http.MethodGet, "/health", nil)
	evil.Header.Set("Origin", "https://evil.example")
	evilRec := httptest.NewRecorder()
	h.ServeHTTP(evilRec, evil)
	if got := evilRec.Header().Get("Access-Control-Allow-Origin"); got != "" {
		t.Errorf("ACAO for arbitrary origin = %q, want empty", got)
	}
	if evilRec.Code != http.StatusOK {
		t.Errorf("health status = %d, want 200", evilRec.Code)
	}

	evilPreflight := httptest.NewRequest(http.MethodOptions, "/v1/bookmarks", nil)
	evilPreflight.Header.Set("Origin", "https://evil.example")
	evilPreflightRec := httptest.NewRecorder()
	h.ServeHTTP(evilPreflightRec, evilPreflight)
	if evilPreflightRec.Code == http.StatusNoContent {
		t.Errorf("arbitrary origin preflight must not succeed")
	}
	if got := evilPreflightRec.Header().Get("Access-Control-Allow-Origin"); got != "" {
		t.Errorf("ACAO for arbitrary origin preflight = %q, want empty", got)
	}
}

func TestServerHandlesNilDependenciesSafely(t *testing.T) {
	h := api.NewServer(nil, nil)
	if rec := do(h, http.MethodGet, "/health", ""); rec.Code != http.StatusOK {
		t.Errorf("health status = %d, want 200", rec.Code)
	}
	// An absent store cannot serve an index; handlers.go answers 500 rather
	// than an empty {"items":{}} that would invite duplicate saves.
	if rec := do(h, http.MethodGet, "/v1/index", ""); rec.Code != http.StatusInternalServerError {
		t.Errorf("index status = %d, want 500 when the store is absent", rec.Code)
	}
	if rec := do(h, http.MethodPost, "/v1/bookmarks", validBody); rec.Code != http.StatusInternalServerError {
		t.Errorf("save status = %d, want 500 when the store is absent", rec.Code)
	}
}

// --- stubs ---

type stubStore struct{ err error }

func (s stubStore) Save(model.SaveRequest) (model.SaveResponse, error) {
	return model.SaveResponse{}, s.err
}

func (s stubStore) Index() (map[string]model.IndexEntry, error) {
	return map[string]model.IndexEntry{}, nil
}

func (s stubStore) Delete(string) error { return s.err }

func (s stubStore) Reassign(string, string) error { return s.err }
