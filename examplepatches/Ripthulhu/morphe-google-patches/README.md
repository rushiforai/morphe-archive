# Google Feed Ads Patches

Experimental Morphe patch bundle for the Google app.

## ❓ About

This repository contains a prototype patch that hooks Google Discover stream
subtree creation and filters likely feed ad nodes before they reach the UI.

It also includes a standalone-install patch that changes the package identity to
`app.ripthulhu.googlequicksearchbox` and labels the launcher entry `Google
Morphe`, allowing the patched APK to be installed beside the system Google app.

The first build is intentionally diagnostic: it logs compact samples of early
Discover nodes to `logcat` under `GoogleFeedAdsPatch`, which is needed to tune
the ad detector against real feed payloads.

## 📲 Add To Morphe

Click this link on your Android device:

https://morphe.software/add-source?github=Ripthulhu/morphe-google-patches

Or manually add this repository URL as a patch source in Morphe:

https://github.com/Ripthulhu/morphe-google-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.4](https://github.com/Ripthulhu/morphe-google-patches/releases/tag/v1.1.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Google&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 17.34.30.ve.arm64 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Install as standalone app](#install-as-standalone-app) | Changes the Google app package identity so the patched APK can be installed beside the system Google app. | • Package name<br>• App name |
| [Remove Discover feed ads](#remove-discover-feed-ads) | Filters likely ad nodes from the Google app Discover feed. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building

Build with:

```bash
./gradlew buildAndroid
```

GitHub Actions publishes the `.mpp` bundle and updates `patches-bundle.json`
when commits are pushed to `main` or `dev`. If dependency resolution fails for
the Morphe Gradle plugin, add a repository secret named
`MORPHE_GITHUB_PACKAGES_TOKEN` with `read:packages` access for GitHub Packages.

## 📜 License

Google Feed Ads Patches are licensed under the [GNU General Public License v3.0](LICENSE)
