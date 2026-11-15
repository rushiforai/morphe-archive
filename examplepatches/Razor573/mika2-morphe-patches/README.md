# Mika 2 Patches

A single no-op patch for Mika 2, for use with Morphe Manager.

## About

Morphe Manager only offers to install an APK when a patch source lists a patch compatible with it. Mika 2 has no patch, so Morphe Manager shows "No patches available" and refuses to install it. This repo provides one patch, "Mika 2 installer", which changes nothing in the app, so Morphe Manager can install Mika 2 with Morphe as the installer of record.

The patch does nothing: no fingerprints, no bytecode changes, no extension, no manifest or permission changes, no installer spoofing, no signature spoofing, no network calls. The only change on install is what Morphe itself does to every app it installs: it re-signs the APK with a key it makes on the phone.

Because the signature changes, a Morphe install cannot update over an existing Mika 2 install. Export first with Mika 2 v48 (Settings > My data > Backup & data), then uninstall, then install via Morphe, then import the ZIP. Whether this helps with banking apps is unproven and must be tested live.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/Razor573/mika2-morphe-patches

<a href="https://morphe.software/add-source?github=Razor573/mika2-morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Razor573/mika2-morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 Mika 2&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.wangzan101.mika2`

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Mika 2 installer](#mika-2-installer) | No-op patch so Morphe Manager can install Mika 2. Changes nothing in the app. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Mika 2 Patches are licensed under the [GNU General Public License v3.0](LICENSE)
