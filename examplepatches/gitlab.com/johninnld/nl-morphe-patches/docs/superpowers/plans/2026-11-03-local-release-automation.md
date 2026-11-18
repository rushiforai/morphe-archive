# Local verification and automated GitLab releases

User-approved direction: run build, tests and releases on this Mac; preserve shared-runner minutes; automate main/dev publication; clean isolated builds after verified release; maintain both channel templates in AGENTS.md. This is separate from the unfinished native-warning feature branch.

## Requirements

- Use the complete existing verification command set locally, including Node release checks, Python, all workflow Gradle components, Medium checks and strict bilingual site checks. Keep one shared command implementation for local automation and optional cloud CI.
- No automatic shared-runner jobs on branch/MR/main/dev pushes. Retain an explicitly opt-in web fallback; do not silently claim a skipped pipeline passed.
- `main` is stable; `dev` uses the existing dev prerelease channel. `.releaserc` remains the single version/notes/generated-file authority.
- Preserve johninnl Git metadata, johninnld GitLab authority, existing Morphe signature and public download verification. Never log credentials. The user's later request restores Codeberg and GitGud as parallel release mirrors, with separate credentials and identical signed bytes.
- Automatically watch approved main/dev branch changes on the local Mac. Never publish feature branches. Use isolated owned build checkouts, serialized execution and exact remote-head checks. Initial watcher startup baselines current already-existing heads; explicit one-shot runs can preview/publish separately.
- Archive compact release logs/receipts, then clean owned workspaces after every successful or failed terminal job. Unproved quiescence or cleanup is a failure with `cleanupRequired`; preserve pending ownership evidence, reusable input caches and the primary working repository.
- Do not publish the unfinished native-warning branch or create a new stable release as an implementation test.

## Implementation units

### A. Shared full verification and opt-in cloud fallback

Goal: one reusable verification implementation, zero automatic cloud minutes.
Files: `.gitlab-ci.yml`, `scripts/local-release/verify.cjs`, `tests/test_local_verify.cjs`, relevant assertions in `tests/test_gitlab.cjs`.
Approach: export a command plan and execution function; honor explicit Python executable/Gradle offline option. Keep every old verification stage. Provide CLI command `node scripts/local-release/verify.cjs`; local executor passes working directory/environment, writes logs externally. Make cloud workflow require explicit web invocation and `RUN_CLOUD_CI=true`; cloud job calls the same verifier after its existing Linux bootstrap. Existing release+Pages fallback stays opt-in behind the unchanged branch/protection gates.
Test scenarios: complete task list retained; main/dev/MR pushes never select automatic cloud workflow; explicit web fallback allowed; command failure stops subsequent stages; Python/env selection; no device use.
Execution note: characterize existing pipeline command set, then test the new planner and failure boundary.
Verification: Node unit tests and full local invocation in an isolated checkout.

### B. Existing publisher local/preview entry point

Goal: reuse the existing signed GitLab publisher safely outside hosted CI.
Files: `.gitlab/scripts/publish_release.cjs`, `tests/test_gitlab_publish.cjs`.
Approach: export a testable main/run entry. Add explicit `--local` and `--dry-run` flags; local selects semantic-release `ci:false`; preview selects `dryRun:true` and never runs tagged-release recovery/publication. Verify current remote head before publishing. Keep channel, identity, signature and public-discovery guards. CLI writes the existing `build/release-safety/gitlab-result.json` receipt.
Test scenarios: main/dev accepted; feature branch refused before publication; stale remote refused; dry-run with/without a selected version never invokes recovery/publish; actual local mode preserves normal recovery.
Execution note: test-first around dry-run/recovery, no real publication.
Verification: existing GitLab publisher tests plus new local/preview cases.

### C. Serialized local release driver and watcher

Goal: build/test/publish approved new main/dev heads automatically, using isolated workspaces.
Files: `scripts/local-release/flow.cjs`, `scripts/local-release/templates.json`, `tests/test_local_release.cjs`.
Approach: templates name only main/dev and map to existing semantic-release branches. Use a private local state/bare cache and task-owned worktrees; validate exact source identity/remote head. Resolve secrets from private environment/config paths without output. Run A verifier, B publisher and existing public discovery check. Retain a receipt outside the build. Archive compact diagnostics and clean owned worktrees on every terminal outcome; keep failed-head retry state, not finished failed build storage. Watch once baselines existing remote heads on first install and processes later new heads; support explicit preview/one-shot commands.
Test scenarios: real temporary Git repository integration; main/dev selection; lock/concurrent invocation; new head vs baseline; stale head; verifier/publication/discovery failures; cleanup on every terminal outcome; detached-process and open-handle guards; successful cleanup cannot remove primary or arbitrary paths; no real external release.
Execution note: test-first for channel/state/cleanup boundaries, dependency-injected subprocess/network for publication tests.
Verification: Node unit/integration tests and actual local full verification; remote preview only if all signing/auth prerequisites are established.

### D. macOS automation installation and maintained documentation

Goal: automatic local operation and durable channel instructions.
Files: `scripts/local-release/install.cjs`, `tests/test_local_release_install.cjs`, `AGENTS.md`, `PUBLISHING.md`.
Approach: create a user LaunchAgent with fixed private state path, concurrency one and periodic one-shot watcher. Install from reviewed scripts after checks; keep initial known remote heads baselined so installation does not publish existing work. Document both main/dev templates from C and update them together. Use the existing signing identity; credentials remain private. Explain optional Docker/Linux checks and opt-in cloud fallback without making them mandatory.
Test scenarios: generated plist/config paths; no embedded secrets; branch templates agree with `.releaserc` and AGENTS; installation dry-run; job state/command verified live without publishing unfinished app changes.
Verification: plist lint, Node tests, launchd readback and a baseline-only watcher run; GitLab branch/MR readback; no automatic cloud runner started.

## Delivery

### F. Production Pages on each main release/update

Goal: retain the previous GitHub-style automatic website update while all compute stays local.
Files: `scripts/local-release/pages.cjs`, `pages-job.cjs`, Pages runner setup helper/tests, `.gitlab-ci.yml`; parent integrates post-publication hook/config/docs.
Approach: GitLab Pages accepts deployments through a Pages job rather than a direct site-upload API. Use a project-scoped, tagged, protected macOS shell runner only for the small Pages job. Local build/test/release remains in the independent watcher. After canonical publication, trigger an API pipeline on the exact current main SHA with `RUN_LOCAL_PAGES=true`; only that tagged job may run, never hosted verify/release jobs. Build the site from its own approved source checkout after generated release metadata is committed. Check expected SHA/version and public deployment marker. Run Pages alongside required mirror completion, account for both even if one fails. Main no-release documentation updates may also deploy; dev never changes production Pages.
Test scenarios: only protected main + API flag selects local Pages job; cloud jobs excluded; expected-SHA mismatch refuses deployment; generated site stamp matches release/version; trigger/status/failure/cancel flow; no token in job variables; cleanup unique runner workspaces after terminal jobs, preserve active jobs; project runner/tag ownership verified. No actual release creation in tests.
Execution note: inject transport/subprocess for tests, confirm live local runner assignment and published site only after approved source delivery.
Verification: unit/config tests, actual project-runner readback and main site deployment; no shared-runner job starts.

### E. Parallel Codeberg and GitGud mirrors (latest user steering)

Goal: publish one canonical signed release to both requested mirrors in parallel, without competing version/commit generation.
Files: `scripts/local-release/mirrors.cjs`, `tests/test_local_release_mirrors.cjs`, shared verifier test list; parent integrates flow/preflight/config/docs.
Approach: GitLab remains canonical source/version authority. Reuse the locally produced signed MPP and canonical branch/tag commit. Authenticate each destination using only its own token, require the expected owner/project, and preflight before publication. Sync branch/tag without force or rewriting metadata; refuse conflicts. Use Codeberg release/assets and GitGud generic-package/release APIs. Run both mirrors with all-settled parallel behavior; verify public download hashes/signatures. Persist per-target outcomes so one failed mirror does not hide the other success; cleanup waits for every required mirror. Retrying must be idempotent. Do not rewrite per-forge source manifests or select versions independently.
Test scenarios: parallel start; one target failure still accounts for the other; auth host isolation; identical signed bytes; existing identical asset/release is a no-op; conflicting tag/asset is refused; feature/channel rejection; no actual release in tests.
Execution note: tests with injected API/Git/asset transport; no external writes while implementing.
Verification: Node tests and read-only live credential/remote preflight, then parent integration and recovery tests.

- [x] A shared verification/cloud fallback
- [x] B local/preview publisher
- [x] C local driver/watcher and cleanup
- [x] D LaunchAgent/docs/channel templates implementation
- [x] E Parallel Codeberg/GitGud mirrors implementation and read-only preflight
- [x] F Local project-runner Pages implementation and runner registration
- [ ] Full checks, independent review, identity checks, delivery to main/dev automation scope

This checklist records implementation readiness before delivery. Final source-SHA verification, watcher activation, public Pages and owned-storage cleanup receipts belong in the private state directory documented in `PUBLISHING.md`. Dev retains its own app source; its site settings receive only the GitLab URL/configuration support needed by the shared verifier.

Unapproved native app changes remain in draft MR !1. Stable app promotion still requires the existing user confirmation.
