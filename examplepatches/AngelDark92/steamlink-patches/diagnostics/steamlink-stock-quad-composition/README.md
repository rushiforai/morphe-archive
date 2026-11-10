# Stock quad composition backport (2026-11-03)

Default-off experimental patch for exact Steam Link 2.0.20/5001712,
2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363 and
2.0.24/5002395. Keep Alpha-0 deselected when using this experiment; its source
and payloads are unchanged. MPP only; no APK is produced by this work.

## Static mechanism

Stock 5002527's streaming renderer replaces the older stereo projection layers
with four quads: base-left, base-right, fovea-left, fovea-right. The new layer
uses the original view head pose and cached runtime eye-to-head poses, a plane
at 1.996000051498413 m, original swapchains/rectangles/spaces and per-family
settings chains, with flags 0/0/6/6. It preserves the frame chain and unrelated
trailing layers. The unused underside is dropped only on the three-projection
bases. Stock four-quad frames pass through unchanged.

All six decoded bases were inspected separately. Earlier three builds use two
projection layers; later three builds use underside/base/fovea projections.
Their pose/FOV helpers and swapchain construction were compared; no layout is
inferred solely from version names. Stock 5002527 is a reference, not a newly
declared compatible base.

This reproduces observable stock layer construction. It does not prove that
quad topology alone causes Android XR high resolution. There is no headset A/B
for this backport and no captured stock 5002527 `xrEndFrame` array. Host output
is not evidence that the runtime accepts the converted frame or raises its
resolution.

## Removed alternatives

At the owner's request the active Surface-video patch, native source, tests,
helper and manifest were removed after the user reported it not working. The
legacy `GxrResolutionProbe` DEX hook and its activation references were removed.
Historical diagnostics remain. No codec, color, controller or permission
feature was intentionally removed.

## Runtime check

Select **Stock quad composition (experimental)** with **Alpha-0 high-resolution
trigger** deselected, using a clean exact-base APK. Check logcat tag
`GXRStockQuad` for eye location and converted-frame records. In the corrected
payload, `stock_quad_stripped` means a frame was submitted without its stream
projections. A runtime rejection returns the real error; the next frame attempts
conversion again. There is no permanent disable or second submission of a frame.
Earlier payloads used the fallback described in the initial audit below.

## Evidence

Static evidence is retained in external analysis reports:

- `../builds/steamlink-patches/build/compare-5002527-audit/REPORT.md`
- `../builds/steamlink-patches/build/quad-backport-all-bases/REPORT.md`

Host native tests passed for both layouts, geometry, rejection, lifecycle,
package inertness and single-submission behavior. Android arm64 compilation and
symbol inspection passed. Kotlin test counts and package verification are
reported with the final delivery, not treated as runtime proof.

## 2026-11-09: initial 2.7.0 flicker and fovea-depth audit (before correction)

User reports an occasional past-frame flash and a fovea that appears nearer than
the background when gaze moves. No affected user's APK, exact base, enabled-patch
list or headset capture was supplied. This audit establishes current source
behavior, not correspondence with that user's installed 2.7.0 payload.

`stock_quad_layer.cpp:layerEndFrame` replaces the leading projections outright.
Its outgoing array contains four generated quads followed only by the unrelated
tail. The two-projection layout loses both projections; the three-projection
layout loses underside/base/fovea. No source projection is forwarded on a
converted frame. Rejected frames instead pass through unchanged, once, and a
runtime rejection disables conversion for subsequent frames.

`stock_quad_core.h:composeQuad` and `buildQuads` put base and fovea on the same
1.996000051498413 m plane per eye. They share eye offsets and orientation;
`planFrame` requires identical source head poses. Gaze changes the fovea's FOV
centre and size, not a separate depth. Cached eye offsets alone therefore do not
establish a fovea/background depth difference. Swapchain handles, rectangles and
array indices are copied; no acquire/wait/release operation is changed. There is
no source evidence here for projection-to-quad conversion selecting an older
released image by itself.

One concrete flicker candidate is alternating converted and original frames:
strict pose equality or other layout/geometry checks can reject one frame while
accepting the next. This control flow exists; occurrence during the user's
symptom is unproven. Finite-distance quad reprojection also differs from
projection submission, but a shared plane does not explain a fovea-only depth
effect by itself. No speculative geometry or eye-refresh change was made.

Next evidence: exact versionName/versionCode, patch selections, APK/payload
provenance and `GXRStockQuad` logcat covering the symptom. Inspect
`stock_quad_passthrough`, `stock_quad_disabled`, the initial `stock_quad_frame`
geometry, and the teardown `stock_quad_summary`. Passthrough totals include
startup, non-visible and unrelated frames: nonzero totals alone do not prove
steady-stream topology switching, and reject reasons log only once per session.
Then compare otherwise identical clean APKs with Stock quad composition selected
versus deselected, keeping Network Optimizations deselected in both. This needs
the affected headset; no device changes or A/B were performed here.

Network Optimizations is now optional, default-off on all seven exact bases.
This changes future default selection, not previously patched APKs. Its existing
native mutations and compatibility guards are unchanged; this recommendation
change is not evidence that networking caused either symptom.

Initial audit limit: a usable native toolchain had not yet been located. A later
search found retained MSVC, Zig, CMake and Android NDK tooling; both baseline
native test executables passed before the composition correction. Gradle tests
and packaging remain separate evidence, not headset proof.

## 2026-11-09: stock failure-path evidence and approved correction contract

Stock 5002527 constructs quads in its native renderer, rather than converting
projections at `xrEndFrame`. `XrSceneStream::Render` copies its persistent stream
layer pointers only when `BStreamSwapchainsSetup()` succeeds. Otherwise it still
calls `xrEndFrame` once with overlay layers, or zero layers. A negative runtime
result is logged and `Render` returns false; no persistent conversion-disable
flag was found. The caller's handling of that false result remains untraced.

The focused-state entry populates persistent quad pointers. An early `FlipFrame`
return can leave their earlier contents intact; it does not necessarily produce
an empty stream. Eye-cache refresh frequency also remains untraced. Therefore a
conversion-layer correction must not claim exact native-renderer failure,
buffer-lifecycle or timing equivalence.

The owner approved removing projection fallback, preserving real runtime errors
and introducing no synthetic errors. The correction contract is: convert valid
stream input to four quads; on conversion failure remove stream projections and
preserve unrelated overlays; submit exactly once; never restore projections,
replay cached quads or permanently disable conversion after a rejected frame.
This uses the stock no-stream submission pattern, not a proven native stream-stop
mechanism. Headset validation remains outstanding.

Reference disassembly is retained beside `compare-5002527-audit/REPORT.md`:
`new_XrSceneStream_Render.asm`, `new_XrSceneStream_Focused.asm`,
`new_GetStreamLayers.asm`, `new_FlipFrame.asm` and
`new_GetEyeToHeadTransform.asm`.

### Corrected payload and local verification

The canonical layer now converts or strips projections in tracked target
sessions. It no longer bypasses conversion based on visibility, permanently
disables after eye-location failures, or restores projections after runtime
rejection. Geometry entry points may be unavailable without bypassing stripping;
missing core entry points retain downstream lookup errors rather than adding a
new instance-initialization error. Invalid frame structures and unknown handles
retain runtime validation. Other packages remain unchanged.

Shipped `libgxr_stock_quad.so`: 454568 bytes, SHA-256
`d2cd78acdb6072ee461fa3f5729087a7ad988b13399b90fa4d07d8e670afb964`.
The Kotlin payload pin matches. Built with retained NDK 28.2.13676358 / Clang
19.0.1, CMake 4.4.3 and Ninja, arm64-v8a / android-29 / Release. ELF inspection
found AArch64 shared-library ABI and only
`xrNegotiateLoaderApiLayerInterface` exported. Builds in different directories
were not byte-identical; the pin identifies this artifact, not a reproducible
build claim.

Both production-source native test executables passed, exit 0, no skips: ten core
test functions and 22 named layer test groups, including a 2000-round randomized
no-projection invariant and 400 alternating accepted/rejected frames. These are
host fakes, not runtime evidence. Logs remain under
`../builds/steamlink-patches/extensions/stock-quad-composition/build-host-current/`.

Local Gradle command:

```powershell
.\gradlew.bat :patches:test :patches:buildAndroid :patches:generatePatchesList -PreleaseChannel=stable --console=plain
```

Exit 0; test XML: 255 total, 232 executed, 23 skipped, zero failures/errors.
Android packaging and all catalogs generated successfully. The log is retained
at `../builds/steamlink-patches/extensions/stock-quad-composition/gradle-verification.log`.
The nested duplicate extension tree was not edited; the rebuilt payload uses
the canonical top-level extension source. None of these checks establishes that
the reported flicker or perceived depth issue is resolved on a headset. Base
5002395 still lacks a pristine APK for end-to-end apply evidence.

Fresh-checkout verification of the changed tracked files also passed the same
test/package/catalog graph with an isolated `verificationWorkDirectory`: 255
total, 207 executed, 48 skipped, zero failures/errors. The extra skips are absent
decoded fixtures. Evidence and copied work remain under
`../builds/steamlink-patches/build/verification/validation-stock-quad-network-20261109-run4/`;
the earlier `run2`/`run3` setup attempts are retained, not used as passing evidence.

Cleanup preview and apply found zero removable targets (0 bytes removed).
Receipt `../builds/steamlink-patches/_cleanup/steamlink-residue-20261109-101332.json`
reports `passed`, no errors and 12 protected entries; nine stock/decoded APK
inputs remain. Verification checkouts, logs, native build evidence and source
payloads were retained. No commit, push, release or headset change was made.
