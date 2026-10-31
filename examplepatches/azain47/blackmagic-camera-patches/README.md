# Blackmagic Camera patches

A small [Morphe](https://github.com/MorpheApp/morphe-patcher) / ReVanced-style patch
bundle for the Android **Blackmagic Camera** app, built from a field investigation into
random recording freezes on a Galaxy S23 Ultra. The patches are fingerprint-based, so
they are meant to survive app updates rather than being pinned to one build.

> **Personal-use tool.** Blackmagic Camera is a free app with no in-app purchases. These
> patches modify a copy of the app **you already installed**, on **your own device**, to fix
> performance problems and expose a usable bitrate range. They are **not** a redistribution
> of the app: you must supply your own APK (see *Usage*). Nothing here unlocks a paid
> feature — the app has none.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/azain47/blackmagic-camera-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;4 patches total
<details open>
<summary>📦 Blackmagic Camera&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Configurable bitrate tiers](#configurable-bitrate-tiers) | Rescales the LOW / MEDIUM / HIGH video bitrate tiers to a configurable percentage of the encoder's maximum (MAX is unchanged); defaults are 25 / 50 / 75 %. At 1080p30 H.265 on a flagship this turns the stock 6 / 9 / 12 / 160 Mbps options into usable ~40 / 80 / 120 / 160 Mbps steps, removing the order-of-magnitude gap to MAX. | • LOW tier (% of encoder max)<br>• MEDIUM tier (% of encoder max)<br>• HIGH tier (% of encoder max) |
| [Disable license check](#disable-license-check) | Disables the PairIP license verification that force-quits a re-signed build. Required for any patched build to launch. |  |
| [Smooth gallery thumbnails](#smooth-gallery-thumbnails) | Replaces the in-app gallery's grid thumbnail fetcher, which spins up a full ExoPlayer + GL-readback pipeline per cell (hundreds of MB of transient graphics memory and a short-lived player for every tile), with a direct MediaMetadataRetriever.getScaledFrameAtTime decode at the tile size. This removes the memory spikes that make browsing stutter and can trigger the low-memory killer mid-record. |  |
| [Unlock developer options](#unlock-developer-options) | Reveals the hidden internal "Development" settings category (debug UI overlay, software-encoder selection, custom bitrate field, camera-DB reload, etc.), which the stock release build gates behind an "internal builds only" check. Off by default: these are debug toggles, and some do nothing useful on a retail device. |  |

</details>

<!-- PATCHES_END -->

Each patch is independently toggleable in the Manager. See
[`docs/BLACKMAGIC_REPORT.md`](docs/BLACKMAGIC_REPORT.md) for the full investigation, including the
memory/freeze root-cause analysis behind the gallery fix.

## Why

The stock app at 1080p offers no middle-ground bitrate: the gap from HIGH (12 Mbps) to MAX
(160 Mbps, the hardware ceiling) is more than 10×. The bitrate patch fixes exactly that.
The license-check patch is only here because, like all PairIP-protected apps, a re-signed
build won't start without it.

## Build

Built with the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template)
toolchain (JDK 21). The Morphe Gradle plugin is served from GitHub Packages, which needs a GitHub
token with `read:packages` even though it's public:

```bash
export GITHUB_ACTOR=<your-github-user> GITHUB_TOKEN=$(gh auth token)   # token needs read:packages
./gradlew buildAndroid
# -> patches/build/libs/patches-<version>.mpp
```

Releases are automatic: pushing [conventional commits](https://www.conventionalcommits.org)
(`feat:`, `fix:`, `perf:`) to `dev` cuts a pre-release, and merging `dev` into `main` cuts a
stable release. CI regenerates `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` and the
patch list above. Don't edit those by hand.

## Usage

### On-device (Morphe Manager) — recommended

1. Install the [Morphe Manager](https://morphe.software) app.
2. Tap the link on your phone to add this repo as a patch source:

   [**➕ Add Blackmagic Camera Patches to Morphe**](https://morphe.software/add-source?github=azain47/blackmagic-camera-patches)

   (Manually: **Sources → Add** → `https://github.com/azain47/blackmagic-camera-patches`.)
   The Manager reads [`patches-bundle.json`](patches-bundle.json) on the `main` branch, downloads
   the `.mpp` from the latest release, and shows it as **"Blackmagic Camera Patches"**.
3. Tap **Blackmagic Camera**, pick the patches you want, and patch. Morphe patches the split
   bundle directly (use the original APKM, don't unsplit it) and handles re-signing/install.

### On a computer (morphe-desktop)

1. Obtain the genuine app. Blackmagic Camera ships as a **split APK bundle**. Pull the
   installed splits from your device, or download the bundle from a trusted mirror:
   ```bash
   adb shell pm path com.blackmagicdesign.android.blackmagiccam
   adb pull <base.apk path>           # and the split_config.* apks
   ```
2. Patch `base.apk` (all patched code lives in the base module):
   ```bash
   java -jar morphe-desktop-*-all.jar patch \
     --patches=patches-<version>.mpp \
     --keystore=my.keystore --keystore-password=... \
     --keystore-entry-alias=... --keystore-entry-password=... \
     -o base-patched.apk base.apk
   ```
3. Install the patched `base-patched.apk` together with the **unmodified** `split_config.*`
   APKs, using a split-APK installer (e.g. SAI) or:
   ```bash
   adb install-multiple base-patched.apk split_config.arm64_v8a.apk split_config.xxhdpi.apk
   ```
   Because the build is re-signed, you must uninstall the Play Store version first (this
   wipes the app's settings/presets/LUTs; your recorded videos in DCIM are untouched).

> Patching re-signs the app with your own key, so Play Store auto-updates stop. Re-patch
> new versions yourself.

## Compatibility & getting the APK

Declared compatible with **any version** of `com.blackmagicdesign.android.blackmagiccam`, as an
**APKM split bundle**. The fingerprints avoid obfuscated names — they anchor on stable types and
strings (the non-obfuscated `BitrateLevel` / `BaseSettingsCategory$Availability` enums, the
`com.pairip.licensecheck` package, the `"Frame extractor"` string) and rediscover obfuscated
references from bytecode — so they are meant to apply across versions, and a fingerprint that no
longer matches fails loudly instead of corrupting the app. Verified end-to-end against **3.5.0.0066**.

Why not pin a version: the build Google Play installs is often a step newer than the public mirrors
(e.g. Play ships **3.5.0.0066** while APKMirror's latest is **3.5.0.0064**). Pinning an exact
version makes Manager's downloader find nothing, so the version is left open — Manager downloads
whatever build is currently available and patches that.

Manager resolves the download itself from the package name (APKMirror / Uptodown / APKPure /
APKCombo). To fetch it by hand, grab the latest **BUNDLE (APKM)** from
[APKMirror](https://www.apkmirror.com/apk/blackmagic-design-inc/blackmagic-camera/) and hand the
`.apkm`/`.apks` to Manager or `morphe-desktop` — don't un-split it.

## Roadmap

Additional on-device-verified fixes from the investigation, not yet ported to patches here:

- Deterministic ExoPlayer release when leaving the gallery player, a cap on the placeholder-bitmap
  cache, and a tighter muxer sample-window — further trims to the memory pressure behind the freezes.

These are documented with exact bytecode in [`docs/BLACKMAGIC_REPORT.md`](docs/BLACKMAGIC_REPORT.md).

## Credits & reporting

Built on [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher) (itself based on
[ReVanced](https://github.com/ReVanced/revanced-patcher)). The findings in
[`docs/BLACKMAGIC_REPORT.md`](docs/BLACKMAGIC_REPORT.md) are intended to be shared upstream
with Blackmagic Design so the issues can be fixed in the real app.

## License

[GNU General Public License v3.0](LICENSE), with the additional terms in [NOTICE](NOTICE)
(inherited from the Morphe patches template). This repository contains only original patch code
and analysis; it does not contain or distribute any part of the Blackmagic Camera app.
