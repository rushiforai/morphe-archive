# Steam Link GalaxyXR Patches

[Morphe](https://morphe.software) patches for using Steam Link VR on the **Samsung Galaxy XR (SM-I610)** headset.

## What this repository contains

The patches adapt Steam Link for Android XR and provide build-specific fixes for resolution, color, microphone input, tracking, permissions, and startup. Recommended bundles select the patches appropriate for your Steam Link build. Optional face tracking works with VRCFaceTracking and the Galaxy XR LinkFT module. Exact older builds use the full GXR face bridge, while build 5002322 uses a native tongue-only bridge that preserves Valve's built-in Android XR face mappings.

This repository contains the patch source and downloadable `.mpp` patch bundles, which Morphe applies to a Steam Link VR APK (`com.valvesoftware.steamlinkvr`).

## What you need

- A Samsung Galaxy XR headset and a PC with Steam and SteamVR.
- [Morphe Manager](https://morphe.software) **1.22 or newer** on the headset, with compatibility checks enabled.
- A Steam Link VR APK matching an exact version and build listed below.
- This repository's patch bundle: [add the source to Morphe](https://morphe.software/add-source?github=AngelDark92/steamlink-patches), or download the `.mpp` from [Releases](https://github.com/AngelDark92/steamlink-patches/releases) and import it into Morphe Manager.

## 1. Get the Steam Link VR APK

On your PC, open the Steam console with `steam://open/console`, then run the command for the version you want:

| Steam Link version / build | Steam console command |
|---|---|
| 2.0.20 / 5001712 | `download_depot 250820 250824 1108221034296079583` |
| 2.0.22 / 5002244 | `download_depot 250820 250824 634053834998054244` |

After Steam reports that the download is complete, find the APK here (adjust the path if Steam is installed elsewhere):

```text
C:\Program Files (x86)\Steam\steamapps\content\app_250820\depot_250824\drivers\vrlink\resources\android-steamlinkvr-release.apk
```

Copy the APK to your headset. If you already have another listed build, select that APK in Morphe instead.

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
| 2.0.22 / 5002172, 5002206, or 5002244 | **Galaxy XR legacy foundation (through 2.0.22/5002244)** |
| 2.0.22 / 5002318 | **Galaxy XR recommended set (2.0.22/5002318)** |
| 2.0.22 / 5002322 | **Galaxy XR recommended set (2.0.22/5002322)** |

Builds **2.0.22/5002296** and **2.0.22/5002313** have individually selectable patches but no automatic bundle; 5002296 is recognized only by the high-resolution patch. See the [full patch list](TECHNICAL_REFERENCE.md#full-patch-list) before selecting patches manually. Do not assume another build is compatible because it has the same version name.

### Patch selection notes

- For either legacy bundle, keep **HMD identity** on **Recommended for this build**, or select **Meta Quest Pro**. If you previously saved Samsung, Stock, or Pico, change that setting to use the recommended identity.
- The 5002322 bundle includes high-resolution output, face tracking support, microphone tuning, OLED color calibration, unrestricted battery usage, and Visual Delay Fix. The 5002318 bundle also includes Device identity.
- High-resolution output is unavailable on **5001740, 5002172, and 5002206**. The high-resolution patch has headset validation on **5002322**; other supported builds have static validation, with further details in the [technical reference](TECHNICAL_REFERENCE.md#compatibility-and-implementation-notes).
- **Appear on top (legacy)** and **Change package name** are optional and never recommended automatically. Do not add Appear on top to the 5002322 bundle. Change package name allows a separate install alongside the original only on its compatible builds.

## Optional: face and tongue tracking

Install **VRCFaceTracking** and the matching [Galaxy XR LinkFT module](https://github.com/compdoge/LinkFT) on your PC. In Steam Link, enable **OSC**, **eye sharing**, and **face sharing**, and set the output port to **9015**. Recommended older-build bundles include **GXR face bridge (version 5002318 and below)**; the 2.0.22/5002322 bundle instead includes the headset-tested **GXR tongue bridge (version 5002322 and above)**. Despite the newer-family label, the tongue patch currently enables only exact build 5002322; each later build needs its native layout verified first.

## More information

See the [technical reference](TECHNICAL_REFERENCE.md) for the full patch list, implementation details, validation notes, build instructions, and links to diagnostic documentation. Release changes are listed in the [changelog](CHANGELOG.md).

## License

Licensed under the [GNU General Public License v3.0](LICENSE).
