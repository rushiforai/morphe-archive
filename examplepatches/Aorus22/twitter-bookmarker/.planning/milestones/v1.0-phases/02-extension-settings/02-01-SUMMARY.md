---
phase: 02-extension-settings
plan: 01
subsystem: extension
tags: [chrome-mv3, manifest-v3, typescript, esbuild, chrome-storage, slug, filename]

# Dependency graph
requires: []
# Plan frontmatter declares depends_on: [] — the extension scaffold is greenfield
# and does not consume the Go backend at build time.
provides:
  - "Loadable MV3 extension scaffold building from TypeScript into extension/dist/"
  - "Single-key chrome.storage.local store {version, settings, categories} with PRD defaults"
  - "slugifyFilename/isValidFilename matching PRD §8 exactly, including the empty-slug fallback"
  - "Category CRUD/reorder/settings persistence API (no backend calls) + onStoreChanged hook"
  - "Typed HEALTH_CHECK | GET_SAVED_INDEX | SAVE_TWEET message contract"
affects: [03-x-dom-integration, 04-save-integration, 05-auto-unbookmark, 06-hardening]

# Actuals — chars/4 over the files this plan realized (shared modules + toolchain + their tests).
actuals:
  tokens: 13602
  tasks: 3
  commits: 0

# Tech tracking
tech-stack:
  added:
    - "esbuild ^0.28.2 (bundler)"
    - "typescript ^7.0.2 (typecheck only, noEmit)"
    - "@types/chrome ^0.3.0"
  patterns:
    - "Single chrome.storage.local key holding the whole Store, normalized on every read"
    - "Pure, chrome-free helpers (normalizeStore/applyReorder/normalizeOrder) beside thin chrome-facing API"
    - "Per-entry esbuild invocations so worker=esm and content/popup=iife"
    - "Explicit .ts import specifiers so Node's test runner and esbuild resolve the same graph"

key-files:
  created:
    - extension/package.json
    - extension/package-lock.json
    - extension/tsconfig.json
    - extension/manifest.json
    - extension/build.mjs
    - extension/src/shared/types.ts
    - extension/src/shared/constants.ts
    - extension/src/shared/filename.ts
    - extension/src/shared/storage.ts
    - extension/src/shared/messages.ts
    - extension/src/background/service-worker.ts
    - extension/src/content/index.ts
    - extension/test/filename.test.mjs
    - extension/test/storage.test.mjs
    - extension/test/storage-chrome.test.mjs
    - extension/scripts/verify-dist.mjs
  modified: []

key-decisions:
  - "One documented storage key (twitterBookmarker) rather than one key per field — matches the PRD §7 shape exactly"
  - "Storage reads normalize malformed data instead of throwing, so a corrupt store degrades to defaults"
  - "slugifyFilename is stricter than the backend regex (strips leading/trailing/doubled hyphens) but always matches it"
  - "Category names are unique case-insensitively; duplicates and empty names are rejected before any write"
  - "Service worker ships the real message contract with `not_implemented` replies; Phase 4 only swaps the transport in"

patterns-established:
  - "Store access pattern: getStore() -> pure change function -> single chrome.storage.local.set"
  - "Invariant tests: a fetch spy proves category operations never touch the backend"
  - "Post-build verification script (npm run verify) asserting manifest, references, slug, and wiring"

requirements-completed: [EXT-01, EXT-03, EXT-04, EXT-12]

coverage:
  - id: D1
    description: "MV3 scaffold (manifest + esbuild pipeline) builds a loadable extension into extension/dist/"
    requirement: "EXT-01"
    verification:
      - kind: automated_ui
        ref: "npm run build && npm run verify (23 dist checks: manifest_version 3, referenced bundles exist, slug examples)"
        status: pass
    human_judgment: false
  - id: D2
    description: "chrome.storage.local holds {version, settings, categories} under one key, with defaults false/popover and order normalized to 0..n-1"
    requirement: "EXT-01"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#first run yields PRD defaults under the single storage key"
        status: pass
      - kind: unit
        ref: "test/storage.test.mjs#normalizeStore returns PRD defaults for empty/missing input"
        status: pass
      - kind: unit
        ref: "test/storage.test.mjs#normalizeStore normalizes order to 0..n-1"
        status: pass
    human_judgment: false
  - id: D3
    description: "Slug generation: Linux→linux.csv, AI & LLM→ai-llm.csv, Read Later→read-later.csv, empty→category-<short-id>.csv, always matching ^[a-z0-9][a-z0-9-]*\\.csv$"
    requirement: "EXT-03"
    verification:
      - kind: unit
        ref: "test/filename.test.mjs#PRD §8 examples produce the exact expected filenames"
        status: pass
      - kind: unit
        ref: "test/filename.test.mjs#generated filenames always match the backend regex"
        status: pass
      - kind: other
        ref: "node --input-type=module -e \"import { slugifyFilename } from './src/shared/filename.ts' ...\""
        status: pass
    human_judgment: false
  - id: D4
    description: "addCategory generates a stable uuid, slug filename, and appended order; rename recomputes filename without a backend call"
    requirement: "EXT-04"
    verification:
      - kind: unit
        ref: "test/storage-chrome.test.mjs#addCategory generates an id, slug filename, and appended order"
        status: pass
      - kind: unit
        ref: "test/storage-chrome.test.mjs#rename recomputes filename, keeps the id, and never touches the backend"
        status: pass
    human_judgment: false
  - id: D5
    description: "Manifest V3 requests only storage + https://x.com/* + http://127.0.0.1:43121/*"
    requirement: "EXT-12"
    verification:
      - kind: other
        ref: "npm run verify — permissions/host_permissions deep-equal + forbidden-permission sweep"
        status: pass
    human_judgment: false
  - id: D6
    description: "Loadable in chrome://extensions with no manifest errors and the service worker registered"
    requirement: "EXT-01"
    verification: []
    human_judgment: true
    rationale: "Loading unpacked into Chrome requires a real browser profile; the bundle, manifest, and every referenced file are verified statically, but only a human can confirm chrome://extensions reports zero errors."

# Metrics
duration: 8min
completed: 2026-09-27
status: complete
---

# Phase 2: Extension Foundation & Settings Popup — Plan 01 Summary

**Manifest V3 TypeScript scaffold with an esbuild pipeline, a single-key `chrome.storage.local` store, PRD-exact slug generation, and the storage/message APIs every later phase consumes.**

## Performance

- **Duration:** ~8 min (plans 02-01..02-03 were executed together in one sequential pass)
- **Started:** 2026-09-27T01:30:00Z
- **Completed:** 2026-09-27T01:37:00Z
- **Tasks:** 3
- **Files modified:** 16 created

## Accomplishments
- `extension/` builds to a load-unpacked `dist/` via `node build.mjs`: esbuild bundles the worker as ESM and the content/popup entries as IIFE, and copies `manifest.json`, `popup.html`, `popup.css` verbatim.
- `manifest.json` is MV3 with `permissions: ["storage"]`, exactly the two required `host_permissions`, a module service worker, a popup action, and a bookmarks-scoped content script.
- `src/shared/filename.ts` implements PRD §8 exactly (verified: `linux.csv`, `ai-llm.csv`, `read-later.csv`) with a `category-<short-id>.csv` fallback that always satisfies `^[a-z0-9][a-z0-9-]*\.csv$`.
- `src/shared/storage.ts` owns the whole store under one documented key, normalizes malformed data to defaults, and exposes getStore/getCategories/getSettings/add/updateName/updateColor/delete/reorder/setSettings/onStoreChanged — with zero network calls.
- `src/shared/messages.ts` freezes the `HEALTH_CHECK | GET_SAVED_INDEX | SAVE_TWEET` contract; `service-worker.ts` publishes it (Phase 4 swaps in the HTTP client), and `content/index.ts` bundles cleanly as a Phase 3 placeholder.
- `npm run verify` statically proves the built output: manifest parses, every manifest/HTML reference exists, slug examples and fallback hold, popup id/class wiring matches, bundle formats are esm/iife, and `chrome.storage.sync` never appears.

## Task Commits

No commits were made — this execution was explicitly forbidden from running any `git` command. All files are present in the working tree for the orchestrator to commit.

**Plan metadata:** not committed (git out of scope).

## Files Created/Modified
- `extension/package.json`, `extension/package-lock.json` — build/test/verify scripts and the three devDependencies (esbuild, typescript, @types/chrome)
- `extension/tsconfig.json` — strict, `ES2022`, `moduleResolution: Bundler`, `types: ["chrome"]`, `noEmit`
- `extension/manifest.json` — MV3 declaration (permissions/hosts/worker/popup/content script)
- `extension/build.mjs` — esbuild pipeline (`build`, `watch`) plus static-asset copy and post-build existence assertions
- `extension/src/shared/types.ts` — Category/Settings/Store/tweet/save/index types
- `extension/src/shared/constants.ts` — `STORAGE_KEY`, `BACKEND_BASE_URL`, `HEALTH_PATH`, `HEALTH_TIMEOUT_MS`, defaults, palette
- `extension/src/shared/filename.ts` — `slugifyFilename`, `isValidFilename`, `shortId`
- `extension/src/shared/storage.ts` — the single persistence surface for the extension
- `extension/src/shared/messages.ts` — typed message union, response types, narrowing, send helper
- `extension/src/background/service-worker.ts` — message-contract scaffolding only
- `extension/src/content/index.ts` — Phase 3 placeholder that bundles cleanly
- `extension/test/filename.test.mjs`, `test/storage.test.mjs`, `test/storage-chrome.test.mjs` — 30 tests incl. a fetch spy proving no backend calls
- `extension/scripts/verify-dist.mjs` — reproducible post-build verification (`npm run verify`)

## Decisions Made
- **Single storage key** (`twitterBookmarker`) holding the whole `Store`, so the persisted shape is literally the PRD §7 JSON.
- **Normalize-on-read** rather than migrate: a malformed/sparse store silently degrades to valid defaults instead of throwing in the popup.
- **Extension-level uniqueness**: empty and case-insensitive duplicate category names are rejected before any write, preventing two categories from targeting the same CSV.
- **Stricter-than-regex slugger**: leading, trailing, and repeated hyphens are stripped, so emitted filenames are a strict subset of what the backend accepts.
- **Explicit `.ts` import specifiers** with `allowImportingTsExtensions`, so the same module graph works for `tsc`, esbuild, and Node's native test runner without a second build step.

## Deviations from Plan

### Auto-fixed Issues

**1. [Rule 3 - Blocking] `node --test test/` does not accept a bare directory in Node 24**
- **Found during:** Task 1 verification (`npm test`)
- **Issue:** `node --test test/` tried to load `test` as a module (`MODULE_NOT_FOUND`) instead of discovering the files.
- **Fix:** Switched the script to Node's glob form, `node --test "test/*.test.mjs"`.
- **Files modified:** `extension/package.json`
- **Verification:** `npm test` → 30 pass / 0 fail.
- **Committed in:** not committed (git out of scope).

**2. [Rule 2 - Missing Critical] Added a reproducible dist verification script**
- **Found during:** required "prove the built output is a loadable extension" verification
- **Issue:** The required proof (manifest parses, references exist, slug examples) would otherwise be an unrepeatable ad-hoc shell incantation.
- **Fix:** Added `extension/scripts/verify-dist.mjs` + `npm run verify`, covering manifest validity, permissions, reference existence, slug examples/fallback/path-traversal, popup id/class wiring, and bundle formats.
- **Files modified:** `extension/scripts/verify-dist.mjs`, `extension/package.json`
- **Verification:** `npm run verify` → 23 checks pass.
- **Committed in:** not committed (git out of scope).

**3. [Rule 1 - Bug] Corrected a wrong `isValidFilename` expectation while writing tests**
- **Found during:** Task 2 test run
- **Issue:** The test asserted `linux-.csv` was invalid, but the PRD regex `^[a-z0-9][a-z0-9-]*\.csv$` permits a trailing hyphen (only the first character may not be `-`).
- **Fix:** Fixed the expectation and documented that `slugifyFilename` is intentionally stricter.
- **Files modified:** `extension/test/filename.test.mjs`
- **Verification:** `npm test` → 30 pass.
- **Committed in:** not committed (git out of scope).

---

**Total deviations:** 3 auto-fixed (1 blocking, 1 missing critical, 1 bug)
**Impact on plan:** No scope creep — all three fixes make the required verification reproducible and correct. `scripts/verify-dist.mjs` and the extra `npm run verify` script are additive tooling.

## Issues Encountered
- `npm ci`/`npm install` warn that esbuild's postinstall is not yet covered by npm's `allowScripts` policy; esbuild still resolves its `@esbuild/linux-x64` optional dependency and builds successfully (`esbuild 0.28.2`, `npm ci` from the lockfile verified).
- TypeScript 7.0.2 (the native compiler) resolved from the registry; the strict tsconfig typechecks cleanly with it.

## User Setup Required
None — no external service configuration. `npm install` (or `npm ci`) is the only setup step.

## Next Phase Readiness
- Phase 3 can import `onStoreChanged`, `getStore`, and the `Category`/`Settings` types as-is; the content script already has a bundling entry point.
- Phase 4 inherits the typed message contract and the `not_implemented` service-worker switch to replace with real HTTP calls.
- No blockers.

---
*Phase: 02-extension-settings*
*Completed: 2026-09-27*
