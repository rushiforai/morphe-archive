# Patch Catalog — steamlink-patches

Reference for conflict detection when importing external patches.
Each entry lists the exact APK artifact and value(s) a patch writes or modifies.

Steam Link 2.0.20 build 5001740 is an exact static-analysis legacy target with its own guarded native layout. Its available source is a reconstruction from a malformed hybrid APK; pristine-APK Morphe patching, installation, and headset runtime validation remain pending.
Steam Link 2.0.22 build 5002318 exposes Device identity, Microphone input preset, OLED color calibration,
the legacy Appear on top fallback, GXR face bridge, Visual Delay Fix, Unrestricted battery usage, and Video dither.
Build 5002322 recommends the Galaxy XR high-resolution 3-projection fix, GXR face bridge,
Microphone input preset, Unrestricted battery usage, Video dither, and Visual Delay Fix. Appear on
top is excluded from this build, and the single-projection reconstruction experiments are retired.

Morphe Manager 1.7 cannot distinguish builds that share versionName `2.0.22`; build-code
filtering requires Manager 1.22 or newer with compatibility checks enabled. Expert mode may
still display incompatible patches by design. Morphe has only a global patch `default` flag, so exact
compatibility filtering excludes Appear on top, Device identity, and the standalone OLED patch from
5002322. Appear on top remains selectable through 5002318 but is no longer recommended on any build.
Video dither still executes its coupled OLED calibration dependency. Legacy-only patches default off.

---

## androidxr group

### XR Core Runtime (`xrCoreRuntimePatch`)
**Default: disabled** (legacy builds only)
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_xr_bridge.so` | New file (Galaxy XR OpenXR runtime bridge) |
| `res/drawable-anydpi/ic_launcher_background.xml` | Full replace |
| `res/drawable-anydpi/ic_launcher_background_gradient.xml` | New file (resource ID 0x7f010000) |
| `res/values/public.xml` | Full replace (stable IDs: ic_launcher_background_gradient=0x7f010000, ic_launcher=0x7f010001/0x7f030000) |
| `res/values/ids.xml` | Create if missing (empty `<resources/>`) |
| Extension DEX (base APK) | Merges helper-only `extension.mpe`, which defines `GxrSdlBridge`; existing SDL/controller classes are edited only by the legacy build-aware bytecode step |

Sub-patch only (not exposed): `disablePermissionPromptNativePatch`
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x142a9c` (5001740), `0x1422c4` (5002244), or `0x1472a8` (5002313) | 8 bytes: replaces `RequestAndroidPermissions()` prologue with `movz w0,#1; ret`; 5002318, 5002322, and unknown layouts are preserved |

---

### XR Device Config Baseline (`xrDeviceConfigBaselinePatch`)
**Default: disabled** (legacy builds only) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` | Full replace — Galaxy XR HMD identity (sSerialNumber=VRLINKHMDGALAXYXR, sManufacturerName=Samsung, sModelNumber=Galaxy XR, sControllerType=galaxy_xr_hmd, requestedExtensions=[XR_EXT_eye_gaze_interaction]) |
| `assets/config/controller_config.json` | Full replace — /interaction_profiles/oculus/touch_controller static props + pose action offset + input/haptic action bindings |
| `assets/config/default_config.json` | Full replace — `preflight.ignore_microphone_muted = false` |
| `assets/webui/dash/index.html` | Full replace — Steam Link dashboard HTML bootstrap |

---

### XR Manifest Capability Pack (`xrManifestCapabilityPackPatch`)
**Default: disabled** (legacy builds only) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-sdk@android:minSdkVersion` | Set to `29` |
| `AndroidManifest.xml` `uses-sdk@android:targetSdkVersion` | Set to `36` |
| `AndroidManifest.xml` `uses-sdk@android:maxSdkVersion` | Removed |
| `AndroidManifest.xml` `uses-permission` | Removes all `com.oculus.permission.*` and `com.picovr.permission.*` entries |
| `AndroidManifest.xml` `uses-feature` | Removes all `oculus.software.*` and `com.oculus.feature.*` entries |
| `AndroidManifest.xml` `meta-data` | Removes all `com.oculus.*`, `com.htc.vr.*`, `pvr.*`, `pxr.*`, `picovr.*` entries |
| `AndroidManifest.xml` `uses-native-library` | Removes `libopenxr_forwardloader.oculus.so` |
| `AndroidManifest.xml` `category` | Removes `com.oculus.intent.category.VR` and `com.oculus.intent.category.2D` |
| `AndroidManifest.xml` `uses-permission` | Adds: `org.khronos.openxr.permission.OPENXR`, `OPENXR_SYSTEM`, `android.permission.ACCESS_COARSE_LOCATION`, `ACCESS_FINE_LOCATION`, `HAND_TRACKING`, `EYE_TRACKING_FINE`, `FACE_TRACKING`, `BLUETOOTH_CONNECT` |
| `AndroidManifest.xml` `uses-feature` | Adds or normalizes: `android.hardware.vr.headtracking` (v1, required), `android.software.xr.api.openxr` (v0x10001, required), `android.hardware.xr.input.controller/hand_tracking/eye_tracking` (optional) |
| `AndroidManifest.xml` `queries/provider@android:authorities` | Adds `org.khronos.openxr.runtime_broker;org.khronos.openxr.system_runtime_broker` |
| `AndroidManifest.xml` `queries/intent` | Adds `org.khronos.openxr.OpenXRRuntimeService` and `org.khronos.openxr.OpenXRApiLayerService` intents |
| `AndroidManifest.xml` `application/uses-native-library@android:name` | Adds `libopenxr.google.so` (optional) |
| `AndroidManifest.xml` `application/property@android:name` | Adds `android.window.PROPERTY_XR_BOUNDARY_TYPE_RECOMMENDED = XR_BOUNDARY_TYPE_LARGE` |

---

### XR Launcher Bootstrap (`xrLauncherBootstrapPatch`)
**Default: disabled** (legacy builds only) — depends on `xrManifestCapabilityPackPatch`
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `application/activity@android:name` | Adds `com.valvesoftware.steamlink.GalaxyXRPermissionActivity` (exported=true, MAIN/LAUNCHER, 1280×800px layout) |
| `AndroidManifest.xml` direct `application/property` | Removes application-wide `android.window.PROPERTY_XR_ACTIVITY_START_MODE` (present in 5002313) before applying activity-specific modes |
| `AndroidManifest.xml` VR activity/property | Adds `android.window.PROPERTY_XR_ACTIVITY_START_MODE = XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED`; recognizes later `VRLink` or 5001740's `android.app.NativeActivity` with `android.app.lib_name=vrlink_scene` |
| `AndroidManifest.xml` VR activity/intent-filter/category | Adds `org.khronos.openxr.intent.category.IMMERSIVE_HMD` |
| `AndroidManifest.xml` `SteamLink activity/intent-filter` | Removes LAUNCHER intent-filter |
| `AndroidManifest.xml` `SteamLink activity/layout` | Sets `android:defaultWidth=1536.0px`, `android:defaultHeight=960.0px` |

---

### XR Input Routing Config (`xrInputRoutingConfigPatch`)
**Default: disabled** (legacy builds only) — depends on `xrLauncherBootstrapPatch`
| Artifact | Edit |
|---|---|
| `assets/config/ui_config.json` | Full replace — XR pointer aim/select bindings for touch_controller and hand_interaction_ext; haptic bindings |

---

### Controller Velocity Fix (`controllerVelocityPatch`)
**Default: disabled** (experimental) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_velocity.so` | New file with embedded config patched at magic `GXRVELCFG0000001` |
| `lib/arm64-v8a/libvrlink_scene.so` `QSVLClient::OnTopOfFrame` | Optional exact-layout AArch64 edits select stock 4×, evenly phased 2×, or display-rate 1× controller pose events while retaining the final type-2 frame-update event; verified layouts: versionCodes 5001712, 5001740, 5002206, 5002244, 5002313 |
| config block `+32` (int64 LE) | `maxDeltaMs × 1,000,000` nanoseconds — default 50 ms |
| config block `+40` (float32 LE) | `maxLinearSpeed` m/s — default 20.0 |
| config block `+44` (float32 LE) | `maxAngularSpeed` rad/s — default 50.0 |
| config block `+48` (float32 LE) | `smoothing` EMA weight — default 0.0 |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_velocity.json` | New file (OpenXR implicit API layer manifest; disable env: `GXR_DISABLE_CONTROLLER_VELOCITY`) |

**Option:** `poseSendCadence` — `stock-4x` (default), `half-2x`, or `display-1x`. Actual sends per second equal the active display rate multiplied by 4, 2, or 1. Non-stock modes fail closed on unrecognized native layouts.

---

### GXR Face Bridge (`gxrFacebridgePatch`)
**Default: enabled** — depends on the guarded permission bootstrap
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_face_bridge.so` | New file (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json` | New file (instance extension `XR_FB_face_tracking2`; disable env: `GXR_DISABLE_FACE_BRIDGE`) |
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.FACE_TRACKING` |

---

### Appear On Top (legacy) (`appearOnTopPatch`)
**Default: disabled; compatible only through build 5002318** — retained as an overlay-based fallback
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.SYSTEM_ALERT_WINDOW` (required for `GxrOverlayBridge` TYPE_APPLICATION_OVERLAY compositor window) |
| `AndroidManifest.xml` launcher | Adds/routes through `GalaxyXRPermissionActivity`; preserves the stock target SDK, XR features/categories, VRLink start mode, native permission routine, and controller config on supported builds through 5002318. Build 5002322 uses the final high-resolution fix instead. |
| Minimal extension DEX | Adds only `GalaxyXRPermissionActivity`, `GxrOverlayBridge`, and `GxrResolutionProbe`; contains no SDL/controller class fragments. |
| `SteamLink` lifecycle methods | Adds the overlay/resolution probe calls without modifying `SDLSurface`, `SDLControllerManager`, or generic-motion routing |

---

### Unrestricted Battery Usage (`unrestrictedBatteryUsagePatch`)
**Default: enabled** — uses the build-aware launcher foundation plus private minimal permission/settings bootstrap
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` |
| `GalaxyXRPermissionActivity` | Opens the app-specific Battery usage page at startup when not unrestricted; falls back to the direct exemption prompt, then app details |

---

### Galaxy XR high-resolution 3-projection fix (`xrGalaxyXrHighResolutionPatch`)
**Recommended/default enabled; stable exact 2.0.22/5002322 only** — replaces legacy `Appear on top`

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW`, adds unmanaged Full Space, and sets `GXR_RESOLUTION_MODE=android_surface_trigger_passthrough_v1` |
| `lib/arm64-v8a/libgxr_ast.so` | Implicit OpenXR API layer. Requests `XR_KHR_android_surface_swapchain` even when enumeration hides it, retries Valve's original instance create-info if rejected, and otherwise queues a nonzero-alpha `2x2` RGBA8888 Android `Surface` as a terminal quad after Valve's unchanged 3 projection pointers. |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json` | Registers the surface-trigger API layer; disable environment is `GXR_DISABLE_ANDROID_SURFACE_TRIGGER`. |

The output remains Valve's original 3 projections and 6 views, plus 1 nearly invisible quad. The layer performs no texture copy, shader draw, resampling, or 3-to-1 reconstruction. The independent trigger Surface does not alter Valve's source handles or formats, so future RGB10_A2 projection sources remain reserved for unchanged passthrough.

#### Headset validation

The 2026-09-01 accepted capture showed that the extension was hidden from enumeration but accepted
when explicitly requested: the function loaded, a 2x2 Surface was created and queued, and 4 sampled
`xrEndFrame` submissions preserved the original 3 projection pointers while successfully adding 1
terminal quad. No overlay permission, type-2038 Steam Link window, or recording contamination
existed. The headset palm A/B/A result was `MATCHES REFERENCE -> MATCHES REFERENCE -> MATCHES
REFERENCE`, establishing perceived parity with Valve's native 3-projection APK with Appear on top.

---

### Retired: Experimental Native Single-Projection Resolution + 10-bit Probe
**Removed after the 3-projection fix passed; historical implementation below**

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW`, uses unmanaged Full Space, and sets `GXR_RESOLUTION_MODE=single_projection_native_probe_v1`. |
| `lib/arm64-v8a/libvrlink_scene.so` | Exact-size, build-id, ELF-structure, original-byte, and already-patched guards redirect the verified 5002322 native call sites to `libgxr_nspp.so`. |
| `lib/arm64-v8a/libgxr_nspp.so` | CPU-optimized dual-format native reconstruction. Accepts Valve sRGB8 or RGB10_A2 sources, tries density-preserving, panel-native, then runtime-maximum output tiers, and submits one projection with two views. |

The helper traces source swapchains, recommended/maximum view sizes, allocation attempts and accepted output tier, 3-projection/6-view to 1-projection/2-view submission, GL attachment precision, MediaCodec/AHardwareBuffer observations, and successful `xrEndFrame`. RGB10_A2 is proven only through the app/OpenXR output when the source, scratch, output, and attachment contracts all remain 10/10/10/2; panel and private-compositor precision are still outside app telemetry.

The native probe is retired without further headset adjudication because the accepted 3-projection fix preserves Valve's renderer and avoids this experiment's full-resolution GPU reconstruction, private stereo allocation, synchronization, and CPU bookkeeping.

Its selectable patch, native hook implementation, CMake target, focused diagnostic, tests, and bundled `libgxr_nspp.so` are removed. Its mode and library identities remain reserved only for stale decoded-APK cleanup.

---

### Retired: Experimental Native Quad-View Zero-Copy Projection variants
**Removed after low-resolution headset results; 5002322 only**

Both the sRGB8-only and dual-format CPU+GPU variants submitted Valve's sources as 1 four-view projection without reconstruction GPU work, but both remained visibly low-resolution like the unpatched/no-overlay path. This rules them out as a high-resolution replacement. Their selectable patches, shared native source, and bundled `libgxr_nqv.so`/`libgxr_nqvd.so` artifacts have been removed. The mode and library identities remain reserved so active native patches reject stale decoded-APK contents.

---

### Retired: Experimental Single Projection Fovea Quads
**Removed after the 2026-08-30 headset run; 5002322 only**

The trace proved 5042 exact 3-projection/6-view to 1-projection/2-quad transforms with successful `xrEndFrame`, but the visual result stayed `LOW0 -> LOW -> LOW1` and was worse than the original two- and three-projection low path. Android compositor logs also recorded 284 missing-buffer acquisitions and 14 latch failures during this mode.

Projection views use pose/FOV ray mapping; spatial quads use a different compositor sampling path. Converting the foveal projections to kilometer-scale alpha quads therefore did not preserve sampling semantics, despite retaining their source handles and rectangles. The selectable Morphe patch and bundled APK artifacts have been removed. Its mode identity remains reserved only so the other projection patches can reject stale/conflicting decoded APK contents.

---

### Retired: Experimental Two Projection Drop Base
**Removed after low-resolution headset results; 5002322 only**

The mode forwarded the original underside plus alpha-foveated projections as 2 projections after dropping only the redundant base. It still selected the visibly low-resolution compositor path without `Appear on top`. The selectable patch, native source, and bundled APK artifacts have been removed; its mode identity remains cleanup-only for stale decoded APK contents. Historical evidence remains in `XR_RESOLUTION_EXPERIMENT_LOGS`.

---

### Retired: Experimental Three Projection Sampler Proxy
**Removed after low-resolution headset results; 5002322 only**

The mode preserved all 3 projections and replaced only the 6 source swapchain handles with controlled sampleCount-1 proxies. It still selected the visibly low-resolution compositor path without `Appear on top`. The selectable patch, native source, and bundled APK artifacts have been removed; its mode identity remains cleanup-only for stale decoded APK contents. Historical evidence remains in `XR_RESOLUTION_EXPERIMENT_LOGS`.

---

### TEST — Old Scene requestExit Bridge (`oldSceneRequestExitBridgePatch`)
**Default: disabled** (experimental adapter; standalone)
| Artifact | Edit |
|---|---|
| `smali/com/valvesoftware/steamlink/VRLink.smali` | Replaces `.method private native requestExit()V` with Java `finishAndRemoveTask()` bridge implementation |

---

## binary group

### Microphone Input Preset (`microphoneInputPresetPatch`)
**Default: enabled**

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | Replaces the verified AAudio input-preset `MOV W1` instruction with Voice Recognition by default |

Native layouts are independently pinned to build 5002318 size 2,277,488 at
`0xF3240` and build 5002322 size 2,283,400 at `0xF37E0`. Both validate the
surrounding load instruction and a supported original/already-patched preset;
unknown or mismatched native layouts fail closed. Older builds retain the
existing unique semantic signature matcher.

---

### Visual Delay Fix (`hmdOnlyPatch`)
**Default: enabled**
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` @ hook vaddr (version-specific) | 4 bytes: `ldr x2,[sp,#8]` → `B <PLT_cave_va>` (AArch64 unconditional branch to trampoline) |
| `lib/arm64-v8a/libvrlink_scene.so` @ PLT cave (last 32 B of first PT_LOAD) | 32 bytes: trampoline — original hook insn + MOVZ x16,low16(offsetNs) + MOVK x16,hi16(offsetNs),lsl#16 + ADD x2,x2,x16 + B hook+4 + NOP×3 |
| Velocity fields `[x19+28]` … `[x19+48]` (6× float/double) | Replaced with `STUR XZR` or `STR WZR` (zeroes PackedPose_t linear/angular velocity) |

**Option:** `offsetMs` — encodes as nanoseconds split across MOVZ/MOVK immediates; default 60, range 0–4000

**Version layouts (matched by `libvrlink_scene.so` file size):**
| versionCode | File size | Hook vaddr | PLT cave vaddr |
|---|---|---|---|
| 5001740 | 2,220,528 | `0x101378` | `0x20F0B0` |
| 5001712 | 2,221,072 | `0x1014E8` | `0x20F2D0` |
| 5002172 | 2,238,792 | `0xFD860` | `0x213370` |
| 5002206 | 2,239,920 | `0xFDD68` | `0x213820` |
| 5002244 | 2,251,920 | `0xFEAD8` | `0x2166B0` |
| 5002313 | 2,276,872 | `0x100B8C` | `0x21C770` |
| 5002318 | 2,277,488 | `0x100B0C` | `0x21C9D0` |
| 5002322 | 2,283,400 | `0x101154` | `0x21E0E0` |

---

### Native XR Compatibility Gates
**Default: disabled** (legacy builds only)
| Patch | 5001740 target(s) | 5002244 target(s) | 5002313 target(s) |
|---|---|---|---|
| Android XR native permission names | Exact strings at `0x9987A`, `0xA19DD` | Exact strings at `0x93952`, `0x9C10E` | Exact strings at `0x94B4F`, `0x9D861` |
| Force HMD initialization gates | `0xFFCB0`, `0xFFCB8` | `0xFD040`, `0xFD048` | `0xFF010`, `0xFF018` |
| Force lobby permission-state gate | `0x10D9A0` | `0x10B658` | `0x10E6C0` |
| Force stream XR gates | `0x1163F4`, `0x1163FC`, `0x1164B0` | `0x1140AC`, `0x1140B4`, `0x114168` | No fixed edit: 5002313 rewrote `XrSceneStream::Init`, so the old three gates have no safe one-to-one target |

All fixed edits validate their exact stock or already-patched instruction bytes before writing. Unknown native layouts are left unchanged.

---

### OLED Color Calibration / Output Precision (`oledCalibrationPatch`)
**Default: enabled through build 5002318; not independently compatible with 5002322**
> ⚠️ Shares the GLSL shader block in `libvrlink_scene.so` with `videoDitherPatch`. Dependency ordering runs OLED calibration first so dither selection cannot be overwritten. Swapchain-format editing is guarded to ARM64 versionCodes 5001740, 5002244, 5002313, 5002318, and 5002322.

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` GLSL block (1087 bytes at `#version 300 es` before `GL_OES_EGL_image_external_essl3`) | Full replace with calibrated `highp` shader and explicit `highp samplerExternalOES` |
| GLSL `pow(clamp(c,0,1), vec3(GAMMA))` | `gamma` option value (float) |
| GLSL `mix(vec3(luma), c, SATURATION)` | `saturation` option value (float) |
| GLSL D2020-approximating 3×3 color matrix | Fixed: `_valve1_d2020d709` (not user-configurable) |
| GLSL dither | Zero-centred per-channel noise using `UniDitherOffsets.rgb`; sRGB8 scale `0.00392` gives +/-0.5 output-code-step noise, while experimental RGB10_A2 retains `0.00073` |
| GLSL endpoint protection | Per-channel output-domain ramp preserves exact black/white and reaches full dither strength four codes from either output endpoint (`4/255` sRGB8, approximately `4/1023` linear RGB10_A2) |
| GLSL `DITHER_ENABLE` | `1.` when enabled; toggled to `0.` by `videoDitherPatch` without losing the selected scale |
| Two 5001740 instructions at `0x10a854`, `0x10a8c4` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002244 instructions at `0x10826c`, `0x1082dc`, `0x10834c` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002313 instructions at `0x10b2d4`, `0x10b344`, `0x10b3b4` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002318 instructions at `0x10b430`, `0x10b4a0`, `0x10b510` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002322 instructions at `0x10ba78`, `0x10bae8`, `0x10bb58` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| RGB10_A2 shader output | Explicit sRGB EOTF converts calibrated code values to the linear OpenXR swapchain |

**Options:**
| Key | Default | Range | Target in binary |
|---|---|---|---|
| `profile` | `initial` | initial / final-balanced / custom | Selects gamma+saturation pair |
| `gamma` | `1.06` | 0.50–2.50 | `vec3(GAMMA)` argument in `pow()` |
| `saturation` | `1.12` | 0.00–3.00 | Second argument in `mix()` |
| `outputPrecision` | `srgb8-highp` | srgb8-highp / rgb10-a2-experimental | Selects shader transfer/dither scale and all three projection swapchain formats |

`srgb8-highp` is the default fallback whenever end-to-end ten-bit preservation is unproved. Host negotiation alone does not expose the Android decoder buffer or compositor precision. `rgb10-a2-experimental` is fail-closed: the patch requires the guarded 2,220,528-byte 5001740, 2,251,920-byte 5002244, 2,276,872-byte 5002313, 2,277,488-byte 5002318, or 2,283,400-byte 5002322 library layout, the unique shader/NUL boundary, every layout-specific instruction context, and a uniform current swapchain state. Galaxy XR OpenXR swapchain support and end-to-end Steam Link Main10/P010 preservation remain unverified; an unsupported format can prevent stream swapchain setup.

Static tests validate GLSL structure, fixed size, and binary placement but do not compile the shader with the Galaxy XR GLES driver. Successful on-headset shader compilation remains a runtime acceptance gate for both modes.

---

### Video Dither (`videoDitherPatch`)
**Default: enabled**
> ⚠️ Shares the GLSL shader block in `libvrlink_scene.so` with `oledCalibrationPatch`. Handles both stock and calibrated variants automatically.

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` GLSL (stock shader) | 2 bytes at `color.rgb += fract(...)*.00292`: `//` (disabled) ↔ `  ` (enabled) |
| `lib/arm64-v8a/libvrlink_scene.so` GLSL (legacy calibrated) | `*.00292` ↔ `*.00000` in expression `) - .5) * .00292;` |
| `lib/arm64-v8a/libvrlink_scene.so` GLSL (highp output variants) | `DITHER_ENABLE=1.` ↔ `DITHER_ENABLE=0.` while preserving scale `0.00392` or `0.00073` |

**Option:** `enable` (bool, default true)

---

## identity group

### Device Identity (`deviceIdentityPatch`)
**Default: enabled through build 5002318; not compatible with 5002322** — retains the legacy XR Core/device-config dependency, whose mutations are guarded off on native-XR builds

| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` (5002318/5002322, Galaxy profile) | Atomic targeted merge: upserts exact `unknown`, `xrvst2`, and `xrvst2ue` entries with stable Galaxy serial/model/device identity and `{galaxyxrresources}` input/render roots; unrelated extensions, profiles, offsets, and controller configuration are preserved |
| `assets/config/hmd_config.json` (5002318/5002322, Quest/Pico) | Changes only the runtime fallback model string |
| `assets/config/hmd_config.json` (legacy builds) | Retains the previously verified full profile-specific identity payload |

This intentionally preserves the native builds' requested extensions and vendor profiles. In particular,
`controller_config.json` remains byte-identical, retaining `XR_EXT_hand_interaction`,
`/interaction_profiles/ext/hand_interaction_ext`, and its hand grip/aim poses.

**Option `profile`:**
| Value | `sModelNumber` |
|---|---|
| `samsung-galaxy-xr` | Full Galaxy XR identity (default) |
| `stock-no-change` | Byte-identical stock identity |
| `meta-quest-pro` | `Oculus Quest Pro` |
| `pico-4-pro` | `PICO 4 Pro` |

---

### Change Package Name (`changePackageNamePatch`)
**Default: disabled**
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `manifest@package` | Set to new package name |
| `AndroidManifest.xml` `permission@android:name` | Prefix-replaced for custom permissions declared by this package |
| `AndroidManifest.xml` `uses-permission@android:name` | Prefix-replaced for custom permissions used by this package |
| `AndroidManifest.xml` `provider@android:authorities` | String-replaced for content provider authorities |
| `classes.dex` `SteamLink.startVRLink(String)` | Replaces the exact original-package `const-string` used to create the `android.app.NativeActivity` component; 5001740 contains one verified target, while builds without that literal remain unchanged |

**Option:** `packageName` — default appends `.gxr` to original; accepts any valid Java package name regex `^[a-z]\w*(\.[a-z]\w*)+$`

---

---

## Shared-file conflict matrix

| APK artifact | Patches that write to it |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | `disablePermissionPromptNativePatch` (layout-specific 8 B), native permission/gate patches, `hmdOnlyPatch` (hook + cave + velocity), `controllerVelocityPatch` (controller cadence instructions in `QSVLClient::OnTopOfFrame`), `oledCalibrationPatch` (1087-byte GLSL block plus three guarded swapchain instructions), `videoDitherPatch` (dither-state marker inside GLSL block) |
| `assets/config/hmd_config.json` | `xrDeviceConfigBaselinePatch` (baseline), `deviceIdentityPatch` (profile override — intentional) |
| `AndroidManifest.xml` | `xrManifestCapabilityPackPatch`, `xrLauncherBootstrapPatch`, `gxrFacebridgePatch`, `appearOnTopPatch`, `xrGalaxyXrHighResolutionPatch`, `changePackageNamePatch` |
| `lib/arm64-v8a/libgxr_ast.so` | `xrGalaxyXrHighResolutionPatch` |
| `res/values/ids.xml` | `androidXrLibPatch`, `controllerVelocityPatch`, `gxrFacebridgeLibPatch` (all: idempotent create-if-missing only) |

**Known intentional coupling:** `oledCalibrationPatch` rewrites the full GLSL block first; `videoDitherPatch` depends on it and then toggles the generated highp dither state. Its byte helper still recognises stock and legacy-calibrated states for guarded compatibility tests.
