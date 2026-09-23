# Patch Catalog — steamlink-patches

Reference for conflict detection when importing external patches.
Each entry lists the exact APK artifact and value(s) a patch writes or modifies.

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

## Existing adaptations

Steam Link 2.0.20 build 5001712 has an independently decoded base and exact guarded layouts for the permission prompt, legacy native gates, OLED/output precision, controller cadence, and Visual Delay Fix. These adaptations are statically validated; APK installation and headset runtime validation remain pending. Steam Link 2.0.20 build 5001740 is an exact static-analysis legacy target with its own guarded native layout. Its available source is a reconstruction from a malformed hybrid APK; pristine-APK Morphe patching, installation, and headset runtime validation remain pending.
Steam Link 2.0.20 build 5001712 and the other legacy recommendation bundle use the same 17
direct patches listed below. Steam Link 2.0.22 build 5002318 uses a 9-patch
recommendation with GXR face bridge (version 5002318 and below), while build 5002322 recommends only 6 patches:
GXR tongue bridge (version 5002322 and above), Galaxy XR
high-resolution 3-projection fix, Microphone input preset (`voice-recognition`), OLED color
calibration (`final-balanced`, recommended `srgb8-highp` output), Unrestricted battery usage, and Visual
Delay Fix (`60` ms). Appear on top is excluded from 5002322. Video dither is removed as a
selectable patch; the OLED patch offers optional dithering, disabled by default.

Startup permission requests and startup splash/XR launch-mode changes are separate, default-off
patches selected explicitly by the older-build bundles. Both exclude exact 2.0.22/5002322;
its 6-patch bundle preserves stock launcher, splash, XR start mode and runtime permission handling,
with only the selected battery patch adding a battery-settings hook. The revised startup flows
have not been validated on a headset; historical native-rendering results below remain separate evidence.

Morphe Manager 1.7 cannot distinguish builds that share versionName `2.0.22`; build-code
filtering requires Manager 1.22 or newer with compatibility checks enabled. Expert mode may
still display incompatible patches by design. Morphe has only a global patch `default` flag, so 5
exact-build dependency bundles own all defaults while the individual patches remain default-off and
selectable wherever their verified compatibility permits. The legacy foundation bundle covers exact
builds 5001740 and 5002244. Builds 5002296 and 5002313 have no automatic
bundle. Appear on top and Change package name remain optional and are never recommended.

### Steam Link 2.0.23 / 5002363

All 7 applicable individual patches and a separate 6-patch recommended bundle support this exact pair. Native targets: OLED shader `0x970a1`; format MOVs `0x10c840`, `0x10c8b0`, `0x10c920`; microphone `0xf44c0`; HMD pose hook `0x101f1c`; tongue block `0x141c6c`. High resolution reuses the verified 3-projection API layer and does not modify Valve renderer bytes. Battery settings hooks stock `SteamLink.onCreate`; optional identity fills exact product entries. Legacy patches, old startup replacements and retired experiments stay excluded. Earlier build addresses and selections remain unchanged.

See the [full 5002363 evidence and validation](diagnostics/steamlink-5002363/README.md), [native targets](diagnostics/steamlink-5002363/native-targets.md), and [Java/config targets](diagnostics/steamlink-5002363/surface-targets.md). Older build-specific details below continue to describe their named bases.

### Steam Link 2.0.23 / 5002363

All 7 applicable individual patches and a separate 6-patch recommended bundle support this exact pair. Native targets: OLED shader `0x970a1`; format MOVs `0x10c840`, `0x10c8b0`, `0x10c920`; microphone `0xf44c0`; HMD pose hook `0x101f1c`; tongue block `0x141c6c`. High resolution reuses the verified 3-projection API layer and does not modify Valve renderer bytes. Battery settings hooks stock `SteamLink.onCreate`; optional identity fills exact product entries. Legacy patches, old startup replacements and retired experiments stay excluded. Earlier build addresses and selections remain unchanged.

See the [full 5002363 evidence and validation](diagnostics/steamlink-5002363/README.md), [native targets](diagnostics/steamlink-5002363/native-targets.md), and [Java/config targets](diagnostics/steamlink-5002363/surface-targets.md). Older build-specific details below continue to describe their named bases.

### Recommendation bundles

| Bundle | Exact targets | Direct patch set |
|---|---|---|
| `Galaxy XR recommended set (2.0.20/5001712)` | 2.0.20/5001712 | 17-patch legacy set below, including Device identity with Meta Quest Pro spoof |
| `Galaxy XR recommended set (2.0.22/5002322)` | 2.0.22/5002322 | Only the 6 final patches above |
| `Galaxy XR recommended set (2.0.23/5002363)` | 2.0.23/5002363 | Same 6 modern patches, independently mapped native addresses; Device identity optional |
| `Galaxy XR recommended set (2.0.23/5002363)` | 2.0.23/5002363 | Same 6 modern patches, independently mapped native addresses; Device identity optional |
| `Galaxy XR recommended set (2.0.22/5002318)` | 2.0.22/5002318 | 9-patch set using the full face bridge, Device identity with Galaxy XR identity, and both explicit startup patches |
| `Galaxy XR legacy foundation (through 2.0.22/5002244)` | 2.0.20/5001740, 2.0.22/5002244 | Same 17-patch legacy set as 5001712, including Meta Quest Pro spoof; unavailable native adaptations remain guarded no-ops |

Both legacy bundles directly select:

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

Leave **HMD identity** on **Recommended**, or explicitly choose **Meta Quest Pro**, for either
legacy bundle. Recommended resolves by exact version/build: 2.0.20/5001712 and 5001740, plus
2.0.22/5002244 use `meta-quest-pro`. The 5002318 recommendation retains
Galaxy XR identity; 5002322 still does not select Device identity. Saved explicit Samsung, Stock,
or PICO choices remain respected and must be changed if the Quest spoof is wanted.

Device identity depends on XR Device Config Baseline, so the baseline runs before the identity
override. The legacy Quest payload preserves SamsungVST tracking, Galaxy XR controller and eye
routing; only the 3 runtime-selected HMD model values change to `Oculus Quest Pro`.
Private/transitive support dependencies are deduplicated by Morphe; the counts above describe
direct public selections, not all internal tasks.

Selecting a bundle never broadens verified build guards. The high-resolution helper and mode
metadata are not installed on 5001740: its projection topology has no
verified adaptation. These bundles are not proof that every requested
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

Selection uses exact `(versionName, versionCode)` before checking the pinned library size. A known exact pair with the wrong size or bytes fails closed; a wrong/unknown pair is unchanged. Native-XR builds 5002318 and 5002322 return before reading the library. Build 5002296 reaches this internal patch through the explicit older startup splash patch's guarded XR foundation dependency.

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

### Startup splash and XR launch mode (before 5002322) (`xrLauncherBootstrapPatch`)
**Default: disabled individually; selected by both legacy bundles and the 5002318 bundle** — exact 2.0.20/5001712, 2.0.20/5001740 and 2.0.22/5002244, 5002296, 5002313, 5002318 only; depends on the guarded `xrManifestCapabilityPackPatch` and shared launcher helpers
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `application/activity@android:name` | Adds `com.valvesoftware.steamlink.GalaxyXRPermissionActivity` (exported=true, MAIN/LAUNCHER, 1280×800px layout) |
| `AndroidManifest.xml` direct `application/property` | Removes application-wide `android.window.PROPERTY_XR_ACTIVITY_START_MODE` (present in 5002313) before applying activity-specific modes |
| `AndroidManifest.xml` VR activity/property | Adds `android.window.PROPERTY_XR_ACTIVITY_START_MODE = XR_ACTIVITY_START_MODE_FULL_SPACE_UNMANAGED`; recognizes later `VRLink` or 5001740's `android.app.NativeActivity` with `android.app.lib_name=vrlink_scene` |
| `AndroidManifest.xml` VR activity/intent-filter/category | Adds `org.khronos.openxr.intent.category.IMMERSIVE_HMD` on legacy foundation builds; preserves native 5002318 intent routing |
| `AndroidManifest.xml` `SteamLink activity/intent-filter` | Removes LAUNCHER intent-filter |
| `AndroidManifest.xml` `SteamLink activity/layout` | Sets `android:defaultWidth=1536.0px`, `android:defaultHeight=960.0px` on legacy foundation builds; preserves native 5002318 picker dimensions |
| `GalaxyXRPermissionActivity` | Enables the black "Launching Steam Link" screen; runtime permission requests remain disabled unless the separate permission patch is selected |

### Startup permission requests (before 5002322) (`xrStartupPermissionsPatch`)
**Default: disabled individually; selected by both legacy bundles and the 5002318 bundle** — same exact earlier-build targets as the splash patch; no 5002322 compatibility or runtime mutation

| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds missing `android.permission.HAND_TRACKING`, `EYE_TRACKING_FINE`, `FACE_TRACKING`, `RECORD_AUDIO`, and `BLUETOOTH_CONNECT` declarations |
| `AndroidManifest.xml` launcher | Routes through the shared transparent `GalaxyXRPermissionActivity`; leaves splash styling, picker sizing and XR start mode to the separate splash patch |
| `GalaxyXRPermissionActivity` | Enables runtime requests for those 5 permissions before Steam Link opens; shared helper flags for permission requests and the visible splash default to false |

Face bridge, tongue bridge, high resolution and battery no longer select either public startup patch as an implicit dependency. Battery and Appear on top retain the transparent older-build settings bootstrap; neither enables runtime tracking/microphone/Bluetooth requests or the splash by itself.

---

### XR Input Routing Config (`xrInputRoutingConfigPatch`)
**Default: disabled individually; selected by both legacy recommendation bundles** (legacy builds only) — depends on `xrManifestCapabilityPackPatch`
| Artifact | Edit |
|---|---|
| `assets/config/ui_config.json` | Full replace — XR pointer aim/select bindings for touch_controller and hand_interaction_ext; haptic bindings |

---

### Controller Velocity Fix (`controllerVelocityPatch`)
**Default: disabled** (experimental) — depends on `xrCoreRuntimePatch`
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_controller_velocity.so` | New file with embedded config patched at magic `GXRVELCFG0000001` |
| `lib/arm64-v8a/libvrlink_scene.so` `QSVLClient::OnTopOfFrame` | Optional exact-layout AArch64 edits select stock 4×, evenly phased 2×, or display-rate 1× controller pose events while retaining the final type-2 frame-update event; verified layouts: versionCodes 5001712, 5001740, 5002244, 5002313 |
| config block `+32` (int64 LE) | `maxDeltaMs × 1,000,000` nanoseconds — default 50 ms |
| config block `+40` (float32 LE) | `maxLinearSpeed` m/s — default 20.0 |
| config block `+44` (float32 LE) | `maxAngularSpeed` rad/s — default 50.0 |
| config block `+48` (float32 LE) | `smoothing` EMA weight — default 0.0 |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_controller_velocity.json` | New file (OpenXR implicit API layer manifest; disable env: `GXR_DISABLE_CONTROLLER_VELOCITY`) |

**Option:** `poseSendCadence` — `stock-4x` (default), `half-2x`, or `display-1x`. Actual sends per second equal the active display rate multiplied by 4, 2, or 1. Non-stock modes fail closed on unrecognized native layouts.

---

### GXR Face Bridge (version 5002318 and below) (`gxrFacebridgePatch`)
**Default: disabled individually; compatible only through build 5002318 and selected by the 2 legacy bundles plus the 5002318 bundle** — adds the guarded face-permission declaration without installing a launcher or requesting runtime permissions
| Artifact | Edit |
|---|---|
| `lib/arm64-v8a/libgxr_face_bridge.so` | New file (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) |
| `assets/openxr/1/api_layers/implicit.d/XR_APILAYER_local_GalaxyXR_face_bridge.json` | New file (instance extension `XR_FB_face_tracking2`; disable env: `GXR_DISABLE_FACE_BRIDGE`) |
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.FACE_TRACKING` |

---

### GXR Tongue Bridge (version 5002322 and above) (`gxrModernTongueBridgePatch`)
**Default: disabled individually; exact 2.0.22/5002322 only and selected by its recommended bundle**

Headset test on 2026-09-04: the user reported that this exact-build patch works.

Preserves Valve's native `XR_ANDROID_face_tracking` mapping for expressions 0–62. A guarded
24-byte AArch64 replacement at `libvrlink_scene.so` virtual/file offset `0x140EA4` exposes the
otherwise discarded Android tongue direction values while retaining standard FB2 TongueOut.
The exact library size is 2,283,400 bytes and the recorded stock SHA-256 is
`e61baf34dfc4749d92561bab5fee47891d271607a0ce44824ff61c3e6a450c3f`.
The patch accepts only the complete original or already-patched 24-byte block and fails atomically
for any other layout.

| Output slot | Value |
|---|---|
| 63 | TongueOut transport copy |
| 64–67 | TongueLeft, TongueRight, TongueUp, TongueDown |
| 68 | Standard FB2 TongueOut |
| 69 | Standard TongueRetreat, preserved as zero |
| `AndroidManifest.xml` | Adds missing `android.permission.FACE_TRACKING` through the shared guarded manifest helper; stock 5002322 already declares it. No launcher, splash or runtime permission request is added. |

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
**Default: disabled individually; selected by all 4 recommendation bundles** — battery-only stock-activity hook on exact 5002322; transparent settings bootstrap on exact earlier builds
| Artifact | Edit |
|---|---|
| `AndroidManifest.xml` `uses-permission` | Adds `android.permission.REQUEST_IGNORE_BATTERY_OPTIMIZATIONS` |
| `GalaxyXRPermissionActivity` (earlier builds) | Opens the app-specific Battery usage page at startup when not unrestricted; falls back to the direct exemption prompt, then app details. Uses a transparent launcher with splash and runtime permission flags off unless separately selected. |
| `SteamLink.onCreate` (exact 2.0.22/5002322) | Invokes `GxrBatterySettings.request(Activity, Bundle)` after stock `SDLActivity.onCreate`, before stock parameter-register reuse; skips restored activity instances and already unrestricted apps |
| Battery extension DEX (5002322 call site) | Adds the battery-only settings helper with the same settings fallbacks; no replacement launcher, custom splash, XR start-mode override or additional runtime permission requests |

---

### Galaxy XR high-resolution 3-projection fix (`xrGalaxyXrHighResolutionPatch`)
**Default: disabled individually; selected by all 4 recommendation bundles, but remains a guarded no-op on unsupported builds** — exact 2.0.20/5001712 and 2.0.22 builds 5002244, 5002296, 5002313, 5002318, and 5002322 only

| Artifact | Exact guarded edit |
|---|---|
| `AndroidManifest.xml` | Removes `SYSTEM_ALERT_WINDOW` and sets `GXR_RESOLUTION_MODE=android_surface_trigger_passthrough_v1`; preserves stock launcher, splash and XR start mode. The explicit older splash patch owns the unmanaged Full Space override. |
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

### OLED Color Calibration (`oledCalibrationPatch`)

Default off individually; selected by the existing recommendation bundles. Exact current
native adaptations are **2.0.20/5001712**, **2.0.22/5002244**, and **2.0.23/5002363**.
The existing option keys and defaults are retained. Both depth options now select the
same **VD-informed SDR foveal processing**, based on VD's HEVC 10-bit PCVR path.

| Option | Default | Behavior |
|---|---|---|
| `profile` | `final-balanced` | Gamma 1.20, saturation 1.45; applies to the base layer, and also the fovea when both VD options are off |
| `gamma` | `1.20` | Custom-profile range 0.50–2.50 |
| `saturation` | `1.45` | Custom-profile range 0.00–3.00 |
| `foveaVdLike10Bit` | `false` | Declares 10-bit input; highp foveal sampling with Valve color correction, no added gamma/saturation or shader noise |
| `foveaVdLike8Bit` | `false` | Same foveal processing for declared 8-bit input; cannot recover lost input precision |

The 2 depth options are mutually exclusive and do not negotiate the host codec.
Output remains `GL_SRGB8_ALPHA8`. The calibrated common prefix/base program is
unchanged; only the separately assembled masked suffix receives the SDR override.
Both off restores the original suffix. The original alpha expression and fade survive.
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
Exact bases: **2.0.20/5001712**, **2.0.22/5002244**, **2.0.23/5002363**.

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

See the [implementation, reproducible checks and remaining runtime gaps](diagnostics/steamlink-blue-noise-ditering/README.md).

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
| `recommended` | Default: `Oculus Quest Pro` for exact 2.0.20/5001712, 2.0.20/5001740, and 2.0.22/5002244; Galaxy XR for other supported targets |
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
| `lib/arm64-v8a/libvrlink_scene.so` | `disablePermissionPromptNativePatch` (layout-specific 8 B), native permission/gate patches, `hmdOnlyPatch` (hook + cave + velocity), `controllerVelocityPatch` (controller cadence instructions in `QSVLClient::OnTopOfFrame`), `gxrModernTongueBridgePatch` (5002322-only 24 B), `oledCalibrationPatch` (1087-byte GLSL block plus guarded swapchain instructions), `fovealBlueNoisePatch` (11 exact dependency/import/loader strings and sRGB8 instructions; finalizes after optional calibration) |
| `assets/config/hmd_config.json` | `xrDeviceConfigBaselinePatch` (baseline), `deviceIdentityPatch` (profile override — intentional) |
| `AndroidManifest.xml` | `xrManifestCapabilityPackPatch`, `xrLauncherBootstrapPatch`, `xrStartupPermissionsPatch`, shared face-tracking declaration used by `gxrFacebridgePatch` and `gxrModernTongueBridgePatch`, `unrestrictedBatteryUsagePatch`, `appearOnTopPatch`, `xrGalaxyXrHighResolutionPatch`, `changePackageNamePatch` |
| `SteamLink.onCreate` (5002322) | `nativeBatterySettingsPatch`: battery-only settings hook; earlier builds use the guarded transparent bootstrap |
| `lib/arm64-v8a/libgxr_ast.so` | `xrGalaxyXrHighResolutionPatch` |
| `res/values/ids.xml` | `androidXrLibPatch`, `controllerVelocityPatch`, `gxrFacebridgeLibPatch` (all: idempotent create-if-missing only) |

`oledCalibrationPatch` is the only active shader-block writer. The retained unregistered
`VideoDither.kt` helper recognizes stock, legacy-calibrated, and highp states for tests; there is no
active legacy dither dependency. The separate `fovealBlueNoisePatch` leaves the embedded
shader block unchanged and installs its guarded native runtime rewriter as `libgxd.so`.
