# Repository Guidelines

Scope: CI workflows, release/deploy automation, issue templates, and Bun/native generator scripts under `.github/`.

## Workflow Map

- `workflows/apk-lab-tests.yml`: installs locked root/Worker/site dependencies, runs format/lint/typecheck/tests, then the clean Gradle patch build gate.
- `workflows/apk-compatibility.yml`: builds `.mpp`/metadata, computes affected packages, reconciles private fixtures, runs real compatibility checks, and reports terminal status.
- `workflows/release.yml`: Java/Node release pipeline and semantic-release, gated by paths to patch build inputs; site and Worker deploy handoffs trigger only on published releases.
- `workflows/deploy-worker.yml`: Worker typecheck/test and conditional Wrangler deployment.
- `workflows/deploy-site.yml`: icon check, tests, Astro check/build, and conditional Pages deployment.
- `workflows/sync-app-icons.yml`: scheduled/manual icon synchronization in a PR targeting `dev`.
- `workflows/google-play-metadata.yml`: scheduled or manual authenticated Google Play metadata enrichment via the Rust `play-metadata` tool.
- `workflows/open_pull_request.yml`: automatic `dev` → `main` PR creation on pushes to `dev`; manual `workflow_dispatch` uses the selected workflow ref as the source branch.

Use pinned actions and least-privilege `permissions`. Preserve path filters and release handoffs when moving generated inputs; they determine whether metadata reaches Worker/site.

In `workflows/apk-lab-tests.yml`, the `core` filter covers dependency policy, `scripts/**`, `.github/**` (every workflow, template, and Dependabot config), `.agents/**` (skills), `skills-lock.json`, `.editorconfig`, and `.gitattributes`; any core hit forces a full run of every domain job. The `docs` filter covers `docs/**`, root `*.md`, and `.markdownlint-cli2.jsonc` and routes docs-only changes to `Web Verification` (markdown lint and documentation tests). `Test & Build Gate` fails when no domain job executed.

## Generator Scripts

- `../scripts/generate-patches-readme.ts`: generates the README patch block and template repository/add-source URLs using Bun and installed Prettier. Rejects malformed boundaries and formats before publishing; release callers use this entrypoint.
- `../scripts/asset-prep.ts`: bootstraps the native `tools/asset-prep` host binary for icon checks/synchronization; no Pillow runtime. Preserve offline discovery exit/output semantics and pixel-equal existing-file no-ops.
- `tools/asset-prep` (`font`, `ocr`, `pdfbox`): Gradle builds the host tool with declared Cargo/source inputs and prepares pinned resources in the original paths/caches. Release font cache identities include Rust sources/lockfile and upstream identity.

## Dependency Automation (Dependabot)

`.github/dependabot.yml` configures monthly dependency update checks targeting the `dev` branch with empty labels across three ecosystems:

- `github-actions`: workflow actions.
- `npm`: root and workspace dependencies; intentionally ignores `conventional-changelog-conventionalcommits` to preserve custom changelog release rules.
- `gradle`: Gradle wrapper and plugin dependencies.

Repository-wide dependency checks via `scripts/deps.ts` enforce the same hold in `dependency-policy.json`. When modifying dependency holds, keep Dependabot ignores and `dependency-policy.json` aligned so external automation does not open PRs for held packages.

Generator and automation code is Bun/TypeScript or native Rust. Validate paths and input shape, fail with actionable errors, and never print secret values. Do not introduce a Python runtime, package manager, hook framework, or interpreter requirement.

## Required Status Checks

Repository ruleset `Require verification gate` (branch target, active) requires the aggregate `Test & Build Gate` GitHub Actions check on `main` and `dev`; the `Lock main`/`Lock dev` rulesets keep blocking deletions and non-fast-forward pushes. `strict_required_status_checks_policy` is off, so branches need not be up to date before merge. This setting lives in repository settings, not in workflow files: the workflow must keep the exact job name `Test & Build Gate`, or the requirement silently stops matching. The gate fails when a run has no executed domain job (docs-only changes must still run `Web Verification`), so it cannot pass on an unverified change.

## Release and Generated Assets

`.releaserc` owns the release sequence and configures non-application scopes (`site`, `worker`, `apk-lab`, etc.) with `release: false` so only patch changes trigger releases:

1. `./gradlew generatePatchesList` builds patch artifacts and metadata.
2. Release version is applied to `patches-list.json`.
3. The README generated patch block is refreshed.
4. Semantic release updates/commits `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, and `README.md`.
5. The `.mpp` release asset is published/attested; main releases hand off site and Worker deployments.

Release branch pushes authenticate with the write deploy key stored as `RELEASE_DEPLOY_KEY`; that key is the bypass actor on the `Require verification gate` ruleset. A release commit is created locally, so it can never carry the `Test & Build Gate` check before it is pushed, and the ruleset would otherwise reject both `@semantic-release/git` and the backmerge. `release.yml` rewrites `origin` to the SSH URL before semantic-release runs; keep it that way.

### Release state invariant

semantic-release records each release's channel in a git note on the tag commit
(`refs/notes/semantic-release-<tag>`). A prerelease branch only counts a tag as
the last release when that note carries the branch channel; a missing note makes
every later run recompute the same version and fail on the existing tag.

`workflows/release.yml` runs `scripts/reconcile-release-notes.ts` before
semantic-release. It only fills missing notes on semantic-release tags merged
into the current branch; it never rewrites existing notes, deletes tags, or
pushes branches. Manual recovery for the same state:

```bash
git notes --ref=semantic-release-vX.Y.Z-dev.N add -f -m '{"channels":["dev"]}' vX.Y.Z-dev.N
git push origin refs/notes/semantic-release-vX.Y.Z-dev.N
```

Do not rerun a failed release that reports `tag already exists` before
reconciling its note, and do not delete a tag unless you intend to re-cut that
version.

Do not hand-edit release-generated files to simulate a release. Do not run release, deployment, fixture mutation, PR creation, or secret/binding changes unless explicitly requested.

## Secrets and Cloud Boundaries

- Reference secret names only; never log values or copy them into fixtures/config.
- Keep private R2 fixtures and APK artifacts outside commits.
- Compatibility callbacks must report terminal failure without leaking credentials; preserve retry/idempotency behavior.
- Cloudflare account/binding changes are infrastructure mutations, not test setup.

## Verification

- For workflow YAML, verify syntax, action inputs, permissions, path filters, job dependencies, and the exact local command each step wraps.
- To test workflows locally with `act`, point `DOCKER_HOST` to the active daemon socket (e.g. `unix://${HOME}/.orbstack/run/docker.sock` for OrbStack), target the workflow via `-W`, and use `-P ubuntu-latest=catthehacker/ubuntu:act-latest` (pass `-n` for dry-run simulation of step resolution and action cloning). The `act` image must expose `node` and `cmake` on `PATH`; GitHub's `ubuntu-latest` provides both, but a minimal act image may need a derived image. Note that dynamic outputs in chained matrix jobs (`fromJson(needs...outputs)`) require upstream execution.
- For generators, run targeted tests/check-only modes and inspect output boundaries. Use temporary inputs for mutation tests.
- Run `bun run format:check`, `bun run lint`, and the affected root phase; finish code changes with `bun run audit`.
- A local semantic-release dry run is release-specific and may install/update dependencies: `npm install && npx semantic-release --dry-run`. Never publish/deploy as verification.
