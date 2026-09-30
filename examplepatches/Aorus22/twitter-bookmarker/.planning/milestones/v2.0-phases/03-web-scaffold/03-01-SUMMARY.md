---
phase: 03-web-scaffold
plan: 01
subsystem: web-frontend
tags: [vite, react, typescript, tailwind-v4, shadcn, design-tokens, dark-mode, react-router, typed-api-client, self-hosted-fonts]

# Dependency graph
requires:
  - phase: 02-gallery-http-api
    provides: "GET /api/gallery/collections -> {collections:[6 fields]}; GET /api/gallery/collections/{filename}/posts -> {items,next_cursor,has_more}; 400/404/500 as {status:'error',reason}"
  - phase: docs/design
    provides: "docs/design/phase2-design-spec.md §1-3: frame map, light+dark palette, typography scale, radii, shadows, gradients"
provides:
  - "web/ pnpm project: Vite 8 + React 19 + TypeScript 6 + Tailwind 4 + shadcn/ui (components.json, style radix-nova)"
  - "Editorial token layer in src/index.css: raw :root/.dark palette + Tailwind utilities + shadcn semantics"
  - "ThemeProvider (context) + useTheme hook + ThemeToggle: light|dark|system, system default, localStorage-persisted"
  - "AppShell (persistent nav + theme toggle + page container) and the route table /, /collections/:filename, *"
  - "src/lib/api: fetchCollections/fetchPosts over relative /api/gallery URLs, ApiError(reason,status)"
  - "src/types: GalleryCollection, GalleryPost, GalleryPostsParams, GalleryPostsResponse, GallerySort"
  - "Vite dev proxy /api -> 127.0.0.1:43121; self-hosted Playfair Display + Inter via @fontsource"
  - "11 hand-installed shadcn primitives: button card input badge skeleton dialog popover sheet select separator tooltip"
affects: [phase-4, phase-5, phase-6, phase-7, phase-8, phase-9]

actuals:
  tokens: 0
  tasks: 8
  commits: 2

tech-stack:
  added:
    [
      "vite@8.3.1, react@19.3.0, react-dom@19.3.0, typescript@6.0.3",
      "tailwindcss@4.3.3 + @tailwindcss/vite@4.3.3 + tw-animate-css@1.4.0",
      "shadcn CLI@4.21.0 (scaffold + registry adds), components.json style=radix-nova baseColor=neutral",
      "radix-ui@1.6.7 (unified package), class-variance-authority, cn (clsx+tailwind-merge), lucide-react",
      "react-router-dom@7.18.4",
      "@fontsource/playfair-display@5.3.0 (400/700), @fontsource-variable/inter@5.3.0",
    ]
  patterns:
    - "Two-layer token CSS: raw design custom properties on :root/.dark, then @theme inline maps them into Tailwind so utilities stay var()-backed and re-theme without regenerating classes"
    - "Shadow tokens use a --sh-* indirection so Tailwind emits --tw-shadow: var(--sh-nav) instead of inlining the light literal; only then does the .dark reduction reach shadow-* utilities"
    - "Dark mode via the `dark` class on <html>, plus a tiny pre-paint inline script in index.html that applies the stored/system theme before React mounts (no flash)"
    - "Routing: createBrowserRouter with AppShell as the layout route and <Outlet/> children, so nav + toggle survive navigation"
    - "API client: one request<T>() helper — non-2xx -> ApiError(reason from envelope, status), transport failure -> status 0, undecodable body -> ApiError"
    - "Constrained API surface: every consumer imports from @/lib/api and @/types; no host/port literal exists in src/"

key-files:
  created:
    - web/components.json
    - web/vite.config.ts
    - web/index.html
    - web/package.json
    - web/pnpm-lock.yaml
    - web/pnpm-workspace.yaml
    - web/src/index.css
    - web/src/main.tsx
    - web/src/lib/utils.ts
    - web/src/types/gallery.ts
    - web/src/types/index.ts
    - web/src/lib/api/client.ts
    - web/src/lib/api/errors.ts
    - web/src/lib/api/index.ts
    - web/src/app/theme-provider.tsx
    - web/src/app/theme-toggle.tsx
    - web/src/app/app-shell.tsx
    - web/src/app/routes.tsx
    - web/src/hooks/use-theme.ts
    - web/src/hooks/index.ts
    - web/src/pages/gallery-page.tsx
    - web/src/pages/collection-page.tsx
    - web/src/pages/not-found-page.tsx
    - web/src/components/ui/{button,card,input,badge,skeleton,dialog,popover,sheet,select,separator,tooltip}.tsx
    - web/public/favicon.svg
  modified:
    - .gitignore

key-decisions:
  - "Scaffolded with the official CLI: `pnpm dlx shadcn@latest init -t vite -n web -y --no-monorepo -b radix -p nova` — the documented `--base-color` flag does not exist in v4; the base library is `-b/--base` and the palette comes from `-p/--preset`. stdin was closed (`</dev/null`) so any prompt failed fast instead of hanging."
  - "Design tokens win the --muted/--accent/--border name collision with shadcn (the phase contract requires text-muted/border-border and the exact palette); shadcn's neutral hover/pulse surfaces were redirected to --surface-warm in the six primitives that used bg-muted/bg-accent, and --muted-foreground still resolves to the design muted"
  - "Dark-mode shadows are implemented with a --sh-* indirection rather than literals, because Tailwind inlines a literal shadow value into --tw-shadow and the .dark override would otherwise be dead"
  - "The OS preference is read during render (not cached in state) and a change listener only bumps a reducer counter; this removes a setState-in-effect cascade and fixes the real staleness case of returning to `system` after the OS changed while an explicit theme was active"
  - "index.html carries a pre-paint theme script so a reload never flashes the wrong theme; the storage key literal is duplicated there deliberately and commented as needing to stay in sync"
  - "Both nav links resolve to `/` (design spec §3.1); the mockup's nav search, `Explore` and mobile hamburger are omitted rather than shipped dead (spec §3.1 scope note, §7)"
  - "`web/` is its own pnpm workspace root (pnpm-workspace.yaml) so it installs/builds standalone; no root pnpm-workspace.yaml exists to swallow it"

patterns-established:
  - "Token consumers use only the mapped utilities: bg-bg/bg-surface/bg-surface-warm, text-ink/text-muted/text-accent, border-border, bg-accent-*, rounded-{sm,md,lg,xl,2xl,pill}, shadow-{nav,card,post,popover,hero}, font-sans/font-display, bg-grad-{brand,hero,cta,night}"
  - "Route bodies are Phase 4-8 territory; the shell, tokens, theme and API client are frozen interfaces"

requirements-completed: [WEB-01, WEB-02, WEB-03, WEB-04, WEB-05, WEB-06, WEB-07, WEB-08]

coverage:
  - id: D1
    description: "web/ is a self-contained pnpm Vite+React+TS+Tailwind+shadcn project scaffolded by the official CLI; components.json present"
    requirement: "WEB-01"
    verification:
      - kind: e2e
        ref: "web/components.json exists (style radix-nova, cssVariables true); cd web && pnpm install --frozen-lockfile && pnpm build -> dist/index.html"
        status: pass
    human_judgment: false
  - id: D2
    description: "Editorial palette/radii/shadows/gradients in :root and .dark, mapped into Tailwind and onto shadcn's semantic variables"
    requirement: "WEB-02"
    verification:
      - kind: e2e
        ref: "all 31 spec hex values present in web/dist/assets/index-*.css; .text-ink{color:var(--ink)} .text-muted{color:var(--muted)} .border-border{border-color:var(--border)} .bg-surface{background-color:var(--surface)} .rounded-pill{border-radius:var(--r-pill)} .shadow-nav{--tw-shadow:var(--sh-nav)}; .dark overrides --sh-nav"
        status: pass
    human_judgment: false
  - id: D3
    description: "Playfair Display + Inter self-hosted via @fontsource; zero Google Fonts references"
    requirement: "WEB-03"
    verification:
      - kind: e2e
        ref: "pnpm build emits 23 woff/woff2 assets (playfair-display-latin-400/700, inter-latin-wght); grep -rn fonts.googleapis|fonts.gstatic over web/ *.ts *.tsx *.css *.html -> no matches"
        status: pass
  - id: D4
    description: "ThemeProvider/useTheme/ThemeToggle: system default, persisted, dark class on <html>, reacts to OS changes in system mode"
    requirement: "WEB-04"
    verification:
      - kind: e2e
        ref: "headless jsdom run of the real built bundle: 17/17 checks (default light/dark, stored dark wins, 3-step toggle cycle light->dark->system, persisted values, live OS flip both directions)"
        status: pass
    human_judgment: false
  - id: D5
    description: "vite.config.ts proxies /api to http://127.0.0.1:43121; the literal appears nowhere under web/src"
    requirement: "WEB-05"
    verification:
      - kind: e2e
        ref: "grep -rn 43121 over web/ (ts/tsx/css/html/json/js, excluding node_modules) -> only web/vite.config.ts:21; grep -rn 43121 web/src -> no matches"
        status: pass
    human_judgment: false
  - id: D6
    description: "fetchCollections/fetchPosts use relative URLs only, omit undefined/empty params, URL-encode the filename, and map the error envelope to ApiError(reason,status)"
    requirement: "WEB-06"
    verification:
      - kind: e2e
        ref: "headless node run of the compiled client with a stubbed fetch: 12/12 checks (relative base, filename encoding a%20b%2Fc.csv, param omission, no-query case, pagination defaults, 404/400 envelope reasons, non-JSON 500, transport failure status 0 + PRD §61 copy, malformed 200)"
        status: pass
    human_judgment: false
  - id: D7
    description: "GalleryCollection/GalleryPost DTOs match PRD §74/§75 and the Phase 2 wire field names exactly"
    requirement: "WEB-07"
    verification:
      - kind: e2e
        ref: "src/types/gallery.ts field-by-field against PRD-2 §74/§75 and 02-01-SUMMARY provides block; consumed by the client and asserted in the API harness"
        status: pass
    human_judgment: false
  - id: D8
    description: "React Router serves /, /collections/:filename and a catch-all 404 inside a persistent AppShell, with client-side navigation"
    requirement: "WEB-08"
    verification:
      - kind: e2e
        ref: "headless jsdom run: 15/15 checks (hero at /, filename + back link at /collections/linux.csv, 404 at an unknown path, encoded param decoded, back-link click changes the path and keeps the same <nav> DOM node)"
        status: pass
    human_judgment: false

# Metrics
duration: 22min
completed: 2026-09-27
status: complete
---

# Phase 3: Web Scaffold, Theme & API Client Summary

**A buildable Vite 8 + React 19 + TypeScript + Tailwind 4 + shadcn `web/` app carrying the v2 Editorial token layer, a system-aware light/dark theme, the three required routes inside a persistent shell, self-hosted Playfair Display + Inter, the `/api` dev proxy, and a typed relative-URL gallery API client.**

## Performance

- **Duration:** ~22 min
- **Completed:** 2026-09-27
- **Tasks:** 8
- **Files created:** 43 under `web/`; 1 modified outside (`.gitignore`)

## Scaffold Path Taken

**CLI path (the preferred one) — no fallback needed.**

The documented `pnpm dlx shadcn@latest init -t vite -n web -y --base-color neutral` cannot work as written: `--base-color` is not a v4 flag, so CLI 4.21.0 ignores it and prompts. Three prompts had to be answered by flag:

1. `Would you like to set up a monorepo?` → `--no-monorepo`
2. `Select a component library` → `-b radix`
3. `Which preset would you like to use?` → `-p nova`

Final invocation (from the repo root, stdin closed so any remaining prompt fails fast):

```bash
pnpm dlx shadcn@latest init -t vite -n web -y --no-monorepo -b radix -p nova -c "$PWD" </dev/null
```

Result: Vite 8.3.1, React 19.3.0, TypeScript 6.0.3, Tailwind 4.3.3, shadcn CLI 4.21.0, `components.json` with `style: "radix-nova"`, `baseColor: "neutral"`, `cssVariables: true`. The CLI creates a nested `web/.git`, which was removed so the app is tracked by the parent repository.

Primitives added in one non-interactive call: `button card input badge skeleton dialog popover sheet select separator tooltip` (10 created + `button` already present).

## Accomplishments

- **Token layer.** `src/index.css` declares the design-spec §2 palette as raw custom properties on `:root`/`.dark` (all 31 spec hexes appear verbatim in the built CSS), plus the six radii, five shadows, four signature gradients and six placeholder gradient pairs. A `@theme inline` block maps the palette, radii and fonts into Tailwind, so later phases write `bg-surface`, `text-ink`, `text-muted`, `border-border`, `text-accent`, `bg-accent-violet`, `rounded-pill`, `shadow-card`, `font-display` and `bg-grad-brand` and get the Editorial look for free.
- **shadcn inheritance.** `--background/--foreground/--card/--popover/--primary/--secondary/--muted-foreground/--border/--input/--ring/--radius` are all mapped onto the editorial palette, so the eleven `ui/*` primitives are on-brand with no per-component overrides.
- **Theme.** `ThemeProvider` + `useTheme` + `ThemeToggle` implement light/dark/system with `system` as the default, persistence under `tw-bookmarker-theme`, `dark`/`light` classes on `<html>`, `color-scheme`, and a media-query listener attached only in `system` mode. A pre-paint script in `index.html` applies the stored theme before React mounts, so a reload never flashes.
- **Shell + routing.** `AppShell` owns the §3.1 top navigation (brand mark on `--grad-brand`, `Twitter Bookmarker`, `Home`/`Collections`, theme toggle, decorative avatar) and the 1440/1312 page gutter. `createBrowserRouter` serves `/`, `/collections/:filename` and `*`, all nested under the shell.
- **API client.** `fetchCollections()` / `fetchPosts(filename, params)` call only relative `/api/gallery/...` URLs, URL-encode the filename, drop `undefined`/`null`/blank params, and surface the backend's `{status:"error",reason}` as `ApiError(reason, status)` (status `0` for a transport failure, carrying the PRD §61 "Could not connect to Twitter Bookmarker backend" copy).
- **Fonts.** Playfair Display 400/700 and variable Inter are bundled from `@fontsource` — 23 woff/woff2 assets in `dist/assets`, zero external font URLs.

## Task Commits

| # | Commit | Subject |
|---|--------|---------|
| 1 | `080a9e5` | `feat(03): scaffold web app with editorial theme, routing shell and typed API client` (44 files) |
| 2 | _(this file)_ | `docs(03): plan and summarize the web scaffold, theme and API client` |

## Files Created/Modified

- `.gitignore` — added `web/dist/` (the only change outside `web/`)
- `web/vite.config.ts` — `@` alias, `server.proxy['/api']` → `http://127.0.0.1:43121` (the only `43121` in `web/`)
- `web/index.html` — title, `color-scheme`, brand favicon, pre-paint theme script
- `web/components.json`, `web/package.json`, `web/pnpm-lock.yaml`, `web/pnpm-workspace.yaml`, `web/tsconfig*.json`, `web/eslint.config.js`, `web/.prettierrc`, `web/.prettierignore`, `web/README.md`
- `web/src/index.css` — the entire token system (light/dark raw vars, Tailwind mapping, shadcn semantics, gradient utilities, base layer)
- `web/src/app/theme-provider.tsx`, `theme-toggle.tsx`, `app-shell.tsx`, `routes.tsx`
- `web/src/hooks/use-theme.ts`, `hooks/index.ts`
- `web/src/lib/api/client.ts`, `errors.ts`, `index.ts`; `web/src/lib/utils.ts`
- `web/src/types/gallery.ts`, `types/index.ts`
- `web/src/pages/gallery-page.tsx`, `collection-page.tsx`, `not-found-page.tsx`
- `web/src/main.tsx`, `web/src/components/ui/*` (11 primitives), `web/public/favicon.svg`

## Decisions Made

1. **CLI flags over the documented incantation.** `--base-color` is not a v4 flag; `-b radix -p nova --no-monorepo` is the working equivalent. The result is still an official-CLI scaffold inside `web/`, which is what PRD §13 actually requires.
2. **Design tokens win the `--muted` / `--accent` / `--border` collision with shadcn.** The phase contract requires `text-muted`, `border-border` and the exact palette, so the design values own those names. shadcn's *neutral surface* usages (`bg-muted` on Skeleton/Card footer/Dialog footer/Button ghost/Badge, `focus:bg-accent` on Select) were redirected to `bg-surface-warm` in six primitives — which is exactly the role the design spec assigns to `--surface-warm` ("secondary buttons, pills"). `--muted-foreground` still resolves to the design muted, so shadcn's secondary text stays correct. Recorded in a comment in `index.css`.
3. **`--sh-*` indirection for shadows.** See "Issues Encountered" below — a literal `--shadow-nav` in `@theme` is inlined by Tailwind into `--tw-shadow`, which killed the dark-mode reduction.
4. **No setState-in-effect in the theme provider.** The OS preference is read during render and the change listener only bumps a reducer counter. This also fixes a genuine staleness bug: switching back to `system` after the OS changed while an explicit theme was active now resolves correctly.
5. **Deliberate UI omissions carried from the design spec.** The nav search field, `Explore`, and the mobile hamburger are not rendered (no endpoint / no route / no menu content — shipping them would be dead UI). Both nav links resolve to `/` exactly as spec §3.1 instructs, so the `Collections` link is a plain `Link to="/"` rather than a `NavLink` that would light up as active twice.
6. **Extra tokens beyond the strict list.** `--grad-ph-*` (the six §2.6 placeholder pairs) and `bg-grad-*` utilities are included so Phases 4–5 do not have to invent gradient plumbing; `--radius-3xl`/`--radius-4xl` alias `--r-2xl` and `Badge`'s `rounded-4xl` was changed to `rounded-pill`, so the radius set stays exactly the six spec values.
7. **`web/` keeps its own `pnpm-workspace.yaml`** (created by the CLI). It makes `web/` a standalone pnpm root; no root workspace file exists to absorb it, so `cd web && pnpm install` is fully self-contained as required.

## Deviations from Plan

| Planned | Actual | Why |
|---------|--------|-----|
| Use `--base-color neutral` | `-b radix -p nova` | Flag does not exist in CLI v4.21.0; documented in the summary and in `03-01-PLAN.md` |
| Add `web/src/lib/design.ts` for placeholders | Not added; only `--grad-ph-*` CSS vars | The deterministic hash picker is Phase 4 behaviour, not token plumbing |
| Two files for theming (`theme-provider.tsx`, `use-theme.ts`) | Same two files | Unchanged — verified no import cycle (hook imports the context; the provider never imports the hook) |
| `web/src/vite-env.d.ts` listed | Not created | Unnecessary: `tsconfig.app.json` already sets `"types": ["vite/client"]` |
| `web/src/App.tsx` listed | Deleted (template leftover) | `main.tsx` now mounts `RouterProvider`; a second app root would be dead code |
| `web/README.md`, `.prettierrc`, `.prettierignore`, `pnpm-workspace.yaml`, `eslint.config.js` | Committed as generated | Part of a faithful CLI scaffold; not hand-authored additions |

## Issues Encountered

1. **`@fontsource-variable/geist` broke the first build.** The Nova preset installs Geist and `index.css` imports it. Swapping to Playfair + Inter required removing the package and the import; the scaffold's baseline build fails until that is done.
2. **`--shadow-nav` in `@theme` was silently inlined.** Tailwind emitted `.shadow-nav{--tw-shadow:0 4px 20px var(--tw-shadow-color,#1714190f)}` — the light literal — so the `.dark` reduction of `--shadow-nav` never reached the utility. Fixed by feeding the theme a `var()` value (`--shadow-nav: var(--sh-nav)`) with the mode-swapped literals on `--sh-*`; the built utility is now `.shadow-nav{--tw-shadow:var(--sh-nav)}` and `.dark` flips it. This also preserves Tailwind's ring composition.
3. **Stray emit into `web/src`.** An early `tsc -p` invocation with a bad `rootDir` wrote compiled `client.js`/`errors.js`/`gallery.js`/`types/index.js` next to the sources. Removed before committing, and confirmed that `pnpm build` + `pnpm exec tsc --noEmit` leave `src/` free of `.js` files. The four files are **not** in the commit.
4. **Three ESLint errors on the first `pnpm lint`.** One real (`react-hooks/set-state-in-effect` in the provider — fixed by the render-time read described above), two upstream shadcn patterns (`button.tsx`/`badge.tsx` export their `cva` variants), silenced with the same `eslint-disable react-refresh/only-export-components` header the shadcn template itself uses. `pnpm lint` is now clean.
5. **`web/.git` nested repository.** The Vite/CLI scaffold initialises its own git repo; removed so the parent repository tracks `web/` as ordinary files.

## Verification Performed

All commands run from the repository root unless noted. Every check below was executed, not inferred.

| # | Check | Result |
|---|-------|--------|
| 1 | `cd web && pnpm install --frozen-lockfile` | exit 0 — "Lockfile is up to date, resolution step is skipped" (555 entries pass supply-chain policy) |
| 2 | `cd web && pnpm build` | exit 0 — `✓ built in 405ms`; `dist/index.html` 1537 B; CSS 52.40 kB; JS 360.87 kB; 23 font assets |
| 3 | `cd web && pnpm exec tsc --noEmit` | exit 0, no output |
| 4 | `cd web && pnpm lint` | exit 0, no output |
| 5 | `grep -rn '43121' web/src` | no matches |
| 6 | `grep -rn 'fonts.googleapis\|fonts.gstatic' web/ (ts/tsx/css/html)` | no matches |
| 7 | `grep -rn '43121' web/` (all source/config, minus node_modules) | exactly one hit: `web/vite.config.ts:21` |
| 8 | Palette present in built CSS | all 31 spec hexes found (`#f6efe7`, `#28212d`, `#fff6f0`, `#332a37`, `#ff8b7d`, `#b3a8ae`, …) |
| 9 | Theme behaviour (headless jsdom over the real bundle) | **17/17 pass** — default system light & dark, stored `dark` wins, full toggle cycle, persistence, live OS flip both directions, shell renders |
| 10 | Routing behaviour (headless jsdom over the real bundle) | **15/15 pass** — `/`, `/collections/linux.csv` (filename + back link), unknown path 404, encoded param decoded, back-link click changes path and keeps the same `<nav>` node |
| 11 | API client behaviour (compiled client + stubbed `fetch`) | **12/12 pass** — relative base, filename encoding, param omission, pagination defaults, 404/400 envelope reasons, non-JSON 500, transport failure status 0, malformed 200 |
| 12 | No process left running | `pgrep -af vite` / `pgrep -af 'pnpm dev'` → nothing; `ss -ltnp` → no node listeners. No server was ever started; the operator's 43121 backend was never touched |
| 13 | `git status --short` | only `.planning/phases/03-web-scaffold/` and `web/` from this phase; no `node_modules`, no `dist` |

## Exported Surface for Phases 4–8

**Theme**
- `@/app/theme-provider` → `ThemeProvider`, `THEME_STORAGE_KEY` (`"tw-bookmarker-theme"`), types `Theme` / `ResolvedTheme` / `ThemeProviderState`
- `@/hooks/use-theme` (also `@/hooks`) → `useTheme(): { theme, resolvedTheme, setTheme }`
- `@/app/theme-toggle` → `ThemeToggle` (already mounted in the shell; renders `data-theme-preference` / `data-theme-resolved`)

**Shell / routing**
- `@/app/app-shell` → `AppShell` (nav + `<Outlet/>`; do not restructure)
- `@/app/routes` → `router`; the table is exactly `/`, `/collections/:filename`, `*`
- `@/pages/gallery-page`, `@/pages/collection-page`, `@/pages/not-found-page` — replace the bodies of the first two

**API**
- `@/lib/api` → `fetchCollections(): Promise<GalleryCollection[]>`, `fetchPosts(filename, params?): Promise<GalleryPostsResponse>`, `ApiError`, `isApiError`, `GALLERY_API_BASE`
- `ApiError` members: `reason: string`, `status: number`, `isNetworkError` (status 0), `isNotFound` (status 404)
- `@/types` → `GalleryCollection`, `GalleryPost`, `GalleryCollectionListResponse`, `GalleryPostsResponse`, `GalleryPostsParams`, `GallerySort`, `GalleryErrorResponse`

**Token utilities** (all live against `:root`/`.dark`, so they re-theme automatically)
- Surfaces/text: `bg-bg`, `bg-surface`, `bg-surface-warm`, `text-ink`, `text-muted`, `border-border`, `text-accent`, `bg-accent`, `bg-accent-pink|violet|blue|gold|green`
- Radii: `rounded-sm` 12 · `rounded-md` 14 · `rounded-lg` 18 · `rounded-xl` 20 · `rounded-2xl` 24 · `rounded-pill` 999
- Shadows: `shadow-nav`, `shadow-card`, `shadow-post`, `shadow-popover`, `shadow-hero` (reduced under `.dark`)
- Fonts: `font-sans` (Inter Variable), `font-display` (Playfair Display; `h1–h4` already default to it)
- Gradients: `bg-grad-brand`, `bg-grad-hero`, `bg-grad-cta`, `bg-grad-night`; raw vars `--grad-ph-gold-blue|violet-pink|green-lime|plum-rose|teal-mint|sand-sage` for deterministic placeholders

**Primitives:** `@/components/ui/{button,card,input,badge,skeleton,dialog,popover,sheet,select,separator,tooltip}`. Note the one intentional deviation: these files use `bg-surface-warm` where upstream shadcn uses `bg-muted`/`bg-accent` as a neutral surface.

## User Setup Required

None. No `.env`, no external service. The dev proxy target is a compile-time literal in `vite.config.ts`.

## Next Phase Readiness

- Phase 4 (homepage) can build `GalleryPage`'s hero, section header, `CollectionCard` and `CollectionCover` using `fetchCollections()` and the token utilities with no scaffold changes.
- Phase 5 (collection gallery) has `fetchPosts(filename, params)`, the `GalleryPostsParams`/`GallerySort` types and the routed `CollectionPage` body slot.
- Phases 6–8 have `popover`/`sheet`/`select`/`dialog`/`skeleton` ready; `dropdown-menu`, `scroll-area` and a calendar/date picker are the only primitives still to add.

---
*Phase: 03-web-scaffold*
*Completed: 2026-09-27*
