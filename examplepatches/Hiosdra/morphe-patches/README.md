# Hiosdra Patches

Personal, community-maintained patches compatible with Morphe.

## About

This repository is an independent project and is not authored by or affiliated
with the Morphe project. It publishes source code and Morphe patch bundles, not
modified APK files.

Use these patches only with applications you own or are authorized to modify.

The published bundle contains five F1 TV patches, all enabled by default.
The standalone patches adapted from Morphe's universal patches are included
directly in this F1 TV bundle. All five patches applied and the APK rebuilt
successfully for the supported version listed below. The locally generated APK
is unsigned; playback has not been verified on a device.

## Add to Morphe

[Add Hiosdra Patches to Morphe](https://morphe.software/add-source?github=Hiosdra%2Fmorphe-patches)

You can also add the following GitHub URL manually in Morphe's patch source
manager:

```text
https://github.com/Hiosdra/morphe-patches
```

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0](https://github.com/Hiosdra/morphe-patches/releases/tag/v1.6.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 F1 TV&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 3.0.49.4-SP166.4.1-release-R54.2-mobile |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [F1 TV - Background playback](#f1-tv-background-playback) | Keeps Bitmovin playback alive and enables Tiledmedia background audio for F1 TV multiview. |  |
| [F1 TV - Change package name](#f1-tv-change-package-name) | Changes the F1 TV package name to allow installing a separate patched instance. By default ".morphe" is appended to the package name. | • Package name<br>• Update permissions<br>• Update providers |
| [F1 TV - Disable Play Store updates](#f1-tv-disable-play-store-updates) | Disables Play Store updates for the F1 TV package by setting its version code to the maximum allowed. |  |
| [F1 TV - Dismiss forced update prompt](#f1-tv-dismiss-forced-update-prompt) | Allows closing F1 TV's forced-update dialog without exiting the app. |  |
| [F1 TV - Foreground playback service](#f1-tv-foreground-playback-service) | Keeps background F1 TV playback alive with an Android media playback notification and playback/PiP controls. |  |
| [F1 TV - Picture-in-Picture](#f1-tv-picture-in-picture) | Keeps F1 TV playback alive while entering Android Picture-in-Picture mode. |  |

</details>

<details open>
<summary>📦 Movie Paradise&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 5.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Movie Paradise - GmsCore support (microG login)](#movie-paradise-gmscore-support-microg-login) | Routes Google Play Services through microG (MicroG-RE) so Google sign-in works without stock Play Services. |  |
| [Movie Paradise - PairIP license bypass](#movie-paradise-pairip-license-bypass) | Neutralises Google Play integrity/license checks (PairIP) so a repackaged build launches. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Hiosdra%2Fmorphe-patches

Or manually add this repository URL as a patch source in Morphe: https://github.com/Hiosdra/morphe-patches

### 🛠️ Building

To build Hiosdra Patches, follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

The current F1 TV target is `com.formulaone.production` version
`3.0.49.4-SP166.4.1-release-R54.2-mobile` (versionCode `30494002`).

## 📜 License

Hiosdra Patches is licensed under the [GNU General Public License v3.0](LICENSE).
