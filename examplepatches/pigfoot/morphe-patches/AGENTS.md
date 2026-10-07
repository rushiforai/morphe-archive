# AGENTS.md — Repository Agent Index

This file applies to the entire repository. Keep this index concise: each rule
uses Trigger / Guard / Pointer, with implementation details in the linked sources.
Do not create a second operating index in `TOOLS.md`.

## Project Scope

### Repository layout and language
Trigger: starting work or adding files.
Guard: use the official Morphe Gradle `patches/` and `extensions/` layout. Keep
documentation, patch descriptions, option text and commit messages in English;
preserve the original app identity and display name. Do not introduce a separate
custom bundle builder.
Pointer: [README.md](README.md), [settings.gradle.kts](settings.gradle.kts).

### Change planning
Trigger: changing patch behavior, compatibility, build tooling or release rules.
Guard: record the motivation/root cause, success criteria, failing and nearby
cases, rejection guards and normal success cases before editing. Keep changes
app-scoped; report checks actually run and limitations. Do not equate a successful
build or APK comparison with verified phone startup or live bus updates.
Pointer: [README.md](README.md), [APK verifier](scripts/verify-apk.py).

### RailsGo input compatibility
Trigger: editing RailsGo patches or expanding supported versions.
Guard: current support is clean RailsGo 1.25.2 (156), arm64-v8a APKS. Preserve
version, manifest-shape and class-fingerprint rejection guards. Do not relax pins
just to accept an unsupported or already modified input; independently qualify
each new target against its clean original.
Pointer: [RailsGo patches](patches/src/main/kotlin/app/pigfoot/patches/railsgo/RailsGoPatches.kt).

### Package isolation and dependencies
Trigger: changing package naming, manifest rewriting or patch selection.
Guard: package renaming is opt-in and disabled by default. The bus patch depends
only on sideload startup compatibility, never on package renaming. Without rename,
preserve the original package, providers, permissions and link scheme. With rename,
retain the configurable package, `.morphe` option default and complete isolation.
Sideload is REQUIRED for standard/Shizuku installs; root mount stays unavailable
until independently qualified. Preserve the app display name. Installation updates
require the same package and local signing key; existing `.morphe` users must select rename.
Pointer: [RailsGo patches](patches/src/main/kotlin/app/pigfoot/patches/railsgo/RailsGoPatches.kt),
[installation instructions](README.md#installation).

### Reward helper and extension boundary
Trigger: modifying the bus helper, extension dependencies or shrinker rules.
Guard: retain the observed-unit check, loaded reward metadata, original fallback,
deduplication and no reward replay after callback failure. The embedded extension
must contain only `Lv5/RailsGoBusUpdate;`; app/SDK stubs remain compile-only.
Never bundle a second Kotlin runtime or generated resource classes into the app.
Pointer: [helper](extensions/railsgo/src/main/java/v5/RailsGoBusUpdate.java),
[helper tests](patches/src/test/java/v5/RailsGoBusUpdateTest.java),
[bundle contract](patches/src/test/kotlin/app/pigfoot/patches/BundleContractTest.kt),
[extension build](extensions/railsgo/build.gradle.kts),
[shrinker rules](extensions/railsgo/proguard-rules.pro),
[Gradle properties](gradle.properties).

## Tools

### Build and verification
Trigger: changing code, dependencies or build/release tooling.
Guard: use Java 21 and Android SDK 36. Run
`./gradlew :patches:test :patches:buildAndroid :patches:generatePatchesList`;
run `npm ci` and `npm test` for release-tooling changes. The tests verify the
actual embedded extension as well as helper behavior. If local dependency access
is unavailable, use official CI and report its result, not a presumed pass.
For documentation-only edits, validate links and diff; do not add redundant tests.
Pointer: [build instructions](README.md#build),
[patch build](patches/build.gradle.kts),
[verification workflow](.github/workflows/ci.yml),
[release workflow](.github/workflows/release.yml), [package scripts](package.json).

### APK regression verification
Trigger: changing app bytecode, manifest handling or the injected extension.
Guard: apply the bundle to clean original APKS with rename unselected, explicit
default `.morphe` and custom package names; compare against an independently
generated, untouched merged baseline. With rename off, verify all original
provider/permission/link attributes remain unchanged.
Verify only the two intended original methods change, only the helper is added,
native/assets remain byte-identical and the original label is preserved. Also
exercise modified/unsupported input rejection. Never use a previously patched
or mutable scratch APK as the trusted baseline.
Pointer: [APK verifier](scripts/verify-apk.py),
[verifier dependencies](scripts/requirements.txt),
[RailsGo patches](patches/src/main/kotlin/app/pigfoot/patches/railsgo/RailsGoPatches.kt).

### Versioning and generated files
Trigger: committing changes or preparing a release.
Guard: semantic-release owns subsequent versions after initial v0.0.1. Use
`docs:` for documentation-only changes (no release); `fix:` / `perf:` / `bump:`
for patch releases, `feat:` for minor releases, and `BREAKING CHANGE:` for major
releases. `dev` publishes prereleases; `main` publishes stable releases. Do not
manually bump versions, rewrite published tags, or hand-edit generated Manager
metadata, patch lists, changelog or the README patch-list block. Check workflow
results after pushing; never infer publication from a commit alone.
Pointer: [release configuration](.releaserc),
[release-rule tests](scripts/test-release-rules.mjs),
[release workflow](.github/workflows/release.yml),
[versioning instructions](README.md#versioning).

### Credentials and artifacts
Trigger: accessing package dependencies, publishing or sharing test artifacts.
Guard: keep tokens in environment variables or user-level Gradle properties,
never repository files or logs. Do not commit signing keys, original/patched
APKs or APKS, private device logs, local workspace paths or personal context.
Publish only intended project artifacts through the existing release workflow.
Pointer: [build instructions](README.md#build), [.gitignore](.gitignore),
[release workflow](.github/workflows/release.yml).
