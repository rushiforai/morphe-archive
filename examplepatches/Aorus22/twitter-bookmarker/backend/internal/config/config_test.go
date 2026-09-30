package config_test

import (
	"os"
	"path/filepath"
	"strings"
	"testing"

	"twitter-bookmarker/internal/config"
)

func TestFixedLoopbackAddress(t *testing.T) {
	if config.Host != "127.0.0.1" {
		t.Fatalf("Host = %q, want 127.0.0.1", config.Host)
	}
	if config.Port != 43121 {
		t.Fatalf("Port = %d, want 43121", config.Port)
	}
	if got := config.DefaultAddr(); got != "127.0.0.1:43121" {
		t.Fatalf("DefaultAddr() = %q, want 127.0.0.1:43121", got)
	}
}

func TestAddrEnvCases(t *testing.T) {
	cases := []struct {
		name    string
		value   string
		want    string
		wantErr bool
	}{
		{name: "unset falls back to loopback", value: "", want: "127.0.0.1:43121"},
		{name: "whitespace only falls back to loopback", value: "   ", want: "127.0.0.1:43121"},
		{name: "explicit wildcard is allowed", value: "0.0.0.0:43121", want: "0.0.0.0:43121"},
		{name: "lan address is allowed", value: "192.168.1.20:9000", want: "192.168.1.20:9000"},
		{name: "hostname is allowed", value: "localhost:43121", want: "localhost:43121"},
		{name: "ipv6 loopback is allowed", value: "[::1]:43121", want: "[::1]:43121"},
		{name: "surrounding space trimmed", value: "  10.0.0.5:43121  ", want: "10.0.0.5:43121"},
		{name: "port is normalised", value: "10.0.0.5:043121", want: "10.0.0.5:43121"},
		{name: "missing port rejected", value: "127.0.0.1", wantErr: true},
		{name: "empty host rejected", value: ":43121", wantErr: true},
		{name: "non numeric port rejected", value: "127.0.0.1:http", wantErr: true},
		{name: "zero port rejected", value: "127.0.0.1:0", wantErr: true},
		{name: "too large port rejected", value: "127.0.0.1:70000", wantErr: true},
		{name: "negative port rejected", value: "127.0.0.1:-1", wantErr: true},
		{name: "garbage rejected", value: "not an address", wantErr: true},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			t.Setenv(config.EnvAddr, tc.value)
			got, err := config.Addr()
			if tc.wantErr {
				if err == nil {
					t.Fatalf("Addr() = %q, want an error", got)
				}
				if !strings.Contains(err.Error(), config.EnvAddr) {
					t.Fatalf("error %q should name %s", err, config.EnvAddr)
				}
				return
			}
			if err != nil {
				t.Fatalf("Addr() error = %v", err)
			}
			if got != tc.want {
				t.Fatalf("Addr() = %q, want %q", got, tc.want)
			}
		})
	}
}

func TestIsLoopback(t *testing.T) {
	cases := []struct {
		addr string
		want bool
	}{
		{addr: "127.0.0.1:43121", want: true},
		{addr: "127.0.0.5:43121", want: true},
		{addr: "[::1]:43121", want: true},
		{addr: "localhost:43121", want: true},
		{addr: "LOCALHOST:43121", want: true},
		{addr: "0.0.0.0:43121", want: false},
		{addr: "[::]:43121", want: false},
		{addr: "192.168.1.20:43121", want: false},
		{addr: "10.0.0.5:43121", want: false},
		{addr: "example.com:43121", want: false},
		// Fail closed: an address that cannot be parsed is never trusted.
		{addr: "", want: false},
		{addr: "127.0.0.1", want: false},
		{addr: "nonsense", want: false},
	}

	for _, tc := range cases {
		t.Run(tc.addr, func(t *testing.T) {
			if got := config.IsLoopback(tc.addr); got != tc.want {
				t.Fatalf("IsLoopback(%q) = %v, want %v", tc.addr, got, tc.want)
			}
		})
	}
}

func TestValidateRefusesExposedBindWithoutToken(t *testing.T) {
	cases := []struct {
		name    string
		addr    string
		token   string
		wantErr bool
	}{
		{name: "loopback without token", addr: "127.0.0.1:43121", wantErr: false},
		{name: "loopback with token", addr: "127.0.0.1:43121", token: "s3cret", wantErr: false},
		{name: "wildcard with token", addr: "0.0.0.0:43121", token: "s3cret", wantErr: false},
		{name: "lan with token", addr: "192.168.1.20:43121", token: "s3cret", wantErr: false},
		{name: "wildcard without token", addr: "0.0.0.0:43121", wantErr: true},
		{name: "lan without token", addr: "192.168.1.20:43121", wantErr: true},
		// An address that cannot be parsed is not loopback, so it needs a token.
		{name: "unparseable without token", addr: "nonsense", wantErr: true},
		{name: "unparseable with token", addr: "nonsense", token: "s3cret", wantErr: false},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			err := config.Validate(tc.addr, tc.token)
			if tc.wantErr {
				if err == nil {
					t.Fatalf("Validate(%q, %q) = nil, want an error", tc.addr, tc.token)
				}
				if !strings.Contains(err.Error(), config.EnvToken) {
					t.Fatalf("error %q should name %s", err, config.EnvToken)
				}
				return
			}
			if err != nil {
				t.Fatalf("Validate(%q, %q) error = %v", tc.addr, tc.token, err)
			}
		})
	}
}

func TestTokenFollowsEnv(t *testing.T) {
	t.Setenv(config.EnvToken, "")
	if got := config.Token(); got != "" {
		t.Fatalf("Token() = %q, want empty", got)
	}
	t.Setenv(config.EnvToken, "  hunter2  ")
	if got := config.Token(); got != "hunter2" {
		t.Fatalf("Token() = %q, want the trimmed value", got)
	}
}

func TestBasicAuthFollowsEnv(t *testing.T) {
	t.Setenv(config.EnvBasicAuth, "")
	if user, password, enabled := config.BasicAuth(); enabled || user != "" || password != "" {
		t.Fatalf("BasicAuth() = (%q, %q, %v), want it disabled when unset", user, password, enabled)
	}

	cases := []struct {
		name         string
		raw          string
		wantUser     string
		wantPassword string
	}{
		{name: "plain pair", raw: "aorus:hunter2", wantUser: "aorus", wantPassword: "hunter2"},
		{name: "surrounding space", raw: "  aorus:hunter2  ", wantUser: "aorus", wantPassword: "hunter2"},
		// Only the first colon separates, so a password may contain its own.
		{name: "password with colons", raw: "aorus:a:b:c", wantUser: "aorus", wantPassword: "a:b:c"},
		// Malformed shapes stay enabled, so the middleware can fail closed rather
		// than quietly serve the gallery.
		{name: "no separator", raw: "aorushunter2", wantUser: "aorushunter2", wantPassword: ""},
		{name: "empty user", raw: ":hunter2", wantUser: "", wantPassword: "hunter2"},
		{name: "empty password", raw: "aorus:", wantUser: "aorus", wantPassword: ""},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			t.Setenv(config.EnvBasicAuth, tc.raw)
			user, password, enabled := config.BasicAuth()
			if !enabled {
				t.Fatal("enabled = false, want true whenever the variable is set")
			}
			if user != tc.wantUser || password != tc.wantPassword {
				t.Fatalf("BasicAuth() = (%q, %q), want (%q, %q)", user, password, tc.wantUser, tc.wantPassword)
			}
		})
	}
}

func TestValidateBasicAuth(t *testing.T) {
	// Not configured is always fine: the feature stays off.
	if err := config.ValidateBasicAuth("", "", false); err != nil {
		t.Fatalf("ValidateBasicAuth with the feature off = %v, want nil", err)
	}
	if err := config.ValidateBasicAuth("aorus", "hunter2", true); err != nil {
		t.Fatalf("ValidateBasicAuth with a full pair = %v, want nil", err)
	}

	// A half-written credential is refused, naming the variable, because "anyone
	// with no password" is not a shape this accepts.
	for _, tc := range []struct{ name, user, password string }{
		{name: "no user", user: "", password: "hunter2"},
		{name: "no password", user: "aorus", password: ""},
		{name: "neither", user: "", password: ""},
	} {
		t.Run(tc.name, func(t *testing.T) {
			err := config.ValidateBasicAuth(tc.user, tc.password, true)
			if err == nil {
				t.Fatal("ValidateBasicAuth = nil, want an error")
			}
			if !strings.Contains(err.Error(), config.EnvBasicAuth) {
				t.Fatalf("error %q does not name %s", err, config.EnvBasicAuth)
			}
		})
	}
}

func TestStorageDirFollowsHome(t *testing.T) {
	home := t.TempDir()
	t.Setenv("HOME", home)
	t.Setenv(config.EnvDir, "")

	got, err := config.StorageDir()
	if err != nil {
		t.Fatalf("StorageDir() error = %v", err)
	}
	want := filepath.Join(home, config.DirName)
	if got != want {
		t.Fatalf("StorageDir() = %q, want %q", got, want)
	}
}

func TestStorageDirHonoursEnvOverride(t *testing.T) {
	home := t.TempDir()
	t.Setenv("HOME", home)

	override := filepath.Join(t.TempDir(), "vault")
	t.Setenv(config.EnvDir, override)

	got, err := config.StorageDir()
	if err != nil {
		t.Fatalf("StorageDir() error = %v", err)
	}
	if got != override {
		t.Fatalf("StorageDir() = %q, want the override %q", got, override)
	}
	if strings.HasPrefix(got, home) {
		t.Fatalf("StorageDir() = %q still lives under the home directory", got)
	}
}

func TestStorageDirEnvCases(t *testing.T) {
	home := t.TempDir()
	t.Setenv("HOME", home)

	cases := []struct {
		name    string
		value   string
		want    string
		wantErr bool
	}{
		{name: "unset", value: "", want: filepath.Join(home, config.DirName)},
		{name: "whitespace only", value: "   ", want: filepath.Join(home, config.DirName)},
		{name: "absolute", value: "/var/tmp/tbm", want: "/var/tmp/tbm"},
		{name: "tilde slash", value: "~/Personal/twitter-bookmarker", want: filepath.Join(home, "Personal/twitter-bookmarker")},
		{name: "tilde only", value: "~", want: home},
		{name: "trailing slash cleaned", value: "/var/tmp/tbm/", want: "/var/tmp/tbm"},
		{name: "dot segments cleaned", value: "/var/tmp/./tbm/../tbm", want: "/var/tmp/tbm"},
		{name: "surrounding space trimmed", value: "  /var/tmp/tbm  ", want: "/var/tmp/tbm"},
		{name: "relative rejected", value: "relative/dir", wantErr: true},
		{name: "tilde user rejected", value: "~other/dir", wantErr: true},
	}

	for _, tc := range cases {
		t.Run(tc.name, func(t *testing.T) {
			t.Setenv(config.EnvDir, tc.value)
			got, err := config.StorageDir()
			if tc.wantErr {
				if err == nil {
					t.Fatalf("StorageDir() = %q, want an error", got)
				}
				if !strings.Contains(err.Error(), config.EnvDir) {
					t.Fatalf("error %q should name %s", err, config.EnvDir)
				}
				return
			}
			if err != nil {
				t.Fatalf("StorageDir() error = %v", err)
			}
			if got != tc.want {
				t.Fatalf("StorageDir() = %q, want %q", got, tc.want)
			}
		})
	}
}

func TestEnsureStorageDirCreatesOverride(t *testing.T) {
	t.Setenv("HOME", t.TempDir())
	override := filepath.Join(t.TempDir(), "nested", "vault")
	t.Setenv(config.EnvDir, override)

	dir, err := config.EnsureStorageDir()
	if err != nil {
		t.Fatalf("EnsureStorageDir() error = %v", err)
	}
	if dir != override {
		t.Fatalf("EnsureStorageDir() = %q, want %q", dir, override)
	}
	fi, err := os.Stat(dir)
	if err != nil {
		t.Fatalf("stat storage dir: %v", err)
	}
	if perm := fi.Mode().Perm(); perm != 0o700 {
		t.Fatalf("storage dir mode = %04o, want 0700", perm)
	}
}

func TestEnsureStorageDirRejectsRelativeOverride(t *testing.T) {
	t.Setenv("HOME", t.TempDir())
	t.Setenv(config.EnvDir, "relative")

	if _, err := config.EnsureStorageDir(); err == nil {
		t.Fatal("EnsureStorageDir() accepted a relative override")
	}
}

func TestEnsureStorageDirCreates0700AndRepairs(t *testing.T) {
	home := t.TempDir()
	t.Setenv("HOME", home)
	t.Setenv(config.EnvDir, "")

	dir, err := config.EnsureStorageDir()
	if err != nil {
		t.Fatalf("EnsureStorageDir() error = %v", err)
	}
	fi, err := os.Stat(dir)
	if err != nil {
		t.Fatalf("stat storage dir: %v", err)
	}
	if !fi.IsDir() {
		t.Fatalf("storage path %q is not a directory", dir)
	}
	if perm := fi.Mode().Perm(); perm != 0o700 {
		t.Fatalf("storage dir mode = %04o, want 0700", perm)
	}

	// A pre-existing directory with loose permissions must be repaired.
	if err := os.Chmod(dir, 0o755); err != nil {
		t.Fatalf("chmod: %v", err)
	}
	if _, err := config.EnsureStorageDir(); err != nil {
		t.Fatalf("EnsureStorageDir() second call error = %v", err)
	}
	fi, err = os.Stat(dir)
	if err != nil {
		t.Fatalf("stat storage dir: %v", err)
	}
	if perm := fi.Mode().Perm(); perm != 0o700 {
		t.Fatalf("storage dir mode after repair = %04o, want 0700", perm)
	}
}
