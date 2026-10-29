<div align="center">

# 🧩 Michii Patches

**Patches that make your apps cleaner and calmer.** Fewer ads, less clutter, and the features the apps are missing.

[![Latest release](https://img.shields.io/github/v/release/heyymichii/michii-patches?style=for-the-badge&label=release&color=0a66c2)](https://github.com/heyymichii/michii-patches/releases/latest)
[![License](https://img.shields.io/github/license/heyymichii/michii-patches?style=for-the-badge&color=2dbcb1)](LICENSE)
[![Translate on Crowdin](https://img.shields.io/badge/translate-Crowdin-263238?style=for-the-badge&logo=crowdin&logoColor=white)](https://crowdin.com/project/michii-patches)

**[➕ Add to Morphe](https://morphe.software/add-source?github=heyymichii/michii-patches)** ·
**[📣 Announcements](https://github.com/heyymichii/michii-patches/discussions/categories/announcements)** ·
**[💬 Discussions](https://github.com/heyymichii/michii-patches/discussions)** ·
**[🌐 Translate](https://crowdin.com/project/michii-patches)** ·
**[🐛 Report a bug](https://github.com/heyymichii/michii-patches/issues/new/choose)** ·
**[💖 Support](#-support)**

</div>

---

## 🚀 Getting started

1. Install [Morphe Manager](https://morphe.software).
2. **[Add the Michii Patches source](https://morphe.software/add-source?github=heyymichii/michii-patches)**.
3. Pick an app from the [patches list](#-patches-list), patch the version Morphe Manager recommends, and install it.

Every patched app gets its own **Michii Patches** settings screen, where you turn each feature on or off, search,
back up and restore your settings, check for updates, and copy a diagnostic report, in 11 languages. To open it:

- **LinkedIn:** tap your profile photo to open the **"Me" panel → Michii Patches**, or long press the app icon.

> [!IMPORTANT]
> Please don't share patched APKs. Share this patch source instead, so everyone gets the latest fixes.

<details>
<summary><b>❓ FAQ</b></summary>

<br>

**Which APK should I download?**
The version Morphe Manager recommends (the newest one in the patches list). Other versions are marked experimental
and may not work. **LinkedIn:** use the APKMirror variant *Android 10+*, the APK, not the bundle.

**I can't find the Michii Patches settings.**
App icon shortcuts are added after the app has been opened once, and some launchers don't show them, so use the
in-app entry when there is one. If it's missing too, check that your app version is supported and send a diagnostic
report.

**LinkedIn: I can't sign in with Google.**
Google checks the app's signature, so sign-in with Google needs the **GmsCore support** patch and
[microG RE](https://github.com/MorpheApp/microg-RE) installed and signed in to your Google account. You can also sign in
with your e-mail and password. If you signed up with Google and don't have a password, set one first on
[linkedin.com](https://www.linkedin.com/checkpoint/rp/request-password-reset) ("Forgot password").

**LinkedIn: Material You or AMOLED black doesn't change some screens.**
Restart LinkedIn after changing them. A few older screens keep the colors chosen when patching.

</details>

## 🐛 Reporting a bug

In the app's **Michii Patches** settings, turn on **Other → Diagnostic logging**, reproduce the problem, then tap
**Copy diagnostic report** and paste it into a [bug report](https://github.com/heyymichii/michii-patches/issues/new/choose).
Links, IDs and e-mail addresses are removed from the report.

## 🩹 Patches list

More apps are on the way: follow the [announcements](https://github.com/heyymichii/michii-patches/discussions/categories/announcements)
to hear about them first, or [suggest an app](https://github.com/heyymichii/michii-patches/discussions/categories/ideas).

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/heyymichii/michii-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;14 patches total
<details open>
<summary><img src="assets/icons/com.linkedin.android.svg" width="20" height="20" align="top" alt=""> LinkedIn&nbsp;&nbsp;•&nbsp;&nbsp;14 patches</summary>
<br>

**🎯 Supported versions:**

| 4.1.1255.1 | 4.1.1259 | 4.1.1261 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block tracking](#block-tracking) | Adds an option (off by default) to stop sending most LinkedIn analytics events. |  |
| [Disable double-tap like](#disable-double-tap-like) | Stops double tapping a post or photo from liking it. |  |
| [Download media](#download-media) | Adds a download button to the full screen photo and video viewer. |  |
| [Feed filters](#feed-filters) | Adds optional filters (off by default, turned on in Michii Patches): focus mode, celebrations, job cards, reposts, video posts, the "New posts" pill and "See translation". |  |
| [GmsCore support](#gmscore-support) | Makes "Continue with Google" work in patched LinkedIn by signing in through microG RE (GmsCore) instead of Google Play services. Needs microG RE installed and signed in to a Google account. |  |
| [Hide Premium upsells](#hide-premium-upsells) | Removes Premium and AI upsell cards and banners, including on profiles and the Me panel. |  |
| [Hide ads](#hide-ads) | Removes promoted (sponsored) posts from the feed. |  |
| [Hide promoted jobs](#hide-promoted-jobs) | Removes promoted job listings from the Jobs tab and job search. |  |
| [Hide suggested posts](#hide-suggested-posts) | Removes "Suggested" posts from outside your network from the feed. |  |
| [Material You](#material-you) | Uses your wallpaper's colors (Android 12+): the accent color instead of LinkedIn blue and the green of selected filters, and Material 3 surface colors for backgrounds, cards, bars and borders. Some screens drawn by LinkedIn's servers may keep their own colors. |  |
| [Messaging](#messaging) | Hides sponsored messages, and adds an optional ghost mode that does not send typing indicators or read status. |  |
| [Open links directly](#open-links-directly) | Opens external links without LinkedIn's safety/go warning page. |  |
| [Remove gaps and dividers](#remove-gaps-and-dividers) | Removes the gray gaps between posts and the dividers between list items, so the feed and lists are one flat surface. |  |
| [Sanitize share links](#sanitize-share-links) | Removes tracking parameters from LinkedIn links when they are copied or shared. |  |

</details>

<!-- PATCHES_END -->

## 🌐 Translations

The settings of every app are available in English, Bahasa Indonesia, Español, Português (Brasil), Français, Deutsch,
Tiếng Việt, ไทย, Türkçe, Русский and 日本語. They follow your phone's language, and you can pick another one under
**Other → Language**.

Translations are managed on **[Crowdin](https://crowdin.com/project/michii-patches)**: fix a translation or add your
language there, and it comes to the apps in the next update.

## 🤝 Contributing

- **Bugs and feature requests**: [open an issue](https://github.com/heyymichii/michii-patches/issues/new/choose).
- **Questions and ideas**, including apps you'd like to see: [Discussions](https://github.com/heyymichii/michii-patches/discussions).
- **Code**: pull requests are welcome, against the `dev` branch. Thanks to everyone who has contributed,
  including [@amfakh](https://github.com/amfakh) for Material You and Sign in with Google on LinkedIn.

Michii Patches removes ads and clutter and adds features. It doesn't unlock paid features or content.

### 🛠️ Building locally

1. Run `./gradlew buildAndroid`.
2. The patch bundle is in `patches/build/libs/patches-*.mpp`.
3. Patch with [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop) like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more.

## 💖 Support

If Michii Patches makes your apps better, you can support its development:

<a href="https://ko-fi.com/heyymichii"><img src="https://img.shields.io/badge/Ko--fi-Support-ff5e5b?style=for-the-badge&logo=ko-fi&logoColor=white" alt="Ko-fi"></a>
<a href="https://trakteer.id/heyymichii"><img src="https://img.shields.io/badge/Trakteer-Indonesia-be1e2d?style=for-the-badge" alt="Trakteer"></a>

## 📜 License

Michii Patches is licensed under the [GNU General Public License v3.0](LICENSE), including the additional terms in
[NOTICE](NOTICE). Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).

Michii Patches is an independent project, made by **heyymichii**. It is not affiliated with, endorsed by, or part of
the Morphe project or the developers of the patched apps. All app names and trademarks belong to their owners.
Modifying an app may violate its terms of service; use the patches at your own risk.
