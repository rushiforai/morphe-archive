<p align="center">
  <a href="https://morphe.software/add-source?github=Ayufa/ayufa-patches">
    <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
  </a>
</p>

# 🧩 Ayufa Patches

<p align="center">

![GitHub Release](https://img.shields.io/github/v/release/Ayufa/ayufa-patches?include_prereleases&style=for-the-badge)
![License](https://img.shields.io/github/license/Ayufa/ayufa-patches?style=for-the-badge)
![GitHub Stars](https://img.shields.io/github/stars/Ayufa/ayufa-patches?style=for-the-badge)
![GitHub Forks](https://img.shields.io/github/forks/Ayufa/ayufa-patches?style=for-the-badge)
![GitHub Issues](https://img.shields.io/github/issues/Ayufa/ayufa-patches?style=for-the-badge)

</p>

[日本語](README.md) | English

> [!NOTE]
>
> A personal collection of custom patches for Morphe. These are not official Morphe patches.

## Contents

- [About](#-about)
- [How to use](#how-to-use)
- [Patch details](#patch-details)
- [Patches list](#-patches-list)
- [Reporting bugs](#reporting-bugs)
- [FAQ](#faq)
- [Relationship with upstream](#relationship-with-upstream)
- [Building](#️-building)
- [License](#-license)

## ❓ About

<details>
<summary>Overview</summary>

This collection adds the small things the official patches ([MorpheApp/morphe-patches](https://github.com/MorpheApp/morphe-patches)) left unsatisfied, plus features I wanted myself.

| App | Supported versions | Patches |
|---|---|---|
| Simeji | 20.7 | 11 |
| Yahoo! Transit | 8.5.8 | 2 |

</details>

## ⚠️ Disclaimer

This is a personal hobby project. The patches are tested in my own environment, but there is no guarantee they work everywhere. Check carefully before using them on an important device.

## How to use

Use the button above to add this repository as a patch source in Morphe, then select the patches you want and apply them (the patches in this repository are all you need).

⚠️ **Match the target versions exactly** (each patch is verified per version, and cannot be applied to other versions).

- All Simeji patches → **20.7** (do not apply them to 23.7)

## Patch details

### ⌨️ Simeji

<details>
<summary>Simeji patch details</summary>

All patches target Simeji **20.7**. Every patch can be toggled in the in-app "Ayufaパッチ設定" screen without re-patching.

| Patch | What it does |
|---|---|
| 広告を非表示 | Removes ads in the suggestion bar, full-screen store-entry ads and web campaign popups. Rewarded ads are blocked too (features unlocked by watching ads stop working) |
| プロモーションを非表示 | Prevents full-screen campaign / upsell activities from opening |
| VIP案内画面をブロック | Prevents the VIP guide screen from opening. This screen doubles as the in-app subscription purchase screen, so while it is blocked you cannot subscribe from inside the app |
| プッシュポップアップを無効化 | Stops dialog-style push campaign popups (normal notifications are not affected) |
| 解約時の引き止め画面をスキップ | Skips the retention screen shown when cancelling VIP and goes straight to the cancellation flow |
| 解析レポートを無効化 | Stops event sending to AppsFlyer and Simeji's own statistic reporting. Core features (keyboard, conversion, sync) are not touched |
| ポイント入口を非表示 | Hides the entry points to the point store and campaigns |
| レビュー依頼を無効化 | Stops the Google Play rating prompts (both Simeji's own dialog and the Play in-app review flow) |
| AIアシスタントのアイコンを非表示 | Hides the robot (AI assistant) icon at the top right of the keyboard and its speech-bubble messages. The top strip the icon lived in is collapsed too, so no empty band remains. Input and conversion are not affected |
| VIPを偽装 | Turns on only the on-device VIP checks. Features that complete entirely on the device, such as toolbar customization and VIP parts in custom skins, become usable (off by default) |
| アプリ内設定画面を追加 | Adds an "Ayufaパッチ設定" entry at the bottom of Simeji's Settings tab. This patch is required to toggle the other Simeji patches |

#### Simeji notes

- **Where the settings are**: with 「アプリ内設定画面を追加」 applied, "Ayufaパッチ設定" appears at the very bottom of the **Settings** tab in the Simeji app. Defaults: everything on, except 「VIPを偽装」
- **Google account sign-in does not work**: a re-signed app cannot pass Google Sign-In's signature check (package name + certificate), and this cannot be worked around with a patch. Signing in with a Baidu account ID/password is not affected
- **Limits of VIP spoofing**: VIP perks managed on the server (cloud skins, backup, translation, AI quota, etc.) remain unavailable even with spoofing

</details>

### 🚃 Yahoo! Transit

<details>
<summary>Yahoo! Transit patch details</summary>

All of these target Yahoo! Transit **8.5.8**.

| Patch | What it does |
|---|---|
| 広告を非表示 | Removes the per-screen banner/native ads and the full-screen overlay ads |
| プロモーションを非表示 | Stops the LY linkage promotion modal from appearing |

#### Yahoo! Transit notes

- **There is no premium system**: the app is fully free, so there is nothing to unlock
- Video ads are not covered
- The app is distributed as split APKs

</details>

## 🩹 Patches list

See the patch list in the [Japanese README](README.md#-パッチ一覧) (auto-generated from the latest release).

## Reporting bugs

Please open an issue in this repository, with as much of the following as you can:

- The app version
- The patch source release you used (e.g. `stable v1.2.0` / `dev v1.3.0-dev.9`)
- The APK source and format (e.g. a single APK from APKMirror, an XAPK)
- Logs, if you can capture them

Bugs in the official patches themselves cannot be fixed here.

## FAQ

<details>
<summary>Why can't I log in with my Google account?</summary>

A re-signed app cannot pass Google Sign-In's signature check (package name + certificate). This cannot be worked around with a patch. Signing in with a Baidu account ID/password is not affected.

</details>

<details>
<summary>Can I apply the patches to other app versions?</summary>

No. Each patch is verified per version, so please use the exact target version's APK.

</details>

<details>
<summary>Does turning on the VIP spoofing patch unlock all VIP perks?</summary>

No. Only features that complete entirely on the device (toolbar customization, VIP parts in custom skins, and the like). Perks managed on the server — cloud skins, backup, translation, AI quota — remain unavailable.

</details>

<details>
<summary>Where are the Simeji settings?</summary>

With 「アプリ内設定画面を追加」 applied, "Ayufaパッチ設定" appears at the very bottom of the **Settings** tab in the Simeji app. That is where each patch is toggled on and off.

</details>

<details>
<summary>Do I use these together with the official patches?</summary>

The Simeji patches work on their own (upstream has no Simeji patches).

</details>

## Relationship with upstream

- No pull requests, issues or comments are ever sent to the upstream repository. It is used read-only
- Licensing and credits follow upstream (GPL-3.0)

### How upstream updates are tracked

- Dependabot periodically reports dependency updates (such as the patcher) from upstream
- See [How upstream is tracked](docs/UPSTREAM.md) for details
- Releases are unsigned (no signing key is configured)

## 🛠️ Building

- Run `./gradlew buildAndroid` and the `.mpp` file is produced under `patches/build/libs/`
- The resulting file can be used with Morphe Desktop, like any other patch bundle
- Development happens on the `dev` branch; merging into `main` creates a stable release

## ❤️ Donate

Donations are completely optional. Using the patches and reporting bugs is already the best support.

If you would like to support development, you can do so through GitHub Sponsors.

- [GitHub Sponsors](https://github.com/sponsors/Ayufa)

## ❤️ Credits

- [Morphe](https://github.com/MorpheApp/)
- Based on the official [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template)

## 📜 License

GPL-3.0 ([LICENSE](LICENSE)). See also [NOTICE](NOTICE).
