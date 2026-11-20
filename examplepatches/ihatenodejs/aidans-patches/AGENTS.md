# Repository Guidelines

This is the repository-wide guide. Read the nearest directory-specific `AGENTS.md` before editing a module; those files contain the detailed rules intentionally removed from this root document.

## Project Overview

This repository builds [Morphe](https://morphe.software) patches for third-party Android apps. Patches modify Dalvik bytecode, Android resources, embedded web/Hermes assets, and ARM64 native libraries; optional Java bridges are packaged as a Morphe Patch Extension.

The repository also contains:

- `apk-lab`, a deterministic APK/APKM/XAPK analysis, compatibility, and device workflow.
- A Cloudflare Worker that tracks Play Store versions and compatibility results.
- An Astro site that renders patch metadata, release notes, and status.

Do not copy volatile app versions, patch counts, or feature inventories into guidance. Kotlin patch declarations are authoritative; `patches-list.json` is their generated public inventory.

## Architecture & Data Flow

| Layer               | Location                                                  | Responsibility                                                                                                                     |
| ------------------- | --------------------------------------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| Patch definitions   | `patches/src/main/kotlin/app/aidan/patches/`              | Morphe `bytecodePatch`, `resourcePatch`, `rawResourcePatch`, and `compositeFeaturePatch` declarations, grouped by app and feature. |
| Runtime bridges     | `extensions/extension/src/main/java/app/aidan/extension/` | Java classes merged into target DEX through `extensions/extension.mpe`.                                                            |
| APK tooling         | `tools/apk-lab/`                                          | Artifact inspection, managed decompilation, comparison, patch verification, deployment, and monitoring.                            |
| Metadata generation | `patches/src/main/kotlin/util/PatchListGenerator.kt`      | Reflects compiled patches into root `patches-list.json`.                                                                           |
| Control plane       | `worker/`                                                 | Cloudflare Worker for version scraping, KV-backed compatibility state, dispatch, and badges.                                       |
| Public site         | `site/`                                                   | Static Astro UI consuming patch metadata, changelog data, compatibility state, and local icons.                                    |
| Automation          | `scripts/`, `.github/`                                    | Unified checks, release generation, deployments, compatibility CI, icons, and font preparation.                                    |

Data flow:

1. Gradle compiles Kotlin patch definitions into `.mpp` and Java extension classes into `extensions/extension.mpe`.
2. Morphe applies compatible patch layers to APK/APKM/XAPK input and produces a patched APK.
3. `./gradlew generatePatchesList` builds the bundle and emits `patches-list.json`.
4. Semantic release updates generated metadata, the README patch block, changelog, and release bundle metadata.
5. `worker/src/apps.ts` and `site/src/data/repo.ts` consume root metadata; Worker compatibility state feeds the site/status badges.

Cross-layer rule: DEX, XML, and raw assets use different Morphe contexts. A feature spanning contexts should use `compositeFeaturePatch` for private one-to-one companion layers, or standalone companion patches linked with `dependsOn(...)` for shared or multi-feature prerequisites; Java bridge calls additionally require `extendWith("extensions/extension.mpe")`. See `patches/AGENTS.md`.

## Key Directories

| Path                | Use                                                     | Local guidance                                            |
| ------------------- | ------------------------------------------------------- | --------------------------------------------------------- |
| `patches/`          | Kotlin patch bundle and metadata generator              | `patches/AGENTS.md`                                       |
| `extensions/`       | Java runtime bridges packaged as `.mpe`                 | `extensions/AGENTS.md`                                    |
| `tools/apk-lab/`    | Python APK lifecycle CLI and pytest suite               | `tools/apk-lab/AGENTS.md`                                 |
| `worker/`           | Cloudflare Worker and Vitest suite                      | `worker/AGENTS.md`                                        |
| `site/`             | Astro site and data-layer tests                         | `site/AGENTS.md`                                          |
| `docs/`             | APK Lab reference and per-app reverse-engineering specs | `docs/AGENTS.md`                                          |
| `scripts/`          | Bun audit orchestrator                                  | `scripts/AGENTS.md`                                       |
| `.github/`          | CI, release, deploy, and generator automation           | `.github/AGENTS.md`                                       |
| `.apk-lab/`         | Managed generated workspaces; never hand-clean          | Use `apk-lab clean`.                                      |
| `apk/`, `analysis/` | Local artifacts and exploratory output                  | Not production source; avoid adding dependencies on them. |

Per-app docs live at `docs/<app>/architecture.md` and `docs/<app>/patches.md`. Inspect the matching `shared/Constants.kt` and generated `patches-list.json` for current package and target compatibility.

## Development Commands

### Setup

```bash
bun install --frozen-lockfile
bun install --frozen-lockfile --cwd worker
bun install --frozen-lockfile --cwd site
uv sync --locked --project tools/apk-lab
```

Gradle requires GitHub Packages credentials through `GITHUB_TOKEN`/`GITHUB_ACTOR` or `gpr.key`/`gpr.user` in Gradle properties.

SDK and NDK resolution for Android and native builds:

- **Android SDK**: Resolved via `ANDROID_HOME`, `ANDROID_SDK_ROOT`, or `sdk.dir` in `local.properties`.
- **Android NDK**: Resolved via `ANDROID_NDK_HOME`, `ndk.dir` in `local.properties`, or falling back to `$sdkDir/ndk/$REQUIRED_NDK_VERSION` (matching `REQUIRED_NDK_VERSION = "28.2.13676358"` [r28c] in `patches/build.gradle.kts`).
- **CMake & Ninja**: CMake 3.24+ and Ninja are required for native host and cross-compilation builds (`extensions/adobescan-pdf-native` and Rust native targets).

### Build and Metadata

```bash
./gradlew :patches:buildAndroid        # Build .mpp and extension .mpe
./gradlew buildAndroid                 # Root equivalent
./gradlew generatePatchesList          # Build and regenerate patches-list.json
./gradlew :patches:buildAndroid clean --no-daemon  # CI compilation gate
```

### Quality Gates

```bash
bun run audit         # format check + lint + typecheck + all test suites
bun run format:check
bun run lint
bun run typecheck
bun run test
bun run format        # mutates supported files
bun run lint:fix      # mutates supported files
bun run deps:check    # read-only check across all monorepo dependencies
bun run deps:update   # interactive update prompt (or --plan / --approve for agents)
bun run audit --deps  # format + lint + typecheck + test + dependency freshness
```

Use targeted checks while iterating, then run `bun run audit` after code changes. `scripts/audit.ts` is the source of truth for the exact command matrix.

### Run Development Surfaces

```bash
bun run --cwd worker dev
bun run --cwd site dev
uv run --project tools/apk-lab apk-lab doctor
```

Use the documented `apk-lab` commands for all APK lifecycle work; do not invent ad hoc extraction/decompilation directories. Detailed commands are in `tools/apk-lab/AGENTS.md` and `docs/apk-lab.md`.

### Release Dry-Run

```bash
npm install
npx semantic-release --dry-run
```

`npm` is release-only. Normal repository, Worker, and site workflows use Bun.

## Code Conventions & Common Patterns

### Repository-Wide Rules

- Reuse the nearest module's existing pattern; do not introduce a parallel convention.
- Fail fast before irreversible writes. Required classes, methods, resources, byte sequences, inputs, and generated boundaries must produce descriptive errors instead of partial output.
- Optional/version-variable behavior must be explicitly optional; never convert a required mismatch into a silent skip.
- Keep generated outputs generated. Do not hand-edit `.mpp`, `.mpe`, build output, `site/.astro/`, `site/dist/`, or managed `.apk-lab/` workspaces.
- Update the matching docs when commands, user-visible patch behavior, compatibility, or safety invariants change.
- Kotlin/Java use 4-space indentation. Patch Kotlin uses IntelliJ ktlint style from `.editorconfig`; TypeScript/Astro and configured JSON use Prettier/Oxlint; Python uses Ruff. Rust uses 2021 edition with standard 4-space cargo fmt and clippy with warnings denied. C++ uses C++20 with standard 4-space clang-format (LLVM style) and compiles with `-Wall -Wextra` (warnings treated as errors). Match neighboring style for files outside the configured formatter scopes.

### State, Async, and Dependency Boundaries

- Worker handlers receive `env: WorkerEnv`; keep bindings explicit rather than importing hidden service state. Await KV/fetch operations and preserve validation at request boundaries. The module-level memory cache is bounded fallback state, not durable truth.
- Site data modules should remain deterministic build-time transformations over root metadata and fetched release/status inputs. Keep rendering concerns in Astro components/pages.
- Android extension bridges are static entry points called from injected Smali. Public Java descriptors are an ABI: change the Java method and its Kotlin/Smali caller together.
- Python APK tooling passes paths/configuration explicitly and uses managed workspaces. Preserve deterministic output and archive/path-safety checks.
- Monorepo dependency management uses `scripts/deps.ts` (`bun run deps:check`, `bun run deps:update`). Intentional holds require a mandatory reason in `dependency-policy.json`. Normal audit is offline and deterministic; dependency freshness is opt-in via `bun run audit --deps` or `bun scripts/audit.ts deps`. Updates require explicit confirmation (interactive TTY prompt for humans, or `--plan <report> --approve <digest>` for automated agents).

### Generated Metadata

- Patch names, descriptions, options, categories, and compatibility declarations in Kotlin generate `patches-list.json`.
- The README section between `PATCHES_START` and `PATCHES_END` is generated by `.github/scripts/generate_patches_readme.py`; never edit that block manually.
- `site/public/icons/<package>.png` is synchronized by `.github/scripts/sync_app_icons.py`.
- Release automation owns `CHANGELOG.md`, `patches-bundle.json`, release-version updates in `patches-list.json`, and the generated README patch block.

### Commit Message Convention

All commit summaries must strictly follow Conventional Commits format:

```text
<type>(<scope>): <description>
```

Every commit must be scoped. Never author unscoped commits (e.g. `fix: ...`, `chore: ...`), freeform summaries (e.g. `Fix issues in PR #21`), or path-based scopes (e.g. `tools/apk-lab`, `patches/main`). Automated release commits (`chore: Release ... [skip ci]`) and PR merge commits are generated exclusively by tooling.

#### Commit Types

| Type       | Release impact (`.releaserc`) | Changelog section      | Usage                                                                                                |
| ---------- | ----------------------------- | ---------------------- | ---------------------------------------------------------------------------------------------------- |
| `feat`     | Minor                         | ✨ New Features        | New user-facing patch, option, feature, or tooling capability.                                       |
| `fix`      | Patch                         | 🐛 Bug Fixes           | Bug fix in patch bytecode, resources, extension runtime, site, worker, or tools.                     |
| `bump`     | Patch                         | 🚀 Updated App Support | Updating supported target APK versions or compatibility ranges. Never use `fix` for version updates. |
| `perf`     | Patch                         | 🔧 Improvements        | Performance optimization or bytecode execution efficiency.                                           |
| `chore`    | None                          | Hidden                 | Maintenance, dependency upgrades, release config, icon sync, housekeeping.                           |
| `docs`     | None                          | Hidden                 | Documentation in `docs/`, `AGENTS.md`, or skill references.                                          |
| `style`    | None                          | Hidden                 | Formatting, indentation, whitespace only (no runtime behavior changes).                              |
| `refactor` | None                          | Hidden                 | Code restructuring without fixing a bug or adding a feature.                                         |
| `test`     | None                          | Hidden                 | Adding or updating tests, fixtures, or test mocks.                                                   |
| `ci`       | None                          | Hidden                 | CI workflows, GitHub Actions, runner setup, or pipeline scripts.                                     |

Release impacts in `.releaserc` apply strictly to application scopes. Non-application scopes (`site`, `worker`, `apk-lab`, `ci`, etc.) are configured with `release: false` in `.releaserc` and never trigger patch package releases.

#### Scope Taxonomy

Every commit must use an exact scope from one of the two tables below.

##### Application Scopes (Mandatory for Patches & Extensions)

All patch definitions and Java extension changes must use the canonical app scope. The Astro site and release changelog resolve application icons and attribution directly from this scope.

| App                 | Canonical scope       | Note on legacy aliases                                                            |
| ------------------- | --------------------- | --------------------------------------------------------------------------------- |
| Sezzle              | `sezzle`              | Aliases (`sezzlemobile`) are legacy site mappings only; never use in new commits. |
| SidelineSwap        | `sidelineswap`        | Alias `sideline` is legacy.                                                       |
| AfterShip           | `aftership`           | —                                                                                 |
| Canvas Student      | `canvas-student`      | Aliases (`canvas`, `candroid`) are legacy.                                        |
| Navigate360 Student | `navigate360-student` | Aliases (`navigate360`, `navigate`, `eab`) are legacy.                            |
| Blackjack           | `blackjack`           | Alias `tripledot` is legacy.                                                      |
| Adobe Scan          | `adobe-scan`          | Aliases (`adobescan`, `adobe`, `scan`) are legacy.                                |
| Fizz                | `fizz`                | Alias `buzz` is legacy.                                                           |
| Geocaching          | `geocaching`          | Alias `groundspeak` is legacy.                                                    |
| 365 Pay             | `365pay`              | Alias `pay365` is legacy.                                                         |
| NHL                 | `nhl`                 | —                                                                                 |
| Adobe Reader        | `adobe-reader`        | Alias `adobereader` is legacy.                                                    |
| Credit Karma        | `credit-karma`        | Alias `creditkarma` is legacy.                                                    |
| Pro Metronome       | `pro-metronome`       | Alias `prometronome` is legacy.                                                   |

##### Non-Application Scopes

Repository tooling, infrastructure, and shared modules must use only these fixed canonical scopes (no subdirectories or path prefixes):

| Scope           | Allowed boundary                                                    | Forbidden variants                    |
| --------------- | ------------------------------------------------------------------- | ------------------------------------- |
| `apk-lab`       | APK Lab Python CLI, toolchain, analysis, deployment, decompilation  | `tools/apk-lab`, `skills/apk-lab`     |
| `site`          | Astro static website, UI components, site data loaders, site tests  | `web`, `frontend`                     |
| `worker`        | Cloudflare Worker control plane, scraping, KV compatibility state   | `cf`, `backend`                       |
| `audit`         | Unified audit orchestrator (`scripts/audit.ts`), lint/format setups | `scripts`                             |
| `ci`            | GitHub Actions workflows, matrix checks, compatibility pipelines    | `workflows`, `ci/workflows`, `deploy` |
| `release`       | Semantic release configuration, packaging plugins, release scripts  | `build(release)`                      |
| `docs`          | General repository documentation, root README, architecture specs   | `docs(docs)`, `specs`                 |
| `icons`         | Application icon synchronization pipeline and icons data            | `chore(app-icons)`                    |
| `deps`          | Dependency upgrades across Bun, Gradle, or Python                   | `dependencies`                        |
| `play-metadata` | Google Play metadata resolution CLI and gpapi client                | `tools/play-metadata`                 |

#### Summary Description Rules

The summary text after `<type>(<scope>):` must follow these rules:

1. **Imperative mood**: Use imperative verbs (`add`, `fix`, `update`, `remove`), never past tense (`added`, `fixed`, `removed`) or progressive (`adding`).
2. **Lowercase start**: Begin the description with a lowercase letter (`add dark theme`, not `Add dark theme`).
3. **No trailing punctuation**: Never end the summary with a period or exclamation mark.
4. **Concise length**: Keep the entire summary line under 72 characters.
5. **Direct substance**: State what changed and why. Never commit review metadata (e.g. `address review comments`, `fix PR issues`).

## Important Files

| File                                                 | Purpose                                                             |
| ---------------------------------------------------- | ------------------------------------------------------------------- |
| `settings.gradle.kts`                                | Morphe plugin and authenticated plugin repositories.                |
| `gradle/libs.versions.toml`                          | Morphe, smali, and Gson versions.                                   |
| `patches/build.gradle.kts`                           | Patch metadata, generated font resource, build, and metadata tasks. |
| `extensions/extension/build.gradle.kts`              | `.mpe` output and Android namespace.                                |
| `patches/src/main/kotlin/util/PatchListGenerator.kt` | `patches-list.json` generator.                                      |
| `tools/apk-lab/apk_lab/cli.py`                       | APK Lab CLI parser and handlers.                                    |
| `tools/apk-lab/tools.lock.json`                      | Pinned external APK tools and hashes.                               |
| `scripts/audit.ts`                                   | Unified format/lint/typecheck/test runner.                          |
| `worker/src/index.ts`                                | Worker request, cron, dispatch, and compatibility control plane.    |
| `worker/src/apps.ts`                                 | Patch metadata → monitored app derivation.                          |
| `site/src/data/repo.ts`                              | Root metadata/changelog → static site model.                        |
| `.releaserc`                                         | Release rules and generated-asset pipeline.                         |
| `.github/workflows/apk-lab-tests.yml`                | Multi-stack check and patch build gate.                             |
| `.github/workflows/apk-compatibility.yml`            | Real-artifact compatibility and fixture pipeline.                   |
| `docs/apk-lab.md`                                    | Canonical APK Lab behavior and safety reference.                    |

## Runtime/Tooling Preferences

- **Bun**: primary JavaScript package manager and task runner for root, Worker, and site. Respect each `bun.lock`.
- **Node/npm**: only for semantic-release workflows.
- **Java**: Temurin JDK 21 is the CI-supported baseline. Use `./gradlew`, never a system Gradle.
- **Python**: 3.12+ through `uv`; run commands with `uv run --project tools/apk-lab ...`.
- **Android SDK**: Build Tools 36.0.0 for APK verification/signing/alignment. Resolution uses `ANDROID_HOME`, `ANDROID_SDK_ROOT`, or `local.properties`.
- **External APK tools**: install only through `apk-lab setup`; versions and SHA-256 values live in `tools/apk-lab/tools.lock.json`.
- **Cloudflare**: Worker development/deployment uses Wrangler through the Worker package scripts. Never deploy, mutate bindings, or rotate secrets during routine verification.
- **Rust**: Stable toolchain (`cargo`, `clippy`, `rustfmt`) for `tools/play-metadata`. Managed via `tools/play-metadata/Cargo.lock`.
- **Android NDK**: Version matching `REQUIRED_NDK_VERSION` in `patches/build.gradle.kts` (`28.2.13676358` / r28c). Resolution uses `ANDROID_NDK_HOME`, `ndk.dir` in `local.properties`, or `$sdkDir/ndk/$REQUIRED_NDK_VERSION`.
- **C++**: C++20 for native PDF engine (`extensions/adobescan-pdf-native`). Clang-format (LLVM style, 4-space indent), CMake 3.24+ with Ninja, compiled with `-Wall -Wextra -Werror`.

## Testing & QA

Tests are layered; unit tests do not prove that a proprietary target APK still patches or runs.

| Change                      | Minimum targeted proof                                                                                                                                 |
| --------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------ |
| Kotlin patch or Java bridge | Gradle compile/build, real-artifact `apk-lab check ... --all`, then device smoke for changed runtime behavior.                                         |
| APK Lab Python              | Targeted pytest plus `uv run --project tools/apk-lab pytest -q`; smoke the changed CLI path.                                                           |
| Worker                      | `bun run --cwd worker check` and `bun run --cwd worker test`; exercise changed route/cron behavior locally when applicable.                            |
| Site                        | `bun run --cwd site test`, `check`, `check:icons`, and `build`; inspect the changed page/surface.                                                      |
| CI/generator/release script | Targeted non-mutating/check-only mode, affected tests, and review generated boundaries. Do not perform a release/deploy as verification.               |
| Cross-stack code            | `bun run audit` after targeted checks.                                                                                                                 |
| Rust play-metadata          | Targeted test: `cargo test --locked --manifest-path tools/play-metadata/Cargo.toml`; full validation: `bun run audit`.                                 |
| C++ native engine           | CMake host build and CTest (`ctest --test-dir extensions/adobescan-pdf-native/build/host --output-on-failure`); device validation via `apk-lab check`. |

Patch compatibility policy:

1. Never add a supported target version from metadata comparison alone.
2. Run `apk-lab check <artifact> --mpp <bundle> --package <pkg> --all` so every compatible patch baseline and independent boolean-option inversion is exercised.
3. The check must pass Morphe execution, package-name/version-code identity, Android DEX verification, member-delta checks (at least one patchable member changed), and extension inventory checks when present.
4. Deploy through `apk-lab deploy ... --launch`; monitor with `apk-lab monitor`. Verify the actual changed user flow and absence of crash/ANR/main-thread spin.
5. Clean workspaces only with `apk-lab clean --run ...` or `apk-lab clean --package ...`; never use raw recursive deletion.

Pre-commit runs format/lint checks; pre-push runs typecheck/tests. Install hooks with `bun run prepare` when needed.
