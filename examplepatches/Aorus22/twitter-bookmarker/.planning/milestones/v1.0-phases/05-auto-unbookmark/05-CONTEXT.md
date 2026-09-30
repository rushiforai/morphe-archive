# Phase 5: Auto Unbookmark - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD.md (discuss skipped via workflow.skip_discuss)

<domain>
## Phase Boundary

When `unbookmarkAfterSave` is enabled, after a **confirmed** `201` the extension triggers X's native unbookmark control on that tweet, verifies the bookmark state actually changed, and on failure shows a warning while preserving CSV, index, and `✓ Saved`.

Never unbookmark before CSV success. A failed unbookmark never rolls back data.

Source of truth: `PRD.md` sections 37, 38, 41, 64, 68, 70.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD (do not revisit)

- Trigger only after a backend-confirmed `201`. Not on `409`, `400`, `500`, or connection failure.
- `.click()` alone is insufficient: verify the bookmark state changed (DOM/state observation).
- On success: complete.
- On failure: CSV remains saved, index remains saved, tweet remains marked `✓ Saved`, show warning `Saved to <Category>, but failed to remove from X bookmarks`. Never roll back CSV.
- With `unbookmarkAfterSave = false`, no bookmark control is ever touched.

### Agent's Discretion

- Verification technique (attribute change on `[data-testid="bookmark"]` ↔ `[data-testid="removeBookmark"]`, aria-pressed, or mutation watch with timeout).
- Timeout duration and retry-free behavior.

</decisions>

<code_context>
## Existing Code Insights

Phase 4 delivered `content/save-controller.ts` with an `onSaved({article, tweetId, category, savedAt})` hook invoked only after a `201`, plus `content/toast.ts` and `organizer.setSaved`.

Phase 3 delivered `content/selectors.ts` with `BOOKMARK_BUTTON` / `UNBOOKMARK_BUTTON` constants.

</code_context>

<specifics>
## Specific Ideas

### Verification

Before clicking, record the state (e.g. presence of `[data-testid="bookmark"]` means currently bookmarked). Click the native control. Then observe for up to ~2s for the control to flip to the unbookmarked representation (`[data-testid="bookmark"]` disappearing / `removeBookmark` becoming `bookmark`). Use a `MutationObserver` scoped to the tweet's action bar plus a timeout.

Alternatively the tweet may be removed from the timeline by X after unbookmarking — treat the article being detached as success too.

### Invariants

- `postSaveUnbookmark` must be called inside the `201` branch only.
- Failure must not throw into the save controller's `finally` in a way that changes the saved state.

</specifics>

<deferred>
## Deferred Ideas

- Retry unbookmark — not required.
- Bulk unbookmark of previously saved tweets — not in scope.

</deferred>
