package api

import (
	"fmt"
	"io/fs"
	"net/http"
	"os"
	"path"
	"strings"

	"twitter-bookmarker/internal/model"
)

// The static side of the production server (PROD-01…PROD-05, PRD-2 §11/§56/§57).
//
// One Go process serves both the gallery API and the built SPA: the API routes
// are registered on the mux and therefore always win, and this handler is the
// root catch-all behind them.

// assetsPrefix is Vite's build-output namespace. Every file it emits with a
// content hash lands under /assets/, so a miss there is a genuinely missing
// build artifact and must 404 rather than silently become the SPA shell.
const assetsPrefix = "/assets/"

// indexFile is the SPA shell served for client routes.
const indexFile = "index.html"

const (
	// immutableCache is sent for hashed build assets: their name changes with
	// their content, so they can be cached forever.
	immutableCache = "public, max-age=31536000, immutable"
	// noCache is sent for the shell (and unhashed extras): it must be
	// revalidated on every load or a rebuild would be invisible.
	noCache = "no-cache"
)

// staticHandler serves web/dist and falls back to index.html for client routes.
type staticHandler struct {
	webDir string
	fsys   fs.FS
}

// newStaticHandler builds the handler for a resolved dist directory. The
// directory is not required to exist: every lookup degrades to a miss.
func newStaticHandler(webDir string) *staticHandler {
	return &staticHandler{webDir: webDir, fsys: os.DirFS(webDir)}
}

// spaAvailable reports whether the shell is actually readable. Checking per
// request (rather than caching the answer at construction) means a `make web`
// while the server runs starts working without a restart.
func (s *staticHandler) spaAvailable() bool {
	info, err := fs.Stat(s.fsys, indexFile)
	return err == nil && !info.IsDir()
}

// handleStatic is the root handler: static file first, then the SPA fallback.
func (s *server) handleStatic(w http.ResponseWriter, r *http.Request) {
	// Defence in depth. The API patterns are registered before this catch-all,
	// so they win; if a future edit ever routes one here it must still answer
	// as an API error rather than a page (PROD-02).
	if isAPIPath(r.URL.Path) {
		s.handleUnknownAPI(w, r)
		return
	}

	// No build: there are no client routes to fall back to. "/" explains how
	// to build the app; every other unmatched path stays a plain 404, which
	// keeps the pre-SPA 404 contract for unknown paths intact (PROD-05).
	if !s.static.spaAvailable() {
		if r.URL.Path == "/" || r.URL.Path == "" {
			s.writeSPAMissing(w)
			return
		}
		http.NotFound(w, r)
		return
	}

	// Only readable methods reach the SPA. A POST/PUT/... to a frontend path
	// must not return the shell (PROD-03).
	if !isReadableMethod(r.Method) {
		writeMethodNotAllowed(w)
		return
	}

	// path.Clean removes "." and ".." segments and collapses a leading "//",
	// so the name handed to the filesystem is always relative to web/dist.
	// os.DirFS additionally rejects any name that is not an fs.ValidPath, so
	// static serving can never become an arbitrary filesystem endpoint
	// (PRD-2 §70).
	name := strings.TrimPrefix(path.Clean("/"+r.URL.Path), "/")
	if name == "" {
		s.serveIndex(w, r)
		return
	}

	if info, err := fs.Stat(s.static.fsys, name); err == nil && !info.IsDir() {
		s.serveFile(w, r, name)
		return
	}

	// A miss under the asset namespace is a broken build reference, not a
	// client route: 404 so it fails loudly instead of executing the shell as
	// JavaScript (PROD-03).
	if isAssetPath(r.URL.Path) {
		http.NotFound(w, r)
		return
	}

	s.serveIndex(w, r)
}

// serveFile serves one existing file out of web/dist.
func (s *server) serveFile(w http.ResponseWriter, r *http.Request, name string) {
	if isHashedAsset(name) {
		w.Header().Set("Cache-Control", immutableCache)
	} else {
		w.Header().Set("Cache-Control", noCache)
	}
	// http.ServeFileFS supplies the content type (by extension, then by
	// sniffing), Range and conditional-request handling.
	http.ServeFileFS(w, r, s.static.fsys, name)
}

// serveIndex serves the SPA shell for a client route (PROD-03). It is never
// immutably cached: a rebuild must be visible on the next load.
func (s *server) serveIndex(w http.ResponseWriter, r *http.Request) {
	w.Header().Set("Cache-Control", noCache)
	http.ServeFileFS(w, r, s.static.fsys, indexFile)
}

// handleUnknownAPI answers an unmatched /api/* or /v1/* path with the existing
// error envelope and a 404, never the SPA shell (PROD-04, PRD-2 §57). The
// reason never echoes the path, matching the rest of the API.
func (s *server) handleUnknownAPI(w http.ResponseWriter, r *http.Request) {
	s.log.InvalidRequest("unknown api path")
	writeJSON(w, http.StatusNotFound, model.ErrorResponse{
		Status: "error",
		Reason: "not found",
	})
}

// writeSPAMissing explains the degraded state in the response body so a
// developer who opens the URL sees what to do (PROD-05). The equivalent
// message is logged once at construction.
func (s *server) writeSPAMissing(w http.ResponseWriter) {
	w.Header().Set("Content-Type", "text/plain; charset=utf-8")
	w.Header().Set("Cache-Control", noCache)
	w.WriteHeader(http.StatusServiceUnavailable)
	fmt.Fprintf(w, "web gallery not built\n\n"+
		"Built SPA directory not found at:\n  %s\n\n"+
		"Build it with:\n"+
		"  make web          # or: cd web && pnpm build\n\n"+
		"The gallery API is unaffected: /api/gallery/collections is available.\n", s.static.webDir)
}

// isAPIPath reports whether a path belongs to the API surface. It exists so the
// static handler can refuse to page-serve an API prefix even if the mux ever
// routes one here (PROD-02).
func isAPIPath(p string) bool {
	switch p {
	case "/health", "/api", "/v1":
		return true
	}
	return strings.HasPrefix(p, "/api/") || strings.HasPrefix(p, "/v1/")
}

// isAssetPath reports whether a path is a static-file reference rather than a
// client route.
//
// The rule that separates the two (PROD-03): /assets/ is reserved for build
// output, and a root-level name carrying an extension (favicon.svg,
// robots.txt) is a file too. Everything else unmatched is a client route.
// A generic "the path has an extension" test cannot be used because a valid
// client route in this app is /collections/linux.
func isAssetPath(p string) bool {
	if strings.HasPrefix(p, assetsPrefix) {
		return true
	}
	name := strings.TrimPrefix(path.Clean("/"+p), "/")
	return name != "" && !strings.Contains(name, "/") && strings.Contains(path.Base(name), ".")
}

// isHashedAsset reports whether the served file is a content-hashed build
// artifact. Vite writes /assets/<name>-<hash>.<ext>; those names are immutable.
func isHashedAsset(name string) bool {
	return strings.HasPrefix(name, strings.TrimPrefix(assetsPrefix, "/"))
}

// isReadableMethod reports whether a method may be answered from static/SPA
// content. The SPA fallback and static files are read-only.
func isReadableMethod(method string) bool {
	return method == http.MethodGet || method == http.MethodHead
}

// writeMethodNotAllowed rejects a write attempt aimed at static/SPA content.
func writeMethodNotAllowed(w http.ResponseWriter) {
	w.Header().Set("Allow", "GET, HEAD")
	http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
}

// methodGate answers a known API route whose method does not match with a 405.
//
// Known routes are registered without a method because a method-less catch-all
// shadows the ServeMux's own method matching: Go's mux only emits its automatic
// 405 when *no* registered pattern matches, and a "/" or "/api/" catch-all does
// match a wrong-method request. Enforcing the method here keeps
// `POST /health` and `GET /v1/bookmarks` at 405 while unknown /api/* paths fall
// through to the JSON 404 (PROD-02, PROD-04).
func methodGate(allowed string, h http.HandlerFunc) http.HandlerFunc {
	return func(w http.ResponseWriter, r *http.Request) {
		if r.Method != allowed && !(allowed == http.MethodGet && r.Method == http.MethodHead) {
			w.Header().Set("Allow", allowHeader(allowed))
			http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
			return
		}
		h(w, r)
	}
}

// allowHeader mirrors the Go ServeMux: a GET route also answers HEAD.
func allowHeader(allowed string) string {
	if allowed == http.MethodGet {
		return "GET, HEAD"
	}
	return allowed
}
