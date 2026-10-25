# 🧩 Forsigh Waze Patches

Morphe patches for **Waze** (`com.waze`).

## ➕ Add to Morphe

**One tap** (open on the phone that runs Morphe Manager):
[**Add to Morphe**](https://morphe.software/add-source?github=Forsigh/waze-patches)

**Manually:** Morphe Manager → patch sources **+** → **Remote** → paste
`https://github.com/Forsigh/waze-patches`

Uninstall the Play Store version of Waze first. The patched build is signed with a different key.
For Android Auto visibility, install with Morphe Manager's **Install as Play Store** option (or
KingInstaller as a fallback).

> GPLv3 · Not affiliated with Waze. Targets the Waze versions in the patch list below.
> Twenty rows are **off by default** - *Allow high refresh rate*, *Disable Play Store updates*,
> *Skip sign-in*, *Theme*, *AMOLED Dark Mode For UI*, *Bigger speedometer & limit sign*, the four
> **Android Auto** rows, the eight **Experimental** rows, and *Report speed limit* and *Speed-limit sign style*.

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v0.30.41](https://github.com/Forsigh/waze-patches/releases/tag/v0.30.41)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;30 patches total
<details open>
<summary>📦 Waze&nbsp;&nbsp;•&nbsp;&nbsp;30 patches</summary>
<br>

**🎯 Supported versions:**

| 5.24.90.901 | 5.25.0.1 | 5.25.4.900 | 5.25.90.900 | 5.26.0.0 |
| :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [AMOLED Dark Mode For UI](#amoled-dark-mode-for-ui) | Makes the dark UI pure black. |  |
| [Alert distances](#alert-distances) | How early alerts sound, plus a speed-bump switch and per-alert distances. | • Alert distance level<br>• Speed bump (ramp) warnings<br>• Police<br>• Hazards<br>• Crashes<br>• Traffic jams<br>• Speed cams - streets<br>• Speed cams - highways<br>• Speed cams - freeways<br>• Blocked lanes<br>• Gap between alerts |
| [Allow high refresh rate](#allow-high-refresh-rate) | Runs above 60 Hz, up to your screen's limit. | • Target refresh rate (Hz) |
| [Auto zoom](#auto-zoom) | Keeps your auto-zoom choice from being reset. | • Auto-zoom mode |
| [Brief voice guidance](#brief-voice-guidance) | Shorter spoken directions. |  |
| [Cameras & hazards](#cameras-hazards) | Shows every camera and road hazard, with switches for the extra kinds. | • Average-speed zones<br>• Camera chime below the limit<br>• The other camera types<br>• Crosswalk hazards |
| [Car alerts as notifications](#car-alerts-as-notifications) | Shows car alerts as notifications. |  |
| [Car map zoom](#car-map-zoom) | Zooms the map on the car screen. | • Car map zoom |
| [Car screen fits its window](#car-screen-fits-its-window) | Fits the car screen to its window, not the full display. |  |
| [Car trip screen text](#car-trip-screen-text) | Adds arrival time and time left to the car trip bar. |  |
| [Disable Play Store updates](#disable-play-store-updates) | Stops the Play Store updating Waze. |  |
| [Enable police & enforcement alerts](#enable-police-enforcement-alerts) | Turns police and enforcement alerts on. |  |
| [Extra map info](#extra-map-info) | Compass always shown and toll price on routes. | • Always show compass<br>• Toll price on route |
| [Instrument cluster support](#instrument-cluster-support) | Shows the map and alerts on the car's cluster screen. | • Large cluster layout |
| [Keep Waze alive](#keep-waze-alive) | Stops Waze closing when you leave it. | • Where<br>• Minutes alive |
| [Lane guidance](#lane-guidance) | Shows lane guidance, including straight-ahead hints. |  |
| [Live drive sharing](#live-drive-sharing) | Adds the hidden share-your-drive link. |  |
| [Morphe YouTube Music as a Waze audio partner](#morphe-youtube-music-as-a-waze-audio-partner) | Lets Morphe YouTube Music play through Waze. |  |
| [New alert icons](#new-alert-icons) | Uses Waze's newer alert icons. |  |
| [No Android Auto telemetry](#no-android-auto-telemetry) | Stops Waze sending Android Auto screen-switch timings to its analytics. |  |
| [Picture-in-picture](#picture-in-picture) | Floats Waze in a 9:16 window every time you leave it. Known issues: touch does not work on the floating window, and the UI does not scale down. |  |
| [Remove ads](#remove-ads) | Removes ads. | • Block beacon popups |
| [Show FPS counter](#show-fps-counter) | Shows the frame-rate counter. |  |
| [Skip sign-in](#skip-sign-in) | Starts as a guest, straight to the map. |  |
| [Smoother Android Auto map](#smoother-android-auto-map) | Smooths map movement on Android Auto. |  |
| [Speed limits](#speed-limits) | Sign always shown, limit-drop warnings, reporting and sign style. | • Sign always shown<br>• Limit-drop warnings<br>• Report the speed limit<br>• Sign style |
| [Speedometer & limit sign](#speedometer-limit-sign) | Size of the speedometer and limit sign, and keeps them on screen. | • Always show speedometer<br>• Speedometer size<br>• Speed limit sign size |
| [Theme](#theme) | Picks the map theme for day and night. | • Day theme<br>• Night theme |
| [Traffic meter](#traffic-meter) | Shows the traffic meter on the car screen. |  |
| [Unlock driver moods](#unlock-driver-moods) | Unlocks all moods on the device. |  |

</details>

<!-- PATCHES_END -->

## 🛠️ Building locally

- `./gradlew buildAndroid` → the bundle lands in `patches/build/libs/patches-*.mpp`
- Patch that file with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other bundle.

## 📜 License

[GNU General Public License v3.0](LICENSE).

## 🙏 Credits

- **Morphe YouTube Music as a Waze audio partner**: ported from [Loupric/morphe-waze-music-patch](https://github.com/Loupric/morphe-waze-music-patch) (GPLv3), extended here to force Waze's audio-extension switches, so the partner does not depend on Waze's server flags.
- **Unlock driver moods** and the resource refresh: ported from [aaayd/waze-custom-patches](https://github.com/aaayd/waze-custom-patches) (GPLv3).
- **Disable Play Store updates**: adapted from [MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches) (GPLv3).
- **Speed-limit sign style**, **Report speed limit**, the phone side of **Keep Waze alive**, and the extra keys in **Remove ads**, **Enable police & enforcement alerts** and **Alert distances**: ported from [bearinmindcat/morphe-patches](https://github.com/bearinmindcat/morphe-patches) (GPLv3).

More detail in [CREDITS.md](CREDITS.md).

## Support

Like my work?

<a href="https://buymeacoffee.com/forsigh"><img src="store/buy-me-a-coffee.png" alt="Buy me a coffee" width="200"></a>
