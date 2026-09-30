package api

import (
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"os"
	"strings"
	"testing"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
)

// TestMain clears $TWITTER_BOOKMARKER_TOKEN once for the whole test binary.
// NewServer reads the token from the environment, so a developer who exports one
// to run the server for real would otherwise watch unrelated tests answer 401.
// Tests that want a token set it themselves with t.Setenv.
//
// $TWITTER_BOOKMARKER_BASIC_AUTH is cleared for the same reason: it gates the
// public surface, so leaving a real password in the environment would turn every
// proxied test request into a 401.
func TestMain(m *testing.M) {
	_ = os.Unsetenv(config.EnvToken)
	_ = os.Unsetenv(config.EnvBasicAuth)
	os.Exit(m.Run())
}

// loopbackPeer and remotePeer are the two RemoteAddr shapes the token middleware
// distinguishes. httptest.NewRequest already defaults to the TEST-NET address,
// so remotePeer is what an unchanged request looks like.
const (
	loopbackPeer = "127.0.0.1:51234"
	remotePeer   = "192.168.1.44:51234"
)

func TestBearerMatches(t *testing.T) {
	const token = "s3cret-token"

	cases := []struct {
		name   string
		header string
		want   bool
	}{
		{name: "exact", header: "Bearer s3cret-token", want: true},
		{name: "scheme is case insensitive", header: "bearer s3cret-token", want: true},
		{name: "surrounding space around the token", header: "Bearer   s3cret-token  ", want: true},
		{name: "missing scheme", header: "s3cret-token", want: false},
		{name: "empty header", header: "", want: false},
		{name: "scheme only", header: "Bearer ", want: false},
		{name: "wrong token", header: "Bearer s3cret-toke", want: false},
		{name: "prefix of the token", header: "Bearer s3cret", want: false},
		{name: "token plus suffix", header: "Bearer s3cret-token-x", want: false},
		{name: "basic scheme", header: "Basic s3cret-token", want: false},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			if got := bearerMatches(token, tc.header); got != tc.want {
				t.Fatalf("bearerMatches(%q, %q) = %v, want %v", token, tc.header, got, tc.want)
			}
		})
	}

	// A configured token is never satisfied by an unconfigured client, and an
	// empty expected token matches nothing at all — not even an empty header.
	if bearerMatches("", "Bearer ") {
		t.Fatal(`bearerMatches("", "Bearer ") = true, want false`)
	}
	if bearerMatches("", "") {
		t.Fatal(`bearerMatches("", "") = true, want false`)
	}
}

func TestIsProtectedPath(t *testing.T) {
	cases := []struct {
		path string
		want bool
	}{
		{path: "/v1", want: true},
		{path: "/v1/", want: true},
		{path: "/v1/index", want: true},
		{path: "/v1/bookmarks", want: true},
		{path: "/v1/bookmarks/123", want: true},
		{path: "/api", want: true},
		{path: "/api/gallery/collections", want: true},
		{path: "/health", want: false},
		{path: "/", want: false},
		{path: "/index.html", want: false},
		{path: "/v10", want: false},
		{path: "/apifoo", want: false},
	}

	for _, tc := range cases {
		t.Run(tc.path, func(t *testing.T) {
			if got := isProtectedPath(tc.path); got != tc.want {
				t.Fatalf("isProtectedPath(%q) = %v, want %v", tc.path, got, tc.want)
			}
		})
	}
}

func TestWithTokenWithoutTokenIsTransparent(t *testing.T) {
	handler := withToken(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusTeapot)
	}), "")

	req := httptest.NewRequest(http.MethodGet, "/v1/index", nil)
	req.RemoteAddr = remotePeer
	rec := httptest.NewRecorder()
	handler.ServeHTTP(rec, req)

	if rec.Code != http.StatusTeapot {
		t.Fatalf("status = %d, want the wrapped handler to run (418)", rec.Code)
	}
}

func TestWithTokenDecidesByPeer(t *testing.T) {
	const token = "s3cret-token"

	cases := []struct {
		name       string
		path       string
		peer       string
		header     string
		wantStatus int
	}{
		{name: "loopback needs no token", path: "/v1/index", peer: loopbackPeer, wantStatus: http.StatusTeapot},
		{name: "loopback ignores a wrong token", path: "/v1/index", peer: loopbackPeer, header: "Bearer nope", wantStatus: http.StatusTeapot},
		{name: "remote with the right token", path: "/v1/index", peer: remotePeer, header: "Bearer " + token, wantStatus: http.StatusTeapot},
		{name: "remote without a token", path: "/v1/index", peer: remotePeer, wantStatus: http.StatusUnauthorized},
		{name: "remote with a wrong token", path: "/v1/index", peer: remotePeer, header: "Bearer nope", wantStatus: http.StatusUnauthorized},
		{name: "remote write without a token", path: "/v1/bookmarks", peer: remotePeer, wantStatus: http.StatusUnauthorized},
		{name: "remote gallery without a token", path: "/api/gallery/collections", peer: remotePeer, wantStatus: http.StatusUnauthorized},
		{name: "health stays open", path: "/health", peer: remotePeer, wantStatus: http.StatusTeapot},
		{name: "static stays open", path: "/index.html", peer: remotePeer, wantStatus: http.StatusTeapot},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			handler := withToken(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
				w.WriteHeader(http.StatusTeapot)
			}), token)

			req := httptest.NewRequest(http.MethodGet, tc.path, nil)
			req.RemoteAddr = tc.peer
			if tc.header != "" {
				req.Header.Set("Authorization", tc.header)
			}
			rec := httptest.NewRecorder()
			handler.ServeHTTP(rec, req)

			if rec.Code != tc.wantStatus {
				t.Fatalf("status = %d, want %d (body %s)", rec.Code, tc.wantStatus, rec.Body.String())
			}
		})
	}
}

func TestUnauthorizedResponseShape(t *testing.T) {
	handler := withToken(http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusTeapot)
	}), "s3cret-token")

	req := httptest.NewRequest(http.MethodPost, "/v1/bookmarks", nil)
	req.RemoteAddr = remotePeer
	rec := httptest.NewRecorder()
	handler.ServeHTTP(rec, req)

	if rec.Code != http.StatusUnauthorized {
		t.Fatalf("status = %d, want 401", rec.Code)
	}
	if got := rec.Header().Get("WWW-Authenticate"); !strings.Contains(got, "Bearer") {
		t.Errorf("WWW-Authenticate = %q, want a Bearer challenge", got)
	}

	var body model.ErrorResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode 401 body: %v", err)
	}
	// The body must not echo the expected token, nor hint at its length.
	if body.Status != "error" || body.Reason != "unauthorized" {
		t.Fatalf("401 body = %+v, want status=error reason=unauthorized", body)
	}
}

// TestServerTokenChainOrder pins the ordering that makes a browser work: CORS
// answers the preflight (which never carries Authorization) before the token
// check runs, and the grant names the Authorization header so the real request
// is allowed to follow.
func TestServerTokenChainOrder(t *testing.T) {
	t.Setenv(config.EnvToken, "s3cret-token")
	handler := NewServer(nil, logging.Discard())

	preflight := httptest.NewRequest(http.MethodOptions, "/v1/bookmarks", nil)
	preflight.RemoteAddr = remotePeer
	preflight.Header.Set("Origin", "chrome-extension://abcdefghijklmnop")
	preflight.Header.Set("Access-Control-Request-Headers", "authorization,content-type")
	rec := httptest.NewRecorder()
	handler.ServeHTTP(rec, preflight)

	if rec.Code != http.StatusNoContent {
		t.Fatalf("preflight status = %d, want 204 without a token", rec.Code)
	}
	if got := rec.Header().Get("Access-Control-Allow-Headers"); !strings.Contains(got, "Authorization") {
		t.Fatalf("Access-Control-Allow-Headers = %q, want it to allow Authorization", got)
	}

	// The real request from the same remote peer is refused without the token,
	// and reaches the handler (which fails on the nil store, not on auth) with it.
	without := httptest.NewRequest(http.MethodGet, "/v1/index", nil)
	without.RemoteAddr = remotePeer
	withoutRec := httptest.NewRecorder()
	handler.ServeHTTP(withoutRec, without)
	if withoutRec.Code != http.StatusUnauthorized {
		t.Fatalf("remote GET /v1/index without a token = %d, want 401", withoutRec.Code)
	}

	with := httptest.NewRequest(http.MethodGet, "/v1/index", nil)
	with.RemoteAddr = remotePeer
	with.Header.Set("Authorization", "Bearer s3cret-token")
	withRec := httptest.NewRecorder()
	handler.ServeHTTP(withRec, with)
	if withRec.Code != http.StatusInternalServerError {
		t.Fatalf("remote GET /v1/index with the token = %d, want 500 from the nil store (auth passed)", withRec.Code)
	}

	// Public surfaces stay reachable from the same remote peer.
	health := httptest.NewRequest(http.MethodGet, "/health", nil)
	health.RemoteAddr = remotePeer
	healthRec := httptest.NewRecorder()
	handler.ServeHTTP(healthRec, health)
	if healthRec.Code != http.StatusOK {
		t.Fatalf("remote GET /health = %d, want 200", healthRec.Code)
	}

	// A loopback client is unaffected by the token being configured, which is
	// what keeps the desktop extension working with no configuration.
	local := httptest.NewRequest(http.MethodGet, "/v1/index", nil)
	local.RemoteAddr = loopbackPeer
	localRec := httptest.NewRecorder()
	handler.ServeHTTP(localRec, local)
	if localRec.Code != http.StatusInternalServerError {
		t.Fatalf("loopback GET /v1/index without a token = %d, want 500 from the nil store (auth skipped)", localRec.Code)
	}
}
