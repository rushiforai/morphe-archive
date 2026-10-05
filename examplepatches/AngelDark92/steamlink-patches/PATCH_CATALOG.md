# Patch Catalog — steamlink-patches

Reference for conflict detection when importing external patches.
Each entry lists the exact APK artifact and value(s) a patch writes or modifies.

## Current patch categories

All 29 selectable patches use 7 categories in Morphe Manager 1.30.0 or newer.
Categories organize the list; exact-build guards, bundle dependencies and defaults remain authoritative.
The retired entries below are historical records and are not selectable.

| Category | Count | Current patches |
|---|---:|---|
| Recommended sets | 5 | [Galaxy XR recommended sets for 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968 and 2.0.23/5002363; legacy foundation through 2.0.22/5002244](#recommendation-bundles) |
| Image quality | 2 | [Galaxy XR high-resolution 3-projection fix](#galaxy-xr-high-resolution-3-projection-fix-xrgalaxyxrhighresolutionpatch); [OLED color calibration](#oled-color-calibration-oledcalibrationpatch) |
| Tracking & audio | 6 | [Visual Delay Fix](#visual-delay-fix-hmdonlypatch); [Controller velocity fix](#controller-velocity-fix-controllervelocitypatch); [GXR face bridge (version 5002318 and below)](#gxr-face-bridge-version-5002318-and-below-gxrfacebridgepatch); [GXR tongue bridge (version 5002322 and above)](#gxr-tongue-bridge-version-5002322-and-above-gxrmoderntonguebridgepatch); [XR Input Routing Config](#xr-input-routing-config-xrinputroutingconfigpatch); [Microphone input preset](#microphone-input-preset-microphoneinputpresetpatch) |
| Startup & permissions | 4 | [Startup permission requests (before 5002322)](#startup-permission-requests-before-5002322-xrstartuppermissionspatch); [Startup splash and XR launch mode (before 5002322)](#startup-splash-and-xr-launch-mode-before-5002322-xrlauncherbootstrappatch); [Unrestricted battery usage](#unrestricted-battery-usage-unrestrictedbatteryusagepatch); [Appear on top (legacy)](#appear-on-top-legacy-appearontoppatch) |
| App & device identity | 2 | [Change package name](#change-package-name-changepackagenamepatch); [Device identity](#device-identity-deviceidentitypatch) |
| Advanced XR compatibility | 7 | [XR Core Runtime](#xr-core-runtime-xrcoreruntimepatch); [XR Device Config Baseline](#xr-device-config-baseline-xrdeviceconfigbaselinepatch); [XR Manifest Capability Pack](#xr-manifest-capability-pack-xrmanifestcapabilitypackpatch); [Android XR native permission names; Force HMD initialization gates; Force lobby permission-state gate; Force stream XR gates](#native-xr-compatibility-gates) |
| Experiments | 3 | [Background blue-noise dithering](#background-blue-noise-dithering-backgroundbluenoisepatch-experimental); [Foveal blue-noise dithering](#foveal-blue-noise-dithering-fovealbluenoisepatch-experimental); [Full-FOV foveal canvas](diagnostics/steamlink-foveal-canvas/README.md) (all experimental) |

## FEC duplicate reservation guard (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: tested on the headset and did not resolve the hitching problem; removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch for the hitch regression.**

Separate, default-off patch with no dependencies/options for exact **2.0.22/5002322** and **2.0.23/5002363**. No recommended bundle includes it. Changes the verified duplicate-check bypass to NOP at `0x167094` / `0x167f60`; all 4 instruction bytes are guarded with full-function identity and executable mapping checks.

Use with the matching bundle and current **Observe + pipeline telemetry**, starting from an original APK with stock UDP. Plain v1 decoder helper modes are rejected with this guard because their runtime function guards do not accept it. Older adaptations and the original v1 payloads remain unchanged. Runtime effectiveness was tested and did not resolve the regression; the skipped-frame allocation route and possible PC-side recovery delays remain unresolved. [Experiment record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-fec-duplicate-reservation.md).

## UDP receive buffer (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: live trial on 2.0.23/5002363 failed (freezes worse and longer); removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch for the hitch regression.**

Separate, default-off patch with no dependencies/options for exact **2.0.22/5002322** and **2.0.23/5002363**. No recommended bundle includes it. Requests **8 MiB instead of 1 MiB** for the active VR UDP receive socket.

- Only `lib/arm64-v8a/libvrlink_scene.so` changes: instruction `08 02 a0 52` → `08 10 a0 52` at `0x1745a8` (5002322) or `0x1757a8` (5002363). The actual byte difference is at offset +1.
- Exact metadata, ELF mapping, size, GNU build ID and normalized full-function hash guard the change. Reapplication is idempotent; unknown/changed target layouts fail closed. Excluded exact builds return unchanged before file access.
- Coexists with recommended bundles and **Observe + pipeline telemetry**; no new native payload, manifest edit or host setting. **Failed live trial on 2.0.23/5002363: freezes worsened despite 0 measured socket drops. Not recommended as a remedy.** Retained for reproducibility; 2.0.22/5002322 runtime remains untested. [Live result and rollback](diagnostics/steamlink-hitches/UDP-RESULTS-2026-09-15.md).

## Decoder input buffering (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: tested on 2.0.23/5002363 — whole-view freezes persisted; removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch (including telemetry-only variants) for the hitch regression.**

Separate, default-off experiment for exact **2.0.22/5002322** and **2.0.23/5002363**. It has no dependencies and is absent from every recommended bundle. Select it separately alongside the matching bundle. **Buffered** stages incomplete compressed frames in bounded memory before synchronous codec submission; **Observe** adds counters to stock input handling.

- APK mutations: scene `DT_NEEDED` string at file offset `0x69656` (5002322) or `0x69925` (5002363), `libmediandk.so` → `libgxr_dbuf.so`; adds `lib/arm64-v8a/libgxr_dbuf.so` with a build-specific helper and configured mode.
- Runtime: plain modes retain the original v1 helper and its 11 guarded vtable/GOT pointers. Optional **Observe + pipeline telemetry** / **Buffered + pipeline telemetry** use a separate v2 resource and 18 guarded pointers, adding codec/image API timing and native fault-source tracing. No executable instructions, output images, shaders or OpenXR layers change. Conflicts fail activation; the original media dependency remains available.
- Limits: 24 lazy 4 MiB staging allocations per codec, 96 MiB maximum; real input capacity checked before copying. The stock 20 ms complete-frame acquisition wait and real-error recovery remain.
- [Exact layouts and hashes](diagnostics/steamlink-hitches/decoder-hook-layouts.json), [v1 tried record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-decoder-staging-v1.md), [v2 diagnostic capture](diagnostics/steamlink-hitches/TELEMETRY-2026-09-15.md). V1 did not solve the reported freezes. It was an 8th modern individual selection without changing the existing 6-patch bundles, until retirement on 2026-09-19.

## Current adaptations

The current catalog supports exactly **2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**, **2.0.22/5002244**, and **2.0.23/5002363**. Compatibility uses the exact version name and build code, never a version range. Historical references to 5001740, 5002296, 5002313, 5002318, and 5002322 below do not make those builds selectable.

The new 5001812 and 5001968 adaptations each expose the same **22 individual patches** as 5001712: **20 stable + 2 experimental blue-noise patches**. Their separate recommended selectors share the same 17-patch legacy set, dependency closure, and option defaults. All individual patches remain default-off; every supported exact pair selects 1 default-enabled bundle. The optional 5 patches are Appear on top, Change package name, Controller Velocity Fix, and both blue-noise layers.

Native addresses were independently adapted for both new bases. The [exact-base validation record](diagnostics/steamlink-legacy-1812-1968/README.md) covers local static/native checks and pristine-source Morphe validation; headset validation remains pending and publication is not claimed. The 5001712 reference is an analysis reconstruction, so its regression checks do not establish pristine-source APK patching.

Startup permissions and splash/XR launch-mode edits are separate patches explicitly selected by the 4 legacy bundles. The 5002363 bundle preserves native startup and permission handling apart from the selected battery-settings hook. Manager 1.30.0 or newer with compatibility checks enabled is required for exact build-code filtering; Expert mode may still display incompatible patches.

### Steam Link 2.0.23 / 5002363

This exact pair exposes 7 stable individual patches plus 2 optional blue-noise patches and a separate 6-patch recommendation: GXR tongue bridge, Galaxy XR high-resolution 3-projection fix, Microphone input preset, OLED color calibration, Unrestricted battery usage, and Visual Delay Fix. Device identity remains optional. Native targets: OLED shader `0x970a1`; format MOVs `0x10c840`, `0x10c8b0`, `0x10c920`; microphone `0xf44c0`; HMD pose hook `0x101f1c`; tongue block `0x141c6c`. High resolution uses the 3-projection API layer. Legacy mutations and retired experiments remain excluded.

See the [5002363 validation](diagnostics/steamlink-5002363/README.md), [native targets](diagnostics/steamlink-5002363/native-targets.md), and [Java/config targets](diagnostics/steamlink-5002363/surface-targets.md).

### Recommendation bundles

| Bundle | Exact target | Direct patch set |
|---|---|---|
| `Galaxy XR recommended set (2.0.20/5001712)` | 2.0.20/5001712 | 17-patch legacy set below |
| `Galaxy XR recommended set (2.0.20/5001812)` | 2.0.20/5001812 | Same 17-patch legacy set |
| `Galaxy XR recommended set (2.0.21/5001968)` | 2.0.21/5001968 | Same 17-patch legacy set |
| `Galaxy XR legacy foundation (through 2.0.22/5002244)` | 2.0.22/5002244 | Same 17-patch legacy set |
| `Galaxy XR recommended set (2.0.23/5002363)` | 2.0.23/5002363 | 6 native Android XR patches above |

All 4 legacy bundles directly select:

1. Android XR native permission names
2. Force HMD initialization gates
3. Force lobby permission-state gate
4. Force stream XR gates
5. GXR face bridge (version 5002318 and below)
6. Galaxy XR high-resolution 3-projection fix
7. Microphone input preset (`voice-recognition`)
8. OLED color calibration (`final-balanced`, `srgb8-highp`)
9. Unrestricted battery usage
10. Visual Delay Fix (`60` ms)
11. XR Core Runtime
12. XR Device Config Baseline
13. XR Input Routing Config
14. Startup splash and XR launch mode (before 5002322)
15. XR Manifest Capability Pack
16. Device identity (Recommended: Meta Quest Pro / `Oculus Quest Pro` model)
17. Startup permission requests (before 5002322)

Leave **HMD identity** on **Recommended**, or explicitly select **Meta Quest Pro**, for the legacy bundles. The exact 5001712, 5001812, 5001968, and 5002244 targets resolve Recommended to `meta-quest-pro`. Explicit Samsung, Stock, or PICO choices remain authoritative. The native 5002363 recommendation does not select Device identity.

Device identity depends on XR Device Config Baseline, so the baseline runs before the identity
override. The legacy Quest payload preserves SamsungVST tracking, Galaxy XR controller and eye
routing; only the 3 runtime-selected HMD model values change to `Oculus Quest Pro`.
Private/transitive support dependencies are deduplicated by Morphe; the counts above describe
direct public selections, not all internal tasks.

Selecting a bundle never broadens verified build guards. The early 5001712/5001812/5001968 builds use the independently verified 2-projection payload; 5002244/5002363 use the 3-projection payload. The 2 new bases retain array-shaped `requestedExtensions`; only 5001712 uses the special device-keyed conversion. Headset behavior remains a separate validation gate.

---

## androidxr group

### XR Core Runtime (`xrCoreRuntimePatch`)
**Default: disabled individually; selected by all 4 legacy recommendation bundles** (legacy builds only)
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
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x142c0c` (2.0.20/5001712), `0x142c84` (2.0.20/5001812), `0x13ec7c` (2.0.21/5001968), or `0x1422c4` (2.0.22/5002244) | 8 bytes: replaces the exact `RequestAndroidPermissions()` prologue with `movz w0,#1; ret` |

Selection uses exact `(versionName, versionCode)` before checking the pinned library size. A known exact pair with the wrong size or bytes fails closed; a wrong/unknown pair is unchanged. Native-XR build 5002363 and unknown/excluded exact pairs return before reading the library.

---

### XR Device Config Baseline (`xrDeviceConfigBaselinePatch`)
**Default: disabled individually; selected by all 4 legacy recommendation bundles** (legacy builds only) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` | Full replace — Galaxy XR HMD identity (sSerialNumber=VRLINKHMDGALAXYXR, sManufacturerName=Samsung, sModelNumber=Galaxy XR, sControllerType=galaxy_xr_hmd, requestedExtensions=[XR_EXT_eye_gaze_interaction]) |
| `assets/config/controller_config.json` | Full replace — /interaction_profiles/oculus/touch_controller static props + pose action offset + input/haptic action bindings |
| `assets/config/default_config.json` | Full replace — `preflight.ignore_microphone_muted = false` |
| `assets/webui/dash/index.html` | Full replace — Steam Link dashboard HTML bootstrap |

---

### XR Manifest Capability Pack (`xrManifestCapabilityPackPatch`)
**Default: disabled individually; selected by all 4 legacy recommendation bundles** (legacy builds only) — depends on `xrCoreRuntimePatch`
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

### Startup splash and XR launch mode (before 5002322) (`xrLauncherBootstrapPatch`)
**Default: disabled individually; selected by all 4 legacy bundles** — exact 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, and 2.0.22/5002244 only; native 5002363 is excluded.
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `application/activity@android:name` | Adds `com.valvesoftware.steamlink.GalaxyXRPermissionActivity` (exported=true, MAIN/LAUNCHER, 1280×800px layout) |
| `AndroidManifest.xml` direct `application/property` | Removes application-wide `android.window.PROPERTY_XR_ACTIVITY_START_MODE` (when present) before applying activity-specific modes |
| `AndroidManifest.xml` VR activity/property | Adds `android.window.PROPERTY_XR_ACTIVITY_START_MODE = XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED`; recognizes `VRLink` or `android.app.NativeActivity` with `android.app.lib_name=vrlink_scene` |
| `AndroidManifest.xml` VR activity/intent-filter/category | Adds `org.khronos.openxr.intent.category.IMMERSIVE_HMD` on legacy foundation builds |
| `AndroidManifest.xml` `SteamLink activity/intent-filter` | Removes LAUNCHER intent-filter |
| `AndroidManifest.xml` `SteamLink activity/layout` | Sets `android:defaultWidth=1536.0px`, `android:defaultHeight=960.0px` on legacy foundation builds |
| `GalaxyXRPermissionActivity` | Enables the black "Launching Steam Link" screen; runtime permission requests remain disabled unless the separate permission patch is selected |

### Startup permission requests (before 5002322) (`xrStartupPermissionsPatch`)
**Default: disabled individually; selected by all 4 legacy bundles** — exact 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, and 2.0.22/5002244 only; native 5002363 is excluded.

| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds missing `android.permission.HAND_TRACKING`, `EYE_TRACKING_FINE`, `FACE_TRACKING`, `RECORD_AUDIO`, and `BLUETOOTH_CONNECT` declarations |
| `AndroidManifest.xml` launcher | Routes through the shared transparent `GalaxyXRPermissionActivity`; leaves splash styling, picker sizing and XR start mode to the separate splash patch |
| `GalaxyXRPermissionActivity` | Enables runtime requests for those 5 permissions before Steam Link opens; shared helper flags for permission requests and the visible splash default to false |

Face bridge, tongue bridge, high resolution and battery no longer select either public startup patch as an implicit dependency. Battery and Appear on top retain the transparent older-build settings bootstrap; neither enables runtime tracking/microphone/Bluetooth requests or the splash by itself.

---

### XR Input Routing Config (`xrInputRoutingConfigPatch`)
**Default: disabled individually; selected by all 4 legacy recommendation bundles** (legacy builds only) — depends on `xrManifestCapabilityPackPatch`
| Artifact | Edit |
|---|---|
| `assets/config/ui_config.json` | Full replace — XR pointer aim/select bindings for touch_controller and hand_interaction_ext; haptic bindings |

---

### Controller Velocity Fix (`controllerVelocityPatch`)
**Default: disabled** (experimental) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_velocity.so` | New file with embedded config patched at magic `GXRVELCFG0000001` |
| `lib/arm64-v8a/libvrlink_scene.so` `QSVLClient::OnTopOfFrame` | Optional exact-layout AArch64 edits select stock 4×, evenly phased 2×, or display-rate 1× controller pose events while retaining the final type-2 frame-update event; verified layouts: exact pairs 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, and 2.0.22/5002244 |
| config block `+32` (int64 LE) | `maxDeltaMs × 1,000,000` nanoseconds — default 50 ms |
| config block `+40` (float32 LE) | `maxLinearSpeed` m/s — default 20.0 |
| config block `+44` (float32 LE) | `maxAngularSpeed` rad/s — default 50.0 |
| config block `+48` (float32 LE) | `smoothing` EMA weight — default 0.0 |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_velocity.json` | New file (OpenXR implicit API layer manifest; disable env: `GXR_DISABLE_CONTROLLER_VELOCITY`) |

**Option:** `poseSendCadence` — `stock-4x` (default), `half-2x`, or `display-1x`. Actual sends per second equal the active display rate multiplied by 4, 2, or 1. Non-stock modes fail closed on unrecognized native layouts.

---

### Controller pose extrapolation (`controllerPoseExtrapolationPatch`, experimental)
**Default: disabled** (experimental) — no dependencies; legacy 5001712/5001812/5001968/5002244 and 2.0.23/5002363. The layer hooks only the runtime library, so it does not depend on the base; measured on 5002363 only, the legacy bases were not run.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_extrapolation.so` | New file (OpenXR implicit API layer; source `extensions/controller-extrapolation-layer`) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_extrapolation.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_EXTRAPOLATION`) |

No Steam Link code, shader or config is changed. Inside the Steam Link process the layer redirects the Galaxy XR runtime library's (`libopenxr_android.so`) import of `GetServerConfigurableFlag` so that `com.android.xr.flags.enable_controller_pose_extrapolation_consumer_side` reads as `true`; every other flag is passed through. `adb shell setprop debug.gxr.extrapolation 0` leaves the flag untouched (read at app start).

Measured on a Galaxy XR headset with 2.0.23/5002363 on 2026-10-04: stock, the runtime returned 90 distinct controller poses per second for VRLink's 360 `xrLocateSpace` calls and the same pose for "now" and "now + 30 ms"; with the flag forced, all 360 calls returned distinct poses and the pose depended on the requested time. Velocity still updates 90 times per second, so the added poses are the runtime's extrapolation, not new measurements. See the [layer notes](extensions/controller-extrapolation-layer/README.md).

---

### Controller velocity frame (`controllerVelocityFramePatch`, experimental)
**Default: disabled** (experimental) — no dependencies; legacy 5001712/5001812/5001968/5002244 and 2.0.23/5002363. The legacy bases use the same pose action and, with this repository's `controller_config.json`, the same controller pose offset; the angles were measured on 5002363 only and the legacy bases were not run. Do not combine with Controller velocity fix, which replaces the same velocities.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_velocity_frame.so` | New file (OpenXR implicit API layer; source `extensions/controller-velocity-frame-layer`) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_velocity_frame.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_VELOCITY_FRAME`) |

No Steam Link code, shader or config is changed. The Galaxy XR runtime reports the controller's linear and angular velocity in a frame attached to the controller instead of in the base space, and VRLink forwards both unchanged, so SteamVR sends thrown objects in the wrong direction. The layer wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action (`pamir-stream-pose`) and rewrites the chained velocity: the linear one is pitched by -62.6 degrees in the located pose's frame and rotated into the base space, the angular one is pitched by -42 degrees and left local to the pose. Poses, other spaces and hand tracking are not touched. `adb shell setprop debug.gxr.velocity_frame 0` reports the runtime's velocities unchanged; `debug.gxr.velocity_pitch_linear` and `debug.gxr.velocity_pitch_angular` override the two angles (all read when Steam Link starts).

Measured on the PC from the poses VRLink delivers, Galaxy XR headset with 2.0.23/5002363 on 2026-10-04, against the displacement of the streamed positions (left / right controller): the linear velocity's direction error went from 44 / 55 degrees to 15 / 17.5 degrees and the angular velocity's from 18 / 33 degrees to 12 / 14 degrees; speed stayed at 98-100% of the positions'. Independent of the controller pose extrapolation patch.

---

### Controller grip haptics through Shizuku (`controllerGripHapticsPatch`, experimental)
**Default: disabled** (experimental) — no patch dependencies; legacy 5001712/5001812/5001968/5002244 and 2.0.23/5002363. Needs [Shizuku](https://github.com/RikkaApps/Shizuku) on the headset.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_haptic_main.so` | New file (OpenXR implicit API layer; source `extensions/controller-grip-haptics`) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_haptic_main.json` | New file (layer manifest; disable env: `GXR_DISABLE_HAPTIC_MAIN`) |
| dex | New classes `gxr.haptic.HapticProvider`, `gxr.haptic.HapticService` and the Shizuku API 13.1.5 (`rikka.shizuku`, `rikka.sui`, `moe.shizuku`) from `extensions/controller-grip-haptics.mpe` |
| `AndroidManifest.xml` | Adds `uses-permission` `moe.shizuku.manager.permission.API_V23`, `queries` for `moe.shizuku.privileged.api`, `meta-data` `moe.shizuku.client.V3_SUPPORT` and the provider `gxr.haptic.HapticProvider` with authority `<package>.shizuku` |

No Steam Link code, shader or config is changed. A Galaxy XR controller has a vibrator at the trigger and one in the grip; the system controller service sends every OpenXR vibration to the trigger one. The grip vibrator is reachable only through the controller HAL, which answers shell but not an application, so the provider asks Shizuku for permission at start and binds a Shizuku user service that relays to the HAL. The layer wraps `xrApplyHapticFeedback` and `xrStopHapticFeedback` and, while that service is connected, sends `XrHapticVibration` to the grip vibrator instead of the runtime. Without Shizuku or its permission every call goes to the runtime unchanged.

The layer generates the vibration itself and streams it to the grip vibrator as 8-bit samples in short chunks: a sine at half the requested frequency, capped at 130 Hz, with the amplitude mapped onto 0.2..0.8 by a square-root curve. `adb shell setprop debug.gxr.haptic 0|1|2` selects OpenXR only, grip (default) or grip and trigger; `debug.gxr.haptic.pcm 0` switches to the HAL's plain pulses; the other `debug.gxr.haptic.*` properties tune amplitude, tone and chunk length and are re-read while streaming. Checked by hand on a Galaxy XR headset with 2.0.23/5002363 on 2026-10-04 (SteamVR dashboard, Beat Saber); the legacy bases make the same OpenXR calls but were not run. See the [layer notes](extensions/controller-grip-haptics/README.md).

---

### GXR Face Bridge (version 5002318 and below) (`gxrFacebridgePatch`)
**Default: disabled individually; selected by all 4 legacy bundles** — exact 5001712/5001812/5001968/5002244 targets only; adds the guarded face-permission declaration without selecting startup patches.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_face_bridge.so` | New file (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json` | New file (instance extension `XR_FB_face_tracking2`; disable env: `GXR_DISABLE_FACE_BRIDGE`) |
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.FACE_TRACKING` |

---

### GXR Tongue Bridge (version 5002322 and above) (`gxrModernTongueBridgePatch`)
**Default: disabled individually; exact 2.0.23/5002363 only; selected by its recommended bundle.**

Preserves Valve's native `XR_ANDROID_face_tracking` mapping for expressions 0–62. The guarded 24-byte AArch64 replacement at `0x141c6c` transports Android tongue direction values while retaining standard FB2 TongueOut. Exact library size: 2,292,008 bytes; stock SHA-256: `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0`. Original/already-patched block checks fail atomically on unknown layouts. Historical headset success on 5002322 is not runtime proof for the 5002363 adaptation.

| Output slot | Value |
|---|---|
| 63 | TongueOut transport copy |
| 64–67 | TongueLeft, TongueRight, TongueUp, TongueDown |
| 68 | Standard FB2 TongueOut |
| 69 | Standard TongueRetreat, preserved as zero |
| `AndroidManifest.xml` | Adds missing `android.permission.FACE_TRACKING` through the shared guarded manifest helper; stock 5002363 already declares it. No launcher, splash or runtime permission request is added. |

---

### Appear On Top (legacy) (`appearOnTopPatch`)
**Default: disabled; exact legacy targets 5001712/5001812/5001968/5002244 only** — retained as an overlay-based fallback.
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.SYSTEM_ALERT_WINDOW` (required for `GxrOverlayBridge` TYPE_APPLICATION_OVERLAY compositor window) |
| `AndroidManifest.xml` launcher | Adds/routes through `GalaxyXRPermissionActivity`; preserves the stock target SDK, XR features/categories, VRLink start mode, native permission routine, and controller config on the 4 supported legacy builds. Native 5002363 excludes this fallback. |
| Minimal extension DEX | Adds only `GalaxyXRPermissionActivity`, `GxrOverlayBridge`, and `GxrResolutionProbe`; contains no SDL/controller class fragments. |
| `SteamLink` lifecycle methods | Adds the overlay/resolution probe calls without modifying `SDLSurface`, `SDLControllerManager`, or generic-motion routing |

---

### Unrestricted Battery Usage (`unrestrictedBatteryUsagePatch`)
**Default: disabled individually; selected by all 5 recommendation bundles** — battery-only stock-activity hook on exact 5002363; transparent settings bootstrap on exact earlier builds
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` |
| `GalaxyXRPermissionActivity` (earlier builds) | Opens the app-specific Battery usage page at startup when not unrestricted; falls back to the direct exemption prompt, then app details. Uses a transparent launcher with splash and runtime permission flags off unless separately selected. |
| `SteamLink.onCreate` (exact 2.0.23/5002363) | Invokes `GxrBatterySettings.request(Activity, Bundle)` after stock `SDLActivity.onCreate`, before stock parameter-register reuse; skips restored activity instances and already unrestricted apps |
| Battery extension DEX (5002363 call site) | Adds the battery-only settings helper with the same settings fallbacks; no replacement launcher, custom splash, XR start-mode override or additional runtime permission requests |

---

### Galaxy XR high-resolution 3-projection fix (`xrGalaxyXrHighResolutionPatch`)
**Default: disabled individually; selected by all 5 recommendation bundles** — exact 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, and 2.0.23/5002363 only.

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW` and sets `GXR_RESOLUTION_MODE=android_surface_trigger_passthrough_v1`; preserves stock launcher, splash and XR start mode. The explicit older splash patch owns the unmanaged Full Space override. |
| `lib/arm64-v8a/libgxr_ast.so` | Release-built, stripped implicit OpenXR API layer selected by exact build. Exact builds 2.0.20/5001712, 2.0.20/5001812, and 2.0.21/5001968 copy Valve's 2 projection pointers, place the quad at index 2, and submit 3 layers. Exact 2.0.22/5002244 and 2.0.23/5002363 retain the existing 3-pointer, quad-at-index-3, 4-layer contract. |
| Bundled `libgxr_ast_5001712.so` | 2-projection payload installed under the standard `libgxr_ast.so` name for exact 5001712/5001812/5001968 targets. It is never selected for 5002244 or 5002363. |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json` | Registers the surface-trigger API layer; disable environment is `GXR_DISABLE_ANDROID_SURFACE_TRIGGER`. |

The output remains Valve's native projection layout plus 1 nearly invisible quad: 2 projections/4 views become 3 total layers on exact 5001712/5001812/5001968 targets; 3 projections/6 views become 4 total layers on 5002244/5002363. Every validation, pointer-copy, pointer-log, and projection telemetry loop uses the selected source count, preventing the delayed out-of-bounds layer-3 read on 5001712. The layer performs no texture copy, shader draw, resampling, or projection reconstruction. The independent trigger Surface does not alter Valve's source handles or formats, so future RGB10_A2 projection sources remain reserved for unchanged passthrough.

The production helpers are compiled with `-O2`, dead-section elimination, and stripped symbols. They do not intercept `xrWaitFrame`, perform no periodic per-frame log formatting, construct the immutable trigger quad once per session, fill the fixed source-pointer array during mandatory topology validation, and skip that validation while the trigger is inactive. Cold lifecycle evidence plus the 1st 3 accepted submissions remain available to validate topology.

The current CPU-only revisions are `android-surface-trigger-passthrough-v1.4-20260903` (3 projections) and `android-surface-trigger-5001712-v1.2-20260903` (2 projections). A generation-validated, non-owning thread-local render cache replaces per-frame shared-ownership acquisition/release. The registry owns live sessions; lifecycle mutations invalidate cached lookups, including reused handles. Safe frame use relies on OpenXR's externally synchronized session/instance destruction, not on the generation counter alone. Event readers retain owned lookups, and event dispatch now requires exactly `XR_SUCCESS`, so `XR_EVENT_UNAVAILABLE` cannot process stale event data. Bundle definitions need no duplicate fix: they already depend on the main resolution patch and receive its rebuilt helper. Continuous terminal-quad submission remains unchanged; there is no GPU, resolution, or 10-bit behavior change intended, and no measured speed gain is claimed.

Host CTest checks of the actual registry and both 2-/3-projection helper integration paths passed. Both Android payloads rebuilt with NDK `27.2.12479018` and cached OpenXR `1.1.43` headers. Headset validation of these revisions remains pending. The accepted 2026-09-01 capture below belongs to the same append-only topology in an earlier helper and is prior behavioral evidence, not a runtime result for the new binaries.

For user A/B testing, retain the previous patch artifact and compare newly patched APKs from the same Steam Link base with identical patch options, host settings, and fixed scene. Check cold start, stream stop/restart, palm and DFR-UI transitions, and session/focus loss followed by resume. Report any sharpness change, crash, or failure to recover, alongside comparable CPU/GPU timings if available; lower GPU composition time is not an expected consequence of these CPU-only changes.

The 5 current exact bases have independent metadata and resource/manifest routing checks. The new 5001812/5001968 layouts use the existing 2-projection helper, with local static and pristine-source Morphe results in the [adaptation record](diagnostics/steamlink-legacy-1812-1968/README.md). Historical 5001712 startup/frame-900 feedback is separate from the current local checks.

#### Historical headset validation (2.0.22/5002322; not a current target)

The 2026-09-01 accepted capture showed that the extension was hidden from enumeration but accepted
when explicitly requested: the function loaded, a 2x2 Surface was created and queued, and 4 sampled
`xrEndFrame` submissions preserved the original 3 projection pointers while successfully adding 1
terminal quad. No overlay permission, type-2038 Steam Link window, or recording contamination
existed. The headset palm A/B/A result was `MATCHES REFERENCE -> MATCHES REFERENCE -> MATCHES
REFERENCE`, establishing perceived parity with Valve's native 3-projection APK with Appear on top.

---

### Retired: Android-Surface Fovea — tried, did not work

On 2026-09-07 the user tested this experiment and reported: "It's not working."
Retired at the user's request. This was the actual 8-bit fovea-to-Android-Surface
experiment on Steam Link 2.0.22/5002322: 3 projections, copied fovea pixels, no
extra 2×2 quad. It was distinct from the earlier static-black underside test.

The selectable patch, native helper, build target and runnable diagnostic are
removed. Mode/library identifiers remain only for stale-resource cleanup. The
working high-resolution fix and recommended bundles are unchanged. No new trace
was supplied; the failure mechanism and GPU cost are not established. Do not
repeat this as an untried idea. See [historical record](diagnostics/steamlink-surface-fovea/README.md).

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

### Historical TEST — Old Scene requestExit Bridge (`oldSceneRequestExitBridgePatch`)
**Historical adapter; not present in the current selectable catalog.**
| Artifact | Edit |
|---|---|
| `smali/com/valvesoftware/steamlink/VRLink.smali` | Replaces `.method private native requestExit()V` with Java `finishAndRemoveTask()` bridge implementation |

---

## binary group

### Microphone Input Preset (`microphoneInputPresetPatch`)
**Default: disabled individually; selected by all 5 recommendation bundles**

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | Replaces the verified AAudio input-preset `MOV W1` instruction with Voice Recognition by default |

The 5001812 layout is pinned to 2,220,872 bytes at `0xF4484`; 5001968 to 2,234,048 bytes at `0xEFDB4`; 5002363 to 2,292,008 bytes at `0xF44C0`. Exact pairs select these native layouts, which check surrounding code and supported preset instructions. The 5001712 and 5002244 adapters retain their existing unique semantic matcher. All 4 preset values and new-base transitions are covered by the native audit.

---

### Visual Delay Fix (`hmdOnlyPatch`)
**Default: disabled individually; selected by all 5 recommendation bundles**
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` @ hook vaddr (version-specific) | 4 bytes: `ldr x2,[sp,#8]` → AArch64 unconditional branch to the mapped trampoline |
| Non-allocated `.comment` payload + unique `PT_NOTE` header | Reuses the first 20 `.comment` bytes for the trampoline and converts the redundant note header into a page-aligned read/execute `PT_LOAD`. The live executable tail and PLT entries remain byte-for-byte unchanged. |
| Velocity fields `[x19+28]` … `[x19+48]` (6× float/double) | Replaced with `STUR XZR` or `STR WZR` (zeroes PackedPose_t linear/angular velocity) |

**Option:** `offsetMs` — encodes as nanoseconds split across MOVZ/MOVK immediates; default 60, range 0–4000

**Version layouts (selected by exact version/build, with size and instruction guards):**

| Exact pair | File size | Hook vaddr |
|---|---|---|
| 2.0.20/5001712 | 2,221,072 | `0x1014E8` |
| 2.0.20/5001812 | 2,220,872 | `0x101648` |
| 2.0.21/5001968 | 2,234,048 | `0xFD5F0` |
| 2.0.22/5002244 | 2,251,920 | `0xFEAD8` |
| 2.0.23/5002363 | 2,292,008 | `0x101F1C` |

---

### Native XR Compatibility Gates
**Default: disabled individually; selected by all 4 legacy recommendation bundles** (legacy builds only)
| Patch | 2.0.20/5001712 | 2.0.20/5001812 | 2.0.21/5001968 | 2.0.22/5002244 |
|---|---|---|---|---|
| Android XR native permission names | `0x99924`, `0xA1A7F` | `0x99862`, `0xA1985` | `0x9334F`, `0x9B7AB` | `0x93952`, `0x9C10E` |
| Force HMD initialization gates | `0xFFE20`, `0xFFE28` | `0xFFC5C`, `0xFFC64` | `0xFBC04`, `0xFBC0C` | `0xFD040`, `0xFD048` |
| Force lobby permission-state gate | `0x10DB10` | `0x10DC70` | `0x109BF0` | `0x10B658` |
| Force stream XR gates | `0x116564`, `0x11656C`, `0x116620` | `0x1166C4`, `0x1166CC`, `0x116780` | `0x112644`, `0x11264C`, `0x112700` | `0x1140AC`, `0x1140B4`, `0x114168` |

The independently decoded 5001712 layout is 2,221,072 bytes with stock SHA-256 `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495`. Every fixed layout is selected by exact `(versionName, versionCode)` and expected size, then validates all local stock or already-patched bytes before writing atomically. A wrong exact pair sharing a known size is unchanged. The permission-name patch retains its intentional unique-pattern fallback only for genuinely unknown sizes; fixed gate patches leave unknown layouts unchanged.

---

### OLED Color Calibration (`oledCalibrationPatch`)

Default off individually; selected by the existing recommendation bundles. Exact current
native adaptations are **2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**, **2.0.22/5002244**, and **2.0.23/5002363**.
The existing option keys and defaults are retained. Both depth options now select the
same **VD-informed SDR foveal processing**, based on VD's HEVC 10-bit PCVR path.

| Option | Default | Behavior |
|---|---|---|
| `profile` | `final-balanced` | Gamma 1.20, saturation 1.45; applies to the base layer, and also the fovea when both VD options are off |
| `gamma` | `1.20` | Custom-profile range 0.50–2.50 |
| `saturation` | `1.45` | Custom-profile range 0.00–3.00 |
| `foveaVdLike10Bit` | `false` | Declares 10-bit input; highp foveal sampling with Valve color correction, bypassing the calibration profile and adding no shader noise |
| `foveaVdLike8Bit` | `false` | Same foveal processing for declared 8-bit input; cannot recover lost input precision |
| `fovealGamma` | `1.00` | Extra foveal gamma after the selected RGB processing; range 1.00–1.30, step 0.01. 1.00 preserves existing output; higher values darken only the fovea. Works with either VD option or both off. |

The 2 depth options are mutually exclusive and do not negotiate the host codec.
Output remains `GL_SRGB8_ALPHA8`. The calibrated common prefix/base program is
unchanged; only the separately assembled masked suffix receives the SDR override.
Both off with `fovealGamma=1.00` restores the original suffix. The original alpha
expression and fade survive. Foveal gamma is applied before fade and before optional
blue-noise quantization; the entire background shader remains unchanged. For a lighter
foveal region, begin at 1.02 and adjust cautiously: this is manual compensation, not a
verified fix for the cause of the visible boundary. A positive black-level offset will
not necessarily be corrected by gamma alone. See [validation](diagnostics/steamlink-colour/FOVEAL-GAMMA-2026-09-25.md).
Historical RGB10/FP16/noise helpers remain internal for audits, not selectable output modes.
Leave these options off when selecting the separate blue-noise patch.

**HEVC 10-bit investigation, 2026-09-22:** VD's traced PCVR path uses SDR YUV→RGB
conversion for both codec depths, with no depth-specific shader-noise branch. Steam Link
has a different decoder/import path and explicitly requests BT.2020 color metadata;
Valve's existing conversion matrix is retained rather than treating it as VD's HDR
matrix. This is a client SDR comparison, not a reproduction of VD's encoder, raw-YUV
import, or a demonstrated banding fix. See [the investigation and validation](diagnostics/steamlink-vd-hevc10/README.md).

The inspected installed SteamVR host only pushes optional shader overrides when
`watchForShaderChanges` is enabled and a complete nonempty override pair exists;
that setting is disabled and the override files are absent in the inspected configuration.
Custom host replacements can still bypass the embedded shader modification.

### Foveal blue-noise dithering (`fovealBlueNoisePatch`, experimental)

**Separate patch; default off; excluded from recommendation bundles and the stable catalog.**
Exact bases: **2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**, **2.0.22/5002244**, **2.0.23/5002363**.

| Option | Default | Behavior |
|---|---|---|
| `inputDepth` | `10-bit` | Choose `8-bit` or `10-bit`; both use the same final 8-bit sRGB quantizer without changing decoder or host settings |

A static, original 128×128 R8 blue-noise tile selects neighboring 8-bit output codes
**after** colour processing and fade. The original alpha is preserved. The helper
recognizes exact full masked-shader hashes and additionally checks the exact native
foveal draw call and the 8-bit sRGB framebuffer/write state. The base draw is excluded.
Recognized reloads are rewritten; unknown host replacements pass through unchanged.
Compile/link/resource failures restore the original shader/program.

It works independently of OLED calibration. To combine them, leave **both existing
VD-like toggles off**; the blue-noise finalizer validates and hashes the final calibrated
prefix. Other/previously dithered prefixes are rejected to avoid stacking dithers.
This is an independent blue-noise implementation, not a copy of VD's algorithm.

See the [original algorithm](diagnostics/steamlink-blue-noise-ditering/README.md) and
[current layer selection and validation](diagnostics/steamlink-background-blue-noise/README.md).

### Background blue-noise dithering (`backgroundBlueNoisePatch`, experimental)

**Separate patch; background/base layer only; default off; excluded from recommendation
bundles and the stable catalog.** Exact bases and options match the foveal patch:
**2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**, **2.0.22/5002244**, **2.0.23/5002363**; `inputDepth` defaults to
`10-bit` and also accepts `8-bit`. Output is always 8-bit sRGB.

Uses the same static 128×128 tile and final quantizer after colour processing/fade,
preserving opaque alpha. Background means the complete base projection, including
the part underneath the foveal overlay. Only the exact opaque shader and background
draw caller are eligible; the foveal program is not dithered by this selection.

Select this patch alone, the foveal patch alone, or both. The shared helper merges
both configurations independently of selection order, and each program remains
restricted to its own layer's draw. The existing framebuffer, unknown-shader,
compile/link/resource fallback, GL-state restoration and OLED compatibility rules
apply to both. Headset rendering and visual quality remain unverified.

When changing a Morphe selection, start from the original APK. Deselecting a patch
does not undo modifications already embedded in a previously patched APK. Bundled
helpers from the older fovea-only implementation are rejected rather than overwritten.

---

## identity group

### Device Identity (`deviceIdentityPatch`)
**Default: disabled individually; selected by all 4 legacy bundles and optional on 5002363.** Recommended selects Meta Quest Pro on exact legacy targets and Galaxy XR on native 5002363. Its legacy XR Core/device-config dependencies are guarded off on native-XR builds.

| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` (5002363, Galaxy profile) | Atomic targeted merge: upserts exact `unknown`, `xrvst2`, and `xrvst2ue` entries with stable Galaxy serial/model/device identity and `{galaxyxrresources}` input/render roots; unrelated extensions, profiles, offsets, and controller configuration are preserved |
| `assets/config/hmd_config.json` (5002363, Quest/Pico) | Changes only the runtime fallback model string |
| `assets/config/hmd_config.json` (legacy builds) | Retains the previously verified full profile-specific identity payload |

This intentionally preserves the native builds' requested extensions and vendor profiles. In particular,
`controller_config.json` remains byte-identical, retaining `XR_EXT_hand_interaction`,
`/interaction_profiles/ext/hand_interaction_ext`, and its hand grip/aim poses.

**Option `profile`:**

| Value | `sModelNumber` |
|---|---|
| `recommended` | Default: `Oculus Quest Pro` for exact 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, and 2.0.22/5002244; Galaxy XR for other supported targets |
| `samsung-galaxy-xr` | Explicit Galaxy XR identity |
| `stock-no-change` | No additional identity override; the legacy config-baseline dependency still runs |
| `meta-quest-pro` | `Oculus Quest Pro` |
| `pico-4-pro` | `PICO 4 Pro` |

Recommended is resolved during execution from the APK's exact version/build; it does not mutate
the shared option for another build. Explicit profile choices, including saved Samsung, Stock,
and PICO selections, override Recommended. In native-XR build 5002363, Recommended retains the
full Galaxy XR transport identity; Device identity remains outside its 6-patch recommendation.

---

### Change Package Name (`changePackageNamePatch`)
**Default: disabled**
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `manifest@package` | Set to new package name |
| `AndroidManifest.xml` `permission@android:name` | Prefix-replaced for custom permissions declared by this package |
| `AndroidManifest.xml` `uses-permission@android:name` | Prefix-replaced for custom permissions used by this package |
| `AndroidManifest.xml` `provider@android:authorities` | String-replaced for content provider authorities |
| `classes.dex` `SteamLink.startVRLink(String)` | Replaces the exact original-package `const-string` used to create the `android.app.NativeActivity` component; builds without that literal remain unchanged |

**Option:** `packageName` — default appends `.gxr` to original; accepts any valid Java package name regex `^[a-z]\w*(\.[a-z]\w*)+$`

---

---

## Shared-file conflict matrix

| APK artifact | Patches that write to it |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | `disablePermissionPromptNativePatch` (layout-specific 8 B), native permission/gate patches, `hmdOnlyPatch` (hook + cave + velocity), `controllerVelocityPatch` (controller cadence instructions in `QSVLClient::OnTopOfFrame`), `gxrModernTongueBridgePatch` (5002363-only 24 B), `oledCalibrationPatch` (1087-byte GLSL block plus guarded swapchain instructions), `fovealBlueNoisePatch` / `backgroundBlueNoisePatch` (11 exact dependency/import/loader strings and sRGB8 instructions; finalizes after optional calibration) |
| `assets/config/hmd_config.json` | `xrDeviceConfigBaselinePatch` (baseline), `deviceIdentityPatch` (profile override — intentional) |
| `AndroidManifest.xml` | `xrManifestCapabilityPackPatch`, `xrLauncherBootstrapPatch`, `xrStartupPermissionsPatch`, shared face-tracking declaration used by `gxrFacebridgePatch` and `gxrModernTongueBridgePatch`, `unrestrictedBatteryUsagePatch`, `appearOnTopPatch`, `xrGalaxyXrHighResolutionPatch`, `changePackageNamePatch` |
| `SteamLink.onCreate` (5002363) | `nativeBatterySettingsPatch`: battery-only settings hook; earlier builds use the guarded transparent bootstrap |
| `lib/arm64-v8a/libgxr_ast.so` | `xrGalaxyXrHighResolutionPatch` |
| `res/values/ids.xml` | `androidXrLibPatch`, `controllerVelocityPatch`, `gxrFacebridgeLibPatch` (all: idempotent create-if-missing only) |

`oledCalibrationPatch` is the only active shader-block writer. The retained unregistered
`VideoDither.kt` helper recognizes stock, legacy-calibrated, and highp states for tests; there is no
active legacy dither dependency. The separate blue-noise patches leave the embedded
shader block unchanged and install their shared guarded native runtime rewriter as `libgxd.so`.
