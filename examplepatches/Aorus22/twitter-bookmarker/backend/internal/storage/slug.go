package storage

import (
	"fmt"
	"regexp"
	"strings"
)

// SlugPattern is the only collection slug shape the backend accepts.
//
// A slug is the public identifier of a collection: what the extension sends with
// a save, what a gallery URL carries, and what a reader sees. It is deliberately
// narrower than a filesystem name and has no extension, because it is a database
// key, not a file.
//
// The extension is responsible for slugging a category name (see
// extension/src/shared/slug.ts); the backend never generates or repairs one.
var SlugPattern = regexp.MustCompile(`^[a-z0-9][a-z0-9-]*$`)

// maxSlugLen keeps a slug comfortably inside common column and URL limits.
const maxSlugLen = 255

// ValidateSlug reports whether slug is a safe, well-formed collection key.
//
// Defense in depth: explicit traversal/separator/NUL checks run before the regex
// so a rejected slug always carries a specific reason, then the regex enforces
// the full allowed shape.
//
// This function is also the reason a path-traversal attempt can never reach the
// database: a slug is always a bound query parameter and never a path component,
// and "a/b", ".." and "~/x" are rejected here first.
func ValidateSlug(slug string) error {
	switch {
	case slug == "":
		return &ValidationError{Reason: "slug is required"}
	case len(slug) > maxSlugLen:
		return &ValidationError{Reason: "slug is too long"}
	case strings.ContainsRune(slug, 0):
		return &ValidationError{Reason: "slug must not contain NUL"}
	case strings.ContainsAny(slug, `/\`):
		return &ValidationError{Reason: "slug must not contain path separators"}
	case strings.Contains(slug, ".."):
		return &ValidationError{Reason: "slug must not contain .."}
	case strings.Contains(slug, "~"):
		return &ValidationError{Reason: "slug must not contain ~"}
	case slug != strings.TrimSpace(slug):
		return &ValidationError{Reason: "slug must not have leading or trailing whitespace"}
	}
	if !SlugPattern.MatchString(slug) {
		return &ValidationError{
			Reason: fmt.Sprintf("slug must match %s", SlugPattern.String()),
		}
	}
	return nil
}
