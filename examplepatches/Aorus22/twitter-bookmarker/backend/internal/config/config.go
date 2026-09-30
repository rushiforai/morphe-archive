// Package config holds the backend settings: the listen address, the bearer
// token that guards a non-loopback bind, and the storage directory. Each one is
// overridable through the environment.
package config

import (
	"fmt"
	"net"
	"os"
	"path/filepath"
	"strconv"
	"strings"
)

const (
	// Port is the default backend port, used when $TWITTER_BOOKMARKER_ADDR does
	// not name another one.
	Port = 43121

	// Host is the default host: loopback only. A bind other machines can reach
	// has to be asked for explicitly, and it then requires a token (Validate).
	Host = "127.0.0.1"

	// DirName is the storage directory name inside the user's home directory.
	// It is only the default: EnvDir overrides it.
	DirName = ".twitter-bookmarker"

	// EnvDir names the environment variable that relocates the storage
	// directory anywhere on disk, e.g.
	//
	//	TWITTER_BOOKMARKER_DIR=~/Personal/twitter-bookmarker
	//
	// An empty or unset value keeps the historical ~/.twitter-bookmarker, so
	// existing installs are unaffected. The data-cleaning scripts in the data
	// repository read the same variable.
	EnvDir = "TWITTER_BOOKMARKER_DIR"

	// EnvAddr names the environment variable that moves the listen address off
	// loopback, e.g.
	//
	//	TWITTER_BOOKMARKER_ADDR=192.168.1.20:43121
	//
	// The value must be host:port with an explicit host: ":43121" is rejected
	// because net.Listen reads it as every interface, which is exactly the
	// accident this variable must not make easy. An empty or unset value keeps
	// the historical 127.0.0.1:43121, so existing installs are unaffected.
	EnvAddr = "TWITTER_BOOKMARKER_ADDR"

	// EnvToken names the environment variable holding the bearer token that
	// every non-loopback peer must present once the server listens on anything
	// other than loopback. It is mandatory in that case — Validate refuses to
	// start without it — so an exposed port is never an unauthenticated one.
	EnvToken = "TWITTER_BOOKMARKER_TOKEN"

	// EnvBasicAuth names the environment variable holding the credentials the
	// browser asks for in its own dialog, written user:password:
	//
	//	TWITTER_BOOKMARKER_BASIC_AUTH=aorus:correct-horse-battery-staple
	//
	// It exists for the one case a token cannot cover. A tunnel terminates on
	// loopback, so its traffic is indistinguishable from a local request by peer
	// address, and a browser has nowhere to put a bearer token — yet that traffic
	// is the only traffic that arrives from outside. Setting this makes anything
	// arriving through a proxy ask for a password first, using HTTP Basic, which
	// every browser renders as a native dialog. Direct requests from this machine
	// carry no forwarding headers and stay unaffected.
	EnvBasicAuth = "TWITTER_BOOKMARKER_BASIC_AUTH"

	// DBName is the SQLite database inside the storage directory. It is the one
	// durable file the backend owns; the gallery serves nothing but what it
	// reads from here.
	DBName = "tw-bookmarker.db"

	// FileMode is the mode used for the storage directory.
	FileMode os.FileMode = 0o700

	// DBFileMode is the mode used for a database this process creates. The
	// database holds the same personal data the per-category CSVs used to, and
	// those were 0o600; the directory is 0o700 as well, so this is defence in
	// depth rather than the only protection. It is applied only on creation, so
	// a mode the user chose for an existing file is never overwritten.
	DBFileMode os.FileMode = 0o600

	// WebDirName is the default location of the built single-page app,
	// relative to the repository root (and therefore to the directory
	// `make run` starts the server from).
	WebDirName = "web/dist"

	// EnvWebDir names the environment variable that points the server at a
	// different built SPA directory, e.g.
	//
	//	TWITTER_BOOKMARKER_WEB_DIR=/tmp/dist-fixture
	//
	// It exists for tests and for unusual layouts. When set it is
	// authoritative: WebDir never silently falls back to another candidate,
	// so a test can point the server at a missing directory on purpose and
	// observe the degraded behaviour.
	EnvWebDir = "TWITTER_BOOKMARKER_WEB_DIR"
)

// DefaultAddr returns the loopback address used when $TWITTER_BOOKMARKER_ADDR
// is unset, e.g. "127.0.0.1:43121".
func DefaultAddr() string {
	return net.JoinHostPort(Host, strconv.Itoa(Port))
}

// Addr resolves the listen address from $TWITTER_BOOKMARKER_ADDR.
//
// An empty or unset value yields DefaultAddr. Anything else must be host:port
// with an explicit host and a port in 1-65535; every error names the variable,
// so a typo is reported where it was made rather than as a bind failure later.
func Addr() (string, error) {
	return resolveAddr(os.Getenv(EnvAddr))
}

// resolveAddr is Addr's pure core, so the accepted shapes can be tested without
// touching the process environment.
func resolveAddr(raw string) (string, error) {
	value := strings.TrimSpace(raw)
	if value == "" {
		return DefaultAddr(), nil
	}
	host, port, err := net.SplitHostPort(value)
	if err != nil {
		return "", fmt.Errorf("%s must be host:port (got %q)", EnvAddr, raw)
	}
	if host == "" {
		return "", fmt.Errorf(
			"%s must name a host explicitly: %q would listen on every interface (write 0.0.0.0:%s to mean that on purpose)",
			EnvAddr, raw, port)
	}
	number, err := strconv.Atoi(port)
	if err != nil || number < 1 || number > 65535 {
		return "", fmt.Errorf("%s has an invalid port %q", EnvAddr, port)
	}
	return net.JoinHostPort(host, strconv.Itoa(number)), nil
}

// Token returns the configured bearer token, or "" when none is set.
func Token() string { return strings.TrimSpace(os.Getenv(EnvToken)) }

// BasicAuth returns the credentials from $TWITTER_BOOKMARKER_BASIC_AUTH.
//
// enabled reports whether the variable is set at all, and it is deliberately true
// even for a value ValidateBasicAuth would reject: if a malformed credential ever
// reached a running server, the safe failure is to challenge every proxied
// request, not to serve the gallery because the shape was unexpected. The
// password may contain colons; only the first one separates it from the user.
func BasicAuth() (user, password string, enabled bool) {
	raw := strings.TrimSpace(os.Getenv(EnvBasicAuth))
	if raw == "" {
		return "", "", false
	}
	user, password, _ = strings.Cut(raw, ":")
	return user, password, true
}

// ValidateBasicAuth rejects a malformed $TWITTER_BOOKMARKER_BASIC_AUTH.
//
// Both halves are required. An empty user would read as "anyone" and an empty
// password as "no password", so neither is a shape this accepts: the variable is
// either a real credential or it is not set at all. It is checked before the
// socket is opened, alongside the token rule.
func ValidateBasicAuth(user, password string, enabled bool) error {
	if !enabled {
		return nil
	}
	if user == "" || password == "" {
		return fmt.Errorf("%s must be user:password with both parts non-empty", EnvBasicAuth)
	}
	return nil
}

// IsLoopback reports whether addr can only be reached from this machine.
//
// It fails closed: an address it cannot parse is not loopback. Callers use this
// both to decide whether a request may skip authentication and whether a bind
// may skip the token requirement, so an unrecognised shape must never be
// treated as trusted.
func IsLoopback(addr string) bool {
	host, _, err := net.SplitHostPort(addr)
	if err != nil {
		return false
	}
	if strings.EqualFold(host, "localhost") {
		return true
	}
	ip := net.ParseIP(host)
	return ip != nil && ip.IsLoopback()
}

// Validate refuses a configuration that would expose the API unauthenticated.
//
// The rule is the whole security model of the network surface: loopback needs no
// token, because only this machine can reach it and that is how the server has
// always worked; any other bind needs one. It is checked before the socket is
// opened, so there is no window in which the port is reachable without it.
func Validate(addr, token string) error {
	if IsLoopback(addr) || token != "" {
		return nil
	}
	return fmt.Errorf(
		"refusing to listen on %s without a token: set %s, or bind %s so the API is never reachable without authentication",
		addr, EnvToken, DefaultAddr())
}

// StorageDir resolves the storage directory without creating it.
//
// It honours $TWITTER_BOOKMARKER_DIR when set, and otherwise falls back to
// ~/.twitter-bookmarker. It uses os.UserHomeDir (which honours $HOME on Unix),
// so tests can redirect it with t.Setenv("HOME", t.TempDir()).
func StorageDir() (string, error) {
	home, err := os.UserHomeDir()
	if err != nil {
		return "", fmt.Errorf("resolve user home directory: %w", err)
	}
	if home == "" {
		return "", fmt.Errorf("resolve user home directory: empty home path")
	}
	return resolveStorageDir(os.Getenv(EnvDir), home)
}

// resolveStorageDir turns the raw environment value into an absolute path.
//
// An empty value yields the historical default. A leading "~/" is expanded to
// the user's home; anything else must already be absolute, because a relative
// path would depend on the working directory the server happens to be started
// from, so the same install could end up with two different databases.
func resolveStorageDir(raw, home string) (string, error) {
	value := strings.TrimSpace(raw)
	if value == "" {
		return filepath.Join(home, DirName), nil
	}
	if value == "~" || strings.HasPrefix(value, "~"+string(filepath.Separator)) {
		value = filepath.Join(home, strings.TrimPrefix(strings.TrimPrefix(value, "~"), string(filepath.Separator)))
	}
	if !filepath.IsAbs(value) {
		return "", fmt.Errorf("%s must be an absolute path or start with ~/ (got %q)", EnvDir, raw)
	}
	return filepath.Clean(value), nil
}

// WebDir resolves the directory that serves the built SPA (PRD-2 §11, §84)
// without requiring it to exist.
//
// The resolution order is:
//
//  1. $TWITTER_BOOKMARKER_WEB_DIR, verbatim — absolute, or relative to the
//     current working directory. When set it is the only candidate, so a
//     missing directory is reported as such rather than masked by a fallback.
//  2. <cwd>/web/dist — `make run` and a plain `./backend/bin/...` from the
//     repository root both resolve here.
//  3. <exeDir>/web/dist, <exeDir>/../web/dist, <exeDir>/../../web/dist — a
//     binary installed at the repo root, in backend/ or in backend/bin/
//     finds the tree even when the server is started from elsewhere.
//
// The first candidate that exists as a directory wins. When none exists it
// returns the primary candidate (<cwd>/web/dist) with ok=false so the caller
// can log the expected location and keep serving the API (PROD-05).
func WebDir() (string, bool) {
	cwd, _ := os.Getwd()
	exeDir := ""
	if exe, err := os.Executable(); err == nil {
		exeDir = filepath.Dir(exe)
	}
	return resolveWebDir(os.Getenv(EnvWebDir), cwd, exeDir)
}

// resolveWebDir is WebDir's pure core: it takes the raw environment value and
// the two base directories so the precedence can be tested without chdir and
// without depending on where the test binary happens to live.
//
// An empty cwd or exeDir simply drops that group of candidates.
func resolveWebDir(rawEnv, cwd, exeDir string) (string, bool) {
	if value := strings.TrimSpace(rawEnv); value != "" {
		abs, err := filepath.Abs(value)
		if err != nil {
			abs = filepath.Clean(value)
		}
		return abs, isDir(abs)
	}

	candidates := make([]string, 0, 4)
	if cwd != "" {
		candidates = append(candidates, filepath.Join(cwd, WebDirName))
	}
	if exeDir != "" {
		candidates = append(candidates,
			filepath.Join(exeDir, WebDirName),
			filepath.Join(exeDir, "..", WebDirName),
			filepath.Join(exeDir, "..", "..", WebDirName),
		)
	}
	for _, candidate := range candidates {
		if isDir(candidate) {
			return filepath.Clean(candidate), true
		}
	}
	if len(candidates) > 0 {
		return filepath.Clean(candidates[0]), false
	}
	return WebDirName, false
}

// isDir reports whether path is an existing directory.
func isDir(path string) bool {
	info, err := os.Stat(path)
	return err == nil && info.IsDir()
}

// EnsureStorageDir resolves, creates (mode 0700) and returns the storage dir.
func EnsureStorageDir() (string, error) {
	dir, err := StorageDir()
	if err != nil {
		return "", err
	}
	if err := os.MkdirAll(dir, FileMode); err != nil {
		return "", fmt.Errorf("create storage directory %s: %w", dir, err)
	}
	// MkdirAll leaves the mode of a pre-existing directory untouched, so an
	// explicit chmod guarantees 0700 even if the directory already existed.
	if err := os.Chmod(dir, FileMode); err != nil {
		return "", fmt.Errorf("set permissions on storage directory %s: %w", dir, err)
	}
	return dir, nil
}

// DBPath is the database file inside dir, e.g. "/data/tw-bookmarker.db".
func DBPath(dir string) string { return filepath.Join(dir, DBName) }
