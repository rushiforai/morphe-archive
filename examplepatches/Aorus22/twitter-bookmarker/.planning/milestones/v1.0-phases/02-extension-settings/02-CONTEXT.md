# Phase 2: Extension Foundation & Settings Popup - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD.md (discuss skipped via workflow.skip_discuss)

<domain>
## Phase Boundary

Create the Manifest V3 TypeScript extension scaffold, the shared `chrome.storage.local` model (categories + settings), and the popup UI for managing categories (add / rename / delete / color / drag-reorder), display mode, auto-unbookmark toggle, and backend connection status.

This phase does **not** implement X DOM integration or the save flow (Phases 3–4). It does include the shared storage module and a change-propagation helper the content script will use later.

Source of truth: `PRD.md` sections 6–10, 25, 42–51, 53, 61–62, 66.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD (do not revisit)

- Manifest V3. TypeScript + plain DOM APIs + minimal CSS. No React/Vue/Svelte.
- `chrome.storage.local` only — no `chrome.storage.sync`, no cloud.
- Extension owns categories and settings; the backend never receives them. Add/rename/delete/color/reorder perform **no backend calls**.
- `filename` is derived from `name` by slugging and is recomputed on rename; the old CSV is never renamed/migrated.
- Delete only removes the category from storage; CSV data and index entries survive.
- `color` is UI-only; never persisted to CSV and never sent to the backend.
- Defaults: `unbookmarkAfterSave = false`, `displayMode = "popover"`.
- Permissions limited to `storage`, `https://x.com/*`, and the localhost backend origin. Nothing else.

### Agent's Discretion

- Build tool (esbuild recommended) and exact `dist/` layout.
- Popup markup/CSS structure, as long as it matches PRD §43's information architecture.
- UUID generation approach (`crypto.randomUUID()` is available in MV3 contexts).

</decisions>

<code_context>
## Existing Code Insights

Greenfield. Phase 1 created `backend/`. Recommended extension layout (PRD §59):

```text
extension/
├── manifest.json
├── package.json
├── src/
│   ├── background/     # service worker (HTTP client lands in Phase 4)
│   ├── content/        # Phase 3
│   ├── popup/          # category manager + settings
│   └── shared/         # types, storage, filename, messages
└── dist/               # build output, load-unpacked target
```

</code_context>

<specifics>
## Specific Ideas

### Storage schema (PRD §7)

```json
{
  "version": 1,
  "settings": { "unbookmarkAfterSave": false, "displayMode": "popover" },
  "categories": [
    { "id": "uuid", "name": "Linux", "filename": "linux.csv", "color": "#xxxxxx", "order": 0 }
  ]
}
```

### Slug behavior (PRD §8)

lowercase → trim → spaces to `-` → remove unsafe filename chars → collapse multiple `-` → append `.csv`.
Examples: `Linux` → `linux.csv`; `AI & LLM` → `ai-llm.csv`; `Read Later` → `read-later.csv`.
Fallback when slug is empty: `category-<short-id>.csv`.

### Popup IA (PRD §43)

```
Twitter Bookmarker
────────────────
Backend
● Connected | ● Disconnected   [Retry]
Categories
● AI       ≡
● Linux    ≡
● Design   ≡
[ + Add category ]
────────────────
Unbookmark after save   [ ON / OFF ]
Category display        [ Popover / Inline ]
```

Empty state: `No categories yet` + `[+ Add category]`.
Delete confirmation: `Delete category "Linux"? Existing CSV data will not be deleted.`

### Backend status (PRD §44)

On every popup open: `GET http://127.0.0.1:43121/health` → `● Connected` / `● Disconnected`. Optional Retry button. Fetch must run from the extension context (popup or service worker) — not from the page.

</specifics>

<deferred>
## Deferred Ideas

- Toast UI on X — Phase 4.
- Content script injection and extraction — Phase 3.
- Auto-unbookmark behavior — Phase 5.

</deferred>
