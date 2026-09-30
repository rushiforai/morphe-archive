# Phase 4: Save Integration - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD.md (discuss skipped via workflow.skip_discuss)

<domain>
## Phase Boundary

Wire the user's category selection to the backend: content script → service worker message → `POST /v1/bookmarks`, with a locked-down saving state, the local saved-index cache, the `✓ Saved` transition, and the in-page toast system. Handles success, duplicate, invalid, and backend-unavailable outcomes per the PRD.

This phase does **not** unbookmark from X (Phase 5). It exposes the post-success hook that Phase 5 fills in.

Source of truth: `PRD.md` sections 25, 34–36, 39–42, 54, 60, 64, 67, 68.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD (do not revisit)

- Content script never calls the backend directly; ALL backend HTTP happens in the service worker.
- Message types: `HEALTH_CHECK`, `GET_SAVED_INDEX`, `SAVE_TWEET`.
- Save first, unbookmark second: no unbookmark on any non-`201` outcome.
- During a request: all organizer controls on that tweet are disabled and show `Saving...`; a second click must not start a second request.
- Success (`201`): add id to the local cache → replace controls with `✓ Saved` → success toast `Saved to <Category>`.
- Duplicate (`409`): add id to cache → `✓ Saved` → optional info toast `Already saved`; no append, no unbookmark.
- Backend unavailable (connection failure): restore controls to a usable state → error toast `Backend unavailable`; no unbookmark, no automatic retry.
- Invalid (`400`) / internal (`500`): no unbookmark, show an error toast.
- Toast states: Success / Error / Warning / Info; auto-dismiss after a few seconds; no OS notification API.
- Saved lookup stays O(1); the index is fetched once per Bookmarks page entry and only updated locally on save.

### Agent's Discretion

- Toast placement/styling and exact dismiss duration.
- Message envelope shape beyond the documented types (must stay typed and versionless-safe).
- How the saving state is represented in the DOM (disabled attributes + label swap).

</decisions>

<code_context>
## Existing Code Insights

Phase 2 delivered:
- `src/shared/messages.ts` — typed union for the three message types (extend, don't replace)
- `src/shared/storage.ts` — `getCategories`, `getSettings`
- `src/background/service-worker.ts` — stub that must become the HTTP client
- `src/popup/backend-status.ts` — already calls `/health` from the extension context

Phase 3 delivered:
- `src/content/organizer.ts` with `OrganizerCallbacks { isSaved, onSelect }`
- `src/content/tweet-extractor.ts` returning a typed success/failure
- `src/content/index.ts` bootstrap holding the saved `Set<string>`

</code_context>

<specifics>
## Specific Ideas

### Message envelope (ALREADY DEFINED by Phase 2 — extend, do not replace)

`extension/src/shared/messages.ts` already ships the contract; Phase 4 only fills in the service worker's implementations and adds `shared/api.ts`.

```ts
type MessageType = "HEALTH_CHECK" | "GET_SAVED_INDEX" | "SAVE_TWEET";
interface SaveTweetMessage { type: "SAVE_TWEET"; payload: SaveRequest }
// SaveRequest = { filename: string; tweet: { url, author, username, tweet_date, text } }

interface HealthCheckResponse     { ok: boolean; connected: boolean }
interface GetSavedIndexResponse   { ok: boolean; index: SavedIndex | null; error?: string }
interface SaveTweetResponse       { ok: boolean; result?: SaveResult; duplicate?: DuplicateResult; error?: string }
```
- `GET_SAVED_INDEX` success → `index.items` is `Record<tweetId, {url,filename,saved_at}>`; the content side converts it to `Set<string>` via `Object.keys`.
- `SAVE_TWEET` success → `{ ok: true, result: { status:"saved", tweet_id, url, filename, saved_at } }`.
- `SAVE_TWEET` duplicate → `{ ok: true, duplicate: { status:"duplicate", tweet_id } }`.
- Failures → `{ ok: false, error: "backend_unavailable" | "invalid_request" | "internal" | ... }`.
- `sendExtensionMessage` **throws** when the worker returns nothing; callers must try/catch and treat a throw as backend-unavailable.

### Saving state machine (per tweet)

```
idle ──category click──▶ saving (controls disabled, "Saving…", click guard)
saving ──201──────────▶ saved   (cache.add, "✓ Saved", success toast, postSave hook)
saving ──409──────────▶ saved   (cache.add, "✓ Saved", info toast "Already saved")
saving ──unavailable──▶ idle    (restore controls, error toast "Backend unavailable")
saving ──invalid/5xx──▶ idle    (restore controls, error toast "Could not save tweet")
saving ──extraction err▶ idle   (restore controls, error toast "Could not read tweet data")
```

### Post-success hook

`onSaved(ctx)` is the seam Phase 5 uses for auto-unbookmark. In Phase 4 it is a no-op unless `settings.unbookmarkAfterSave` is true — but the actual click lives in Phase 5, so Phase 4 only defines and invokes the hook with `{ article, tweetId, category, savedAt }`.

</specifics>

<deferred>
## Deferred Ideas

- Native X unbookmark click + verification — Phase 5.
- Retry/backoff — explicitly not required (PRD §39).
- Moving a tweet between categories / undo — out of scope.

</deferred>
