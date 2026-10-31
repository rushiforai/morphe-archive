# Videoland Android TV Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans to implement this plan task-by-task. Execute inline; do not delegate routine implementation.

**Goal:** Deliver separately selectable Videoland TV ad and tracking patches and a signed experimental APK for user playback testing.

**Architecture:** Exact-input Kotlin bytecode/resource patches follow the KIJK/NPO conventions. Native empty-result and optional fallback branches preserve player completion. Independent decoded-output verification checks the complete original method and manifest inventory.

**Tech Stack:** Kotlin, Morphe 2.1 patch API, Apktool 3, Python, Android SDK, Morphe Desktop 1.19.1.

**Spec:** `docs/superpowers/specs/2026-10-29-videoland-atv-design.md`

## Global Constraints

- TV APKS only: nl.rtl.videoland.v2, 1.117.0, code 1622, minSDK 24.
- Publisher signer SHA256: 6c7782ca5cabbaaf0546c31b63b7a5ed112ef6a00a5422fa263c2516dee2c141.
- Both public controls default on after user-confirmed Premium playback; dev-only
  release and ad-supported testing requests remain explicit.
- Preserve subscription, authentication, DRM, functional consent and media.
- No PairIP patch without an identified target; no generated release metadata edits.

## Review Focus

- Empty client-ad results must match their concrete transformer's return type.
- Yospace null result must retain the live queue's supplied fallback and DRM path.
- Snowplow constructor must initialize Object and dependency fields before return.
- Config overrides must delegate unknown keys and avoid clobbering parameters.
- Old telemetry queues must complete with a fatal result without HTTP retries.

### Task 1: Ad contracts and patch

Files: `patches/src/main/kotlin/patches/videolandatv/{Compatibility,AdsPatch}.kt`,
`tests/videoland_atv_contracts.json`, `tests/verify_videoland_atv.py`.

- [x] Record stock registers, instruction counts and expected result types.
- [x] Add independent emitted-effect checks; prove stock fails them.
- [x] Implement exact client requester, pause-ad, loader and Yospace edits.
- [x] Build and verify an ad-only emitted APK.

### Task 2: Tracking contracts and patch

Files: `patches/src/main/kotlin/patches/videolandatv/{TrackingPatch,TrackingResources}.kt`,
`tests/test_videoland_atv.py` and the independent verifier.

- [x] Record initialization, telemetry egress and manifest ownership contracts.
- [x] Test selected config keys versus unknown/null keys, constructor initialization,
  typed ID/empty results and fatal telemetry response.
- [x] Implement exact tracking gates and resource edits.
- [x] Build tracking-only and combined APKs; verify all original methods and manifest.

### Task 3: Review and delivery

Files: `docs/research/2026-10-29-videoland-atv.md` and private Desktop delivery directory.

- [x] Run the host suite and Android build; inspect compatibility catalog without retaining generated metadata.
- [x] Review register lifetimes, coroutine completions, fallback callers and resource diffs.
- [x] Verify signed artifacts, hashes, original-input rejection and selection isolation.
- [x] Deliver candidates and an acceptance guide; retain runtime limitations explicitly.

## Execution result

Implemented inline on dev following CONTRIBUTING.md. Android build and 152 host
tests pass. All three selections preserve all 140,770 original method contracts
and complete manifest ownership checks; 13/14/27 actual-APK ART cases pass. The
stock negative probe fails as expected, and a re-signed input is rejected.
Independent review reported no critical/important patch defects; verifier
manifest/inventory findings were corrected and tested. Artifacts and hashes are
in the Desktop test directory. After explicit stock-removal authorization, all
three publisher splits were backed up and verified, stock was replaced, and the
installed combined hash matched the tested candidate. Startup/account pairing was
observed; the user confirms Premium playback works. Ad-supported playback and
full traffic coverage still require feedback. The user authorizes a dev prerelease
and a documentation-only main update with explicit test requests and Morphe
prerelease installation instructions. Stable patches must remain unchanged.
