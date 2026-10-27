# Surface video + trigger (2026-10-25)

Source of `libgxr_surface_video_trigger.so`, installed by the default-off
experimental patch **Surface video + trigger (experimental)** for exact Steam Link
**2.0.20/5001712** only.

This experiment follows the standard-codec presentation path, not the ASTC path.
HEVC, AV1 and H.264 all use a hardware decoder. The reference player presents the
decoder result through an `XR_KHR_android_surface_swapchain` Surface, while Steam
Link decodes into an `AImageReader` and then imports the `AHardwareBuffer` into
EGL/GL before submitting ordinary projection layers. This layer tests whether
presenting Steam Link's already-rendered video through Android Surface swapchains,
with the proven terminal trigger quad, is what selects the Galaxy XR fast path.

## What it changes

For the exact two-projection frame:

1. Each Valve projection image is copied 1:1 into an Android Surface swapchain of
   the same size and alpha. The experiment is limited to sRGB8 source swapchains;
   RGB10 and FP16 frames pass through unchanged rather than being narrowed. No
   atlas reconstruction, no resampling of the fovea, and no ASTC.
2. The two projection views are re-pointed at the Surface swapchain images.
3. A 2×2 fully transparent Android Surface quad is appended as the terminal
   trigger, using the same 1 mm at 1 m placement as the Alpha-0 patch.

The submission is therefore:

```
Surface-backed projection 0
Surface-backed projection 1
2x2 transparent trigger quad
```

Valve's per-layer `XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB` chains and the
frame-level `next` chain are preserved on the replacement layers, not dropped.

The layer only converts a frame with exactly two projection layers. Any other
shape passes through unchanged. A transfer or runtime rejection disables the
layer for the rest of the session and leaves later frames untouched.

This is a GPU copy bridge, not a direct decoder bypass. It does not reproduce the
reference player's decoder-to-Surface handoff; it tests the presentation mechanism
that both standard-codec and ASTC paths have in common, without ASTC.

## Logcat

Tag: `GXRSurfaceVideoTrigger`. One JSON-free line per event, including:

- `session_ready` / `session_passthrough`
- `surface_created`
- `swapchain_unsupported` (non-sRGB8 or unsupported layout; that swapchain passes through)
- `trigger_ready`
- `video_buffer_queued`
- `surface_video_frame` (first three accepted frames)
- `surface_frame_rejected`
- `transfer_failed_passthrough`

## Build

```powershell
$cmake = "..\builds\steamlink-patches\build\tooling\cmake\data\bin\cmake.exe"
$ndk = (Resolve-Path ".android-sdk\ndk\27.2.12479018").Path
$out = "..\builds\steamlink-patches\extensions\surface-video-trigger\build-android"
& $cmake -S extensions\surface-video-trigger -B $out -G Ninja `
  "-DCMAKE_TOOLCHAIN_FILE=$ndk\build\cmake\android.toolchain.cmake" `
  "-DOPENXR_SDK_SOURCE_DIR=..\builds\steamlink-patches\extensions\controller-velocity-layer\build-android\_deps\openxr_headers-src" `
  -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DANDROID_STL=c++_static `
  -DCMAKE_BUILD_TYPE=Release
& $cmake --build $out --config Release
```

Host tests cover the pure frame-preparation and image-ownership logic.

## Selection

Use the Morphe experimental catalog. Select **Surface video + trigger** and leave
**Alpha-0 high-resolution trigger** deselected; both append a terminal trigger and
the installer rejects the combination. Use a clean source APK.

Headset validation is pending. The layer changes presentation only; it does not
change decoder codec selection, host render resolution or stream bitrate.
