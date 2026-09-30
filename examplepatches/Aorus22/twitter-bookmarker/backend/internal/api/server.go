// Package api exposes the HTTP contract over the persistence layer. It is
// loopback-only by default; when it is moved onto another interface, every
// request from a peer that is not this machine must carry a bearer token.
package api

import (
	"crypto/subtle"
	"net/http"
	"strings"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
)

// maxBodyBytes caps the request body (PRD: strict, bounded payloads).
const maxBodyBytes = 1 << 20 // 1 MiB

// healthPath is how a client checks reachability before it has proved anything,
// so both credential rules leave it open. It answers with no bookmark data.
const healthPath = "/health"

// BookmarkStore is the persistence surface the API needs.
//
// Index is part of it rather than a separate interface because both read the
// same database, so there is no second thing to keep in step.
//
// Delete and Reassign are the curation surface. They live here, on the bookmark
// resource, and deliberately *not* under /api/gallery: the gallery API stays
// strictly GET-only (API-07, PRD-2 §36), so a read path can never be turned into
// a write path by adding a method to it. Curation is an explicit, user-initiated
// mutation of a bookmark, which is what /v1/bookmarks already is.
type BookmarkStore interface {
	Save(req model.SaveRequest) (model.SaveResponse, error)
	Index() (map[string]model.IndexEntry, error)
	Delete(tweetID string) error
	Reassign(tweetID, slug string) error
}

type server struct {
	store  BookmarkStore
	log    *logging.Logger
	static *staticHandler
}

// NewServer builds the HTTP handler. One process serves both APIs and the built
// web app (PRD-2 §11): the API patterns are registered first, so they always
// take precedence, and the root pattern serves web/dist plus the SPA fallback.
//
// Routes are registered without a method and gated by methodGate because a
// method-less catch-all shadows the ServeMux's automatic 405 (see methodGate).
//
// The dist directory is resolved through config.WebDir (TWITTER_BOOKMARKER_WEB_DIR
// override, then cwd, then executable-relative candidates) and reported once.
// A missing build never prevents construction: the API keeps working and "/"
// explains how to build the app (PROD-05).
func NewServer(store BookmarkStore, log *logging.Logger) http.Handler {
	if log == nil {
		log = logging.Discard()
	}
	webDir, webDirFound := config.WebDir()
	if webDirFound {
		log.WebAssets(webDir)
	} else {
		log.WebAssetsMissing(webDir)
	}
	s := &server{
		store:  store,
		log:    log,
		static: newStaticHandler(webDir),
	}

	mux := http.NewServeMux()
	mux.HandleFunc(healthPath, methodGate(http.MethodGet, s.handleHealth))
	mux.HandleFunc("/v1/index", methodGate(http.MethodGet, s.handleIndex))
	mux.HandleFunc("/v1/bookmarks", methodGate(http.MethodPost, s.handleSave))
	// Curation (PRD-2 §5 amended). Two separate single-method patterns rather
	// than one path accepting DELETE and PUT: methodGate then stays a one-method
	// gate, and "set this bookmark's collection" reads as the sub-resource it is.
	// Registered before the /v1/ catch-all, which only sees paths no pattern
	// matched.
	mux.HandleFunc("/v1/bookmarks/{tweet_id}", methodGate(http.MethodDelete, s.handleDeleteBookmark))
	mux.HandleFunc("/v1/bookmarks/{tweet_id}/collection", methodGate(http.MethodPut, s.handleReassignBookmark))
	// Read-only gallery API (PRD-2 §36). A non-GET method on either pattern is
	// answered with 405, so the gallery API can never be written to. Curation is
	// on /v1/bookmarks above, which keeps this guarantee intact rather than
	// carving an exception into it.
	mux.HandleFunc("/api/gallery/collections", methodGate(http.MethodGet, s.handleGalleryCollections))
	mux.HandleFunc("/api/gallery/collections/{slug}/posts", methodGate(http.MethodGet, s.handleGalleryPosts))

	// Unknown /api/* and /v1/* paths are API 404s for every method, never the
	// SPA shell (PROD-02, PROD-04, PRD-2 §56/§57). The trailing-slash patterns
	// cover the subtrees; the exact patterns answer /api and /v1 without the
	// ServeMux's subtree redirect.
	mux.HandleFunc("/api", s.handleUnknownAPI)
	mux.HandleFunc("/api/", s.handleUnknownAPI)
	mux.HandleFunc("/v1", s.handleUnknownAPI)
	mux.HandleFunc("/v1/", s.handleUnknownAPI)

	// Everything else is the built SPA: a real file from web/dist, or the
	// index.html fallback for a client route (PROD-01, PROD-03).
	mux.HandleFunc("/", s.handleStatic)

	user, password, basicAuth := config.BasicAuth()
	return withExtensionCORS(withBasicAuth(withToken(mux, config.Token()), user, password, basicAuth))
}

// protectedPathPrefixes are the API surfaces a token covers when one is
// configured. /health and the built web app stay open: neither answers with
// bookmark data, and /health is how a client checks reachability before it has
// proved anything. This list is deliberately written from the routes registered
// above rather than from a wildcard, so a new route has to be added knowingly.
func isProtectedPath(path string) bool {
	for _, prefix := range []string{"/v1", "/api"} {
		if path == prefix || strings.HasPrefix(path, prefix+"/") {
			return true
		}
	}
	return false
}

// withToken requires a bearer token from peers that are not on this machine.
//
// Loopback is exempt, and that is the whole point: the desktop extension and a
// browser on the same host keep working with no configuration, exactly as
// before, while moving the listener onto the LAN stops being a way to publish
// the bookmarks to the network. The exemption is decided from the connection's
// own RemoteAddr and never from X-Forwarded-For, so it cannot be forged by a
// remote caller; running this server behind a reverse proxy would therefore put
// every request behind the token, which is the safe direction.
//
// A proxy that runs *on* this machine — a tunnel, typically — arrives from
// loopback and is therefore invisible to this rule. That is the gap withBasicAuth
// fills, and it is the reason to set both when a tunnel is in play: the token
// covers a reachable interface, the basic credential covers the proxied path.
func withToken(next http.Handler, token string) http.Handler {
	if token == "" {
		return next
	}
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if !isProtectedPath(r.URL.Path) || config.IsLoopback(r.RemoteAddr) {
			next.ServeHTTP(w, r)
			return
		}
		if !bearerMatches(token, r.Header.Get("Authorization")) {
			w.Header().Set("WWW-Authenticate", `Bearer realm="twitter-bookmarker"`)
			writeJSON(w, http.StatusUnauthorized, model.ErrorResponse{
				Status: "error",
				Reason: "unauthorized",
			})
			return
		}
		next.ServeHTTP(w, r)
	})
}

// bearerMatches compares the Authorization header against the configured token
// in constant time, so a wrong token cannot be recovered by timing.
//
// An empty expected token matches nothing. withToken already returns early in
// that case, but the guard lives here too: a future caller that forgets the
// early return must not end up accepting an empty credential.
func bearerMatches(expected, header string) bool {
	const scheme = "Bearer "
	if expected == "" {
		return false
	}
	if len(header) < len(scheme) || !strings.EqualFold(header[:len(scheme)], scheme) {
		return false
	}
	presented := strings.TrimSpace(header[len(scheme):])
	// ConstantTimeCompare returns 0 for different lengths as well, so the length
	// check is folded in rather than branched on.
	return subtle.ConstantTimeCompare([]byte(presented), []byte(expected)) == 1
}

// withBasicAuth puts the browser's own password dialog in front of traffic that
// arrived through a tunnel.
//
// The gap it fills is narrow and worth stating plainly. withToken above cannot
// see tunnel traffic at all: cloudflared connects from loopback, so a public
// request arrives looking exactly like a local one and skips the token rule
// entirely. The browser gallery, meanwhile, has no field to put a bearer token
// in. So the public surface needs a credential the browser can supply by itself,
// which is what HTTP Basic is: answer 401 with a WWW-Authenticate header and the
// browser asks, natively, with no page of ours involved.
//
// What counts as "through a tunnel" is decided by the forwarding headers
// cloudflared adds rather than by the peer address, because the peer address is
// loopback on both sides of that line. That inverts the stance withToken takes,
// so the direction is what makes it safe: a request is exempt only when it
// carries neither header, and forging extra headers can only make a caller's own
// request stricter, never looser. Dropping the headers requires running on this
// machine, which can read the database directly anyway.
//
// The bearer token is accepted here as well as in withToken, so the phone patch
// and any script keep working through the tunnel while browsers get the dialog.
// enabled comes from config.BasicAuth and is true even for a malformed value: the
// failure mode of a typo must be a challenge, not an open gallery.
func withBasicAuth(next http.Handler, user, password string, enabled bool) http.Handler {
	if !enabled {
		return next
	}
	token := config.Token()
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		if r.URL.Path == healthPath || isDirectRequest(r) || credentialsAccepted(r, token, user, password) {
			next.ServeHTTP(w, r)
			return
		}
		w.Header().Set("WWW-Authenticate", `Basic realm="twitter-bookmarker", charset="UTF-8"`)
		writeJSON(w, http.StatusUnauthorized, model.ErrorResponse{
			Status: "error",
			Reason: "unauthorized",
		})
	})
}

// credentialsAccepted reports whether the request presents either credential the
// server knows: the configured bearer token, or the browser's basic credentials.
func credentialsAccepted(r *http.Request, token, user, password string) bool {
	if token != "" && bearerMatches(token, r.Header.Get("Authorization")) {
		return true
	}
	presentedUser, presentedPassword, ok := r.BasicAuth()
	if !ok {
		return false
	}
	return credentialMatches(user, presentedUser) && credentialMatches(password, presentedPassword)
}

// credentialMatches compares one half of a basic credential in constant time. An
// empty expected value matches nothing, so a half-configured credential cannot be
// satisfied by sending nothing.
func credentialMatches(expected, presented string) bool {
	if expected == "" {
		return false
	}
	return subtle.ConstantTimeCompare([]byte(expected), []byte(presented)) == 1
}

// isDirectRequest reports whether the request came straight from this machine
// rather than through the tunnel: a loopback peer carrying neither of the headers
// a Cloudflare tunnel adds. Both are checked because a tunnel always adds at
// least one, so their absence is what a local caller looks like.
func isDirectRequest(r *http.Request) bool {
	if r.Header.Get("CF-Connecting-IP") != "" || r.Header.Get("X-Forwarded-For") != "" {
		return false
	}
	return config.IsLoopback(r.RemoteAddr)
}

// withExtensionCORS echoes an extension origin only. Arbitrary web origins are
// never granted access, and "*" is never returned.
//
// It wraps the token check rather than sitting inside it, because a browser never
// sends Authorization on a preflight: an OPTIONS request has to be answered here,
// with the headers that let the real request follow, before any authentication
// happens.
func withExtensionCORS(next http.Handler) http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, r *http.Request) {
		origin := r.Header.Get("Origin")
		if isExtensionOrigin(origin) {
			w.Header().Set("Access-Control-Allow-Origin", origin)
			w.Header().Set("Vary", "Origin")
			w.Header().Set("Access-Control-Allow-Methods", "GET, POST, OPTIONS")
			w.Header().Set("Access-Control-Allow-Headers", "Authorization, Content-Type")
		}
		if r.Method == http.MethodOptions {
			if isExtensionOrigin(origin) {
				w.WriteHeader(http.StatusNoContent)
				return
			}
			http.Error(w, "method not allowed", http.StatusMethodNotAllowed)
			return
		}
		next.ServeHTTP(w, r)
	})
}

func isExtensionOrigin(origin string) bool {
	return strings.HasPrefix(origin, "chrome-extension://") ||
		strings.HasPrefix(origin, "moz-extension://")
}
