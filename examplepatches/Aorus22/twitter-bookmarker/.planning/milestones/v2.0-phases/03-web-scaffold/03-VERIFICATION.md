---
phase: 03-web-scaffold
verified: 2026-09-27T15:20:00Z
status: passed
score: 8/8 requirements verified
behavior_unverified: 1
verifier: orchestrator (independent re-run)
---

# Phase 3: Web Scaffold, Theme & API Client — Verification Report

**Phase Goal:** The `web/` app is created with the official shadcn Vite CLI, wired with routing, the v2 Editorial design tokens, light/dark/system theme, the Vite `/api` proxy, and a typed relative-URL API client.

**Verified:** 2026-09-27
**Status:** passed
**Method:** independent orchestrator re-run. The orchestrator re-ran the build and typecheck itself, inspected every contract file by reading it, and verified the **built artifacts** (CSS + JS + `index.html`) rather than trusting source-code claims. The executing agent's headless behavioural harnesses are noted below and are *not* counted as independent evidence.

## Goal Achievement

| # | Requirement | Status | Evidence |
|---|-------------|--------|----------|
| WEB-01 | Created with the official shadcn Vite CLI, not a hand-written config | ✓ VERIFIED | CLI path used, no fallback. `pnpm dlx shadcn@latest init -t vite -n web -y --no-monorepo -b radix -p nova -c "$PWD" </dev/null`; committed `web/components.json` (`style: radix-nova`, `baseColor: neutral`, `cssVariables: true`), shadcn CLI 4.21.0. The documented `--base-color` is not a v4 flag — the agent identified the real flags and closed stdin so a prompt could not hang |
| WEB-02 | Vite + React + TypeScript, `pnpm build` → `web/dist` | ✓ VERIFIED | Orchestrator re-ran `pnpm build`: exit 0, `✓ built in 373ms`, `dist/index.html` + 15 woff2 + hashed JS/CSS emitted. `pnpm exec tsc --noEmit` exit 0, no output. Vite 8.3.1 / React 19.3.0 / TS 6.0.3 / Tailwind 4.3.3 |
| WEB-03 | Routes `/`, `/collections/:filename`, not-found fallback | ✓ VERIFIED | `web/src/app/routes.tsx` — `createBrowserRouter` with `index → GalleryPage`, `collections/:filename → CollectionPage`, `* → NotFoundPage`, all inside a persistent `AppShell` |
| WEB-04 | Typed client uses relative `/api/gallery/…` only, no backend port | ✓ VERIFIED | `GALLERY_API_BASE = "/api/gallery"`; `encodeURIComponent(filename)`; `grep -rn 43121 web/src` → **no matches**; built JS + `index.html` contain **no** `localhost:*`, `127.0.0.1:*`, or `:43121` |
| WEB-05 | `vite.config.ts` proxies `/api` → `127.0.0.1:43121` | ✓ VERIFIED | The single permitted occurrence: `web/vite.config.ts:21` `target: "http://127.0.0.1:43121"`. A repo-wide grep outside `node_modules/`, `dist/` finds exactly this one hit |
| WEB-06 | light/dark/**system** default + visible toggle | ✓ VERIFIED (code) | `ThemeProvider` default `"system"`, persists to `localStorage["tw-bookmarker-theme"]`, `prefers-color-scheme` listener attached **only** in system mode, `useLayoutEffect` toggles `.dark`/`.light` on `document.documentElement` before paint, `ThemeToggle` mounted in the shell |
| WEB-07 | Figma v2 tokens as CSS vars / Tailwind tokens incl. dark set | ✓ VERIFIED | All 24 spec palette values present in `web/src/index.css` (checked individually — zero missing); the **built** CSS contains all token utilities (`.text-ink`, `.text-muted`, `.border-border`, `.bg-surface`, `.bg-surface-warm`, `.rounded-pill`, `.bg-grad-brand`, `.font-display`, `.shadow-nav`); dark set verified in the built artifact, including the shadow reduction (`.dark{…--sh-nav:0 2px 12px #0000004d;…}`) |
| WEB-08 | Shared layout chrome used by both routes | ✓ VERIFIED | `AppShell` provides nav + page background + typographic scale and renders `<Outlet/>`, so chrome persists across client-side navigation |

### Additional checks

| Check | Result |
|-------|--------|
| Fonts self-hosted, no CDN | ✓ `@fontsource/playfair-display` + `@fontsource-variable/inter` imported in `index.css`; 15 woff2 + woff assets emitted into `dist/assets`; zero `fonts.googleapis`/`fonts.gstatic` matches anywhere in `web/` |
| `web/dist/` gitignored | ✓ `.gitignore:9` |
| Lockfile + manifest committed, `node_modules` not | ✓ `web/package.json`, `web/pnpm-lock.yaml` tracked; `git ls-files web \| grep -c node_modules` → 0 |
| Nested `web/.git` from the CLI removed | ✓ parent repo tracks `web/` as plain files |
| Footprint discipline | ✓ only `web/**` plus one `.gitignore` line; `backend/`, `extension/`, root `Makefile` untouched |
| No stray processes / no interference with the operator's server | ✓ `pgrep -af 'vite\|pnpm dev'` → none of the agent's; port 43121 still the operator's `twitter-bookmar` process, never stopped |
| `pnpm lint` | ✓ exit 0, no output |

### Gates

| Gate | Result |
|------|--------|
| `cd web && pnpm build` | ✓ exit 0 |
| `cd web && pnpm exec tsc --noEmit` | ⚠️ VACUOUS — see note below. The real type gate was `pnpm build` (`tsc -b`), which passed |
| `cd web && pnpm lint` | ✓ clean |

> **Correction (added during Phase 6 verification).** `web/tsconfig.json` is solution-style (`"files": []` plus `references`), so `tsc --noEmit` resolved **zero** source files — `tsc --noEmit --listFiles` reported 0 `src/` files, while `tsc -b --listFiles` reports 101. This row was therefore meaningless. It does not change this phase's conclusion: `pnpm build` runs `tsc -b && vite build` and was run and passed here, and `tsc -b` is a genuine typecheck. The `typecheck` script was corrected to `tsc -b` in commit `c68977e`.
| `grep -rn 43121 web/src` | ✓ no matches |
| Google Fonts CDN references | ✓ none |

### Requirement coverage

`WEB-01 … WEB-08` — 8/8 verified.

## Residual Risk (why `behavior_unverified: 1`)

WEB-06's *rendered* behaviour — the toggle actually adding the class on `<html>` in a live DOM, and OS-preference flips propagating — was exercised only by the executing agent's throwaway jsdom harness (reported 17/17 theme checks, 15/15 routing checks, 12/12 API-client checks), which was **not committed** and therefore is **not reproducible from the repo**. The orchestrator independently verified the code path, the built CSS/JS artifacts, and the build/typecheck gates, but could not independently reproduce the DOM run: this environment has no browser, and the Playwright browser cache is empty.

This is an accepted residual rather than a gap: Phase 10 (PRD §81/§82) is explicitly scoped to exercise the rendered app — theme, routing, responsive behaviour, and the interaction steps — at the browser level. Phase 10 must therefore either add a committed, reproducible browser test or document the manual steps precisely. It should NOT lean on Phase 3's uncommitted harness.

## Deviation Log

| Deviation | Assessment |
|-----------|------------|
| `--base-color` is not a v4 shadcn flag; used `-b radix -p nova --no-monorepo` | Accepted — still an official-CLI scaffold, which is what WEB-01/PRD §13 require |
| Design palette wins the `--muted` / `--accent` / `--border` names over shadcn's neutral meanings; six primitives patched from `bg-muted`/`bg-accent` to `bg-surface-warm` | Accepted and documented in `index.css`. **Fragile:** a later `shadcn add` will reintroduce `bg-muted` surfaces — Phases 6–8 must re-check any newly added primitive |
| `--sh-*` indirection so `.dark` can reduce shadows | Accepted — a literal `--shadow-*` in `@theme` is inlined by Tailwind and silently breaks the dark reduction. Must not be "simplified" away |
| Theme provider reads `prefers-color-scheme` during render; listener only bumps a counter | Accepted — avoids a setState-in-effect cascade and fixes staleness on return to `system` |
| No-flash pre-paint script in `index.html` duplicates the storage-key literal | Accepted — commented as needing to stay in sync with `THEME_STORAGE_KEY` |
| Nav search field, `Explore`, and mobile hamburger deliberately not rendered | Accepted — design spec §3.1/§7: there is no endpoint, route, or menu content, so they would be dead UI |
| Extra `--grad-ph-*` placeholder pairs exposed as CSS vars only; the deterministic hash picker is left to Phase 4 | Accepted — correct scope split |
| `web/` carries its own `pnpm-workspace.yaml` (CLI-created) | Accepted, but noted for Phase 9: adding a root `pnpm-workspace.yaml` would absorb `web/` |

## Conclusion

Phase 3 is complete and verified: `web/` is an official-CLI shadcn Vite scaffold that builds and typechecks cleanly, carries the full v2 Editorial token layer including the dark set, routes both required paths inside a persistent shell, and exposes a typed relative-URL API client with no backend address leakage. Cleared to proceed to Phase 4 (Gallery Homepage).
