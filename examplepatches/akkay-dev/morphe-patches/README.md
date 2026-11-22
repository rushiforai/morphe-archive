# 👋🧩 Akkay Patches

<p align="center">
  <a href="https://github.com/akkay-dev/morphe-patches/releases"><img src="https://img.shields.io/github/v/release/akkay-dev/morphe-patches?include_prereleases&style=for-the-badge" alt="GitHub Release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/akkay-dev/morphe-patches?style=for-the-badge" alt="License"></a>
  <a href="https://github.com/akkay-dev/morphe-patches/stargazers"><img src="https://img.shields.io/github/stars/akkay-dev/morphe-patches?style=for-the-badge" alt="GitHub Stars"></a>
  <a href="https://github.com/akkay-dev/morphe-patches/network/members"><img src="https://img.shields.io/github/forks/akkay-dev/morphe-patches?style=for-the-badge" alt="GitHub Forks"></a>
  <a href="https://github.com/akkay-dev/morphe-patches/issues"><img src="https://img.shields.io/github/issues/akkay-dev/morphe-patches?style=for-the-badge" alt="GitHub Issues"></a>
</p>

> [!NOTE]
> This is an independent community patch collection maintained by [akkay-dev](https://github.com/akkay-dev) for use with [Morphe](https://morphe.software). It is not affiliated with or authored by the official Morphe project.

## 📖 Contents

- [How to use these patches](#-how-to-use-these-patches)
- [Patches list](#-patches-list)
- [Issues & bug reports](#-issues--bug-reports)
- [FAQ](#-faq)
- [Building locally](#️-building-locally)
- [Disclaimer](#️-disclaimer)
- [Credits & License](#️-credits)

## 📲 How to use these patches

Click the button below to add this source directly to **Morphe Manager**, or manually add `https://github.com/akkay-dev/morphe-patches`:

<a href="https://morphe.software/add-source?github=akkay-dev/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/akkay-dev/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 AdGuard&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.adguard.android`

**🎯 Supported versions:**

| 4.17.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Lifetime Premium](#unlock-lifetime-premium) | Unlocks AdGuard Lifetime Premium license status across all features without contacting the license backend. |  |

</details>

<details open>
<summary>📦 Battery Guru&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.paget96.batteryguru`

**🎯 Supported versions:**

| 2.5.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks premium subscription features and automatically disables advertisements. |  |

</details>

<details open>
<summary>📦 ES File Explorer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.estrongs.android.pop`

**🎯 Supported versions:**

| 4.4.3.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VIP & Remove Ads](#unlock-vip-remove-ads) | Unlocks all VIP features (duplicate file cleaner, multi-window, cloud backup) and suppresses advertisements and purchase prompts. |  |

</details>

<!-- PATCHES_END -->

## 📬 Issues & bug reports

Found a broken patch or have a request? Open an issue using one of the templates below:

- [🐞 Bug report](https://github.com/akkay-dev/morphe-patches/issues/new?template=bug_report.yml)
- [⭐ Feature / app request](https://github.com/akkay-dev/morphe-patches/issues/new?template=feature_request.yml)

Before opening an issue, please search existing issues first and include the target app package name, exact app version, APK/APKM source format, and the `Akkay Patches` release version used.

## ❓ FAQ

### Which APK version or format should I download?
Always prefer the exact verified version and container format (`APK` or `APKM`) listed under **Supported versions** in the [patches list](#-patches-list) from a clean source such as APKMirror or Uptodown (`arm64-v8a` recommended for modern devices). Avoid pre-modded or repacked APKs.

### Why doesn't Google Sign-In work in a patched app?
Re-signing an Android app changes its certificate signature, which causes Google Play Services to reject OAuth/Google login unless the app supports MicroG or alternative sign-in methods (such as email/password).

### How do I receive `dev` pre-release updates?
Enable **Pre-release** in your Morphe Manager patch source settings for `akkay-dev/morphe-patches`, or stay on the default channel for stable `main` releases.

## 🛠️ Building locally

1. Authenticate with GitHub Packages (`read:packages` scope) in `~/.gradle/gradle.properties` (`gpr.user` and `gpr.key`).
2. Run `./gradlew buildAndroid` (JDK 21 recommended).
3. Locate the compiled `.mpp` bundle in `patches/build/libs/patches-*.mpp`.
4. Apply the bundle with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for full setup details.

## ⚠️ Disclaimer

> **Legal Notice**
>
> This repository is provided strictly for **educational and research purposes**.
> - This project is **not affiliated** with any of the third-party application developers listed above, nor with the official Morphe project.
> - Use these patches **at your own risk**. The author assumes no responsibility for account bans, data loss, or other consequences.
> - Users are encouraged to **support app developers** by purchasing legitimate subscriptions if they find the applications useful.
> - If you are a rights holder or developer with concerns regarding a patch, please [open an issue](https://github.com/akkay-dev/morphe-patches/issues) and it will be reviewed promptly.

## ❤️ Credits

- [Morphe](https://github.com/MorpheApp) & [Morphe Patches Template](https://github.com/MorpheApp/morphe-patches-template)
- [ReVanced](https://github.com/ReVanced)
- Everyone who tests patches and reports issues

## 📜 License

Akkay Patches are licensed under the [GNU General Public License v3.0](LICENSE) — see [NOTICE](NOTICE) for additional terms under GPLv3 Section 7.
