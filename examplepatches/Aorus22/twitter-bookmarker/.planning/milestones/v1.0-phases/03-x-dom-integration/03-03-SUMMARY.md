---
phase: 03-x-dom-integration
plan: 03
subsystem: extension-ui
tags: [chrome-mv3, content-script, popover, inline, saved-state, storage-onchanged, rerender]

# Dependency graph
requires:
  - phase: 03-x-dom-integration (plan 01)
    provides: "bookmark-page.ts discovery loop + saved Set + refreshBookmarksPage store subscription"
  - phase: 03-x-dom-integration (plan 02)
    provides: "selectors.ts selector/attribute constants and closestArticle helper"
  - phase: 02-extension-settings (plan 01)
    provides: "shared/types.ts Category/Settings/DisplayMode + storage.getCategories ordering"
provides:
  - "content/ui-injector.ts: injectOrganizer/removeOrganizer/removeAllOrganizers/rerenderAll/setSaving/setSaved with action-area placement and one-root-per-tweet"
  - "content/organizer.ts: popover + inline rendering in category order with colour indicators, single-open popover state machine, and the OrganizerCallbacks/OrganizerContext seam"
  - "The exact ✓ Saved state (no category controls, no category name) and live in-place rerender on store change"
affects: [04-save-integration, 05-auto-unbookmark, 06-hardening]

# Actuals — chars/4 over ui-injector.ts + organizer.ts (19,213 chars).
actuals:
  tokens: 4803
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "ui-injector owns placement/lifecycle; organizer owns markup + popover state; category order/colour rendered from storage"
    - "Module-level single-open-popover invariant with document capture click + Escape listeners attached only while open"
    - "WeakMap of last render options so setSaved/setSaving re-render a root in place without the caller re-supplying config"
    - "400 ms per-control click guard so a double-click fires onSelect exactly once"

key-files:
  created:
    - extension/src/content/ui-injector.ts
    - extension/src/content/organizer.ts
  modified: []

key-decisions:
  - "A saved tweet renders ✓ Saved even when there are zero categories (XI-11 wins over the zero-category no-root rule), so a saved row is never left blank"
  - "A non-saved tweet with zero categories produces no root at all, so the action bar is never polluted by an empty control"
  - "The popover panel is anchored to the extension's own position:relative root, so opening upward cannot depend on X's layout"
  - "The article for the onSelect context is resolved lazily at click time (via closestArticle) rather than at render time, because the root is injected before it is attached"
  - "Popovers also close on a removed tweet (observer removal records) and on route teardown, not only on select/outside/Escape"
  - "Category buttons carry data-category-id and a colour dot painted with an inline background-color, so order/colour are observable and need no stylesheet"

patterns-established:
  - "OrganizerCallbacks { isSaved, onSelect, onExtractionError? } + OrganizerContext { article, tweetId, source } is the frozen Phase-4 seam"
  - "rerenderAll(doc, {categories, settings, savedIds, callbacks}) re-renders in place and never creates a second root"
  - "setSaving/setSaved are the only supported Phase-4 UI state transitions"

requirements-completed: [XI-08, XI-09, XI-10, XI-11]

coverage:
  - id: D1
    description: "Organizer controls render inside the tweet action area (the div[role=group] holding the native bookmark control), never in the page header; one root per tweet"
    requirement: "XI-08"
    verification:
      - kind: unit
        ref: "test/organizer.test.mjs#controls render inside the action area, never the header (XI-08)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#injection is idempotent: a second call updates in place (XI-04)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#zero categories and not saved renders no root"
        status: pass
    human_judgment: true
    rationale: "Placement is proven against the fixture's action bar, but XI-08's intent ('feels like part of X's action bar', no layout breakage) needs a real browser render; that visual check was not possible in this execution."
  - id: D2
    description: "Popover mode: a single [Organize] trigger opens a panel listing every category in order with visible colour; exactly one popover open; closes on selection, outside click, Escape, and tweet removal"
    requirement: "XI-09"
    verification:
      - kind: unit
        ref: "test/organizer.test.mjs#popover mode: single trigger, ordered panel, visible colours (XI-09)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#popover opens on trigger, toggles closed, and only one is open at a time (XI-09)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#popover closes on category selection and fires onSelect once (XI-09)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#popover closes on an outside click (XI-09)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#popover closes on Escape (XI-09)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#popover closes when its tweet leaves the DOM (XI-09)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#a removed tweet closes its open popover through the observer (XI-09)"
        status: pass
    human_judgment: false
  - id: D3
    description: "Inline mode renders every category as a button in order with a visible colour indicator"
    requirement: "XI-10"
    verification:
      - kind: unit
        ref: "test/organizer.test.mjs#inline mode renders every category in order with colour (XI-10)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#refresh rerenders order and display mode on existing controls (PRD §51)"
        status: pass
    human_judgment: false
  - id: D4
    description: "A saved tweet id renders exactly ✓ Saved with aria-live, no category controls, and no category name (renamed/deleted categories never leak into the row)"
    requirement: "XI-11"
    verification:
      - kind: unit
        ref: "test/organizer.test.mjs#saved tweet renders exactly ✓ Saved with no category controls or names (XI-11)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#a saved tweet with zero categories still shows ✓ Saved"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#start fetches the index once, injects, and marks saved tweets (XI-03, XI-04, XI-11)"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#markTweetSaved updates the cache and renders ✓ Saved (Phase 4 seam)"
        status: pass
    human_judgment: false
  - id: D5
    description: "Categories/settings/saved-set changes re-render every visible control in place without a reload or a duplicate root"
    requirement: "XI-11"
    verification:
      - kind: unit
        ref: "test/organizer.test.mjs#rerenderAll updates order, colours, and display mode without duplicating roots (PRD §51)"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#rerenderAll marks a tweet saved when the saved set gains its id"
        status: pass
      - kind: unit
        ref: "test/organizer.test.mjs#rerenderAll drops the organizer and marker when categories become empty"
        status: pass
      - kind: unit
        ref: "test/bookmark-page.test.mjs#refresh adopts new categories and injects previously-skipped tweets (PRD §51)"
        status: pass
    human_judgment: true
    rationale: "The in-place rerender is unit-proven, but PRD §51's cross-tab promise (editing a category in the popup updates an already-open Bookmarks tab with no reload) can only be confirmed by driving the popup and a real tab; not performed in this execution."

# Metrics
duration: 10min
completed: 2026-09-27
status: complete
---

# Phase 3: X DOM Integration — Plan 03 Summary

**Popover and inline organizer UI in the tweet action bar: single-open popover with ordered colour-coded categories, an exact `✓ Saved` state with no category name, a 400 ms double-click guard, and in-place rerender on category/settings/saved-set changes.**

## Performance

- **Duration:** ~10 min
- **Started:** 2026-09-27T01:38:00Z
- **Completed:** 2026-09-27T01:48:00Z
- **Tasks:** 3
- **Files modified:** 2 (created)

## Accomplishments
- `ui-injector.ts` finds the action bar (the `div[role="group"]` containing X's native bookmark control, falling back to the last group), creates exactly one `[data-twitter-bookmarker-root]` there, and updates it in place on re-injection — nothing is ever placed in the page header (XI-08).
- `organizer.ts` renders popover mode as one `[Organize]` trigger plus a panel, and inline mode as a direct row of category buttons; both iterate categories in `order` and paint a colour dot from the category's `color` (XI-09, XI-10).
- The popover state machine keeps at most one panel open and closes on category selection, an outside click (document capture), `Escape`, tweet removal (observer or teardown), and route leave.
- A saved tweet renders exactly `✓ Saved` with `aria-live="polite"`, no category controls, and no category name — immune to renames/deletes (XI-11).
- Category clicks invoke `onSelect(category, { article, tweetId, source })` exactly once per click (400 ms guard), `article` resolved from the live DOM at click time.
- `rerenderAll` adopts new categories/settings/saved ids and re-renders every visible root in place; `setSaving` disables every control; `setSaved` swaps between controls and `✓ Saved` using a `WeakMap` of last render options.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/src/content/ui-injector.ts` — action-area placement, one-root lifecycle, `rerenderAll`, `setSaving`/`setSaved`, marker/root cleanup
- `extension/src/content/organizer.ts` — popover/inline markup, ordered colour-coded category buttons, single-open popover state machine, `OrganizerCallbacks`/`OrganizerContext`

## Decisions Made
- **Saved wins over empty:** an id in the saved set renders `✓ Saved` even with zero categories, while an unsaved zero-category tweet produces no root — this satisfies XI-11 without leaving an empty control in the action bar.
- **Anchoring:** the extension root is `position: relative` and the panel `position: absolute; bottom: 100%`, so the popover opens upward independently of X's action-bar layout.
- **Lazy article resolution:** because the root is rendered before it is appended, the `onSelect` context's `article` is resolved at click time via `closestArticle`.
- **Double-click guard:** clicks on the same control within 400 ms collapse to one `onSelect`, which gives Phase 4's "one request per double-click" for free.
- **Removal cleanup:** observer removal records call `closeStalePopover()`, so a popover whose tweet disappears cannot leave a dangling document listener.

## Deviations from Plan

None — the plan was executed as written. The zero-category/saved precedence is the only judgement call beyond the literal text ("if there are zero categories, render nothing"), and it is required to satisfy XI-11 for saved rows; it is documented in the code and in D1/D4 above.

## Issues Encountered
- The initial `onSelect` context resolved the article during render, before the root was attached, so `context.article` was the root itself. Fixed by resolving the article lazily at click time; the organizer test asserting `context.article === article` now passes.

## User Setup Required
None.

## Next Phase Readiness
- Phase 4 replaces the logging `onSelect` with: `setTweetSaving(id, true)` → `SAVE_TWEET` → `markTweetSaved(id)` or `setTweetSaving(id, false)`; `setSaved`/`setSaving` and the in-place rerender are already tested.
- Remaining manual UAT for this plan: load `dist/` unpacked, verify the popover opens above the action bar without clipping, the outside-click/Escape behaviour feels right, and toggling Popover/Inline plus reordering categories in the popup updates an open tab with no reload.
- No blockers.

---
*Phase: 03-x-dom-integration*
*Completed: 2026-09-27*
