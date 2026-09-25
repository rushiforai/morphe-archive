# Steam Link GalaxyXR Patches

[Morphe](https://morphe.software) patches for using Steam Link VR on the **Samsung Galaxy XR (SM-I610)** headset.

## What this repository contains

The patches adapt Steam Link for Android XR and provide build-specific fixes for resolution, color, microphone input, tracking, permissions, and startup. Recommended bundles select the patches appropriate for your Steam Link build. Optional face tracking works with VRCFaceTracking and the Galaxy XR LinkFT module. Exact older builds use the full GXR face bridge, while exact build 2.0.23/5002363 uses a native tongue-only bridge that preserves Valve's built-in Android XR face mappings.

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

See the [full patch list](TECHNICAL_REFERENCE.md#full-patch-list) before selecting patches manually. Do not assume another build is compatible because it has the same version name.

Optional blue-noise dithering has 2 separate experimental patches:
**Foveal blue-noise dithering (experimental)** affects only the foveal layer;
**Background blue-noise dithering (experimental)** affects only the background/base
layer. Select either or both. Each accepts declared 8-bit or 10-bit input and uses
8-bit sRGB output. Both are off by default and are not included in recommended
bundles. If also selecting OLED color calibration, leave both VD-like toggles off.
Headset quality remains unverified; see the [layer options and validation](diagnostics/steamlink-background-blue-noise/README.md).

### Patches loaded by each bundle

A bundle is a pure selector: selecting it loads exactly the patches listed below and performs no additional mutation of its own. Patch names match Morphe's patch list. A listed patch remains a no-op on a build where its own layout guard does not match.

**Galaxy XR recommended set (2.0.20/5001712)** — 17 patches:

1. Android XR native permission names
2. Device identity
3. Force HMD initialization gates
4. Force lobby permission-state gate
5. Force stream XR gates
6. GXR face bridge (version 5002318 and below)
7. Galaxy XR high-resolution 3-projection fix
8. Microphone input preset
9. OLED color calibration
10. Startup permission requests (before 5002322)
11. Startup splash and XR launch mode (before 5002322)
12. Unrestricted battery usage
13. Visual Delay Fix
14. XR Core Runtime
15. XR Device Config Baseline
16. XR Input Routing Config
17. XR Manifest Capability Pack

**Galaxy XR legacy foundation (through 2.0.22/5002244)** — 6 patches:

1. GXR tongue bridge (version 5002322 and above)
2. Galaxy XR high-resolution 3-projection fix
3. Microphone input preset
4. OLED color calibration
5. Unrestricted battery usage
6. Visual Delay Fix

**Galaxy XR recommended set (2.0.23/5002363)** — 6 patches:

1. GXR tongue bridge (version 5002322 and above)
2. Galaxy XR high-resolution 3-projection fix
3. Microphone input preset
4. OLED color calibration
5. Unrestricted battery usage
6. Visual Delay Fix

## Optional: USB streaming setup

For **2.0.23/5002363**, the [manual Galaxy XR USB setup guide](Install/USB-STREAMING.md) configures Android RNDIS and the Windows USB network adapter. **USB streaming worked with the existing APK during a short Wi-Fi-off test**, with measured USB traffic and user-confirmed image/head-tracking continuity. No automatic USB patch is provided; [Quest-equivalent NCM remains unimplemented](diagnostics/steamlink-usb/QUEST-PARITY-2026-09-16.md). Keep Wi-Fi on for initial discovery in the tested workflow. Install the Galaxy USB device as NDIS device through windows driver manager. A cable connected only for ADB or file transfer is not a streaming link but it allows for ethernet like capabilities. Longer stability and starting entirely without Wi-Fi remain untested.

## Optional: face and tongue tracking

Install **VRCFaceTracking** and the matching [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT) on your PC. In Steam Link, enable **OSC**, **eye sharing**, and **face sharing**, and set the output port to **9015**. Recommended older-build bundles include **GXR face bridge (version 5002318 and below)**; the 2.0.23/5002363 bundle instead includes the headset-tested **GXR tongue bridge (version 5002322 and above)**. The tongue patch enables exact 2.0.23/5002363 with its independently verified native layout.

## New base validation

The [2.0.23/5002363 audit](diagnostics/steamlink-5002363/README.md) records the original APK, native addresses, patch scope, option checks and remaining headset validation. Its 7 individual adaptations remain available; the decoder input buffering, UDP receive buffering and FEC duplicate reservation guard experiments were tested, did not work, and were removed from source on 2026-09-19. The 14 legacy patches remain excluded because this base already uses Valve's native Android XR paths.

## More information

See the [technical reference](TECHNICAL_REFERENCE.md) for the full patch list, implementation details, validation notes, build instructions, and links to diagnostic documentation. Release changes are listed in the [changelog](CHANGELOG.md).

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
