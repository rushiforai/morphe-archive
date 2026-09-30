package gallery_test

import (
	"fmt"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/gallery"
)

// This file is the Phase 10 (HARD-01) hardening suite for the read layer. It
// pins the four fault-tolerance behaviours PRD-2 §50/§51/§68 require, as a set,
// plus the blanket invariant that no malformed input can panic the server-side
// reader. The individual behaviours each have a narrower test elsewhere
// (reader_test.go); what this file adds is the "one bad row does not take the
// collection down" pairing, the hand-edited row, the 5,000-row bound, and the
// panic guard.

// assertNoPanic runs fn and fails the test if it panics, naming the input.
func assertNoPanic(t *testing.T, label string, fn func()) {
	t.Helper()
	defer func() {
		if recovered := recover(); recovered != nil {
			t.Fatalf("%s panicked: %v", label, recovered)
		}
	}()
	fn()
}

// TestHardeningMalformedMediaRowDoesNotTakeDownTheCollection is PRD-2 §50: a
// malformed `media` value must degrade to a text card while every other row in
// the same collection still reads.
func TestHardeningMalformedMediaRowDoesNotTakeDownTheCollection(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "mixed", "Mixed",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Media:  `["https://pbs.twimg.com/media/one.jpg"]`,
			Author: "First", Username: "@first",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-04T00:00:00Z", Text: "good with media"},
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Media:  `{"not":"an array"}`,
			Author: "Broken", Username: "@broken",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z", Text: "broken media cell"},
		dbtest.Row{TweetID: "3", URL: "https://x.com/u/status/3",
			Media:  `not-json-at-all`,
			Author: "Broken Too", Username: "@brokentoo",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "also broken"},
		dbtest.Row{TweetID: "4", URL: "https://x.com/u/status/4",
			Media:  `["https://pbs.twimg.com/media/two.jpg"]`,
			Author: "Last", Username: "@last",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-01T00:00:00Z", Text: "good with media"},
	)
	reader, logs := newReader(t, dir)

	var page gallery.Page
	assertNoPanic(t, "Posts on a collection with malformed media", func() {
		page = mustPosts(t, reader, "mixed", gallery.RawQuery{Sort: "tweet_asc"})
	})

	if len(page.Items) != 4 {
		t.Fatalf("Items = %d, want 4 — a malformed media cell must not drop or crash the row", len(page.Items))
	}
	for _, id := range []string{"2", "3"} {
		post := postByID(t, page, id)
		if post.Media == nil || len(post.Media) != 0 {
			t.Errorf("post %s Media = %v, want [] (degraded to a text card)", id, post.Media)
		}
		if strings.TrimSpace(post.Text) == "" {
			t.Errorf("post %s lost its text; a malformed media cell must keep the text card", id)
		}
	}
	for _, id := range []string{"1", "4"} {
		if got := len(postByID(t, page, id).Media); got != 1 {
			t.Errorf("valid post %s Media = %d, want 1 (a sibling's bad cell must not poison it)", id, got)
		}
	}
	if !strings.Contains(logs.String(), "malformed media json") {
		t.Errorf("expected a malformed-media warning, logs = %q", logs.String())
	}

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	summary := collectionByName(t, collections, "Mixed")
	if summary.PostCount != 4 {
		t.Errorf("summary PostCount = %d, want 4", summary.PostCount)
	}
	// Only the two valid media cells count: the malformed ones contribute none.
	if summary.MediaCount != 2 {
		t.Errorf("summary MediaCount = %d, want 2", summary.MediaCount)
	}
}

// TestHardeningMalformedRowInTheMiddleIsSkipped is PRD-2 §51: a bad row in the
// middle of a collection is skipped with a warning and the surrounding rows
// survive.
func TestHardeningMalformedRowInTheMiddleIsSkipped(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	id := dbtest.Collection(t, conn, "rows", "Rows")
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "1",
		SavedAt: "2026-09-01T00:00:00Z", Text: "before 1"})
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "2",
		SavedAt: "2026-09-02T00:00:00Z", Text: "before 2"})
	// The malformed row: a hand edit that left the author blank. The reader must
	// reject it per row rather than aborting the collection.
	insertRaw(t, conn, id, dbtest.Row{
		TweetID: "3", URL: "https://x.com/u/status/3",
		Author: "", Username: "@b",
		TweetDate: "2026-09-03T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z",
		Text: "hand-edited row", Media: "[]",
	})
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "4",
		SavedAt: "2026-09-04T00:00:00Z", Text: "after 1"})
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "5",
		SavedAt: "2026-09-05T00:00:00Z", Text: "after 2"})
	reader, logs := newReader(t, dir)

	var page gallery.Page
	assertNoPanic(t, "Posts on a collection with a malformed middle row", func() {
		page = mustPosts(t, reader, "rows", gallery.RawQuery{Sort: "tweet_asc"})
	})

	want := []string{"1", "2", "4", "5"}
	if got := itemIDs(page); !equalStrings(got, want) {
		t.Fatalf("surviving ids = %v, want %v (only the middle row is skipped)", got, want)
	}
	if !strings.Contains(logs.String(), "skipping malformed bookmark") {
		t.Errorf("expected a skipped-row warning, logs = %q", logs.String())
	}
	if !strings.Contains(logs.String(), "missing author") {
		t.Errorf("warning should name the malformed field, logs = %q", logs.String())
	}

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	if got := collectionByName(t, collections, "Rows").PostCount; got != 4 {
		t.Errorf("summary PostCount = %d, want 4", got)
	}
}

// TestHardeningHandEditedTimestampIsSkipped pins the degradation of a database
// row edited by hand: a non-RFC3339 saved_at drops that row with a warning, the
// valid rows in the same collection survive, and a neighbouring collection is
// untouched.
func TestHardeningHandEditedTimestampIsSkipped(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	id := dbtest.Collection(t, conn, "edited", "Edited")
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "71", URL: "https://x.com/old/status/71",
		Author: "Old Timer", Username: "@oldtimer",
		TweetDate: "2026-01-01T00:00:00Z", SavedAt: "2026-01-02T00:00:00Z",
		Text: "reads normally", Media: "[]"})
	insertRaw(t, conn, id, dbtest.Row{
		TweetID: "72", URL: "https://x.com/old/status/72",
		Author: "Old Timer", Username: "@oldtimer",
		TweetDate: "2026-01-03T00:00:00Z", SavedAt: "yesterday",
		Text: "hand-edited saved_at", Media: "[]",
	})
	dbtest.Seed(t, conn, "intact", "Intact",
		dbtest.Row{TweetID: "81", URL: "https://x.com/new/status/81",
			Media:  `["https://pbs.twimg.com/media/n.jpg"]`,
			Author: "New Timer", Username: "@newtimer",
			TweetDate: "2026-02-01T00:00:00Z", SavedAt: "2026-02-02T00:00:00Z", Text: "neighbour"},
	)
	reader, logs := newReader(t, dir)

	var edited gallery.Page
	assertNoPanic(t, "Posts on a collection with a hand-edited timestamp", func() {
		edited = mustPosts(t, reader, "edited", gallery.RawQuery{Sort: "tweet_asc"})
	})
	if len(edited.Items) != 1 {
		t.Fatalf("edited Items = %d, want 1", len(edited.Items))
	}
	first := edited.Items[0]
	if first.TweetID != "71" || first.Author != "Old Timer" || first.Username != "@oldtimer" {
		t.Errorf("surviving post misparsed: %+v", first)
	}
	if first.Media == nil || len(first.Media) != 0 {
		t.Errorf("Media = %v, want []", first.Media)
	}
	if !strings.Contains(logs.String(), "saved_at is not RFC3339") {
		t.Errorf("expected a bad-timestamp warning, logs = %q", logs.String())
	}

	// The neighbouring collection is unaffected by the skip.
	intact := mustPosts(t, reader, "intact", gallery.RawQuery{})
	if len(intact.Items) != 1 || len(intact.Items[0].Media) != 1 {
		t.Fatalf("neighbouring collection misparsed: %+v", intact.Items)
	}

	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	if got := collectionByName(t, collections, "Edited").PostCount; got != 1 {
		t.Errorf("edited summary PostCount = %d, want 1", got)
	}
	if got := collectionByName(t, collections, "Intact").PostCount; got != 1 {
		t.Errorf("intact summary PostCount = %d, want 1", got)
	}
}

// TestHardeningLargeDatabaseSummaryAndPagedQueryComplete is PRD-2 §68: a
// personal dataset of ~5,000 rows is acceptable on a local machine. Both a full
// summary and a paginated query must finish without error inside a generous
// bound that would still catch an accidental O(n²) rescan-per-row.
func TestHardeningLargeDatabaseSummaryAndPagedQueryComplete(t *testing.T) {
	const rows = 5000
	const bound = 10 * time.Second

	dir := t.TempDir()
	conn := dbtest.Open(t, dir)

	fixtures := make([]dbtest.Row, 0, rows)
	for i := 1; i <= rows; i++ {
		media := "[]"
		if i%3 == 0 {
			media = fmt.Sprintf(`["https://pbs.twimg.com/media/large%d.jpg"]`, i)
		}
		fixtures = append(fixtures, dbtest.Row{
			TweetID:  fmt.Sprintf("%d", i),
			URL:      fmt.Sprintf("https://x.com/bulk/status/%d", i),
			Media:    media,
			Author:   fmt.Sprintf("Author %d", i%17),
			Username: fmt.Sprintf("@bulk%05d", i),
			// One distinct UTC instant per row, oldest first, so paging order
			// is deterministic.
			TweetDate: time.Date(2026, 1, 1, 0, 0, 0, 0, time.UTC).Add(time.Duration(i) * time.Minute).Format(time.RFC3339),
			SavedAt:   time.Date(2026, 2, 1, 0, 0, 0, 0, time.UTC).Add(time.Duration(i) * time.Minute).Format(time.RFC3339),
			Text:      fmt.Sprintf("Bulk post %d with searchable haystack text.", i),
		})
	}
	dbtest.Seed(t, conn, "large", "Large", fixtures...)

	reader, _ := newReader(t, dir)

	var collections []gallery.Collection
	var err error
	assertNoPanic(t, "Collections on a 5,000-row database", func() {
		start := time.Now()
		collections, err = reader.Collections()
		if elapsed := time.Since(start); elapsed > bound {
			t.Errorf("Collections() over %d rows took %s, want <= %s", rows, elapsed, bound)
		}
	})
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}
	summary := collectionByName(t, collections, "Large")
	if summary.PostCount != rows {
		t.Fatalf("summary PostCount = %d, want %d", summary.PostCount, rows)
	}
	// Every third row carries exactly one media URL.
	if want := rows / 3; summary.MediaCount != want {
		t.Errorf("summary MediaCount = %d, want %d", summary.MediaCount, want)
	}
	if summary.LastSavedAt == nil {
		t.Fatal("summary LastSavedAt = nil, want the newest saved_at")
	}
	if len(summary.CoverMedia) != gallery.CoverMediaLimit {
		t.Errorf("CoverMedia = %d, want %d", len(summary.CoverMedia), gallery.CoverMediaLimit)
	}

	var page1 gallery.Page
	assertNoPanic(t, "first paginated query on a 5,000-row database", func() {
		start := time.Now()
		page1 = mustPosts(t, reader, "large", gallery.RawQuery{Sort: "saved_desc", Limit: "30"})
		if elapsed := time.Since(start); elapsed > bound {
			t.Errorf("first page query took %s, want <= %s", elapsed, bound)
		}
	})
	if len(page1.Items) != 30 {
		t.Fatalf("first page Items = %d, want 30", len(page1.Items))
	}
	if !page1.HasMore || page1.NextCursor == "" {
		t.Fatalf("first page HasMore = %v NextCursor = %q, want a next page", page1.HasMore, page1.NextCursor)
	}

	// Newest saved first, so the 5,000th row leads and row 4,971 closes page 1.
	if got := page1.Items[0].TweetID; got != "5000" {
		t.Errorf("first page head TweetID = %q, want 5000", got)
	}
	if got := page1.Items[len(page1.Items)-1].TweetID; got != "4971" {
		t.Errorf("first page tail TweetID = %q, want 4971", got)
	}

	var page2 gallery.Page
	assertNoPanic(t, "second paginated query on a 5,000-row database", func() {
		page2 = mustPosts(t, reader, "large", gallery.RawQuery{
			Sort: "saved_desc", Limit: "30", Cursor: page1.NextCursor,
		})
	})
	if len(page2.Items) != 30 {
		t.Fatalf("second page Items = %d, want 30", len(page2.Items))
	}
	if got := page2.Items[0].TweetID; got != "4970" {
		t.Errorf("second page head TweetID = %q, want 4970 (cursor must not overlap page 1)", got)
	}

	// A search over the whole 5,000-row database must also complete.
	var searched gallery.Page
	assertNoPanic(t, "searched paginated query on a 5,000-row database", func() {
		start := time.Now()
		searched = mustPosts(t, reader, "large", gallery.RawQuery{Q: "haystack", Sort: "saved_desc", Limit: "30"})
		if elapsed := time.Since(start); elapsed > bound {
			t.Errorf("searched query took %s, want <= %s", elapsed, bound)
		}
	})
	if len(searched.Items) != 30 || !searched.HasMore {
		t.Errorf("searched page = %d items hasMore=%v, want a full first page", len(searched.Items), searched.HasMore)
	}
}

// TestHardeningReaderNeverPanics runs the reader over a corpus of hostile rows
// and asserts that neither Collections nor Posts ever panics. A panic in the
// HTTP path would take the whole server down, so this is the blanket invariant
// behind the individual degradation rules (PRD-2 §50/§51/§68).
func TestHardeningReaderNeverPanics(t *testing.T) {
	corpus := []struct {
		slug string
		rows []dbtest.Row
	}{
		{"empty", nil},
		{"binary", []dbtest.Row{
			{TweetID: "h1", URL: "https://x.com/u/status/1", Text: "\x00\x01\x02\xff\xfe binary \x00 garbage"},
		}},
		{"nul-in-cell", []dbtest.Row{
			{TweetID: "h2", URL: "https://x.com/u/status/2", Author: "Au\x00thor", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "text", Media: "[]"},
		}},
		{"unterminated-quote", []dbtest.Row{
			{TweetID: "h3", URL: "https://x.com/u/status/3", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "text", Media: `["x`},
		}},
		{"duplicate-urls", []dbtest.Row{
			{TweetID: "h4", URL: "https://x.com/u/status/4", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "first", Media: "[]"},
			{TweetID: "h4-duplicate", URL: "https://x.com/u/status/4", Author: "B", Username: "@b",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z", Text: "second", Media: "[]"},
		}},
		{"no-url", []dbtest.Row{
			{TweetID: "h5", URL: "", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "no url", Media: "[]"},
		}},
		{"ragged", []dbtest.Row{
			{TweetID: "h6", URL: "1"},
			{TweetID: "h7", URL: "2", Author: "B"},
			{TweetID: "h8", URL: "https://x.com/u/status/8", Author: "C", Username: "@c",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "complete", Media: "[]"},
		}},
		{"huge-field", []dbtest.Row{
			{TweetID: "h9", URL: "https://x.com/u/status/9", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z",
				Text: strings.Repeat("x", 1<<20), Media: "[]"},
		}},
		{"bom", []dbtest.Row{
			{TweetID: "h10", URL: "https://x.com/u/status/10", Author: "\ufeffA", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "text", Media: "[]"},
		}},
		{"crlf", []dbtest.Row{
			{TweetID: "h11", URL: "https://x.com/u/status/11", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "line\r\nline", Media: "[]"},
		}},
		{"not-a-tweet-url", []dbtest.Row{
			{TweetID: "h12", URL: "javascript:alert(1)", Author: "A", Username: "@a",
				TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "text", Media: "[]"},
		}},
		{"negative-date", []dbtest.Row{
			{TweetID: "h13", URL: "https://x.com/u/status/13", Author: "A", Username: "@a",
				TweetDate: "0001-01-01T00:00:00Z", SavedAt: "9999-12-31T23:59:59Z", Text: "text", Media: "[]"},
		}},
	}

	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	for _, entry := range corpus {
		id := dbtest.Collection(t, conn, entry.slug, "")
		for _, row := range entry.rows {
			insertRaw(t, conn, id, row)
		}
	}
	// One syntactically valid collection guarantees Collections() has real work
	// to do while it walks the hostile neighbours.
	dbtest.Seed(t, conn, "valid", "Valid",
		dbtest.Row{TweetID: "v1", URL: "https://x.com/u/status/100",
			Media:  `["https://pbs.twimg.com/media/ok.jpg"]`,
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "valid row"},
	)

	reader, _ := newReader(t, dir)

	// Collections walks every collection, including the hostile ones.
	assertNoPanic(t, "Collections over the hostile corpus", func() {
		collections, err := reader.Collections()
		if err != nil {
			t.Fatalf("Collections() error = %v", err)
		}
		if len(collections) != len(corpus)+1 {
			t.Fatalf("Collections() returned %d collections, want %d (every collection must survive)",
				len(collections), len(corpus)+1)
		}
	})

	slugs := make([]string, 0, len(corpus)+4)
	for _, entry := range corpus {
		slugs = append(slugs, entry.slug)
	}
	// Syntactically invalid and unknown slugs are part of the hostile corpus too.
	slugs = append(slugs, "absent", "a/b", "..", "")

	for _, slug := range slugs {
		for _, query := range []gallery.RawQuery{
			{},
			{Sort: "tweet_asc", Limit: "100"},
			{Q: "text"},
			{Limit: "1"},
		} {
			name, raw := slug, query
			assertNoPanic(t, fmt.Sprintf("Posts(%q, %+v)", name, raw), func() {
				parsed, err := raw.Parse()
				if err != nil {
					return // a validation rejection is a fine outcome, not a panic
				}
				if _, err := reader.Posts(name, parsed); err != nil {
					return // a clean error is a fine outcome
				}
			})
		}
	}
}

// postByID returns the post with the given tweet_id, failing the test if absent.
func postByID(t *testing.T, page gallery.Page, id string) gallery.Post {
	t.Helper()
	for _, item := range page.Items {
		if item.TweetID == id {
			return item
		}
	}
	t.Fatalf("post %s not found in %v", id, itemIDs(page))
	return gallery.Post{}
}
