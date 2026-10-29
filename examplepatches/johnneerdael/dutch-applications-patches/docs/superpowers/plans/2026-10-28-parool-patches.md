# Parool Patches Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add validated Parool 7.53.1 development patches and publish a dev release while preserving the approved app set.

**Architecture:** Reuse the independently matching Trouw implementation in a separate Parool package. Add the explicitly uncovered tracking/game boundaries and extend the existing independent Desktop/decode validation matrix. Preserve existing approved packages byte-for-byte in source.

**Tech Stack:** Kotlin Morphe patches, JDK21, Python3 independent verifiers, apktool, Morphe Desktop1.19.1, Android build-tools36.1.0, semantic-release.

**Spec:** `docs/superpowers/specs/2026-10-28-dutch-app-rollout-design.md`; evidence in `docs/research/2026-10-28/parool.md`.

## Global Constraints

- Parool only: `be.persgroep.android.news.mobilepa`, `7.53.1`, code `23136515`, minSdk32, APKS; both independently verified publisher certificates from the inventory.
- Five controls: Hide ads; Disable tracking; Skip consent screens; Hide Premium banner; Read full articles. Tracking includes ads; consent includes tracking and ads.
- No fabricated account/purchase/consent/reward success. Retain functional Catsure, authentication, paper/PDF, notification and manual privacy contracts.
- New allocation stays on SSD; proprietary inputs/credentials/raw bodies remain outside Git. Preserve the ten approved apps and main.
- The user authorized incremental dev publication and sequential app implementation; no additional approval checkpoint is required for those actions.

## Review Focus

- First launch with analytics components removed must still complete readiness/onboarding and reach content; fresh notifications remain off.
- A successful empty marketing result must preserve supplied late paragraphs, Q&A, liveblog/error/suspension behavior and genuine entitlements.
- Game ad suppression must return a real error/rejection path, never a watched-ad reward; ordinary video must resume.
- Identifier-header suppression must still call the HTTP chain; account/credentialed-content headers and auth refresh remain functional.
- Individual controls must work with their dependency combinations; approved-app source and generated compatibility entries must remain intact.

---

### Task 1: Independent Parool verifier and routing tests

**Files:** Create `tests/verify_parool.py`; modify `tests/test_validate_targets.py`; create `tests/test_parool_contracts.py` as needed.
**Interfaces:** Consumes the pinned original decode and existing Trouw verifier helpers; produces Parool original/selection verification callable by `scripts/validate_targets.py`.

- [ ] Write a routing test for the five controls/dependencies and dedicated verifier; run `python3 -m unittest discover -s tests` and observe missing Parool routing fail.
- [ ] Add the independent Parool verifier. Reuse shared checks only where the recorded 77/19 contracts match; verify Parool identity/resources and add output assertions for audio tracking, game error handling, GAID header, monitoring and bmtrcs.com. Do not import a Trouw input/package identity check unchanged.
- [ ] Run `python3 tests/verify_parool.py /Volumes/MorpheResearch/research-2026-10-28/apps/parool/decoded`; expect original checks pass. Run each selected control against that original; expect the corresponding effects to fail.
- [ ] Commit verifier/tests after the implementation/routing catches up and the suite is green; ledger the observed original failures.

### Task 2: Cohort reuse and Parool-specific coverage

**Files:** Create `patches/src/main/kotlin/patches/parool/{Compatibility,Ads,Tracking,ConsentScreens,Onboarding,ContentFilters,WebContent,Premium,FullArticles}Patch.kt` (Compatibility is `Compatibility.kt`); modify `scripts/validate_targets.py`.
**Interfaces:** Consumes the tested five-control verifier; produces guarded Parool patches and an independent validation matrix.

- [ ] Copy the proven Trouw implementation into package `patches.parool`, with exact Parool compatibility/original-input metadata and independently checked onboarding/resource guards. Keep approved package source unchanged.
- [ ] Add narrow additional audio/monitoring sinks and actual bmtrcs.com host matching. Suppress the advertising-ID fetch/header without skipping the HTTP continuation or rewriting functional identifiers globally.
- [ ] Gate the independently installed game IMA request using its initialized error-state contract; assert rejected reward and preserved ordinary-game completion. Preserve the existing video resume path and genuine game/reader entitlements.
- [ ] Add Parool routing and dependencies. Run the whole Python suite; expect all tests green. Run a capped offline `buildAndroid`; expect a loadable MPP with existing approved entries plus exactly the Parool controls.
- [ ] Commit the app implementation with test evidence in the ledger.

### Task 3: Apply, inspect, review and publish the increment

**Files:** Modify `README.md`, `patches/build.gradle.kts`; create `docs/parool-audit.md`; generated catalog/manifests are updated by their existing generators/release workflow.
**Interfaces:** Consumes the built MPP/original APKS/verifier; produces signed validated output, an audit and a verified dev release.

- [ ] Run `python3 scripts/validate_targets.py parool /Volumes/EXT-SSD1/phone-apks/parool-original.apks --compact` under the SSD/JDK environment. Expect original-negative plus every individual control and all controls to pass Desktop FULL, signatures and independent decoded verification. Address actual failures with reproducing assertions first.
- [ ] Check strict package/version/certificate targeting, preserved approved app source/catalog, dependency combinations and retained method hashes; inspect the patch report and signing result.
- [ ] Record exact build/selection verification and remaining phone scenarios in `docs/parool-audit.md`; document new development support without claiming phone acceptance.
- [ ] Obtain fresh code review, fix material findings with RED→GREEN evidence, then run the required final checks. Commit the coherent increment.
- [ ] Fetch current dev, integrate without overwriting concurrent work and publish through the existing dev workflow. Verify its terminal result, generated catalog, MPP asset and versioned download URL; report the dev version and phone test list.
- [ ] Mark this app increment complete in the rollout ledger and continue to Dumpert. Keep the overall goal active until all requested apps and dev releases are delivered.
