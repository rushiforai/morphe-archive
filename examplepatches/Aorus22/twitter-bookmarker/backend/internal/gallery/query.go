package gallery

import (
	"errors"
	"fmt"
	"sort"
	"strconv"
	"strings"
	"time"

	"twitter-bookmarker/internal/db"
	"twitter-bookmarker/internal/storage"
)

// Parse converts raw HTTP query values into a validated Query. Every invalid
// value is reported as *storage.ValidationError, the same type the v1.0 API
// already maps to HTTP 400, so API-04 needs no new error taxonomy.
func (rq RawQuery) Parse() (Query, error) {
	query := Query{
		Q:      rq.Q,
		Sort:   SortMode(strings.TrimSpace(rq.Sort)),
		Cursor: strings.TrimSpace(rq.Cursor),
	}

	var err error
	if query.TweetFrom, err = parseOptionalTime("tweet_from", rq.TweetFrom); err != nil {
		return Query{}, err
	}
	if query.TweetTo, err = parseOptionalTime("tweet_to", rq.TweetTo); err != nil {
		return Query{}, err
	}
	if query.SavedFrom, err = parseOptionalTime("saved_from", rq.SavedFrom); err != nil {
		return Query{}, err
	}
	if query.SavedTo, err = parseOptionalTime("saved_to", rq.SavedTo); err != nil {
		return Query{}, err
	}

	if raw := strings.TrimSpace(rq.Limit); raw != "" {
		limit, err := strconv.Atoi(raw)
		if err != nil {
			return Query{}, &storage.ValidationError{Reason: "limit must be an integer"}
		}
		// An explicit limit is validated as supplied: `limit=0` is invalid, not
		// "use the default". Only an absent parameter (empty string) falls back
		// to DefaultLimit, so API-04's `limit=0 → 400` holds.
		if limit < 1 || limit > MaxLimit {
			return Query{}, &storage.ValidationError{
				Reason: fmt.Sprintf("limit must be between 1 and %d", MaxLimit),
			}
		}
		query.Limit = limit
	}

	return query.Normalize()
}

// parseOptionalTime parses an optional RFC3339 bound and normalizes it to UTC.
// The backend makes no timezone assumption about the caller: it simply compares
// instants (GAL-10).
func parseOptionalTime(name, raw string) (*time.Time, error) {
	value := strings.TrimSpace(raw)
	if value == "" {
		return nil, nil
	}
	parsed, err := time.Parse(time.RFC3339, value)
	if err != nil {
		return nil, &storage.ValidationError{Reason: name + " must be an RFC3339 timestamp"}
	}
	utc := parsed.UTC()
	return &utc, nil
}

// Normalize fills in defaults and validates a Query. An empty sort becomes
// saved_desc, a zero limit becomes DefaultLimit (the programmatic "unspecified"
// value), and anything else outside the contract is a *storage.ValidationError
// (GAL-11, API-04).
//
// HTTP callers must go through RawQuery.Parse, which additionally rejects an
// explicit `limit=0`; a hand-built Query cannot tell an absent limit from a
// supplied zero.
func (q Query) Normalize() (Query, error) {
	if q.Sort == "" {
		q.Sort = SortSavedDesc
	}
	switch q.Sort {
	case SortSavedDesc, SortSavedAsc, SortTweetDesc, SortTweetAsc:
	default:
		return Query{}, &storage.ValidationError{
			Reason: "sort must be one of saved_desc, saved_asc, tweet_desc, tweet_asc",
		}
	}

	switch {
	case q.Limit == 0:
		q.Limit = DefaultLimit
	case q.Limit < 0 || q.Limit > MaxLimit:
		return Query{}, &storage.ValidationError{
			Reason: fmt.Sprintf("limit must be between 1 and %d", MaxLimit),
		}
	}

	q.Q = strings.TrimSpace(q.Q)
	q.Cursor = strings.TrimSpace(q.Cursor)
	return q, nil
}

// Posts applies search, both date filters, sorting and cursor pagination to one
// collection, in exactly that order, before any pagination happens (GAL-13).
//
// The slug is validated by the read layer before it reaches the database
// (GAL-15), and the filtering happens in Go rather than in SQL: the search is a
// Unicode-aware case-insensitive substring match, which SQLite's ASCII-only
// LIKE/lower() would silently narrow.
func (r *Reader) Posts(slug string, query Query) (Page, error) {
	normalized, err := query.Normalize()
	if err != nil {
		return Page{}, err
	}

	conn, err := r.open()
	if err != nil {
		if errors.Is(err, db.ErrNoDatabase) {
			return Page{}, fmt.Errorf("%w: %s", ErrCollectionNotFound, slug)
		}
		return Page{}, err
	}
	defer conn.Close()

	rows, err := r.readRows(conn, slug)
	if err != nil {
		return Page{}, err
	}

	// 1. Search: trimmed, case-insensitive substring over author/username/text;
	//    an empty query means no search (GAL-09).
	if term := strings.ToLower(normalized.Q); term != "" {
		rows = filterRows(rows, func(row parsedRow) bool {
			return strings.Contains(strings.ToLower(row.post.Author), term) ||
				strings.Contains(strings.ToLower(row.post.Username), term) ||
				strings.Contains(strings.ToLower(row.post.Text), term)
		})
	}

	// 2. Tweet-date range, then 3. saved-date range: independent, combinable and
	//    inclusive on both ends (GAL-10).
	if normalized.TweetFrom != nil {
		from := *normalized.TweetFrom
		rows = filterRows(rows, func(row parsedRow) bool { return !row.tweetTime.Before(from) })
	}
	if normalized.TweetTo != nil {
		to := *normalized.TweetTo
		rows = filterRows(rows, func(row parsedRow) bool { return !row.tweetTime.After(to) })
	}
	if normalized.SavedFrom != nil {
		from := *normalized.SavedFrom
		rows = filterRows(rows, func(row parsedRow) bool { return !row.savedTime.Before(from) })
	}
	if normalized.SavedTo != nil {
		to := *normalized.SavedTo
		rows = filterRows(rows, func(row parsedRow) bool { return !row.savedTime.After(to) })
	}

	// 4. Sort.
	sortRows(rows, normalized.Sort)

	// 5. Cursor pagination.
	if normalized.Cursor != "" {
		key, err := decodeCursor(normalized.Cursor)
		if err != nil {
			return Page{}, err
		}
		rows = rowsAfter(rows, key, normalized.Sort)
	}

	page := Page{Items: []Post{}}
	if len(rows) > normalized.Limit {
		rows = rows[:normalized.Limit]
		page.HasMore = true
	}
	for _, row := range rows {
		page.Items = append(page.Items, row.post)
	}
	if page.HasMore && len(rows) > 0 {
		last := rows[len(rows)-1]
		page.NextCursor = encodeCursor(keyOf(last, normalized.Sort))
	}
	return page, nil
}

// filterRows keeps the rows for which keep returns true. It reuses the input
// backing array, which is safe because readRows returns a fresh slice.
func filterRows(rows []parsedRow, keep func(parsedRow) bool) []parsedRow {
	out := rows[:0]
	for _, row := range rows {
		if keep(row) {
			out = append(out, row)
		}
	}
	return out
}

// sortRows orders rows by the mode's total order (sort timestamp, then
// tweet_id). The sort is stable so equal rows keep a deterministic order.
func sortRows(rows []parsedRow, mode SortMode) {
	sort.SliceStable(rows, func(i, j int) bool {
		return cmpKeys(keyOf(rows[i], mode), keyOf(rows[j], mode), mode) < 0
	})
}

// rowsAfter drops every row at or before the cursor position in the sorted
// order, so the next page starts exactly where the previous one stopped even
// when rows were appended between requests (GAL-12).
func rowsAfter(rows []parsedRow, cursor sortKey, mode SortMode) []parsedRow {
	for i, row := range rows {
		if cmpKeys(keyOf(row, mode), cursor, mode) > 0 {
			return rows[i:]
		}
	}
	return nil
}
