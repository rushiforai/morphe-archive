package storage

import (
	"net/url"
	"path"
	"strings"
)

// MaxMedia caps how many media URLs a single tweet row may carry. X itself
// allows at most four photos, or one video/animated GIF.
const MaxMedia = 8

// mediaHost is the only host X serves tweet media from. Avatars, banners and
// link-preview card images also live on pbs.twimg.com, so the path prefix is
// checked as well (see nonMediaPrefixes).
const mediaHost = "pbs.twimg.com"

// nonMediaPrefixes are pbs.twimg.com path prefixes that are never tweet media.
var nonMediaPrefixes = []string{"/card_img/", "/profile_images/", "/profile_banner/", "/profile_background/"}

// mediaImageFormats are the `format` query values X uses for an extension-less
// media path; they may be appended as a file extension during canonicalization.
var mediaImageFormats = map[string]bool{
	"jpg":  true,
	"jpeg": true,
	"png":  true,
	"webp": true,
	"gif":  true,
}

// NormalizeMedia canonicalizes the media URLs of one tweet.
//
// Rules (mirrored in the extension's `normalizeMediaUrl`, see PRD §14):
//   - only `https://pbs.twimg.com/<path>` entries survive; anything else is
//     dropped rather than failing the save, because media is auxiliary metadata;
//   - the query string is dropped, except that an extension-less path with a
//     `format` parameter gets that format appended (X renders
//     `/media/ABC?format=jpg&name=small` for the canonical `/media/ABC.jpg`);
//   - non-media pbs paths (cards, avatars, banners) are dropped;
//   - duplicates are removed, first-seen order is preserved, at most MaxMedia
//     entries are kept.
//
// The result is never nil, so callers may JSON-encode it directly.
func NormalizeMedia(in []string) []string {
	out := make([]string, 0, len(in))
	seen := make(map[string]bool, len(in))
	for _, raw := range in {
		canonical := normalizeMediaURL(raw)
		if canonical == "" || seen[canonical] {
			continue
		}
		seen[canonical] = true
		out = append(out, canonical)
		if len(out) == MaxMedia {
			break
		}
	}
	return out
}

// normalizeMediaURL returns the canonical form of one media URL, or "" when it
// is not a tweet-media URL.
func normalizeMediaURL(raw string) string {
	raw = strings.TrimSpace(raw)
	if raw == "" {
		return ""
	}
	u, err := url.Parse(raw)
	if err != nil {
		return ""
	}
	if u.User != nil || !strings.EqualFold(u.Scheme, "https") {
		return ""
	}
	if !strings.EqualFold(u.Hostname(), mediaHost) || u.Port() != "" {
		return ""
	}

	mediaPath := u.EscapedPath()
	if mediaPath == "" || mediaPath == "/" {
		return ""
	}
	for _, prefix := range nonMediaPrefixes {
		if strings.HasPrefix(mediaPath, prefix) {
			return ""
		}
	}

	if path.Ext(mediaPath) == "" {
		format := strings.ToLower(u.Query().Get("format"))
		if mediaImageFormats[format] {
			mediaPath += "." + format
		}
	}
	return "https://" + mediaHost + mediaPath
}
