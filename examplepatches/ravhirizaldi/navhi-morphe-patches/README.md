# 🧩 Navhi Patches

Morphe patches for apps I use daily. Each app gets its own section and its own
version targets — nothing here is generic.

Currently: **GreatDay HR** (`com.dataon.sunfishgo`).

## ➕ Add to Morphe

**One tap** (open on the phone that runs Morphe Manager):
[**Add to Morphe**](https://morphe.software/add-source?github=ravhirizaldi/navhi-morphe-patches)

**Manually:** Morphe Manager → patch sources **+** → **Remote** → paste
`https://github.com/ravhirizaldi/navhi-morphe-patches`

Patched builds are signed with a different key, so uninstall the store version
first. App data is wiped by that switch — back up anything local before you do it.

> GPLv3 · Not affiliated with any vendor listed here. Patches target only the
> versions below; the app's own server-side checks stay in place.

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://github.com/rawhirizaldi/navhi-morphe-patches/releases/tag/v1.0.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 GreatDay HR&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**Package name:** `com.dataon.sunfishgo`

**🎯 Supported versions:**

| 7.54.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide developer options and emulator](#hide-developer-options-and-emulator) | Developer options and emulators no longer block attendance. |  |
| [Hide fake GPS apps](#hide-fake-gps-apps) | The app stops listing the fake-GPS apps on the phone and reports location as not mocked. |  |
| [Hide root](#hide-root) | Attendance no longer fails on a rooted phone. |  |
| [Keep the saved point in the app](#keep-the-saved-point-in-the-app) | The map, the attendance form and the background service all get your saved point instead of the real fix. |  |
| [Morphe Settings screen](#morphe-settings-screen) | Declares the Morphe Settings screen that the menu entry opens. |  |
| [Show Morphe Settings in the menu](#show-morphe-settings-in-the-menu) | Adds the pin map, the detection switches and the about section behind a menu entry. |  |
| [Skip signature check](#skip-signature-check) | The modified app starts normally instead of quitting with a "changed by another party" warning. |  |
| [Use your own location](#use-your-own-location) | Makes the app read your saved point for every location request and turns the background tracker off. |  |

</details>

<!-- PATCHES_END -->

### ⚙️ Morphe Settings

Open the overflow menu on the location screen and tap **Morphe Settings**. There you
set the point you want to clock in from: pan the map, tap to drop the pin, **Save**.
The saved point is used for every location read afterwards and survives restarts —
change it whenever, or tap **Use real GPS** to go back to the phone's fix. The app's
own map screen never asks you to pick anything.

The same screen holds the three detection switches (fake GPS, developer options,
emulator — all off by default) and a short about section.

## 🚀 Releasing

GitHub Actions is dead on this account (billing), so releases are manual:

```bash
GITHUB_ACTOR=ravhirizaldi ./release.sh patch     # 1.0.1 -> 1.0.2
```

It bumps `gradle.properties`, rebuilds, regenerates `patches-list.json` and
`patches-bundle.json`, commits, tags, pushes and publishes the release with the
bundle attached. Merge the branch into `main` afterwards — Morphe Manager reads
the source from `main`.

## 🛠️ Building

```bash
GITHUB_ACTOR=<you> GITHUB_TOKEN=<token with read:packages> ./gradlew buildAndroid
```

The bundle lands in `patches/build/libs/patches-*.mpp` and is applied with
[Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager.
A GitHub token is required because the Morphe Gradle plugin resolves from GitHub
Packages, which authenticates even for public artefacts.

## 📜 License

GPLv3. Patches are original work; the patched apps are not included.
