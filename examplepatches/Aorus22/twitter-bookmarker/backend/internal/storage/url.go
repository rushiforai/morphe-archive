package storage

import (
	"fmt"
	"net/url"
	"regexp"
	"strings"
)

// usernamePattern matches the path segment that may appear before /status/.
var usernamePattern = regexp.MustCompile(`^[A-Za-z0-9_.-]+$`)

// NormalizeURL canonicalizes a tweet URL and extracts its numeric Status ID.
//
// Input  https://x.com/foo/status/123?s=20#x
// Output https://x.com/foo/status/123, 123
//
// Hosts x.com, www.x.com, twitter.com and www.twitter.com are accepted;
// twitter.com variants are normalized to x.com. Query and fragment are always
// dropped. A URL without a numeric /status/<id> is rejected.
func NormalizeURL(raw string) (canonical string, tweetID string, err error) {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return "", "", &ValidationError{Reason: "url is required"}
	}

	u, err := url.Parse(raw)
	if err != nil {
		return "", "", &ValidationError{Reason: "url is not parseable"}
	}
	if u.User != nil {
		return "", "", &ValidationError{Reason: "url must not contain user info"}
	}
	switch strings.ToLower(u.Scheme) {
	case "http", "https":
	default:
		return "", "", &ValidationError{Reason: "url scheme must be http or https"}
	}
	switch strings.ToLower(u.Hostname()) {
	case "x.com", "www.x.com", "twitter.com", "www.twitter.com":
	default:
		return "", "", &ValidationError{Reason: "url host must be x.com or twitter.com"}
	}

	segments := splitPath(u.Path)
	statusIdx := -1
	for i, s := range segments {
		if strings.EqualFold(s, "status") {
			statusIdx = i
			break
		}
	}
	if statusIdx < 0 || statusIdx+1 >= len(segments) {
		return "", "", &ValidationError{Reason: "url does not contain a status id"}
	}

	id := segments[statusIdx+1]
	if !isDigits(id) {
		return "", "", &ValidationError{Reason: "status id must be numeric"}
	}

	username := "i"
	if statusIdx > 0 {
		username = segments[statusIdx-1]
		if !usernamePattern.MatchString(username) {
			return "", "", &ValidationError{Reason: "url username segment is invalid"}
		}
	}

	return fmt.Sprintf("https://x.com/%s/status/%s", username, id), id, nil
}

// ExtractTweetID returns only the numeric Status ID for raw.
func ExtractTweetID(raw string) (string, error) {
	_, id, err := NormalizeURL(raw)
	return id, err
}

// maxTweetIDLen bounds a Status ID. Real ids are around 19 digits; the cap means
// a hostile path segment is rejected before it can reach a query at all.
const maxTweetIDLen = 32

// ValidateTweetID reports whether id is a well-formed Tweet Status ID.
//
// Curation addresses a bookmark by id, and the id arrives as a URL path segment,
// so this is the boundary check that keeps an arbitrary string out of a query —
// the same defense-in-depth shape as ValidateSlug. Digits only, because that is
// what every tweet URL variant (x.com, twitter.com, /i/web/status/) shares and
// what NormalizeURL already guarantees on the way in.
func ValidateTweetID(id string) error {
	switch {
	case id == "":
		return &ValidationError{Reason: "tweet id is required"}
	case !isDigits(id):
		return &ValidationError{Reason: "tweet id must be numeric"}
	case len(id) > maxTweetIDLen:
		return &ValidationError{Reason: "tweet id is too long"}
	}
	return nil
}

func splitPath(p string) []string {
	p = strings.Trim(p, "/")
	if p == "" {
		return nil
	}
	return strings.Split(p, "/")
}

func isDigits(s string) bool {
	if s == "" {
		return false
	}
	for _, r := range s {
		if r < '0' || r > '9' {
			return false
		}
	}
	return true
}
