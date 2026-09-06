# Technical reference

Implementation notes, compatibility details, validation status, and build instructions for Steam Link GalaxyXR Patches. For installation and patch selection, see the [README](README.md).

## Compatibility and implementation notes

Steam Link VR (`com.valvesoftware.steamlinkvr`) was not built for Android XR. These patches adapt it to run on the Samsung Galaxy XR headset by injecting the missing OpenXR permissions and features, bundling the Galaxy XR XR-bridge native library, providing an optional standalone face-bridge layer for face-tracking, fixing broken permission flows, tuning the rendering pipeline, and optionally allowing the patched APK to coexist with the original install.

Target APK: `com.valvesoftware.steamlinkvr`. Exact compatibility metadata and guarded adaptations include v2.0.20 builds 5001712 and 5001740 plus v2.0.22 builds 5002172, 5002206, 5002244, 5002313, 5002318, and 5002322. The high-resolution patch additionally recognizes only exact v2.0.22 build 5002296. The available 5001740 source is an analysis reconstruction from a malformed hybrid APK, so pristine-APK Morphe patching, installation, and headset runtime validation remain pending. The permission-free high-resolution fix accepts exact builds 5001712, 5002244, 5002296, 5002313, 5002318, and 5002322; only 5002322 has headset validation, while the other decoded-base adaptations are statically validated. Reconstruction, quad-view, permission-matrix, warm-up/omit, and DFR re-arm experiments are retired.

Use Morphe Manager 1.22 or newer with compatibility checks enabled for build-specific filtering. Manager 1.7 cannot distinguish APKs that share versionName `2.0.22`, and Expert mode may intentionally show incompatible patches. Morphe's `default` flag is global, so 4 exact-build dependency bundles provide version-aware recommendations while every individual patch remains default-off. Both legacy bundles select the same [16-patch set](PATCH_CATALOG.md#recommendation-bundles), including the 3 native force-gate patches, all required XR foundation patches, and Device identity with the Meta Quest Pro spoof. Build 5002322 selects only GXR tongue bridge (native face tracking), Galaxy XR high-resolution fix, Microphone input preset (Voice Recognition), OLED color calibration (`final-balanced`), Unrestricted battery usage, and Visual Delay Fix (60 ms). The full GXR face bridge is restricted to exact lower builds through 5002318 so it cannot replace Valve's native 5002322 face mappings. Build 5002318 remains a separate native-XR-safe set with Galaxy XR Device identity. Builds 5002296 and 5002313 retain expert-selectable patches but no automatic bundle. **Appear on top (legacy)** and **Change package name** are never recommended.

For legacy bundles through 5002244, including **2.0.22/5002244** and **2.0.20/5001712**, leave **HMD identity** on **Recommended for this build** or explicitly choose **Meta Quest Pro**. The spoof reports `Oculus Quest Pro` while retaining Galaxy XR tracking/controller routing. Existing saved explicit Samsung, Stock, or Pico choices are respected, so change those if necessary. The automatic recommendation still resolves to Galaxy XR on 5002318; 5002322 has no identity patch.

Bundle selection does not broaden native compatibility: high-resolution output remains unavailable on 5001740, 5002172, and 5002206; the 3 force-gate edits also remain unavailable on 5002172 and 5002206. Those edits safely skip instead of guessing native layouts. Both 5001712 and 5002244 have the complete legacy set available.

**Video dither is retired from all catalogs and bundles.** OLED-generated shaders default to dithering off, while preserving the calibration profile and output precision. [Developer opt-in instructions](PATCH_CATALOG.md#video-dither-retired-developer-opt-in) retain the information needed to enable it in a local build; no dither checkbox remains in Morphe.

### Retired underside experiment — 2026-09-03

The user reported that the 2.0.22/5002322 Surface-backed underside experiment
"doesn't work" and requested retirement. Its option, implementation, build target
and bundled resources are removed. No new capture was reviewed, so the cause and
GPU effect remain undetermined. The tested terminal quad is the only active mode;
both existing helper binaries, including 2.0.20/5001712, remain unchanged.

### Terminal-quad helper CPU revision — 2026-09-03

The shared resolution patch now supplies 3-projection helper `v1.4-20260903` and 5001712 2-projection helper `v1.2-20260903`. Its generation-validated, non-owning render-thread cache removes steady-frame shared-ownership reference-count operations while the registry retains session ownership. It relies on OpenXR's externally synchronized destruction; lifecycle changes invalidate cached handles. Event readers still acquire ownership, and `xrPollEvent` dispatch processes data only for `XR_SUCCESS`, never `XR_EVENT_UNAVAILABLE`. Existing recommendation bundles automatically receive these helpers through their unchanged resolution-patch dependency.

Host CTest registry and actual 2-/3-projection helper integration checks passed, as did both Android rebuilds using NDK `27.2.12479018` and cached OpenXR `1.1.43` headers. These revisions have no headset result or measured speed gain yet. All 6 exact supported version/build pairs, continuous 2x2 quad submission, source formats, and GPU work remain unchanged; this does not enable 10-bit output. Compare against the previous artifact with the same base, scene, options, and host settings, checking cold launch, stop/restart, palm/DFR transitions, and loss/resume. See the [patch catalog](PATCH_CATALOG.md#galaxy-xr-high-resolution-3-projection-fix-xrgalaxyxrhighresolutionpatch) for validation boundaries and A/B guidance.


## Additional setup context

The previous README described 2.0.20/5001712 as more stable according to community reports and 2.0.22/5002244 as newer but less stable. This is historical community reporting, not a controlled comparison or a guarantee for a particular setup. The depot commands for both builds remain in the [installation instructions](README.md#1-get-the-steam-link-vr-apk).

No desktop IP, pairing token, APK hash, or native telemetry enrollment is required to apply the recommended patches.

## Full patch list

This section is generated from the patch catalog during releases.

<!-- PATCHES_START EXPANDED -->
> **[v1.14.0](https://github.com/AngelDark92/steamlink-patches/releases/tag/v1.14.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;24 patches total
<details open>
<summary>📦 Steam Link&nbsp;&nbsp;•&nbsp;&nbsp;24 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.20 (5001740) | 2.0.20 (5001712) | 2.0.22 (5002172) | 2.0.22 (5002206) | 2.0.22 (5002244) | 2.0.22 (5002313) | 2.0.22 (5002318) | 2.0.22 (5002322) | 2.0.20 (5001712) | 2.0.22 (5002244) | 2.0.22 (5002296) | 2.0.22 (5002313) | 2.0.22 (5002318) | 2.0.22 (5002322) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Static-analysis adaptation for Steam Link 2.0.20 build 5001740; pristine-APK patching and runtime validation remain pending. | Verified Steam Link 2.0.20 build 5001712. | Verified Steam Link 2.0.22 build 5002172. | Verified Steam Link 2.0.22 build 5002206. | Verified Steam Link 2.0.22 build 5002244. | Verified Steam Link 2.0.22 build 5002313. | Build 5002318 recommends its native-Android-XR-safe set: Galaxy XR high-resolution 3-projection fix, Device identity, Microphone input preset, OLED color calibration, GXR face bridge, Visual Delay Fix, and Unrestricted battery usage. Appear on top remains an optional legacy fallback. | Build 5002322 recommends Galaxy XR high-resolution 3-projection fix, GXR tongue bridge, Microphone input preset (Voice Recognition), Unrestricted battery usage, Visual Delay Fix (60 ms), and OLED color calibration with the Final balanced tested profile. The retired projection experiments are excluded. | Exact Steam Link 2.0.20/5001712 high-resolution target with its isolated 2-projection to 3-layer payload. The topology correction has prior user-reported startup and delayed-frame runtime evidence; this rebuilt binary remains uninstalled. | Static decoded-base adaptation of the Galaxy XR high-resolution patch for exact Steam Link 2.0.22 build 5002244; headset validation pending. | Static decoded-base adaptation of the Galaxy XR high-resolution patch for exact Steam Link 2.0.22 build 5002296; headset validation pending. | Static decoded-base adaptation of the Galaxy XR high-resolution patch for exact Steam Link 2.0.22 build 5002313; headset validation pending. | Static decoded-base adaptation of the Galaxy XR high-resolution patch for exact Steam Link 2.0.22 build 5002318; headset validation pending. | Headset-validated Galaxy XR high-resolution patch target for exact Steam Link 2.0.22 build 5002322. |

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Android XR native permission names](#android-xr-native-permission-names) | Replaces native Oculus face/eye permission checks with the Android XR permission names used by Galaxy XR, including the verified Steam Link 5001712 layout. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [Appear on top (legacy)](#appear-on-top-legacy) | Legacy overlay-permission fallback retained for older Steam Link builds. Adds SYSTEM_ALERT_WINDOW and the compositor signal window. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318 |  |
| [Change package name](#change-package-name) | Renames the manifest package and Steam Link's internal VR-launch component so the patched app can coexist with the original installation. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 | • Package name |
| [Controller velocity fix](#controller-velocity-fix) | Derives current controller linear and angular velocity from grip/aim pose history and can reduce VRLink's stock four controller pose sends per display frame. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 | • Maximum sample gap (ms)<br>• Controller pose-send cadence<br>• Derived velocity smoothing<br>• Maximum linear speed (m/s)<br>• Maximum angular speed (rad/s) |
| [Device identity](#device-identity) | Overrides the HMD identity reported to SteamVR. Recommended selects Meta Quest Pro for exact legacy bundle targets through 5002244, including 2.0.20/5001712; otherwise Galaxy XR. The Galaxy profile installs its complete transport identity while preserving stock controller/hand routing and extensions. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318 | • HMD identity |
| [Force HMD initialization gates](#force-hmd-initialization-gates) | Bypasses the two verified capability gates in QSVLDeviceHmd::Init for Steam Link builds 5001712, 5001740, 5002244, and 5002313. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [Force lobby permission-state gate](#force-lobby-permission-state-gate) | Bypasses the verified permission-state gate in XrSceneLobby for Steam Link builds 5001712, 5001740, 5002244, and 5002313. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [Force stream XR gates](#force-stream-xr-gates) | Bypasses the three verified XR gates in builds 5001712, 5001740, and 5002244. Build 5002313 rewrote XrSceneStream::Init and is intentionally left unchanged. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [GXR face bridge (version 5002318 and below)](#gxr-face-bridge-version-5002318-and-below) | For exact older Steam Link builds only. Installs libgxr_face_bridge.so (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) and adds android.permission.FACE_TRACKING to the manifest. See the [GXR Face Bridge source](https://github.com/compdoge/gxr-face-bridge) and matching [Galaxy XR VRCFT module](https://github.com/compdoge/LinkFT). | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318 |  |
| [GXR tongue bridge (version 5002322 and above)](#gxr-tongue-bridge-version-5002322-and-above) | For modern Steam Link builds with Valve's native Android XR face mapping. Currently verified and enabled only for exact build 5002322; newer builds require a separately verified native layout. Preserves Valve's face expressions and standard TongueOut while exposing Galaxy XR tongue out/left/right/up/down to the matching Galaxy XR VRCFT module. | 5002322 |  |
| [Galaxy XR high-resolution 3-projection fix](#galaxy-xr-high-resolution-3-projection-fix) | Permission-free resolution fix for exact builds 5001712, 5002244, 5002296, 5002313, 5002318, and 5002322. Preserves each build's native projection layout (2 layers on 2.0.20/5001712; 3 layers on supported 2.0.22 builds) and source formats, including future RGB10_A2, while appending a static 2x2 Android-surface compositor trigger with no image copy or reconstruction. | 5001712, 5002244, 5002296, 5002313, 5002318, 5002322 |  |
| [Galaxy XR legacy foundation (through 2.0.22/5002244)](#galaxy-xr-legacy-foundation-through-2-0-22-5002244) | Selects the 16-patch Galaxy XR legacy set, including Meta Quest Pro identity, native gates, face bridge, OLED calibration, microphone, battery, Visual Delay, and XR foundation. High-resolution output is guarded to verified layouts; unavailable on 5001740, 5002172, and 5002206. | 5001740, 5002172, 5002206, 5002244 |  |
| [Galaxy XR recommended set (2.0.20/5001712)](#galaxy-xr-recommended-set-2-0-20-5001712) | Applies the 16-patch Galaxy XR legacy set for exact Steam Link 2.0.20 build 5001712, including Meta Quest Pro identity, permission-free high resolution, and the Final balanced tested OLED profile. | 5001712 |  |
| [Galaxy XR recommended set (2.0.22/5002318)](#galaxy-xr-recommended-set-2-0-22-5002318) | Applies the existing native-Android-XR-safe Galaxy XR patch set for exact Steam Link 2.0.22 build 5002318. | 5002318 |  |
| [Galaxy XR recommended set (2.0.22/5002322)](#galaxy-xr-recommended-set-2-0-22-5002322) | Applies the validated permission-free Galaxy XR patch set for exact Steam Link 2.0.22 build 5002322, including the Final balanced tested OLED profile. | 5002322 |  |
| [Microphone input preset](#microphone-input-preset) | Selects the Android AAudio microphone processing mode used by Steam Link. Galaxy XR testing found Voice Recognition clearer and louder than stock Voice Communication. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Microphone mode |
| [OLED color calibration](#oled-color-calibration) | Calibrates Galaxy XR OLED color and selects a guarded high-precision video output path for Steam Link builds 5001712, 5001740, 5002244, 5002313, 5002318, and 5002322. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Calibration profile<br>• Gamma<br>• Saturation<br>• Video output precision |
| [Unrestricted battery usage](#unrestricted-battery-usage) | Opens Android's per-app Battery usage page at startup so Unrestricted can be selected for XR streaming. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [Visual Delay Fix](#visual-delay-fix) | Adds a configurable offset to the HMD OpenXR pose-query time and zeroes all six exported HMD velocity fields. Does not affect controller paths. Its trampoline uses a dedicated executable mapping over non-runtime ELF comment bytes and preserves live PLT entries. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Pose offset (ms) |
| [XR Core Runtime](#xr-core-runtime) | Installs the Galaxy XR runtime bridge resources and extension DEX foundation used by other XR patches. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Device Config Baseline](#xr-device-config-baseline) | Installs baseline Galaxy XR HMD/controller/default config payloads and dashboard bootstrap assets. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Input Routing Config](#xr-input-routing-config) | Installs ui_config.json mappings for XR pointer/button routing in launcher UI flows. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Launcher Bootstrap (Home Space)](#xr-launcher-bootstrap-home-space) | Installs GalaxyXRPermissionActivity as launcher and configures the Steam Link VR activity XR startup wiring. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Manifest Capability Pack](#xr-manifest-capability-pack) | Adds Android XR/OpenXR permissions, features, runtime queries, and app-level XR properties. | 5001712, 5001740, 5002172, 5002206, 5002244, 5002313 |  |

</details>

<!-- PATCHES_END -->

## Building from source

```
./gradlew buildAndroid
```

Output: `patches/build/libs/patches-*.mpp`

No Android SDK is required. The extension DEX is assembled from smali sources directly by the build.

## Documentation maintenance

Release automation refreshes the full patch list in this file and commits it with the release metadata. To refresh it locally from an existing catalog:

```powershell
$env:PYTHONIOENCODING = 'utf-8'
python .github/scripts/generate_patches_readme.py AngelDark92/steamlink-patches main patches-list-all.json TECHNICAL_REFERENCE.md
```

The generator also defaults to `TECHNICAL_REFERENCE.md` when no output path is supplied. Keep the README focused on user setup; update its bundle guidance when patch recommendations change.

## Further reference

- [Patch catalog](PATCH_CATALOG.md): per-patch edits, dependencies, guarded layouts, and retired video-dither opt-in instructions.
- [Debugging guide](DEBUGGING.md): diagnostic capture procedures.
- [Changelog](CHANGELOG.md): release history.
