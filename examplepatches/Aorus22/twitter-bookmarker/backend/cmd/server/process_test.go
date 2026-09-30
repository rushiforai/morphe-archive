package main

import (
	"bytes"
	"context"
	"database/sql"
	"encoding/json"
	"errors"
	"fmt"
	"io"
	"net"
	"net/http"
	"os"
	"os/exec"
	"path/filepath"
	"strings"
	"sync"
	"syscall"
	"testing"
	"time"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/model"
)

// serverBin is built once in TestMain and shared by every process-level test.
var serverBin string

const (
	procBuildTimeout     = 5 * time.Minute
	procStartupTimeout   = 30 * time.Second
	procShutdownWait     = 20 * time.Second
	procFailureExitLimit = 20 * time.Second
)

func TestMain(m *testing.M) {
	buildDir, err := os.MkdirTemp("", "twbm-server-build-")
	if err != nil {
		fmt.Fprintln(os.Stderr, "create build dir:", err)
		os.Exit(1)
	}
	serverBin = filepath.Join(buildDir, "twitter-bookmarker-server")

	ctx, cancel := context.WithTimeout(context.Background(), procBuildTimeout)
	build := exec.CommandContext(ctx, "go", "build", "-o", serverBin, ".")
	out, err := build.CombinedOutput()
	cancel()
	if err != nil {
		fmt.Fprintf(os.Stderr, "go build failed: %v\n%s", err, out)
		_ = os.RemoveAll(buildDir)
		os.Exit(1)
	}

	code := m.Run()
	_ = os.RemoveAll(buildDir)
	os.Exit(code)
}

// TestProcessLiveServer proves PRD §65 items 1, 2, 3, 4, 5 and 6 against a real
// compiled binary over a real TCP socket, then proves clean termination.
func TestProcessLiveServer(t *testing.T) {
	requireDefaultPortFree(t)

	home := t.TempDir()
	p := startServer(t, home)
	waitForHealth(t, p)

	// Item 4: GET /health.
	status, body := httpDo(t, http.MethodGet, "/health", "")
	if status != http.StatusOK {
		t.Fatalf("GET /health status = %d, want 200", status)
	}
	if got := decodeBody[model.HealthResponse](t, body).Status; got != "ok" {
		t.Fatalf("health body status = %q, want ok", got)
	}

	// Item 3: the storage directory is created automatically with mode 0700.
	storageDir := filepath.Join(home, config.DirName)
	fi, err := os.Stat(storageDir)
	if err != nil {
		t.Fatalf("storage directory %s was not created: %v", storageDir, err)
	}
	if !fi.IsDir() {
		t.Fatalf("storage path %s is not a directory", storageDir)
	}
	if perm := fi.Mode().Perm(); perm != 0o700 {
		t.Fatalf("storage dir mode = %04o, want 0700", perm)
	}

	// Item 2: the startup log reports the loopback address, never a wildcard.
	logOut := p.out.String()
	if !strings.Contains(logOut, "Twitter Bookmarker server started") {
		t.Errorf("startup log missing server-started message:\n%s", logOut)
	}
	if !strings.Contains(logOut, config.DefaultAddr()) {
		t.Errorf("startup log missing loopback address %s:\n%s", config.DefaultAddr(), logOut)
	}
	if strings.Contains(logOut, "0.0.0.0") {
		t.Errorf("startup log suggests a non-loopback bind:\n%s", logOut)
	}

	// Item 6: POST /v1/bookmarks persists the bookmark into tw-bookmarker.db.
	saveBody := `{"slug":"linux","name":"Linux","tweet":{"url":"https://x.com/foo/status/123?s=20","author":"Foo Bar","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"Testing Linux today"}}`
	status, body = httpDo(t, http.MethodPost, "/v1/bookmarks", saveBody)
	if status != http.StatusCreated {
		t.Fatalf("POST /v1/bookmarks status = %d, want 201 (body %s)", status, body)
	}
	saved := decodeBody[model.SaveResponse](t, body)
	if saved.Status != "saved" || saved.TweetID != "123" {
		t.Fatalf("save response = %+v, want status=saved tweet_id=123", saved)
	}
	if saved.Slug != "linux" {
		t.Fatalf("save response slug = %q, want linux", saved.Slug)
	}
	if saved.URL != "https://x.com/foo/status/123" {
		t.Fatalf("save response url = %q, want canonical https://x.com/foo/status/123", saved.URL)
	}

	// Item 5: GET /v1/index returns the saved tweet.
	status, body = httpDo(t, http.MethodGet, "/v1/index", "")
	if status != http.StatusOK {
		t.Fatalf("GET /v1/index status = %d, want 200", status)
	}
	if _, ok := decodeBody[model.IndexResponse](t, body).Items["123"]; !ok {
		t.Fatalf("index does not contain tweet 123: %s", body)
	}

	// Item 1 + PRD §58: the running process terminates cleanly on SIGTERM.
	stopServer(t, p)
	if logOut := p.out.String(); !strings.Contains(logOut, "shutdown signal received") {
		t.Errorf("shutdown log missing clean-shutdown message:\n%s", logOut)
	}

	// The save is durable in the one database file the server owns: a fresh
	// read-only handle sees exactly the row the HTTP request acknowledged.
	conn := openDBReadOnly(t, storageDir)
	if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 1 {
		t.Fatalf("bookmarks in %s = %d, want 1", config.DBName, got)
	}
	if got := dbtest.Text(t, conn, `SELECT slug FROM collections`); got != "linux" {
		t.Errorf("collection slug = %q, want linux", got)
	}
	if got := dbtest.Text(t, conn, `SELECT name FROM collections`); got != "Linux" {
		t.Errorf("collection name = %q, want Linux", got)
	}
	if got := dbtest.Text(t, conn, `SELECT url FROM bookmarks WHERE tweet_id = ?`, "123"); got != saved.URL {
		t.Errorf("stored url = %q, want %q", got, saved.URL)
	}
	if got := dbtest.Text(t, conn, `SELECT text FROM bookmarks WHERE tweet_id = ?`, "123"); got != "Testing Linux today" {
		t.Errorf("stored text = %q, want %q", got, "Testing Linux today")
	}
}

// TestProcessGracefulShutdownSignals proves PRD §58 for both SIGINT and
// SIGTERM: exit code 0 and a clean shutdown log line.
func TestProcessGracefulShutdownSignals(t *testing.T) {
	signals := []struct {
		name string
		sig  syscall.Signal
	}{
		{"SIGINT", syscall.SIGINT},
		{"SIGTERM", syscall.SIGTERM},
	}
	for _, tc := range signals {
		t.Run(tc.name, func(t *testing.T) {
			requireDefaultPortFree(t)

			p := startServer(t, t.TempDir())
			waitForHealth(t, p)

			if err := p.cmd.Process.Signal(tc.sig); err != nil {
				t.Fatalf("signal %s: %v", tc.name, err)
			}
			if err := p.waitExit(t, procShutdownWait); err != nil {
				t.Fatalf("%s exit = %v, want code 0; output:\n%s", tc.name, err, p.out.String())
			}
			if logOut := p.out.String(); !strings.Contains(logOut, "shutdown signal received") {
				t.Errorf("%s shutdown log missing clean-shutdown message:\n%s", tc.name, logOut)
			}
		})
	}
}

// TestProcessPortInUseExitsNonZero proves PRD §57: if the port is already in
// use the process exits non-zero with a clear message.
func TestProcessPortInUseExitsNonZero(t *testing.T) {
	ln, err := net.Listen("tcp", config.DefaultAddr())
	if err != nil {
		t.Skipf("default port %s is unavailable so it cannot be reserved for this test: %v", config.DefaultAddr(), err)
	}
	defer ln.Close()

	p := startServer(t, t.TempDir())
	err = p.waitExit(t, procFailureExitLimit)
	if err == nil {
		t.Fatalf("expected non-zero exit when %s is in use, got exit code 0; output:\n%s", config.DefaultAddr(), p.out.String())
	}
	var exitErr *exec.ExitError
	if !errors.As(err, &exitErr) {
		t.Fatalf("exit error = %v, want *exec.ExitError", err)
	}
	if code := exitErr.ExitCode(); code == 0 {
		t.Fatalf("exit code = %d, want non-zero", code)
	}
	if out := p.out.String(); !strings.Contains(out, "already in use") {
		t.Errorf("stderr missing a clear port-in-use message:\n%s", out)
	}
}

// TestProcessStorageDirFailureExitsNonZero proves PRD §57: if the storage
// directory cannot be created the process exits non-zero with a clear message.
func TestProcessStorageDirFailureExitsNonZero(t *testing.T) {
	// A regular file as $HOME makes ~/.twitter-bookmarker uncreatable
	// regardless of the process uid.
	homeFile := filepath.Join(t.TempDir(), "home-is-a-file")
	if err := os.WriteFile(homeFile, []byte("not a directory\n"), 0o600); err != nil {
		t.Fatalf("write home file: %v", err)
	}

	p := startServer(t, homeFile)
	err := p.waitExit(t, procFailureExitLimit)
	if err == nil {
		t.Fatalf("expected non-zero exit when the storage dir cannot be created, got exit code 0; output:\n%s", p.out.String())
	}
	var exitErr *exec.ExitError
	if !errors.As(err, &exitErr) {
		t.Fatalf("exit error = %v, want *exec.ExitError", err)
	}
	if code := exitErr.ExitCode(); code == 0 {
		t.Fatalf("exit code = %d, want non-zero", code)
	}
	if out := p.out.String(); !strings.Contains(out, "storage directory") {
		t.Errorf("stderr missing a clear storage-directory message:\n%s", out)
	}
}

// TestProcessDatabaseLifecycle replaces the removed `--rebuild-index` test.
//
// That flag rebuilt a derived index file that no longer exists. The properties
// it stood for are now properties of the database: a fresh storage directory
// must get a working database, an existing one must be reused rather than
// recreated (never silently emptied), and a file the server cannot understand
// must make startup fail loudly.
func TestProcessDatabaseLifecycle(t *testing.T) {
	t.Run("fresh_storage_creates_working_database", func(t *testing.T) {
		requireDefaultPortFree(t)

		home := t.TempDir()
		p := startServer(t, home)
		waitForHealth(t, p)

		// Startup created the one durable file, with the real schema.
		dir := filepath.Join(home, config.DirName)
		if _, err := os.Stat(config.DBPath(dir)); err != nil {
			t.Fatalf("%s was not created on startup: %v", config.DBName, err)
		}
		conn := openDBReadOnly(t, dir)
		// The real schema is version 2, whose third table is the trash that makes
		// a delete recoverable. The list is written out rather than derived so a
		// change to the schema has to be acknowledged here.
		if got := dbtest.Tables(t, conn); len(got) != 3 ||
			got[0] != "bookmarks" || got[1] != "collections" || got[2] != "deleted_bookmarks" {
			t.Fatalf("tables = %v, want [bookmarks collections deleted_bookmarks]", got)
		}
		if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 0 {
			t.Fatalf("fresh database holds %d bookmarks, want 0", got)
		}

		// The database it created is immediately usable over the API.
		body := `{"slug":"linux","name":"Linux","tweet":{"url":"https://x.com/foo/status/123","author":"Foo","username":"@foo","tweet_date":"2026-09-27T01:00:00Z","text":"fresh"}}`
		if status, resp := httpDo(t, http.MethodPost, "/v1/bookmarks", body); status != http.StatusCreated {
			t.Fatalf("POST /v1/bookmarks status = %d, want 201 (body %s)", status, resp)
		}
		stopServer(t, p)

		if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 1 {
			t.Fatalf("bookmarks after one save = %d, want 1", got)
		}
	})

	t.Run("existing_database_is_reused_not_recreated", func(t *testing.T) {
		requireDefaultPortFree(t)

		home := t.TempDir()
		dir := filepath.Join(home, config.DirName)
		if err := os.MkdirAll(dir, config.FileMode); err != nil {
			t.Fatalf("mkdir storage dir: %v", err)
		}
		// Seed the database before the server starts, then close the writer so
		// the subprocess is the only handle on it.
		seedConn, err := db.OpenRW(config.DBPath(dir))
		if err != nil {
			t.Fatalf("create database: %v", err)
		}
		dbtest.Seed(t, seedConn, "linux", "Linux",
			dbtest.Row{TweetID: "111"},
			dbtest.Row{TweetID: "222", Media: `["https://pbs.twimg.com/media/A.jpg"]`},
		)
		if err := seedConn.Close(); err != nil {
			t.Fatalf("close seeded database: %v", err)
		}

		p := startServer(t, home)
		waitForHealth(t, p)

		// The running server read the pre-existing rows...
		status, body := httpDo(t, http.MethodGet, "/v1/index", "")
		if status != http.StatusOK {
			t.Fatalf("GET /v1/index status = %d, want 200", status)
		}
		items := decodeBody[model.IndexResponse](t, body).Items
		for _, id := range []string{"111", "222"} {
			if _, ok := items[id]; !ok {
				t.Fatalf("index does not contain seeded tweet %s: %v", id, items)
			}
		}
		// ...and reported them in the startup log instead of starting empty.
		if logOut := p.out.String(); !strings.Contains(logOut, "collections=1") || !strings.Contains(logOut, "bookmarks=2") {
			t.Errorf("startup log did not report the existing database contents (want collections=1 bookmarks=2):\n%s", logOut)
		}

		stopServer(t, p)

		// Reuse means no data loss: both seeded rows are still there.
		conn := openDBReadOnly(t, dir)
		if got := dbtest.Count(t, conn, `SELECT count(*) FROM bookmarks`); got != 2 {
			t.Fatalf("bookmarks after restart = %d, want 2 (existing database must be reused)", got)
		}
		if got := dbtest.Text(t, conn, `SELECT name FROM collections WHERE slug = ?`, "linux"); got != "Linux" {
			t.Errorf("collection name after restart = %q, want Linux", got)
		}
	})

	t.Run("corrupt_database_fails_loudly", func(t *testing.T) {
		home := t.TempDir()
		dir := filepath.Join(home, config.DirName)
		if err := os.MkdirAll(dir, config.FileMode); err != nil {
			t.Fatalf("mkdir storage dir: %v", err)
		}
		garbage := []byte("this is definitely not a SQLite database\n" + strings.Repeat("garbage!", 512))
		if err := os.WriteFile(config.DBPath(dir), garbage, 0o600); err != nil {
			t.Fatalf("write corrupt database: %v", err)
		}

		p := startServer(t, home)
		err := p.waitExit(t, procFailureExitLimit)
		if err == nil {
			t.Fatalf("expected non-zero exit for a corrupt database, got exit code 0; output:\n%s", p.out.String())
		}
		var exitErr *exec.ExitError
		if !errors.As(err, &exitErr) {
			t.Fatalf("exit error = %v, want *exec.ExitError", err)
		}
		if code := exitErr.ExitCode(); code == 0 {
			t.Fatalf("exit code = %d, want non-zero", code)
		}
		if out := p.out.String(); !strings.Contains(out, "database") {
			t.Errorf("stderr missing a clear database message:\n%s", out)
		}

		// Failing loudly must never mean replacing the file with a fresh one.
		after, err := os.ReadFile(config.DBPath(dir))
		if err != nil {
			t.Fatalf("read database after failed startup: %v", err)
		}
		if !bytes.Equal(after, garbage) {
			t.Fatalf("startup replaced the corrupt database: got %d bytes, want the original %d", len(after), len(garbage))
		}
	})

	t.Run("unsupported_version_fails_loudly", func(t *testing.T) {
		home := t.TempDir()
		dir := filepath.Join(home, config.DirName)
		if err := os.MkdirAll(dir, config.FileMode); err != nil {
			t.Fatalf("mkdir storage dir: %v", err)
		}

		// A database from a future schema version must be refused, not migrated.
		conn, err := db.OpenRW(config.DBPath(dir))
		if err != nil {
			t.Fatalf("create database: %v", err)
		}
		dbtest.Seed(t, conn, "linux", "Linux", dbtest.Row{TweetID: "111"})
		dbtest.MustExec(t, conn, fmt.Sprintf("PRAGMA user_version = %d", db.Version+1))
		if err := conn.Close(); err != nil {
			t.Fatalf("close database: %v", err)
		}

		p := startServer(t, home)
		err = p.waitExit(t, procFailureExitLimit)
		if err == nil {
			t.Fatalf("expected non-zero exit for an unsupported schema version, got exit code 0; output:\n%s", p.out.String())
		}
		var exitErr *exec.ExitError
		if !errors.As(err, &exitErr) {
			t.Fatalf("exit error = %v, want *exec.ExitError", err)
		}
		if code := exitErr.ExitCode(); code == 0 {
			t.Fatalf("exit code = %d, want non-zero", code)
		}
		if out := p.out.String(); !strings.Contains(out, "version") {
			t.Errorf("stderr missing a clear schema-version message:\n%s", out)
		}

		// Refusing must not have damaged or emptied the file it refused.
		ro, err := db.OpenRO(config.DBPath(dir))
		if err != nil {
			t.Fatalf("reopen database read-only: %v", err)
		}
		defer ro.Close()
		if got := dbtest.Count(t, ro, `SELECT count(*) FROM bookmarks`); got != 1 {
			t.Fatalf("bookmarks after refused startup = %d, want 1 (data must be preserved)", got)
		}
	})
}

// TestProcessHelpFlag proves -h/--help prints the usage text — naming the
// address, the storage directory and the database — exits successfully and does
// not touch the filesystem. It also proves the compiled binary accepts -h.
func TestProcessHelpFlag(t *testing.T) {
	for _, arg := range []string{"-h", "--help"} {
		t.Run(arg, func(t *testing.T) {
			home := t.TempDir()
			t.Setenv("HOME", home)
			// The environment override would otherwise redirect storage away
			// from the temp home this test asserts about.
			t.Setenv(config.EnvDir, "")

			var out bytes.Buffer
			if err := run([]string{arg}, &out); err != nil {
				t.Fatalf("run(%s) error = %v, want nil", arg, err)
			}

			usage := out.String()
			for _, want := range []string{"Usage:", serverName, config.DefaultAddr(), config.DBName, config.EnvDir, config.DirName} {
				if !strings.Contains(usage, want) {
					t.Errorf("usage text missing %q:\n%s", want, usage)
				}
			}
			// The removed flags must not be advertised.
			for _, gone := range []string{"--rebuild-index", "--migrate-csv", "--dry-run", "--archive-csv"} {
				if strings.Contains(usage, gone) {
					t.Errorf("usage text still advertises removed flag %q:\n%s", gone, usage)
				}
			}

			if _, err := os.Stat(filepath.Join(home, config.DirName)); !errors.Is(err, os.ErrNotExist) {
				t.Errorf("%s created storage on a help request (stat err = %v)", arg, err)
			}
		})
	}

	t.Run("binary", func(t *testing.T) {
		home := t.TempDir()
		ctx, cancel := context.WithTimeout(context.Background(), procFailureExitLimit)
		defer cancel()

		cmd := exec.CommandContext(ctx, serverBin, "-h")
		cmd.Env = envForServer(home)
		out, err := cmd.CombinedOutput()
		if err != nil {
			t.Fatalf("binary -h exit = %v, want 0 (output:\n%s)", err, out)
		}
		if !strings.Contains(string(out), "Usage:") {
			t.Errorf("binary -h stdout missing usage text:\n%s", out)
		}
		if _, err := os.Stat(filepath.Join(home, config.DirName)); !errors.Is(err, os.ErrNotExist) {
			t.Errorf("binary -h created storage (stat err = %v)", err)
		}
	})
}

// TestProcessRemovedFlagsRejected proves every CLI flag the previous server
// accepted is now rejected: the binary exits non-zero with a clear message and
// never creates a storage directory, because argument parsing happens first.
func TestProcessRemovedFlagsRejected(t *testing.T) {
	flags := []string{
		"--rebuild-index",
		"--migrate-csv",
		"--dry-run",
		"--archive-csv",
		"--definitely-unknown",
	}
	for _, flag := range flags {
		t.Run(flag, func(t *testing.T) {
			home := t.TempDir()
			ctx, cancel := context.WithTimeout(context.Background(), procFailureExitLimit)
			defer cancel()

			cmd := exec.CommandContext(ctx, serverBin, flag)
			cmd.Env = envForServer(home)
			out, err := cmd.CombinedOutput()
			if err == nil {
				t.Fatalf("expected non-zero exit for %s, got exit code 0; output:\n%s", flag, out)
			}
			var exitErr *exec.ExitError
			if !errors.As(err, &exitErr) {
				t.Fatalf("exit error = %v, want *exec.ExitError", err)
			}
			if code := exitErr.ExitCode(); code == 0 {
				t.Fatalf("exit code for %s = %d, want non-zero", flag, code)
			}
			if !strings.Contains(string(out), "unknown argument") {
				t.Errorf("stderr missing a clear unknown-argument message for %s:\n%s", flag, out)
			}
			if _, err := os.Stat(filepath.Join(home, config.DirName)); !errors.Is(err, os.ErrNotExist) {
				t.Errorf("%s was rejected but still created a storage directory", flag)
			}
		})
	}
}

// --- process helpers ---

type lockedBuffer struct {
	mu sync.Mutex
	b  bytes.Buffer
}

func (l *lockedBuffer) Write(p []byte) (int, error) {
	l.mu.Lock()
	defer l.mu.Unlock()
	return l.b.Write(p)
}

func (l *lockedBuffer) String() string {
	l.mu.Lock()
	defer l.mu.Unlock()
	return l.b.String()
}

type serverProc struct {
	cmd       *exec.Cmd
	out       *lockedBuffer
	exited    chan struct{}
	mu        sync.Mutex
	waitErr   error
	waitErrOK bool
}

// startServer launches the compiled server with HOME redirected to home and
// registers cleanup that kills it if the test ends early.
func startServer(t *testing.T, home string) *serverProc {
	t.Helper()

	cmd := exec.Command(serverBin)
	cmd.Env = envForServer(home)
	out := &lockedBuffer{}
	cmd.Stdout = out
	cmd.Stderr = out
	if err := cmd.Start(); err != nil {
		t.Fatalf("start server binary: %v", err)
	}

	p := &serverProc{cmd: cmd, out: out, exited: make(chan struct{})}
	go func() {
		err := cmd.Wait()
		p.mu.Lock()
		p.waitErr, p.waitErrOK = err, true
		p.mu.Unlock()
		close(p.exited)
	}()

	t.Cleanup(func() {
		select {
		case <-p.exited:
		default:
			_ = cmd.Process.Kill()
			<-p.exited
		}
	})
	return p
}

// stopServer sends SIGTERM and requires a clean exit, failing the test either
// way. It is the shared "shut this instance down before the next one" helper.
func stopServer(t *testing.T, p *serverProc) {
	t.Helper()
	if err := p.cmd.Process.Signal(syscall.SIGTERM); err != nil {
		t.Fatalf("signal SIGTERM: %v", err)
	}
	if err := p.waitExit(t, procShutdownWait); err != nil {
		t.Fatalf("server exit = %v, want code 0 after SIGTERM; output:\n%s", err, p.out.String())
	}
}

func (p *serverProc) waitExit(t *testing.T, timeout time.Duration) error {
	t.Helper()
	select {
	case <-p.exited:
		p.mu.Lock()
		defer p.mu.Unlock()
		if !p.waitErrOK {
			t.Fatal("internal: exit observed before Wait result was recorded")
		}
		return p.waitErr
	case <-time.After(timeout):
		t.Fatalf("server did not exit within %s; output:\n%s", timeout, p.out.String())
		return nil
	}
}

func (p *serverProc) exitErr() error {
	p.mu.Lock()
	defer p.mu.Unlock()
	return p.waitErr
}

// envForServer returns the parent environment with HOME replaced and the
// storage-directory, listen-address and token overrides removed, so a
// developer's real $TWITTER_BOOKMARKER_DIR, $TWITTER_BOOKMARKER_ADDR or
// $TWITTER_BOOKMARKER_TOKEN can never leak into (or be written by) a test. A
// stray address would move the child server off the loopback port every test
// asserts on, and a stray token would make it require one.
func envForServer(home string) []string {
	stripped := []string{"HOME=", config.EnvDir + "=", config.EnvAddr + "=", config.EnvToken + "="}
	env := make([]string, 0, len(os.Environ())+1)
	for _, kv := range os.Environ() {
		if hasAnyPrefix(kv, stripped) {
			continue
		}
		env = append(env, kv)
	}
	return append(env, "HOME="+home)
}

func hasAnyPrefix(value string, prefixes []string) bool {
	for _, prefix := range prefixes {
		if strings.HasPrefix(value, prefix) {
			return true
		}
	}
	return false
}

// openDBReadOnly opens the storage directory's database without ever creating
// it, so a test can assert on exactly what a server process wrote.
func openDBReadOnly(t *testing.T, dir string) *sql.DB {
	t.Helper()
	conn, err := db.OpenRO(config.DBPath(dir))
	if err != nil {
		t.Fatalf("open %s read-only in %s: %v", config.DBName, dir, err)
	}
	t.Cleanup(func() { _ = conn.Close() })
	return conn
}

// requireDefaultPortFree skips the test when the fixed production port cannot
// be reserved in this environment (e.g. a real backend is already running).
func requireDefaultPortFree(t *testing.T) {
	t.Helper()
	ln, err := net.Listen("tcp", config.DefaultAddr())
	if err != nil {
		t.Skipf("production port %s is unavailable in this environment: %v", config.DefaultAddr(), err)
	}
	_ = ln.Close()
}

func waitForHealth(t *testing.T, p *serverProc) {
	t.Helper()
	deadline := time.Now().Add(procStartupTimeout)
	for time.Now().Before(deadline) {
		select {
		case <-p.exited:
			t.Fatalf("server exited before becoming healthy: %v\noutput:\n%s", p.exitErr(), p.out.String())
		default:
		}

		status, _, err := httpGet(100 * time.Millisecond)
		if err == nil && status == http.StatusOK {
			return
		}
		time.Sleep(25 * time.Millisecond)
	}
	t.Fatalf("server did not become healthy within %s; output:\n%s", procStartupTimeout, p.out.String())
}

func httpDo(t *testing.T, method, path, body string) (int, []byte) {
	t.Helper()
	status, data, err := httpRequest(method, path, body, 5*time.Second)
	if err != nil {
		t.Fatalf("%s %s: %v", method, path, err)
	}
	return status, data
}

func httpGet(timeout time.Duration) (int, []byte, error) {
	return httpRequest(http.MethodGet, "/health", "", timeout)
}

// httpRequest issues one request against the live server. Keep-alives are
// disabled so graceful shutdown never waits on pooled idle connections.
func httpRequest(method, path, body string, timeout time.Duration) (int, []byte, error) {
	var reader io.Reader
	if body != "" {
		reader = strings.NewReader(body)
	}
	req, err := http.NewRequest(method, "http://"+config.DefaultAddr()+path, reader)
	if err != nil {
		return 0, nil, err
	}
	if body != "" {
		req.Header.Set("Content-Type", "application/json")
	}
	client := &http.Client{
		Timeout: timeout,
		Transport: &http.Transport{
			DisableKeepAlives: true,
		},
	}
	resp, err := client.Do(req)
	if err != nil {
		return 0, nil, err
	}
	defer resp.Body.Close()
	data, err := io.ReadAll(resp.Body)
	if err != nil {
		return resp.StatusCode, nil, err
	}
	return resp.StatusCode, data, nil
}

func decodeBody[T any](t *testing.T, body []byte) T {
	t.Helper()
	var v T
	if err := json.Unmarshal(body, &v); err != nil {
		t.Fatalf("decode response %q: %v", body, err)
	}
	return v
}
