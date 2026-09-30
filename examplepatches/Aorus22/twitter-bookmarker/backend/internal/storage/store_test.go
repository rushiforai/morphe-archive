package storage_test

import (
	"database/sql"
	"errors"
	"fmt"
	"strings"
	"sync"
	"sync/atomic"
	"testing"

	"twitter-bookmarker/internal/config"
	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/logging"
	"twitter-bookmarker/internal/model"
	"twitter-bookmarker/internal/storage"
)

// --- shared helpers -------------------------------------------------------

// newTestStore builds a Store over a fresh directory.
func newTestStore(t *testing.T) (*storage.Store, string) {
	t.Helper()
	dir := t.TempDir()
	store, err := storage.NewStore(dir, logging.Discard())
	if err != nil {
		t.Fatalf("storage.NewStore() error = %v", err)
	}
	t.Cleanup(func() { _ = store.Close() })
	return store, dir
}

// saveReq builds a valid save request for slug and url.
func saveReq(slug, url, text string) model.SaveRequest {
	return model.SaveRequest{
		Slug: slug,
		Tweet: model.TweetInput{
			URL:       url,
			Author:    "Test Author",
			Username:  "@testauthor",
			TweetDate: "2026-09-27T02:00:00Z",
			Text:      text,
		},
	}
}

// openRO opens the database in dir independently of the Store, so assertions
// read what is on disk rather than what the writer believes it wrote.
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

// collectionCount counts the collections, read from disk.
func collectionCount(t *testing.T, dir string) int {
	t.Helper()
	return dbtest.Count(t, openRO(t, dir), `SELECT count(*) FROM collections`)
}

// --- concurrency ----------------------------------------------------------

// TestConcurrentSameTweetExactlyOneRow proves PRD §65 item 18 (and §24): 20
// concurrent saves of the SAME tweet yield exactly one success, 19 duplicate
// rejections and exactly one row. Run under -race to prove the global write path
// is race-free.
func TestConcurrentSameTweetExactlyOneRow(t *testing.T) {
	store, dir := newTestStore(t)

	const workers = 20
	var successes, duplicates, other atomic.Int64

	var wg sync.WaitGroup
	start := make(chan struct{})
	for i := 0; i < workers; i++ {
		wg.Add(1)
		go func() {
			defer wg.Done()
			<-start // release all goroutines together to maximize contention
			_, err := store.Save(saveReq("linux", "https://x.com/foo/status/123?s=20", "concurrent"))
			var dup *storage.DuplicateError
			switch {
			case err == nil:
				successes.Add(1)
			case errors.As(err, &dup):
				duplicates.Add(1)
			default:
				other.Add(1)
				t.Errorf("unexpected Save() error: %v", err)
			}
		}()
	}
	close(start)
	wg.Wait()

	if got := successes.Load(); got != 1 {
		t.Errorf("successes = %d, want 1", got)
	}
	if got := duplicates.Load(); got != int64(workers-1) {
		t.Errorf("duplicates = %d, want %d", got, workers-1)
	}
	if got := other.Load(); got != 0 {
		t.Errorf("other errors = %d, want 0", got)
	}
	if got := bookmarkCount(t, dir, "linux"); got != 1 {
		t.Fatalf("linux bookmarks = %d, want exactly 1", got)
	}
	// The collection is created once, not once per racing save.
	if got := collectionCount(t, dir); got != 1 {
		t.Fatalf("collections = %d, want exactly 1", got)
	}

	items, err := store.Index()
	if err != nil {
		t.Fatalf("Store.Index() error = %v", err)
	}
	if len(items) != 1 {
		t.Fatalf("index entries = %d, want 1", len(items))
	}
}

// TestConcurrentDistinctTweetsExactlyTenRows proves the write path serializes
// correctly under contention from independent saves: 10 concurrent distinct
// tweets produce exactly 10 rows and a consistent index.
func TestConcurrentDistinctTweetsExactlyTenRows(t *testing.T) {
	store, dir := newTestStore(t)

	const n = 10
	var successes, other atomic.Int64

	var wg sync.WaitGroup
	start := make(chan struct{})
	for i := 0; i < n; i++ {
		wg.Add(1)
		go func(i int) {
			defer wg.Done()
			<-start
			req := saveReq("linux", fmt.Sprintf("https://x.com/foo/status/%d", 1000+i), fmt.Sprintf("tweet %d", i))
			if _, err := store.Save(req); err != nil {
				other.Add(1)
				t.Errorf("Save(%d) error = %v", i, err)
				return
			}
			successes.Add(1)
		}(i)
	}
	close(start)
	wg.Wait()

	if got := successes.Load(); got != n {
		t.Errorf("successes = %d, want %d", got, n)
	}
	if got := other.Load(); got != 0 {
		t.Errorf("other errors = %d, want 0", got)
	}
	if got := bookmarkCount(t, dir, "linux"); got != n {
		t.Fatalf("linux bookmarks = %d, want %d", got, n)
	}

	items, err := store.Index()
	if err != nil {
		t.Fatalf("Store.Index() error = %v", err)
	}
	if len(items) != n {
		t.Fatalf("index entries = %d, want %d", len(items), n)
	}
}

// TestConcurrentDistinctTweetsAcrossCollectionsKeepRowsSeparated proves the
// global mutex keeps concurrent saves coherent when they target different
// collections, and that neither collection gains the other's rows.
func TestConcurrentDistinctTweetsAcrossCollectionsKeepRowsSeparated(t *testing.T) {
	store, dir := newTestStore(t)

	targets := []struct {
		slug  string
		count int
	}{
		{"linux", 6},
		{"ai", 4},
	}

	// Every job gets a globally unique Status ID so this test exercises
	// contention, not the duplicate path.
	type job struct {
		slug string
		id   int
	}
	var jobs []job
	nextID := 2000
	for _, target := range targets {
		for i := 0; i < target.count; i++ {
			jobs = append(jobs, job{slug: target.slug, id: nextID})
			nextID++
		}
	}

	var wg sync.WaitGroup
	start := make(chan struct{})
	for _, j := range jobs {
		wg.Add(1)
		go func(j job) {
			defer wg.Done()
			<-start
			req := saveReq(j.slug, fmt.Sprintf("https://x.com/%s/status/%d", j.slug, j.id), "body")
			if _, err := store.Save(req); err != nil {
				t.Errorf("Save(%s, %d) error = %v", j.slug, j.id, err)
			}
		}(j)
	}
	close(start)
	wg.Wait()

	for _, target := range targets {
		if got := bookmarkCount(t, dir, target.slug); got != target.count {
			t.Errorf("%s bookmarks = %d, want %d", target.slug, got, target.count)
		}
	}
	if got := totalBookmarks(t, dir); got != len(jobs) {
		t.Fatalf("total bookmarks = %d, want %d", got, len(jobs))
	}
}

// TestSaveIsDurableAcrossReopen replaces the CSV era's "the CSV rebuilds the
// index" test. There is no derived index to rebuild any more, so what has to
// hold is the stronger property: an acknowledged save is on disk, and a fresh
// store over the same directory sees it.
func TestSaveIsDurableAcrossReopen(t *testing.T) {
	store, dir := newTestStore(t)

	resp, err := store.Save(saveReq("linux", "https://x.com/foo/status/123", "durable"))
	if err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if resp.Status != "saved" {
		t.Fatalf("response status = %q, want saved", resp.Status)
	}

	// A second, independent store over the same directory is what a restart is.
	reopened, err := storage.NewStore(dir, logging.Discard())
	if err != nil {
		t.Fatalf("storage.NewStore() after save error = %v", err)
	}
	defer func() { _ = reopened.Close() }()

	items, err := reopened.Index()
	if err != nil {
		t.Fatalf("reopened Store.Index() error = %v", err)
	}
	if len(items) != 1 {
		t.Fatalf("reopened index entries = %d, want 1", len(items))
	}
	entry, ok := items["123"]
	if !ok {
		t.Fatalf("reopened index missing tweet 123: %v", items)
	}
	if entry.Slug != "linux" {
		t.Errorf("reopened entry slug = %q, want linux", entry.Slug)
	}
	if entry.URL != "https://x.com/foo/status/123" {
		t.Errorf("reopened entry url = %q, want the canonical URL", entry.URL)
	}
	if entry.SavedAt != resp.SavedAt {
		t.Errorf("reopened saved_at = %q, want %q", entry.SavedAt, resp.SavedAt)
	}

	stats, err := reopened.Stats()
	if err != nil {
		t.Fatalf("reopened Store.Stats() error = %v", err)
	}
	if stats.Collections != 1 || stats.Posts != 1 {
		t.Errorf("reopened stats = %+v, want 1 collection and 1 post", stats)
	}
}

// TestFailedSaveLeavesNoTrace proves the other half of the durability contract:
// a rejected save writes nothing at all — no bookmark, and no half-created
// collection.
func TestFailedSaveLeavesNoTrace(t *testing.T) {
	store, dir := newTestStore(t)

	cases := []struct {
		name string
		req  model.SaveRequest
	}{
		{"bad slug", saveReq("../escape", "https://x.com/foo/status/123", "")},
		{"uppercase slug", saveReq("Linux", "https://x.com/foo/status/123", "")},
		{"non-tweet url", saveReq("linux", "https://example.com/nope", "")},
		{"missing author", func() model.SaveRequest {
			req := saveReq("linux", "https://x.com/foo/status/123", "")
			req.Tweet.Author = "  "
			return req
		}()},
		{"bad date", func() model.SaveRequest {
			req := saveReq("linux", "https://x.com/foo/status/123", "")
			req.Tweet.TweetDate = "yesterday"
			return req
		}()},
	}

	for _, test := range cases {
		t.Run(test.name, func(t *testing.T) {
			if _, err := store.Save(test.req); err == nil {
				t.Fatalf("Save(%s) error = nil, want a rejection", test.name)
			}
		})
	}

	if got := totalBookmarks(t, dir); got != 0 {
		t.Errorf("bookmarks = %d, want 0 after only rejected saves", got)
	}
	if got := collectionCount(t, dir); got != 0 {
		t.Errorf("collections = %d, want 0: a rejected save must not create one", got)
	}
}

// TestSaveDoesNotLogTweetText proves a save never writes tweet text into the
// log (PRD §54: identifiers and metadata only).
func TestSaveDoesNotLogTweetText(t *testing.T) {
	dir := t.TempDir()
	var logBuf strings.Builder
	store, err := storage.NewStore(dir, logging.New(&logBuf))
	if err != nil {
		t.Fatalf("storage.NewStore() error = %v", err)
	}
	defer func() { _ = store.Close() }()

	if _, err := store.Save(saveReq("linux", "https://x.com/foo/status/123", "please do not log me")); err != nil {
		t.Fatalf("Save() error = %v", err)
	}
	if logged := logBuf.String(); strings.Contains(logged, "please do not log me") {
		t.Errorf("log leaked tweet text: %s", logged)
	}
}
