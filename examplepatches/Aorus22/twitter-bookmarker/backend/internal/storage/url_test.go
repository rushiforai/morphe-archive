package storage_test

import (
	"testing"

	"twitter-bookmarker/internal/storage"
)

func TestNormalizeURL(t *testing.T) {
	tests := []struct {
		name      string
		raw       string
		wantURL   string
		wantID    string
		wantError bool
	}{
		{
			name:    "query and fragment stripped",
			raw:     "https://x.com/foo/status/123?s=20#x",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "fragment only",
			raw:     "https://x.com/foo/status/123#something",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "plain canonical",
			raw:     "https://x.com/foo/status/123",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "trailing slash",
			raw:     "https://x.com/foo/status/123/",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "twitter.com normalized to x.com",
			raw:     "https://twitter.com/foo/status/123",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "www.twitter.com normalized",
			raw:     "https://www.twitter.com/foo/status/123",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "www.x.com normalized",
			raw:     "https://www.x.com/foo/status/123?ref=abc",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "http upgraded to https",
			raw:     "http://x.com/foo/status/123",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "trailing photo segment tolerated",
			raw:     "https://x.com/foo/status/123/photo/1",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "missing username segment falls back to i",
			raw:     "https://x.com/status/123",
			wantURL: "https://x.com/i/status/123",
			wantID:  "123",
		},
		{
			name:    "surrounding whitespace trimmed",
			raw:     "  https://x.com/foo/status/123  ",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:    "uppercase host accepted",
			raw:     "https://X.COM/foo/status/123",
			wantURL: "https://x.com/foo/status/123",
			wantID:  "123",
		},
		{
			name:      "empty",
			raw:       "",
			wantError: true,
		},
		{
			name:      "not a url",
			raw:       "not a url",
			wantError: true,
		},
		{
			name:      "unrelated host",
			raw:       "https://example.com/foo/status/123",
			wantError: true,
		},
		{
			name:      "non numeric status id",
			raw:       "https://x.com/foo/status/abc",
			wantError: true,
		},
		{
			name:      "no status segment",
			raw:       "https://x.com/foo",
			wantError: true,
		},
		{
			name:      "bookmarks page is not a tweet",
			raw:       "https://x.com/i/bookmarks",
			wantError: true,
		},
		{
			name:      "javascript scheme",
			raw:       "javascript:alert(1)",
			wantError: true,
		},
		{
			name:      "ftp scheme",
			raw:       "ftp://x.com/foo/status/123",
			wantError: true,
		},
		{
			name:      "missing id",
			raw:       "https://x.com/foo/status/",
			wantError: true,
		},
		{
			name:      "user info rejected",
			raw:       "https://user@x.com/foo/status/123",
			wantError: true,
		},
	}

	for _, tc := range tests {
		t.Run(tc.name, func(t *testing.T) {
			gotURL, gotID, err := storage.NormalizeURL(tc.raw)
			if tc.wantError {
				if err == nil {
					t.Fatalf("NormalizeURL(%q) = (%q, %q, nil), want error", tc.raw, gotURL, gotID)
				}
				return
			}
			if err != nil {
				t.Fatalf("NormalizeURL(%q) unexpected error: %v", tc.raw, err)
			}
			if gotURL != tc.wantURL {
				t.Errorf("NormalizeURL(%q) url = %q, want %q", tc.raw, gotURL, tc.wantURL)
			}
			if gotID != tc.wantID {
				t.Errorf("NormalizeURL(%q) id = %q, want %q", tc.raw, gotID, tc.wantID)
			}
		})
	}
}

func TestExtractTweetID(t *testing.T) {
	id, err := storage.ExtractTweetID("https://x.com/foo/status/987654321?s=20")
	if err != nil {
		t.Fatalf("ExtractTweetID() error = %v", err)
	}
	if id != "987654321" {
		t.Fatalf("ExtractTweetID() = %q, want 987654321", id)
	}
	if _, err := storage.ExtractTweetID("https://x.com/i/bookmarks"); err == nil {
		t.Fatalf("ExtractTweetID(non-tweet) = nil error, want error")
	}
}
