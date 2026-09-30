package api

import (
	"encoding/base64"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
)

// The credentials these tests configure. They are fixtures, not secrets: the real
// password is read from the environment and never appears here.
const (
	testBasicUser = "aorus"
	testBasicPass = "correct-horse-battery"
)

// basicHeader builds the header a browser sends after its dialog.
func basicHeader(user, password string) string {
	return "Basic " + base64.StdEncoding.EncodeToString([]byte(user+":"+password))
}

// proxiedRequest is what a tunnel request looks like from inside the server: it
// arrives from loopback and carries a header cloudflared added. That pairing is
// precisely why the peer address alone cannot tell public from local.
func proxiedRequest(method, path string) *http.Request {
	req := httptest.NewRequest(method, path, nil)
	req.RemoteAddr = loopbackPeer
	req.Header.Set("X-Forwarded-For", "203.0.113.9")
	return req
}

// teapot stands in for the rest of the chain: if it runs, authentication passed.
func teapot() http.Handler {
	return http.HandlerFunc(func(w http.ResponseWriter, _ *http.Request) {
		w.WriteHeader(http.StatusTeapot)
	})
}

// emptyStore is a minimal BookmarkStore for the chain test. It answers with
// nothing rather than failing, so a 200 means the request reached the handler
// instead of stopping at a credential check.
type emptyStore struct{}

func (emptyStore) Save(model.SaveRequest) (model.SaveResponse, error) {
	return model.SaveResponse{}, nil
}

func (emptyStore) Index() (map[string]model.IndexEntry, error) {
	return map[string]model.IndexEntry{}, nil
}

func (emptyStore) Delete(string) error { return nil }

func (emptyStore) Reassign(string, string) error { return nil }

func TestWithBasicAuthDisabledLetsProxiedRequestsThrough(t *testing.T) {
	handler := withBasicAuth(teapot(), "", "", false)

	rec := httptest.NewRecorder()
	handler.ServeHTTP(rec, proxiedRequest(http.MethodGet, "/v1/index"))

	if rec.Code != http.StatusTeapot {
		t.Fatalf("status = %d, want the wrapped handler to run (418): with no credential configured nothing is gated", rec.Code)
	}
}

func TestWithBasicAuthDecidesByForwardingHeaders(t *testing.T) {
	const token = "s3cret-token"

	cases := []struct {
		name         string
		path         string
		peer         string
		cfConnecting string
		forwarded    bool
		header       string
		token        string
		wantStatus   int
	}{
		{
			name: "proxied API request without credentials", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, wantStatus: http.StatusUnauthorized,
		},
		{
			name: "proxied document without credentials", path: "/",
			peer: loopbackPeer, forwarded: true, wantStatus: http.StatusUnauthorized,
		},
		{
			name: "proxied with the browser credentials", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: basicHeader(testBasicUser, testBasicPass),
			wantStatus: http.StatusTeapot,
		},
		{
			name: "proxied document with the browser credentials", path: "/",
			peer: loopbackPeer, forwarded: true, header: basicHeader(testBasicUser, testBasicPass),
			wantStatus: http.StatusTeapot,
		},
		{
			name: "proxied with the wrong password", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: basicHeader(testBasicUser, "nope"),
			wantStatus: http.StatusUnauthorized,
		},
		{
			name: "proxied with the wrong user", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: basicHeader("someone-else", testBasicPass),
			wantStatus: http.StatusUnauthorized,
		},
		{
			name: "proxied with a bearer token when one is configured", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: "Bearer " + token, token: token,
			wantStatus: http.StatusTeapot,
		},
		{
			name: "proxied with a bearer token when none is configured", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: "Bearer " + token,
			wantStatus: http.StatusUnauthorized,
		},
		{
			name: "proxied with a wrong bearer token", path: "/v1/index",
			peer: loopbackPeer, forwarded: true, header: "Bearer nope", token: token,
			wantStatus: http.StatusUnauthorized,
		},
		{
			name: "straight from this machine", path: "/v1/index",
			peer: loopbackPeer, wantStatus: http.StatusTeapot,
		},
		{
			name: "straight from this machine but with a forwarding header", path: "/v1/index",
			peer: loopbackPeer, cfConnecting: "203.0.113.9", wantStatus: http.StatusUnauthorized,
		},
		{
			name: "another host with no forwarding header", path: "/v1/index",
			peer: remotePeer, wantStatus: http.StatusUnauthorized,
		},
		{
			name: "health through the tunnel", path: healthPath,
			peer: loopbackPeer, forwarded: true, wantStatus: http.StatusTeapot,
		},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			if tc.token != "" {
				t.Setenv(config.EnvToken, tc.token)
			}
			handler := withBasicAuth(teapot(), testBasicUser, testBasicPass, true)

			req := httptest.NewRequest(http.MethodGet, tc.path, nil)
			req.RemoteAddr = tc.peer
			if tc.forwarded {
				req.Header.Set("X-Forwarded-For", "203.0.113.9")
			}
			if tc.cfConnecting != "" {
				req.Header.Set("CF-Connecting-IP", tc.cfConnecting)
			}
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

// TestBasicAuthChallengeIsBrowserShaped pins the response that makes the browser
// open its own dialog: a 401 with a Basic challenge. Without that header the
// browser shows the body instead, which is the difference between a password
// prompt and a broken page.
func TestBasicAuthChallengeIsBrowserShaped(t *testing.T) {
	handler := withBasicAuth(teapot(), testBasicUser, testBasicPass, true)

	rec := httptest.NewRecorder()
	handler.ServeHTTP(rec, proxiedRequest(http.MethodGet, "/"))

	if rec.Code != http.StatusUnauthorized {
		t.Fatalf("status = %d, want 401", rec.Code)
	}
	challenge := rec.Header().Get("WWW-Authenticate")
	if !strings.HasPrefix(challenge, "Basic ") || !strings.Contains(challenge, `realm="twitter-bookmarker"`) {
		t.Fatalf("WWW-Authenticate = %q, want a Basic challenge with a realm", challenge)
	}

	var body model.ErrorResponse
	if err := json.Unmarshal(rec.Body.Bytes(), &body); err != nil {
		t.Fatalf("decode 401 body: %v", err)
	}
	// The body never echoes the expected user or password.
	if body.Status != "error" || body.Reason != "unauthorized" {
		t.Fatalf("401 body = %+v, want status=error reason=unauthorized", body)
	}
	if strings.Contains(rec.Body.String(), testBasicPass) {
		t.Fatal("401 body leaks the configured password")
	}
}

// TestMalformedBasicAuthFailsClosed covers the value ValidateBasicAuth would have
// rejected at startup. A server that somehow runs with it must challenge every
// proxied request rather than treat a missing half as "no password required".
func TestMalformedBasicAuthFailsClosed(t *testing.T) {
	for _, tc := range []struct{ name, user, password string }{
		{name: "empty user", user: "", password: testBasicPass},
		{name: "empty password", user: testBasicUser, password: ""},
		{name: "both empty", user: "", password: ""},
	} {
		t.Run(tc.name, func(t *testing.T) {
			handler := withBasicAuth(teapot(), tc.user, tc.password, true)

			// Nothing can satisfy it, not even the empty credential itself.
			for _, header := range []string{"", basicHeader("", ""), basicHeader("", tc.password), basicHeader(tc.user, "")} {
				req := proxiedRequest(http.MethodGet, "/v1/index")
				if header != "" {
					req.Header.Set("Authorization", header)
				}
				rec := httptest.NewRecorder()
				handler.ServeHTTP(rec, req)
				if rec.Code != http.StatusUnauthorized {
					t.Fatalf("header %q: status = %d, want 401", header, rec.Code)
				}
			}
		})
	}
}

// TestServerBasicAuthProtectsThePublicSurface runs the real chain: configuring
// the credential must gate the document, the gallery API and the bookmark API for
// tunnel traffic, while leaving this machine and /health untouched.
func TestServerBasicAuthProtectsThePublicSurface(t *testing.T) {
	t.Setenv(config.EnvBasicAuth, testBasicUser+":"+testBasicPass)
	handler := NewServer(emptyStore{}, logging.Discard())

	cases := []struct {
		name   string
		path   string
		mutate func(*http.Request)
		want   func(int) bool
	}{
		{
			name: "proxied document wants the password", path: "/",
			mutate: func(r *http.Request) { r.RemoteAddr = loopbackPeer; r.Header.Set("X-Forwarded-For", "203.0.113.9") },
			want:   func(code int) bool { return code == http.StatusUnauthorized },
		},
		{
			name: "proxied gallery API wants the password", path: "/api/gallery/collections",
			mutate: func(r *http.Request) { r.RemoteAddr = loopbackPeer; r.Header.Set("X-Forwarded-For", "203.0.113.9") },
			want:   func(code int) bool { return code == http.StatusUnauthorized },
		},
		{
			name: "proxied bookmark API wants the password", path: "/v1/index",
			mutate: func(r *http.Request) { r.RemoteAddr = loopbackPeer; r.Header.Set("X-Forwarded-For", "203.0.113.9") },
			want:   func(code int) bool { return code == http.StatusUnauthorized },
		},
		{
			name: "the password opens the proxied bookmark API", path: "/v1/index",
			mutate: func(r *http.Request) {
				r.RemoteAddr = loopbackPeer
				r.Header.Set("X-Forwarded-For", "203.0.113.9")
				r.Header.Set("Authorization", basicHeader(testBasicUser, testBasicPass))
			},
			want: func(code int) bool { return code == http.StatusOK },
		},
		{
			name: "the password opens the proxied gallery API", path: "/api/gallery/collections",
			mutate: func(r *http.Request) {
				r.RemoteAddr = loopbackPeer
				r.Header.Set("X-Forwarded-For", "203.0.113.9")
				r.Header.Set("Authorization", basicHeader(testBasicUser, testBasicPass))
			},
			want: func(code int) bool { return code == http.StatusOK },
		},
		{
			name: "health stays open through the tunnel", path: healthPath,
			mutate: func(r *http.Request) { r.RemoteAddr = loopbackPeer; r.Header.Set("X-Forwarded-For", "203.0.113.9") },
			want:   func(code int) bool { return code == http.StatusOK },
		},
		{
			name: "this machine needs no password", path: "/v1/index",
			mutate: func(r *http.Request) { r.RemoteAddr = loopbackPeer },
			want:   func(code int) bool { return code == http.StatusOK },
		},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			req := httptest.NewRequest(http.MethodGet, tc.path, nil)
			tc.mutate(req)
			rec := httptest.NewRecorder()
			handler.ServeHTTP(rec, req)
			if !tc.want(rec.Code) {
				t.Fatalf("GET %s = %d, which the case rejects (body %s)", tc.path, rec.Code, rec.Body.String())
			}
		})
	}
}
