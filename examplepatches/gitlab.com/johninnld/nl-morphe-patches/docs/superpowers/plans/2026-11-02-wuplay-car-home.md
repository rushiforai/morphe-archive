# Wuplay car Home and autoplay Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this approved design inline. Continue through build, runtime validation and review without further design checkpoints.

**Goal:** Deliver Home/season poster carousels and automatic eligible playback within 10 Mbps through the Wuplay Mobile patch.

**Architecture:** Keep the existing CarApp service and native repository/player boundary. Add pure stream eligibility and shelf grouping helpers; publish host-supported SectionedItemTemplate shelves with session/revision-specific tab identities, and use a restricted artwork provider for bounded cached thumbnails. Route every source selection through the same eligibility check.

**Tech Stack:** Java extension, AndroidX Car 1.8.0-rc01, existing Wuplay Media3/Kotlin runtime, Kotlin Morphe patch, Python/JVM and Android emulator probes.

**Spec:** docs/superpowers/specs/2026-11-02-wuplay-car-home-design.md

## Global Constraints

- Target app.wuplay.android 0.1.9-alpha / 9; patch the original publisher APK, not the pulled already-patched inspection APK.
- Use existing Gearslip carousels; do not modify Gearslip or inject another Compose/Media3/Kotlin runtime.
- Maximum eligible stream rate: 10,000,000 bits/second. Unknown rates do not autoplay; estimates are average rates, not network shaping.
- Keep profile/PIN enforcement, cancellation, surface and playback ownership intact. Preserve the user's phone app/account and primary-checkout changes.
- Use johninnl identity for every commit/push, run repository identity checks each time, and do not promote to stable without confirmation.

## Review Focus

- Missing episode season/runtime/thumbnail must preserve usable episode navigation and never use whole-series runtime to understate episode bitrate.
- Profile switches and refreshed shelves must not reuse cached items/artwork from another profile.
- All-over-limit, unprobeable, adaptive and header-authenticated sources must not bypass eligibility.
- Failed playback and delayed asynchronous results must not restart video after Back/disconnect.
- Artwork errors and slow catalogs must not freeze the host or overflow Binder/memory budgets.

### Task 1: Stream eligibility and native source metadata

**Files:** create `extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/CarStreamPolicy.java`; modify `NativeData.java`; create `tests/test_wuplay_car_home.py` and `tests/fixtures/wuplay-car/CarHomeProbe.java`.

**Interfaces:** `CarStreamPolicy.bitrate(Long bytes, Double seconds): Long`, `eligible(Long bitsPerSecond): boolean`, `runtimeSeconds(Object runtime): Double`; `NativeData.Choice` carries a nullable measured/estimated bitrate and eligibility label; `NativeData.Item` retains episode-specific metadata separately from parent metadata.

- [x] Write JVM assertions for exact 10 Mbps boundary, invalid/overflow sizes and durations, unknown rates, minute runtime parsing, preference ordering and source URL eligibility.
- [x] Run `python3 -m unittest tests/test_wuplay_car_home.py`; verify missing production policy causes failure.
- [x] Implement pure eligibility helpers and native metadata/rate resolution, with bounded HTTP HEAD/range probing and explicit manifest detection where needed. Preserve request headers and cancellation.
- [x] Run the new tests and existing `tests/test_wuplay_car.py`; expect green.
- [x] Verify identity and commit the independently testable policy/metadata changes.

### Task 2: Home and season shelves with artwork

**Files:** create `ShelfGroups.java`, `CarArtwork.java`, `ArtworkProvider.java`; modify `NativeData.java`, `WuplayCarService.java`, `patches/src/main/kotlin/patches/wuplaymobile/GearslipPatch.kt`; extend the Task 1 JVM/Android fixtures.

**Interfaces:** `ShelfGroups.seasons(List<T>, ToIntFunction<T>, Comparator<T>): Map<Integer,List<T>>`; `CarArtwork.icon(String url, String label): CarIcon`; `CarArtwork.close()` cancels work; section publication uses immutable complete item lists and opaque session/profile/revision tab identifiers.

- [x] Write failing assertions for numeric season ordering, Specials/unclassified episodes, pagination and distinct refresh/profile identities.
- [x] Implement grouped Home/season SectionedItemTemplate shelves (initial 4 catalogs, 12 titles each; catalog pages 30 titles; season shelves up to 30 episodes with More episodes). Keep every catalog/episode reachable through next groups/pages.
- [x] Load artwork through a restricted read-only provider using bounded/downsampled cached images, placeholder artwork and trusted-host grants; fit poster aspect ratio without cropping.
- [x] Add poster detail pages and episode detail/play actions; retain backing page objects and cache identity when navigating back. Preserve list fallback below Car API 8.
- [x] Add patch-time checks for new exact native ABI references and provider manifest declaration. Build `:patches:buildAndroid :patches:test` and execute JVM regressions.
- [x] Verify identity and commit UI/artwork changes.

### Task 3: Autoplay and shared capped playback entry

**Files:** modify `WuplayCarService.java`, `NativeData.java`, `NativePlayer.java`; extend JVM/Android fixtures and `scripts/wuplay-car/serve_fixture.py`.

**Interfaces:** detail/episode Play resolves ranked eligible `List<NativeData.Choice>`; one service playback entry validates the cap for manual/autoplay/retry; automatic retries remain bound to the active page/session/selection and are capped at 3 candidates.

- [x] Write failing coverage for preferred-addon selection among eligible sources, all-over-limit rejection, unknown-rate rejection, bounded retry and cancelled selection.
- [x] Implement one-click Play, useful selecting/no-source/error states, eligible-only alternative sources, and retry on engine failure only while the owning player page remains active.
- [x] Enforce adaptive player bitrate limits through the checked existing Media3 selector ABI, without changing global phone preferences or allowing fallback above the cap.
- [x] Verify existing seek, pause/resume, audio/subtitle, surface and profile tests remain green.
- [x] Verify identity and commit autoplay integration.

### Task 4: Artifact and actual host verification

**Files:** extend `scripts/wuplay-car/Probe.java` and fixture server; modify bilingual `docs/site/{en,nl}/apps/wuplay-mobile.md`, `docs/wuplay-gearslip-validation.md` and patch description.

**Interfaces:** production bundle and original APK produce an installable validation APK; owned emulator and Gearslip Preview demonstrate real shelves, season selection and capped playback.

- [x] Run `python3 -m unittest discover -s tests` and the release workflow Gradle verification tasks appropriate to the changed modules; retain logs.
- [x] Patch the exact original APK using the built bundle, independently inspect DEX/resources and signer, and install only on the owned test emulator.
- [x] Exercise real host Home/posters, season shelves, episode detail, automatic playback and over-limit rejection using authored media/add-on responses. Test Back, reconnect/profile revision and existing playback controls; save screenshots and assertions.
- [x] Update docs with verified behavior and environment boundaries, then request a fresh whole-branch review. Resolve material findings with regression coverage.
- [x] Verify identity and commit final artifacts/docs source. Deliver bundle/APK paths and bounded validation; do not merge or publish a stable release without approval.
