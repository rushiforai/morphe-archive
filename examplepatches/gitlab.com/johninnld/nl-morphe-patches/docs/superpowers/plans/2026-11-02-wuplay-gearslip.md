# WuPlay Gearslip Implementation Plan

> **For agentic workers:** Use superpowers:executing-plans. User explicitly authorized continuous delivery and a worktree; do not pause for design or plan approval.

**Goal:** Deliver Morphe patches and a verified patched WuPlay Mobile APK with a native car browsing/playback interface usable in Gearslip, without phone mirroring or root.

**Architecture:** Inject a dedicated Java car extension and AndroidX Car client service into app.wuplay.android 0.1.9-alpha/9. Use the app native profile/catalog/metadata/stream repositories, and a separately owned native Media3 player output on Gearslip supplied surfaces. Keep phone behavior intact; car playback lifecycle belongs to the car session.

**Tech Stack:** Morphe bytecode/resource patches, Java extension DEX, AndroidX Car App Library aligned with Gearslip, existing WuPlay Media3/Kotlin runtime, Python/JVM/ART and device tests.

**Spec:** User request plus existing research report in primary checkout .analysis/wuplay-gearslip-2026-11-02/report.md. Full native car interface, not mirroring or an audio-only substitute.

## Global Constraints

- Work only in this worktree; preserve installed official apps and unrelated primary checkout changes.
- Git identities exactly johninnl <349981574+johninnl@users.noreply.github.com>; follow AGENTS.md verification before commits/pushes.
- Target original app.wuplay.android version 0.1.9-alpha, code9, signer ae406f7d398ae1ae418238f83d07554e6aa6cf5855b66edb9c4c85995d435e7f.
- Do not bundle a second Media3/Compose/Kotlin runtime. Explicitly integrate car SDK manifest/resources and checked existing target ABI.
- Preserve normal authentication and demonstrate registration behavior; do not infer server enforcement from certificate-related source.
- No manual version bumps or unapproved main promotion. Deliver branch/artifacts and concrete validation before requesting any remaining irreversible action.

## Review Focus

- Phone Activity stop must not pause car playback; car disconnect must release it.
- Replaced/destroyed surfaces and asynchronous stale browse requests must not leak or resume stale playback.
- Profile changes, native request failures and empty catalogs must produce usable car states.
- Missing optimized ABI methods or duplicate classes must fail patching or validation, not crash a driver session.
- Re-signing must not overwrite the official app; installation is restricted to the owned emulator and registration state remains bounded.

### Task 1: Native repository and playback adapter

Files: extensions/wuplay-gearslip/src/main/java/nl/johninnl/wuplaycar/*.java; tests/fixtures/wuplay-car; tests/test_wuplay_car.py.
- [x] Write/run failing tests for browse state, request generations, playback/surface ownership and model conversion.
- [x] Bind native profiles/catalogs/meta/streams via exact checked ABI; build a native player wrapper on the existing target Media3 classes.
- [x] Verify normal native repo failures are surfaced, request cancellation works and target method inventory matches.

### Task 2: Car UI, service and patch packaging

Files: extensions/wuplay-gearslip/build.gradle.kts and runtime; patches/src/main/kotlin/patches/wuplaymobile/GearslipPatch.kt; support compile stubs as needed.
- [x] Add root/category/catalog/details/episodes/streams and playback controls with surface handling and independent lifecycle.
- [x] Add fail-closed APK resource/bytecode patch, explicit AndroidX car packaging/resources and foreground playback declarations.
- [x] Build patch bundle and patch exact APK; verify classes/resources/services/signature and install on the owned emulator.

### Task 3: Runtime verification and delivery

Files: scripts/wuplay-car validation harness; docs/wuplay-gearslip-validation.md; app docs as appropriate.
- [x] Validate ART/linkage, native registration, car host handshake, browsing, actual video frames/audio/control and phone stopped/screen-off behavior.
- [x] Exercise reconnect/surface replacement/seek/episode/error behavior on available phone/head-unit or host fixture; record exact environment limits.
- [x] Run full Python suite and required Gradle/repository checks, review diff, fix material findings, commit under required identity.
- [x] Deliver Morphe bundle and patched APK with paths/hash and retained evidence. Keep main/release promotion gated by repo policy.
