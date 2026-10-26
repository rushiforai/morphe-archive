# Surface video + trigger experiment (2026-10-25)

One default-off experimental patch tests the standard-codec presentation path on
exact Steam Link **2.0.20/5001712**, without ASTC and without quad conversion.

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

| File | Size | SHA-256 |
|---|---:|---|
| `patches/src/main/resources/steamlink/androidxr/libgxr_surface_video_trigger.so` | 407,104 | `4fef35515bdd8b0d4b32ebc3a79667a748329ead1153188b688b76dab1ae7c79` |
| `patches/src/main/resources/steamlink/androidxr/XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json` | 392 | `328d54a019fb1263a8fc76f3b35a3e23bcaa1ec66725b3d52775b62d3fe1b8fa` |

Build ID: `surface-video-trigger-2proj-v1.0-20261025`.

## Evidence classes

| Class | Status |
|---|---|
| Source/static inspection | Complete: non-ASTC `ProvideSurfaceWindow` Surface path and Steam Link `AImageReader` path |
| Host integration tests | PASS: frame preparation, all-or-original readiness, pose/FOV/alpha/rect preservation, image ownership and timeout ordering |
| Kotlin/unit tests | PASS: `:patches:test` 217 executed, 16 skipped, 0 failed |
| Compilation/packaging | PASS: helper and manifest present in `patches-2.3.0-dev.1.mpp` |
| Headset/runtime | **Pending.** No frame has been presented through this layer yet. |

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
