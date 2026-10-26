# Patch Catalog — XR Porting Hub

Reference for conflict detection when importing external patches.
Each entry lists the exact APK artifact and value(s) a patch writes or modifies.
This catalog documents the hub's patch sets; the primary one is Steam Link VR (`com.valvesoftware.steamlinkvr`). Entries for the other app this repository patches, 4XVR (`cn.vr4p.oculus4xvrplayerov`, exact 2.0.22/20022), are recommended by default as of 2026-10-11; see the [README](README.md) status and credits section and `patches-list.json`.

## Current patch categories

All 30 selectable Steam Link patches use 7 categories in Morphe Manager 1.30.0 or newer.
Categories organize the list; exact-build guards, patch dependencies and defaults remain authoritative.
The retired entries below are historical records and are not selectable.

| Category | Count | Current patches |
|---|---:|---|
| Image quality | 4 | [Alpha-0 high-resolution trigger](#alpha-0-high-resolution-trigger-alpha0highresolutiontriggerpatch); [OLED color calibration](#oled-color-calibration-oledcalibrationpatch); [Blue-noise dithering](#blue-noise-dithering-bluenoisepatch); [Surface video + trigger (experimental)](#surface-video--trigger-experimental-surfacevideotriggerpatch) |
| Tracking & audio | 4 | [Visual Delay Fix](#visual-delay-fix-hmdonlypatch); [GXR face and tongue bridge](#gxr-face-and-tongue-bridge-gxrfacebridgepatch); [XR Input Routing Config](#xr-input-routing-config-xrinputroutingconfigpatch); [Microphone input preset](#microphone-input-preset-microphoneinputpresetpatch) |
| Startup & permissions | 4 | [Startup permission requests (before 5002322)](#startup-permission-requests-before-5002322-xrstartuppermissionspatch); [Startup splash and XR launch mode (before 5002322)](#startup-splash-and-xr-launch-mode-before-5002322-xrlauncherbootstrappatch); [Unrestricted battery usage](#unrestricted-battery-usage-unrestrictedbatteryusagepatch); [Appear on top (legacy)](#appear-on-top-legacy-appearontoppatch) |
| App & device identity | 4 | [Change package name](#change-package-name-changepackagenamepatch); [Device identity](#device-identity-deviceidentitypatch); Galaxy XR vendor driver; [OpenXR CPU and GPU BOOST](#openxr-cpu-and-gpu-boost-performanceboostpatch) |
| Advanced XR compatibility | 7 | [XR Core Runtime](#xr-core-runtime-xrcoreruntimepatch); [XR Device Config Baseline](#xr-device-config-baseline-xrdeviceconfigbaselinepatch); [XR Manifest Capability Pack](#xr-manifest-capability-pack-xrmanifestcapabilitypackpatch); [Android XR native permission names; Force HMD initialization gates; Force lobby permission-state gate; Force stream XR gates](#native-xr-compatibility-gates) |
| Controller | 5 | [Controller pose extrapolation](#controller-pose-extrapolation-controllerposeextrapolationpatch); [Controller velocity frame](#controller-velocity-frame-controllervelocityframepatch) (stable, recommended on every supported build); [Controller pose time (experimental)](#controller-pose-time-experimental-controllerposetimepatch) (all six builds); [Controller tracking from the controller HAL through Shizuku](#controller-tracking-from-the-controller-hal-through-shizuku-controllerhalposepatch); [Controller grip haptics through Shizuku](#controller-grip-haptics-through-shizuku-controllergriphapticspatch). Only Controller velocity frame is on by default. |
| Streaming & network | 2 | [Codecs Support](#codecs-support-xrcodecssupportpatch) (all six builds; experimental, recommended); [Network Optimizations](#network-optimizations-networkoptimizationspatch) (all six builds; recommended) |

## OpenXR CPU and GPU BOOST (`performanceBoostPatch`)

Experimental, default off, available only in the experimental catalog. Not part of any recommended set. Adds `lib/arm64-v8a/libgxr_performance_boost.so`
and `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_performance_boost.json`.
Existing APK code and rendering resources are unchanged. The layer requests CPU/GPU
BOOST on session creation/start; clocks and thermal policy remain runtime-controlled.
Other performance-hint layers or later application hints can override this request.
See [implementation and rollback](extensions/performance-boost/README.md) and
[validation](diagnostics/steamlink-performance-boost/validation-2026-10-18.md).

## Uber link rescan disable (experimental) — RETIRED 2026-10-11 (tested, did not work; removed from source)

**Status: tested on the headset with hitches unchanged; removed from `patches/src/main` on 2026-10-11. Do not re-add or re-derive this patch for the hitch regression.**

Separate, default-off patch with no dependencies/options for exact **2.0.23/5002363** only. Not included in the recommended set. Stops the post-startup interface rescans of the Uber UDP transport: NOPs the `bl ScanForLinkChanges` call sites at `0x174c74` (hidden NETLINK monitoring thread) and `0x16fdf8` (2.000001 s `Uber::Tick` fallback inside `SendCurrentAddressList`). The initial scan in `SetupScanningForLinkChanges` and the periodic address-list send stay intact.

- Only `lib/arm64-v8a/libvrlink_scene.so` changes: exactly 8 bytes, `17a30294`/`b6b60294` to `1f2003d5` at the two offsets; patched library SHA-256 `836803ef2140d347772eebe1118d4ad69b1e3e59f06570a1b46b55a06c6ca91b`.
- Exact version/build pair, size 2,292,008, raw GNU build ID `c31bb979123b76736930d3c820d8d0619fb5bed2`, both unique 32-byte stock windows and the containing region hashes (`0x174b8c`+476, `0x16fdb8`+464) guard the change; changed layouts fail closed and excluded builds return unchanged.
- After startup the stream cannot discover new links; do not switch networks while a stream is active. **Headset trial 2026-10-11 on the exact 2.0.23/5002363 patched APK: hitches unchanged — the interface-rescan family is ruled out.** [Experiment record](diagnostics/steamlink-hitches/EXPERIMENT-2026-10-11-uber-link-rescan-disable.md).

## FEC duplicate reservation guard (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: tested on the headset and did not resolve the hitching problem; removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch for the hitch regression.**

Separate, default-off patch with no dependencies/options for exact **2.0.22/5002322** and **2.0.23/5002363**. Not included in the recommended set. Changes the verified duplicate-check bypass to NOP at `0x167094` / `0x167f60`; all 4 instruction bytes are guarded with full-function identity and executable mapping checks.

Use with the matching bundle and current **Observe + pipeline telemetry**, starting from an original APK with stock UDP. Plain v1 decoder helper modes are rejected with this guard because their runtime function guards do not accept it. Older adaptations and the original v1 payloads remain unchanged. Runtime effectiveness was tested and did not resolve the regression; the skipped-frame allocation route and possible PC-side recovery delays remain unresolved. [Experiment record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-fec-duplicate-reservation.md).

## UDP receive buffer (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: live trial on 2.0.23/5002363 failed (freezes worse and longer); removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch for the hitch regression.**

Separate, default-off patch with no dependencies/options for exact **2.0.22/5002322** and **2.0.23/5002363**. Not included in the recommended set. Requests **8 MiB instead of 1 MiB** for the active VR UDP receive socket.

- Only `lib/arm64-v8a/libvrlink_scene.so` changes: instruction `08 02 a0 52` → `08 10 a0 52` at `0x1745a8` (5002322) or `0x1757a8` (5002363). The actual byte difference is at offset +1.
- Exact metadata, ELF mapping, size, GNU build ID and normalized full-function hash guard the change. Reapplication is idempotent; unknown/changed target layouts fail closed. Excluded exact builds return unchanged before file access.
- Coexists with the recommended set and **Observe + pipeline telemetry**; no new native payload, manifest edit or host setting. **Failed live trial on 2.0.23/5002363: freezes worsened despite 0 measured socket drops. Not recommended as a remedy.** Retained for reproducibility; 2.0.22/5002322 runtime remains untested. [Live result and rollback](diagnostics/steamlink-hitches/UDP-RESULTS-2026-09-15.md).

## Decoder input buffering (experimental) — RETIRED 2026-09-19 (tested, did not work; removed from source)

**Status: tested on 2.0.23/5002363 — whole-view freezes persisted; removed from `patches/src/main` on 2026-09-19. Do not re-add or re-derive this patch (including telemetry-only variants) for the hitch regression.**

Separate, default-off experiment for exact **2.0.22/5002322** and **2.0.23/5002363**. It has no dependencies and is absent from the recommended set. Select it separately alongside the matching bundle. **Buffered** stages incomplete compressed frames in bounded memory before synchronous codec submission; **Observe** adds counters to stock input handling.

- APK mutations: scene `DT_NEEDED` string at file offset `0x69656` (5002322) or `0x69925` (5002363), `libmediandk.so` → `libgxr_dbuf.so`; adds `lib/arm64-v8a/libgxr_dbuf.so` with a build-specific helper and configured mode.
- Runtime: plain modes retain the original v1 helper and its 11 guarded vtable/GOT pointers. Optional **Observe + pipeline telemetry** / **Buffered + pipeline telemetry** use a separate v2 resource and 18 guarded pointers, adding codec/image API timing and native fault-source tracing. No executable instructions, output images, shaders or OpenXR layers change. Conflicts fail activation; the original media dependency remains available.
- Limits: 24 lazy 4 MiB staging allocations per codec, 96 MiB maximum; real input capacity checked before copying. The stock 20 ms complete-frame acquisition wait and real-error recovery remain.
- [Exact layouts and hashes](diagnostics/steamlink-hitches/decoder-hook-layouts.json), [v1 tried record](diagnostics/steamlink-hitches/EXPERIMENT-2026-09-15-decoder-staging-v1.md), [v2 diagnostic capture](diagnostics/steamlink-hitches/TELEMETRY-2026-09-15.md). V1 did not solve the reported freezes. It was an 8th modern individual selection without changing the existing 6-patch recommended set, until retirement on 2026-09-19.

## Restored bases (2026-10-22)

Steam Link 2.0.20/5001812, 2.0.21/5001968 and 2.0.22/5002244 support was retired on 2026-10-21 and restored on 2026-10-22 with per-build native tables, compatibility entries, tests and catalogs. The restored pre-2363 builds share the same 21-patch recommended set. Historical retired/restored records stay under `diagnostics/`.

## Current adaptations

The current catalog supports exactly **2.0.20/5001712**, **2.0.20/5001812**, **2.0.21/5001968**, **2.0.22/5002244**, **2.0.23/5002363** and **2.0.24/5002395**. Compatibility uses the exact version name and build code, never a version range. Historical references to 5001740, 5002296, 5002313, 5002318, and 5002322 below do not make those builds selectable.

The four pre-2363 builds expose the same 24 standalone patches and recommend the same 21, including Codecs Support, Network Optimizations and Controller velocity frame. 2.0.23/5002363 and 2.0.24/5002395 each expose 11 individual patches and recommend 10. The OpenXR CPU and GPU BOOST patch is experimental and off by default. Morphe Manager auto-selects the set for the detected exact version and build. Appear on top and Change package name remain optional.

The GXR spacewarp layer remains limited to 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244 and 2.0.23/5002363: its bundled native layer embeds per-base scene/VTS profiles and has no 2.0.24 profile yet, so it is not advertised for 2.0.24.

The 5001712 reference is an analysis reconstruction, so its regression checks do not establish pristine-source APK patching. 5002244 has a reconstructed decoded fixture; 5001812 and 5001968 currently have decoded trees only.

Startup permissions and splash/XR launch-mode edits are separate patches, part of the default-enabled legacy recommended set. The 5002363 and 5002395 recommended sets preserve native startup and permission handling apart from the selected battery-settings hook. Manager 1.30.0 or newer with compatibility checks enabled is required for exact build-code filtering; Expert mode may still display incompatible patches.

### Steam Link 2.0.23 / 5002363

This exact pair exposes 11 core individual patches; the 10-patch recommended set is default-enabled: GXR face and tongue bridge, Alpha-0 high-resolution trigger, Microphone input preset, OLED color calibration, Blue-noise dithering (fovea default), Unrestricted battery usage, Visual Delay Fix, Network Optimizations, Codecs Support and Controller velocity frame. OpenXR CPU and GPU BOOST is experimental and off by default. Device identity is legacy-only: stock 2.0.23 identity is authoritative, so no identity patch is shipped for this build. Native targets: OLED shader `0x970a1`; format MOVs `0x10c840`, `0x10c8b0`, `0x10c920`; microphone `0xf44c0`; HMD pose hook `0x101f1c`; tongue block `0x141c6c`. High resolution uses the 3-projection API layer. Legacy mutations and retired experiments remain excluded.

See the [5002363 validation](diagnostics/steamlink-5002363/README.md), [native targets](diagnostics/steamlink-5002363/native-targets.md), and [Java/config targets](diagnostics/steamlink-5002363/surface-targets.md).

### Steam Link 2.0.24 / 5002395

This exact pair exposes the same 11 core individual patches and 10-patch recommended set as 2.0.23. The manifest and all four config assets are byte-identical to 2.0.23; only the SDL smali and native libraries changed. Device identity remains legacy-only. Native targets: OLED shader `0x97aae`; format MOVs `0x10da98`, `0x10db08`, `0x10db78`; microphone `0xf5710`; HMD pose hook `0x103174`; tongue block `0x1433ac`; Network scene `0x1682a0`/`0x169044`/`0x1772cc` and main `0x903634`; Codecs Support anchor `0xfe954` with 15 GOT slots. High resolution retains the verified 3-projection topology. The optional telemetry setting is not admitted for 2.0.24 yet and fails closed instead of installing an empty receipt.

See the [5002395 native validation](diagnostics/steamlink-5002395/README.md) and [native targets](diagnostics/steamlink-5002395/native-targets.md).

### Recommended set per exact build

The recommended set is the individual patches themselves, default-enabled and auto-selected for the detected exact version and build code.

On each exact pre-2363 build (2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244) the same 22 individual patches are default-enabled:

1. Android XR native permission names
2. Force HMD initialization gates
3. Force lobby permission-state gate
4. Force stream XR gates
5. GXR face and tongue bridge
6. Alpha-0 high-resolution trigger
7. Microphone input preset (`voice-recognition`)
8. OLED color calibration (`final-balanced`, `srgb8-highp`)
9. Unrestricted battery usage
10. Visual Delay Fix (`60` ms)
11. XR Core Runtime
12. XR Device Config Baseline
13. XR Input Routing Config
14. Startup splash and XR launch mode (before 5002322)
15. XR Manifest Capability Pack
16. Device identity (Galaxy XR identity, model `xrvst2ue`)
17. Startup permission requests (before 5002322)
18. Blue-noise dithering (fovea default, background opt-in; OLED's VD-like fovea toggle must stay off)
19. Codecs Support
20. Network Optimizations
21. Controller velocity frame

**Device identity** has no selector and is legacy-only: every pre-2363 base reports the Galaxy XR identity with model `xrvst2ue`, the headset's `Build.PRODUCT`. Stock 2.0.23 identity is authoritative; no native identity patch exists.

The legacy Device identity entry depends on XR Device Config Baseline, so the baseline runs before the
identity writer; the baseline itself no longer writes `hmd_config.json`. The Galaxy payload
preserves SamsungVST tracking and Galaxy XR controller/eye routing, and every runtime-selected HMD
entry reports the single model `xrvst2ue`.
Private/transitive support dependencies are deduplicated by Morphe; the counts above describe
direct public selections, not all internal tasks.

The recommended selection never broadens verified build guards. 2.0.20/5001712, 2.0.20/5001812 and 2.0.21/5001968 use the 2-projection alpha-0 payload; 2.0.22/5002244, 2.0.23/5002363 and 2.0.24/5002395 use the 3-projection alpha-0 payload. The three restored legacy bases retain array-shaped `requestedExtensions`; only 5001712 uses the special device-keyed conversion. Headset behavior remains a separate validation gate.

---

## androidxr group

### XR Core Runtime (`xrCoreRuntimePatch`)
**Default: enabled individually; part of the legacy recommended set** (legacy builds only)
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_xr_bridge.so` | New file (Galaxy XR OpenXR runtime bridge; its `gxr::TelemetryTransport` entry point is stubbed to `ret`, so no control/tracking socket can open) |
| `res/drawable-anydpi/ic_launcher_background.xml` | Full replace |
| `res/drawable-anydpi/ic_launcher_background_gradient.xml` | New file (resource ID 0x7f010000) |
| `res/values/public.xml` | Full replace (stable IDs: ic_launcher_background_gradient=0x7f010000, ic_launcher=0x7f010001/0x7f030000) |
| `res/values/ids.xml` | Create if missing (empty `<resources/>`) |
| Extension DEX (base APK) | Merges helper-only `extension.mpe`, which defines `GxrSdlBridge`; existing SDL/controller classes are edited only by the legacy build-aware bytecode step |

Sub-patch only (not exposed): `disablePermissionPromptNativePatch`
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x142c0c` (2.0.20/5001712) | 8 bytes: replaces the exact `RequestAndroidPermissions()` prologue with `movz w0,#1; ret` |

Selection uses exact `(versionName, versionCode)` before checking the pinned library size. A known exact pair with the wrong size or bytes fails closed; a wrong/unknown pair is unchanged. Native-XR builds 5002363 and 5002395 and unknown/excluded exact pairs return before reading the library.

---

### XR Device Config Baseline (`xrDeviceConfigBaselinePatch`)
**Default: enabled individually; part of the legacy recommended set** (legacy builds only) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `assets/config/controller_config.json` | Full replace — /interaction_profiles/oculus/touch_controller static props + pose action offset + input/haptic action bindings |
| `assets/config/default_config.json` | Full replace — `preflight.ignore_microphone_muted = false` |
| `assets/webui/dash/index.html` | Full replace — Steam Link dashboard HTML bootstrap |

`hmd_config.json` is deliberately not written here: Device identity is its only writer on every base.

---

### XR Manifest Capability Pack (`xrManifestCapabilityPackPatch`)
**Default: enabled individually; part of the legacy recommended set** (legacy builds only) — depends on `xrCoreRuntimePatch`
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
**Default: enabled individually; part of the legacy recommended set** — exact 2.0.20/5001712 only; native 5002363 and 5002395 are excluded.
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
**Default: enabled individually; part of the legacy recommended set** — exact 2.0.20/5001712 only; native 5002363 and 5002395 are excluded.

| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds missing `android.permission.HAND_TRACKING`, `EYE_TRACKING_FINE`, `FACE_TRACKING`, `RECORD_AUDIO`, and `BLUETOOTH_CONNECT` declarations |
| `AndroidManifest.xml` launcher | Routes through the shared transparent `GalaxyXRPermissionActivity`; leaves splash styling, picker sizing and XR start mode to the separate splash patch |
| `GalaxyXRPermissionActivity` | Enables runtime requests for those 5 permissions before Steam Link opens; shared helper flags for permission requests and the visible splash default to false |

Face and tongue bridge, high resolution and battery no longer select either public startup patch as an implicit dependency. Battery and Appear on top retain the transparent older-build settings bootstrap; neither enables runtime tracking/microphone/Bluetooth requests or the splash by itself.

---

### XR Input Routing Config (`xrInputRoutingConfigPatch`)
**Default: enabled individually; part of the legacy recommended set** (legacy builds only) — depends on `xrManifestCapabilityPackPatch`
| Artifact | Edit |
|---|---|
| `assets/config/ui_config.json` | Full replace — XR pointer aim/select bindings for touch_controller and hand_interaction_ext; haptic bindings |

---

### Controller pose extrapolation (`controllerPoseExtrapolationPatch`)
**Default: disabled** — no dependencies; all six supported builds. The layer hooks the runtime library and wraps `xrLocateSpace` for VRLink's controller pose action, which every base creates under the same name, so it does not depend on the base; measured on 5002363 only, 5001712 was not run.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_extrapolation.so` | New file (OpenXR implicit API layer; source `extensions/controller-extrapolation-layer`) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_extrapolation.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_EXTRAPOLATION`) |

No Steam Link code, shader or config is changed. The layer also wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action (`pamir-stream-pose`) and filters jitter out of the returned pose with a low-pass whose cutoff rises with the controller's speed (3 Hz + 60 Hz per m/s for the position, 3 Hz + 60 Hz per rad/s for the rotation); `debug.gxr.posefilter 0` turns it off and `debug.gxr.posefilter.*` tune it while streaming. The filter stands down while the controller HAL pose layer supplies the pose. Inside the Steam Link process the layer redirects the Galaxy XR runtime library's (`libopenxr_android.so`) import of `GetServerConfigurableFlag` so that `com.android.xr.flags.enable_controller_pose_extrapolation_consumer_side` reads as `true`; every other flag is passed through. `adb shell setprop debug.gxr.extrapolation 0` leaves the flag untouched (read at app start).

Measured on a Galaxy XR headset with 2.0.23/5002363 on 2026-10-04: stock, the runtime returned 90 distinct controller poses per second for VRLink's 360 `xrLocateSpace` calls and the same pose for "now" and "now + 30 ms"; with the flag forced, all 360 calls returned distinct poses and the pose depended on the requested time. Velocity still updates 90 times per second, so the added poses are the runtime's extrapolation, not new measurements. See the [layer notes](extensions/controller-extrapolation-layer/README.md).

---

### Controller velocity frame (`controllerVelocityFramePatch`)
**Default: enabled** (stable, recommended on all six supported builds) — no dependencies. It replaces the retired *Controller angular world to local* adapter: that adapter converted the root Velocity Frame module's base-space angular velocity into the local axes Steam Link 2.0.23 reads, and this layer already reports the angular velocity local to the streamed pose on 2.0.23. The root **OpenXR Velocity Frame** and **Steam Link Pose Time** modules refuse to run while this layer is mapped, so an APK built with it does not use those modules. One patch covers every supported base: the frame the angular velocity is reported in is chosen per build and written into the library's config block (`GXRVFRCFG0000001`, `angularWorld` at +20) — local to the streamed pose on 2.0.23/5002363 and 2.0.24/5002395, base space on 2.0.20/5001712. The 2.0.20/5001712 base uses the same pose action and, with this repository's `controller_config.json`, the same controller pose offset; the angles were measured on 5002363 only and the layer itself was not run on 2.0.20/5001712 (there it was installed together with the controller HAL tracking patch, which supplies the velocities).
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_velocity_frame.so` | New file (OpenXR implicit API layer; source `extensions/controller-velocity-frame-layer`); the patch sets the angular velocity frame in its config block |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_velocity_frame.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_VELOCITY_FRAME`) |

No Steam Link code, shader or config is changed. The Galaxy XR runtime reports the controller's linear and angular velocity in a frame attached to the controller instead of in the base space, and VRLink forwards both unchanged, so SteamVR sends thrown objects in the wrong direction. The layer wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action (`pamir-stream-pose`) and rewrites the chained velocity: the linear one is pitched by -62.85 degrees in the located pose's frame and rotated into the base space, the angular one is pitched by -42.25 degrees (42.25 degrees is the pitch of the grip pose against the controller HAL's pose; the measurement below was taken with -62.6 and -42). The angular one is then left local to the pose for VRLink 2.0.23/5002363, which reads it so, and rotated into the base space for VRLink 2.0.20/5001712, which hands it to SteamVR as a base-space vector (see the controller HAL tracking patch for the 2.0.20/5001712 measurement). Poses, other spaces and hand tracking are not touched. `adb shell setprop debug.gxr.velocity_frame 0` reports the runtime's velocities unchanged; `debug.gxr.velocity_pitch_linear` and `debug.gxr.velocity_pitch_angular` override the two angles and `debug.gxr.velocity_frame.angular local|world` the angular frame (all read when Steam Link starts).

Measured on the PC from the poses VRLink delivers, Galaxy XR headset with 2.0.23/5002363 on 2026-10-04, against the displacement of the streamed positions (left / right controller): the linear velocity's direction error went from 44 / 55 degrees to 15 / 17.5 degrees and the angular velocity's from 18 / 33 degrees to 12 / 14 degrees; speed stayed at 98-100% of the positions'. Independent of the controller pose extrapolation patch.

### Controller pose time (experimental) (`controllerPoseTimePatch`)
**Default: disabled** (experimental) — no dependencies; all six supported builds, Galaxy XR firmware I610UEU2AZF3. APK form of the root **Steam Link Pose Time** module. Option **Pose time compensation (ms)**: 0 to 30, default 5.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_pose_time.so` | New file (OpenXR implicit API layer; source `extensions/controller-pose-time-layer`); the patch writes the compensation into its config block (`GXRPTMCFG0000001`, `leadUs` at +20) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_pose_time.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_POSE_TIME`) |

No Steam Link file other than these two is changed. Stock VRLink sends every controller pose with a 0 time offset, so SteamVR dates it at the packet header; the Galaxy XR runtime labels each controller slot 28.82 ms after the sample it carries. The layer hooks the runtime's `consumePose` and Steam Link's `GetControllerState` and `SVLDataLink::SubmitMessage` through their function slots, binds each consumed label to the exact pose bytes, and writes `label - compensation - header` (microseconds) into the pose's time field at `+0x54`. Nothing else in the packet changes. 0 ms sends the raw label (least prediction, steady but trailing); 29 ms dates the pose at its sample (full prediction, most responsive, fast moves can jerk). Hooks are installed only for the pinned runtime hash, scene code hashes and original slot values, and not while the controller HAL pose or pose extrapolation layer is loaded; the patch rejects those two patches and edited scene code. `adb shell setprop debug.gxr.pose_time 0` disables it and `debug.gxr.pose_time.lead_us` overrides the compensation (read when Steam Link starts). Host-tested hook logic; not yet run as an APK layer on a headset. See the [layer notes](extensions/controller-pose-time-layer/README.md).

---

### Controller grip haptics through Shizuku (`controllerGripHapticsPatch`)
**Default: disabled** — no patch dependencies; all six supported builds. Needs [Shizuku](https://github.com/RikkaApps/Shizuku) on the headset.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_haptic_main.so` | New file (OpenXR implicit API layer; source `extensions/controller-grip-haptics`) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_haptic_main.json` | New file (layer manifest; disable env: `GXR_DISABLE_HAPTIC_MAIN`) |
| dex | New classes `gxr.haptic.HapticBridge`, `gxr.haptic.HapticService` from `extensions/controller-grip-haptics.mpe`; `gxr.shizuku.ShizukuBridge` and the Shizuku API 13.1.5 (`rikka.shizuku`, `rikka.sui`, `moe.shizuku`) from `extensions/shizuku-bridge.mpe`, shared with the controller HAL tracking patch |
| `AndroidManifest.xml` | Adds `uses-permission` `moe.shizuku.manager.permission.API_V23`, `queries` for `moe.shizuku.privileged.api`, `meta-data` `moe.shizuku.client.V3_SUPPORT` and the provider `gxr.shizuku.ShizukuBridge` with authority `<package>.shizuku` |

No Steam Link code, shader or config is changed. A Galaxy XR controller has a vibrator at the trigger and one in the grip; the system controller service sends every OpenXR vibration to the trigger one. The grip vibrator is reachable only through the controller HAL, which answers shell but not an application, so the shared provider asks Shizuku for permission at start and binds a Shizuku user service that relays to the HAL. The layer wraps `xrApplyHapticFeedback` and `xrStopHapticFeedback` and, while that service is connected, sends `XrHapticVibration` to the grip vibrator instead of the runtime. Without Shizuku or its permission every call goes to the runtime unchanged.

The layer generates the vibration itself and streams it to the grip vibrator as 8-bit samples in short chunks: a sine at half the requested frequency, capped at 130 Hz, with the amplitude mapped onto 0.2..0.8 by a square-root curve. `adb shell setprop debug.gxr.haptic 0|1|2` selects OpenXR only, grip (default) or grip and trigger; `debug.gxr.haptic.pcm 0` switches to the HAL's plain pulses; the other `debug.gxr.haptic.*` properties tune amplitude, tone and chunk length and are re-read while streaming. Checked by hand on a Galaxy XR headset with 2.0.23/5002363 on 2026-10-04 (SteamVR dashboard, Beat Saber); 2.0.20/5001712 makes the same OpenXR calls but was not run. See the [layer notes](extensions/controller-grip-haptics/README.md).

---

### Controller tracking from the controller HAL through Shizuku (`controllerHalPosePatch`)
**Default: disabled** — no patch dependencies. Needs [Shizuku](https://github.com/RikkaApps/Shizuku) on the headset. One patch covers both bases; the frame the angular velocity is reported in is chosen per build and written into the library's config block (`GXRHALCFG0000001`, `angularWorld` at +20). Run on 2.0.23/5002363 and 2.0.20/5001712.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_hal_pose.so` | New file (OpenXR implicit API layer; source `extensions/controller-hal-pose`); the patch sets the angular velocity frame in its config block |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_hal_pose.json` | New file (layer manifest; disable env: `GXR_DISABLE_CONTROLLER_HAL_POSE`) |
| dex | New classes `gxr.pose.PoseBridge`, `gxr.pose.PoseService` from `extensions/controller-hal-pose.mpe`; `gxr.shizuku.ShizukuBridge` and the Shizuku API 13.1.5 from `extensions/shizuku-bridge.mpe`, shared with the grip haptics patch |
| `AndroidManifest.xml` | Adds `uses-permission` `moe.shizuku.manager.permission.API_V23`, `queries` for `moe.shizuku.privileged.api`, `meta-data` `moe.shizuku.client.V3_SUPPORT` and the provider `gxr.shizuku.ShizukuBridge` with authority `<package>.shizuku` |

No Steam Link code, shader or config is changed. The Galaxy XR runtime hands an application one controller pose per display frame. The controller HAL fuses the controller's IMU about 1000 times per second and predicts a pose for the requested time, but answers shell only, so the shared provider asks Shizuku for permission at start and binds a Shizuku user service that reads the HAL. The layer wraps `xrLocateSpace` for the action spaces of VRLink's controller pose action (`pamir-stream-pose`) and reports the HAL's pose and velocities in place of the runtime's: its own thread reads the HAL 360 times per second (VRLink's own request rate), every pose and velocity goes through a speed-dependent low-pass, and VRLink's four requests per frame get the latest result. The HAL's linear velocity is turned into the base space and its angular velocity, which is in the controller's axes, by the grip pitch; for VRLink 2.0.20/5001712 the angular velocity is then rotated into the base space by the reported pose. The HAL is asked `lead` ahead of the reported time and its reply's pose is stepped back, but the reply's velocities belong to the time asked for, so the layer keeps the velocities of its recent reads by that time and reports those for the pose's own time. The controller velocity frame layer leaves the velocities alone. The runtime's pose is used only while the controller is nearly still, to learn where the session's base space sits in the HAL's world. Other spaces and hand tracking are not touched. Without Shizuku or its permission every call goes to the runtime unchanged.

`adb shell setprop debug.gxr.halpose 0` reports the runtime's pose unchanged and `debug.gxr.halpose.velocity 0` keeps the runtime's velocities; `debug.gxr.halpose.hz` sets the read rate (read when Steam Link starts) and `debug.gxr.halpose.ahead` the time the pose is reported for, in milliseconds after now, and `debug.gxr.halpose.lead` how far ahead of now the HAL is asked, and `debug.gxr.halpose.velocity_sync 0` reports each read's own velocities instead (all three re-read while streaming); `debug.gxr.halpose.angular local|world` overrides the angular velocity frame (read when Steam Link starts).

Measured on a Galaxy XR headset with 2.0.20/5001712 on 2026-10-06, against SteamVR (forward throws and wrist rotations; the poses Steam Link received were logged on the headset and compared with the poses SteamVR handed to applications): with the angular velocity local, SteamVR's angular velocity was 48-62 degrees off the controller's rotation and the linear velocity aimed 7.9 degrees below the motion; in the base space the angular velocity came within 3-13 degrees. Reported with the velocities of the read for the pose's time, the linear velocity aimed 1.4 degrees below the motion on the headset (7.4 degrees with each read's own velocities) while 2.2 % of the moving poses stepped backwards (26 % with `lead` 5 ms, which fixes the velocities the other way). Measured on a Galaxy XR headset with 2.0.23/5002363 on 2026-10-04: on still controllers the HAL's pose matches the runtime's grip pose to 0.04 degrees and 0.03 mm after a fixed 42.25-degree pitch; in motion the runtime's pose trailed the HAL's by about 35 ms; with the rate set to 1000, 912-936 HAL reads per second were reached in a stream with no controller freezing, and the pose looked no smoother than at 360; the HAL's velocities lie within 5 degrees of the motion of its own poses. Checked by hand in the SteamVR dashboard. See the [layer notes](extensions/controller-hal-pose/README.md).

---

### GXR face and tongue bridge (`gxrFacebridgePatch`)
**Default: enabled individually; part of the recommended set on all six supported builds** — one patch, per exact build: the face-bridge layer on the legacy bases (2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244; adds the guarded face-permission declaration without selecting startup patches), the tongue transport slots on exact 2.0.23/5002363 and 2.0.24/5002395.
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_face_bridge.so` (legacy builds) | New file (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json` (legacy builds) | New file (instance extension `XR_FB_face_tracking2`; disable env: `GXR_DISABLE_FACE_BRIDGE`) |
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x141c6c` (exact 2.0.23/5002363) | 24 bytes: transports Android tongue direction values while retaining standard FB2 TongueOut |
| `lib/arm64-v8a/libvrlink_scene.so` @ `0x1433ac` (exact 2.0.24/5002395) | Same 24-byte tongue transport block |
| `AndroidManifest.xml` `uses-permission` | Adds missing `android.permission.FACE_TRACKING` through the shared guarded manifest helper; stock 5002363 already declares it. No launcher, splash or runtime permission request is added. |

Preserves Valve's native `XR_ANDROID_face_tracking` mapping for expressions 0–62. The guarded 24-byte AArch64 replacement at `0x141c6c` (5002363) or `0x1433ac` (5002395) transports Android tongue direction values while retaining standard FB2 TongueOut. Exact library sizes: 2,292,008 bytes (5002363), 2,301,432 bytes (5002395); stock SHA-256: `628821feab199d7712be8a51273eb9a21ec440a7c91aa6a768cc7307a4fe22f0` and `5fab23a7eac1429c93520bdd4d7c579b75a6d55525a755379d15388272571a4b`. Original/already-patched block checks fail atomically on unknown layouts. Historical headset success on 5002322 is not runtime proof for either native adaptation.

| Output slot | Value |
|---|---|
| 63 | TongueOut transport copy |
| 64–67 | TongueLeft, TongueRight, TongueUp, TongueDown |
| 68 | Standard FB2 TongueOut |
| 69 | Standard TongueRetreat, preserved as zero |

---

### Appear On Top (legacy) (`appearOnTopPatch`)
**Default: disabled; exact 2.0.20/5001712 only** — retained as an overlay-based fallback.
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.SYSTEM_ALERT_WINDOW` (required for `GxrOverlayBridge` TYPE_APPLICATION_OVERLAY compositor window) |
| `AndroidManifest.xml` launcher | Adds/routes through `GalaxyXRPermissionActivity`; preserves the stock target SDK, XR features/categories, VRLink start mode, native permission routine, and controller config on the supported legacy build. Native 5002363 excludes this fallback. |
| Minimal extension DEX | Adds only `GalaxyXRPermissionActivity`, `GxrOverlayBridge`, and `GxrResolutionProbe`; contains no SDL/controller class fragments. |
| `SteamLink` lifecycle methods | Adds the overlay/resolution probe calls without modifying `SDLSurface`, `SDLControllerManager`, or generic-motion routing |

---

### Unrestricted Battery Usage (`unrestrictedBatteryUsagePatch`)
**Default: enabled individually; part of the recommended set on all six supported builds** — battery-only stock-activity hook on exact 5002363 and 5002395; transparent settings bootstrap on the legacy bases
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` |
| `GalaxyXRPermissionActivity` (earlier builds) | Opens the app-specific Battery usage page at startup when not unrestricted; falls back to the direct exemption prompt, then app details. Uses a transparent launcher with splash and runtime permission flags off unless separately selected. |
| `SteamLink.onCreate` (exact 2.0.23/5002363 and 2.0.24/5002395) | Invokes `GxrBatterySettings.request(Activity, Bundle)` after stock `SDLActivity.onCreate`, before stock parameter-register reuse; skips restored activity instances and already unrestricted apps |
| Battery extension DEX (5002363/5002395 call site) | Adds the battery-only settings helper with the same settings fallbacks; no replacement launcher, custom splash, XR start-mode override or additional runtime permission requests |

---

### Alpha-0 high-resolution trigger (`alpha0HighResolutionTriggerPatch`)
**Default: enabled individually; part of the recommended set** — all six supported builds.

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW` and sets `GXR_RESOLUTION_MODE=android_surface_trigger_passthrough_v1`; preserves stock launcher, splash and XR start mode. The explicit older splash patch owns the unmanaged Full Space override. |
| `lib/arm64-v8a/libgxr_ast.so` | Release-built, stripped implicit OpenXR API layer selected by exact build. Exact 2.0.20/5001712, 2.0.20/5001812 and 2.0.21/5001968 use the 2-projection alpha-0 payload: copies Valve's 2 projection pointers, places the quad at index 2, and submits 3 layers. Exact 2.0.22/5002244, 2.0.23/5002363 and 2.0.24/5002395 use the 3-projection alpha-0 payload: 3 pointers, quad at index 3, 4 layers. |
| Bundled `libgxr_ast_5001712.so` | 2-projection alpha-0 payload (`android-surface-trigger-2proj-alpha0-v2.0-20261025`) installed under the standard `libgxr_ast.so` name for exact 5001712, 5001812 and 5001968. |
| Bundled `libgxr_ast.so` | 3-projection alpha-0 payload (`android-surface-trigger-3proj-alpha0-v2.0-20261025`) for exact 5002244, 5002363 and 5002395. |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_android_surface_trigger_passthrough_v1.json` | Registers the surface-trigger API layer; disable environment is `GXR_DISABLE_ANDROID_SURFACE_TRIGGER`. |

The output remains Valve's native projection layout plus 1 fully transparent quad (alpha byte 0): 2 projections/4 views become 3 total layers on the 2-projection targets; 3 projections/6 views become 4 total layers on the 3-projection targets. Every validation, pointer-copy, pointer-log, and projection telemetry loop uses the selected source count, preventing the delayed out-of-bounds layer-3 read on 5001712. The layer performs no texture copy, shader draw, resampling, or projection reconstruction. The independent trigger Surface does not alter Valve's source handles or formats, so future RGB10_A2 projection sources remain reserved for unchanged passthrough.

The production helpers are compiled with `-O2`, dead-section elimination, and stripped symbols. They do not intercept `xrWaitFrame`, perform no periodic per-frame log formatting, construct the immutable trigger quad once per session, fill the fixed source-pointer array during mandatory topology validation, and skip that validation while the trigger is inactive. Cold lifecycle evidence plus the 1st 3 accepted submissions remain available to validate topology.

The current revisions are `android-surface-trigger-2proj-alpha0-v2.0-20261025` (2 projections, 5001712/5001812/5001968) and `android-surface-trigger-3proj-alpha0-v2.0-20261025` (3 projections, 5002244/5002363/5002395). A generation-validated, non-owning thread-local render cache replaces per-frame shared-ownership acquisition/release. The registry owns live sessions; lifecycle mutations invalidate cached lookups, including reused handles. Safe frame use relies on OpenXR's externally synchronized session/instance destruction, not on the generation counter alone. Event readers retain owned lookups, and event dispatch now requires exactly `XR_SUCCESS`, so `XR_EVENT_UNAVAILABLE` cannot process stale event data. Bundle definitions need no duplicate fix: they already depend on the main resolution patch and receive its rebuilt helper. Continuous terminal-quad submission remains unchanged; there is no GPU, resolution, or 10-bit behavior change intended, and no measured speed gain is claimed.

Host CTest checks of the actual registry and both 2-/3-projection helper integration paths passed. Both Android payloads rebuilt with NDK `27.2.12479018` and cached OpenXR `1.1.43` headers. The owner reported the alpha-0 trigger works correctly on 2.0.20/5001712; separate headset checks remain for 2.0.22/5002244 and 2.0.24/5002395. The accepted 2026-09-01 capture below belongs to the same append-only topology in an earlier helper and is prior behavioral evidence, not a runtime result for the new binaries.

For user A/B testing, retain the previous patch artifact and compare newly patched APKs from the same Steam Link base with identical patch options, host settings, and fixed scene. Check cold start, stream stop/restart, palm and DFR-UI transitions, and session/focus loss followed by resume. Report any sharpness change, crash, or failure to recover, alongside comparable CPU/GPU timings if available; lower GPU composition time is not an expected consequence of these CPU-only changes.

Both current exact bases have independent metadata and resource/manifest routing checks; the 5001712 layout uses the 2-projection alpha-0 helper. Historical 5001712 startup/frame-900 feedback is separate from the current local checks.

#### Historical headset validation (2.0.22/5002322; not a current target)

The 2026-09-01 accepted capture showed that the extension was hidden from enumeration but accepted
when explicitly requested: the function loaded, a 2x2 Surface was created and queued, and 4 sampled
`xrEndFrame` submissions preserved the original 3 projection pointers while successfully adding 1
terminal quad. No overlay permission, type-2038 Steam Link window, or recording contamination
existed. The headset palm A/B/A result was `MATCHES REFERENCE -> MATCHES REFERENCE -> MATCHES
REFERENCE`, establishing perceived parity with Valve's native 3-projection APK with Appear on top.

---

### Retired: Full-FOV foveal canvas — did not solve high resolution

Retired 2026-10-24 at the owner's request. The patch, native layer, helper, manifest and catalog entry are removed. It drew only the foveal projection on a transparent 5000×6000 canvas per eye and did not solve the high-resolution problem. The mode identity `foveal_canvas` and both file names remain cleanup-only so re-patching removes stale installations. Do not re-add. [Historical record](diagnostics/steamlink-foveal-canvas/README.md).

---

### Retired: Android-Surface Fovea — tried, did not work

On 2026-09-07 the user tested this experiment and reported: "It's not working."
Retired at the user's request. This was the actual 8-bit fovea-to-Android-Surface
experiment on Steam Link 2.0.22/5002322: 3 projections, copied fovea pixels, no
extra 2×2 quad. It was distinct from the earlier static-black underside test.

The selectable patch, native helper, build target and runnable diagnostic are
removed. Mode/library identifiers remain only for stale-resource cleanup. The
working high-resolution fix and the recommended set are unchanged. No new trace
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

### Surface video + trigger (experimental) (`surfaceVideoTriggerPatch`)
**Default: off; experimental catalog only** - exact 2.0.20/5001712.

| Artifact | Exact guarded edit |
|---|---|
| `lib/arm64-v8a/libgxr_surface_video_trigger.so` | Release-built, stripped implicit OpenXR API layer (`surface-video-trigger-2proj-v1.0-20261025`). Copies the two Valve sRGB8 projection images into Android Surface swapchains of the same size/alpha, re-points the two projection views at those Surface images, and appends a 2x2 fully transparent terminal trigger quad. RGB10/FP16 sources pass through. |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_surface_video_trigger_v1.json` | Registers the layer; disable environment is `GXR_DISABLE_SURFACE_VIDEO_TRIGGER`. |

This tests the standard-codec presentation mechanism (HEVC/AV1/H.264) without ASTC and without quad conversion. It is a GPU copy bridge, not a direct decoder-to-Surface bypass. It reads runtime images only after wait and before release, with no atlas reconstruction or fovea resampling. Only sRGB8 source swapchains are converted; RGB10 and FP16 frames pass through unchanged. Any frame without exactly two projection layers passes through unchanged. A transfer or runtime rejection disables the layer for the session and leaves later frames untouched. **Needs:** deselect Alpha-0 high-resolution trigger; both append a terminal trigger and the installer rejects either order. [Implementation and runtime check](extensions/surface-video-trigger/README.md). Headset validation is pending.

---

### Retired: Fovea and quad-only composition arms (2026-10-25)
**Removed after both arms produced low resolution on 2.0.20/5001712**

Two default-off API-layer arms replaced the fovea projection with per-eye quads, one keeping the background projection and one converting both projections to quads. Both stayed low-resolution. They were topology-only approximations: they did not add the reference standard-codec path's small trigger projection, and they reused Valve's projection swapchains instead of a runtime Surface-backed decoder output. The ASTC path was not replicated. The selectable patches, native source, payloads and manifests are removed. Do not re-add these arms as-is; the standard-codec mechanism requires a decoder-to-runtime-Surface experiment, not another quad conversion.

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
**Default: enabled individually; part of the recommended set on all six supported builds**

| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libvrlink_scene.so` | Replaces the verified AAudio input-preset `MOV W1` instruction with Voice Recognition by default |

The 5002363 layout is pinned to 2,292,008 bytes at `0xF44C0`; 5002395 is pinned to 2,301,432 bytes at `0xF5710`. The 5001712 adapter retains its existing unique semantic matcher. Exact pairs select these native layouts, which check surrounding code and supported preset instructions. All 4 preset values and base transitions are covered by the native audits.

---

### Visual Delay Fix (`hmdOnlyPatch`)
**Default: enabled individually; part of the recommended set on all six supported builds**
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
| 2.0.23/5002363 | 2,292,008 | `0x101F1C` |
| 2.0.24/5002395 | 2,301,432 | `0x103174` |

---

### Native XR Compatibility Gates
**Default: enabled individually; part of the legacy recommended set** (legacy builds only)
| Patch | 2.0.20/5001712 |
|---|---|
| Android XR native permission names | `0x99924`, `0xA1A7F` |
| Force HMD initialization gates | `0xFFE20`, `0xFFE28` |
| Force lobby permission-state gate | `0x10DB10` |
| Force stream XR gates | `0x116564`, `0x11656C`, `0x116620` |

The independently decoded 5001712 layout is 2,221,072 bytes with stock SHA-256 `80b62797c7e26d6b67b0cca00693b076a336bdb48ebc1383a16cccb1616ed495`. Every fixed layout is selected by exact `(versionName, versionCode)` and expected size, then validates all local stock or already-patched bytes before writing atomically. A wrong exact pair sharing a known size is unchanged. The permission-name patch retains its intentional unique-pattern fallback only for genuinely unknown sizes; fixed gate patches leave unknown layouts unchanged.

---

### OLED Color Calibration (`oledCalibrationPatch`)

Enabled by default; part of the recommended set on all six supported builds. Exact current
native adaptations are **2.0.20/5001712**, **2.0.23/5002363** and **2.0.24/5002395**.
The single `foveaVdLike` toggle selects the
same **VD-informed SDR foveal processing**, based on VD's HEVC 10-bit PCVR path; the
former 10-bit/8-bit key pair selected the same processing.

| Option | Default | Behavior |
|---|---|---|
| `profile` | `final-balanced` | Gamma 1.20, saturation 1.45; applies to the base layer, and also the fovea when the VD option is off |
| `gamma` | `1.20` | Custom-profile range 0.50–2.50 |
| `saturation` | `1.45` | Custom-profile range 0.00–3.00 |
| `foveaVdLike` | `false` | VD-informed SDR foveal processing: highp foveal sampling with Valve color correction, bypassing the calibration profile and adding no shader noise. The former 10-bit and 8-bit declarations selected the same processing and merged into this toggle |
| `fovealGamma` | `1.00` | Extra foveal gamma after the selected RGB processing; range 1.00–1.30, step 0.01. 1.00 preserves existing output; higher values darken only the fovea. Works with the VD option on or off. |

The merged `foveaVdLike` toggle does not negotiate the host codec.
Output remains `GL_SRGB8_ALPHA8`. The calibrated common prefix/base program is
unchanged; only the separately assembled masked suffix receives the SDR override.
The toggle off with `fovealGamma=1.00` restores the original suffix. The original alpha
expression and fade survive. Foveal gamma is applied before fade and before optional
blue-noise quantization; the entire background shader remains unchanged. For a lighter
foveal region, begin at 1.02 and adjust cautiously: this is manual compensation, not a
verified fix for the cause of the visible boundary. A positive black-level offset will
not necessarily be corrected by gamma alone. See [validation](diagnostics/steamlink-colour/FOVEAL-GAMMA-2026-09-25.md).
Historical RGB10/FP16/noise helpers remain internal for audits, not selectable output modes.
Leave this toggle off when selecting separate blue-noise dithering.

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

### Blue-noise dithering (`blueNoisePatch`)

**Recommended and default-enabled on both exact bases; included in the stable catalog and the
per-build recommended set. The foveal layer is on by default; the background layer is opt-in.**
Exact bases: **2.0.20/5001712**, **2.0.23/5002363**, **2.0.24/5002395**.

The two former per-layer patches merged into one selectable patch with two independent
layer toggles. 8-bit and 10-bit input always share the same final 8-bit sRGB quantizer,
so the depth declaration was removed: the dither serves the output quantizer, which is
identical for both depths, and there is no stream-depth branch for the client to pick.

| Option | Default | Behavior |
|---|---|---|
| `fovea` | `true` | Static blue noise on the foveal (masked) layer only; verifies the exact foveal draw caller and the 8-bit sRGB framebuffer/write state per draw. The base draw is excluded. |
| `background` | `false` | Static blue noise on the complete base projection, including the part underneath the foveal overlay; only the exact opaque shader and background draw caller are eligible, and the foveal program is not dithered by this selection. |

A static, original 128×128 R8 blue-noise tile selects neighboring 8-bit output codes
**after** colour processing and fade. The original alpha is preserved. The helper
recognizes exact full shader hashes per layer and verifies the exact native draw caller
per layer and the 8-bit sRGB framebuffer/write state. Recognized reloads are rewritten;
unknown host replacements pass through unchanged. Compile/link/resource failures restore
the original shader/program. Both toggles off leave the APK unchanged. The helper merges
the owned configurations independently of toggle order, and each program remains
restricted to its own layer's draw. The existing framebuffer, unknown-shader,
compile/link/resource fallback, GL-state restoration and OLED compatibility rules
apply to both layers.

It works independently of OLED calibration. To combine them, leave **OLED's VD-like
fovea toggle off**; the blue-noise finalizer validates and hashes the final calibrated
prefix. Other/previously dithered prefixes are rejected to avoid stacking dithers.
This is an independent blue-noise implementation, not a copy of VD's algorithm.

See the [original algorithm](diagnostics/steamlink-blue-noise-ditering/README.md) and
[current layer selection and validation](diagnostics/steamlink-background-blue-noise/README.md).

When changing a Morphe selection, start from the original APK. Deselecting a patch
does not undo modifications already embedded in a previously patched APK. Bundled
helpers from the older fovea-only implementation are rejected rather than overwritten.

---

### Network Optimizations (`networkOptimizationsPatch`)
**Default: enabled individually; part of the recommended set on 2.0.23/5002363 and 2.0.24/5002395**

- Loss fallback instead of aborting the stream; backtrack window 6 → 12
- No decoder flush on `TRY_AGAIN`
- Transmit buffer `SO_SNDBUF` raised 128 KiB → 1 MiB
- No bitrate, resolution, or drop-policy change

Exact 2.0.23/5002363 and 2.0.24/5002395; headset validation pending. See the [diagnostic record](diagnostics/steamlink-hitches/NETWORK-OPTIMIZATIONS-2026-10-13.md).

---

### Codecs Support (`xrCodecsSupportPatch`)
**Default: enabled individually; recommended on all six supported builds**. 1 patch selects its pinned scene contract and runtime decoder layout by exact version/build. The optional telemetry setting remains off by default.

- Bundles the `libgxr_codecs_support.so` OpenXR implicit layer: detects H.264 / AV1 in the first access unit and rebuilds the HEVC decoder in place; stock HEVC streams are untouched
- Pairs with the GalaxyXR driver Stream codec setting (`nvencCodec`: 1 = H.264, 2 = AV1)
- The layer identity-checks the scene library against pinned per-base code anchors and fails closed on unknown layouts; other patches' scene edits are tolerated while the pinned decoder-import regions stay byte-identical
- Headset validation pending on 2.0.23/5002363 and 2.0.24/5002395; each build's native layout guards are unchanged. The optional telemetry setting is not admitted for 2.0.24 yet and fails closed.
- v6 live-verified on 2.0.20/5001712 (AV1 alignment 2026-10-14, H.264 stage-4 decode 2026-10-15); requires a SteamVR restart and a stream reconnect
- v7/v8 (2026-10-21) keep the helper resident and resolve its originals from `libmediandk`; v6 crashed with SIGSEGV on every stream entry after the first because the reloaded layer inherited dead wrapper pointers, and v7 crashed inside the loader while creating a later instance because the pinned layer still held the previous instance's chain link. v8 live validation pending
- Removing this patch: repatch from the original APK and set the driver Stream codec back to HEVC first — an unpatched client cannot decode an H.264/AV1 stream (driver uninstall needs no ordering: its setting is removed with the driver)
- Records: [AV1 v6 TD-OBU fix](diagnostics/steamlink-streaming/2026-10-14-codecs-support-v6-td-obu-fix.md), [H.264 stage-4 verification](diagnostics/steamlink-streaming/2026-10-15-h264-stage4-verification.md), [v7 layer-reload crash](diagnostics/steamlink-streaming/2026-10-21-codecs-support-v7-layer-reload-crash.md)

---

## identity group

### Device identity (`deviceIdentityPatch`)
**Default: enabled; part of the recommended set on the legacy bases** — writes the Galaxy XR identity with the single model number `xrvst2ue` on every legacy base. Native 5002363 and 5002395 keep the separate optional entry below.

| Artifact | Edit |
|---|---|
| `assets/config/hmd_config.json` (legacy builds) | Installs the bundled Galaxy XR identity payload: `unknown`, `xrvst2` and `xrvst2ue` entries with model `xrvst2ue`, `SamsungVST` tracking, `Samsung` manufacturer and `{vrlink}` input/render roots; 2.0.20/5001712 additionally converts `requestedExtensions` to the headset-keyed object for those three products |

`xrvst2ue` is this headset's `Build.PRODUCT` and therefore the `vrlink_<model>` section name the
PC-side VRLink driver reads, so a patched legacy build routes to the same section as an unpatched
2.0.23 build. There is no headset selector: the Quest Pro / PICO 4 Pro spoof profiles, the
`profile` option and their payloads were removed.

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
| `lib/arm64-v8a/libvrlink_scene.so` | `disablePermissionPromptNativePatch` (layout-specific 8 B), native permission/gate patches, `hmdOnlyPatch` (hook + cave + velocity), `gxrFacebridgePatch` (24 B on 5002363/5002395), `oledCalibrationPatch` (1087-byte GLSL block plus guarded swapchain instructions), `blueNoisePatch` (11 exact dependency/import/loader strings and sRGB8 instructions; finalizes after optional calibration) |
| `assets/config/hmd_config.json` | `deviceIdentityPatch` (legacy payload) and the optional `galaxyXrVendorDriverPatch` (resource roots/controller rewrite; it also rewrites the headset model to `Galaxy XR`, so it must not be combined with the `xrvst2ue` routing) — one writer per base |
| `AndroidManifest.xml` | `xrManifestCapabilityPackPatch`, `xrLauncherBootstrapPatch`, `xrStartupPermissionsPatch`, shared face-tracking declaration used by `gxrFacebridgePatch`, `unrestrictedBatteryUsagePatch`, `appearOnTopPatch`, `alpha0HighResolutionTriggerPatch`, `changePackageNamePatch` |
| `SteamLink.onCreate` (5002363/5002395) | `nativeBatterySettingsPatch`: battery-only settings hook; earlier builds use the guarded transparent bootstrap |
| `lib/arm64-v8a/libgxr_ast.so` | `alpha0HighResolutionTriggerPatch` |
| `res/values/ids.xml` | `androidXrLibPatch`, `gxrFacebridgeLibPatch` (all: idempotent create-if-missing only) |
| `lib/arm64-v8a/libgxr_codecs_support.so` | `xrCodecsSupportPatch` (new file on exact 5001712, 5002363 and 5002395) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_codecs_support.json` | `xrCodecsSupportPatch` (new file on exact 5001712, 5002363 and 5002395; disable env: `GXR_DISABLE_CODECS_SUPPORT`) |

`oledCalibrationPatch` is the only active shader-block writer. The retained unregistered
`VideoDither.kt` helper recognizes stock, legacy-calibrated, and highp states for tests; there is no
active legacy dither dependency. The separate blue-noise patch leaves the embedded
shader block unchanged and installs its shared guarded native runtime rewriter as `libgxd.so`.
