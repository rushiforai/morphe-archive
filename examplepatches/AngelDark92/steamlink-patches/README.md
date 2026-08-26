# 🥽 Steam Link GalaxyXR Patches

[Morphe](https://morphe.software) patches that make Steam Link work on the Samsung Galaxy XR (SM-I610).

## ❓ About

Steam Link VR (`com.valvesoftware.steamlinkvr`) was not built for Android XR. These patches adapt it to run on the Samsung Galaxy XR headset by injecting the missing OpenXR permissions and features, bundling the Galaxy XR XR-bridge native library, providing an optional standalone face-bridge layer for face-tracking, fixing broken permission flows, tuning the rendering pipeline, and optionally allowing the patched APK to coexist with the original install.

Target APK: `com.valvesoftware.steamlinkvr` v2.0.22. Exact supported versionCodes are 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, and 5002322. Build 5002318 exposes Device identity, Microphone input preset, OLED color calibration, Appear on top, GXR face bridge, Visual Delay Fix, Unrestricted battery usage, Video dither, and the experimental XR projection patches. Build 5002322 exposes the requested six recommended patches plus the optional experimental XR projection patches.

Use Morphe Manager 1.22 or newer with compatibility checks enabled for build-specific filtering. Manager 1.7 cannot distinguish APKs that share versionName `2.0.22`, and Expert mode may intentionally show incompatible patches. Build 5002322 recommends only Appear on top, GXR face bridge, Microphone input preset, Unrestricted battery usage, Video dither, and Visual Delay Fix. Older builds retain their historical recommended defaults. Experimental and legacy-only patches default off.

To download it:
1. Open steam console `steam://open/console`
2. In the steam console tab run `download_depot 250820 250824 634053834998054244`
3. After steam reports download complete retrieve the apk from `C:\Program Files (x86)\Steam\steamapps\content\app_250820\depot_250824\drivers\vrlink\resources\android-steamlinkvr-release.apk` and copy it onto your headset
4. Select it with Morphe. For build 5002322, normal compatibility-filtered mode recommends only Appear on top, GXR face bridge, Microphone input preset, Unrestricted battery usage, Video Dither, and Visual Delay Fix. Morphe has no per-build `default` field, so exact compatibility filtering preserves the older-build recommendations while excluding Device identity and the standalone OLED patch from 5002322. Video Dither still executes its coupled OLED calibration dependency. No desktop IP, pairing token, APK hash, or native telemetry enrollment is required. For face/tongue tracking, install VRCFaceTracking plus the matching [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT), then enable Steam Link OSC, eye sharing, face sharing, and output port 9015.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.10.0](https://github.com/AngelDark92/steamlink-patches/releases/tag/v1.10.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;22 patches total
<details open>
<summary>📦 Steam Link&nbsp;&nbsp;•&nbsp;&nbsp;19 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.22 (5001712) | 2.0.22 (5002172) | 2.0.22 (5002206) | 2.0.22 (5002244) | 2.0.22 (5002313) | 2.0.22 (5002318) | 2.0.22 (5002322) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Verified Steam Link 2.0.22 build 5001712. | Verified Steam Link 2.0.22 build 5002172. | Verified Steam Link 2.0.22 build 5002206. | Verified Steam Link 2.0.22 build 5002244. | Verified Steam Link 2.0.22 build 5002313. | Build 5002318 supports Device identity, Microphone input preset, OLED color calibration, Appear on top, GXR face bridge, Visual Delay Fix, Unrestricted battery usage, Video dither, and the experimental XR projection patches. | Build 5002322 recommends only Appear on top, GXR face bridge, Microphone input preset, Unrestricted battery usage, Video dither, and Visual Delay Fix. Experimental XR projection patches remain optional. |

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Android XR native permission names](#android-xr-native-permission-names) | Replaces native Oculus face/eye permission checks with the Android XR permission names used by Galaxy XR. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [Appear on top](#appear-on-top) | Adds SYSTEM_ALERT_WINDOW to the manifest so GalaxyXRPermissionActivity can request overlay permission at startup. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [Change package name](#change-package-name) | Renames the app package so it can be installed alongside the original Steam Link. Default appends '.gxr'. Changing the package name may break features that rely on the original identity. | 5001712, 5002172, 5002206, 5002244, 5002313 | • Package name |
| [Controller velocity fix](#controller-velocity-fix) | Derives current controller linear and angular velocity from grip/aim pose history and can reduce VRLink's stock four controller pose sends per display frame. | 5001712, 5002172, 5002206, 5002244, 5002313 | • Maximum sample gap (ms)<br>• Controller pose-send cadence<br>• Derived velocity smoothing<br>• Maximum linear speed (m/s)<br>• Maximum angular speed (rad/s) |
| [Device identity](#device-identity) | Overrides the HMD identity reported to SteamVR. The Galaxy profile installs its complete transport identity while preserving stock controller/hand routing and extensions. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318 | • HMD identity |
| [Force HMD initialization gates](#force-hmd-initialization-gates) | Bypasses the two verified capability gates in QSVLDeviceHmd::Init for Steam Link builds 5002244 and 5002313. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [Force lobby permission-state gate](#force-lobby-permission-state-gate) | Bypasses the verified permission-state gate in XrSceneLobby for Steam Link builds 5002244 and 5002313. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [Force stream XR gates](#force-stream-xr-gates) | Bypasses the three verified XR gates in build 5002244. Build 5002313 rewrote XrSceneStream::Init and is intentionally left unchanged. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [GXR face bridge](#gxr-face-bridge) | Installs libgxr_face_bridge.so (XR_FB_face_tracking2 → XR_ANDROID_face_tracking API layer) and adds android.permission.FACE_TRACKING to the manifest. See the [GXR Face Bridge source](https://github.com/compdoge/gxr-face-bridge) and matching [Galaxy XR VRCFT module](https://github.com/compdoge/LinkFT). | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [Microphone input preset](#microphone-input-preset) | Selects the Android AAudio microphone processing mode used by Steam Link. Galaxy XR testing found Voice Recognition clearer and louder than stock Voice Communication. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Microphone mode |
| [OLED color calibration](#oled-color-calibration) | Calibrates Galaxy XR OLED color and selects a guarded high-precision video output path for Steam Link builds 5002244, 5002313, 5002318, and 5002322. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318 | • Calibration profile<br>• Gamma<br>• Saturation<br>• Video output precision |
| [Unrestricted battery usage](#unrestricted-battery-usage) | Opens Android's per-app Battery usage page at startup so Unrestricted can be selected for XR streaming. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [Video dither](#video-dither) | Enables or disables VRLink video dithering, including the highp sRGB8 fallback and experimental RGB10_A2 shader variants. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Enable dither |
| [Visual Delay Fix](#visual-delay-fix) | Adds a configurable offset to the HMD OpenXR pose-query time and zeroes all six exported HMD velocity fields. Does not affect controller paths. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 | • Pose offset (ms) |
| [XR Core Runtime](#xr-core-runtime) | Installs the Galaxy XR runtime bridge resources and extension DEX foundation used by other XR patches. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Device Config Baseline](#xr-device-config-baseline) | Installs baseline Galaxy XR HMD/controller/default config payloads and dashboard bootstrap assets. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Input Routing Config](#xr-input-routing-config) | Installs ui_config.json mappings for XR pointer/button routing in launcher UI flows. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Launcher Bootstrap (Home Space)](#xr-launcher-bootstrap-home-space) | Installs GalaxyXRPermissionActivity as launcher and configures Steam Link/VRLink activity XR startup wiring. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |
| [XR Manifest Capability Pack](#xr-manifest-capability-pack) | Adds Android XR/OpenXR permissions, features, runtime queries, and app-level XR properties. | 5001712, 5002172, 5002206, 5002244, 5002313 |  |

</details>

<details open>
<summary>📦 Steam Link Experimental&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.22 (5001712) | 2.0.22 (5002172) | 2.0.22 (5002206) | 2.0.22 (5002244) | 2.0.22 (5002313) | 2.0.22 (5002318) | 2.0.22 (5002322) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Experimental XR projection patches for Steam Link 2.0.22 build 5001712. | Experimental XR projection patches for Steam Link 2.0.22 build 5002172. | Experimental XR projection patches for Steam Link 2.0.22 build 5002206. | Experimental XR projection patches for Steam Link 2.0.22 build 5002244. | Experimental XR projection patches for Steam Link 2.0.22 build 5002313. | Experimental XR projection patches for Steam Link 2.0.22 build 5002318. | Experimental XR projection patches for Steam Link 2.0.22 build 5002322. |

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [XR projection quality settings](#xr-projection-quality-settings) | Permission-free A/B. Requests quality supersampling and sharpening on Steam Link projection layers when the enabled runtime extension supports it. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [XR projection settings stripped](#xr-projection-settings-stripped) | Permission-free A/B. Removes only known FB projection-settings nodes while preserving all other layer metadata and failing open when unsafe. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |
| [XR projection trace control](#xr-projection-trace-control) | Read-only permission-free control. Forwards Steam Link frames unchanged while tracing its foveated projection composition. | 5001712, 5002172, 5002206, 5002244, 5002313, 5002318, 5002322 |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building

```
./gradlew buildAndroid
```

Output: `patches/build/libs/patches-*.mpp`

No Android SDK is required. The extension DEX is assembled from smali sources directly by the build.

## 📜 License

Steam Link GalaxyXR Patches are licensed under the [GNU General Public License v3.0](LICENSE)
