package config

import (
	"os"
	"path/filepath"
	"testing"
)

// mkWebDist creates <base>/web/dist and returns base, so resolveWebDir can be
// exercised against real directories without touching the process cwd.
func mkWebDist(t *testing.T, base string) string {
	t.Helper()
	if err := os.MkdirAll(filepath.Join(base, WebDirName), 0o700); err != nil {
		t.Fatalf("mkdir %s: %v", filepath.Join(base, WebDirName), err)
	}
	return base
}

func TestResolveWebDirEnvOverrideWins(t *testing.T) {
	override := mkWebDist(t, t.TempDir())
	// A cwd candidate that also exists must lose to the explicit override.
	cwd := mkWebDist(t, t.TempDir())

	got, ok := resolveWebDir(override, cwd, "")
	if !ok {
		t.Fatalf("resolveWebDir(%q) ok = false, want true", override)
	}
	if got != override {
		t.Fatalf("resolveWebDir() = %q, want the override %q", got, override)
	}
}

// The override is authoritative: a missing override directory must not be
// masked by an existing cwd candidate, otherwise the degraded path (PROD-05)
// could never be tested.
func TestResolveWebDirEnvOverrideDoesNotFallBack(t *testing.T) {
	cwd := mkWebDist(t, t.TempDir())
	missing := filepath.Join(t.TempDir(), "not-built")

	got, ok := resolveWebDir(missing, cwd, "")
	if ok {
		t.Fatalf("resolveWebDir(%q) ok = true, want false despite %q existing", missing, cwd)
	}
	if got != missing {
		t.Fatalf("resolveWebDir() = %q, want the missing override %q", got, missing)
	}
}

func TestResolveWebDirPrefersCwdThenExecutable(t *testing.T) {
	cwdRoot := t.TempDir()
	exeRoot := t.TempDir()

	// Nothing built anywhere -> the primary (cwd) candidate is reported.
	got, ok := resolveWebDir("", cwdRoot, exeRoot)
	if ok {
		t.Fatalf("resolveWebDir() ok = true with no dist present")
	}
	if want := filepath.Join(cwdRoot, WebDirName); got != want {
		t.Fatalf("resolveWebDir() = %q, want the primary candidate %q", got, want)
	}

	// Executable at <root>/backend/bin/server -> <root>/web/dist.
	exeDir := filepath.Join(exeRoot, "backend", "bin")
	mkWebDist(t, exeRoot)
	got, ok = resolveWebDir("", cwdRoot, exeDir)
	if !ok {
		t.Fatalf("resolveWebDir() ok = false, want the executable-relative candidate")
	}
	if want := filepath.Join(exeRoot, WebDirName); got != want {
		t.Fatalf("resolveWebDir() = %q, want %q", got, want)
	}

	// cwd wins as soon as it has a build, even when the executable does too.
	mkWebDist(t, cwdRoot)
	got, ok = resolveWebDir("", cwdRoot, exeDir)
	if !ok || got != filepath.Join(cwdRoot, WebDirName) {
		t.Fatalf("resolveWebDir() = %q (ok=%v), want the cwd candidate", got, ok)
	}
}

func TestResolveWebDirExecutableAtRepoRoot(t *testing.T) {
	exeRoot := mkWebDist(t, t.TempDir())
	got, ok := resolveWebDir("", "", exeRoot)
	if !ok || got != filepath.Join(exeRoot, WebDirName) {
		t.Fatalf("resolveWebDir() = %q (ok=%v), want %q", got, ok, filepath.Join(exeRoot, WebDirName))
	}
}

func TestResolveWebDirNoBases(t *testing.T) {
	got, ok := resolveWebDir("", "", "")
	if ok {
		t.Fatalf("resolveWebDir() ok = true with no bases")
	}
	if got != WebDirName {
		t.Fatalf("resolveWebDir() = %q, want %q", got, WebDirName)
	}
}

func TestWebDirHonoursEnvOverride(t *testing.T) {
	dir := mkWebDist(t, t.TempDir())
	t.Setenv(EnvWebDir, dir)

	got, ok := WebDir()
	if !ok {
		t.Fatalf("WebDir() ok = false, want true for %q", dir)
	}
	if got != dir {
		t.Fatalf("WebDir() = %q, want %q", got, dir)
	}
}

func TestWebDirMissingOverrideIsReported(t *testing.T) {
	missing := filepath.Join(t.TempDir(), "no-such-dist")
	t.Setenv(EnvWebDir, missing)

	got, ok := WebDir()
	if ok {
		t.Fatalf("WebDir() ok = true for a missing override")
	}
	if got != missing {
		t.Fatalf("WebDir() = %q, want %q", got, missing)
	}
}
