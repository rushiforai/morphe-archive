package gallery_test

import (
	"errors"
	"testing"
	"time"

	"twitter-bookmarker/internal/dbtest"
	"twitter-bookmarker/internal/gallery"
	"twitter-bookmarker/internal/storage"
)

func seedQueryCollection(t *testing.T) *gallery.Reader {
	t.Helper()
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	dbtest.Seed(t, conn, "query", "Query",
		dbtest.Row{TweetID: "101", URL: "https://x.com/alice/status/101",
			Author: "Alice", Username: "@alice",
			TweetDate: "2026-01-10T00:00:00Z", SavedAt: "2026-03-01T00:00:00Z", Text: "Linux desktop setup"},
		dbtest.Row{TweetID: "102", URL: "https://x.com/bob/status/102",
			Author: "Bob", Username: "@linuxguy",
			TweetDate: "2026-02-20T00:00:00Z", SavedAt: "2026-02-01T00:00:00Z", Text: "Windows tips"},
		dbtest.Row{TweetID: "103", URL: "https://x.com/carol/status/103",
			Author: "Carol", Username: "@carol",
			TweetDate: "2026-03-15T00:00:00Z", SavedAt: "2026-04-01T00:00:00Z", Text: "another LINUX post"},
		dbtest.Row{TweetID: "104", URL: "https://x.com/dave/status/104",
			Author: "Dave", Username: "@dave",
			TweetDate: "2026-04-01T00:00:00Z", SavedAt: "2026-01-01T00:00:00Z", Text: "no match here"},
		dbtest.Row{TweetID: "105", URL: "https://x.com/erin/status/105",
			Author: "Erin", Username: "@erin",
			TweetDate: "2026-05-05T00:00:00Z", SavedAt: "2026-05-05T00:00:00Z", Text: "boundary test"},
	)
	reader, _ := newReader(t, dir)
	return reader
}

func runQuery(t *testing.T, reader *gallery.Reader, slug string, query gallery.Query) gallery.Page {
	t.Helper()
	page, err := reader.Posts(slug, query)
	if err != nil {
		t.Fatalf("Posts() error = %v", err)
	}
	return page
}

func assertValidationError(t *testing.T, err error) {
	t.Helper()
	if err == nil {
		t.Fatal("expected an error, got nil")
	}
	var invalid *storage.ValidationError
	if !errors.As(err, &invalid) {
		t.Fatalf("error = %v (%T), want *storage.ValidationError so the API maps it to 400", err, err)
	}
}

func TestSearchIsTrimmedCaseInsensitiveSubstring(t *testing.T) {
	reader := seedQueryCollection(t)

	tests := []struct {
		name string
		q    string
		want []string
	}{
		{name: "trimmed and case-insensitive across text", q: "  LiNuX  ", want: []string{"103", "101", "102"}},
		{name: "matches author", q: "alice", want: []string{"101"}},
		{name: "matches username", q: "linuxguy", want: []string{"102"}},
		{name: "empty means no search", q: "", want: []string{"105", "103", "101", "102", "104"}},
		{name: "whitespace is trimmed to no search", q: "   ", want: []string{"105", "103", "101", "102", "104"}},
		{name: "no match", q: "zzz-nothing", want: []string{}},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			page := runQuery(t, reader, "query", gallery.Query{Q: test.q})
			if got := itemIDs(page); !equalStrings(got, test.want) {
				t.Errorf("ids = %v, want %v", got, test.want)
			}
		})
	}
}

func TestDateFiltersAreIndependentCombinableAndInclusive(t *testing.T) {
	reader := seedQueryCollection(t)
	at := func(value string) *time.Time {
		t.Helper()
		parsed, err := time.Parse(time.RFC3339, value)
		if err != nil {
			t.Fatalf("parse %q: %v", value, err)
		}
		return &parsed
	}

	tests := []struct {
		name  string
		query gallery.Query
		want  []string
	}{
		{
			name:  "tweet range inclusive on both ends",
			query: gallery.Query{TweetFrom: at("2026-02-01T00:00:00Z"), TweetTo: at("2026-04-01T00:00:00Z")},
			want:  []string{"103", "102", "104"},
		},
		{
			name:  "tweet upper bound inclusive",
			query: gallery.Query{TweetTo: at("2026-02-20T00:00:00Z")},
			want:  []string{"101", "102"},
		},
		{
			name:  "saved lower bound inclusive",
			query: gallery.Query{SavedFrom: at("2026-04-01T00:00:00Z")},
			want:  []string{"105", "103"},
		},
		{
			name:  "saved range collapsed to a single day",
			query: gallery.Query{SavedFrom: at("2026-05-05T00:00:00Z"), SavedTo: at("2026-05-05T00:00:00Z")},
			want:  []string{"105"},
		},
		{
			name: "tweet and saved ranges combined",
			query: gallery.Query{
				TweetFrom: at("2026-02-01T00:00:00Z"),
				SavedFrom: at("2026-03-01T00:00:00Z"),
			},
			want: []string{"105", "103"},
		},
		{
			name: "range that matches nothing",
			query: gallery.Query{
				TweetFrom: at("2027-01-01T00:00:00Z"),
			},
			want: []string{},
		},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			page := runQuery(t, reader, "query", test.query)
			if got := itemIDs(page); !equalStrings(got, test.want) {
				t.Errorf("ids = %v, want %v", got, test.want)
			}
		})
	}
}

func TestSortModes(t *testing.T) {
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
			page := runQuery(t, reader, "query", gallery.Query{Sort: test.mode})
			if got := itemIDs(page); !equalStrings(got, test.want) {
				t.Errorf("ids = %v, want %v", got, test.want)
			}
		})
	}

	t.Run("empty sort defaults to saved_desc", func(t *testing.T) {
		page := runQuery(t, reader, "query", gallery.Query{})
		if got := itemIDs(page); !equalStrings(got, []string{"105", "103", "101", "102", "104"}) {
			t.Errorf("ids = %v, want saved_desc order", got)
		}
	})
}

func TestSortTieBreakIsTweetID(t *testing.T) {
	dir := t.TempDir()
	conn := dbtest.Open(t, dir)
	same := "2026-09-01T00:00:00Z"
	dbtest.Seed(t, conn, "tie", "Tie",
		dbtest.Row{TweetID: "200", URL: "https://x.com/u/status/200",
			Author: "A", Username: "@a", TweetDate: same, SavedAt: same, Text: "two"},
		dbtest.Row{TweetID: "300", URL: "https://x.com/u/status/300",
			Author: "A", Username: "@a", TweetDate: same, SavedAt: same, Text: "three"},
		dbtest.Row{TweetID: "100", URL: "https://x.com/u/status/100",
			Author: "A", Username: "@a", TweetDate: same, SavedAt: same, Text: "one"},
	)
	reader, _ := newReader(t, dir)

	desc := runQuery(t, reader, "tie", gallery.Query{Sort: gallery.SortSavedDesc})
	if got := itemIDs(desc); !equalStrings(got, []string{"300", "200", "100"}) {
		t.Errorf("saved_desc tie-break ids = %v, want [300 200 100]", got)
	}
	asc := runQuery(t, reader, "tie", gallery.Query{Sort: gallery.SortSavedAsc})
	if got := itemIDs(asc); !equalStrings(got, []string{"100", "200", "300"}) {
		t.Errorf("saved_asc tie-break ids = %v, want [100 200 300]", got)
	}
}

func TestOrderOfOperationsFiltersBeforePagination(t *testing.T) {
	reader := seedQueryCollection(t)

	// Search (3 matches) -> date filter (all remain) -> tweet_asc sort -> page.
	query := gallery.Query{
		Q:     "linux",
		Sort:  gallery.SortTweetAsc,
		Limit: 1,
	}
	first := runQuery(t, reader, "query", query)
	if got := itemIDs(first); !equalStrings(got, []string{"101"}) {
		t.Fatalf("page 1 ids = %v, want [101] (smallest tweet_date among matches)", got)
	}
	if !first.HasMore || first.NextCursor == "" {
		t.Fatalf("page 1 = %+v, want has_more with a cursor", first)
	}

	query.Cursor = first.NextCursor
	second := runQuery(t, reader, "query", query)
	if got := itemIDs(second); !equalStrings(got, []string{"102"}) {
		t.Fatalf("page 2 ids = %v, want [102]", got)
	}
}

func TestRawQueryParseDefaultsAndValidation(t *testing.T) {
	t.Run("defaults", func(t *testing.T) {
		query, err := (gallery.RawQuery{}).Parse()
		if err != nil {
			t.Fatalf("Parse() error = %v", err)
		}
		if query.Sort != gallery.SortSavedDesc {
			t.Errorf("Sort = %q, want saved_desc", query.Sort)
		}
		if query.Limit != gallery.DefaultLimit {
			t.Errorf("Limit = %d, want %d", query.Limit, gallery.DefaultLimit)
		}
	})

	t.Run("limit 100 is accepted", func(t *testing.T) {
		query, err := (gallery.RawQuery{Limit: "100"}).Parse()
		if err != nil {
			t.Fatalf("Parse() error = %v", err)
		}
		if query.Limit != gallery.MaxLimit {
			t.Errorf("Limit = %d, want %d", query.Limit, gallery.MaxLimit)
		}
	})

	t.Run("offset and date bounds parse as UTC instants", func(t *testing.T) {
		query, err := (gallery.RawQuery{SavedTo: "2026-09-30T23:59:59+07:00"}).Parse()
		if err != nil {
			t.Fatalf("Parse() error = %v", err)
		}
		if query.SavedTo == nil || query.SavedTo.UTC().Format(time.RFC3339) != "2026-09-30T16:59:59Z" {
			t.Errorf("SavedTo = %v, want the same instant in UTC", query.SavedTo)
		}
	})

	invalid := []struct {
		name  string
		query gallery.RawQuery
	}{
		{name: "limit zero", query: gallery.RawQuery{Limit: "0"}},
		{name: "limit over max", query: gallery.RawQuery{Limit: "101"}},
		{name: "limit negative", query: gallery.RawQuery{Limit: "-1"}},
		{name: "limit not an integer", query: gallery.RawQuery{Limit: "abc"}},
		{name: "unknown sort", query: gallery.RawQuery{Sort: "newest"}},
		{name: "bad tweet_from", query: gallery.RawQuery{TweetFrom: "yesterday"}},
		{name: "bad tweet_to", query: gallery.RawQuery{TweetTo: "2026-13-45"}},
		{name: "bad saved_from", query: gallery.RawQuery{SavedFrom: "2026/09/01"}},
		{name: "bad saved_to", query: gallery.RawQuery{SavedTo: "not-a-time"}},
	}
	for _, test := range invalid {
		t.Run(test.name, func(t *testing.T) {
			_, err := test.query.Parse()
			assertValidationError(t, err)
		})
	}
}

func TestQueryNormalizeRejectsInvalidValues(t *testing.T) {
	tests := []struct {
		name  string
		query gallery.Query
	}{
		{name: "unknown sort", query: gallery.Query{Sort: "bogus"}},
		{name: "limit over max", query: gallery.Query{Limit: gallery.MaxLimit + 1}},
		{name: "limit negative", query: gallery.Query{Limit: -5}},
	}
	for _, test := range tests {
		t.Run(test.name, func(t *testing.T) {
			_, err := test.query.Normalize()
			assertValidationError(t, err)
		})
	}
}

func TestQueryNormalizeAppliesProgrammaticDefaults(t *testing.T) {
	query, err := (gallery.Query{}).Normalize()
	if err != nil {
		t.Fatalf("Normalize() error = %v", err)
	}
	if query.Sort != gallery.SortSavedDesc {
		t.Errorf("Sort = %q, want saved_desc", query.Sort)
	}
	if query.Limit != gallery.DefaultLimit {
		t.Errorf("Limit = %d, want the %d default for a programmatic zero value", query.Limit, gallery.DefaultLimit)
	}
}

func TestPostsLimitLargerThanResultSetEndsPagination(t *testing.T) {
	reader := seedQueryCollection(t)
	page := runQuery(t, reader, "query", gallery.Query{Limit: gallery.MaxLimit})
	if len(page.Items) != 5 {
		t.Fatalf("Items = %d, want 5", len(page.Items))
	}
	if page.HasMore || page.NextCursor != "" {
		t.Fatalf("page = %+v, want an exhausted terminal page", page)
	}
}
