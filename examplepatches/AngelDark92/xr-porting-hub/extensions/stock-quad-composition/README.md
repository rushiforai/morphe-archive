# Stock-equivalent quad composition layer (experimental)

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
and the frame info (`next`, `displayTime`, blend mode) are preserved. Frames that are already quads
(stock 5002527) or any other shape are forwarded untouched.

Geometry (`src/stock_quad_core.h`, golden-tested): `d = 1.996000051498413`,
`orientation = headQ * eyeQ`, `position = headPos + Rhead * (eyePos + Reye * (d*(tanL+tanR)/2, d*(tanU+tanD)/2, -d))`,
`size = (d*(tanR-tanL), d*(tanU-tanD))`. The head pose is the original view's pose; the eye offset comes
from `xrLocateViews(PRIMARY_STEREO)` in the layer's own VIEW space at `displayTime`, cached per session.

## Multiple instances

State is per `XrInstance`: each instance owns its downstream dispatch table and active flag
(`InstanceState`), kept in a mutex-guarded map that is touched only by lifecycle calls. Each tracked
session holds its owning instance, so `xrEndFrame`/`xrDestroySession`/`xrLocateViews` reach the right
downstream functions without any process-global dispatch. `xrPollEvent` only updates sessions of the
polling instance. `xrDestroyInstance` removes and releases only its own sessions. A null or unknown
instance has no downstream chain: `xrGetInstanceProcAddr` (other than for the layer's own entry
point) and the instance-taking hooks return `XR_ERROR_HANDLE_INVALID`. A session handle value that is
already live in another instance is refused (`XR_ERROR_RUNTIME_FAILURE`, logged) instead of stolen; a
destroyed/untracked session is forwarded only when exactly one active instance exists, otherwise
`XR_ERROR_HANDLE_INVALID`. A missing core entry point makes only that instance a pass-through; a
missing downstream `xrDestroyInstance` or a malformed negotiation chain fails creation.

## Fail-closed behaviour

* Rejected shape / locate failure before submission: original `xrEndFrame` exactly once, next valid frame converts again.
* Converted `xrEndFrame` error: that error is returned, no second submission, converting is disabled for the session.
* 60 consecutive eye-locate failures disable the session. Conversion only while the session is VISIBLE/FOCUSED.
* Output is bounded by `kMaxOutputLayers` (16) and the runtime `maxLayerCount` (0 = unknown = reject).
* Steady state: no allocation, no logging. Logged: layer init, session create, eye offsets once, first 3 converted frames,
  each distinct pass-through reason once, every disable, summary at session destroy.

## Build and test (output stays outside the repository)

Host tests compile the production header and layer source with fakes for the runtime:
`tests/stock_quad_core_tests.cpp` (pure geometry/shape) and `tests/stock_quad_layer_tests.cpp` (lifecycle).
Android: `cmake -S . -B <external>/build-android -DCMAKE_TOOLCHAIN_FILE=<ndk>/build/cmake/android.toolchain.cmake -DANDROID_ABI=arm64-v8a -DANDROID_PLATFORM=android-29 -DOPENXR_SDK_SOURCE_DIR=<openxr 1.1.43>`.
