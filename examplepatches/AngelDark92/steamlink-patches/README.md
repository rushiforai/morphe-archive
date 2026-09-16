# Steam Link GalaxyXR Patches

[Morphe](https://morphe.software) patches for using Steam Link VR on the **Samsung Galaxy XR (SM-I610)** headset.

## What this repository contains

The patches adapt Steam Link for Android XR and provide build-specific fixes for resolution, color, microphone input, tracking, permissions, and startup. Recommended bundles select the patches appropriate for your Steam Link build. Optional face tracking works with VRCFaceTracking and the Galaxy XR LinkFT module. Exact older builds use the full GXR face bridge, while exact builds 2.0.22/5002322 and 2.0.23/5002363 use a native tongue-only bridge that preserves Valve's built-in Android XR face mappings.

This repository contains the patch source and downloadable `.mpp` patch bundles, which Morphe applies to a Steam Link VR APK (`com.valvesoftware.steamlinkvr`).

## What you need

- A Samsung Galaxy XR headset and a PC with Steam and SteamVR.
- [Morphe Manager](https://morphe.software) **1.22 or newer** on the headset, with compatibility checks enabled.
- A Steam Link VR APK matching an exact version and build listed below.
- This repository's patch bundle: [add the source to Morphe](https://morphe.software/add-source?github=AngelDark92/steamlink-patches), or download the `.mpp` from [Releases](https://github.com/AngelDark92/steamlink-patches/releases) and import it into Morphe Manager.

## 1. Get the Steam Link VR APK

### Version 2.0.23 / 5002363: Meta store with DownQ

1. On your PC, download and install [DownQ from the Chrome Web Store](https://chromewebstore.google.com/detail/downq/clocmpojdjmikkaepgkmplgooejmnchb) in **Google Chrome**.
2. Open [Steam Link on the Meta store](https://www.meta.com/experiences/steam-link/5841245619310585/) in Chrome and sign in to your Meta account.
3. Click the **Downgrade** button at the **bottom right** of the page. (you will have to login to oculus and meta to be able to download)
4. Choose the release channel if prompted, select version **2.0.23**, build **5002363**, and download its APK. Check both numbers before downloading.

<img width="2986" height="1896" alt="Screenshot 2026-09-15 115003" src="https://github.com/user-attachments/assets/3cb2c534-f4b0-46a1-80be-1854d2ab2cbf" />

**Firefox alternative:** [DownQ for Firefox](https://addons.mozilla.org/en-US/firefox/addon/downq-for-firefox/) is an **unofficial Firefox port**. Install that add-on and follow the Meta store steps above in Firefox. The Firefox download workflow has not been runtime-tested for this guide.

### Older versions: Steam depot download

On your PC, open the Steam console with `steam://open/console` in your web browser, then in Steam run the command for the version you want:

| Steam Link version / build | Steam console command |
|---|---|
| 2.0.20 / 5001712 | `download_depot 250820 250824 1108221034296079583` |
| 2.0.22 / 5002244 | `download_depot 250820 250824 634053834998054244` |

After Steam reports that the download is complete, find the APK here (adjust the path if Steam is installed elsewhere):

```text
C:\Program Files (x86)\Steam\steamapps\content\app_250820\depot_250824\drivers\vrlink\resources\android-steamlinkvr-release.apk
```

After downloading through either route, copy the APK to your headset. If you already have another listed build, select that APK in Morphe instead.

N.D.: Delete the depot folder every time you switch to a new depot or the .apk will remain the first one you have downloaded.

## 2. Select and apply the patches

1. Open Morphe Manager and load this repository's patch source or downloaded `.mpp` bundle.
2. Select the Steam Link VR APK. Keep compatibility checks enabled so Morphe can filter by both version and build number.
3. Select the **single recommended bundle** for your APK from the table below. Leave its patch options at their recommended values unless you need a specific adjustment.
4. Run patching, then install the resulting APK using Morphe Manager.
5. Launch the patched Steam Link, complete its permission prompts, and connect to SteamVR on your PC. If the Battery usage page opens, select **Unrestricted** and return to Steam Link.

| Exact version / build | Bundle to select |
|---|---|
| 2.0.20 / 5001712 | **Galaxy XR recommended set (2.0.20/5001712)** |
| 2.0.20 / 5001740 | **Galaxy XR legacy foundation (through 2.0.22/5002244)** — analysis-only adaptation; pristine-APK patching and headset validation pending |
| 2.0.22 / 5002244 | **Galaxy XR legacy foundation (through 2.0.22/5002244)** |
| 2.0.22 / 5002318 | **Galaxy XR recommended set (2.0.22/5002318)** |
| 2.0.22 / 5002322 | **Galaxy XR recommended set (2.0.22/5002322)** |
| 2.0.23 / 5002363 | **Galaxy XR recommended set (2.0.23/5002363)** — APK/native checks passed; headset validation pending |

Builds **2.0.22/5002296** and **2.0.22/5002313** have individually selectable patches but no automatic bundle; 5002296 is recognized only by the high-resolution patch. See the [full patch list](TECHNICAL_REFERENCE.md#full-patch-list) before selecting patches manually. Do not assume another build is compatible because it has the same version name.

### Patch selection notes

- For either legacy bundle, keep **HMD identity** on **Recommended for this build**, or select **Meta Quest Pro**. If you previously saved Samsung, Stock, or Pico, change that setting to use the recommended identity.
- The 5002322 and 5002363 bundles include high-resolution output, face tracking support, microphone tuning, OLED color calibration, unrestricted battery usage, and Visual Delay Fix. The 5002318 bundle also includes Device identity.
- On **2.0.22/5002322** and **2.0.23/5002363**, **Device identity** is available only when explicitly selected; it is not in the recommended bundle. Select **Meta Quest Pro** explicitly to test that identity. Native identity profiles populate the exact `xrvst2ue`/`xrvst2` product entries, because this build does not use `unknown` when its product entry is missing. This correction still needs a new headset run and does not fix the separate streaming regression.
- Older bundles explicitly include **Startup permission requests (before 5002322)** and **Startup splash and XR launch mode (before 5002322)**. These are separately selectable and unavailable on 5002322 and 5002363. Face/tongue and high-resolution patches do not silently select them.
- On **5002322 and 5002363**, Valve owns the launcher, splash, XR activity launch mode and tracking/microphone/Bluetooth permission requests. **Unrestricted battery usage** only opens battery settings from the stock activity. The high-resolution rendering fix remains active; the revised startup flow requires headset validation.
- High-resolution output is unavailable on **5001740**. The high-resolution patch has headset validation on **5002322**; other supported builds have static validation, with further details in the [technical reference](TECHNICAL_REFERENCE.md#compatibility-and-implementation-notes).
- **Appear on top (legacy)** and **Change package name** are optional and never recommended automatically. Do not add Appear on top to either modern bundle. Change package name allows a separate install alongside the original only on its compatible builds.

## Optional: face and tongue tracking

Install **VRCFaceTracking** and the matching [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT) on your PC. In Steam Link, enable **OSC**, **eye sharing**, and **face sharing**, and set the output port to **9015**. Recommended older-build bundles include **GXR face bridge (version 5002318 and below)**; the 2.0.22/5002322 bundle instead includes the headset-tested **GXR tongue bridge (version 5002322 and above)**. The tongue patch enables exact 2.0.22/5002322 and 2.0.23/5002363, each with its independently verified native layout. Headset results from 5002322 do not establish runtime behavior on 5002363.

## New base validation

The [2.0.23/5002363 audit](diagnostics/steamlink-5002363/README.md) records the original APK, native addresses, patch scope, option checks and remaining headset validation. The 7 applicable individual patches are supported; the 14 legacy patches remain excluded because this base already uses Valve's native Android XR paths.

## More information

See the [technical reference](TECHNICAL_REFERENCE.md) for the full patch list, implementation details, validation notes, build instructions, and links to diagnostic documentation. Release changes are listed in the [changelog](CHANGELOG.md).

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
