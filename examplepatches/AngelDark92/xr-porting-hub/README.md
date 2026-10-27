# XR Porting Hub — Quest & Pico apps on Android XR

[![Morphe](https://img.shields.io/badge/Morphe-1.30.0%2B-6f42c1?style=flat-square)](https://morphe.software)
[![Device](https://img.shields.io/badge/Device-Galaxy%20XR-1428A0?style=flat-square)](#apps)
[![Release](https://img.shields.io/github/v/release/AngelDark92/xr-porting-hub?style=flat-square)](https://github.com/AngelDark92/xr-porting-hub/releases)
[![License](https://img.shields.io/github/license/AngelDark92/xr-porting-hub?style=flat-square)](LICENSE)

[Morphe](https://morphe.software) patches that run **Meta Quest / Pico apps on Android XR devices**, starting with the **Samsung Galaxy XR (SM-I610)**.

> **For the best Spacewarp or Optical Flow experience:** use the [Galaxy XR Driver](https://github.com/AngelDark92/GalaxyXR-Driver) on your PC.

## Apps

| App | Package | Supported builds | Patches by |
|---|---|---|---|
| Steam Link VR | `com.valvesoftware.steamlinkvr` | 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395 | AngelDark92; controller tracking and haptics by [@4uva4ek](https://github.com/4uva4ek) |
| 4XVR | `cn.vr4p.oculus4xvrplayerov` | 2.0.22/20022 | [@logkim1](https://github.com/logkim1/4XVR-GalaxyXR) |

- **Steam Link VR** streams SteamVR from your PC. Patches fix resolution, color/OLED, microphone, controller tracking, permissions and startup.
- **4XVR** is a 4X clarity, MVC 3D and HDR video player. The port adds Galaxy XR launch, controller models, HDR/playback, 72 Hz, 5.1 audio, subtitles and the launch-critical, default-on Meta platform decoupling; the premium unlock (no purchase check) is experimental and off by default.

## Quick start

**You need:**

- A Samsung Galaxy XR; for Steam Link, a PC with Steam and SteamVR.
- [Morphe Manager](https://morphe.software) **1.30.0+ on the headset**.
- An exact-build APK, plus this repository's [source](https://morphe.software/add-source?github=AngelDark92/xr-porting-hub) (add it in Morphe) or [`.mpp`](https://github.com/AngelDark92/xr-porting-hub/releases) (import it).

### 1. Get the app APK (Meta store)

1. On your PC, install [DownQ for Chrome](https://chromewebstore.google.com/detail/downq/clocmpojdjmikkaepgkmplgooejmnchb) ([Firefox port](https://addons.mozilla.org/en-US/firefox/addon/downq-for-firefox/), unofficial, not runtime-tested).
2. Open the store page and sign in: [Steam Link](https://www.meta.com/experiences/steam-link/5841245619310585/) or [4XVR Video Player](https://www.meta.com/experiences/4xvr-video-player/5936567899722707). 4XVR is paid — own it first.
3. Click **Downgrade** at the **bottom right**, choose the exact version/build, and download. Check both numbers.
4. Copy the APK to the headset.

> **Missing build?** Downgrade lists what Meta still serves. If yours is missing, use an original APK of that exact version/build.

<img width="720" height="457" alt="DownQ downgrade button on the Steam Link store page" src="https://github.com/user-attachments/assets/3cb2c534-f4b0-46a1-80be-1854d2ab2cbf" />

<details>
<summary><strong>Direct APK downloads</strong></summary>

- [Steam Link 2.0.20](https://drive.google.com/file/d/1P9t7wf-DZQzb5anJIXBYTxGq_5mUuOfp/view?usp=sharing)
- [Steam Link 2.0.23](https://drive.google.com/file/d/1eGhp7IU7w_SqhbBdls3qFf1_Osxuj5Yu/view?usp=sharing)
- [Steam Link 2.0.24](https://drive.google.com/file/d/1U3UNdBFqEWcJ3LTWHFAto5KDu0xNBdQ5/view?usp=sharing)

</details>

### 2. Patch and install

1. Open Morphe Manager and load the source or `.mpp`.
2. Select the APK; keep compatibility checks enabled (version and build code are verified).
3. Keep the recommended selection and default options for the detected exact build.
4. Patch, then install from Morphe Manager.
5. Steam Link: launch, grant permissions and connect to SteamVR. If the Battery usage page opens, select **Unrestricted**.

> **Build check:** the [full patch list](TECHNICAL_REFERENCE.md#full-patch-list) is in the technical reference. Same version name does not mean another build is compatible.

## Controller fixes

**Controller velocity frame** is on by default; the rest are optional. Use one path:

| Setup | Apply |
|---|---|
| **Non-root, no Shizuku** | **Controller pose extrapolation** + **Controller velocity frame**. |
| **Non-root, Shizuku granted to Steam Link** | Add to the pair above: **Controller tracking from the controller HAL through Shizuku** + **Controller grip haptics through Shizuku**. |
| **Root (KernelSU)** | No controller APK patch — deselect **Controller velocity frame**; use the KernelSU controller-fix modules. |

> **Do not mix** an APK patch and a root module for the same fix. Full guidance: [Controller fixes](CONTROLLER-FIXES.md).

## Optional

### Spacewarp and Optical Flow

For the best Spacewarp and Optical Flow experience, install the [Galaxy XR Driver](https://github.com/AngelDark92/GalaxyXR-Driver) and **Galaxy XR Companion** on the PC. It also adds Galaxy XR identity, native panel resolution, controller models and image processing.

| Mode | Runs on | Needs |
|---|---|---|
| **Async Spacewarp** | Headset | The experimental **GXR spacewarp layer** patch on the headset, plus **Async Spacewarp** in the PC driver. Without the headset layer, enabling Async Spacewarp holds frames instead of synthesizing them. |
| **Optical Flow** | PC | The driver's bundled OFXR Bridge. |

> **One mode at a time.** Spacewarp is experimental; headset validation is pending.

### Extras

- **Face and tongue tracking:** install VRCFaceTracking and the [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT); enable OSC, eye and face sharing in Steam Link; set the output port to **9015**.
- **USB streaming** (2.0.23/5002363): [setup guide](Install/USB-STREAMING.md). Wi-Fi must stay on for discovery; longer stability untested.
- **Experimental patches:** GXR spacewarp layer, Controller pose time, OpenXR CPU and GPU BOOST and the 4XVR premium unlock are off by default, not in the recommended set; headset validation is pending.

---

## Status and credits

- **Steam Link VR** — released; controller fixes based on [@4uva4ek's modules](https://github.com/4uva4ek). Per-build validation is ongoing; evidence is under [`diagnostics/`](diagnostics/).
- **4XVR** — ported from [@logkim1's 4XVR-GalaxyXR patch set](https://github.com/logkim1/4XVR-GalaxyXR); his work, credited. Headset validation is pending; treat it as early software.
- **Galaxy XR Driver** — built on [CustomHeadsetOpenVR](https://github.com/sboys3/CustomHeadsetOpenVR) by sboys3, with modifications by timkhronos and compdoge; Optical Flow uses [OFXR-Bridge](https://github.com/tig3rmast3r/OFXR-Bridge) by tig3rmast3r and [djules75's fork](https://github.com/djules75/OFXR-Bridge).
- Not affiliated with Meta, Samsung, Valve or 4XVR.

## More information

[Technical reference](TECHNICAL_REFERENCE.md) · [Changelog](CHANGELOG.md) · [Agent instructions](AGENTS.md)

## License

[GNU General Public License v3.0](LICENSE).
