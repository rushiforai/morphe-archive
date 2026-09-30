package gallery_test

import (
	"bytes"
	"database/sql"
	"errors"
	"os"
	"path/filepath"
	"strings"
	"testing"

	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/gallery"
	"twitter-bookmarker/internal/logging"
)

// --- seeding helpers -------------------------------------------------------

// newReader builds a reader over dir and captures its structured log output, so
// a test can assert on the warnings the read layer emits.
func newReader(t *testing.T, dir string) (*gallery.Reader, *bytes.Buffer) {
	t.Helper()
	var logs bytes.Buffer
	return gallery.New(dir, logging.New(&logs)), &logs
}

// insertRaw writes one bookmark exactly as given, bypassing dbtest.Insert's
// defaults. It is how a test stores a hand-edited value — an empty author, a
// non-RFC3339 timestamp, a malformed media cell — without pretending it came
// from the writer under test.
func insertRaw(t *testing.T, conn *sql.DB, collectionID int64, row dbtest.Row) {
	t.Helper()
	dbtest.MustExec(t, conn,
		`INSERT INTO bookmarks(tweet_id, collection_id, url, author, username, tweet_date, saved_at, text, media)
		 VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)`,
		row.TweetID, collectionID, row.URL, row.Author, row.Username,
		row.TweetDate, row.SavedAt, row.Text, row.Media)
}

// mustPosts parses a raw query and runs it.
func mustPosts(t *testing.T, r *gallery.Reader, slug string, raw gallery.RawQuery) gallery.Page {
	t.Helper()
	query, err := raw.Parse()
	if err != nil {
		t.Fatalf("RawQuery.Parse() error = %v", err)
	}
	page, err := r.Posts(slug, query)
	if err != nil {
		t.Fatalf("Posts(%q) error = %v", slug, err)
	}
	return page
}

func collectionByName(t *testing.T, collections []gallery.Collection, name string) gallery.Collection {
	t.Helper()
	for _, collection := range collections {
		if collection.Name == name {
			return collection
		}
	}
	names := make([]string, 0, len(collections))
	for _, collection := range collections {
		names = append(names, collection.Name)
	}
	t.Fatalf("collection %q not found in %v", name, names)
	return gallery.Collection{}
}

func itemIDs(page gallery.Page) []string {
	ids := make([]string, 0, len(page.Items))
	for _, item := range page.Items {
		ids = append(ids, item.TweetID)
	}
	return ids
}

// --- discovery and summaries (Specific Idea 1) -----------------------------

func seedGallery(t *testing.T) (*gallery.Reader, *bytes.Buffer, string) {
	t.Helper()
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)

	dbtest.Seed(t, conn, "ai", "AI",
		dbtest.Row{TweetID: "111", URL: "https://x.com/alice/status/111",
			Media:  `["https://pbs.twimg.com/media/a1.jpg","https://pbs.twimg.com/media/a2.jpg"]`,
			Author: "Alice", Username: "@alice",
			TweetDate: "2026-09-20T08:00:00Z", SavedAt: "2026-09-27T10:00:00Z", Text: "AI news"},
		dbtest.Row{TweetID: "112", URL: "https://x.com/alice/status/112", Media: `[]`,
			Author: "Alice", Username: "@alice",
			TweetDate: "2026-09-21T08:00:00Z", SavedAt: "2026-09-27T11:00:00Z", Text: "text only"},
		dbtest.Row{TweetID: "113", URL: "https://x.com/bob/status/113",
			Media:  `["https://pbs.twimg.com/media/a3.jpg"]`,
			Author: "Bob", Username: "@bob",
			TweetDate: "2026-09-22T08:00:00Z", SavedAt: "2026-09-26T09:00:00Z", Text: "older"},
	)
	dbtest.Seed(t, conn, "linux", "Linux",
		dbtest.Row{TweetID: "211", URL: "https://x.com/carol/status/211",
			Media:  `["https://pbs.twimg.com/media/l1.jpg"]`,
			Author: "Carol", Username: "@carol",
			TweetDate: "2026-09-10T08:00:00Z", SavedAt: "2026-09-25T10:00:00Z", Text: "Linux desktop tips"},
		dbtest.Row{TweetID: "212", URL: "https://x.com/dave/status/212",
			Media:  `["https://pbs.twimg.com/media/l2.jpg"]`,
			Author: "Dave", Username: "@dave",
			TweetDate: "2026-09-11T08:00:00Z", SavedAt: "2026-09-24T10:00:00Z", Text: "kernel stuff"},
	)
	dbtest.Seed(t, conn, "design", "Design",
		dbtest.Row{TweetID: "311", URL: "https://x.com/erin/status/311", Media: `[]`,
			Author: "Erin", Username: "@erin",
			TweetDate: "2026-09-15T08:00:00Z", SavedAt: "2026-09-20T10:00:00Z", Text: "design notes"},
	)

	// Files and directories beside the database are not collections: the gallery
	// reads the collections table, not the directory listing.
	if err := os.WriteFile(filepath.Join(dir, "notes.txt"), []byte("junk"), 0o600); err != nil {
		t.Fatalf("write notes.txt: %v", err)
	}
	if err := os.Mkdir(filepath.Join(dir, "nested"), 0o700); err != nil {
		t.Fatalf("mkdir nested: %v", err)
	}
	if err := os.WriteFile(filepath.Join(dir, "archive.bak"), []byte("junk"), 0o600); err != nil {
		t.Fatalf("write archive.bak: %v", err)
	}

	reader, logs := newReader(t, dir)
	return reader, logs, dir
}

func TestCollectionsDiscoverySummariesAndOrdering(t *testing.T) {
	reader, _, _ := seedGallery(t)

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	if len(collections) != 3 {
		t.Fatalf("Collections() returned %d collections, want 3: %+v", len(collections), collections)
	}

	wantOrder := []string{"AI", "Linux", "Design"}
	for i, want := range wantOrder {
		if collections[i].Name != want {
			t.Errorf("collections[%d].Name = %q, want %q", i, collections[i].Name, want)
		}
	}

	tests := []struct {
		name        string
		postCount   int
		mediaCount  int
		lastSavedAt string
		cover       []string
	}{
		{
			name:        "AI",
			postCount:   3,
			mediaCount:  3,
			lastSavedAt: "2026-09-27T11:00:00Z",
			cover: []string{
				"https://pbs.twimg.com/media/a1.jpg",
				"https://pbs.twimg.com/media/a2.jpg",
				"https://pbs.twimg.com/media/a3.jpg",
			},
		},
		{
			name:        "Linux",
			postCount:   2,
			mediaCount:  2,
			lastSavedAt: "2026-09-25T10:00:00Z",
			cover: []string{
				"https://pbs.twimg.com/media/l1.jpg",
				"https://pbs.twimg.com/media/l2.jpg",
			},
		},
		{
			name:        "Design",
			postCount:   1,
			mediaCount:  0,
			lastSavedAt: "2026-09-20T10:00:00Z",
			cover:       []string{},
		},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			got := collectionByName(t, collections, test.name)
			if got.Slug != strings.ToLower(test.name) {
				t.Errorf("Slug = %q, want %q", got.Slug, strings.ToLower(test.name))
			}
			if got.PostCount != test.postCount {
				t.Errorf("PostCount = %d, want %d", got.PostCount, test.postCount)
			}
			if got.MediaCount != test.mediaCount {
				t.Errorf("MediaCount = %d, want %d", got.MediaCount, test.mediaCount)
			}
			if got.LastSavedAt == nil || *got.LastSavedAt != test.lastSavedAt {
				t.Errorf("LastSavedAt = %v, want %q", got.LastSavedAt, test.lastSavedAt)
			}
			if got.CoverMedia == nil {
				t.Fatal("CoverMedia is nil, want a non-nil slice for JSON []")
			}
			if !equalStrings(got.CoverMedia, test.cover) {
				t.Errorf("CoverMedia = %v, want %v", got.CoverMedia, test.cover)
			}
		})
	}
}

func TestCollectionsCoverMediaNewestFirstCappedAtFour(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "cap", "Cap",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Media:  `["https://pbs.twimg.com/media/m1.jpg","https://pbs.twimg.com/media/m2.jpg"]`,
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z", Text: "newest"},
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Media:  `["https://pbs.twimg.com/media/m3.jpg","https://pbs.twimg.com/media/m4.jpg"]`,
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "middle"},
		dbtest.Row{TweetID: "3", URL: "https://x.com/u/status/3",
			Media:  `["https://pbs.twimg.com/media/m5.jpg","https://pbs.twimg.com/media/m6.jpg"]`,
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-01T00:00:00Z", Text: "oldest"},
	)
	reader, _ := newReader(t, dir)

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	got := collectionByName(t, collections, "Cap")
	want := []string{
		"https://pbs.twimg.com/media/m1.jpg",
		"https://pbs.twimg.com/media/m2.jpg",
		"https://pbs.twimg.com/media/m3.jpg",
		"https://pbs.twimg.com/media/m4.jpg",
	}
	if !equalStrings(got.CoverMedia, want) {
		t.Fatalf("CoverMedia = %v, want newest-first capped at 4 %v", got.CoverMedia, want)
	}
}

func TestCollectionsEmptyAndTimestampLessSortLast(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "full", "Full",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-05T00:00:00Z", Text: "has a timestamp"},
	)
	dbtest.Collection(t, conn, "no-rows", "No Rows")
	emptyID := dbtest.Collection(t, conn, "empty-rows", "Empty Rows")
	// A row whose saved_at was hand-edited to nothing: it is dropped, so the
	// collection has no valid rows and behaves like an empty one.
	insertRaw(t, conn, emptyID, dbtest.Row{
		TweetID: "2", URL: "https://x.com/u/status/2",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "", Text: "no saved_at so it is dropped",
		Media: "[]",
	})

	reader, _ := newReader(t, dir)
	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	if len(collections) != 3 {
		t.Fatalf("Collections() returned %d collections, want 3: %+v", len(collections), collections)
	}
	if collections[0].Name != "Full" {
		t.Fatalf("first collection = %q, want the one with a timestamp", collections[0].Name)
	}
	for _, collection := range collections[1:] {
		if collection.LastSavedAt != nil {
			t.Errorf("%s LastSavedAt = %v, want nil", collection.Name, *collection.LastSavedAt)
		}
		if collection.PostCount != 0 || collection.MediaCount != 0 {
			t.Errorf("%s counts = %d/%d, want 0/0", collection.Name, collection.PostCount, collection.MediaCount)
		}
		if collection.CoverMedia == nil || len(collection.CoverMedia) != 0 {
			t.Errorf("%s CoverMedia = %v, want []", collection.Name, collection.CoverMedia)
		}
	}
}

func TestCollectionsMissingDatabaseIsEmpty(t *testing.T) {
	// The directory exists but holds no database: the fresh-install state must
	// read as an empty gallery rather than an error.
	reader, _ := newReader(t, t.TempDir())
	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	if len(collections) != 0 {
		t.Fatalf("collections = %+v, want none", collections)
	}
}

// --- parsing fault tolerance (Specific Ideas 2, 3, 4) ----------------------

func TestPostsMalformedMediaJSONBecomesEmptyAndWarns(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "media", "Media",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1", Media: "not-json",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "bad media"},
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Media:  `["https://pbs.twimg.com/media/ok.jpg"]`,
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z", Text: "good media"},
	)
	reader, logs := newReader(t, dir)

	page := mustPosts(t, reader, "media", gallery.RawQuery{Sort: "saved_desc"})
	if len(page.Items) != 2 {
		t.Fatalf("Items = %d, want 2 (the malformed-media post is still returned)", len(page.Items))
	}
	bad := page.Items[1]
	if bad.Media == nil || len(bad.Media) != 0 {
		t.Errorf("malformed media => %v, want []", bad.Media)
	}
	if bad.Text != "bad media" {
		t.Errorf("text = %q, want the row preserved as a text card", bad.Text)
	}
	if !strings.Contains(logs.String(), "malformed media json") {
		t.Errorf("expected a malformed-media warning, logs = %q", logs.String())
	}
	if !strings.Contains(logs.String(), "slug=media") {
		t.Errorf("warning should name the collection, logs = %q", logs.String())
	}
}

func TestPostsMalformedRowsAreSkippedWithWarnings(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	id := dbtest.Collection(t, conn, "rows", "Rows")

	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "1",
		SavedAt: "2026-09-02T00:00:00Z", Text: "good one"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "", Text: "missing saved_at", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "3", URL: "https://x.com/u/status/3",
		Author: "", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "missing author", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "4", URL: "",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "missing url", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "5", URL: "https://x.com/u/status/5",
		Author: "A", Username: "@a",
		TweetDate: "not-a-date", SavedAt: "2026-09-02T00:00:00Z", Text: "bad tweet_date", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "6", URL: "https://x.com/u/status/6",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "not-a-timestamp", Text: "bad saved_at", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{TweetID: "7", URL: "https://example.com/not-a-tweet",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "unparseable url", Media: "[]"})
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "8",
		SavedAt: "2026-09-02T00:00:00Z", Text: "good two"})

	reader, logs := newReader(t, dir)

	page := mustPosts(t, reader, "rows", gallery.RawQuery{})
	if got := itemIDs(page); !equalStrings(got, []string{"8", "1"}) {
		t.Fatalf("surviving ids = %v, want [8 1] (default saved_desc)", got)
	}
	if !strings.Contains(logs.String(), "skipping malformed bookmark") {
		t.Errorf("expected malformed-row warnings, logs = %q", logs.String())
	}
	for _, reason := range []string{
		"missing saved_at",
		"missing author",
		"tweet_date is not RFC3339",
		"saved_at is not RFC3339",
		"url is not a canonical tweet URL",
	} {
		if !strings.Contains(logs.String(), reason) {
			t.Errorf("logs missing reason %q: %q", reason, logs.String())
		}
	}
}

func TestPostsRowWithoutMediaYieldsEmptyMedia(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	// A hand-edited row whose media cell is empty (not the "[]" the writer
	// emits) must still render as a media-less text card.
	noMediaID := dbtest.Collection(t, conn, "no-media", "No Media")
	insertRaw(t, conn, noMediaID, dbtest.Row{
		TweetID: "77", URL: "https://x.com/u/status/77",
		Author: "Old Author", Username: "@old",
		TweetDate: "2026-08-01T00:00:00Z", SavedAt: "2026-08-02T00:00:00Z",
		Text: "a row stored without a media value, with a comma", Media: "",
	})
	// A media-bearing row next to it must still resolve.
	dbtest.Seed(t, conn, "current", "Current",
		dbtest.Row{TweetID: "88", URL: "https://x.com/u/status/88",
			Media:  `["https://pbs.twimg.com/media/n.jpg"]`,
			Author: "New Author", Username: "@new",
			TweetDate: "2026-08-03T00:00:00Z", SavedAt: "2026-08-04T00:00:00Z", Text: "with media"},
	)
	reader, _ := newReader(t, dir)

	noMedia := mustPosts(t, reader, "no-media", gallery.RawQuery{})
	if len(noMedia.Items) != 1 {
		t.Fatalf("no-media Items = %d, want 1", len(noMedia.Items))
	}
	got := noMedia.Items[0]
	if got.TweetID != "77" || got.Author != "Old Author" || got.Username != "@old" ||
		got.Text != "a row stored without a media value, with a comma" {
		t.Fatalf("no-media post misparsed: %+v", got)
	}
	if got.Media == nil || len(got.Media) != 0 {
		t.Errorf("no-media Media = %v, want []", got.Media)
	}
	if got.SavedAt != "2026-08-02T00:00:00Z" {
		t.Errorf("no-media SavedAt = %q", got.SavedAt)
	}

	current := mustPosts(t, reader, "current", gallery.RawQuery{})
	if len(current.Items) != 1 || len(current.Items[0].Media) != 1 {
		t.Fatalf("current collection misparsed: %+v", current.Items)
	}
}

func TestPostsEdgeCharactersRoundTrip(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	text := "line one\nline two, with \"quotes\" and a comma; emoji 🎉 and unicode—dash"
	dbtest.Seed(t, conn, "edge", "Edge",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Media:  `["https://pbs.twimg.com/media/é.jpg"]`,
			Author: "Ünïcode Áuthor", Username: "@ünï",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: text},
	)
	reader, _ := newReader(t, dir)

	page := mustPosts(t, reader, "edge", gallery.RawQuery{})
	if len(page.Items) != 1 {
		t.Fatalf("Items = %d, want 1", len(page.Items))
	}
	if page.Items[0].Text != text {
		t.Errorf("Text = %q, want %q", page.Items[0].Text, text)
	}
	if page.Items[0].Author != "Ünïcode Áuthor" {
		t.Errorf("Author = %q", page.Items[0].Author)
	}
}

func TestPostsUnknownSlugIsNotFound(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "present", "Present",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1"},
	)
	reader, _ := newReader(t, dir)

	// A syntactically valid slug that resolves to no collection row is a clean
	// 404 signal, not an empty page.
	if _, err := reader.Posts("absent", gallery.Query{}); !errors.Is(err, gallery.ErrCollectionNotFound) {
		t.Fatalf("Posts(\"absent\") error = %v, want ErrCollectionNotFound", err)
	}
}

// --- freshness (Specific Idea 8) -------------------------------------------

func TestEveryCallRereadsTheDatabaseWithoutCache(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	id := dbtest.Seed(t, conn, "fresh", "Fresh",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "first"},
	)
	reader, _ := newReader(t, dir)

	first := mustPosts(t, reader, "fresh", gallery.RawQuery{})
	if len(first.Items) != 1 {
		t.Fatalf("first read Items = %d, want 1", len(first.Items))
	}

	// A bookmark saved while the server runs must be visible immediately.
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
		Author: "A", Username: "@a",
		TweetDate: "2026-09-03T00:00:00Z", SavedAt: "2026-09-04T00:00:00Z", Text: "second"})

	second := mustPosts(t, reader, "fresh", gallery.RawQuery{Sort: "saved_asc"})
	if got := itemIDs(second); !equalStrings(got, []string{"1", "2"}) {
		t.Fatalf("second read ids = %v, want [1 2] with the fresh row visible", got)
	}

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	got := collectionByName(t, collections, "Fresh")
	if got.PostCount != 2 || got.LastSavedAt == nil || *got.LastSavedAt != "2026-09-04T00:00:00Z" {
		t.Fatalf("summary = %+v, want 2 posts and the new last_saved_at", got)
	}
}

// --- slug safety (Specific Idea 9) -----------------------------------------

func TestPostsRejectsTraversalAndInvalidSlugs(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "linux", "Linux",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "ok"},
	)
	reader, _ := newReader(t, dir)

	for _, slug := range []string{
		"../etc/passwd",
		"/etc/passwd",
		"a/b",
		`a\b`,
		"~/linux",
		"..",
		"linux/../linux",
		".hidden",
		"linux ",
		"Linux",
		"",
	} {
		t.Run(slug, func(t *testing.T) {
			_, err := reader.Posts(slug, gallery.Query{})
			if err == nil {
				t.Fatalf("Posts(%q) succeeded, want an error", slug)
			}
		})
	}

	if _, err := reader.Posts("absent", gallery.Query{}); !errors.Is(err, gallery.ErrCollectionNotFound) {
		t.Fatalf("Posts(\"absent\") error = %v, want ErrCollectionNotFound", err)
	}
}

func equalStrings(a, b []string) bool {
	if len(a) != len(b) {
		return false
	}
	for i := range a {
		if a[i] != b[i] {
			return false
		}
	}
	return true
}
