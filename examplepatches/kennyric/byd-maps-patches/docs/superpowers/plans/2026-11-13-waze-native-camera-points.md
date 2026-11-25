# Waze native camera points implementation plan

> Execute inline with the executing-plans skill. Batch connected implementation before checks; no per-edit runtime sessions.

**Goal:** Deliver genuine native Waze tile camera positions to the existing Maps/Vela moving-map markers.
**Architecture:** Observe native tile addition/removal callbacks with a pinned ARM64 adapter. Copy bounded value records into native storage, drain through JNI into display-only warning events, and retain the approved receivers and UI. Preserve original native execution; no Frida dependency in the product.
**Tech stack:** Android Java, Kotlin resource patch, C++/JNI/NDK, pinned ShadowHook2.0.1 instruction relocation/interception.
**Spec:** docs/research/2026-11-13-waze-native-tile-extraction.md and docs/contracts/navigation-indicators-v1.md; owner explicitly selected native tile extraction.

## Global constraints

- Original native library SHA-25672a28430c1fe2f0b5939141bd92c3b7000af8e64fb366f96bf4a47cd6d478e1e; ARM64/build IDa5c11cd50fb4e3302f0646e008f712d8 only until additional ABIs are verified. Fail closed on mismatches.
- No reporter access, coordinate logs, synthetic-alert driving proof or physical-phone changes.
- Display only; preserve native speech decisions and approved UI. Average-speed endpoints remain an independent native route-line requirement.
- Existing validation tooling remains frozen; only goal-required probes can change. No publication.

## Connected implementation batch

- [ ] Native adapter: verify library identity/prologue, intercept observed callback, filter exact added/removed callsites, copy tile/id/kind/position values, bound cache and clear on overflow/stop. No pointer retention or JNI calls inside native callback.
- [ ] Java adapter: validate/drain snapshots, classify native camera kinds, deduplicate by native identity, emit display-only UPSERT/CLEAR through NativeWarnings with a native-tile position origin. Clear after loss of adapter/source.
- [ ] Build/package: pin dependency, include native libraries via raw-resource patch, connect startup/stop; preserve original application behavior on unsupported ABI.
- [ ] Contract/receiver consistency: accept genuine fixed tile positions without granting speech or fabricating direction/zone geometry. Preserve user marker toggle.
- [ ] Meaningful regression checks: malformed snapshots, duplicate IDs/kinds, invalid coordinates, removals, overflow/source stop, unknown build, no speech, receiver eligibility. Group native compile, extension/JVM and patch checks through local CI.
- [ ] One bounded acceptance after build: natural native camera additions -> producer events -> genuine Maps and Vela frames, GPS-only route movement, Frida coverage. Reuse existing setup and passing evidence; retain failures and cleanup.

## Review focus

Callbacks before bridge readiness; tile refreshes while draining; negative/unsigned IDs; cache overflow; source death leaving stale points. Keep these cases covered in the implementation/check batch.

## Exact average-speed range integration batch

Native range/line endpoints are recovered and the stationary fixed-camera pixel gates are closed in both receivers (private receipts recorded in the research note). Integrate the range capture with bounded per-thread copied values, atomic generation replacement and instruction/build guards; no native pointer retention. Export exact signed native segment IDs and coordinate pairs with explicit known-boundary flags. Route truncation must never become a fabricated control boundary.

Augment existing segment/correlated events with the native start or end appropriate to their native phase. Preserve original warning identity, distance, phase, speech and original descriptor geometry when the association disappears. Add parsing, phase, identity, truncation and removal regressions. Group Waze unit tests, native/Android compilation and patch checks in an owned disposable snapshot, then bind a new private Waze APK for one planned acceptance session. Existing Maps/Vela pixel evidence remains valid; moving/background and own AA/DHU gates remain open.
