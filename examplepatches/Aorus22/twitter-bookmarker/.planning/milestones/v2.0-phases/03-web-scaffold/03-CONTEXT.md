# Phase 3: Web Scaffold, Theme & API Client - Context

**Gathered:** 2026-09-27
**Status:** Ready for planning
**Mode:** Auto-generated from PRD-2.md (discuss skipped via workflow.skip_discuss)
**Milestone:** v2.0 Local Web Gallery · **Roadmap phase 3 of 10** (= PRD §85 "Phase 2.3 — Web Scaffold")

<domain>
## Phase Boundary

Create the `web/` application and its foundation: project scaffold via the official shadcn CLI, Vite + React + TypeScript build, routing for the two required routes, the v2 Editorial design tokens wired for light/dark/system theme, shared app shell chrome, the Vite `/api` dev proxy, and a typed API client that only ever calls relative URLs.

**In scope:** `web/` scaffold, dependencies, routing shell, theme system + toggle, token layer (palette/typography/radii/shadows), fonts, a minimal app shell with top navigation, `src/lib/api/` client + `src/types/` DTOs, route placeholders for `/` and `/collections/:filename`, and a passing `pnpm build`.

**Out of scope:** the actual homepage cards (Phase 4), masonry/post cards (Phase 5), search/filter/sort (Phase 6), infinite scroll (Phase 7), lightbox (Phase 8), production serving/Makefile (Phase 9). This phase ships a navigable, themed, typed shell — the route components may render simple placeholders — plus the reusable primitives later phases build on.

</domain>

<decisions>
## Implementation Decisions

### Locked by PRD-2

- Scaffold with the **official shadcn CLI** Vite template, not a hand-written shadcn config (PRD §13):
  `pnpm dlx shadcn@latest init -t vite -n web` run from the repo root, producing `web/`. The
  CLI (v4.21.0) documents `-t/--template vite`, `-n/--name`, `-c/--cwd`, `-y/--yes`, and
  `--css-variables`. If the flags differ at run time, follow `--help` and the current official docs
  but keep the result inside `web/`.
- Stack is Vite + React + TypeScript + shadcn/ui + Tailwind; `pnpm` is the package manager (PRD §13).
- React Router for routing (PRD §14). Routes: `/` (gallery homepage) and `/collections/:filename`
  (collection detail). Lightbox needs no route of its own (PRD §15).
- Dev: the frontend calls **relative** `/api/...` URLs only; `web/vite.config.ts` proxies `/api`
  to `http://127.0.0.1:43121`. No CORS config, no hardcoded backend port anywhere in `src/`
  (PRD §10, §55).
- Theme: **system-aware**, `system` is the default, and `light`/`dark` are user-selectable
  (PRD §64).
- Visual direction: clean, minimal, media-first, Pinterest-inspired, shadcn-native, not an X clone
  (PRD §63). Nav is lightweight — no persistent sidebar (PRD §65).
- Preferred components to install now (as needed by later phases): Button, Card, Dialog, Popover,
  Sheet, Calendar/Date Picker, Input, Select, Badge, Skeleton, Separator, Dropdown Menu, Tooltip,
  Scroll Area (PRD §14).

### Design tokens (authoritative — see `docs/design/phase2-design-spec.md`)

The full spec is `docs/design/phase2-design-spec.md` (Figma page `Gallery Mockups v2 — Editorial`).
This phase must wire the **token layer**; later phases consume it.

Light: `bg #f6efe7`, `surface #fffdfc`, `surface-warm #fff6f0`, `ink #171419`, `muted #746b72`,
`border #e8dcd3`, `accent #f26a5b`, accents pink `#ff8fa3` / violet `#7c5cfc` / blue `#5b8cff` /
gold `#f2b65a` / green `#63a988`.
Dark: `bg #161319`, `surface #28212d`, `surface-warm #332a37`, `ink #fffdfc`,
`muted #b3a8ae`, `border #3b3140`, `accent #ff8b7d`, accents pink `#ff9fb2` / violet `#a48bff` /
blue `#7ea6ff` / gold `#f5c877` / green `#7fc0a0`.
Radii: 12 / 14 / 18 / 20 / 24 / 999. Shadows: nav/card/post/popover/hero per spec §2.5.
Gradients: `grad-brand #ff9b58→#8b5cf6`, `grad-hero #fff2e8→#f6e7ff`,
`grad-cta #26202b→#4a4054`, `grad-night #161319→#201822` (spec §2.6).
Fonts: **Playfair Display** (display) + **Inter** (UI) — self-host through `@fontsource*` packages,
not a runtime CDN link. Typographic scale is spec §2.3.

Expose tokens as CSS custom properties in `:root` and `.dark`, and map them into Tailwind's theme
so utilities like `bg-surface`, `text-ink`, `border-soft`, `rounded-lg` resolve. Keep shadcn's own
token names (`--background`, `--foreground`, `--primary`, …) mapped onto the editorial palette so
shadcn primitives inherit the design automatically rather than needing per-component overrides.

### Agent's Discretion

Exact Tailwind version handling (the CLI may emit Tailwind v3 or v4 — adapt to what is generated,
but keep the token names above stable); file layout under `src/` (PRD §72 suggests
`app/`, `components/gallery/`, `components/ui/`, `pages/`, `hooks/`, `lib/api/`, `types/`);
whether the API client is a thin `fetch` wrapper or TanStack Query (PRD §14: optional).

</decisions>

<code_context>
## Existing Code Insights

- The repo root has `backend/`, `extension/`, `docs/`, `Makefile`, `PRD.md`, `PRD-2.md`, and
  `.planning/`. `web/` does not exist yet. **Do not touch `backend/`, `extension/`, or the Makefile**
  in this phase (the Makefile is Phase 9).
- `.gitignore` currently ignores `node_modules/` and `extension/dist/`; add `web/dist/` (and any
  generated build output) — but the source, lockfile, and `components.json` must be committed.
- Backend API surface this client will call (Phase 2):
  `GET /api/gallery/collections` → `{collections: GalleryCollection[]}`;
  `GET /api/gallery/collections/{filename}/posts?cursor&limit&q&tweet_from&tweet_to&saved_from&saved_to&sort`
  → `{items: GalleryPost[], next_cursor: string|null, has_more: boolean}`;
  errors are `{status:"error",reason:string}` with 400/404/500.
- Types to declare (`src/types/`), from PRD §74/§75:
  `GalleryCollection { filename, name, post_count, media_count, last_saved_at: string|null, cover_media: string[] }`
  `GalleryPost { tweet_id, url, media: string[], author, username, tweet_date, saved_at, text }`

</code_context>

<specifics>
## Specific Ideas

Behaviours the verifier will check:

1. `cd web && pnpm build` succeeds and emits `web/dist/index.html`; `pnpm exec tsc --noEmit` (or the
   project's typecheck script) is clean.
2. `grep -rn "43121" web/src` returns nothing (the port only appears in `vite.config.ts`).
3. `web/vite.config.ts` contains a `/api` proxy to `http://127.0.0.1:43121`.
4. `web/components.json` exists (proving the CLI scaffold, not a hand-rolled config).
5. Visiting `/` renders the app shell (brand + nav) with a placeholder; `/collections/linux.csv`
   renders the collection route placeholder and the back link; an unknown path renders a not-found
   state — all without a full page reload.
6. A theme toggle switches light/dark and a "system" option follows `prefers-color-scheme`;
   reloading preserves the choice; default (no stored choice) is system.
7. `resolvedConfig` sanity: the built CSS contains the editorial palette values (e.g. `#f6efe7`
   and the dark `#28212d`).
8. Fonts load locally (no `fonts.googleapis.com` reference in the built output).

</specifics>

<deferred>
## Deferred Ideas

- Homepage collection cards (Phase 4), masonry and post cards (Phase 5)
- Search/filter/sort UI (Phase 6), infinite scroll (Phase 7), lightbox (Phase 8)
- Static serving, SPA fallback, Makefile web targets (Phase 9)
- TanStack Query — optional; only adopt it if it genuinely simplifies Phases 6–7

</deferred>
