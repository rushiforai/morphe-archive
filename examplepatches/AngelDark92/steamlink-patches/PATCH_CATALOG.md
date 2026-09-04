# Patch Catalog — steamlink-patches

Reference for conflict detection when importing external patches.
Each entry lists the exact APK artifact and value(s) a patch writes or modifies.

Steam Link 2.0.20 build 5001712 has an independently decoded base and exact guarded layouts for the permission prompt, legacy native gates, OLED/output precision, controller cadence, and Visual Delay Fix. These adaptations are statically validated; APK installation and headset runtime validation remain pending. Steam Link 2.0.20 build 5001740 is an exact static-analysis legacy target with its own guarded native layout. Its available source is a reconstruction from a malformed hybrid APK; pristine-APK Morphe patching, installation, and headset runtime validation remain pending.
Steam Link 2.0.20 build 5001712 and the other legacy recommendation bundle use the same 16
direct patches listed below. Steam Link 2.0.22 build 5002318 keeps its native-XR-safe 7-patch
recommendation, while build 5002322 recommends only 6 patches: GXR face bridge, Galaxy XR
high-resolution 3-projection fix, Microphone input preset (`voice-recognition`), OLED color
calibration (`final-balanced`, safe `srgb8-highp` output), Unrestricted battery usage, and Visual
Delay Fix (`60` ms). Appear on top is excluded from 5002322. Video dither is removed as a
selectable patch, and newly generated OLED shaders disable dithering.

Morphe Manager 1.7 cannot distinguish builds that share versionName `2.0.22`; build-code
filtering requires Manager 1.22 or newer with compatibility checks enabled. Expert mode may
still display incompatible patches by design. Morphe has only a global patch `default` flag, so 4
exact-build dependency bundles own all defaults while the individual patches remain default-off and
selectable wherever their verified compatibility permits. The legacy foundation bundle covers exact
builds 5001740, 5002172, 5002206, and 5002244. Builds 5002296 and 5002313 have no automatic
bundle. Appear on top and Change package name remain optional and are never recommended.

### Recommendation bundles

| Bundle | Exact targets | Direct patch set |
|---|---|---|
| `Galaxy XR recommended set (2.0.20/5001712)` | 2.0.20/5001712 | 16-patch legacy set below, including Device identity with Meta Quest Pro spoof |
| `Galaxy XR recommended set (2.0.22/5002322)` | 2.0.22/5002322 | Only the 6 final patches above |
| `Galaxy XR recommended set (2.0.22/5002318)` | 2.0.22/5002318 | Native-XR-safe 7-patch set: the same 6 final patches plus Device identity with Galaxy XR identity |
| `Galaxy XR legacy foundation (through 2.0.22/5002244)` | 2.0.20/5001740, 2.0.22/5002172, 2.0.22/5002206, 2.0.22/5002244 | Same 16-patch legacy set as 5001712, including Meta Quest Pro spoof; unavailable native adaptations remain guarded no-ops |

Both legacy bundles directly select:

1. Android XR native permission names
2. Force HMD initialization gates
3. Force lobby permission-state gate
4. Force stream XR gates
5. GXR face bridge
6. Galaxy XR high-resolution 3-projection fix
7. Microphone input preset (`voice-recognition`)
8. OLED color calibration (`final-balanced`, `srgb8-highp`)
9. Unrestricted battery usage
10. Visual Delay Fix (`60` ms)
11. XR Core Runtime
12. XR Device Config Baseline
13. XR Input Routing Config
14. XR Launcher Bootstrap (Home Space)
15. XR Manifest Capability Pack
16. Device identity (Recommended: Meta Quest Pro / `Oculus Quest Pro` model)

Leave **HMD identity** on **Recommended**, or explicitly choose **Meta Quest Pro**, for either
legacy bundle. Recommended resolves by exact version/build: 2.0.20/5001712 and 5001740, plus
2.0.22/5002172, 5002206, and 5002244 use `meta-quest-pro`. The 5002318 recommendation retains
Galaxy XR identity; 5002322 still does not select Device identity. Saved explicit Samsung, Stock,
or PICO choices remain respected and must be changed if the Quest spoof is wanted.

Device identity depends on XR Device Config Baseline, so the baseline runs before the identity
override. The legacy Quest payload preserves SamsungVST tracking, Galaxy XR controller and eye
routing; only the 3 runtime-selected HMD model values change to `Oculus Quest Pro`.
Private/transitive support dependencies are deduplicated by Morphe; the counts above describe
direct public selections, not all internal tasks.

Selecting a bundle never broadens verified build guards. The high-resolution helper and mode
metadata are not installed on 5001740, 5002172, or 5002206: their projection topology has no
verified adaptation. The 3 force-gate patches likewise have no verified native edit on 5002172 or
5002206 and leave those libraries unchanged. These bundles are not proof that every requested
feature works on every legacy build. Build 5002318 is native Android XR, not a legacy-conversion
target, and retains its separate native-safe set.

---

## androidxr group

### XR Core Runtime (`xrCoreRuntimePatch`)
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only)
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
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x142c0c` (2.0.20/5001712), `0x142a9c` (2.0.20/5001740), `0x1422c4` (2.0.22/5002244), `0x14478c` (2.0.22/5002296), or `0x1472a8` (2.0.22/5002313) | 8 bytes: replaces the exact `RequestAndroidPermissions()` prologue with `movz w0,#1; ret` |

Selection uses exact `(versionName, versionCode)` before checking the pinned library size. A known exact pair with the wrong size or bytes fails closed; a wrong/unknown pair is unchanged. Native-XR builds 5002318 and 5002322 return before reading the library. Build 5002296 reaches this internal patch only as a dependency of the exact high-resolution patch.

---

### XR Device Config Baseline (`xrDeviceConfigBaselinePatch`)
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` | Full replace — Galaxy XR HMD identity (sSerialNumber=VRLINKHMDGALAXYXR, sManufacturerName=Samsung, sModelNumber=Galaxy XR, sControllerType=galaxy_xr_hmd, requestedExtensions=[XR_EXT_eye_gaze_interaction]) |
| `assets/config/controller_config.json` | Full replace — /interaction_profiles/oculus/touch_controller static props + pose action offset + input/haptic action bindings |
| `assets/config/default_config.json` | Full replace — `preflight.ignore_microphone_muted = false` |
| `assets/webui/dash/index.html` | Full replace — Steam Link dashboard HTML bootstrap |

---

### XR Manifest Capability Pack (`xrManifestCapabilityPackPatch`)
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only) — depends on `xrCoreRuntimePatch`
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
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only) — depends on `xrManifestCapabilityPackPatch`
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
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only) — depends on `xrLauncherBootstrapPatch`
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
**Default: disabled individually; selected by all 4 recommendation bundles** — depends on the guarded permission bootstrap
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
**Default: disabled individually; selected by all 4 recommendation bundles** — uses the build-aware launcher foundation plus private minimal permission/settings bootstrap
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` |
| `GalaxyXRPermissionActivity` | Opens the app-specific Battery usage page at startup when not unrestricted; falls back to the direct exemption prompt, then app details |

---

### Galaxy XR high-resolution 3-projection fix (`xrGalaxyXrHighResolutionPatch`)
**Default: disabled individually; selected by all 4 recommendation bundles, but remains a guarded no-op on unsupported builds** — exact 2.0.20/5001712 and 2.0.22 builds 5002244, 5002296, 5002313, 5002318, and 5002322 only

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW`, adds unmanaged Full Space, and sets `GXR_RESOLUTION_MODE=android_surface_trigger_passthrough_v1` |
| `lib/arm64-v8a/libgxr_ast.so` | Release-built, stripped implicit OpenXR API layer selected by exact build. Build 2.0.20/5001712 copies Valve's 2 projection pointers, places the quad at index 2, and submits 3 layers. Supported 2.0.22 builds retain the existing 3-pointer, quad-at-index-3, 4-layer contract. |
| Bundled `libgxr_ast_5001712.so` | Exact 2.0.20/5001712 payload installed under the standard `libgxr_ast.so` name. It is never selected for a 2.0.22 target. |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json` | Registers the surface-trigger API layer; disable environment is `GXR_DISABLE_ANDROID_SURFACE_TRIGGER`. |

The output remains Valve's native projection layout plus 1 nearly invisible quad: 2 projections/4 views become 3 total layers only on 2.0.20/5001712; 3 projections/6 views become 4 total layers on the supported 2.0.22 builds. Every validation, pointer-copy, pointer-log, and projection telemetry loop uses the selected source count, preventing the delayed out-of-bounds layer-3 read on 5001712. The layer performs no texture copy, shader draw, resampling, or projection reconstruction. The independent trigger Surface does not alter Valve's source handles or formats, so future RGB10_A2 projection sources remain reserved for unchanged passthrough.

The production helpers are compiled with `-O2`, dead-section elimination, and stripped symbols. They do not intercept `xrWaitFrame`, perform no periodic per-frame log formatting, construct the immutable trigger quad once per session, fill the fixed source-pointer array during mandatory topology validation, and skip that validation while the trigger is inactive. Cold lifecycle evidence plus the 1st 3 accepted submissions remain available to validate topology.

The current CPU-only revisions are `android-surface-trigger-passthrough-v1.4-20260903` (3 projections) and `android-surface-trigger-5001712-v1.2-20260903` (2 projections). A generation-validated, non-owning thread-local render cache replaces per-frame shared-ownership acquisition/release. The registry owns live sessions; lifecycle mutations invalidate cached lookups, including reused handles. Safe frame use relies on OpenXR's externally synchronized session/instance destruction, not on the generation counter alone. Event readers retain owned lookups, and event dispatch now requires exactly `XR_SUCCESS`, so `XR_EVENT_UNAVAILABLE` cannot process stale event data. Bundle definitions need no duplicate fix: they already depend on the main resolution patch and receive its rebuilt helper. The same 6 exact version/build pairs and continuous terminal-quad submission remain unchanged; there is no GPU, resolution, or 10-bit behavior change intended, and no measured speed gain is claimed.

Host CTest checks of the actual registry and both 2-/3-projection helper integration paths passed. Both Android payloads rebuilt with NDK `27.2.12479018` and cached OpenXR `1.1.43` headers. Headset validation of these revisions remains pending. The accepted 2026-09-01 capture below belongs to the same append-only topology in an earlier helper and is prior behavioral evidence, not a runtime result for the new binaries.

For user A/B testing, retain the previous patch artifact and compare newly patched APKs from the same Steam Link base with identical patch options, host settings, and fixed scene. Check cold start, stream stop/restart, palm and DFR-UI transitions, and session/focus loss followed by resume. Report any sharpness change, crash, or failure to recover, alongside comparable CPU/GPU timings if available; lower GPU composition time is not an expected consequence of these CPU-only changes.

The 5001712, 5002244, 5002296, 5002313, and 5002318 decoded bases have exact metadata, recognized VRLink activities, and distinct recorded native sizes/hashes. Their resource, manifest, and dependency routing is statically validated. The user previously reported a corrected 5001712 `2 -> 3` APK surviving startup and the later frame-900 boundary after limiting telemetry to 2 source projections; the newly rebuilt payload in this repository has not been installed during this validation. The existing 2.0.22/5002322 headset evidence below is unchanged.

#### Headset validation

The 2026-09-01 accepted capture showed that the extension was hidden from enumeration but accepted
when explicitly requested: the function loaded, a 2x2 Surface was created and queued, and 4 sampled
`xrEndFrame` submissions preserved the original 3 projection pointers while successfully adding 1
terminal quad. No overlay permission, type-2038 Steam Link window, or recording contamination
existed. The headset palm A/B/A result was `MATCHES REFERENCE -> MATCHES REFERENCE -> MATCHES
REFERENCE`, establishing perceived parity with Valve's native 3-projection APK with Appear on top.

---

### Retired: Surface-backed underside projection

On 2026-09-03 the user reported that the exact 2.0.22/5002322 experiment "doesn't
work" and requested retirement. It substituted static black for the underside,
preserving 3 projections and omitting the terminal quad. This is a user-reported
failure; no new logs or GPU measurements were reviewed, and no cause is inferred.

The Android Surface placement option, native experiment, build target and bundled
`libgxr_ast_underside.so`/manifest are removed. The mode identity
`android_surface_underside_projection_v1` and library name remain only for stale
resource cleanup. The tested terminal-quad helpers and all existing compatibility
remain unchanged, including 2.0.20/5001712. Use a clean source APK with the current
high-resolution patch to return to the tested path.

---

### Retired: Galaxy XR DFR composition re-arm

The re-arm experiment proved that retaining the Android Surface is insufficient by itself. Removing
the terminal 2x2 quad immediately returned the stream to low resolution; each periodic reappearance
produced only 1 high-resolution frame before omission returned it to low resolution. The selectable
patch, DFR-specific native path, packaged helper, manifest, and diagnostics were removed. The final
fix submits the quad continuously on every eligible `xrEndFrame`.

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
**Default: disabled individually; selected by all 4 recommendation bundles**

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
**Default: disabled individually; selected by all 4 recommendation bundles**
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` @ hook vaddr (version-specific) | 4 bytes: `ldr x2,[sp,#8]` → AArch64 unconditional branch to the mapped trampoline |
| Non-allocated `.comment` payload + unique `PT_NOTE` header | Reuses the first 20 `.comment` bytes for the trampoline and converts the redundant note header into a page-aligned read/execute `PT_LOAD`. The live executable tail and PLT entries remain byte-for-byte unchanged. |
| Velocity fields `[x19+28]` … `[x19+48]` (6× float/double) | Replaced with `STUR XZR` or `STR WZR` (zeroes PackedPose_t linear/angular velocity) |

**Option:** `offsetMs` — encodes as nanoseconds split across MOVZ/MOVK immediates; default 60, range 0–4000

**Version layouts (matched by `libvrlink_scene.so` file size):**
| versionCode | File size | Hook vaddr |
|---|---|---|
| 5001740 | 2,220,528 | `0x101378` |
| 5001712 | 2,221,072 | `0x1014E8` |
| 5002172 | 2,238,792 | `0xFD860` |
| 5002206 | 2,239,920 | `0xFDD68` |
| 5002244 | 2,251,920 | `0xFEAD8` |
| 5002313 | 2,276,872 | `0x100B8C` |
| 5002318 | 2,277,488 | `0x100B0C` |
| 5002322 | 2,283,400 | `0x101154` |

---

### Native XR Compatibility Gates
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only)
| Patch | 2.0.20/5001712 target(s) | 2.0.20/5001740 target(s) | 2.0.22/5002244 target(s) | 2.0.22/5002313 target(s) |
|---|---|---|---|---|
| Android XR native permission names | Exact strings at `0x99924`, `0xA1A7F` | Exact strings at `0x9987A`, `0xA19DD` | Exact strings at `0x93952`, `0x9C10E` | Exact strings at `0x94B4F`, `0x9D861` |
| Force HMD initialization gates | `0xFFE20`, `0xFFE28` | `0xFFCB0`, `0xFFCB8` | `0xFD040`, `0xFD048` | `0xFF010`, `0xFF018` |
| Force lobby permission-state gate | `0x10DB10` | `0x10D9A0` | `0x10B658` | `0x10E6C0` |
| Force stream XR gates | `0x116564`, `0x11656C`, `0x116620` | `0x1163F4`, `0x1163FC`, `0x1164B0` | `0x1140AC`, `0x1140B4`, `0x114168` | No fixed edit: 5002313 rewrote `XrSceneStream::Init`, so the old three gates have no safe one-to-one target |

The independently decoded 5001712 layout is 2,221,072 bytes with stock SHA-256 `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495`. Every fixed layout is selected by exact `(versionName, versionCode)` and expected size, then validates all local stock or already-patched bytes before writing atomically. A wrong exact pair sharing a known size is unchanged. The permission-name patch retains its intentional unique-pattern fallback only for genuinely unknown sizes; fixed gate patches leave unknown layouts unchanged.

---

### OLED Color Calibration / Output Precision (`oledCalibrationPatch`)
**Default: disabled individually; selected by all 4 recommendation bundles and directly compatible with 5002322**
> Swapchain-format editing is guarded by exact version/build metadata and size for ARM64 versionCodes 5001712, 5001740, 5002244, 5002313, 5002318, and 5002322. There is no selectable Video dither patch; OLED calibration now generates `DITHER_ENABLE=0.`.

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` GLSL block (1087 bytes at `#version 300 es` before `GL_OES_EGL_image_external_essl3`) | Full replace with calibrated `highp` shader and explicit `highp samplerExternalOES` |
| GLSL `pow(clamp(c,0,1), vec3(GAMMA))` | `gamma` option value (float) |
| GLSL `mix(vec3(luma), c, SATURATION)` | `saturation` option value (float) |
| GLSL D2020-approximating 3×3 color matrix | Fixed: `_valve1_d2020d709` (not user-configurable) |
| GLSL dither | Dormant zero-centred per-channel noise using `UniDitherOffsets.rgb`; preserved scales are `0.00392` for sRGB8 and `0.00073` for experimental RGB10_A2 |
| GLSL endpoint protection | Dormant dither ramp preserves exact black/white and reaches full strength 4 codes from either output endpoint (`4/255` sRGB8, approximately `4/1023` linear RGB10_A2) if explicitly re-enabled in a local source fork |
| GLSL `DITHER_ENABLE` | `0.` by default; no Morphe option. Developer-only local opt-in instructions below preserve the selected scale and output precision |
| Two 5001712 instructions at `0x10a9c4`, `0x10aa34` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Two 5001740 instructions at `0x10a854`, `0x10a8c4` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002244 instructions at `0x10826c`, `0x1082dc`, `0x10834c` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002313 instructions at `0x10b2d4`, `0x10b344`, `0x10b3b4` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002318 instructions at `0x10b430`, `0x10b4a0`, `0x10b510` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| Three 5002322 instructions at `0x10ba78`, `0x10bae8`, `0x10bb58` | `GL_SRGB8_ALPHA8` (`69 88 91 52`) or experimental `GL_RGB10_A2` (`29 0B 90 52`) |
| RGB10_A2 shader output | Explicit sRGB EOTF converts calibrated code values to the linear OpenXR swapchain |

**Options:**
| Key | Default | Range | Target in binary |
|---|---|---|---|
| `profile` | `final-balanced` | initial / final-balanced / custom | Selects gamma+saturation pair |
| `gamma` | `1.20` | 0.50–2.50 | Custom-profile `vec3(GAMMA)` argument in `pow()` |
| `saturation` | `1.45` | 0.00–3.00 | Custom-profile second argument in `mix()` |
| `outputPrecision` | `srgb8-highp` | srgb8-highp / rgb10-a2-experimental | Selects shader transfer/dither scale and every layout-specific projection swapchain format |

`srgb8-highp` is the default fallback whenever end-to-end ten-bit preservation is unproved. Host negotiation alone does not expose the Android decoder buffer or compositor precision. `rgb10-a2-experimental` is fail-closed: the patch requires the exact guarded 2,221,072-byte 2.0.20/5001712, 2,220,528-byte 2.0.20/5001740, 2,251,920-byte 2.0.22/5002244, 2,276,872-byte 2.0.22/5002313, 2,277,488-byte 2.0.22/5002318, or 2,283,400-byte 2.0.22/5002322 library layout, the unique shader/NUL boundary, every layout-specific original/already-patched instruction context, and a uniform current swapchain state. The 5001712 stock library SHA-256 is `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495`. Galaxy XR OpenXR swapchain support and end-to-end Steam Link Main10/P010 preservation remain unverified; an unsupported format can prevent stream swapchain setup.

Static tests validate GLSL structure, fixed size, and binary placement but do not compile the shader with the Galaxy XR GLES driver. Successful on-headset shader compilation remains a runtime acceptance gate for both modes.

---

### Video dither (retired; developer opt-in)

The standalone `videoDitherPatch`, its `enable` option, and every recommendation dependency are
removed. Current OLED calibration generates `const float DITHER_ENABLE=0.;`. There is no Morphe
checkbox to turn it on. The unregistered internal helper `setDitherState` remains in
`patches/src/main/kotlin/app/template/patches/steamlink/binary/VideoDither.kt` for guarded historical
state handling and tests; its presence does not apply a patch.

For an unsupported local developer fork only:

1. In `patches/src/main/kotlin/app/template/patches/steamlink/binary/OledCalibrationPatch.kt`,
   change only the shader-template line `const float DITHER_ENABLE=0.;` to
   `const float DITHER_ENABLE=1.;`.
2. Preserve `DITHER_SCALE` (`.00392` for sRGB8 or `.00073` for RGB10_A2), the transfer function,
   and the chosen output precision. The `0.` to `1.` substitution has identical byte length;
   do not expand the fixed-size shader block.
3. From the repository root run `.\gradlew.bat :patches:buildAndroid` (compilation only), then
   import the newly built `patches/build/libs/patches-<version>.mpp` into Morphe; do not select the
   `-sources` or `-javadoc` artifact. Apply that local bundle with OLED calibration to a clean
   original APK. Do not hex-edit an installed APK or layer this over an already patched APK.
   Stock tests intentionally assert the disabled `0.` default; this compilation command does
   not run them or validate the opt-in fork, which is outside the tested release contract.
4. To disable it again, restore `DITHER_ENABLE=0.`, rebuild the local patch bundle, and repatch
   from the clean original APK.

Historical byte-state reference only, not binary-editing instructions: the stock shader toggled
its `//` prefix against 2 spaces; the old calibrated shader toggled `*.00000` against `*.00292`.
The highp shader uses the separate `DITHER_ENABLE` multiplier so the output-specific scale is
never lost. Existing archived APKs may still contain enabled dithering; removing the selectable
patch does not rewrite those artifacts.

---

## identity group

### Device Identity (`deviceIdentityPatch`)
**Default: disabled individually; selected by both legacy recommendation bundles and the 5002318 bundle; not compatible with 5002322** — Recommended selects Meta Quest Pro for the exact legacy recommendation targets and Galaxy XR for other supported targets; retains the legacy XR Core/device-config dependency, whose mutations are guarded off on native-XR builds

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
| `recommended` | Default: `Oculus Quest Pro` for exact 2.0.20/5001712, 2.0.20/5001740, 2.0.22/5002172, 2.0.22/5002206, and 2.0.22/5002244; Galaxy XR for other supported targets |
| `samsung-galaxy-xr` | Explicit Galaxy XR identity |
| `stock-no-change` | No additional identity override; the legacy config-baseline dependency still runs |
| `meta-quest-pro` | `Oculus Quest Pro` |
| `pico-4-pro` | `PICO 4 Pro` |

Recommended is resolved during execution from the APK's exact version/build; it does not mutate
the shared option for another build. Explicit profile choices, including saved Samsung, Stock,
and PICO selections, override Recommended. In native-XR build 5002318, Recommended retains the
full Galaxy XR transport identity. Build 5002322 remains outside this patch's public compatibility
and its 6-patch recommendation is unchanged.

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
| `lib/arm64-v8a/libvrlink_scene.so` | `disablePermissionPromptNativePatch` (layout-specific 8 B), native permission/gate patches, `hmdOnlyPatch` (hook + cave + velocity), `controllerVelocityPatch` (controller cadence instructions in `QSVLClient::OnTopOfFrame`), `oledCalibrationPatch` (1087-byte GLSL block plus 2 or 3 guarded swapchain instructions) |
| `assets/config/hmd_config.json` | `xrDeviceConfigBaselinePatch` (baseline), `deviceIdentityPatch` (profile override — intentional) |
| `AndroidManifest.xml` | `xrManifestCapabilityPackPatch`, `xrLauncherBootstrapPatch`, `gxrFacebridgePatch`, `appearOnTopPatch`, `xrGalaxyXrHighResolutionPatch`, `changePackageNamePatch` |
| `lib/arm64-v8a/libgxr_ast.so` | `xrGalaxyXrHighResolutionPatch` |
| `res/values/ids.xml` | `androidXrLibPatch`, `controllerVelocityPatch`, `gxrFacebridgeLibPatch` (all: idempotent create-if-missing only) |

`oledCalibrationPatch` is the only active shader-block writer. The retained unregistered
`VideoDither.kt` helper recognizes stock, legacy-calibrated, and highp states for tests; there is no
active dither dependency or separately selected shader mutation.
