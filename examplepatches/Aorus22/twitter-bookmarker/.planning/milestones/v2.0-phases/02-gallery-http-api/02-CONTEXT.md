# Phase 2: Gallery HTTP API - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 2 of 10** (= PRD §85 "Phase 2.2 — Gallery HTTP API")

<domain>
## Phase Boundary

Expose the Phase 1 `backend/internal/gallery/` read layer over two read-only HTTP endpoints under `/api/gallery/*`, with the documented JSON shapes, query validation, and `400`/`404`/`500` error semantics — while `/health`, `/v1/index`, and `POST /v1/bookmarks` keep their exact v1.0 contracts.

**In scope:** the two gallery handlers, their response DTOs, query-parameter parsing/validation, error mapping, route registration in `internal/api/server.go`, and handler/acceptance tests.

**Out of scope:** static file serving, SPA fallback, and production routing precedence — that is Phase 9. Do not implement caching, mutation, or any new `/v1/*` behaviour. Do not change the gallery read-layer semantics; if you need a capability it lacks, extend the library with tests rather than reimplementing logic in the handler.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- `GET /api/gallery/collections` → `{"collections":[{filename,name,post_count,media_count,last_saved_at,cover_media}]}` (PRD §37).
- `GET /api/gallery/collections/{filename}/posts` → `{"items":[{tweet_id,url,media,author,username,tweet_date,saved_at,text}],"next_cursor":string|null,"has_more":bool}` (PRD §41).
- Query parameters for posts: `cursor`, `limit`, `q`, `tweet_from`, `tweet_to`, `saved_from`, `saved_to`, `sort` (PRD §40).
- `limit` default **30**, maximum **100**; invalid values ⇒ `400` (PRD §34, §80.19).
- Error bodies are exactly `{"status":"error","reason":"..."}` — reuse `model.ErrorResponse`. Unknown collection ⇒ `404`; invalid query ⇒ `400`; filesystem/internal failure ⇒ `500` (PRD §54).
- Never expose the absolute home path or sensitive filesystem information in a response body (PRD §54). Log the real error server-side; return a generic reason.
- The gallery API is **read-only** (PRD §70, §80.23). No gallery route may write CSVs, `index.json`, or anything else.
- Existing `/v1/*` and `/health` contracts must not change; the extension is not migrated (PRD §12, §80.1–3).
- `next_cursor` must be JSON `null` (not `""`) and `has_more` `false` at the end of a collection (PRD §41).
- `media` in the posts response is always a JSON array — `[]`, never `null` (PRD §80.13).
- Where a `last_saved_at` cannot be determined, emit JSON `null` (PRD §74 types it `string | null`).

### Error mapping discovered during Phase 1 verification (authoritative)

The Phase 1 package rejects invalid input in **two** places, and both must reach `400`:

| Rejection | Raised by | Maps to |
|-----------|-----------|---------|
| `limit` non-numeric / `0` / `<1` / `>100`, unknown `sort`, unparseable date | `gallery.RawQuery.Parse()` | `400` |
| **Malformed/undecodable `cursor`** | `gallery.Reader.Posts()` (as `*storage.ValidationError`) | `400` |
| Traversal / bad filename | `Reader.Posts()` (via `storage.ValidateFilename`/`SafeJoin`) | `400` |
| Unknown collection | `Reader.Posts()` (`gallery.ErrCollectionNotFound`) | `404` |
| Anything else | `Reader.Posts()` / `Collections()` | `500` (sanitised reason) |

Consequences for the handler:
- Build the query with `gallery.RawQuery{...}.Parse()` — never hand-construct a `gallery.Query`.
  A hand-built `Query` treats `Limit: 0` as "use the default", so `?limit=0` would silently succeed.
- An **absent** `limit` must default to 30; an explicit `limit=0` must be a `400`.
- Catch `*storage.ValidationError` with `errors.As` from **both** the parse step and the `Posts` step,
  and map both to `400`. Do not only wrap the parse step.
- Sanitise `500` reasons: wrapped `os` errors can embed the storage path.


### Routing

`internal/api/server.go` uses Go 1.22 `http.ServeMux` method+path patterns. Register:

```
GET /api/gallery/collections
GET /api/gallery/collections/{filename}/posts
```

`{filename}` is a single path segment; the handler must still validate it through `storage.ValidateFilename` + the gallery layer (defence in depth). Note that Go's mux already rejects a raw `/` inside `{filename}`, but `..` and encoded traversal must be rejected explicitly and tested.

### Agent's Discretion

Whether the gallery is injected into `NewServer` as an interface or a concrete dependency; DTO struct placement (an `internal/api` gallery file is fine); how query parsing is factored; whether to add a `GET /api/gallery/...` 404 catch-all now (Phase 9 owns unknown-API 404 semantics, but a `404` for an unknown gallery subpath is fine here).

</decisions>

<code_context>
## Existing Code Insights

- `internal/api/server.go` — `NewServer(store BookmarkStore, idx IndexReader, log *logging.Logger) http.Handler`; wraps the mux in `withExtensionCORS`. Any new dependency must be threaded through `NewServer` (and `cmd/server/main.go`).
- `internal/api/handlers.go` — `writeJSON(w, code, v any)` helper and the three existing handlers; follow this style.
- `internal/model/tweet.go` — `ErrorResponse` and the other response DTOs live here.
- `internal/api/handlers_test.go`, `internal/api/acceptance_test.go` — the test style: build a server with a temp storage dir, issue `httptest` requests, assert status + decoded JSON.
- `internal/gallery/` — the Phase 1 package. Its exported API is the contract you consume; read it first.
- `internal/config/config.go` — `StorageDir()` honours `TWITTER_BOOKMARKER_DIR`.
- Keep **zero external Go dependencies**.

</code_context>

<specifics>
## Specific Ideas

Acceptance behaviours the verifier will check (mirroring PRD §80):

1. `GET /api/gallery/collections` with a seeded dir returns exactly the valid `*.csv` collections with correct counts, `cover_media` ≤ 4 newest-first, and `last_saved_at` null for an empty CSV.
2. `GET /api/gallery/collections/linux.csv/posts` with no query returns 30-or-fewer items, `saved_desc` order, `has_more` true when more exist, and a non-null `next_cursor`.
3. Following `next_cursor` until `has_more == false` yields `next_cursor: null` and every post exactly once.
4. `?q=wayland`, `?saved_from=…&saved_to=…`, `?tweet_from=…&tweet_to=…`, and a combined query each filter correctly; `?sort=tweet_asc` reorders.
5. `?limit=0`, `?limit=101`, `?limit=abc`, `?sort=bogus`, `?saved_from=not-a-date` ⇒ `400` with the error envelope.
6. `GET /api/gallery/collections/nope.csv/posts` ⇒ `404`; `GET /api/gallery/collections/../secret.csv/posts` ⇒ `404` or `400`, never a file read; response body never contains the storage dir path.
7. `media` is `[]` (not null) for a text-only post.
8. The existing `/health`, `/v1/index`, `POST /v1/bookmarks` tests still pass untouched.
9. A POST to either gallery path returns `405` (method mismatch) — the API never accepts writes.

</specifics>

<deferred>
## Deferred Ideas

- Static serving of `web/dist`, SPA fallback, unknown-API 404 routing precedence (Phase 9)
- CORS for the Vite dev server — not needed, the dev proxy makes requests same-origin (PRD §10)
- Request-scoped caching of parsed CSVs (PRD §48 explicitly forbids persistent caching; not even transient caching is required)

</deferred>
