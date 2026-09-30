---
gsd_state_version: "1.0"
milestone: v2.0
milestone_name: Local Web Gallery
status: Awaiting next milestone
stopped_at: Phase 10 complete — all phases complete; post-v2.0 curation implemented but uncommitted
last_updated: "2026-09-28T14:32:16Z"
last_activity: 2026-09-28
last_activity_desc: Post-v2.0 curation (schema v2 soft delete + move between folders + web kebab menu) implemented and verified; not yet committed
state_head: 69da7ceaae8fbc4660dae9a9a8d54dd5a2f7da0d
progress:
  total_phases: 10
  completed_phases: 10
  total_plans: 10
  completed_plans: 10
  percent: 100
current_phase: 10
current_phase_name: Hardening, Accessibility & Responsive
---

# Project State

## Project Reference

See: .planning/PROJECT.md (updated 2026-09-28)

**Core value:** A categorized tweet is durably persisted to the SQLite database before anything else happens — the database is the single source of truth, and nothing is ever unbookmarked before the write succeeds. The `/api/gallery/*` API (Phase 2) is a read-only projection of that database and may never become a second source of truth; there is no derived index or cache. Mutations live on the bookmark resource, never in the gallery API.
**Current focus:** Post-v2.0 curation is implemented and verified but uncommitted — commit it before starting the next milestone; v2.0 shipped and archived; the next milestone starts at Phase 11

## Current Position

Phase: Milestone v2.0 complete (no active phase)
Plan: —
Status: Awaiting next milestone — post-v2.0 curation done but uncommitted
Last activity: 2026-09-28 — Post-v2.0 curation implemented and verified; not yet committed

## Performance Metrics

**Velocity:**

- Total plans completed (v1.0): 16
- Total plans completed (v2.0): 10
- Average duration: —
- Total execution time: 0 hours

**By Phase (v2.0):**

| Phase | Plans | Total | Avg/Plan |
|-------|-------|-------|----------|
| 1. Gallery Read Layer | 1 | 1 | - |
| 2. Gallery HTTP API | 1 | 1 | - |
| 3. Web Scaffold, Theme & API Client | 1 | 1 | - |
| 4. Gallery Homepage | 1 | 1 | - |
| 5. Collection Gallery | 1 | 1 | - |
| 6. Discovery Tools | 1 | 1 | - |
| 7. Infinite Scroll | 1 | 1 | - |
| 8. Media Lightbox | 1 | 1 | - |
| 9. Production Serving | 1 | 1 | - |
| 10. Hardening, Accessibility & Responsive | 1 | 1 | - |

**Recent Trend:**

- Last 5 plans: 06-01, 07-01, 08-01, 09-01, 10-01 complete
- Trend: —

## Accumulated Context

### Decisions

Decisions are logged in PROJECT.md Key Decisions table.
Recent decisions affecting current work:

- [v2.0 Bootstrap]: Milestone built from `PRD-2.md`; 10 roadmap phases map 1:1 to the PRD §85 implementation order (roadmap Phase 1 = PRD 2.1 … Phase 10 = 2.10).
- [v2.0 Bootstrap]: Web design authority is the Figma page `Gallery Mockups v2 — Editorial`, captured in `docs/design/phase2-design-spec.md`; the page-1 neutral variant is superseded.
- [v2.0 Bootstrap]: Discuss skipped (`workflow.skip_discuss=true`); each phase's `NN-CONTEXT.md` is authored from the PRD + design spec and is authoritative.
- [Phase 1]: Malformed cursor is rejected by `Reader.Posts` as a `*storage.ValidationError` (not by `RawQuery.Parse`) — Phase 2 must map `Posts` errors to 400 too. `limit=0` is only rejected via `RawQuery.Parse`, so the HTTP layer must build queries through `RawQuery.Parse`.
- [Phase 1]: Two defects in the orchestrator's fixture/acceptance harness were found and fixed before Phase 2 (invalid quoting for the `media` field in the Phase 1 fixture; inverted `tweet_desc` expectation).
- [post-v2.0 storage]: One CSV per category plus a derived `index.json` was replaced by one SQLite database (`tw-bookmarker.db`, schema version 1 in `PRAGMA user_version`; schema version 2 added by the curation work below). The backend has no CSV awareness; the one-time CSV→SQLite migration lives in the data repository (`Scripts/migrate_to_sqlite.py`). See `docs/design/sqlite-migration.md` and PROJECT.md Key Decisions.
- [post-v2.0 curation]: Deletion is a soft delete — the row is *moved* from `bookmarks` into `deleted_bookmarks` (schema version 2) so `bookmarks` stays exactly the live set and no read path needs a filter; recovery is deliberately manual SQL and the trash row is kept after a restore so it stays auditable. Moving between existing folders is `PUT /v1/bookmarks/{tweet_id}/collection`. Both endpoints live on the bookmark resource so `/api/gallery/*` stays strictly read-only and GET-only (API-07). Web UI is a per-post kebab menu with a destructive confirmation dialog and a folder picker. Implemented and verified (Go packages, 46 web test files / 496 tests, gallery acceptance 116/116, web acceptance 146/146, traceability 82/82) but **not yet committed**. See PROJECT.md Key Decisions.

### Pending Todos

- Commit the post-v2.0 curation work (schema version 2, `deleted_bookmarks`, soft-delete and move endpoints, web kebab menu and dialogs); it currently shows as modified/untracked files in the extension repo.

### Blockers/Concerns

None.

## Deferred Items

Items acknowledged and deferred, most recent first:

| Category | Item | Status | Deferred At | Milestone |
|----------|------|--------|-------------|-----------|
| Accessibility | Two moderate landmark violations (`landmark-no-duplicate-banner`, `landmark-unique`) while the desktop filter Popover is open — three `<header>` landmarks exist, one inside `role="dialog"`; the fix is to render the Popover panel's `<header>` as a `<div>` | Open | 2026-09-28 | v2.0 |
| Accessibility | The active quick-range pill (`bg-grad-brand text-accent`) sits on a gradient axe cannot evaluate; measured ≈1.25–2.54:1 — a deliberate design combination needing a human design decision, not a token change | Open | 2026-09-28 | v2.0 |
| Verification | No real screen-reader pass (VoiceOver/NVDA) in any phase; the harness proves names, roles, focus order and axe rules, not spoken output | Open | 2026-09-28 | v2.0 |
| Verification | PRD §82 step 21 (the original tweet opening in a new tab) is asserted as the canonical `x.com/<user>/status/<id>` href plus target/rel, not by live navigation; documented as manual checklist step F1-21 | Open | 2026-09-28 | v2.0 |
| Tooling | `scripts/check-web-acceptance.sh` drops its `--out` argument when it re-execs under `unshare -rn` — the arg loop consumes `"$@"` and the re-exec then passes the emptied list | Open | 2026-09-28 | v2.0 |

## Session Continuity

Last session: 2026-09-28
Stopped at: Post-v2.0 curation implemented and verified but uncommitted — no active milestone
Resume file: None

## Operator Next Steps

- Commit the post-v2.0 curation work (schema version 2, soft delete + move between folders, web kebab menu and dialogs) — it is verified but currently uncommitted
- Start the next milestone with `$gsd-new-milestone` (fresh requirements; the next phase number is 11)
- Read `.planning/milestones/v2.0-MILESTONE-AUDIT.md` for the full audit and tech-debt detail
