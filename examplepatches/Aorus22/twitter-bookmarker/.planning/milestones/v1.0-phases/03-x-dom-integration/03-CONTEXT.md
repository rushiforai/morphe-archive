# Phase 3: X DOM Integration - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD.md (discuss skipped via workflow.skip_discuss)

<domain>
## Phase Boundary

Make the extension work on `https://x.com/i/bookmarks`: detect the route (SPA-aware), observe dynamically loaded tweets, extract container-scoped metadata, and inject idempotent organizer controls (popover or inline) into each tweet's action area, including the `✓ Saved` state from the cached index.

This phase does **not** perform the save request (Phase 4) or the unbookmark click (Phase 5). It exposes callbacks/hooks those phases fill in.

Source of truth: `PRD.md` sections 26–34, 40, 51, 54, 60, 64, 67.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD (do not revisit)

- Active only on `https://x.com/i/bookmarks`. Not on Home/Explore/Notifications/Messages/Profile/individual tweet/Lists/Search.
- SPA route detection without full page reload; leaving `/i/bookmarks` must stop injection; returning must resume.
- Single `MutationObserver` on the timeline; no observer per tweet; no full-document scan per mutation; no backend request per row.
- Saved index fetched once per Bookmarks page entry; saved lookup is O(1) over an in-memory `Set<TweetID>`.
- Injection is idempotent via a per-tweet marker attribute; DOM re-render must not create duplicate controls.
- Extraction is scoped to the tweet container — never global-document queries for metadata.
- Quoted-tweet text excluded; only top-level tweet text persisted. Media-only tweet → empty `text`.
- Required fields `url`, `author`, `username`, `tweet_date` — if any is missing, send nothing and show `Could not read tweet data`.
- Controls live in the tweet action area (near X's native action buttons), never in the page header.
- Previously saved IDs show `✓ Saved` — no category name/filename shown (categories may be renamed/deleted).
- Category `order` and `color` are honored by both display modes.

### Agent's Discretion

- Exact DOM selectors and fallbacks; they MUST be isolated in one extractor module because X's DOM changes.
- Popover positioning technique.
- Debounce/scheduling strategy for the observer.

</decisions>

<code_context>
## Existing Code Insights

Phase 2 produced `extension/` (MV3 + TypeScript + esbuild) with:
- `src/shared/types.ts` — `Category`, `Settings`, `Store`, `ExtractedTweet`
- `src/shared/storage.ts` — `getStore`, `getCategories`, `getSettings`, `onStoreChanged`
- `src/shared/messages.ts` — typed message union (`HEALTH_CHECK`, `GET_SAVED_INDEX`, `SAVE_TWEET`)
- `src/content/index.ts` — currently a stub entry point to be replaced by this phase
- `dist/content/content.js` is the built content script declared in `manifest.json` (matches `https://x.com/i/bookmarks*`, `run_at: document_idle`)

Phase 3 owns `src/content/*` and may extend `src/shared/*` (e.g. add message-send helpers) but must not break Phase 2's popup.

</code_context>

<specifics>
## Specific Ideas

### X DOM anchors (verify empirically; isolate behind constants)

- Tweet container: `article[data-testid="tweet"]`
- Tweet text: `[data-testid="tweetText"]` (first inside the container = main tweet)
- Quoted tweet wrapper: a nested `div[role="link"]` containing its own `[data-testid="tweetText"]` — exclude
- Author block: `[data-testid="User-Name"]`
- Timestamp: `time[datetime]` (first inside the container)
- Status permalink: `a[href*="/status/"]` whose subtree contains `time[datetime]`
- Action bar: `div[role="group"]` (the one containing the native bookmark control)
- Native bookmark control: `[data-testid="bookmark"]` (not bookmarked) / `[data-testid="removeBookmark"]` (bookmarked)
- Injection marker: `data-twitter-bookmarker-injected="true"` on the tweet container

### Ownership split

- `content/index.ts` — bootstrap: route watcher, observer, orchestration
- `content/bookmark-page.ts` — route detection + lifecycle (start/stop)
- `content/observer.ts` (or inside bookmark-page) — MutationObserver scheduling
- `content/tweet-extractor.ts` — all selectors; `getTweetId/getCanonicalUrl/getAuthor/getUsername/getTweetDate/getMainText`
- `content/ui-injector.ts` — popover/inline rendering, saved state, rerender on storage change, idempotency
- `content/toast.ts` — created in Phase 4; Phase 3 may scaffold the call surface

### Callback seam for Phase 4

`ui-injector` must accept an `OrganizerCallbacks` object, e.g.
```ts
interface OrganizerCallbacks {
  isSaved(tweetId: string): boolean;
  onSelect(category: Category, ctx: { tweetId: string; article: HTMLElement; source: HTMLElement }): void;
}
```
Phase 4 supplies the real save implementation; Phase 3 supplies a no-op that only logs, so Phase 3 is independently testable.

</specifics>

<deferred>
## Deferred Ideas

- Actual save request + toast states — Phase 4.
- Native unbookmark trigger — Phase 5.
- Support for other X routes/pages — explicitly out of scope.

</deferred>
