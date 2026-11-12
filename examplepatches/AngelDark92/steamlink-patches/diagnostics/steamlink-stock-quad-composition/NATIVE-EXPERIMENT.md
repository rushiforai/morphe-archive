# Native far-plane quad experiment

## Status

The broken `Native quad composition (experimental)` patch was deleted on
2026-11-12 after reports of a wrong pose on fast eye/head movement and a fovea on
a different plane. Its helper, scene layout and tests were removed. Alpha-0
high-resolution trigger and Stock quad composition were restored to their v2.6.0
state. Do not re-add the removed patch or reuse its helper, layouts or names.

`Native quad far plane (experimental)` is a new, standalone, default-off
candidate for `2.0.20/5001712` only. It shares the direct native quad mechanism
but not the removed patch's identity. No symptom fix, performance result or
headset compatibility is claimed; a headset run is still required.

## Exact target

- `2.0.20/5001712` only.

`2.0.20/5001812` and every later Steam Link base are frozen: they get no far-plane
layout, option or payload. A matching version name alone is not sufficient. Other
packages and builds are inert before any read or write.

## Behavior and options

Each quad uses the head ORIENTATION and retains the eye POSITION, so base and
fovea stay coplanar and frame-coherent while each eye's image remains centred on
that eye. There is no projection fallback and no gaze smoothing, depth hack or
latest-pose substitution.

- **Quad distance**: `16`, `64` (default) or `250` metres. Only the distance and
  the resulting position offset/size change; the angular size and direction are
  preserved.
- **Layer settings**: `keep` (default) leaves the renderer's chain untouched;
  `none` strips only a leading `XrCompositionLayerSettingsFB` node
  (type `1000204000`) and preserves unrelated chains. An unknown mode fails
  closed at create.

The three quad modes are mutually exclusive. Alpha-0 high-resolution trigger,
Stock quad composition and this patch reject each other's helper/scene markers in
both application orders. Switch modes only from a clean source APK; the installer
does not silently remove another mode or undo its native edits.

## Helper identity and patchable slots

| Item | Value |
|---|---|
| Build id | `GXR-NATIVE-QUAD-1.3-FARPLANE-ABI1` |
| Size | 8760 bytes |
| SHA-256 | `0e33067dddd7ca30f9cfc902a71372aa36273cf0850ab0c4e9616ee080f2e418` |
| Marker | `GXRQUADDIST16M0` at file offset `0x1C20` |
| Distance slot | `0x1C30`, little-endian float32, default `1.996000051498413` |
| Settings slot | `0x1C34`, byte, default `0` (keep) |

The installer validates the marker, the stock distance bytes and the keep-mode
byte before rewriting exactly those fields. Rejects a helper that does not carry
the 1.3 far-plane identity (an APK from the removed 1.2 patch) and a fully
patched scene with no helper, both with clean-source guidance.

The helper reads the slot once per renderer state and creates no layers outside
`1.0`-`1000.0` m or for an unknown settings mode. States are pooled after
teardown and reset before reuse; stale calls are not made safe by pooling.

## Exact-base provenance

The retained decoded scene library is never rewritten in place.

| Code | Bytes | SHA-256 | Owned mutation sites |
|---|---:|---|---:|
| 5001712 | 2221072 | `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495` | 15 |

`NativeQuadFarLayouts.kt` records every owned file offset, length, original-range
SHA-256 and replacement bytes; only `2.0.20/5001712` is emitted. Whole-file size
and owned ranges are pinned, so independent native patches can compose outside
those ranges. Mixed, foreign or partially patched owned sites fail before any
write; reapplication is idempotent.

## Verification and reproducible commands

Use external paths for `<plan>`, `<helper-build>` and `<far-helper>`:

```powershell
.\extensions\native-quad-far-plane\Build-Native.ps1 -OutputDirectory <helper-build>
python -B extensions/native-quad-far-plane/tools/build_patch_tables.py <plan>
python -B extensions/native-quad-far-plane/tools/audit_native.py <plan>
python -B extensions/native-quad-far-plane/tools/far_slot.py <far-helper> `
    --expect-size 8760 `
    --expect-sha256 0e33067dddd7ca30f9cfc902a71372aa36273cf0850ab0c4e9616ee080f2e418 `
    --expect-slot 0x1C30 --expect-settings 0x1C34
$env:NATIVE_QUAD_FAR_HELPER = (Resolve-Path patches/src/main/resources/steamlink/nativequad/far/libgxr_quad_native.so).Path
$env:NATIVE_QUAD_HELPER = $env:NATIVE_QUAD_FAR_HELPER
$env:NATIVE_QUAD_PLAN = '<absolute-plan-path>'
python -B -m unittest discover -s extensions/native-quad-far-plane/tests -p 'test_*.py'
.\gradlew.bat :patches:test :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable --console=plain
```

Exclusive-selection proof on a pristine 5001712 APK (packed `AndroidManifest.xml`). The fixture
directory must contain the base under its decoded-fixture file name:
`decoded-apk-android-steamlinkvr-release-base-2.0.20-5001712.apk`.

```powershell
.\gradlew.bat :patches:auditDecodedSteamLinkPatches `
    -PdecodedAuditKind=far-plane -PdecodedAuditIndex=0 `
    -PdecodedAuditFixtureDirectory=<pristine-apk-dir> --console=plain
```

The audit applies only `nativeQuadFarPlanePatch`, then verifies the installed helper size and
distance/settings slot, the scene mutation, the `native_quad_far_plane_v1` metadata, the absent
`native_quad_v1` marker, and a second apply that must leave helper, scene and manifest unchanged.

- **Native host execution:** **52 tests discovered; 52 executed, 0 skipped, 0 failures/errors**
  with `NATIVE_QUAD_FAR_HELPER` and `NATIVE_QUAD_HELPER` set to the tracked
  `patches/src/main/resources/steamlink/nativequad/far/libgxr_quad_native.so`,
  `NATIVE_QUAD_PLAN` set to the retained `extensions/native-quad-composition/plan` directory,
  and `NATIVE_QUAD_BASES=5001712`. The suite covers the 240 stock-derived and 120 legacy fovea
  vectors, the distance and settings slots, invalid/out-of-range values, four swaps/draws/quads,
  state recreation, invalid FOV/size recovery, missing helper, ABI preservation and allocation
  errors.
- **Local build:** `:patches:test` **300 total, 277 executed, 23 skipped, 0
  failures/errors**; Android packaging and stable catalog generation pass. The
  far plane is experimental, so it is absent from `patches-list-stable.json`.
- **Exclusive apply:** pass on the pristine 5001712 APK with packed AXML and pass on the
  decoded fixture, including the reapply idempotence check.
- **Static:** `far_slot.py` prints the pinned size, SHA-256, marker, distance and
  settings offsets. The generated Kotlin layout is reproducible from the verified
  5001712 plan and matches byte for byte.
- **Headset:** no run exists. Nothing here is runtime proof.

All native plans, build output and audit logs are under
`../builds/steamlink-patches/extensions/native-quad-far-plane/` (with the retained
5001712 plan historically under
`../builds/steamlink-patches/extensions/native-quad-composition/plan/`).

## Headset check

Patch a pristine 2.0.20/5001712 APK twice with identical options, once without
and once with this patch, and compare fast eye/head movement and fovea depth.
Unknowns: whether the Android XR compositor clips or rejects quads this far or
this large, and stereo comfort. If 64 m shows no image, try 16 m. If the
symptoms are unchanged, the hypothesis is wrong and the patch should be removed.
