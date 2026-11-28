# Gearhead Patches

Patches for **Android Auto**, for use with [Morphe](https://morphe.software).

Gearhead Patches is an independent project. It is not made by or affiliated with Morphe or Google.

## ❓ About

Android Auto only shows car apps that were installed by the Google Play Store. Sideloaded apps
(CarStream, Fermata Auto, screen mirroring apps, your own builds) stay hidden unless you install
them through a special installer, turn on Android Auto developer settings and tick
"Unknown sources".

These patches remove that step. A patched Android Auto treats every app as installed from Google
Play, so any properly built Android Auto app shows up in the car launcher straight away.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager as a patch source:
https://github.com/ccloud-admin/gearhead-patches

<a href="https://morphe.software/add-source?github=ccloud-admin/gearhead-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

### Rooted phones: use Root mount mode

Android Auto comes preinstalled as a system app on most phones and talks to Google Play services,
which expect Google's signature. Patch it in **Root mount mode** (Morphe Manager asks for the
patch mode on rooted phones). The patched APK is then mounted over the stock app and keeps
Google's signature, so the car connection is unaffected.

### Non-rooted phones: untested

Without root, the patched Android Auto is re-signed with a new key. It must replace the stock
app, which on many phones means uninstalling its updates and disabling it first. It is **not yet
known** whether a re-signed Android Auto can still connect to a car. Reports either way are
welcome in the issues.

### What these patches do not do

- They do not make ordinary phone apps run on the car screen. An app still has to be built for
  Android Auto (car app library, media service, or similar).
- They do not remove driving restrictions. Video and mirroring apps still follow Android Auto's
  rules while the car is moving.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ccloud-admin/gearhead-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Android Auto&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.google.android.projection.gearhead`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow apps from any installer](#allow-apps-from-any-installer) | Makes Android Auto treat every app as installed from the Google Play Store, so sideloaded Android Auto apps show up in the car launcher without an installer app, developer settings or the "Unknown sources" setting. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development

- **Make all changes to the `dev` branch.** Releases are created by `release.yml` from semantic
  commit messages (`feat:`, `fix:`, `chore:`). Do not create releases by hand.
- Build locally with `./gradlew buildAndroid`. The bundle is written to
  `patches/build/libs/patches-*.mpp` and can be applied with
  [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).
- Building needs a GitHub personal access token with `read:packages`, set as `gpr.user` and
  `gpr.key` in `~/.gradle/gradle.properties`
  ([setup guide](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/2_1_setup.md#-prepare-the-environment)).
- Test without a car using Google's Desktop Head Unit (DHU) from the Android SDK.

### How the installer patch works

Android Auto asks Android who installed each app, through
`InstallSourceInfo.getInitiatingPackageName()` (Android 11+) and
`PackageManager.getInstallerPackageName()` (older). The patch finds every call to those methods
in Android Auto's code and sends it to `app.gearhead.extension.InstallerSpoof`, which answers
`com.android.vending` (the Play Store). It uses no fingerprints, so it should keep working across
Android Auto updates unless Google changes which API it uses.

The approach comes from the
[Android Auto XLauncher Unlocked](https://github.com/Rikj000/Android-Auto-XLauncher-Unlocked)
Xposed module (GPLv3), here done as a bytecode patch so no Xposed is needed.

## 📜 License

Gearhead Patches are licensed under the [GNU General Public License v3.0](LICENSE), with the
additional terms in [NOTICE](NOTICE). This project is based on the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
