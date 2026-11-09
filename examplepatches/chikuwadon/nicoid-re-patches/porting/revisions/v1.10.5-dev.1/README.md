# v1.10.5-dev.1 — comment posting compatibility and diagnostics

Development validation revision based on the published v1.10.4 release. This is **not** an official release.

- Reuse the verified current video's watch data for authenticated comment posting instead of performing an unnecessary second video-info GET. Fall back to the existing request only when that snapshot is unavailable or mismatched.
- Normalize trusted legacy nvcomment host variants to the current public.nvcomment.nicovideo.jp posting endpoint. Keep strict HTTPS/host validation and no redirects.
- Add X-Client-Os-Type and Referer headers to the POST; retain the existing authenticated cookie, frontend headers, and request body schema.
- Add conservative pacing to background historical comment requests (24-request burst; retain five nominal slots for interactive actions; one new token per four seconds). Keep comment count targets, batching, cancellation, and memory protection unchanged.
- Log only safe HTTP status or error categories, never cookies, post keys, comment text, or full URLs.
- Add a test for endpoint normalization, rejected unsafe hosts, and sanitized failure details.

The provided Android bugreport records IOException errors during comment posting, but its logging does not expose the HTTP status. This revision fixes known compatibility risks and makes any residual failure diagnosable. Real posting still requires Android device validation; do not automatically retry a non-idempotent comment POST.
