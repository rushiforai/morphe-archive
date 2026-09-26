# Supperelias2 SBS Patches

Unofficial [Morphe](https://morphe.software) patches for SBS On Demand.

[Add this source to Morphe](https://morphe.software/add-source?github=Supperelias2/sbs-morphe-patches)
 · [Releases](https://github.com/Supperelias2/sbs-morphe-patches/releases)
 · [Report a problem](https://github.com/Supperelias2/sbs-morphe-patches/issues)

## What the patches do

**Prefer direct VOD stream** selects an Akamai HLS alternative
already present in the app's playback response instead of Google DAI. It only
changes on-demand playback when a non-empty alternative URL is available.
Live playback and cases without an alternative retain the original selection.

**Prefer direct live stream** separately selects an available
Akamai HLS alternative for live TV instead of Google DAI. Without a non-empty
alternative URL it keeps the original selection. Ads in the broadcast itself
remain; avoiding all additional inserted ads is not guaranteed.

The maintainer reports successful VOD and live playback with these patches on a phone using
SBS **6.3.0 (16435)**. This is an initial user test, not comprehensive device
coverage. Ad-free playback is not guaranteed for every title or session.
Location requirements are unchanged.

## Install with Morphe Manager

1. Open the source link above, or add `https://github.com/Supperelias2/sbs-morphe-patches`
   under **Sources → + → Remote**.
2. Select an original SBS 6.3.0 APKM. Both playback patches are selected by
   default; you can disable either one if you only want VOD or live changes.
   The compatibility check is automatic.
3. For development releases, enable **Pre-release patches** for this source.
4. Patch and install using Morphe Manager. A signature conflict with the official
   app may require uninstalling that app, which removes its local data/downloads.
5. Keep Morphe's signing key for future updates. Test start, resume, seeking,
   midstream playback and live playback.

Alternatively import the release's `.mpp` file using **Sources → + → Local**.
Local imports need to be replaced manually for updates. Always patch an original
app file, not an already patched APK.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/Supperelias2/sbs-morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 SBS On Demand&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 6.3.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Prefer direct VOD stream](#prefer-direct-vod-stream) | Prefers an available Akamai VOD stream over Google DAI. Keeps original selection for live or missing alternatives. Ad removal is not guaranteed. |  |
| [Prefer direct live stream](#prefer-direct-live-stream) | Prefers an available Akamai live stream over Google DAI. Broadcast ads remain. Keeps original selection when no direct stream is available. |  |
| [SBS playback compatibility check](#sbs-playback-compatibility-check) | Checks SBS 6.3.0 playback integration points. Does not remove advertisements. |  |

</details>

<!-- PATCHES_END -->

## Development and testing

Build with `./gradlew buildAndroid`. The bundle is written to
`patches/build/libs/patches-*.mpp`. Local builds need GitHub Packages read access;
never commit credentials. Development happens on `dev`; the existing semantic
release workflow builds releases and updates source metadata.

Validation completed: Gradle build, application to the original APKM using
Morphe Desktop 1.16.0, APK rebuild, and inspection of the modified DEX method.
Both patches together were applied to the original APKM and their guards and
fallback paths inspected in the rebuilt DEX. The live patch also passed a
standalone application/rebuild check on the base APK. The maintainer subsequently
reported successful live playback on a phone. Broader channel/device coverage
remains unverified.

See [implementation notes](docs/sbs-playback-preparation.md). When reporting a
problem include app/patch versions, phone and Android version, playback action
and a sanitized patching log. Do not include account tokens or private stream URLs.

## License and affiliation

Patch code is licensed under [GPLv3](LICENSE); see [NOTICE](NOTICE).
This project is not affiliated with SBS or the Morphe project. No SBS APKs,
decompiled app sources, account data or signing keys are distributed here.
