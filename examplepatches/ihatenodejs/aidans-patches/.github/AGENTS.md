# Repository Guidelines

Scope: CI workflows, release/deploy automation, issue templates, and Bun/native generator scripts under `.github/`.

## Workflow Map

- `workflows/apk-lab-tests.yml`: installs locked root/Worker/site dependencies, runs format/lint/typecheck/tests, then the clean Gradle patch build gate.
- `workflows/apk-compatibility.yml`: builds `.mpp`/metadata, computes affected packages, reconciles private fixtures, runs real compatibility checks, and reports terminal status.
- `workflows/release.yml`: Java/Node release pipeline and semantic-release driven only by pushes to the protected `release/main` (stable) and `release/dev` (prerelease) branches, gated by paths to patch build inputs; site and Worker deploy handoffs trigger only for a published stable release from `release/main`.
- `workflows/deploy-worker.yml`: Worker typecheck/test and conditional Wrangler deployment; invoked by the `release/main` handoff with the post-release branch tip, or manually from `release/main`, and never from `main`/`dev` pushes.
- `workflows/deploy-site.yml`: icon check, tests, Astro check/build, and conditional Pages deployment; invoked by the `release/main` handoff with the post-release branch tip, or manually from `release/main`, and never from `main`/`dev` pushes.
- `workflows/promote-release.yml`: the only supported writer of a protected release branch. Manual `workflow_dispatch` merges `main` -> `release/main` or `dev` -> `release/dev` as the release app; the push triggers Release.
- `workflows/verify-release-identity.yml`: manual, non-publishing App-token and uncached Gradle build check from `main`.
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

The release branches are separate long-lived branches with their own protection: rulesets on `refs/heads/release/main` and `refs/heads/release/dev` must block deletion and non-fast-forward updates and permit updates only from the release identity. The release job pushes with a GitHub App installation token (`RELEASE_APP_ID`/`RELEASE_APP_PRIVATE_KEY`), and that app must be a bypass actor on both release-branch rulesets and on `Require verification gate` so the release-driven backmerge push to `dev` is accepted. GitHub also supports a deploy-key bypass, but that bypass applies to deploy keys collectively; using it instead requires changing the workflows. Keep the `main`/`dev` merge rules unchanged for human work; do not solve protection by lowering them.

All release-branch writes must come from `release.yml` or `promote-release.yml` using that app; no direct app-token pushes. Protection alone does not stop the bypass app from promoting while a release is publishing, so both workflows use a per-target concurrency group: `release-publication-${{ github.ref_name }}` in `release.yml` and `release-publication-${{ inputs.target }}` in `promote-release.yml`. Promotions and releases for the same release branch serialize, while `release/main` and `release/dev` do not starve each other. Concurrency serializes runs; it is not a git lock, and GitHub keeps at most one pending run per group (a newer pending run for the same target can replace an older pending one for that target).

## Release and Generated Assets

`.releaserc` owns the release sequence and configures non-application scopes (`site`, `worker`, `apk-lab`, etc.) with `release: false` so only patch changes trigger releases:

1. `./gradlew generatePatchesList` builds patch artifacts and metadata.
2. Release version is applied to `patches-list.json`.
3. The README generated patch block is refreshed.
4. Semantic release updates/commits `CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, and `README.md`.
5. The `.mpp` release asset is published/attested; stable releases from `release/main` hand off site and Worker deployments.

### Protected release branches

Only `release/main` (stable) and `release/dev` (prerelease channel `dev`, tags
`v*-dev.N`) publish. `main` and `dev` stay as integration branches with their
existing merge rules.

Operator setup, once per repository:

Before merging the release workflow change or creating the release branches,
disable the **Release**, **Deploy Website**, and **Deploy Worker** workflows in
GitHub Actions and wait for existing runs to finish. The old workflows can
publish or deploy on `main`/`dev` pushes, and creating a release branch can
trigger the new release workflow. Disabling a workflow does not cancel runs
already in progress. Merge the release workflow change to `dev` and `main`
before bootstrapping, so the promotion workflow exists on the default branch.

```bash
# Create the release branches from the current integration tips.
git branch release/main main
git branch release/dev dev
git push origin release/main release/dev
```

1. Create rulesets targeting `refs/heads/release/main` and
   `refs/heads/release/dev` with **Restrict updates**, **Restrict deletions**,
   and **Block force pushes** enabled. Leave the bypass list empty except for
   the release identity, so nobody else (including admins by default) can push.
2. Use a GitHub App as the release identity. Install the app on the repository
   and add it as a bypass actor on both release-branch rulesets. Also add it as
   a bypass actor on `Require verification gate` (and any other ruleset that
   would reject the backmerge push) so the release-driven backmerge to `dev`
   is accepted. GitHub also supports a collective deploy-key bypass, but these
   workflows do not use it. Keep `main`/`dev` protection intact.
3. Configure the `RELEASE_APP_ID` and `RELEASE_APP_PRIVATE_KEY` secrets and give
   the app `contents: write` and `workflows: write`. Workflow permission allows
   promotions and releases involving changed workflow files. The App token is
   used for GitHub release operations; `settings.gradle.kts` routes the separate
   Actions `GITHUB_TOKEN` from the shell-safe `RELEASE_MAVEN_TOKEN` environment
   variable to both plugin and dependency Maven repositories. The App token
   cannot read the external Morphe Maven registry. Verify the Actions token's
   registry access with an uncached build before cutover; a separate package
   credential may be necessary if it fails. Do not use dotted environment names
   for this handoff: POSIX shells can discard them.
   These workflows no longer use `RELEASE_DEPLOY_KEY`; retain the existing key
   until the chosen release identity is configured and verified.
4. Run **Verify Release Identity** from `main`. It requests the release App's
   permissions, checks the Morphe Maven artifact, and builds with a fresh Gradle
   cache without publishing. After checking branch protections and a successful
   verification run, re-enable the disabled workflows. Do not dispatch
   **Release** merely to test setup: it can publish.

If the promoted stable branch contains the Worker authority migration, a
published release can immediately deploy it. Prepare the Worker cutover
before promotion; see `worker/AGENTS.md`.

Publish only through the **Promote Release** workflow
(`.github/workflows/promote-release.yml`, `workflow_dispatch`): choose
`main` -> `release/main` for a stable release or `dev` -> `release/dev` for a
prerelease. It merges the source into the target as the release app and pushes
once; the push triggers Release, which derives the version, commits generated
assets, tags, publishes, and backmerges the matching release branch to `dev`
(the backmerge plugin routes `release/main` -> `dev` and `release/dev` ->
`dev`). Do not push to a release branch directly, do not trigger raw app-token
pushes, do not hand-commit release-generated files to `dev`/`main`, and do not
push tags manually. `release.yml` and `promote-release.yml` use the matching
`release-publication-<target>` concurrency group so a promotion to a release
branch cannot land while a release on that same branch is publishing; that is a
queue, not a lock.

The stable deploy handoff checks out `release/main` by branch name after the
release job completes, so it deploys the post-release branch tip (which contains
semantic-release's release commit with the generated `CHANGELOG.md`,
`patches-list.json`, and related files). Do not switch it to
`needs.release.outputs.new_release_git_tag`: the tag targets the pre-prepare
`gitHead`, not the release commit that is now the branch tip.

Rollback implications:

- Release tags and published assets are immutable. Revert the offending change
  on `dev`/`main`, then run Promote Release for the matching pair; the merge
  publishes a new version. Direct cherry-picks onto a release branch are not
  supported by the protected-branch flow.
- Never delete or move a release tag, force-push a release branch, or delete the
  branch. Protection rejects it, and `scripts/release-retry.ts` refuses to retry
  a moved tip.
- A Release that fails before tagging leaves the release branch at the last
  published commit. Retry only while the remote tip still equals the verified
  SHA; otherwise start a fresh run from the new tip. Recovery that must bypass
  protection (for example reconciling a channel note) has to use the release
  identity through a reviewed workflow, not a human push.

### Release revision invariant

Verification and publication use the same triggering SHA. Both jobs check out
`github.sha`, and `scripts/verify-release-revision.ts` fails the release job if
the remote branch tip moved after verification. Do not reintroduce
`git pull --ff-only` or any fast-forward to a newer tree. The guard rejects
movement that already happened before publication; it does not hold a lock over
the window between that read and the release push. That window is covered by
the protected release branches (only the release identity may update them) and
by the per-target `release-publication-<branch>` concurrency groups that
serialize release and promotion runs for that branch.
`scripts/release-retry.ts` re-runs failed jobs only while the branch tip still
equals the failed run's verified head; a moved or force-pushed branch needs a
fresh run.

The release job installs from `package-lock.json` with `npm ci --ignore-scripts`
and runs the locked local `semantic-release` through `scripts/run-release.ts`.
Do not restore the semantic-release action or request `@latest` plugins: that
would install a dependency graph npm did not verify. `bun.lock` remains the
canonical CI graph for Bun commands; update both locks together when a release
dependency changes.

The release job also points `core.hooksPath` at an empty directory before `semantic-release` runs. Its checkout installs root dependencies only, so the repository pre-push audit cannot execute there; the source commit is already covered by the verification gate, and the generated release commit is not a place to half-run the hook. Do not "fix" this by installing every workspace in the release job.

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
- A local semantic-release dry run is release-specific: `npm ci --ignore-scripts`, then `./node_modules/.bin/semantic-release --dry-run`. That still loads `.releaserc` (prepare/publish/success are skipped, but plugin conditions run). The side-effect-free `release.dryrun.config.mjs` is only selected in a repository with no `.releaserc` (a local config takes precedence over `--extends`); `scripts/release-dry-run.test.ts` proves it against a disposable temp repo with a bare local origin and `GITHUB_TOKEN` unset. Never publish/deploy as verification.
