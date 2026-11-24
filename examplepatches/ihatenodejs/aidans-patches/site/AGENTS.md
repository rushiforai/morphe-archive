# Repository Guidelines

Scope: the static Astro site under `site/`.

## Architecture & Data Flow

- `src/pages/`: route entrypoints (`index.astro`, patch listing, status).
- `src/layouts/`, `src/components/`, `src/styles/`: presentation and shared UI.
- `src/data/repo.ts`: assembles root patch metadata, bundle/changelog data, icons, and compatibility models for pages.
- `src/data/changelog.ts`, `status.ts`, `commit-apps.ts`, `source-links.ts`: focused parsing/mapping helpers.
- `test/*.test.ts`: deterministic data-layer tests.
- `functions/api/`: Pages function surface, separate from Astro build-time code.
- `public/`: committed static assets and generated app icon outputs.

The site builds statically. Root `patches-list.json` is the current patch inventory; optional `patches-bundle.json` and `CHANGELOG.md` provide release context. Compatibility data is fetched/rendered through the status data path. Keep build-time data transformations separate from Astro rendering.

## Runtime & Commands

Use Bun:

```bash
bun install --frozen-lockfile --cwd site
bun run --cwd site dev
bun run --cwd site test
bun run --cwd site check
bun run --cwd site check:icons
bun run --cwd site build
bun run --cwd site preview
```

`check` runs `astro check`; `test` uses Bun's test runner with Node test APIs in existing data tests. A live GitHub release test is opt-in through `RUN_LIVE_GITHUB_RELEASE_TESTS=1`; normal tests must remain offline.

## Code Patterns

- Keep data modules deterministic and strongly typed. Parse and normalize external/generated inputs once, then pass stable view models to pages/components.
- Escape or reject external text/URLs before HTML/SVG output. Preserve safe workflow-link and changelog parsing behavior.
- Prefer pure helpers for release/changelog/status logic and test consumer-visible boundaries, fallback order, prerelease behavior, and malformed inputs.
- Keep Astro components focused on layout/rendering; avoid duplicating metadata parsing in components.
- Follow Prettier output and existing Tailwind/theme variables. Reuse components/styles rather than adding a second visual convention.
- Preserve canonical app-scope mapping in `src/data/commit-apps.ts`; root Conventional Commit scopes and release-note icon resolution depend on it.

## Generated and Source Boundaries

- Edit `src/` and intentional assets in `public/`.
- Never edit `dist/`, `.astro/`, or `node_modules/`; they are generated/ignored.
- `public/icons/<package>.png` is synchronized by the native `asset-prep icons` command through `bun scripts/asset-prep.ts` from the repository root. `bun run --cwd site check:icons` bootstraps the host tool and performs offline discovery; mutating modes are only for intentional refreshes. Equal decoded pixels preserve existing PNG bytes/mtime.
- Do not copy package versions or patch lists into site code when they can be derived from root metadata.
- `deploy-site.yml` owns CI build/deployment. Do not invoke a production Pages deployment for routine verification.

## Testing & QA

```bash
bun run --cwd site test
bun run --cwd site check
bun run --cwd site check:icons
bun run --cwd site build
```

For UI changes, run `bun run --cwd site dev` or `preview` and inspect the actual affected desktop/mobile surface, links, loading/error/empty states, and theme contrast. Data changes need focused tests in `test/*.test.ts`; avoid source-text assertions and duplicate tests of framework wiring. Finish cross-stack code changes with root `bun run audit`.
