# XR Porting Hub — Quest & Pico apps on Android XR

[Morphe](https://morphe.software) patches that run **Meta Quest / Pico apps on Android XR devices**, starting with the **Samsung Galaxy XR (SM-I610)** headset. Originally a Steam Link-only patch set; now a hub for Meta Quest / Pico → Android XR ports.

| App | Package | Supported builds | Patches by |
|---|---|---|---|
| Steam Link VR | `com.valvesoftware.steamlinkvr` | 2.0.20/5001712, 2.0.20/5001812, 2.0.21/5001968, 2.0.22/5002244, 2.0.23/5002363, 2.0.24/5002395 | AngelDark92; controller tracking and haptics by [@4uva4ek](https://github.com/4uva4ek) |
| 4XVR | `cn.vr4p.oculus4xvrplayerov` | 2.0.22/20022 | [@logkim1](https://github.com/logkim1/4XVR-GalaxyXR) |

- **Steam Link VR** — streams SteamVR from your PC to the headset. The patches fix resolution, color and OLED calibration, microphone, controller tracking, permissions and startup for Android XR.
- **4XVR** — video player with 4X clarity, MVC 3D and HDR. The patches port the Quest build to Galaxy XR: launch compatibility, launcher icon, controller models, libplacebo HDR pipeline, 72 Hz refresh profile, 5.1-channel audio, frame-synced render dispatch, the subtitle suite and the launch-critical Meta platform decoupling. The premium unlock (no purchase check) is new and experimental, off by default.

Each app keeps its own package, exact supported builds, sources, payloads and compatibility list. Morphe patches one APK at a time, so pick the app you want.

## What you need

- An Android XR headset (Samsung Galaxy XR) and, for Steam Link, a PC with Steam and SteamVR.
- [Morphe Manager](https://morphe.software) **1.30.0 or newer** on the headset, compatibility checks enabled.
- An app APK in one of the exact builds above.
- This repository's patches: [add the source to Morphe](https://morphe.software/add-source?github=AngelDark92/xr-porting-hub), or download the `.mpp` from [Releases](https://github.com/AngelDark92/xr-porting-hub/releases) and import it.

## 1. Get the app APK (Meta store)

Both apps come from the Meta store. You need one of the exact version/build pairs listed above.

1. On your PC, install [DownQ for Chrome](https://chromewebstore.google.com/detail/downq/clocmpojdjmikkaepgkmplgooejmnchb) ([Firefox port](https://addons.mozilla.org/en-US/firefox/addon/downq-for-firefox/), unofficial, not runtime-tested).
2. Open the store page in that browser and sign in to your Meta account: [Steam Link](https://www.meta.com/experiences/steam-link/5841245619310585/) or [4XVR Video Player](https://www.meta.com/experiences/4xvr-video-player/5936567899722707). 4XVR is a paid app — own it on your account first.
3. Click the **Downgrade** button at the **bottom right** of the page, choose the version/build you need, and download its APK. Check both numbers before downloading.

Downgrade lists the builds Meta still serves. If the build you need is not offered, use an original APK of that exact version/build you already have.

<img width="2986" height="1896" alt="DownQ downgrade button on the Steam Link store page" src="https://github.com/user-attachments/assets/3cb2c534-f4b0-46a1-80be-1854d2ab2cbf" />

4. Copy the APK to the headset.
### Alternative direct download 
- ```https://drive.google.com/file/d/1P9t7wf-DZQzb5anJIXBYTxGq_5mUuOfp/view?usp=sharing ``` 2.0.20
- ```https://drive.google.com/file/d/1eGhp7IU7w_SqhbBdls3qFf1_Osxuj5Yu/view?usp=sharing ``` 2.0.23
- ```https://drive.google.com/file/d/1U3UNdBFqEWcJ3LTWHFAto5KDu0xNBdQ5/view?usp=sharing ``` 2.0.24

## 2. Patch and install

1. Open Morphe Manager and load this repository's source or `.mpp`.
2. Select the app APK. Keep compatibility checks enabled: version and build code are both verified.
3. Keep the recommended selection — Morphe Manager auto-selects the recommended patches for the detected exact build. Leave patch options at their defaults unless you need a specific adjustment.
4. Run patching, then install the result from Morphe Manager.
5. For Steam Link: launch it, complete the permission prompts and connect to SteamVR on your PC. If the Battery usage page opens, select **Unrestricted**.

The [full patch list](TECHNICAL_REFERENCE.md#full-patch-list) is in the technical reference. Do not assume another build is compatible because it has the same version name.

## Controller fixes

Controller velocity frame is on by default; the other controller patches are optional. Use one path:

- **Non-root:** **Controller pose extrapolation** + **Controller velocity frame**. Add the 2 Shizuku controller patches if Shizuku is running and granted to Steam Link.
- **Root (KernelSU):** no controller patch — deselect Controller velocity frame and use the KernelSU modules with the controller fixes. The PC-side Galaxy XR SteamVR driver is optional for VRLink compatibility.

Which patch, which build, and when: [Controller fixes — what to apply](CONTROLLER-FIXES.md).

## Optional

- **Face and tongue tracking** (Steam Link): install VRCFaceTracking and the [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT) on your PC, then enable **OSC**, **eye sharing** and **face sharing** in Steam Link and set the output port to **9015**.
- **USB streaming** (Steam Link 2.0.23/5002363): [manual Galaxy XR USB setup guide](Install/USB-STREAMING.md). Wi-Fi must stay on for discovery in the tested workflow; longer stability is untested.
- **Experimental patches** (Full-FOV foveal canvas, GXR spacewarp layer, Controller pose time, OpenXR CPU and GPU BOOST; 4XVR premium unlock): off by default, not in the recommended set, headset validation pending.

## Status and credits

- **Steam Link VR** — released patch set. Controller tracking and haptics patches (HAL pose, velocity frame, pose extrapolation, grip haptics through Shizuku) are based on [@4uva4ek's Galaxy XR modules](https://github.com/4uva4ek). Per-build headset validation is ongoing; local static and patching evidence is recorded under [`diagnostics/`](diagnostics/).
- **4XVR** — ported from [@logkim1's 4XVR-GalaxyXR patch set](https://github.com/logkim1/4XVR-GalaxyXR), which supplies the launch, HDR pipeline, playback and premium-hook work this port builds on. His work, credited. Headset validation of this repository's port is pending, so treat it as early software.
- Not affiliated with Meta, Samsung, Valve or 4XVR.

## More information

See the [technical reference](TECHNICAL_REFERENCE.md) for the full patch list, implementation details, validation notes and build instructions. Release changes are listed in the [changelog](CHANGELOG.md).

## License

Licensed under the [GNU General Public License v3.0](LICENSE). Agent-facing instructions live in [AGENTS.md](AGENTS.md).
