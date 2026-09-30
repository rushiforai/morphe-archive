package gallery

import (
	"encoding/base64"
	"strings"
	"time"

	"twitter-bookmarker/internal/storage"
)

// sortKey is the ordering position of one row: the sort timestamp selected by
// the active SortMode plus the tweet_id tie-breaker. It is exactly the pair a
// cursor carries, which is what makes pagination stable while the collection
// grows (GAL-12, PRD-2 §43/§44).
type sortKey struct {
	at      time.Time
	tweetID string
}

// keyOf selects the timestamp a SortMode orders by: saved_at for the
// bookmarked modes, tweet_date for the posted modes.
func keyOf(row parsedRow, mode SortMode) sortKey {
	if mode == SortTweetAsc || mode == SortTweetDesc {
		return sortKey{at: row.tweetTime, tweetID: row.post.TweetID}
	}
	return sortKey{at: row.savedTime, tweetID: row.post.TweetID}
}

// cmpKeys compares two keys in the order implied by mode: negative when a is
// emitted before b, zero when identical. Descending modes reverse the tweet_id
// tie-break too, so the order is total and the cursor comparison has one
// consistent direction.
func cmpKeys(a, b sortKey, mode SortMode) int {
	descending := mode == SortSavedDesc || mode == SortTweetDesc

	switch {
	case a.at.Before(b.at):
		if descending {
			return 1
		}
		return -1
	case a.at.After(b.at):
		if descending {
			return -1
		}
		return 1
	}

	if a.tweetID == b.tweetID {
		return 0
	}
	if descending {
		if a.tweetID > b.tweetID {
			return -1
		}
		return 1
	}
	if a.tweetID < b.tweetID {
		return -1
	}
	return 1
}

// encodeCursor renders a sort position as an opaque, URL-safe token. The
// payload is never a numeric offset (GAL-12).
func encodeCursor(key sortKey) string {
	payload := key.at.UTC().Format(time.RFC3339Nano) + "|" + key.tweetID
	return base64.RawURLEncoding.EncodeToString([]byte(payload))
}

// decodeCursor parses an opaque cursor. A malformed token is reported as a
// *storage.ValidationError so the transport layer can answer 400.
func decodeCursor(raw string) (sortKey, error) {
	invalid := func() (sortKey, error) {
		return sortKey{}, &storage.ValidationError{Reason: "cursor is not a valid pagination cursor"}
	}

	decoded, err := base64.RawURLEncoding.DecodeString(raw)
	if err != nil {
		return invalid()
	}
	parts := strings.SplitN(string(decoded), "|", 2)
	if len(parts) != 2 || parts[0] == "" || parts[1] == "" {
		return invalid()
	}
	at, err := time.Parse(time.RFC3339Nano, parts[0])
	if err != nil {
		return invalid()
	}
	return sortKey{at: at, tweetID: parts[1]}, nil
}
