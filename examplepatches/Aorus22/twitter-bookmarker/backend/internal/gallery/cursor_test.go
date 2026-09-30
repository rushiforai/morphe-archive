package gallery_test

import (
	"encoding/base64"
	"strconv"
	"strings"
	"testing"
	"time"

	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/gallery"
)

// walkPages pages through a collection with limit until exhaustion, returning
// the ids in visit order and the number of pages.
func walkPages(t *testing.T, reader *gallery.Reader, slug string, query gallery.Query, limit int) ([]string, int) {
	t.Helper()
	query.Limit = limit
	ids := make([]string, 0, 8)
	pages := 0
	for {
		page, err := reader.Posts(slug, query)
		if err != nil {
			t.Fatalf("Posts() error = %v", err)
		}
		pages++
		if pages > 50 {
			t.Fatal("cursor walk did not terminate")
		}
		ids = append(ids, itemIDs(page)...)
		if !page.HasMore {
			if page.NextCursor != "" {
				t.Fatalf("terminal page has next_cursor = %q, want empty", page.NextCursor)
			}
			return ids, pages
		}
		if page.NextCursor == "" {
			t.Fatal("has_more page has an empty next_cursor")
		}
		query.Cursor = page.NextCursor
	}
}

func TestCursorWalkCoversEveryPostExactlyOnce(t *testing.T) {
	reader := seedQueryCollection(t)

	ids, pages := walkPages(t, reader, "query", gallery.Query{Sort: gallery.SortSavedDesc}, 2)
	want := []string{"105", "103", "101", "102", "104"}
	if !equalStrings(ids, want) {
		t.Fatalf("walk ids = %v, want %v", ids, want)
	}
	if pages != 3 {
		t.Fatalf("pages = %d, want 3", pages)
	}

	seen := map[string]bool{}
	for _, id := range ids {
		if seen[id] {
			t.Fatalf("duplicate id %s in walk %v", id, ids)
		}
		seen[id] = true
	}
}

func TestCursorWalkForEverySortMode(t *testing.T) {
	reader := seedQueryCollection(t)

	tests := []struct {
		mode gallery.SortMode
		want []string
	}{
		{mode: gallery.SortSavedDesc, want: []string{"105", "103", "101", "102", "104"}},
		{mode: gallery.SortSavedAsc, want: []string{"104", "102", "101", "103", "105"}},
		{mode: gallery.SortTweetDesc, want: []string{"105", "104", "103", "102", "101"}},
		{mode: gallery.SortTweetAsc, want: []string{"101", "102", "103", "104", "105"}},
	}
	for _, test := range tests {
		t.Run(string(test.mode), func(t *testing.T) {
			ids, _ := walkPages(t, reader, "query", gallery.Query{Sort: test.mode}, 2)
			if !equalStrings(ids, test.want) {
				t.Errorf("walk ids = %v, want %v", ids, test.want)
			}
		})
	}
}

func TestCursorWalkEndsCleanlyOnAnExactMultiple(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "even", "Even",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a", TweetDate: "2026-09-01T00:00:00Z", SavedAt: "2026-09-01T00:00:00Z", Text: "one"},
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Author: "A", Username: "@a", TweetDate: "2026-09-02T00:00:00Z", SavedAt: "2026-09-02T00:00:00Z", Text: "two"},
		dbtest.Row{TweetID: "3", URL: "https://x.com/u/status/3",
			Author: "A", Username: "@a", TweetDate: "2026-09-03T00:00:00Z", SavedAt: "2026-09-03T00:00:00Z", Text: "three"},
		dbtest.Row{TweetID: "4", URL: "https://x.com/u/status/4",
			Author: "A", Username: "@a", TweetDate: "2026-09-04T00:00:00Z", SavedAt: "2026-09-04T00:00:00Z", Text: "four"},
	)
	reader, _ := newReader(t, dir)

	query := gallery.Query{Limit: 2}
	first, err := reader.Posts("even", query)
	if err != nil {
		t.Fatalf("Posts() error = %v", err)
	}
	if got := itemIDs(first); !equalStrings(got, []string{"4", "3"}) {
		t.Fatalf("page 1 ids = %v, want [4 3]", got)
	}
	if !first.HasMore {
		t.Fatal("page 1 has_more = false, want true")
	}

	query.Cursor = first.NextCursor
	second, err := reader.Posts("even", query)
	if err != nil {
		t.Fatalf("Posts() error = %v", err)
	}
	if got := itemIDs(second); !equalStrings(got, []string{"2", "1"}) {
		t.Fatalf("page 2 ids = %v, want [2 1]", got)
	}
	if second.HasMore || second.NextCursor != "" {
		t.Fatalf("page 2 = %+v, want has_more=false and an empty cursor", second)
	}
}

func TestCursorStaysStableWhenARowIsAppendedMidScroll(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	id := dbtest.Seed(t, conn, "drift", "Drift",
		dbtest.Row{TweetID: "1", URL: "https://x.com/u/status/1",
			Author: "A", Username: "@a", TweetDate: "2026-03-01T00:00:00Z", SavedAt: "2026-03-01T00:00:00Z", Text: "one"},
		dbtest.Row{TweetID: "2", URL: "https://x.com/u/status/2",
			Author: "A", Username: "@a", TweetDate: "2026-02-01T00:00:00Z", SavedAt: "2026-02-01T00:00:00Z", Text: "two"},
		dbtest.Row{TweetID: "3", URL: "https://x.com/u/status/3",
			Author: "A", Username: "@a", TweetDate: "2026-01-01T00:00:00Z", SavedAt: "2026-01-01T00:00:00Z", Text: "three"},
	)
	reader, _ := newReader(t, dir)

	query := gallery.Query{Limit: 2}
	first, err := reader.Posts("drift", query)
	if err != nil {
		t.Fatalf("Posts() error = %v", err)
	}
	if got := itemIDs(first); !equalStrings(got, []string{"1", "2"}) {
		t.Fatalf("page 1 ids = %v, want [1 2]", got)
	}

	// A newer bookmark lands while the reader is mid-scroll. It sorts before
	// the cursor, so page 2 must skip it and continue with the older rows.
	dbtest.Insert(t, conn, id, dbtest.Row{TweetID: "4", URL: "https://x.com/u/status/4",
		Author: "A", Username: "@a", TweetDate: "2026-04-01T00:00:00Z", SavedAt: "2026-04-01T00:00:00Z", Text: "four"})

	query.Cursor = first.NextCursor
	second, err := reader.Posts("drift", query)
	if err != nil {
		t.Fatalf("Posts() error = %v", err)
	}
	if got := itemIDs(second); !equalStrings(got, []string{"3"}) {
		t.Fatalf("page 2 ids = %v, want [3] with no repeats from page 1", got)
	}
	if second.HasMore || second.NextCursor != "" {
		t.Fatalf("page 2 = %+v, want an exhausted terminal page", second)
	}
}

func TestCursorIsOpaqueAndCarriesSortKeyPlusTweetID(t *testing.T) {
	reader := seedQueryCollection(t)

	page := runQuery(t, reader, "query", gallery.Query{Limit: 1, Sort: gallery.SortSavedDesc})
	if page.NextCursor == "" {
		t.Fatal("expected a next_cursor")
	}

	// Never a numeric offset.
	if _, err := strconv.Atoi(page.NextCursor); err == nil {
		t.Fatalf("cursor %q is a plain number; pagination must be opaque", page.NextCursor)
	}

	decoded, err := base64.RawURLEncoding.DecodeString(page.NextCursor)
	if err != nil {
		t.Fatalf("cursor %q is not URL-safe base64: %v", page.NextCursor, err)
	}
	parts := strings.SplitN(string(decoded), "|", 2)
	if len(parts) != 2 {
		t.Fatalf("decoded cursor %q does not carry '<timestamp>|<tweet_id>'", decoded)
	}
	if _, err := time.Parse(time.RFC3339Nano, parts[0]); err != nil {
		t.Fatalf("decoded cursor timestamp %q is not RFC3339: %v", parts[0], err)
	}
	if parts[1] != "105" {
		t.Fatalf("decoded cursor tweet id = %q, want the last returned item 105", parts[1])
	}
}

func TestMalformedCursorsAreRejected(t *testing.T) {
	reader := seedQueryCollection(t)

	invalid := []string{
		"not base64!!",
		base64.RawURLEncoding.EncodeToString([]byte("no-separator")),
		base64.RawURLEncoding.EncodeToString([]byte("|105")),
		base64.RawURLEncoding.EncodeToString([]byte("2026-09-01T00:00:00Z|")),
		base64.RawURLEncoding.EncodeToString([]byte("yesterday|105")),
	}
	for _, cursor := range invalid {
		t.Run(cursor, func(t *testing.T) {
			_, err := reader.Posts("query", gallery.Query{Cursor: cursor})
			assertValidationError(t, err)
		})
	}
}
