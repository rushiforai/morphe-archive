# Patcher 2.3 compatibility migration

## Motivation and root cause

The v0.6.0 bundle is compiled against Morphe Patcher 1.15.1. Manager 2.5.0
uses Patcher 2.3.0; when another selected bundle uses Patcher 2.x, exact-string
fingerprinting behavior applies to the older bundle too, producing the reported
compatibility warning. This is separate from ARMv7-only input failing to install
on a 64-bit-only device.

Upstream documents version-driven behavior in
https://github.com/MorpheApp/morphe-patcher/blob/v2.3.0/docs/5_patcher_changes.md .
Do not suppress the warning or edit the MPP manifest to claim an untested version.

## Planned change

Build against the latest stable Patcher and compatible official settings plugin
selected afresh by CI (currently Patcher 2.3.0 and plugin 2.1.0).
Audit selective resource decoding and exact-string matching; retain all app pins,
public patch selection/defaults, original input identity and native libraries.
Use deprecated context APIs where still supported instead of unrelated API rewrites.
No ABI support expansion is part of this change.

## Acceptance and regression frame

- Failing case: old v0.6.0 bundle emits the compatibility warning under Patcher 2.3.0.
- New bundle: actual dependency and MPP manifest declare 2.3.0, no old-bundle warning.
- CI-equivalent: Java21/SDK36, npm CI/tests, Gradle tests/buildAndroid/catalog.
- Positive: PiTT clean ARM64 source, Google/local selections and combined output;
  GPS JoyStick clean Play/Unlocked with blank Maps key; app-owned guard tests for others.
- Nearby: PiTT supplied ARMv7 XAPK can patch, but stays ARMv7; no installation promise.
- Guards: wrong-version/already-patched input must still reject; compare native/asset
  preservation and patched method behavior instead of treating build success as phone acceptance.
- Device install/startup/login and disappearance of the warning in Manager UI remain
  user acceptance; do not claim a device run from desktop output alone.

## Results

- Removed fixed Patcher/plugin versions. CI discovers current stable versions
  and supplies the resolved pair to Gradle for that job. Migrated the catalog generator from `Patch<*>` to the
  non-generic `Patch` API. Public app patches/defaults are unchanged.
- Audited resource access: decoded-resource patches request individual XML files;
  the only directory listing is Windy raw assets, not a decoded `res/` tree.
  No legacy raw-string Fingerprint declarations occur in this bundle.
- `npm ci --include=dev` and all 9 release-tooling tests passed.
- Diagnostic Kotlin compilation of all production source against the new desktop
  engine API passes. This is a source compatibility check, NOT an official MPP
  build or a replacement for Gradle/extension tests.
- The v0.6.0 baseline still applies both PiTT patches on the modern desktop engine;
  resulting DEX and native entries match the previous qualified test output.
  Old bundle alone retains old behavior; the supplied Manager screenshot is the
  mixed-bundle warning reproduction.
- Formal Gradle, extension and bundle validation will use the repository GitHub
  Actions workflow, followed by qualification of its exact-head MPP artifact.
  No candidate MPP or completed APK regression is claimed before those checks.

## Latest-stable selection policy

Each CI build/release must discover the latest stable Patcher and settings plugin
from upstream GitHub metadata, not keep repository version pins. Resolve once per
job so verification and release steps use the same pair. Record the selected
versions and upstream references in the artifact; a later run discovers again.
API errors, malformed versions and prerelease-only results must stop the build,
not silently fall back to an older version. The actual MPP Patcher-Version must
match the selected Patcher. Validation covers unordered tags, prerelease guards,
API failures and normal resolution before any publishing changes.
