# Repository Guidelines

Scope: CI workflows, release/deploy automation, issue templates, and Python generator scripts under `.github/`.

## Workflow Map

- `workflows/apk-lab-tests.yml`: installs locked root/Worker/site/Python dependencies, runs format/lint/typecheck/tests, then the clean Gradle patch build gate.
- `workflows/apk-compatibility.yml`: builds `.mpp`/metadata, computes affected packages, reconciles private fixtures, runs real compatibility checks, and reports terminal status.
- `workflows/release.yml`: Java/Node release pipeline and semantic-release, gated by paths to patch build inputs; site and Worker deploy handoffs trigger only on published releases.
- `workflows/deploy-worker.yml`: Worker typecheck/test and conditional Wrangler deployment.
- `workflows/deploy-site.yml`: icon check, tests, Astro check/build, and conditional Pages deployment.
- `workflows/sync-app-icons.yml`: scheduled/manual icon synchronization in a PR targeting `dev`.
- `workflows/google-play-metadata.yml`: scheduled or manual authenticated Google Play metadata enrichment via the Rust `play-metadata` tool.
- `workflows/open_pull_request.yml`: automatic `dev` → `main` PR creation on pushes to `dev`; manual `workflow_dispatch` uses the selected workflow ref as the source branch.

Use pinned actions and least-privilege `permissions`. Preserve path filters and release handoffs when moving generated inputs; they determine whether metadata reaches Worker/site.

## Generator Scripts

- `scripts/generate_patches_readme.py`: rewrites the README block between `PATCHES_START` and `PATCHES_END` from `patches-list.json`, and updates any matching template repository or add-source URLs elsewhere in `README.md`.
- `scripts/sync_app_icons.py`: check or synchronize `site/public/icons/<package>.png` from patch metadata/Play images.
- `scripts/prepare_emoji_font.py`: downloads a pinned source, verifies SHA-256, transforms/checks the font, and writes a generated build resource/cache.

## Dependency Automation (Dependabot)

`.github/dependabot.yml` configures monthly dependency update checks targeting the `dev` branch with empty labels across three ecosystems:

- `github-actions`: workflow actions.
- `npm`: root and workspace dependencies; intentionally ignores `conventional-changelog-conventionalcommits` to preserve custom changelog release rules.
- `gradle`: Gradle wrapper and plugin dependencies.

Repository-wide dependency checks via `scripts/deps.ts` enforce the same hold in `dependency-policy.json`. When modifying dependency holds, keep Dependabot ignores and `dependency-policy.json` aligned so external automation does not open PRs for held packages.
Python scripts follow Ruff formatting/lint rules, validate paths/input shape, fail with actionable errors, and must not print secret values.

## Release and Generated Assets

`.releaserc` owns the release sequence and configures non-application scopes (`site`, `worker`, `apk-lab`, etc.) with `release: false` so only patch changes trigger releases:

1. `./gradlew generatePatchesList` builds patch artifacts and metadata.
2. Release version is applied to `patches-list.json`.
3. The README generated patch block is refreshed.
4. Semantic release updates/commits `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, and `README.md`.
5. The `.mpp` release asset is published/attested; main releases hand off site and Worker deployments.

Do not hand-edit release-generated files to simulate a release. Do not run release, deployment, fixture mutation, PR creation, or secret/binding changes unless explicitly requested.

## Secrets and Cloud Boundaries

- Reference secret names only; never log values or copy them into fixtures/config.
- Keep private R2 fixtures and APK artifacts outside commits.
- Compatibility callbacks must report terminal failure without leaking credentials; preserve retry/idempotency behavior.
- Cloudflare account/binding changes are infrastructure mutations, not test setup.

## Verification

- For workflow YAML, verify syntax, action inputs, permissions, path filters, job dependencies, and the exact local command each step wraps.
- To test workflows locally with `act`, point `DOCKER_HOST` to the active daemon socket (e.g. `unix://${HOME}/.orbstack/run/docker.sock` for OrbStack), target the workflow via `-W`, and use `-P ubuntu-latest=catthehacker/ubuntu:act-latest` (pass `-n` for dry-run simulation of step resolution and action cloning). Note that dynamic outputs in chained matrix jobs (`fromJson(needs...outputs)`) require upstream execution.
- For generators, run targeted tests/check-only modes and inspect output boundaries. Use temporary inputs for mutation tests.
- Run `bun run format:check`, `bun run lint`, and the affected root phase; finish code changes with `bun run audit`.
- A local semantic-release dry run is release-specific and may install/update dependencies: `npm install && npx semantic-release --dry-run`. Never publish/deploy as verification.
