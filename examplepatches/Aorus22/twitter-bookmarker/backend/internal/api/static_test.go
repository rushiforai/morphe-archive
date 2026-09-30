// Production-serving acceptance suite (PROD-01…PROD-05, PRD-2 §11/§56/§57/§84).
//
// Every server here is built through the real api.NewServer with
// TWITTER_BOOKMARKER_WEB_DIR pointing at a temp fixture (or at a deliberately
// missing directory), so the assertions exercise the same construction path as
// cmd/server without starting a listener.
package api_test

import (
	"bytes"
	"encoding/json"
	"net/http"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"twitter-bookmarker/internal/api"
	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

const (
	shellHTML = `<!doctype html><html><head><title>gallery</title></head>` +
		`<body><div id="root"></div>` +
		`<script type="module" src="/assets/index-YLi8pRYJ.js"></script></body></html>`
	hashedJSBody  = "console.log('hashed build asset')\n"
	hashedCSSBody = "body{color:red}\n"
	hashedJSName  = "assets/index-YLi8pRYJ.js"
	hashedCSSName = "assets/index-DUlxuxq4.css"
)

// newDistFixture lays out a miniature web/dist: the shell, a hashed JS and CSS
// asset under /assets/, and an unhashed root-level file.
func newDistFixture(t *testing.T) string {
	t.Helper()
	dist := t.TempDir()
	writeFixtureFile(t, filepath.Join(dist, "index.html"), shellHTML)
	writeFixtureFile(t, filepath.Join(dist, "favicon.svg"), `<svg xmlns="http://www.w3.org/2000/svg"/>`)
	writeFixtureFile(t, filepath.Join(dist, filepath.FromSlash(hashedJSName)), hashedJSBody)
	writeFixtureFile(t, filepath.Join(dist, filepath.FromSlash(hashedCSSName)), hashedCSSBody)
	return dist
}

func writeFixtureFile(t *testing.T, path, body string) {
	t.Helper()
	if err := os.MkdirAll(filepath.Dir(path), 0o700); err != nil {
		t.Fatalf("mkdir %s: %v", filepath.Dir(path), err)
	}
	if err := os.WriteFile(path, []byte(body), 0o600); err != nil {
		t.Fatalf("write %s: %v", path, err)
	}
}

// newServedServer builds the complete production handler: the frozen v1.0 API,
// the gallery API over a fresh temp storage dir, and the static/SPA handler
// over dist. dist is allowed not to exist (PROD-05).
func newServedServer(t *testing.T, dist string, log *logging.Logger) (http.Handler, string) {
	t.Helper()
	dir := t.TempDir()
	t.Setenv(config.EnvWebDir, dist)
	t.Setenv(config.EnvDir, dir)
	if log == nil {
		log = logging.Discard()
	}
	store, err := storage.NewStore(dir, log)
	if err != nil {
		t.Fatalf("storage.NewStore() error = %v", err)
	}
	t.Cleanup(func() { _ = store.Close() })
	return api.NewServer(store, log), dir
}

// --------------------------------------------------------------- PROD-01

func TestRootServesTheBuiltShell(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	rec := do(h, http.MethodGet, "/", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("GET / status = %d, want 200 (body %s)", rec.Code, rec.Body.String())
	}
	if ct := rec.Header().Get("Content-Type"); !strings.HasPrefix(ct, "text/html") {
		t.Errorf("GET / Content-Type = %q, want text/html", ct)
	}
	if body := rec.Body.String(); !strings.Contains(body, `<div id="root"></div>`) {
		t.Errorf("GET / body is not the built shell: %s", body)
	}
	// The shell must never be immutably cached: a rebuild has to be visible.
	if cc := rec.Header().Get("Cache-Control"); cc != "no-cache" {
		t.Errorf("GET / Cache-Control = %q, want no-cache", cc)
	}

	head := do(h, http.MethodHead, "/", "")
	if head.Code != http.StatusOK {
		t.Errorf("HEAD / status = %d, want 200", head.Code)
	}
}

func TestHashedAssetsAreServedWithImmutableCache(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	cases := []struct {
		path   string
		body   string
		wantCT string
	}{
		{"/" + hashedJSName, hashedJSBody, "javascript"},
		{"/" + hashedCSSName, hashedCSSBody, "text/css"},
	}
	for _, tc := range cases {
		rec := do(h, http.MethodGet, tc.path, "")
		if rec.Code != http.StatusOK {
			t.Fatalf("GET %s status = %d, want 200", tc.path, rec.Code)
		}
		if ct := rec.Header().Get("Content-Type"); !strings.Contains(ct, tc.wantCT) {
			t.Errorf("GET %s Content-Type = %q, want it to contain %q", tc.path, ct, tc.wantCT)
		}
		if got := rec.Body.String(); got != tc.body {
			t.Errorf("GET %s body = %q, want %q", tc.path, got, tc.body)
		}
		cc := rec.Header().Get("Cache-Control")
		if !strings.Contains(cc, "max-age=31536000") || !strings.Contains(cc, "immutable") {
			t.Errorf("GET %s Cache-Control = %q, want a long-lived immutable cache", tc.path, cc)
		}
	}
}

func TestUnhashedRootFilesAreNotImmutablyCached(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	rec := do(h, http.MethodGet, "/favicon.svg", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("GET /favicon.svg status = %d, want 200", rec.Code)
	}
	if ct := rec.Header().Get("Content-Type"); !strings.Contains(ct, "image/svg+xml") {
		t.Errorf("favicon Content-Type = %q, want image/svg+xml", ct)
	}
	if cc := rec.Header().Get("Cache-Control"); strings.Contains(cc, "immutable") {
		t.Errorf("unhashed file Cache-Control = %q, must not be immutable", cc)
	}
}

// --------------------------------------------------------------- PROD-03

func TestSPAFallbackForClientRoutes(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	// The PRD's own example (/collections/linux) plus deeper routes, plus the
	// bare names the v1.0 suite calls "absent surfaces": with a built SPA they
	// are client routes, not API endpoints.
	for _, p := range []string{
		"/collections/linux",
		"/collections/linux/anything",
		"/anything/deep",
		"/a/b/c/d/e/f",
		"/settings",
		"/categories",
	} {
		rec := do(h, http.MethodGet, p, "")
		if rec.Code != http.StatusOK {
			t.Errorf("GET %s status = %d, want 200 (SPA fallback)", p, rec.Code)
			continue
		}
		if ct := rec.Header().Get("Content-Type"); !strings.HasPrefix(ct, "text/html") {
			t.Errorf("GET %s Content-Type = %q, want text/html", p, ct)
		}
		if body := rec.Body.String(); !strings.Contains(body, `<div id="root"></div>`) {
			t.Errorf("GET %s did not serve index.html: %s", p, body)
		}
		if cc := rec.Header().Get("Cache-Control"); cc != "no-cache" {
			t.Errorf("GET %s Cache-Control = %q, want no-cache", p, cc)
		}
	}
}

func TestMissingAssetDoesNotFallBackToTheShell(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	// /assets/ is reserved for build output, and a root-level name with an
	// extension is a file reference: neither may silently become index.html.
	for _, p := range []string{
		"/assets/does-not-exist.js",
		"/assets/nested/deep.css",
		"/favicon-missing.svg",
	} {
		rec := do(h, http.MethodGet, p, "")
		if rec.Code != http.StatusNotFound {
			t.Errorf("GET %s status = %d, want 404", p, rec.Code)
		}
		if strings.Contains(rec.Body.String(), `<div id="root">`) {
			t.Errorf("GET %s served the SPA shell for a missing asset", p)
		}
	}
}

func TestNonGetClientRouteIsNotTheSPA(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	for _, method := range []string{http.MethodPost, http.MethodPut, http.MethodPatch, http.MethodDelete} {
		for _, p := range []string{"/collections/linux", "/anything/deep", "/assets/index-YLi8pRYJ.js"} {
			rec := do(h, method, p, "")
			if rec.Code != http.StatusMethodNotAllowed {
				t.Errorf("%s %s status = %d, want 405", method, p, rec.Code)
			}
			if strings.Contains(rec.Body.String(), `<div id="root">`) {
				t.Errorf("%s %s returned the SPA shell", method, p)
			}
			if allow := rec.Header().Get("Allow"); !strings.Contains(allow, "GET") {
				t.Errorf("%s %s Allow = %q, want GET", method, p, allow)
			}
		}
	}
}

func TestStaticServingCannotEscapeDist(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	const secret = "TOP-SECRET-OUTSIDE-DIST"
	writeFixtureFile(t, filepath.Join(filepath.Dir(dist), "secret.txt"), secret)

	// Encoded traversal never reaches a file lookup outside dist.
	for _, p := range []string{
		"/assets/%2e%2e%2fsecret.txt",
		"/assets/%2e%2e%2f%2e%2e%2fsecret.txt",
		"/assets/..%2F..%2Fsecret.txt",
		"/assets/%2e%2e/%2e%2e/etc/passwd",
	} {
		rec := do(h, http.MethodGet, p, "")
		if strings.Contains(rec.Body.String(), secret) || strings.Contains(rec.Body.String(), "root:") {
			t.Errorf("GET %s leaked a file outside dist: %s", p, rec.Body.String())
		}
		if rec.Code == http.StatusOK {
			continue // the SPA shell is a legitimate answer; a leak is not
		}
		if rec.Code != http.StatusNotFound {
			t.Errorf("GET %s status = %d, want 404 or the SPA shell", p, rec.Code)
		}
	}

	// A literal ".." is cleaned and redirected by the ServeMux; the redirect
	// target must still 404 rather than expose the parent directory.
	rec := do(h, http.MethodGet, "/../secret.txt", "")
	if loc := rec.Header().Get("Location"); loc != "" {
		next := do(h, http.MethodGet, loc, "")
		if next.Code != http.StatusNotFound {
			t.Errorf("redirect target %q status = %d, want 404", loc, next.Code)
		}
		if strings.Contains(next.Body.String(), secret) {
			t.Errorf("redirect target %q leaked a file outside dist", loc)
		}
	}
}

// ---------------------------------------------------------- PROD-02 / PROD-04

func TestAPIPrecedenceOverStaticServing(t *testing.T) {
	dist := newDistFixture(t)
	h, dir := newServedServer(t, dist, nil)
	seedLinux(t, dir)

	// The gallery API keeps answering JSON even while the SPA is served at /.
	rec := do(h, http.MethodGet, "/api/gallery/collections", "")
	if rec.Code != http.StatusOK {
		t.Fatalf("GET /api/gallery/collections status = %d, want 200 (body %s)", rec.Code, rec.Body.String())
	}
	if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
		t.Errorf("gallery Content-Type = %q, want application/json", ct)
	}
	if strings.Contains(rec.Body.String(), `<div id="root">`) {
		t.Errorf("gallery endpoint served the SPA shell: %s", rec.Body.String())
	}
	if !strings.Contains(rec.Body.String(), `"slug":"linux"`) {
		t.Errorf("gallery body does not describe the seeded collection: %s", rec.Body.String())
	}

	// Every unknown API path is an API 404 in the existing envelope, for every
	// method, and is never the shell.
	paths := []string{"/api/nope", "/api/gallery/nope", "/api/", "/api", "/v1/nope", "/v1"}
	for _, p := range paths {
		for _, method := range []string{http.MethodGet, http.MethodPost} {
			rec := do(h, method, p, "")
			if rec.Code != http.StatusNotFound {
				t.Errorf("%s %s status = %d, want 404", method, p, rec.Code)
				continue
			}
			if ct := rec.Header().Get("Content-Type"); ct != "application/json" {
				t.Errorf("%s %s Content-Type = %q, want application/json", method, p, ct)
			}
			var body model.ErrorResponse
			if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
				t.Errorf("%s %s body %q is not JSON: %v", method, p, rec.Body.String(), err)
				continue
			}
			if body.Status != "error" || body.Reason == "" {
				t.Errorf("%s %s body = %+v, want the {\"status\":\"error\",\"reason\":…} envelope", method, p, body)
			}
			if strings.Contains(rec.Body.String(), `<div id="root">`) {
				t.Errorf("%s %s served the SPA shell", method, p)
			}
		}
	}
}

func TestFrozenV1ContractsSurviveStaticServing(t *testing.T) {
	dist := newDistFixture(t)
	h, _ := newServedServer(t, dist, nil)

	// /health -> {"status":"ok"} exactly.
	health := do(h, http.MethodGet, "/health", "")
	if health.Code != http.StatusOK {
		t.Fatalf("/health status = %d, want 200", health.Code)
	}
	if got := strings.TrimSpace(health.Body.String()); got != `{"status":"ok"}` {
		t.Errorf("/health body = %q, want {\"status\":\"ok\"}", got)
	}

	// /v1/index -> {"items":{...}} with a non-nil object.
	idx := do(h, http.MethodGet, "/v1/index", "")
	if idx.Code != http.StatusOK {
		t.Fatalf("/v1/index status = %d, want 200", idx.Code)
	}
	if items := decode[model.IndexResponse](t, idx).Items; items == nil {
		t.Errorf("/v1/index items is null, want an object")
	}
	if !strings.Contains(idx.Body.String(), `"items"`) {
		t.Errorf("/v1/index body = %q, want an items key", idx.Body.String())
	}

	// POST /v1/bookmarks -> 201 with the frozen saved envelope.
	saved := do(h, http.MethodPost, "/v1/bookmarks", validBody)
	if saved.Code != http.StatusCreated {
		t.Fatalf("POST /v1/bookmarks status = %d, want 201 (body %s)", saved.Code, saved.Body.String())
	}
	var keys map[string]any
	if err := json.Unmarshal(saved.Body.Bytes(), &keys); err != nil {
		t.Fatalf("decode save response %q: %v", saved.Body.String(), err)
	}
	for _, key := range []string{"status", "tweet_id", "url", "slug", "saved_at"} {
		if _, ok := keys[key]; !ok {
			t.Errorf("save response missing %q: %v", key, keys)
		}
	}
	if keys["status"] != "saved" || keys["slug"] != "linux" {
		t.Errorf("save response = %v, want status=saved slug=linux", keys)
	}

	// The duplicate path still answers 409 with the duplicate envelope.
	dup := do(h, http.MethodPost, "/v1/bookmarks", validBody)
	if dup.Code != http.StatusConflict {
		t.Fatalf("duplicate status = %d, want 409 (body %s)", dup.Code, dup.Body.String())
	}
	if body := decode[model.DuplicateResponse](t, dup); body.Status != "duplicate" || body.TweetID != "123" {
		t.Errorf("duplicate body = %+v, want status=duplicate tweet_id=123", body)
	}

	// Wrong methods on frozen routes are still 405, not the shell.
	for _, tc := range []struct {
		method string
		path   string
	}{
		{http.MethodPost, "/health"},
		{http.MethodDelete, "/health"},
		{http.MethodGet, "/v1/bookmarks"},
		{http.MethodPost, "/api/gallery/collections"},
		{http.MethodDelete, "/api/gallery/collections/linux/posts"},
	} {
		rec := do(h, tc.method, tc.path, "")
		if rec.Code != http.StatusMethodNotAllowed {
			t.Errorf("%s %s status = %d, want 405", tc.method, tc.path, rec.Code)
		}
		if strings.Contains(rec.Body.String(), `<div id="root">`) {
			t.Errorf("%s %s served the SPA shell", tc.method, tc.path)
		}
	}
}

// --------------------------------------------------------------- PROD-05

func TestMissingDistDegradesGracefully(t *testing.T) {
	missing := filepath.Join(t.TempDir(), "no-such-dist")
	var logs bytes.Buffer
	h, dir := newServedServer(t, missing, logging.New(&logs))
	_ = dir

	// Construction succeeded (no panic) and logged one actionable message.
	logged := logs.String()
	if !strings.Contains(logged, "built web app not found") {
		t.Errorf("startup log does not report the missing build: %q", logged)
	}
	if !strings.Contains(logged, missing) {
		t.Errorf("startup log does not name the expected directory %q: %q", missing, logged)
	}
	if !strings.Contains(logged, "pnpm build") {
		t.Errorf("startup log does not say how to build the SPA: %q", logged)
	}
	if n := strings.Count(logged, "built web app not found"); n != 1 {
		t.Errorf("missing-build message logged %d times, want exactly once", n)
	}

	// GET / is an observable, non-200 hint that never pretends to be a page.
	root := do(h, http.MethodGet, "/", "")
	if root.Code == http.StatusOK {
		t.Errorf("GET / returned 200 with no SPA built (body %s)", root.Body.String())
	}
	if root.Code != http.StatusServiceUnavailable {
		t.Errorf("GET / status = %d, want 503", root.Code)
	}
	body := root.Body.String()
	if !strings.Contains(body, missing) || !strings.Contains(body, "pnpm build") {
		t.Errorf("GET / body is not actionable: %q", body)
	}

	// The API is completely unaffected.
	if rec := do(h, http.MethodGet, "/health", ""); rec.Code != http.StatusOK {
		t.Errorf("/health status = %d, want 200", rec.Code)
	}
	if rec := do(h, http.MethodGet, "/v1/index", ""); rec.Code != http.StatusOK {
		t.Errorf("/v1/index status = %d, want 200", rec.Code)
	}
	if rec := do(h, http.MethodGet, "/api/gallery/collections", ""); rec.Code != http.StatusOK {
		t.Errorf("/api/gallery/collections status = %d, want 200 (body %s)", rec.Code, rec.Body.String())
	}

	// Without a build there are no client routes, so unmatched paths keep the
	// pre-SPA 404 contract for every method.
	for _, method := range []string{http.MethodGet, http.MethodPost, http.MethodPut, http.MethodDelete} {
		for _, p := range []string{"/nope", "/categories", "/settings", "/collections/linux"} {
			rec := do(h, method, p, "")
			if rec.Code != http.StatusNotFound {
				t.Errorf("%s %s status = %d, want 404 while the SPA is unbuilt", method, p, rec.Code)
			}
		}
	}
}
