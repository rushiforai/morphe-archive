# Local CI and publishing

The enforceable rules are in [AGENTS.md](AGENTS.md). This file contains the setup, channel procedures, private-file inventory, deployment and cleanup details. Update both files and both channel templates together.

## What runs locally

A user LaunchAgent periodically invokes the local release watcher. The first successful invocation baselines the existing `main` head without publishing historical work. Later approved branch updates run the complete local verification, build/sign and publication flow. Feature branches never publish. The dev prerelease channel is retired; `main` is the only maintained release channel.

GitLab is the source/version authority. One canonical signed MPP is published to GitLab, then the same published bytes are mirrored to Codeberg. GitGud is excluded from automated releases and must not be published by the local release flow. Each destination is authenticated separately and its public download is verified. No mirror selects another version, rewrites source metadata or force-pushes conflicting refs.

Every `main` release also rebuilds and publishes the production Pages site from committed release metadata. Main documentation-only/no-release updates may refresh the site too. GitLab Pages requires a Pages job, so that small tagged job runs on this Mac's protected project runner; it does not consume shared-runner minutes. The build/test/release watcher itself is independent of hosted runners.

Docker is optional for an additional Linux check. The existing macOS Android SDK and emulator remain the native Android test environment.

The former GitHub account is retired. The fixed `johninnl` name/noreply address is Git attribution; it does not require a live GitHub account. Publisher authentication is GitLab `johninnld` through `~/.ci`, with the configured GitLab SSH key for Git transport. GitHub login and token-owner checks are not CI/release gates.

### Older primary checkouts

An older primary checkout may deliberately retain pending app changes. Refreshing its instruction files does not update or approve those app changes. If it lacks `scripts/local-release/` or `.gitlab/scripts/`, use the already installed driver, which creates current isolated source checkouts:

```bash
CONFIG="$HOME/Library/Application Support/nl-morphe-local-release/config.json"
TOOLING="$HOME/Library/Application Support/nl-morphe-local-release/tooling"
node "$TOOLING/flow.cjs" --config "$CONFIG" --branch main
```

That command previews verification; normal publication still requires the established `--publish` procedure and approved branch head. For an ordinary Git operation in an older checkout, run the current `.gitlab/scripts/identity.cjs` by its path in an up-to-date isolated checkout while keeping the target repository as the working directory. It checks the target repository's effective identity/history and reads `~/.ci`; do not use the old GitHub local check. Do not reset, clean or bulk-update a dirty primary checkout just to refresh these instructions.

## Channels and verification

`scripts/local-release/templates.json` contains the two maintained templates:

| Branch | Publication |
| --- | --- |
| `main` | Stable releases |

`.releaserc` and `.gitlab/gitlab-com.release.config.cjs` own version selection, release notes, generated catalogues and release files. Do not bump generated versions manually.

Morphe reads the bundle metadata (`patches-bundle.json`, `patches-list.json`) from `main`, so `main` only receives it together with a downloadable bundle. Source commits may reach `main` at any time but never change the release-owned files: the release commit's assets in `.releaserc` (`CHANGELOG.md`, `gradle.properties`, `patches-bundle.json`, `patches-list.json`, `README.md`, the site index and catalogue pages). The release regenerates them. `node .gitlab/scripts/identity.cjs`, run before every push, refuses unpublished source commits that change them.

A GitLab release runs in this order: the release commit is created locally (`.gitlab/scripts/release_commit.cjs`), semantic-release pushes only its tag, the bundle is built, signed and uploaded and the GitLab release is created, and only then `.gitlab/scripts/promote_main.cjs` fast-forwards `main` to the release commit (never forced; it stops if `main` moved). If a run stops between the tag and the promotion, the next run finds the release commit on top of `main` (`findPendingRelease`), finishes publishing it at its tag and promotes `main`, instead of selecting a new version. Bundle transfers get 60 s plus one second per 64 KiB, so a slow uplink does not abort an upload. Required approval for unapproved app changes happens before promotion to `main`; the watcher automatically publishes approved updates afterward.

Both local automation and optional cloud CI use `scripts/local-release/verify.cjs`. It retains identity/history and release-policy tests, Python regressions, patch build/tests and all applicable extension unit tests through Gradle's aggregate `testDebugUnitTest` task, Medium bundle/tests and strict bilingual documentation/link checks. Tests and builds use isolated flow-owned checkouts. `LOCAL_RELEASE_PYTHON` selects the documentation Python environment; `LOCAL_RELEASE_GRADLE_OFFLINE=true` restricts Gradle to cached dependencies.

## Local engineering bundles

Keep canonical release version selection in the existing release automation.
For an unpublished phone-review bundle, derive a distinct identity from the
current canonical base version and clean source commit. Pass it only to the
Gradle invocation; do not edit `gradle.properties`, release metadata or tags:

```bash
navigation_review_sha=$(git rev-parse --short=12 HEAD)
```

With the existing private signing/application environment loaded, invoke the
normal build using `-Pversion=<canonical-version>+review.<source-sha>`. For
example, a review of canonical base `1.53.3` uses
`-Pversion=1.53.3+review.<the navigation_review_sha value>`. The suffix is build
metadata for local identification, not another release channel. Never publish
these review bundles through the watcher, hosted fallback or forge mirrors.

Different signed bytes must not reuse a review version. The phone investigation
on 2026-11-07 found an older extension in an installed APK despite a successful
same-version bundle import and APK installation. Keep the signed bundle hash
and source SHA in the private receipt. Update the existing local source through
Morphe's explicit Update action, preserve its patch choices/options and APK
signing key, and check the installed APK for the intended code before claiming
delivery. A Manager success screen or version label alone is not that proof.

Give the local source an unambiguous Manager display name, such as `Dutch App
Patches Navigation Review`, using the source card's Rename action. This changes
only the local label, not the signed MPP. In the APK version picker, confirm the
review source's row is marked selected before choosing the saved original.
Check the final patch result's source version before installing; a public
release with the same bundle name is a different input. Preserve the app's
saved patch selection and options, including microG and clone configuration.

When operating Manager by UI, dismiss its keyboard before scrolling or using
the bottom navigation. Allow transitions to settle, then use current element
bounds rather than fixed coordinates from an earlier screen. App-info actions
move when an update notice or scroll position changes.

## Private files: keep these out of Git

The private store defaults to `~/Library/Application Support/nl-morphe-local-release/`. Its configuration and secret files use mode `600`; private directories use `700`. Use absolute paths in configuration. Never put credential values in this document, `AGENTS.md`, a committed configuration, a plist, command output or a test diagnostic.

| Private input | Local source/reference | Environment/use | Remote CI counterpart |
| --- | --- | --- | --- |
| GitLab API key | `~/.ci`, `GITLAB` entry | `GITLAB_TOKEN`; publisher `johninnld` | Existing protected/masked `JOHNINNL_GITLAB_TOKEN` |
| Legacy GitGud API key (excluded from releases) | `~/.ci`, `GITGUD` entry | `GITGUD_TOKEN` only for a deliberate legacy manual mirror | Not used by automated releases |
| Codeberg API key | `~/.ci`, `CODEBERG` entry | `CODEBERG_TOKEN`; mirror owner `JohninNL` | `CODEBERG_TOKEN` for optional cloud mirroring; legacy name `JOHNINNL_CODEBERG_TOKEN` |
| GitLab/Codeberg SSH identities | Verified private paths selected by configuration (`GITLAB_SSH_KEY`, `CODEBERG_SSH_KEY`) | Git transport only; one destination key per operation | Not copied to hosted CI |
| Morphe Ed25519 signing seed | Private `secrets/morphe-signing-key` | `MORPHE_SIGNING_KEY` | Existing protected/masked `MORPHE_SIGNING_KEY` |
| Shared Maps application key | Private `secrets/maps-api-key`; existing ignored `.community-maps-api-key` may be the setup source | `SHARED_MAPS_API_KEY` | Existing protected/masked `SHARED_MAPS_API_KEY` |
| Bright article signing key | Private `secrets/bright-signing-key`; existing ignored `.bright-article-signing-key` may be the setup source | `BRIGHT_ARTICLE_SIGNING_KEY` | Existing protected/masked `BRIGHT_ARTICLE_SIGNING_KEY` |
| Optional legacy Maven/package credential | Explicit private package credential only if a locked dependency host still requires it; reusable caches/mirrors remain available | Dependency read only; never publisher/Git identity authentication | Only if an actual dependency fetch requires it; no retired-account login check |
| Pages runner authentication token | Private `pages-runner/config.toml` | The dedicated runner's GitLab connection | Separate from account API keys; never commit it |
| API/private configuration | Private `config.json` | `apiKeysFile`, nonsecret tool paths, `secretFiles`, Pages runner settings | No automatic secret synchronization |
| Inputs and development tooling | Android SDK, original APK/APKM/APKS files, ignored `.analysis`/`.tools`, test APK keystores | Build/test inputs and local evidence | Not release credentials or repository source |

`morphe-signing.pub` is intentionally public and tracked. Its matching private seed is not. Morphe signing is distinct from an APK test keystore or an Apple Developer ID identity. Setup reused the existing Morphe seed and verified its derived public key; do not generate a replacement signing identity as a workaround.

### Community Maps application key lookup

The installed release configuration is `~/Library/Application Support/nl-morphe-local-release/config.json`. Its `secretFiles.SHARED_MAPS_API_KEY` points to `~/Library/Application Support/nl-morphe-local-release/secrets/maps-api-key`. The existing setup source on this Mac is the ignored `/Users/jneerdael/Scripts/nl-morphe-patches/.community-maps-api-key` in the primary checkout. Both files were confirmed present without displaying their values.

Use the configured secret-file reference for releases. The local driver reads it into the scoped `SHARED_MAPS_API_KEY` build environment. In linked worktrees, resolve the primary checkout through Git's common directory if the ignored setup file is needed; a missing worktree-local file does not mean the community key is missing. Keep these files ignored and never commit, echo or copy key values into documentation. Verification fixtures may use a placeholder, but a release must use the real configured key.

This is a Maps application/API key. APK signing remains owned by the patching client, such as the phone's Morphe Manager; the MPP release uses the separate existing Morphe Ed25519 signing seed. Downloading the released MPP through Manager preserves the client's APK signing identity.

The API store supports labelled entries (colon or equals), optional quotes and JSON. A placeholder example is:

```text
GITLAB=<GitLab API key>
GITGUD=<GitGud API key>
CODEBERG=<Codeberg API key>
```

Only `GITLAB`, `GITGUD` and `CODEBERG` (optionally with `_TOKEN`) are credentials here. A `PUBLISH_BLOCKLIST` entry belonging to other local projects is skipped without reading its value; any other label makes the file invalid.

SSH identities must be actual private key files, not files containing `APIKEY=...`. Use the verified paths recorded in private configuration. Legacy working identities may be named `~/gitlab`, `~/gitgud` and `~/codeberg`; preferred dot-file paths are used only when they contain valid matching private keys. Normal jobs do not rename or overwrite credential inputs.

Credential tests use an isolated fixture HOME/environment and temporary files. Diagnostics must never print credential values, including assertion actual/expected values.

Local jobs read `~/.ci` afresh. Other existing signing/application credentials are referenced through private `secretFiles`; keep values out of the configuration itself. Hosted secrets are not silently changed by local setup. When rotating a token, check every documented local reference and any corresponding protected remote variable; do not leave fallback CI using a retired token.

## Required API permissions

Scope project permissions to the relevant `nl-morphe-patches` project. The account must also have the required project role. Git metadata always remains exactly `johninnl <349981574+johninnl@users.noreply.github.com>`.

For fine-grained GitLab release tokens:

| Boundary | Resource | Actions |
| --- | --- | --- |
| User | User | Read, for the authenticated owner check |
| Project | Project | Read |
| Project | Package | Read, Create |
| Project | Release | Read, Create |
| Project | Release Link | Create |

Token-metadata Read is optional diagnostic access for fine-grained keys; an explicit metadata-scope denial does not bypass owner/project checks or require a broad legacy `api` scope. Classic read-only API keys remain unsuitable for publishing. SSH handles Git refs in the configured local flow.

For production Pages control on GitLab, also grant project **Page: Read**, **Pipeline: Create, Read, Update**, and **Job: Read, Update**. Page Update is needed only when changing Pages settings; Pages Domain permissions are needed only for custom-domain management. No custom domain is required for the current site. One-time runner setup needs **Runner: Create** at User boundary and appropriate project runner management; its separate runner authentication token handles job execution afterward.

Codeberg uses its supported repository/release write access and user read access. Fine-grained Wiki access is independent and is not used merely because it is available. Do not grant Delete/admin capabilities for normal release creation.

[GitLab REST permission mapping](https://docs.gitlab.com/auth/tokens/fine_grained_access_tokens_rest/) and [Pages deployment model](https://docs.gitlab.com/user/project/pages/) describe these boundaries.

## Mac setup and automatic operation

The Mac needs Git, a supported Node version, Java/Android tools, a Python environment with `docs/site-requirements.txt`, and locked npm dependencies. The driver installs checkout dependencies with scripts disabled and reuses normal caches. Configuration records tool paths and separate private secret-file references.

```bash
CONFIG="$HOME/Library/Application Support/nl-morphe-local-release/config.json"
```

After both approved branches contain the maintained workflow, install/update the reviewed watcher:

```bash
node scripts/local-release/install.cjs --config "$CONFIG" --dry-run
node scripts/local-release/install.cjs --config "$CONFIG" --install
```

The installer validates staged tooling/plist and coordinates updates with the release lock. The user LaunchAgent `nl.johninnl.morphe.local-release` runs in the signed-in macOS session; keep the Mac available. Installation does not publish pre-existing branch heads.

The Pages helper configures one project-scoped, locked, protected runner tagged `nl-morphe-pages-macos`, with concurrency one and untagged jobs disabled. Its user service and private TOML are separate from the watcher. The API Pages pipeline selects only the local tagged Pages job, excludes hosted verify/release jobs, checks the expected main SHA, rebuilds the site and verifies its public release marker. Unique per-job checkout paths and terminal-job cleanup prevent runner build storage accumulating.

## Maintained branch procedures

Stable (`main`, after required app-promotion approval):

```bash
node scripts/local-release/flow.cjs --config "$CONFIG" --branch main
node scripts/local-release/flow.cjs --config "$CONFIG" --branch main --publish
```

Branch commands preview by default. Preview never invokes tagged recovery, mirror publication or production Pages. `--publish` is explicit. The installed watcher uses `--watch-once` and serializes jobs. A failed head remains recorded, not rebuilt every polling interval; after diagnosing its cause, use `--retry-failed` deliberately.

## Cleanup and recovery

Every terminal job, successful or failed, executes cleanup. It first retains a compact receipt, redacted bounded log tails and bounded release-safety JSON, then removes its owned checkout, generated output, installed job dependencies, temporary files and per-run repository. These are disposable build outputs, not the primary checkout or credential/input store.

Release success requires GitLab discovery/signature verification, the Codeberg mirror confirmation and main Pages verification where applicable. Each mirror request that fails on the network names its method, path and cause (for example `network failure (UND_ERR_SOCKET)`). Transient failures (network errors, 408/425/429 and 5xx) re-run the idempotent Codeberg publication up to three times in the run, 20 s and 60 s apart. When a published release still fails only its mirror, the watcher records a pending mirror for the release commit and later ticks retry the mirror alone, without rebuilding or republishing and without an attempt limit, after 2, 4, 8, 16 and 32 minutes and then hourly. A successful retry clears the release's failure fences. A newer `main` head supersedes the pending mirror, because only the release at `main`'s head can be mirrored. Independent downstream results are all accounted for even when one fails. Partial publication records retain per-destination outcomes. Existing canonical signed bytes are reused during idempotent recovery; a different signed rebuild cannot silently replace the canonical artifact.

Owned process groups must be stopped before deletion. If quiescence or cleanup cannot be proved, mark `cleanupRequired`, preserve the original failure and block later work until the pending cleanup is resolved. A still-active Pages job is cleaned only after it becomes terminal; later watcher ticks retry that cleanup even without a new source head.

Receipts/state remain for audit and retry. Per-stage logs are capped at 2 MiB and safety archives at 8 MiB/64 JSON files per run. Declared finished-run logs/archives expire after 30 days and are pruned oldest-first to a 512 MiB total budget. Unknown files, symlinks, active jobs and cleanup-pending evidence are not blindly deleted. The task's reusable bare object cache/tool environment and ordinary SDK/npm/Gradle input caches are not per-job garbage; no job may prune another project's active/global cache or the user's original downloads.

Do not edit generated versions or delete failure state to hide an error. Diagnose the failed stage, refresh the relevant credential/tool if required, then use supported recovery/retry and verify all public results.

A mirror-only failure needs no manual retry; the watcher keeps retrying it. Retry sequence for a failed `main` head:

1. Read the run's private `verification.log` or stage log and receipt under `runs/<id>/`. Fix a product or test failure with a new commit; a retry is only for a cause outside the commit.
2. If the receipt has `cleanupRequired`, wait for a watcher tick to resolve it. Explicit runs refuse while any cleanup is pending; only watch ticks sweep.
3. Retry once: `node "$TOOLING/flow.cjs" --config "$CONFIG" --branch main --publish --retry-failed`. A terminal or agent shell is fine: the workspace proof stops its parent walk at another user's unreadable ancestor, such as root's `/usr/bin/login`.

The release tests use a stand-in for the machine-wide workspace proof, except the dedicated held-workspace tests. Those, and the run's own cleanup, still scan every process of this user. Heavy concurrent builds from other jobs can report `unstable process list`; let them finish before retrying.

## Optional hosted fallback

Normal pushes and mirror updates do not start hosted jobs. An explicit GitLab **Run pipeline** invocation with the `run_cloud_ci` input set to `true` retains the complete fallback; protected main publication and protected-main Pages gates still apply. It also needs the relevant protected/masked mirror credentials. Legacy Forgejo workflows remain manual, preventing a mirror push from starting another version-selection/build cycle.

The separate API path supplies the validated `run_local_pages=true` and `expected_pages_sha` pipeline inputs. The YAML derives the job's `RUN_LOCAL_PAGES` and `EXPECTED_PAGES_SHA` environment variables from those inputs. It is restricted to the tagged protected Mac project runner, not shared runners. Keep arbitrary pipeline-variable overrides disabled; the controller does not require that permission. A skipped/canceled hosted pipeline is never reported as a passing verification run; retain the local source-SHA receipt instead.
