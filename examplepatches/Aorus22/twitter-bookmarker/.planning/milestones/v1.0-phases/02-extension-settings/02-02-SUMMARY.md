---
phase: 02-extension-settings
plan: 02
subsystem: extension-ui
tags: [chrome-mv3, popup, category-crud, drag-and-drop, color-picker, plain-dom, css]

# Dependency graph
requires:
  - phase: 02-extension-settings (plan 01)
    provides: "shared/storage.ts CRUD API, Category type, popup esbuild entry, dist asset copy"
provides:
  - "Popup markup/styles matching PRD §43 (header, backend row, categories, settings)"
  - "Category list rendering with swatch, derived filename, inline rename, delete, drag handle"
  - "Add-category form (name + color) and the `No categories yet` empty state"
  - "HTML5 drag-and-drop reorder persisted to storage order"
affects: [03-x-dom-integration, 04-save-integration, 06-hardening]

# Actuals — chars/4 over this plan's files (popup.html, popup.css, category-manager.ts).
actuals:
  tokens: 4676
  tasks: 2
  commits: 0

# Tech tracking
tech-stack:
  added: []
  patterns:
    - "<template> cloning for category rows; replaceChildren for full rerenders"
    - "Optimistic DOM reorder during dragover, persisted once on dragend (no write storms)"
    - "Inline error surface (#category-error) instead of thrown exceptions"
    - "Guard render() while an inline rename input is open so it is never clobbered"

key-files:
  created:
    - extension/src/popup/popup.html
    - extension/src/popup/popup.css
    - extension/src/popup/category-manager.ts
  modified: []

key-decisions:
  - "Rename goes through an inline row input (Enter/blur commits, Escape cancels) so the derived filename is visible immediately"
  - "Every category operation routes through shared/storage.ts; the popup never constructs a URL or calls fetch for CRUD"
  - "The derived filename is rendered under each name (`→ linux-stuff.csv`) so the user sees that rename retargets the CSV"
  - "Delete uses window.confirm with the exact PRD §48 copy; no custom modal"

patterns-established:
  - "Section module contract: initX() -> { render(store) }, with DOM lookups via a shared requireEl helper"
  - "All async UI actions are `void promise.then(clearError).catch(showError)` — nothing throws into the void"

requirements-completed: [EXT-03, EXT-04, EXT-05, EXT-06, EXT-07, EXT-11]

coverage:
  - id: D1
    description: "Add category from the popup: name validation, color, generated id/slug/order, form collapses after save"
    requirement: "EXT-03"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#addCategory generates an id, slug filename, and appended order"
        status: pass
      - kind: unit
        ref: "test/storage-chrome.test.mjs#addCategory rejects empty and duplicate names without writing"
        status: pass
      - kind: other
        ref: "npm run verify — popup wiring: required ids/classes exist in popup.html (#add-category-form, #add-category-name, #add-category-color)"
        status: pass
    human_judgment: false
  - id: D2
    description: "Rename a category inline; filename is recomputed and displayed; old CSV untouched and no backend request"
    requirement: "EXT-04"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#rename recomputes filename, keeps the id, and never touches the backend"
        status: pass
      - kind: unit
        ref: "test/storage-chrome.test.mjs#rename rejects duplicates and unknown ids"
        status: pass
      - kind: other
        ref: "npm run verify — popup wiring: .category-name-input / .category-rename / .category-filename hooks"
        status: pass
    human_judgment: false
  - id: D3
    description: "Delete a category after the exact confirmation `Delete category \"<name>\"? Existing CSV data will not be deleted.`; storage-only, no backend call"
    requirement: "EXT-05"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#deleteCategory removes only that category and renumbers the rest"
        status: pass
      - kind: other
        ref: "npm run verify — built popup bundle contains the exact delete-confirmation copy"
        status: pass
    human_judgment: false
  - id: D4
    description: "Per-row color picker updates the UI-only color and never affects filename/CSV"
    requirement: "EXT-06"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#updateCategoryColor only changes the UI colour"
        status: pass
      - kind: other
        ref: "npm run verify — popup wiring: .category-color hook exists in popup.html"
        status: pass
    human_judgment: false
  - id: D5
    description: "Drag-and-drop reorder via HTML5 DnD on rows, persisted as normalized 0..n-1 order"
    requirement: "EXT-07"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#reorderCategories rewrites order to 0..n-1 and persists it"
        status: pass
      - kind: unit
        ref: "test/storage.test.mjs#applyReorder rewrites order and keeps unknown ids at the end"
        status: pass
    human_judgment: true
    rationale: "The storage half is unit-proven, but the drag gesture itself (dragover DOM move, dragend persistence, no write storm) can only be exercised in a real browser popup — UAT must drag rows and reopen the popup."
  - id: D6
    description: "Empty state shows `No categories yet` plus `+ Add category`"
    requirement: "EXT-11"
    verification:
      - kind: other
        ref: "npm run verify — built popup markup contains the empty state, add-category, and settings rows"
        status: pass
    human_judgment: true
    rationale: "Presence of the markup/copy is machine-checked; that the empty state renders and toggles correctly at popup width needs a human eye in the loaded popup."

# Metrics
duration: 8min
completed: 2026-09-27
status: complete
---

# Phase 2: Extension Foundation & Settings Popup — Plan 02 Summary

**Framework-free popup Categories section: add with name+color, inline rename that visibly retargets the CSV filename, exact-copy delete confirmation, per-row color, drag-reorder, and the empty state — all persisted to `chrome.storage.local` with zero backend traffic.**

## Performance

- **Duration:** ~8 min (plans 02-01..02-03 were executed together in one sequential pass)
- **Started:** 2026-09-27T01:30:00Z
- **Completed:** 2026-09-27T01:37:00Z
- **Tasks:** 2
- **Files modified:** 3 created

## Accomplishments
- `popup.html` implements the PRD §43 information architecture: header, Backend status row with Retry, Categories list, `+ Add category`, add form (name + color), empty-state block, unbookmark toggle, and Popover/Inline segmented control — all icon-only controls carry `aria-label`s.
- `category-manager.ts` renders one row per category with a color swatch, name, derived filename, rename affordance, delete affordance, and a drag handle, cloning a single `<template>` and rerendering via `replaceChildren`.
- Rename is inline: the derived filename (e.g. `→ linux-stuff.csv`) updates in place, proving to the user that rename retargets the CSV without touching the old file.
- Delete uses `window.confirm` with exactly `Delete category "<name>"?\n\nExisting CSV data will not be deleted.` and calls storage only.
- Reorder moves the dragged row in the DOM during `dragover` and persists once on `dragend`, skipping no-op writes by comparing against the last rendered order.
- Every mutation is wrapped so failures surface in `#category-error` rather than becoming unhandled rejections.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/src/popup/popup.html` — PRD §43 popup structure + the category-row `<template>`
- `extension/src/popup/popup.css` — minimal light/dark styling sized for a 320px popup
- `extension/src/popup/category-manager.ts` — list rendering, add/rename/delete/color/reorder handlers, empty state, inline errors

## Decisions Made
- **Inline rename over a dialog**: keeps the derived filename visible in the same row, which is the whole point of PRD §46.
- **DOM-first reorder, persist on `dragend`**: avoids a `chrome.storage.local` write on every `dragover` tick.
- **`requireEl` throws a clear message** when markup drifts, and `npm run verify` statically cross-checks every required id/class against `popup.html` so that risk is caught at build time.
- **Non-empty/case-insensitive uniqueness is enforced in storage**, so the popup only needs to render the message it gets back.

## Deviations from Plan

None — plan executed as written. (The plan suggested `<input type="color">` "per row (or an edit affordance)"; a per-row color input was used, and the row also renders the derived filename, which the plan's rename bullet requested.)

## Issues Encountered
- None. `npm run typecheck` and `npm run verify` both pass against the markup/module contract.

## User Setup Required
None.

## Next Phase Readiness
- Phase 3 can reuse the same `<template>`-clone + `requireEl` pattern for the in-tweet organizer UI, and the same inline-error approach for toasts.
- Phase 3 must render category colors and honor `order` — both are already normalized/persisted by Phase 2.
- No blockers.

---
*Phase: 02-extension-settings*
*Completed: 2026-09-27*
