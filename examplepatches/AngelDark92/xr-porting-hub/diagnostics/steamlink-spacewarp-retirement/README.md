# GXR spacewarp layer — retired and removed (2026-11-01)

The **GXR spacewarp layer (experimental)** Steam Link patch is retired. Its patch
source, bundled OpenXR API layer, six per-build gate/VTS profiles, manifest, native
tests, Kotlin tests and build script were deleted on 2026-11-01. Nothing selects or
installs it any more.

## Why

The layer tried to synthesize a frame when the stream missed a display tick. To do
that it had to observe VRLink frame state, poses and the transport handoff from
inside Steam Link, and it inferred them by hooking private `libvrlink_scene.so`
internals: per-build code windows, the `eglCreateImageKHR` GOT slot, a
`ValueTransportSystem::BGetRemoteValue` read and the `SVLRoot` value-transport
embed. Those anchors are per-build, unvalidated on a headset, and still do not
expose the actual missed-tick decision.

A working implementation cannot be built this way. It requires either tapping
into VRLink (its private transport/protocol and frame handoff) or creating a
separate listener that receives the stream's frame timing and pose state. Neither
is acceptable in this toolkit, so the experiment is retired rather than patched
again.

## What was removed

- `patches/src/main/kotlin/app/template/patches/steamlink/androidxr/GxrSpacewarpLayerPatch.kt`
- `patches/src/main/resources/steamlink/androidxr/libgxr_spacewarp.so`
- `patches/src/main/resources/steamlink/androidxr/XR_APILAYER_local_GalaxyXR_gxr_spacewarp.json`
- `patches/src/main/resources/steamlink/androidxr/gxr_spacewarp_gate0_*.json` and `gxr_spacewarp_vts_*.json` (six bases each)
- `patches/src/test/kotlin/app/template/patches/steamlink/androidxr/GxrSpacewarpLayerPatchTest.kt`
- `extensions/gxr-spacewarp-layer/` (native layer, shaders, derivations and native tests)

## Historical evidence kept

- [`diagnostics/steamlink-5002395/SPACEWARP-2026-10-26.md`](../steamlink-5002395/SPACEWARP-2026-10-26.md) — the last per-build pin record.
- [`diagnostics/vd-asw-multilayer/2026-10-20-ASW-INTEGRATION-DEFECTS-VALIDATION-AND-FIX-PLAN.md`](../vd-asw-multilayer/2026-10-20-ASW-INTEGRATION-DEFECTS-VALIDATION-AND-FIX-PLAN.md) — the unexecuted defect/fix plan.
- `diagnostics/steamlink-legacy-1812-1968/RESTORED-2026-10-22.md` and other dated records.

The PC driver's **Async Spacewarp** setting is separate and is not changed by
this retirement. Without a headset-side synthesizer, enabling it holds frames
instead of producing intermediate ones.

## Do not re-add

Do not restore the patch, a partial VTS/EGL variant, or a renamed re-derivation
without a new mechanism and new evidence. See rule 13 in [`AGENTS.md`](../../AGENTS.md).
