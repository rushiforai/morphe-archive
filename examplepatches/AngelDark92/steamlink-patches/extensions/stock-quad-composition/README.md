# Stock-style quad composition layer (experimental)

Separate OpenXR API layer that reproduces the Steam Link 5002527 submission from the projection
layers older Steam Link bases submit. It is not the Alpha-0 trigger and shares no code, library or
manifest name with Alpha-0 or any retired quad mode. Static/host evidence only: there is no headset
proof that the Galaxy XR runtime accepts the converted frame or that it raises resolution.

| Item | Value |
|---|---|
| Library | `libgxr_stock_quad.so` (arm64-v8a, only export `xrNegotiateLoaderApiLayerInterface`) |
| Manifest | `manifest/XR_APILAYER_local_GalaxyXR_stock_quad_v1.json` (`GXR_DISABLE_STOCK_QUAD` disables) |
| Log tag / build id | `GXRStockQuad` / `stock-quad-5002527-v1` |
| Package guard | `/proc/self/cmdline` must equal `com.valvesoftware.steamlinkvr`, otherwise the layer is a pure pass-through |

## What it converts

Leading projection layers of one `xrEndFrame`:

* 2 projections `[base, fovea]` (5001712, 5001812, 5001968)
* 3 projections `[underside, base, fovea]` (5002244, 5002363, 5002395); the never-drawn underside is dropped

into `[baseL, baseR, foveaL, foveaR]` quads: flags `0/0/6/6`, `eyeVisibility` `1/2/1/2`, each family keeps
its original `XrCompositionLayerSettingsFB` pointer, `space`, `subImage`. Tail layers (fade quads)
and the frame info (`next`, `displayTime`, blend mode) are preserved. Frames that carry no projection
layer (stock 5002527 quads, overlay-only, empty) are forwarded untouched.

## No projection fallback

For the target package a tracked session never forwards a projection layer to the runtime. If a frame
carries projections but cannot be converted this frame (unsupported shape, projection after the
tail, null entry, layer cap exceeded or unknown, eye offsets not located, no VIEW space, quad build
failure) it is submitted without them: every projection and null entry is removed and the remaining
layers (overlays, fade quads) keep their order, `next`, `displayTime` and blend mode. The next frame
tries the quads again. This is the stock-like contract (quads-only stream submission, no projection
restore, no retry within a frame, no manufactured success, no permanent disable); it is not a port of
the native renderer and its exact internal timing or failure handling is unverified.

* `xrEndFrame` is called downstream exactly once per application frame and the runtime's own
  `XrResult` is returned unchanged, including a runtime rejection of the quads (logged once as
  `end_frame_rejected`; no retry, no disable, no fallback).
* Visibility is not consulted: there is no session-state bypass and `xrPollEvent` is no longer hooked.
* Eye offsets are located once and cached, as before; a failed locate is retried next frame and never
  disables the session.
* Structurally invalid frames (wrong type, missing layer array) and untracked session handles keep
  the previous behaviour: forwarded unchanged so the runtime reports its own error.
* A stripped frame needs the list of kept layers: a per-session scratch vector sized to the input
  frame. If that allocation ever failed the frame is submitted with no layers rather than with any
  projection.
* `xrCreateSession`, `xrDestroySession` and `xrEndFrame` are each loaded and hooked independently, and
  only when the downstream runtime has them. A missing one is never invented and never turns into a
  layer-made error: instance creation keeps the runtime's result and the lookup is delegated so the
  runtime reports its own error. Missing `xrDestroySession` does not suppress create/endFrame
  tracking (our VIEW space is then released at `xrDestroyInstance`). Residual limitation for an
  invalid runtime: without `xrCreateSession` no session can exist, so nothing is tracked and a stray
  `xrEndFrame` handle is forwarded unchanged. Missing `xrGetSystemProperties`,
  `xrCreateReferenceSpace`, `xrDestroySpace` or `xrLocateViews` only disables conversion: such
  sessions strip every projection frame.
* Other packages and an unreadable cmdline remain a pure pass-through.

Geometry (`src/stock_quad_core.h`, golden-tested): `d = 1.996000051498413`,
`orientation = headQ * eyeQ`, `position = headPos + Rhead * (eyePos + Reye * (d*(tanL+tanR)/2, d*(tanU+tanD)/2, -d))`,
`size = (d*(tanR-tanL), d*(tanU-tanD))`. The head pose is the original view's pose; the eye offset comes
from `xrLocateViews(PRIMARY_STEREO)` in the layer's own VIEW space at `displayTime`, cached per session.

## Multiple instances

State is per `XrInstance`: each instance owns its downstream dispatch table and active flag
(`InstanceState`), kept in a mutex-guarded map that is touched only by lifecycle calls. Each tracked
session holds its owning instance, so `xrEndFrame`/`xrDestroySession`/`xrLocateViews` reach the right
downstream functions without any process-global dispatch. `xrDestroyInstance` removes and releases only its own sessions. A null or unknown
instance has no downstream chain: `xrGetInstanceProcAddr` (other than for the layer's own entry
point) and the instance-taking hooks return `XR_ERROR_HANDLE_INVALID`. A session handle value that is
already live in another instance is refused (`XR_ERROR_RUNTIME_FAILURE`, logged) instead of stolen; a
destroyed/untracked session is forwarded only when exactly one active instance exists, otherwise
`XR_ERROR_HANDLE_INVALID`. A non-target instance is a pure pass-through; a missing downstream
`xrDestroyInstance` or a malformed negotiation chain fails creation.

## Failure behaviour

* Unconvertible projection frame or locate failure: submitted once without projections (see above); the next frame converts again.
* Runtime error on `xrEndFrame`: returned unchanged, no second submission, no disable, no projection fallback.
* No consecutive-failure limit and no visibility gate.
* Conversion output is bounded by `kMaxOutputLayers` (16) and the runtime `maxLayerCount` (0 = unknown, so every frame is stripped).
* Steady state: no allocation after the first frame of a given size, no logging. Logged: layer init, session create, eye offsets once,
  first 3 converted frames, each distinct strip reason once (`stock_quad_stripped`), `end_frame_rejected` once,
  `view_space_failed`, summary at session destroy (converted / stripped / runtime-rejected counts).

## Build and test (output stays outside the repository)

Host tests compile the production header and layer source with fakes for the runtime:
`tests/stock_quad_core_tests.cpp` (pure geometry/shape/stripping) and `tests/stock_quad_layer_tests.cpp` (lifecycle,
stripping, deterministic randomized frame invariant). `stock_quad_layer.cpp` uses GCC/Clang attributes: build the layer
test with clang/gcc or `zig c++ -std=c++17 -target x86_64-windows-gnu`, not MSVC.
Android: `cmake -S . -B <external>/build-android -DCMAKE_TOOLCHAIN_FILE=<ndk>/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DOPENXR_SDK_SOURCE_DIR=<openxr 1.1.43>`.
