# 📦🧩 YouTube VR Patches

Patches for YouTube VR (Meta Quest / Horizon OS), for use with
[Morphe](https://morphe.software) — an independent, unaffiliated project.

## ❓ About

Patches for the YouTube VR app for Meta Quest (`com.google.android.apps.youtube.vr.oculus`), pinned to
**1.89.09** and **1.88.10**. R8 reassigns every name per release, so a store update needs re-fingerprinting and an
unlisted version is *skipped*, not failed — see [docs/VERSIONING.md](docs/VERSIONING.md) and
[docs/FINGERPRINTS.md](docs/FINGERPRINTS.md).

### How to use these patches

Add these patches to Morphe: https://morphe.software/add-source?github=commit-regrets/morphe-youtube-vr-patches

Apply them to your own copy of the YouTube VR APK. **The defaults are the recommended configuration** —
the ad-free streaming spoof is on and the development diagnostics are off, so there is nothing to
configure. Getting the APK is its own step, and it has to come from your own headset:
[docs/GETTING-THE-APK.md](docs/GETTING-THE-APK.md).

### Install as clone

A patched APK is signed differently from Google's, so it cannot update the store app in place — Horizon
OS detects the mismatch and asks for the app to be removed. This bundle's **Install as clone** patch
renames the package instead, and it is **on by default**, so a normal run produces a separate app with
no extra step:

* **Clone** (the default) — `app.morphe.android.youtube`: a second app beside the store's YouTube VR,
  which is left untouched.
* **Replace** — keeps `com.google.android.apps.youtube.vr.oculus`: the store copy has to be uninstalled
  first (the signatures differ), Horizon OS then treats this build as the YouTube VR app (a restore
  prompt, and a warning on every reboot), and the next store update collides with it.

The patched app is listed as **YouTube VR (patched)**; change it with `-AppName` or `-OappName=…`. (The
official "Custom branding" patch does not apply to this app.)

Windows, one command:

```powershell
pwsh -File scripts/patch-and-install.ps1 -Apk <path-to-youtube-vr.apk> `
  -AppName "YouTube VR (patched)" `
  -PackageName app.morphe.android.youtube
```

It applies our bundle (clone included), installs over `adb`, and checks the *effective* option values
from the patch result — including the package id the rename actually took — so a silently dropped option
or a rename that no-ops cannot ship. Add `-NoSpoof` to apply the patches with the streaming spoof off
(A/B comparisons only), `-NoClone` to rename nothing, or `-OfficialClone` to rename with the official
*Clone app* instead, which disables ours for that run.

By hand, it is one apply:

```bash
JAVA=java; M=morphe-desktop-all.jar
# our patches, defaults: clone included, and the id is the clone option's default
"$JAVA" -jar "$M" patch --patches patches-<version>.mpp -o out.apk youtube-vr.apk
adb install -r out.apk
```

Two CLI traps (`-O` belongs to the first `--enable`; the official *Clone app* needs its own pass) and
the rest of the recipe: [docs/INTERNALS.md](docs/INTERNALS.md).

### Installing with Morphe Manager

The add-source link above is all Manager needs — **including the clone**, which this bundle performs
itself: *Install as clone* is a patch *for this app*, so it is a default patch and **Simple mode**
applies it along with the rest. **Expert mode is no longer needed for the clone.** Do not also tick the
official *Clone app* — with both renamers selected the official one wins — and note that skipping the
clone has real costs: the build then cannot coexist with the store app, and with Shizuku and "auto
uninstall" enabled Manager may remove the installed app first. The mechanics behind all of this are in
[AGENTS.md](AGENTS.md#morphe-manager-the-mechanics-that-are-not-visible-from-here).

### Known behaviour: the "App name unavailable" card

While a **cloned** build is running, its card in the Quest library shows `App name unavailable` plus
Quit. That is Horizon OS, not the patches: it names a running *immersive* app from an app-manager
record keyed by package name, and a re-signed clone has no such record. It is **not fixable from inside
the APK** — the decompiled evidence is in [docs/APP-NAME-CARD.md](docs/APP-NAME-CARD.md). Two things
follow: **Quit is how you exit the app** (immersive VR apps have no in-app exit; from a PC,
`adb shell am force-stop app.morphe.android.youtube` does the same), and launching the app's **2D panel**
entry instead shows the proper name, because panel apps are named from the APK label.

### Default video quality

Starts every video at one resolution instead of the app's own per-video choice, which drifts downward
over a session. The requested value is a *ceiling*: a video that does not have it plays at its highest
available format, so **Highest available** means 8K where the stream has it (the streaming spoof
supplies that format) and otherwise simply the best there is. The picker also offers the fixed values —
**8K (4320p)**, **4K (2160p)**, 1440p, 1080p Full HD, 720p, 480p, 360p — plus **Auto**, which hands the
choice back to the app. 8K and Highest available are the same ceiling today, because nothing taller than
4320 is served; they are separate entries so the row shows back the one you picked.

It lives on the **Patch settings** hub and applies to the next video without a rebuild. The row shows
the current choice under its name, and tapping it opens the list *inside the row* — a dialog is never
composited into the VR panel. The Manager patch option of the same name only *seeds* the headset setting
on first launch; the headset row governs from the first change there.

### SponsorBlock

Skips crowd-sourced segments from [sponsor.ajay.app](https://sponsor.ajay.app) while a video plays.
**It is on by default**, with upstream's recommended configuration (`sponsor` = `skip-once`;
`selfpromo`/`interaction`/`highlight`/`intro`/`outro`/`music_offtopic` = `seekbar-only`;
`preview`/`hook`/`filler` = `ignore`), configurable per category in the headset's Patch settings and at
build time (a self-hosted API instance works too). Segments are also drawn **on the VR seek bar** in
their category colours, so you can see what is coming and where a segment was skipped.

Every decision logs to logcat under the `SponsorBlock:` tag:

```powershell
adb logcat -d | rg -a "SponsorBlock:"
```

Three behaviours surprise people: a skip is per *pass*, so dragging the seek bar back before a segment
makes it skip again; dragging *into* a segment lets that segment play out; and a category set to
**Disable** does nothing at all, silently — VR has no skip button, so a video whose only segments are
`filler` or `music_offtopic` looks like SponsorBlock is broken until that category is switched on.
Measured behaviour and the design: [docs/SPONSORBLOCK-NOTES.md](docs/SPONSORBLOCK-NOTES.md).

### Patch settings (in the headset)

YouTube VR's own **Settings** list gains a **Patch settings** row at the top, opening this project's hub
(the app's native fragment navigation, one entry per feature). Every row is built from the app's own
preferences XML, so it renders, scrolls and focuses exactly like YouTube's own rows:

* **SponsorBlock** — master switch, seek-bar markers, one colour-coded row per category (tapping a
  category opens an in-row behaviour picker), a display-only **Stats** counter, and a
  **Minimum segment duration** slider.
* **Default video quality** — the resolution every video starts at.
* **QUIC (HTTP/3)** — whether the app's network stack may use QUIC (TLS over UDP). Leave it on
  unless playback stalls on a network that blocks UDP (corporate Wi-Fi, many VPNs); turning it off
  forces TCP/TLS, and a change applies after a restart.
* **Verbose logging** — toggles diagnostic logs to logcat, for troubleshooting.

Changes are stored on the device and apply to the next video — no rebuild, no restart — and they
override the patch options, which stay the defaults. The streaming spoof and the diagnostic probes stay
**build-time** on purpose: the spoof is applied as hooks, so turning it off means a build without them
rather than a switch.

<!-- PATCHES_START EXPANDED -->
> **[v1.28.0](https://github.com/commit-regrets/morphe-youtube-vr-patches/releases/tag/v1.28.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 YouTube VR&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**🎯 Supported versions:**

| 1.89.09 | 1.88.10 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [App name](#app-name) | Changes the app name shown in the headset's library and in app info. The stock name is just "YouTube", which is easy to confuse with the store app. | • App name |
| [Default video quality](#default-video-quality) | Starts every video at one resolution instead of the app's per-video choice; a resolution the video lacks falls back to its highest available (8K included when the stream spoof provides it). Changeable in the headset's Patch settings; Auto keeps the app's own behaviour. | • Default video quality |
| [Extension](#extension) | Injects the extension the other patches run through: its streaming spoof is what removes the pre-roll (ad-free playback) and provides the 8K format support. Turning this patch off restores ads. | • Ad-free streaming spoof (recommended)<br>• Verbose diagnostics (development only)<br>• Force verbose logging (development builds)<br>• Force the native fallback (development only)<br>• Probe identity matrix (~14 requests; needs Verbose diagnostics)<br>• Native formats without SABR (retired experiment)<br>• 8K: accept the AV1 8K HDR tier as SDR (experiment) |
| [Hide ads](#hide-ads) | Hides video ads, including the pre-roll when the streaming spoof is unavailable and the app falls back to its own player response. |  |
| [Install as clone](#install-as-clone) | Installs the patched app as a separate app by default, so it sits alongside the store's YouTube VR instead of replacing it. Replace mode keeps the official package name: the store copy has to be removed to satisfy the signing difference, Horizon OS then treats this build as the YouTube VR app (a restore prompt, and a warning on every reboot), and a store update will collide with it because this build is signed differently. | • Package name<br>• Update permissions<br>• Update providers |
| [QUIC (HTTP/3)](#quic-http-3) | Adds the in-headset switch for QUIC, the transport under HTTP/3: TLS over UDP, used for this app's API and media requests. Leave it on unless playback stalls on a network that blocks or throttles UDP 443 (corporate Wi-Fi, many VPNs), where turning it off forces TCP/TLS. A change applies after the app restarts. | • QUIC (HTTP/3) |
| [Remove viewer discretion dialog](#remove-viewer-discretion-dialog) | Removes the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction. |  |
| [SponsorBlock](#sponsorblock) | Automatically skips SponsorBlock segments (sponsors, self-promos, intros, ...). On by default (sponsors: skip once); configure per-category behaviour below or in the headset's Patch settings screen. | • SponsorBlock API base<br>• Sponsor<br>• Self-promotion<br>• Interaction reminder<br>• Intermission/intro<br>• Outro/endcards<br>• Preview/recap<br>• Hook (padding after intro)<br>• Filler tangent<br>• Music: non-music<br>• Highlight (jump to point) |
| [Spoof app version](#spoof-app-version) | Adds an option to trick the app into thinking you are running a different version; the option ships set to the app's current version, so selecting the patch alone changes nothing. | • Spoofed version name |
| [Spoof package name in User-Agent](#spoof-package-name-in-user-agent) | Adds an option to report a different app package name in the Cronet User-Agent; the option ships set to the original package name, so selecting the patch alone changes nothing. | • Spoofed package name |

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

You also need a **stock YouTube VR 1.89.09 or 1.88.10 APK** as the input; this repository does not ship one, and
the build's first run needs network access to resolve the patcher dependency. The headset-only recipes
(wireless adb, capturing the screen without wearing it) are in [AGENTS.md](AGENTS.md#device-access),
along with one honest caveat: `rea capture-adb-screen` did not work in this environment, so the
screenshots this repository's notes refer to came from plain `adb`.

### 🛠️ Building locally

- Run `./gradlew buildAndroid` — this also runs Spotless, detekt and the JUnit suite in
  `patches/src/test` (the SponsorBlock decision logic, the settings-XML restructure against both
  patcher hosts' layouts, the log gate).
- Before pushing, run the headless patch-run gate against every stock APK in `apk/`:
  `pwsh -NoProfile -File scripts/check-apk.ps1`. It patches each APK with the current bundle
  (no device, no install) and fails on any patch failure or audit finding — this is how a
  fingerprint that no longer matches shows up in minutes instead of at install time.
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

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
