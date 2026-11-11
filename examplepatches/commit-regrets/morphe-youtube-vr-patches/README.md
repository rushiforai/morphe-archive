# 📦🧩 YouTube VR Patches

Patches for YouTube VR (Meta Quest / Horizon OS), for use with
[Morphe](https://morphe.software) — an independent, unaffiliated project.

## ❓ About

Patches for `com.google.android.apps.youtube.vr.oculus`, pinned to **1.91.10** and **1.90.05**. R8
renames everything per release, so a store update needs re-fingerprinting and an unlisted version is
*skipped*, not failed — see [docs/VERSIONING.md](docs/VERSIONING.md) and
[docs/FINGERPRINTS.md](docs/FINGERPRINTS.md).

### How to use these patches

Add this bundle to Morphe: https://morphe.software/add-source?github=commit-regrets/morphe-youtube-vr-patches

Apply it to your own copy of the YouTube VR APK. The easiest source is Morphe Manager itself:
**Use installed app** at the APK step patches the build already on the headset — no extraction. If
Manager is not an option, or you need a version your headset has not taken yet, see
[docs/GETTING-THE-APK.md](docs/GETTING-THE-APK.md). **The defaults are the recommended
configuration**: the ad-free streaming spoof is on and the development diagnostics are off.

### Install as clone

A patched APK is signed differently from Google's, so it cannot update the store app in place. The
**Install as clone** patch renames the package instead, and it is **on by default**:

* **Clone** (the default) — `app.morphe.android.youtube`: a second app beside the store's YouTube VR,
  which is left untouched.
* **Replace** — keeps `com.google.android.apps.youtube.vr.oculus`: the store copy must be uninstalled
  first (the signatures differ), Horizon OS then treats this build as the YouTube VR app (a restore
  prompt, a warning on every reboot), and the next store update collides with it.

The app is listed as **YouTube VR (patched)**; change it with `-AppName` or `-OappName=…`.

Windows, one command — it applies the bundle, installs over `adb`, and verifies the *effective* options
and the package id the rename actually took, so a silently dropped option cannot ship:

```powershell
pwsh -File scripts/patch-and-install.ps1 -Apk <path-to-youtube-vr.apk> `
  -AppName "YouTube VR (patched)" -PackageName app.morphe.android.youtube
```

Add `-NoSpoof` (spoof off, for A/B comparisons), `-NoClone`, or `-OfficialClone` (rename with the
official *Clone app* instead, which disables ours for that run). CLI traps and the hand-apply recipe:
[docs/INTERNALS.md](docs/INTERNALS.md).

**In Morphe Manager**, the link above is all you need: the clone is applied by this bundle, so **Simple
mode** works. Do not also tick the official *Clone app* (with both renamers selected, the official one
wins); skipping the clone means the build cannot coexist with the store app, and with Shizuku and "auto
uninstall" enabled Manager may remove the installed app first. See
[AGENTS.md](AGENTS.md#morphe-manager-the-mechanics-that-are-not-visible-from-here).

While a cloned build runs, its Quest-library card shows `App name unavailable` plus Quit — that is
Horizon OS naming a running immersive app from a package-keyed record, not a patch bug, and it is not
fixable from inside the APK ([decompiled evidence](docs/APP-NAME-CARD.md)). **Quit is how you exit** (or
`adb shell am force-stop app.morphe.android.youtube`); the app's **2D panel** entry shows the proper
name.

### Default video quality

Starts every video at one resolution instead of the app's per-video choice, which drifts downward over
a session. The value is a *ceiling*: a video without it plays at its highest available format, so
**Highest available** is 8K where the stream has it. **Auto** hands the choice back to the app. Set it
on the **Patch settings** hub; the Manager option only *seeds* the headset setting on first launch.

### SponsorBlock

Skips crowd-sourced segments from [sponsor.ajay.app](https://sponsor.ajay.app). **On by default**, with
upstream's recommended rules (`sponsor` = `skip-once`; `selfpromo`/`interaction`/`highlight`/`intro`/
`outro`/`music_offtopic` = `manual-skip`; `preview`/`hook`/`filler` = `ignore`), configurable per
category in the headset and at build time (a self-hosted API works too). Segments are also drawn **on
the VR seek bar** in their category colours.

Every decision logs under the `SponsorBlock:` tag: `adb logcat -d | rg -a "SponsorBlock:"`.

Three behaviours surprise people: a skip is per *pass* (dragging back before a segment skips it again);
dragging *into* a segment lets it play out; and a category set to **Disable** does nothing at all,
silently — VR has no skip button, so a video whose only segments are `filler` or `music_offtopic` looks
broken until that category is on. Design and measurements:
[docs/SPONSORBLOCK-NOTES.md](docs/SPONSORBLOCK-NOTES.md).

### Patch settings

YouTube VR's own **Settings** gains a **Patch settings** row at the top, opening this project's hub,
built from the app's own preferences XML so it renders and focuses like YouTube's own rows:

* **SponsorBlock** — master switch, seek-bar markers, one colour-coded row per category (tap for its
  in-row picker), **Stats**, and a **Minimum segment duration** slider.
* **Default video quality** — the resolution every video starts at.
* **QUIC (HTTP/3)** — allow QUIC (TLS over UDP); turn it off if playback stalls on a network that
  blocks UDP. Applies after a restart.
* **Verbose logging** — diagnostic logs to logcat, for troubleshooting.

Changes apply to the next video, no rebuild or restart, and override the patch options (which stay the
defaults). The streaming spoof and the diagnostic probes stay **build-time** on purpose.

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
| [App name](#app-name) | Changes the app name shown in the headset's library and in app info. The stock name is just "YouTube", which is easy to confuse with the store app. | App name |
| [Default video quality](#default-video-quality) | Starts every video at one resolution instead of the app's per-video choice; a resolution the video lacks falls back to its highest available (8K included when the stream spoof provides it). | Default video quality |
| [Extension](#extension) | Injects the extension the other patches run through: its streaming spoof is what removes the pre-roll (ad-free playback) and provides the 8K format support. Turning this patch off restores ads. | Ad-free streaming spoof, Verbose diagnostics, Force verbose logging, Force the native fallback, Probe identity matrix, Native formats without SABR, 8K: accept the AV1 8K HDR tier as SDR |
| [Hide ads](#hide-ads) | Hides video ads, including the pre-roll when the streaming spoof is unavailable and the app falls back to its own player response. |  |
| [Install as clone](#install-as-clone) | Installs the patched app as a separate app by default, so it sits alongside the store's YouTube VR instead of replacing it. | Package name, Update permissions, Update providers |
| [Patch settings](#patch-settings) | Builds the in-headset "Patch settings" hub and the SponsorBlock settings screen. The resource half of the SponsorBlock patch, which mines what this patch restructures the XML with. |  |
| [QUIC (HTTP/3)](#quic-http-3) | Adds the in-headset switch for QUIC, the transport under HTTP/3: TLS over UDP, used for this app's API and media requests. | QUIC |
| [Remove viewer discretion dialog](#remove-viewer-discretion-dialog) | Removes the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| [SponsorBlock](#sponsorblock) | Automatically skips SponsorBlock segments (sponsors, self-promos, intros, ...). On by default (sponsors: skip once); configure per-category behaviour below or in the headset's Patch settings screen. | SponsorBlock API base, Sponsor, Self-promotion, Interaction reminder, Intermission/intro, Outro/endcards, Preview/recap, Hook, Filler tangent, Music: non-music, Highlight |
| [Spoof app version](#spoof-app-version) | Adds an option to trick the app into thinking you are running a different version; the option ships set to the app's current version, so selecting the patch alone changes nothing. | Spoofed version name |
| [Spoof package name in User-Agent](#spoof-package-name-in-user-agent) | Adds an option to report a different app package name in the Cronet User-Agent; the option ships set to the original package name, so selecting the patch alone changes nothing. | Spoofed package name |

</details>

<!-- PATCHES_END -->

## 🧰 Requirements and tooling

| tool | what it is for | where it is looked for |
|---|---|---|
| **JDK 21** | Gradle, and `javac` for the injected extension | `JAVA_HOME` |
| **`android.jar`** | the Android platform jar the patch build compiles against | `-PandroidJar=<path>`, `$ANDROID_JAR`, or `~/tools/android/android.jar` |
| **`r8.jar`** | shrinks and dexes the extension into `ytvr-extension.dex` | `-Pr8Jar=<path>`, `$R8_JAR`, or `~/tools/r8/r8.jar` |
| **Morphe Desktop** (`morphe-desktop-all.jar`) | applies the built bundle to the APK | see [Install as clone](#install-as-clone) |
| **Android platform-tools (`adb`)** | installing on the Quest, and reading its logs | `PATH` |
| **Android SDK build-tools (`d8`)** | dexing the extension during the build | `PATH` |
| **[jadx](https://github.com/skylot/jadx)** | reading the app's bytecode: every anchor in [docs/FINGERPRINTS.md](docs/FINGERPRINTS.md) was measured with it, and it is how a patched dex is checked after a build | `PATH` |
| **[REA](https://github.com/morluto/rea)** *(optional)* | reverse-engineering toolkit: device integration and APK/JADX analysis | `PATH` |
| **`gh`** *(optional)* | checking CI runs and releases | `PATH` |

You also need a **stock YouTube VR 1.91.10 or 1.90.05 APK** as the input; this repository does not ship
one, and the first build needs network access to resolve the patcher dependency. Headset-only recipes
(wireless adb, capturing the screen without wearing it) are in [AGENTS.md](AGENTS.md#device-access).

### 🛠️ Building locally

- `./gradlew buildAndroid` — build, plus Spotless, detekt and the JUnit suite in `patches/src/test`
  (SponsorBlock decision logic, the settings-XML restructure, the log gate).
- Before pushing, `pwsh -NoProfile -File scripts/check-apk.ps1` patches every supported stock APK in
  `apk/` headlessly and fails on any patch failure, audit finding or role mismatch — the version-bump
  check, without a device.
- The bundle lands in `patches/build/libs/patches-*.mpp`; apply it with
  [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle. More:
  [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

### Development notes

The verified mechanisms, the experiment ledger and the re-derivation workflow for a future app version
live in [`docs/`](docs/) — start at [docs/README.md](docs/README.md). Those files are hand-written; the
patches list above, `CHANGELOG.md`, `patches-list.json`, `patches-bundle.json` and the version in
`gradle.properties` are generated by the release pipeline, so edit the prose, not those.

**Logging is opt-in and never on by default.** A normal apply — CI, a release, or anyone using the
bundle through Morphe Manager — injects the log gate's initialisation and nothing else, so the app
prints nothing unless the viewer turns on the in-headset **Verbose logging** row. Local builds can force
it on with `-VerboseLogging` (no extra hooks, no extra network) or `-Diagnostics` (the same plus the
route logs and one probe fetch per launch); both default to off. Details:
[AGENTS.md](AGENTS.md#logging).

## Acknowledgements

This project is a **derivative of [WalkTheEarth/morphe-ytvr-patches](https://github.com/WalkTheEarth/morphe-ytvr-patches)**
(GPL-3.0) — the original Morphe patches for YouTube VR — and builds on the
[Morphe patcher framework](https://github.com/MorpheApp/morphe-patcher) and its official patch
bundle. Full attribution, including what came from where and what changed here, is in
[ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md).

## 📜 License

YouTube VR Patches are licensed under the [GNU General Public License v3.0](LICENSE)

This repository is derived from another GPL-3.0 project and builds on Morphe's own patches —
see [ACKNOWLEDGEMENTS.md](ACKNOWLEDGEMENTS.md) for what came from where, and for the list of
changes made here.
