# Gearslip music patches implementation plan

> Execute inline with the executing-plans skill; use targeted independent artifact review where useful.

**Goal:** Deliver Gearslip player selection, YT Music caller compatibility, and a separate drawer filter through the existing Morphe bundle.
**Architecture:** Target actual APK DEX with narrow fingerprints and preserve existing host panel/media behavior. Keep compatibility and hide options separate; do not change Gearslip source checkout.
**Tech Stack:** Kotlin Morphe bytecode/resource patches, Android DEX probes, Python validation, JADX/REA.
**Spec:** docs/superpowers/specs/2026-11-01-gearslip-music-design.md

## Global constraints

Preserve primary checkout work and account data; no manual versions or phone interaction. The user approved dev followed by main for these changes. A fresh disposable emulator is now explicitly authorized. Only exact verified app versions are compatible. Real UID ownership gates must leave unrelated callers unchanged. Keep drawer filter default empty.

## Review focus

SETTINGS without media, navigation with incidental media, caller-package spoofing, server-flag/AA-absent branches, hide-list empty/invalid packages and built-in recovery settings.

### Task 1: Gearslip bytecode patches

- [x] Recover exact tile function and exclusion-set contracts on 0.3.12-alpha and 0.3.31-alpha.
- [x] Write an actual-DEX regression probe that fails on SETTINGS-plus-browser tile selection; retain adjacent navigation, media-only and settings-only cases.
- [x] Add patches under patches/src/main/kotlin/patches/gearslip: player selection correction and independent hiddenPackages option.
- [x] Run probe RED to GREEN, strict application and rebuild validation on both targets.

### Task 2: YT Music compatibility

- [x] Recover both versions' browser/trust gates and report exact DEX hooks.
- [x] Reproduce Gearslip rejection and reject spoofed package identity in a targeted DEX probe before changes.
- [x] Add compatible YT Music patch/extension only where required, preserving other callers.
- [x] Build and apply to 9.30.53 and 9.44.52; run policy probes across flag/host-presence cases.

### Task 3: Integration and docs

- [ ] Test non-destructive separate copies on the phone, using preview and media-session state.
- [ ] Verify both providers' artwork, play/pause and docked panels; document any browse/permission limits.
- [x] Run Python suite and Android release-workflow Gradle checks; review patch diff/fingerprints and generated bundle contents.
- [ ] Update substantive docs and ship a local reviewable bundle; no publication or main promotion without the required confirmation.

Pre-flight: tasks share only bundle/build and final runtime validation; separate patch namespaces prevent shared code edits. User explicitly selected the Morphe implementation and requested the secondary hide-list feature. Work in the current checkout, touching additive task files only; preserve unrelated untracked research. The user subsequently authorized a dev prerelease. Commit only this task's changes, publish through dev, then main as subsequently approved by the user. All further runtime work uses the disposable emulator.

Validation update: Android ART probes passed on both Gearslip targets and both YT Music policy targets. They were rerun on the newly authorized disposable API 36 emulator. No further phone interaction is permitted. Full signed-in browser/catalog/playback acceptance remains unverified and is explicitly deferred to prerelease testing. Independent patch review found no findings.
