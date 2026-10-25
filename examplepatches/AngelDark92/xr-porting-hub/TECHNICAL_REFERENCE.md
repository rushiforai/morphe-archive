# Technical reference — XR Porting Hub

Implementation notes, compatibility details, validation status, and build instructions for the Galaxy XR app patch set (Steam Link VR and 4XVR). For installation and patch selection, see the [README](README.md). The tables below cover both app patch sets; the 4XVR set is recommended by default — see its [plan](diagnostics/4xvr-galaxyxr/2026-10-11-4xvr-galaxyxr-diff-and-plan.md) and the README status and credits section.

## Steam Link 2.0.20–2.0.22 (5001712, 5001812, 5001968, 5002244)

The four legacy builds share one recommended set of 21 patches: the XR foundation and startup patches, Device identity, high-resolution, GXR face bridge, microphone, OLED, blue noise, unrestricted battery, Visual Delay, Network Optimizations, Codecs Support and Controller velocity frame. 2.0.20/5001712, 2.0.20/5001812 and 2.0.21/5001968 use the production alpha-1 2-projection helper; 2.0.22/5002244 uses the 3-projection helper. The optional `Alpha-0 high-resolution trigger (experimental)` patch replaces the exact 5001712 helper when selected. All four HMD/controller configs are byte-identical. Headset validation remains pending for 5001812, 5001968 and 5002244.

## Steam Link 2.0.23 / 5002363

Exact 2.0.23/5002363 exposes 11 core individual patches and recommends 10 by default, including Network Optimizations and Codecs Support. Device identity is not shipped for this build: Valve's native Android XR identity is authoritative. Native addresses and the existing decoder layout guards are unchanged; codec headset validation on this base is pending. See the [5002363 audit](diagnostics/steamlink-5002363/README.md) for source APK provenance, exact addresses, mutation/option tests, APK patching and remaining runtime gaps.

## Steam Link 2.0.24 / 5002395

Exact 2.0.24/5002395 exposes the same 11 core individual patches and 10-patch recommended set. The manifest and all four config assets are byte-identical to 2.0.23; only SDL smali and native libraries changed. Device identity remains legacy-only. New native targets: OLED `0x97aae` and formats `0x10da98`/`0x10db08`/`0x10db78`; microphone `0xf5710`; HMD pose `0x103174`; tongue `0x1433ac`; Network `0x1682a0`/`0x169044`/`0x1772cc` and main `0x903634`; Codecs anchor `0xfe954`. The GXR spacewarp layer has no 2.0.24 native profile yet and is not advertised for this build; the optional telemetry setting also fails closed. See the [5002395 audit](diagnostics/steamlink-5002395/README.md) for the derived targets and validation boundary.

## Compatibility and implementation notes

The Android-Surface Fovea experiment was **tried and retired on 2026-09-07** after
the user reported it did not work. It copied actual fovea pixels into a Surface,
kept 3 projections and omitted the dummy quad. Its failure cause is unknown; the
working terminal-quad fix is unchanged. See the [retirement record](diagnostics/steamlink-surface-fovea/README.md).

Steam Link VR (`com.valvesoftware.steamlinkvr`) was not built for Android XR. These patches adapt it to run on the Samsung Galaxy XR headset by injecting the missing OpenXR permissions and features, bundling the Galaxy XR XR-bridge native library, providing an optional standalone face-bridge layer for face-tracking, fixing broken permission flows, tuning the rendering pipeline, and optionally allowing the patched APK to coexist with the original install.

Target APK: `com.valvesoftware.steamlinkvr`. Exact compatibility metadata and guarded adaptations cover v2.0.20/5001712, v2.0.20/5001812, v2.0.21/5001968, v2.0.22/5002244, v2.0.23/5002363 and v2.0.24/5002395. The permission-free high-resolution fix accepts exactly those six builds; 5001712/5001812/5001968 use the production alpha-1 2-projection helper, 5002244/5002363/5002395 use the 3-projection helper, and the optional alpha-0 experimental patch replaces the exact 5001712 helper when selected. Reconstruction, quad-view, permission-matrix, warm-up/omit, and DFR re-arm experiments are retired.

Use Morphe Manager 1.30.0 or newer with compatibility checks enabled for build-specific filtering. Expert mode may intentionally show incompatible patches. Morphe's `default` flag is one global value per patch, so the recommended defaults live on the individual patches: every pre-2363 build default-enables the same 21-patch set — the XR foundation and startup patches, Device identity (Galaxy XR, model `xrvst2ue`), high-resolution, face bridge, microphone, OLED, blue noise, unrestricted battery, Visual Delay, Network Optimizations, Codecs Support and Controller velocity frame. 2.0.23/5002363 and 2.0.24/5002395 default-enable the same 10-patch native set: GXR face and tongue bridge, high-resolution, Microphone input preset (Voice Recognition), OLED (`final-balanced`), Blue-noise dithering, Unrestricted battery, Network Optimizations, Visual Delay (60 ms), Codecs Support and Controller velocity frame. Device identity is legacy-only; stock 2.0.23/2.0.24 identity is authoritative. **Appear on top (legacy)** and **Change package name** are never recommended.

**Startup permission requests (before 5002322)** and **Startup splash and XR launch mode (before 5002322)** are members of the legacy recommended set, default-enabled on the 2.0.20/5001712 legacy base and independently deselectable. The permission patch declares missing hand, eye, face, microphone and Bluetooth permissions and enables their startup requests. The splash patch enables the black startup screen and unmanaged VRLink start-mode override; older legacy builds also receive panel sizing. The shared helper defaults both behaviors off. Earlier battery/overlay settings flows use a transparent bootstrap unless those explicit patches are selected.

For exact 2.0.23/5002363 and 2.0.24/5002395, the recommended set preserves stock launcher, splash, XR start mode and runtime permission handling. The battery patch alone inserts a battery-settings helper call after stock `SteamLink.onCreate` calls its superclass, before parameter registers are reused. Face/tongue bridges and high resolution no longer pull in startup permission requests or splash changes; high resolution no longer forces unmanaged Full Space.

For the legacy bases, **Device identity** has no selector any more: it always reports the Galaxy XR
identity with model `xrvst2ue`, which is this headset's `Build.PRODUCT` and the `vrlink_<model>`
section name the PC-side VRLink driver reads, while keeping SamsungVST tracking, Galaxy XR
controller routing and the eye-tracking extension request. Device identity is legacy-only; stock 2.0.23 identity is authoritative and no identity writer is shipped for that base.

The recommended selection does not broaden native compatibility: unsupported builds remain unchanged. All four pre-2363 targets have the complete legacy set available.

**The standalone Video dither patch remains retired.** The existing OLED patch now offers optional Comparison dithering (Off, Low, Standard), a Neutral calibration profile, and sRGB8/RGB10/experimental FP16 output. Defaults are Final balanced, 8-bit sRGB, and dithering Off. RGB10 and FP16 remain optional. See the [controlled comparison guide](PATCH_CATALOG.md#controlled-oled-comparison).

### Retired underside experiment — 2026-09-03

The user reported that the 2.0.22/5002322 Surface-backed underside experiment
"doesn't work" and requested retirement. Its option, implementation, build target
and bundled resources are removed. No new capture was reviewed, so the cause and
GPU effect remain undetermined. The tested terminal quad is the only active mode;
both existing helper binaries, including 2.0.20/5001712, remain unchanged.

### Terminal-quad helper CPU revision — 2026-09-03

The shared resolution patch now supplies 3-projection helper `v1.4-20260903` and 5001712 2-projection helper `v1.2-20260903`. Its generation-validated, non-owning render-thread cache removes steady-frame shared-ownership reference-count operations while the registry retains session ownership. It relies on OpenXR's externally synchronized destruction; lifecycle changes invalidate cached handles. Event readers still acquire ownership, and `xrPollEvent` dispatch processes data only for `XR_SUCCESS`, never `XR_EVENT_UNAVAILABLE`. Existing recommended selections automatically receive these helpers through their unchanged resolution-patch dependency.

Host CTest registry and actual 2-/3-projection helper integration checks passed, as did both Android rebuilds using NDK `27.2.12479018` and cached OpenXR `1.1.43` headers. These revisions have no headset result or measured speed gain yet. All 6 exact supported version/build pairs, continuous 2x2 quad submission, source formats, and GPU work remain unchanged; this does not enable 10-bit output. Compare against the previous artifact with the same base, scene, options, and host settings, checking cold launch, stop/restart, palm/DFR transitions, and loss/resume. See the [patch catalog](PATCH_CATALOG.md#galaxy-xr-high-resolution-3-projection-fix-xrgalaxyxrhighresolutionpatch) for validation boundaries and A/B guidance.


## Additional setup context

The previous README described 2.0.20/5001712 as more stable according to community reports. This is historical community reporting, not a controlled comparison or a guarantee for a particular setup. The build comes from the Meta store route in the [installation instructions](README.md#1-get-the-app-apk-meta-store).

No desktop IP, pairing token, APK hash, or native telemetry enrollment is required to apply the recommended patches.

## Full patch list

This section is generated from the patch catalog during releases.

<!-- PATCHES_START EXPANDED -->
> **[v2.2.0](https://github.com/AngelDark92/xr-porting-hub/releases/tag/v2.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;48 patches total
<details open>
<summary>📦 4XVR&nbsp;&nbsp;•&nbsp;&nbsp;16 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.22 (20022) |
| :---: |
| 4XVR 2.0.22/20022 Galaxy XR port. |

#### Image quality

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [HDR pipeline payload (4XVR)](#hdr-pipeline-payload-4xvr) | Adds the HDR video component and its open-source notices; built on libplacebo (LGPL-2.1-or-later). Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [libplacebo HDR pipeline (4XVR)](#libplacebo-hdr-pipeline-4xvr) | HDR videos play with their full colors and brightness. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

#### Tracking & audio

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [5.1-channel audio bridge (4XVR)](#5-1-channel-audio-bridge-4xvr) | Switches 4XVR video playback to 5.1 surround sound on the headset speakers. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Audio bridge payload (4XVR)](#audio-bridge-payload-4xvr) | Adds the bundled sound engine that lets 4XVR play 5.1 surround sound on the headset speakers. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Galaxy XR controller models (4XVR)](#galaxy-xr-controller-models-4xvr) | Replaces the Quest 3 controller artwork and shapes with the Galaxy XR controller models. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

#### Startup & permissions

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Galaxy XR launch compatibility (4XVR)](#galaxy-xr-launch-compatibility-4xvr) | Installs the standard XR files 4XVR needs to start on Galaxy XR instead of closing right after opening. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Galaxy XR launcher icon (4XVR)](#galaxy-xr-launcher-icon-4xvr) | Restores the proper 4XVR icon on the device's app launcher and in the patch manager. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Popup refresh on resume (4XVR)](#popup-refresh-on-resume-4xvr) | Re-checks the first-launch prompts after you return from system settings. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Startup and UI continuity helper (4XVR)](#startup-and-ui-continuity-helper-4xvr) | Keeps the startup greeting and on-screen notifications working when the app rebuilds its display. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

#### Advanced XR compatibility

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Frame-synced render dispatch (4XVR)](#frame-synced-render-dispatch-4xvr) | Syncs scene changes and screen updates to the display's frame rhythm, keeping playback smooth. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Galaxy XR refresh profile (72 Hz, 4XVR)](#galaxy-xr-refresh-profile-72-hz-4xvr) | Runs 4XVR's picture at Galaxy XR's native 72 Hz rate instead of 60 Hz. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Meta platform decoupling (4XVR)](#meta-platform-decoupling-4xvr) | Keeps the Meta store calls out of the way, so 4XVR starts instead of hanging on its splash screen. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Render dispatch payload (4XVR)](#render-dispatch-payload-4xvr) | Adds the scene-timing engine that keeps 4XVR visuals and screens in step with the frames. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

#### Premium & purchases

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Premium unlock (4XVR, experimental)](#premium-unlock-4xvr-experimental) | Unlocks premium playback without a store check on Galaxy XR, where the store cannot be reached. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

#### Subtitles & playback

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Subtitle suite (4XVR)](#subtitle-suite-4xvr) | Moves subtitles around, enlarges the subtitle panel and loads your own subtitle font. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |
| [Subtitle suite payload (4XVR)](#subtitle-suite-payload-4xvr) | Adds the subtitle engine used by the 4XVR subtitle controls. Builds: 4XVR 2.0.22/20022. Based on @logkim1's 4XVR-GalaxyXR patches: https://github.com/logkim1/4XVR-GalaxyXR. | 20022 |  |

</details>

<details open>
<summary>📦 Steam Link Experimental&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.20 (5001712) | 2.0.20 (5001712) | 2.0.20 (5001812) | 2.0.21 (5001968) | 2.0.22 (5002244) | 2.0.23 (5002363) | 2.0.24 (5002395) | 2.0.20 (5001712) | 2.0.20 (5001812) | 2.0.21 (5001968) | 2.0.22 (5002244) | 2.0.23 (5002363) | 2.0.24 (5002395) | 2.0.20 (5001812) | 2.0.21 (5001968) | 2.0.22 (5002244) | 2.0.23 (5002363) | 2.0.24 (5002395) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Steam Link 2.0.20/5001712 legacy base. | Experimental Steam Link 2.0.20/5001712. | Experimental Steam Link 2.0.20/5001812. | Experimental Steam Link 2.0.21/5001968. | Experimental Steam Link 2.0.22/5002244. | Experimental Steam Link 2.0.23/5002363. | Experimental Steam Link 2.0.24/5002395. | Controller pose extrapolation layer for exact Steam Link 2.0.20/5001712; measured on 2.0.23/5002363 only, not run on this base. | Controller pose extrapolation layer for exact Steam Link 2.0.20/5001812; measured on 2.0.23/5002363 only, not run on this base. | Controller pose extrapolation layer for exact Steam Link 2.0.21/5001968; measured on 2.0.23/5002363 only, not run on this base. | Controller pose extrapolation layer for exact Steam Link 2.0.22/5002244; measured on 2.0.23/5002363 only, not run on this base. | Controller pose extrapolation layer for exact Steam Link 2.0.23/5002363; measured on a Galaxy XR headset. | Controller pose extrapolation layer for exact Steam Link 2.0.24/5002395; measured on 2.0.23/5002363 only, not run on this base. | Steam Link 2.0.20/5001812 legacy base. | Steam Link 2.0.21/5001968 legacy base. | Steam Link 2.0.22/5002244 legacy base. | Steam Link 2.0.23/5002363 native Android XR. | Steam Link 2.0.24/5002395 native Android XR. |

#### Image quality

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Alpha-0 high-resolution trigger (experimental)](#alpha-0-high-resolution-trigger-experimental) | Clears the high-resolution trigger quad's 1/255 alpha byte so it is fully transparent on exact 2.0.20/5001712. Build: 2.0.20/5001712. | 5001712 |  |
| [Full-FOV foveal canvas (experimental)](#full-fov-foveal-canvas-experimental) | Draws only the foveal image on a transparent canvas per eye. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Experimental; headset validation pending. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

#### App & device identity

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [OpenXR CPU and GPU BOOST (experimental)](#openxr-cpu-and-gpu-boost-experimental) | Asks OpenXR for the CPU and GPU BOOST hint at session start; unsupported devices continue without it. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

#### Controller

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Controller pose extrapolation](#controller-pose-extrapolation) | Predicts controller poses to the moment the app asks and smooths out jitter. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Details: https://github.com/4uva4ek. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |
| [Controller pose time (experimental)](#controller-pose-time-experimental) | Dates each controller pose by its sample time; the runtime labels poses 28.82 ms late. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Needs: not with Controller pose extrapolation or the HAL pose patch. Details: https://github.com/4uva4ek. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Pose time compensation (ms) |

#### Controllers (Shizuku)

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Controller grip haptics through Shizuku](#controller-grip-haptics-through-shizuku) | Sends controller vibration to the grip motor instead of the trigger. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. This needs Shizuku running with permission granted; without it vibration stays stock. Details: https://github.com/4uva4ek. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |
| [Controller tracking from the controller HAL through Shizuku](#controller-tracking-from-the-controller-hal-through-shizuku) | Reads controller poses from the headset HAL, removing about 35 ms of lag. This needs Shizuku; without it tracking stays stock. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Angular velocity is local to the grip pose on 2.0.23/5002363 and in the base space on older builds. Details: https://github.com/4uva4ek. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

#### Streaming & network

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Codecs Support](#codecs-support) | Lets the headset decode H.264 or AV1 streams; HEVC is untouched. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Needs: the matching driver codec setting. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Enable telemetry |
| [GXR spacewarp layer (experimental)](#gxr-spacewarp-layer-experimental) | Synthesizes a frame when the stream misses a display tick; any failure stands down to stock. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363. Experimental; headset validation pending. | 5001712, 5001812, 5001968, 5002244, 5002363 |  |

</details>

<details open>
<summary>📦 Steam Link&nbsp;&nbsp;•&nbsp;&nbsp;23 patches</summary>
<br>

**🎯 Supported versions:**

| 2.0.20 (5001712) | 2.0.20 (5001812) | 2.0.21 (5001968) | 2.0.22 (5002244) | 2.0.23 (5002363) | 2.0.24 (5002395) | 2.0.20 (5001712) | 2.0.20 (5001812) | 2.0.21 (5001968) | 2.0.22 (5002244) | 2.0.23 (5002363) | 2.0.24 (5002395) |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
| Steam Link 2.0.20/5001712 legacy base. | Steam Link 2.0.20/5001812 legacy base. | Steam Link 2.0.21/5001968 legacy base. | Steam Link 2.0.22/5002244 legacy base. | Steam Link 2.0.23/5002363 native Android XR. | Steam Link 2.0.24/5002395 native Android XR. | Steam Link 2.0.20/5001712 high-resolution target. | Steam Link 2.0.20/5001812 high-resolution target. | Steam Link 2.0.21/5001968 high-resolution target. | Steam Link 2.0.22/5002244 high-resolution target. | Steam Link 2.0.23/5002363 high-resolution target. | Steam Link 2.0.24/5002395 high-resolution target. |

#### Image quality

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Blue-noise dithering](#blue-noise-dithering) | Adds fine grain that hides color steps; center and background can be toggled. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Center of the view<br>• Background |
| [Galaxy XR high-resolution 3-projection fix](#galaxy-xr-high-resolution-3-projection-fix) | Permission-free high-resolution fix that leaves renderer formats, including future RGB10_A2, untouched. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |
| [OLED color calibration](#oled-color-calibration) | Tunes OLED color with gamma and saturation presets. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Headset verification pending. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Calibration profile<br>• Gamma<br>• Saturation<br>• VD-like center mode<br>• Center gamma adjustment |

#### Tracking & audio

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [GXR face and tongue bridge](#gxr-face-and-tongue-bridge) | Installs the VRCFT face bridge on legacy builds; on 2.0.23/5002363 and 2.0.24/5002395 it only adds tongue transport. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Valve's own expressions and tongue-out keep working. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |
| [Microphone input preset](#microphone-input-preset) | Switches microphone capture mode; Voice Recognition tested best. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Microphone mode |
| [Visual Delay Fix](#visual-delay-fix) | Makes head movement appear sooner without touching controller motion. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Head motion offset (ms) |
| [XR Input Routing Config](#xr-input-routing-config) | Routes pointer and button input to the launcher UI. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |

#### Startup & permissions

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Appear on top (legacy)](#appear-on-top-legacy) | Lets Steam Link draw its panel over other screens (legacy fallback). Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Startup permission requests (before 5002322)](#startup-permission-requests-before-5002322) | Requests hand, eye, face, microphone and Bluetooth permissions at startup. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Startup splash and XR launch mode (before 5002322)](#startup-splash-and-xr-launch-mode-before-5002322) | Adds the launch splash and full-space VR start mode. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Unrestricted battery usage](#unrestricted-battery-usage) | Opens Android's Battery usage page at startup so XR streaming can run unrestricted. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

#### App & device identity

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Change package name](#change-package-name) | Renames the app so it can install next to the original. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 | • Package name |
| [Device identity](#device-identity) | Reports the Galaxy XR headset identity to SteamVR (model xrvst2ue). Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Galaxy XR SteamVR driver (galaxyxr)](#galaxy-xr-steamvr-driver-galaxyxr) | Sets Galaxy XR names in SteamVR; needs the PC-side Galaxy XR VRLink Setup. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 | • Grip offset position (cm, x,y,z)<br>• Grip offset rotation (deg, x,y,z) |

#### Advanced XR compatibility

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Android XR native permission names](#android-xr-native-permission-names) | Swaps the built-in Oculus face and eye permission names for Android XR ones. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Force HMD initialization gates](#force-hmd-initialization-gates) | Removes 2 startup checks that can stop headset tracking. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Force lobby permission-state gate](#force-lobby-permission-state-gate) | Skips a lobby permission check so the room screen loads. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [Force stream XR gates](#force-stream-xr-gates) | Removes 3 XR checks so video can start. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [XR Core Runtime](#xr-core-runtime) | Installs the bridge files the other XR patches need. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [XR Device Config Baseline](#xr-device-config-baseline) | Installs the default Galaxy XR controller settings and dashboard files. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |
| [XR Manifest Capability Pack](#xr-manifest-capability-pack) | Adds the Android XR permissions, features and app properties Steam Link needs. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244. | 5001712, 5001812, 5001968, 5002244 |  |

#### Controller

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Controller velocity frame](#controller-velocity-frame) | Fixes thrown-object directions by rotating controller speeds into the frame SteamVR expects. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. Angular velocity is local to the streamed pose on 2.0.23/5002363 and in the base space on older builds; measured on 2.0.23/5002363. Details: https://github.com/4uva4ek. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

#### Streaming & network

| 💊&nbsp;Patch | 📜&nbsp;Description | 🔢&nbsp;Builds | ⚙️&nbsp;Options |
|----------|----------------|----------------|-----------|
| [Network Optimizations](#network-optimizations) | Keeps streaming smooth after packet loss. Builds: 2.0.20 (5001712, 5001812), 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395. | 5001712, 5001812, 5001968, 5002244, 5002363, 5002395 |  |

</details>

<!-- PATCHES_END -->

## Building from source

On Windows, verify JVM tests and build the Android bundle with automatic cleanup:

```powershell
.\Verify-Build.ps1
.\Verify-Build.ps1 -Tasks ':patches:test', ':patches:auditDecodedSteamLinkPatches'
```

Each run uses a fresh workspace. Bundles remain under
`../builds/steamlink-patches/build/verification/<run>/artifacts/patches/libs`, alongside retained test reports,
the Gradle log and a cleanup receipt. Compiler files and decoded audit derivatives
are removed after Gradle exits, including on failure. Pass `-KeepBuildOutputs` to
retain intermediates. Exact fixtures, tools, caches and existing outputs are
preserved. See [verification and disk cleanup](diagnostics/build-verification/README.md).

Direct Gradle commands use the external output folders described below;
they do not perform the wrapper's automatic cleanup:

```
./gradlew buildAndroid
```

Output: `../builds/steamlink-patches/gradle/patches/libs/patches-*.mpp`

All generated output and project Gradle/Kotlin state live beneath
`../builds/steamlink-patches/`. Retained audit fixtures/tools/evidence use its
`build/` directory; Gradle uses separate `gradle/root` and `gradle/patches`
directories so `clean` preserves those inputs. Native CMake output uses
`extensions/<name>/build-*` under the same external root. See the
[2026-10-08 relocation record](diagnostics/build-layout/README.md).

No Android SDK is required. The extension DEX is assembled from smali sources directly by the build.

## Documentation maintenance

Release automation refreshes the full patch list in this file and commits it with the release metadata. To refresh it locally from an existing catalog:

```powershell
$env:PYTHONIOENCODING = 'utf-8'
python .github/scripts/generate_patches_readme.py AngelDark92/xr-porting-hub main patches-list-all.json TECHNICAL_REFERENCE.md
```

The generator also defaults to `TECHNICAL_REFERENCE.md` when no output path is supplied. Keep the README focused on user setup; update its bundle guidance when patch recommendations change.

## Further reference

- [Patch catalog](PATCH_CATALOG.md): per-patch edits, dependencies, guarded layouts, and controlled OLED comparison instructions.
- [Debugging guide](DEBUGGING.md): diagnostic capture procedures.
- [Changelog](CHANGELOG.md): release history.
