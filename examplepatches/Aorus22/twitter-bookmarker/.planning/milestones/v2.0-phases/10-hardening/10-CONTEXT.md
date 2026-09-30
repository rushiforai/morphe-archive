# Phase 10: Hardening, Accessibility & Responsive - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 10 of 10** (= PRD §85 "Phase 2.10 — Hardening")

<domain>
## Phase Boundary

Close out the milestone: prove the edge cases with automated tests, finish the error/empty/loading UX, complete the responsive behaviour, satisfy the accessibility requirements, and execute the PRD §82 end-to-end integration scenario against a seeded storage directory.

**In scope:** backend hardening tests (malformed media JSON, malformed rows, large CSV), frontend error/retry and empty states verification, responsive column verification + Sheet filter, the accessibility pass (focus visibility, alt text, contrast, dialog semantics), a seeded integration script/fixture, and documentation updates.

**Out of scope:** new product features. This phase fixes and proves, it does not expand scope.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Malformed `media` JSON on one row must not crash the server; the post renders as a text card
  (PRD §50). Malformed rows are skipped with a warning and the rest of the collection stays available
  (PRD §51). A large CSV must be handled acceptably on a local machine (PRD §68).
- Broken `pbs.twimg.com` media must not collapse or break the card; show a neutral placeholder and
  keep metadata + `Open on X` (PRD §62).
- Backend unavailable in development → `Could not connect to Twitter Bookmarker backend`; gallery API
  error → `Could not load this collection` with `Retry` (PRD §61).
- Responsive: mobile 1 column, tablet 2, desktop 3–5; the filter popover becomes a Sheet/Drawer on
  narrow viewports (PRD §66, §30).
- Accessibility (PRD §67): keyboard-reachable controls; visible focus states; semantic buttons/links;
  image `alt` fallback derived from author/tweet context; Dialog/lightbox focus trap; Escape closes;
  arrow navigation; adequate contrast; and the tweet URL is reachable without clicking an image.
- SPA refresh must work for direct navigation to `/collections/linux.csv` (PRD §80.25).
- New bookmark data must appear without restarting the backend (PRD §80.22, §82 step 24).

### Integration scenario (PRD §82 — must be executable end-to-end)

```
1.  Backend running.
2.  ~/.twitter-bookmarker/ contains ai.csv, linux.csv, design.csv.
3.  Open http://127.0.0.1:43121
4.  Homepage shows AI, Linux, Design.
5.  Open Linux.
6.  Posts render in masonry.
7.  A tweet with 4 images shows 4 images.
8.  A tweet without images still appears as a text card.
9.  Search "wayland" filters results.
10. Bookmark Date → Last 7 Days.
11. Results change.
12. Add a Tweet Date filter too.
13. Results satisfy both ranges.
14. Switch sort to Newest Posted.
15. Infinite scroll loads the next page.
16. Click an image.
17. Lightbox opens.
18. Press Right Arrow.
19. Next media appears.
20. Click Open on X.
21. The original tweet opens.
22. The extension saves a new tweet to a CSV.
23. Return to the gallery / refocus the window.
24. The new data appears without restarting the backend.
```

Steps 22/24 can be exercised by appending a row to the CSV directly (the extension path is already
proven in v1.0) plus a window-focus refetch. Steps 16–21 are browser-interaction steps: provide a
repeatable, documented way to verify them (a Playwright script if practical, or a precise manual
checklist in `docs/`) — do **not** leave them unverifiable.

### Deliverables beyond code

- Update `docs/MANUAL-TEST-CHECKLIST.md` (or add a Phase 2 section alongside it) with the §82 scenario
  and the visual/UX checks that automation cannot cover.
- Update `README.md` with the Phase 2 workflow: dev (two terminals), production build, and the
  gallery URL.
- Add a seeded-fixture helper so the integration scenario is reproducible (a script or a documented
  `make` target that writes the three CSVs into a temp storage dir and runs the server against it).

</decisions>

<code_context>
## Existing Code Insights

- `docs/MANUAL-TEST-CHECKLIST.md` — the v1.0 extension checklist; extend it rather than replacing it.
- `README.md` — currently documents the extension + backend; add the gallery.
- Backend tests live beside the code (`internal/gallery/*_test.go`, `internal/api/*_test.go`); the
  v1.0 suite already covers CSV edge cases for the writer — this phase covers the reader path.
- Frontend: `pnpm build` + `pnpm exec tsc --noEmit` must stay green; if a component test runner exists
  it should cover the pure helpers (date conversion, dedupe, cover layout selection).
- Prefer adding a small, honest Playwright (or equivalent) smoke test only if it can run headless in
  this environment; otherwise document the manual steps precisely and automate everything else
  (API-level assertions for steps 4–15, 24 via HTTP + CSV append).

</code_context>

<specifics>
## Specific Ideas

1. `go test ./... -race` covers: a CSV with a malformed `media` cell, a CSV with a malformed row in
   the middle, a legacy-header CSV, and a generated large CSV (e.g. 5,000 rows) that completes a
   summary + a paginated query within a sane bound without error.
2. A frontend test (or scripted assertion) proves: cover layout selection for 4/3/1/0 media, the
   local-date → UTC boundary conversion, and `tweet_id` dedupe.
3. Responsive check at 390 / 768 / 1440 px: 1 / 2 / 4+ columns; the Filter control renders a Sheet at
   390 and a Popover at 1440.
4. Accessibility audit: run an axe-based check (`figma_scan_code_accessibility` on rendered markup, or
   `@axe-core/playwright` if added) and fix every serious/critical violation; verify visible focus on
   the nav, toolbar, cards, and lightbox; verify `alt` text on media; verify the dark-mode contrast
   fix from design spec §2.2.
5. The integration scenario runs against a seeded dir with the three named CSVs and is documented as
   a checklist with observed results.
6. `make test` (Go + extension) still passes; `pnpm build` still succeeds.

</specifics>

<deferred>
## Deferred Ideas

- mtime-aware summary cache (PRD §69)
- Any new feature beyond PRD-2 §80/§81/§82

</deferred>
