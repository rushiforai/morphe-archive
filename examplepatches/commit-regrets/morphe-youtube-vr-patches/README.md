# 📦🧩 YouTube VR Patches

Patches for YouTube VR (Meta Quest / Horizon OS), for use with
[Morphe](https://morphe.software) — an independent, unaffiliated project.

## ❓ About

Patches for `com.google.android.apps.youtube.vr.oculus`, pinned to **1.91.10** and **1.90.05**.
A store update the bundle doesn't cover yet is *skipped*, not broken — the versioning policy is in
[docs/VERSIONING.md](docs/VERSIONING.md).

### How to use these patches

Add this bundle to Morphe: https://morphe.software/add-source?github=commit-regrets/morphe-youtube-vr-patches

Apply it to your own copy of the YouTube VR APK — the easiest source is Morphe Manager itself:
**Use installed app** at the APK step patches the build already on the headset. If Manager is not an
option, see [docs/GETTING-THE-APK.md](docs/GETTING-THE-APK.md). **The defaults are the recommended
configuration.**

By default the patched app installs as a **second app** beside the store's YouTube VR, listed as
**YouTube VR (patched)** — change the name with `-AppName` (or the **App name** patch). From the
command line, one command applies the bundle and installs over `adb`:

```powershell
pwsh -File scripts/patch-and-install.ps1 -Apk <path-to-youtube-vr.apk> `
  -AppName "YouTube VR (patched)" -PackageName app.morphe.android.youtube
```

Feature details, measurements and the versioning workflow live in [`docs/`](docs/README.md). Do not
also tick the official *Clone app* patch in Morphe Manager — with both renamers selected, the official
one wins (see [AGENTS.md](AGENTS.md#morphe-manager-the-mechanics-that-are-not-visible-from-here)).

<!-- PATCHES_START EXPANDED -->
> **[v1.31.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/releases/tag/v1.31.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 YouTube VR&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**🎯 Supported versions:**

| 1.91.10 | 1.90.05 |
| :---: | :---: |
| Verified: every fingerprint was re-derived against this build. | Verified: every fingerprint was re-derived against this build. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| **App name** | Changes the app name shown in the headset's library and in app info. The stock name is just "YouTube", which is easy to confuse with the store app. | App name |
| **Default video quality** | Starts every video at one resolution instead of the app's per-video choice; a resolution the video lacks falls back to its highest available (8K included when the stream spoof provides it). | Default video quality |
| **Extension** | Injects the extension the other patches run through: its streaming spoof is what removes the pre-roll (ad-free playback) and provides the 8K format support. Turning this patch off restores ads. | Ad-free streaming spoof, Verbose diagnostics, Force verbose logging, Force the native fallback, Probe identity matrix, Native formats without SABR, 8K: accept the AV1 8K HDR tier as SDR |
| **Hide ads** | Hides video ads, including the pre-roll when the streaming spoof is unavailable and the app falls back to its own player response. |  |
| **Install as clone** | Installs the patched app as a separate app by default, so it sits alongside the store's YouTube VR instead of replacing it. | Package name, Update permissions, Update providers |
| **Patch settings** | Builds the in-headset "Patch settings" hub and the SponsorBlock settings screen. The resource half of the SponsorBlock patch, which mines what this patch restructures the XML with. |  |
| **QUIC (HTTP/3)** | Adds the in-headset switch for QUIC, the transport under HTTP/3: TLS over UDP, used for this app's API and media requests. | QUIC |
| **Remove viewer discretion dialog** | Removes the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| **SponsorBlock** | Automatically skips SponsorBlock segments (sponsors, self-promos, intros, ...). On by default (sponsors: skip once); configure per-category behaviour below or in the headset's Patch settings screen. | SponsorBlock API base, Sponsor, Self-promotion, Interaction reminder, Intermission/intro, Outro/endcards, Preview/recap, Hook, Filler tangent, Music: non-music, Highlight |
| **Spoof app version** | Adds an option to trick the app into thinking you are running a different version; the option ships set to the app's current version, so selecting the patch alone changes nothing. | Spoofed version name |
| **Spoof package name in User-Agent** | Adds an option to report a different app package name in the Cronet User-Agent; the option ships set to the original package name, so selecting the patch alone changes nothing. | Spoofed package name |

</details>

<!-- PATCHES_END -->

## 🧰 Building locally

- `./gradlew buildAndroid` — build, plus Spotless, detekt and the JUnit suite in `patches/src/test`.
- Before pushing, `pwsh -NoProfile -File scripts/check-apk.ps1` patches every supported stock APK
  headlessly — the version-bump check, without a device.
- The bundle lands in `patches/build/libs/patches-*.mpp`; apply it with
  [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

Tooling (JDK 21, `android.jar`, `r8.jar`, Morphe Desktop, `adb`, `d8`, `jadx`) and where each is
looked for: [AGENTS.md](AGENTS.md#requirements). Device recipes (wireless adb, headless captures):
[AGENTS.md](AGENTS.md#device-access).

## Acknowledgements

This project is a **derivative of [WalkTheEarth/morphe-ytvr-patches](https://github.com/WalkTheEarth/morphe-ytvr-patches)**
(GPL-3.0) and builds on the [Morphe patcher framework](https://github.com/MorpheApp/morphe-patcher).
Full attribution: [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md).

## 📜 License

[GNU General Public License v3.0](LICENSE)
