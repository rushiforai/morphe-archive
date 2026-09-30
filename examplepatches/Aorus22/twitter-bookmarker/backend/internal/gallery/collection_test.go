package gallery_test

import (
	"testing"

	"twitter-bookmarker/internal/dbtest"
)

func TestCollectionsOrderingTieBreaksDeterministically(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	same := "2026-09-05T00:00:00Z"

	dbtest.Seed(t, conn, "b-second", "B Second",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: same, Text: "b"},
	)
	dbtest.Seed(t, conn, "a-first", "A First",
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Author: "A", Username: "@a",
			TweetDate: "2026-09-01T00:00:00Z", SavedAt: same, Text: "a"},
	)
	dbtest.Collection(t, conn, "z-empty", "Z Empty")
	dbtest.Collection(t, conn, "y-empty", "Y Empty")

	reader, _ := newReader(t, dir)
	collections, err := reader.Collections()
	if err != nil {
		t.Fatalf("Collections() error = %v", err)
	}

	// Collections with the same last_saved_at tie-break by slug ascending, and
	// timestamp-less collections sort last, also by slug.
	want := []string{"A First", "B Second", "Y Empty", "Z Empty"}
	got := make([]string, 0, len(collections))
	for _, collection := range collections {
		got = append(got, collection.Name)
	}
	if !equalStrings(got, want) {
		t.Fatalf("order = %v, want %v", got, want)
	}
}
