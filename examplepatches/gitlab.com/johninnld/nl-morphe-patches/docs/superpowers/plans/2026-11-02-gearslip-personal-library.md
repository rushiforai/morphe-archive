# Gearslip Personal Libraries Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Deliver selectable Morphe patches that expose each app's existing signed-in library to Gearslip, with real catalogue and playback validation.

**Architecture:** Patch the music apps, retaining Gearslip's actual UID and package identity. Myspoti extends the existing shared browser permission predicate. YT Music reuses its phone-session content adapter and adds Gearslip root handling while preserving original clients.

**Tech Stack:** Kotlin Morphe patcher, Java Android extensions, JUnit, Python validation, Android MediaBrowser.

**Spec:** `docs/research/2026-11-02-gearslip-personal-library.md`

## Global Constraints

- Keep Gearslip's authenticated Android package/UID identity throughout the service boundary.
- Do not uninstall the existing account-bearing apps to obtain a test result.
- Preserve existing release automation and leave stable promotion for separate user confirmation.
- Use only johninnl for every author and committer; run the repository identity preflight before commits or pushes.
- Never display private build credentials or signing keys.

## Review Focus

- A forged host package under another UID must retain rejection.
- Root, children and search must apply the same Myspoti permission change.
- An unrecognized APK layout must fail patching before output.
- YT Music must deliver real personal items with working playback commands, including paginated playlists.
- Account sessions and unrelated clients must survive patching and reconnects.

### Task 1: Myspoti browser access

**Files:** `patches/src/main/kotlin/patches/myspoti/GearslipSupportPatch.kt`, `BrowserDiscovery.kt`; `extensions/gearslip-myspoti/`; `patches/src/test/java/patches/myspoti/BrowserDiscoveryTest.java`; validation tools under `scripts/myspoti/`.

**Interfaces:** Discover the shared `String -> Boolean` predicate from `PlaybackService` and its root/caller paths. Preserve the original method and add configured host matching at that predicate only.

- [x] Add failing structural discovery tests: shared root/children policy, renamed methods, missing UID lookup, ambiguous/missing predicate.
- [x] Run the tests and observe failure before implementation.
- [x] Implement scoped host policy and visibility options using the existing patch conventions.
- [x] Run patch tests; apply to supplied 2.3.0 APK and inspect emitted DEX.
- [x] Verify actual policy execution and rejection boundaries in an isolated Android fixture.

### Task 2: YT Music personal content

**Files:** `patches/src/main/kotlin/patches/ytmusic/`; `extensions/gearslip-ytm/`; targeted tests and `scripts/ytmusic/`.

**Interfaces:** Reuse `AndroidAutoPatch.BrowseRequest`, the existing phone-session request client and existing playback command conversion where present. Keep admission and content handling separate.

- [x] Capture the exact root/children response path and make a failing test for Gearslip root initialization.
- [x] Implement the smallest content bridge that recognizes configured Gearslip roots and serves working Home/Library children; fail clearly when required adapter contracts are absent.
- [x] Verify unrelated roots and missing account/client readiness; retain the native loaders' duplicate-delivery guards.
- [x] Patch the supplied already-patched APK without requiring reapplication of its existing admission patch.
- [x] Inspect resulting hooks and run content regression tests.

### Task 3: Manager and signed-in validation

**Files:** app documentation, research evidence and validation scripts.

- [x] Build the `.mpp` and confirm patch names, package compatibility and option metadata.
- [x] Run repository Python regression checks and release-workflow Gradle checks appropriate to changed modules.
- [ ] User acceptance after dev release: produce/install signed APKs using matching keys or separate copies.
- [ ] User acceptance after dev release: verify personal playlists, liked/saved items, playback, search and reconnect through Gearslip on Android.
- [x] Record exact artifacts and test limitations.
- [x] Review changes, run identity preflight and commit only task-owned files. Do not promote app changes to stable without confirmation.

## Execution ledger

- 2026-11-02: Isolated branch `feat/gearslip-personal-library` at `198e813` created under `.tools/worktrees/` because primary checkout contains unrelated work.
- Baseline first failed before project evaluation because the fresh worktree did not inherit GitHub Maven credentials. Retried with the existing authenticated `gh` token in the subprocess environment and explicit installed Android SDK path; no credential was written to tracked files.
- Ruling: Continue inline from the user's goal-continuation instruction; preserve the proposed per-app scope and keep stable promotion separate.
- Task 1: implemented; six discovery tests and exact 2.2.0/2.3.0 patch application pass. The supplied 2.3.0 emitted DEX passes six actual Android checks.
- Task 2: implemented; exact YT Music APK patch/rebuild passes, existing admission verifier passes, and the emitted content adapter passes 26 actual Android checks. Native loaders retain their existing pagination, playback-command conversion, duplicate-delivery and account-change guards.
- Ruling: The user requested release to dev and will test on device afterward. Defer live account and Manager acceptance to that test; publish a development build with these limitations explicit.
- Verification: 27 Gradle patch tests; buildAndroid and metadata generation pass; Python415 tests pass45skip. Original phone account-bearing APKs were not replaced.
- Final review: independent read-only reviewer found no code blockers; added explicit repatch selection instructions and a version-specific YT Music patch table in both languages in response to its documentation finding.
- Task 3 delivery: published `v1.27.0-dev.2`; Release run `41394444912` and safety run `41394444977` passed. Dev discovery verification, downloaded bundle digest/payload comparison and strict published-bundle application to both supplied APKs passed. User-owned signed-in device acceptance remains pending as requested.
