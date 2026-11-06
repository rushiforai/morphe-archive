<!-- docs/ holds the GitHub Pages site: a dark editorial page in the same design
     system as xiondigital.net (assets/css/xion.css), with the patch collection as
     its only subject. Edit docs/index.html and docs/style.css; the logo lives at
     docs/assets/xion-morphe-patches.png and is used here and in the site header.

     Styling based on xiondigital.net (assets/css/xion.css):
     Dark editorial palette: bg #050607, panel #0c0e11 / #101318,
     ink #ecedef, body #bdc3cc, muted #8b9099,
     accent blue #3f80ff, blue-hi #79a8ff.
     Type on the site: Sora (display/body), Instrument Serif (italic accents),
     JetBrains Mono (eyebrow/labels). GitHub READMEs cannot load external
     fonts or site CSS, so this translates those cues into GitHub-safe
     elements: centred header, mono eyebrow, italic tagline, and blue badges. -->

<div align="center">

`MORPHE PATCHES — XIONDIGITAL`

<img src="docs/assets/xion-morphe-patches.png" alt="XiØN Morphe Patches" width="440">

*Independent Android patches and adaptations for [Morphe](https://morphe.software).*

[![Morphe](https://img.shields.io/badge/Morphe-3f80ff?style=flat-square)](https://morphe.software)
[![Release: v1.1.0](https://img.shields.io/badge/Release-v1.1.0-79a8ff?style=flat-square)](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.1.0)
[![Site](https://img.shields.io/badge/Site-Morphe%20Patches-0c0e11?style=flat-square)](https://xiondigital.net/MorphePatches/)

<a href="#patches">01 / Patches</a> &nbsp; / &nbsp;
<a href="#releases">02 / Releases</a> &nbsp; / &nbsp;
<a href="#requests-and-issues">03 / Requests</a> &nbsp; / &nbsp;
<a href="https://xiondigital.net/MorphePatches/">Site ↗</a>

</div>

<br />

<table>
<tr>
<td width="65%" valign="top">

### What ships here

Five working patches for **Tandem: Language exchange** 6.38.0, written against Morphe's patch API and
shipped as a prebuilt bundle. Each one is a real change to Tandem's own dex, documented down to the
method it anchors on and the exact code it injects.

Version `v1.1.0` carries the bundle that was applied to the APKMirror 6.38.0 APKM: all five patches
run, and both the patched dex and the patched manifest were decompiled to confirm the result. Its new
**Clone package** patch gives the patched build its own application id, so it installs beside the
official Tandem app instead of replacing it — and no longer collides with it on provider authorities,
the signature permission or Tandem's own call-control broadcasts.

</td>
<td width="35%" valign="top">

### Release status

**v1.1.0** — 2026-11-04

5 patches · `net.tandem` 6.38.0 · APK + APKM

Applies to the stock APKM; device test 2026-11-04: installs, blocked at launch by Tandem's licence gate

[Downloads ↗](https://github.com/XiONDiGiTaL/MorphePatches/releases/latest)

</td>
</tr>
</table>

<br />

<a id="patches"></a>

## 01 / Morphe Patches

| App | Package | Patches |
| --- | --- | --- |
| [Tandem](Tandem/README.md) | `net.tandem` | [Bypass PairIP checks](Tandem/README.md#bypass-pairip-checks) · [Force dark mode](Tandem/README.md#force-dark-mode) · [Remove ads](Tandem/README.md#remove-ads) · [Disable Adjust tracking](Tandem/README.md#disable-adjust-tracking) · [Clone package](Tandem/README.md#clone-package) (opt-in) — 6.38.0 only |

Two copies of the same bundle — take either:

| Where | File | Size | SHA-256 |
| :--- | :--- | ---: | :--- |
| [Release `v1.1.0`](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.1.0) | `patches-1.1.0.mpp` | 74,124 B | `0034159ee9a8ba74d7f540f2ca48f5c57cf4d805f68639da575d991e1f5f2af9` |
| This repository | [`Tandem/patches.mpp`](Tandem/patches.mpp) | 74,124 B | `0034159ee9a8ba74d7f540f2ca48f5c57cf4d805f68639da575d991e1f5f2af9` |

Both files are the same build, so either download matches that single hash. The bundle declares
`Patcher-Version: 2.1.0`. Import it in Morphe Manager, or patch your stock Tandem 6.38.0 file with it
directly.

Supported: Tandem `6.38.0` (versionCode 11568), APKM bundle or single APK, minSdk 32. Any other
version is refused by the bundle instead of being patched blindly. The bundle was applied to the
APKMirror 6.38.0 APKM — all five patches complete — and the patched dex and manifest were decompiled to
confirm each change. The first device test (2026-11-04) installs the clone beside the official app but
Tandem's licence gate sends the user to Google Play and the process dies before its UI — the full status
is in [Tandem/README.md](Tandem/README.md#testing-status) and
[Tandem/DEVICE-TEST.md](Tandem/DEVICE-TEST.md).

### Companion app — Tandem Study

The learning features a patch cannot add ship as a separate offline app in
[`companion/`](companion/README.md): it imports the archive from Tandem's own
**Profile → Settings → Download my data** and builds a vocabulary list, conversation statistics,
search and spaced-repetition review with reminders. It has no `INTERNET` permission and does not
touch Tandem itself.

<p>
<img src="companion/screenshots/words.png" alt="Word list built from the export" width="215">
<img src="companion/screenshots/stats.png" alt="Message counts, activity and most used words" width="215">
<img src="companion/screenshots/review.png" alt="Vocabulary review and reminders" width="215">
</p>

See [Tandem/README.md](Tandem/README.md#companion-app-tandem-study) for the full set and
[`companion/README.md`](companion/README.md) for how the import works and what it deliberately does
not do.

### Generated patch list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.1](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.1.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Tandem: Language exchange&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `net.tandem`

**🎯 Supported versions:**

| 6.38.0 | 6.12.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass PairIP checks](#bypass-pairip-checks) | Skips PairIP's APK signature and Play licence checks, which otherwise stop a re-signed build from starting. Required for any patched Tandem build to run. |  |
| [Clone package](#clone-package) | Installs the patched build under its own application id (app.xiondigital.tandem by default), so it can sit next to the official Tandem app instead of replacing and conflicting with it. Off by default: a clone starts empty, and Google/Facebook sign-in, push tokens, Play purchases and verified App Links stay bound to the original package. | • Package name |
| [Disable Adjust tracking](#disable-adjust-tracking) | Stops the bundled Adjust attribution SDK from initialising, so no install, session or event attribution is sent. |  |
| [Force dark mode](#force-dark-mode) | Turns on Tandem's own dark theme, regardless of the system dark-mode setting. |  |
| [Remove ads](#remove-ads) | Removes Tandem's community ad slot and blocks the bundled AppLovin MAX and Meta Audience Network SDKs from requesting ads. |  |

</details>

<!-- PATCHES_END -->

### How to use these patches

Add this repository as a Morphe source once and the patches show up inside the app, at the version in
the release table below:

```
https://morphe.software/add-source?github=XiONDiGiTaL/MorphePatches
```

Or import a file directly: download either bundle above, open it in Morphe Manager, select your Tandem
6.38.0 APK or APKM, keep **Bypass PairIP checks** enabled, and patch. Nothing needs to be built
locally — the `.mpp` in this repo is the finished artifact.

<a href="https://morphe.software/add-source?github=XiONDiGiTaL/MorphePatches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Build the bundle locally with `./gradlew :patches:buildAndroid` — the
`.mpp` file is created at `patches/build/libs/patches-*.mpp`.

<br />

<a id="releases"></a>

## 02 / Releases

| Release | Date | Bundle | Contents |
| :--- | :--- | :--- | :--- |
| [`v1.1.0`](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.1.0) | 2026-11-04 | [`patches-1.1.0.mpp`](https://github.com/XiONDiGiTaL/MorphePatches/releases/download/v1.1.0/patches-1.1.0.mpp) | Adds **Clone package**: the patched build installs under `app.xiondigital.tandem` beside the official app, with the signature permission, all nine provider authorities, WXEntryActivity's task affinity and ten dex literals renamed to match. Opt-in; the other four patches are unchanged |
| [`v1.0.2`](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.0.2) | 2026-11-04 | [`patches-1.0.2.mpp`](https://github.com/XiONDiGiTaL/MorphePatches/releases/download/v1.0.2/patches-1.0.2.mpp) | The four original Tandem patches plus the offline companion app. Empties PairIP's licence paywall, error dialog and delayed shutdown, so a patched build is no longer sent to Google Play at launch |
| [`v1.0.1`](https://github.com/XiONDiGiTaL/MorphePatches/releases/tag/v1.0.1) | 2026-11-03 | [`patches-1.0.1.mpp`](https://github.com/XiONDiGiTaL/MorphePatches/releases/download/v1.0.1/patches-1.0.1.mpp) | Superseded: applied cleanly, but only emptied PairIP's two checks, so the licence screen could still open. Use `v1.1.0` |
| `v1.0.0` | 2026-11-01 | — | Retired: built before the patch-time fixes, so patching aborted. Use `v1.1.0` |

Releases are automated. Every push to `main` runs semantic-release, which tags the next version,
attaches the freshly built `.mpp`, regenerates `patches-list.json` and `patches-bundle.json`, and
rewrites the patch table above. `patches-list.json` is the file the Morphe add-source link reads, so a
tagged release is what makes these patches appear in the app. The release number it tags comes from the
commit prefix in `main`'s history — `feat` → minor, `fix` → patch, `chore`/`docs` → no release — so the
prefix decides whether a change ships as 1.0.x or 1.1.0.

Only patch bundles are distributed here. Original and prepatched proprietary application packages are not.

<details>
<summary>Patch status guide</summary>

| Status | Meaning |
| :--- | :--- |
| Experimental | Applies cleanly to the stock 6.38.0 APK; not yet confirmed on a device |
| Tested | Confirmed on a device, with the app version and setup recorded |
| Released | Included in a published bundle |

All five Tandem patches are **Experimental** in `v1.1.0`. The 2026-11-04 device test did not get past
launch — see [Tandem/DEVICE-TEST.md](Tandem/DEVICE-TEST.md) — so none of them qualify as Tested.

</details>

<br />

<a id="requests-and-issues"></a>

## 03 / Requests and issues

[Suggest a patch or report an issue ↗](https://github.com/XiONDiGiTaL/MorphePatches/issues)

When reporting a bug, include the Tandem version, the bundle version (`v1.1.0`), which patches were selected, your Android version, and reproduction steps. Remove personal information and credentials from logs.

<br />

## Frequently Asked Questions

#### How do I use this?

Add `XiONDiGiTaL/MorphePatches` as a source in Morphe Manager and it lists all five patches, or import
[`Tandem/patches.mpp`](Tandem/patches.mpp) directly. Then patch a stock Tandem 6.38.0 file, keeping
**Bypass PairIP checks** enabled — a re-signed build will not start without it. Turn on **Clone
package** if you want the patched app to install next to the official one instead of replacing it.

#### What APK version should I use?

Tandem **6.38.0** (versionCode 11568), APKM bundle or single APK. The bundle declares only that
version, so Morphe refuses anything else. No other app is covered yet.

#### Are the patches tested?

They have been applied to the real 6.38.0 files: the bundle runs against the APKMirror APKM, all five
patches complete, the patched dex decompiles to the expected bodies, and with **Clone package** enabled
the installed id, provider authorities and task affinity are renamed as documented. It has also been run
on hardware: the clone installs as its own app, but Tandem's licence gate opens Google Play and kills
the process before the UI, which is why every patch stays experimental — see
[Tandem/DEVICE-TEST.md](Tandem/DEVICE-TEST.md).

#### Can you make a patch for another app?

Suggest it through Issues. Requests do not guarantee implementation or compatibility.

<br />

## 04 / Notice

An independent project by XiONDiGiTaL, not affiliated with, endorsed by, or sponsored by any third-party entity or project referenced here.

Original patches and adaptations are offered freely. Third-party applications, names, trademarks, assets, and other works belong to their respective owners. References identify compatibility targets or provide attribution; no ownership or endorsement is implied.

This project is intended to share independent modifications, not redistribute proprietary works or misrepresent authorship. Incorporated third-party work must retain its applicable licenses, notices, and credits. No repository-wide software license has been selected yet.

[Morphe ↗](https://morphe.software) &nbsp; / &nbsp; [Upstream patches ↗](https://github.com/MorpheApp/morphe-patches) &nbsp; / &nbsp; [Patch template ↗](https://github.com/MorpheApp/morphe-patches-template)

---

<div align="center">

---

<a href="https://xiondigital.net/MorphePatches/">XiØN · Morphe Patches ↗</a>

<sub>Independent patch collection — <a href="https://xiondigital.net">XiONDiGiTaL</a></sub>

</div>
