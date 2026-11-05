# Surface video + trigger experiment (retired 2026-10-27)

**Retired and removed at the owner's request.** The user reported that it did
not produce high resolution. Static investigation found and corrected the
layer/frame-`next` pass-through bug, but no post-correction headset evidence
exists. This record retains the historical rationale only; the selectable patch,
native source, tests, helper and manifest are removed.

The original experiment tested the standard-codec presentation path on exact
Steam Link **2.0.20/5001712**, without ASTC and without quad conversion.

## 2026-10-25 — first runtime blocker found and fixed

The first build of this layer never converted a frame. Steam Link 2.0.20/5001712
attaches a non-null `next` chain (`XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB`) to both
projection layers, and the helper rejected any non-null layer `next`. It also
rejected a non-null frame `next` used by local dimming. The helper now preserves
both chains, copies them into the Surface-backed projection layers/frame, and
creates the trigger at session creation. This was a pass-through bug, not a
runtime rejection; the corrected helper is included in `patches-2.3.0-dev.2.mpp`.

## Why this path

The reference app's non-ASTC path uses MediaCodec for HEVC, AV1 and H.264. Its native
`XrApp::ProvideSurfaceWindow` creates an `XR_KHR_android_surface_swapchain` via
`xrCreateSwapchainAndroidSurfaceKHR`, converts the swapchain image to a Java
Surface, and gives the resulting `ANativeWindow` to MediaCodec. The decoder writes
directly into the runtime-presented Surface.

Steam Link's `QSVLCodecNDK::Init` instead creates an `AImageReader` and configures
MediaCodec into that reader. `QSVLRendererXR::FlipFrame` acquires the `AImage`,
imports its `AHardwareBuffer` into EGL, renders it into Valve's own projection
swapchain, and submits ordinary projection layers. It never presents a runtime
Surface.

The new layer is the closest contained test: it keeps Steam Link's renderer and
decoder, but copies the rendered projection views into Android Surface swapchains
and appends the terminal trigger that the retired Surface-video experiment lacked.

## Artifacts

| File (historical, removed from source) | Size | SHA-256 |
|---|---:|---|
| `libgxr_surface_video_trigger.so` | 407,104 | `1e223bfec56fc3e39355a5fda25464fc54d45887d98e8591884b1f4d80c8b384` |
| `XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json` | 392 | `328d54a019fb1263a8fc76f3b35a3e23bcaa1ec66725b3d52775b62d3fe1b8fa` |

Build ID: `surface-video-trigger-2proj-v1.0-20261025`.

## Evidence classes

| Class | Status |
|---|---|
| Source/static inspection | Complete: non-ASTC `ProvideSurfaceWindow` Surface path and Steam Link `AImageReader` path |
| Host integration tests | PASS: frame preparation, all-or-original readiness, pose/FOV/alpha/rect preservation, image ownership and timeout ordering |
| Kotlin/unit tests | PASS: `:patches:test` 217 executed, 16 skipped, 0 failed |
| Compilation/packaging | PASS at the time: helper and manifest were present in `patches-2.3.0-dev.1.mpp` |
| Headset/runtime | **Failed:** the owner reported no high resolution. The 1:1 copy preserved Valve's source extent and the trigger was conditional on all four copies. |

## Runtime check

```powershell
adb logcat -c
adb logcat -s GXRSurfaceVideoTrigger
```

Expected: `surface_created`, `trigger_ready`, `video_buffer_queued`, then
`surface_video_frame` for the first three accepted frames. A
`surface_frame_rejected` or `transfer_failed_passthrough` result means the layer
stood down; later frames should pass through.

## Boundary

This is a copy bridge. It does not reproduce the reference player's direct
decoder-to-Surface handoff and does not change the codec or host render size. If
it stays low-resolution, the next step is a decoder-output redirect, not another
quad or trigger variant.
