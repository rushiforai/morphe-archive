# 🧩 Michii Patches

LinkedIn patches for use with [Morphe](https://morphe.software), by **heyymichii**.

Michii Patches is an independent project. It is not affiliated with, endorsed by, or part of the
Morphe project or LinkedIn.

## 🚧 Next Update

The next Michii Patches update is in progress! 🎉

I'm working on several improvements, including:

- 🐛 **Bug fixes**: Fixing reported issues and improving existing patches.
- 🎨 **Patch improvements**: Refining current patches and addressing compatibility issues.
- 🧩 **More app patches**: Expanding Michii Patches with patches for other apps.

I'm currently quite busy with my real-life work, so development may take a little longer than usual. I'll continue working on these improvements as time allows.

Thanks for your patience, feedback, and support! ❤️

## ❓ About

Michii Patches removes ads and clutter from LinkedIn and adds features the app does not have:

- **Ads & promotions:** hide promoted posts, promoted jobs, suggested posts, sponsored messages,
  and Premium / AI upsells (feed, profiles, Jobs, and the "Me" panel).
- **Download:** a download button on full screen photos, videos, profile photos, and banners,
  with a configurable save location.
- **Feed filters** (off by default): focus mode (hide like/comment/repost counts), celebrations,
  job cards, reposts, video posts, the "New posts" pill, and "See translation".
- **Chat:** ghost mode (no typing indicator or automatic read status; mark chats read by hand
  from the chat list), hide sponsored messages.
- **Privacy:** open links directly without LinkedIn's warning page (including `lnkd.in` short
  links), remove tracking parameters from copied and shared links, and an optional analytics block.
- **Disable double-tap like** on posts and photos.
- **Settings:** turn each feature on or off, search settings, back up and restore them, see which
  patches are applied, and check for updates. The settings are in English, or in Indonesian when
  your phone uses Indonesian (change it under Other → Language).

### Opening the settings

- Tap your profile photo to open the "Me" panel, then **Michii Patches** (below "Saved posts"), or
- long press the LinkedIn app icon on your home screen, then **Michii Patches**.

The app icon shortcut is added the first time LinkedIn opens after patching.

### Supported version

| App | Version |
|---|---|
| LinkedIn (`com.linkedin.android`) | **4.1.1261** (recommended), **4.1.1259**, **4.1.1255.1** (APKMirror variant *Android 10+*, the APK, not the bundle) |

Other versions are marked experimental and may not work.

> [!NOTE]
> **Signing in with Google doesn't work** in patched LinkedIn, because Google checks the app's signature.
> Sign in with your e-mail and password instead. If you signed up with Google and don't have a password,
> set one first on [linkedin.com](https://www.linkedin.com/checkpoint/rp/request-password-reset) ("Forgot password").

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=heyymichii/michii-patches

Then patch LinkedIn with Morphe Manager. Do not share patched APKs; share this patch source instead.

> ⚠️ Modifying the LinkedIn app may violate LinkedIn's terms of service. Use at your own risk.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0-dev.3](https://github.com/heyymichii/michii-patches/releases/tag/v1.2.0-dev.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`dev`&nbsp;&nbsp;•&nbsp;&nbsp;12 patches total
<details open>
<summary>📦 LinkedIn&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
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
| [Hide Premium upsells](#hide-premium-upsells) | Removes Premium and AI upsell cards and banners, including on profiles and the Me panel. |  |
| [Hide ads](#hide-ads) | Removes promoted (sponsored) posts from the feed. |  |
| [Hide promoted jobs](#hide-promoted-jobs) | Removes promoted job listings from the Jobs tab and job search. |  |
| [Hide suggested posts](#hide-suggested-posts) | Removes "Suggested" posts from outside your network from the feed. |  |
| [Material You](#material-you) | Uses your wallpaper colors (Android 12+) for accents and backgrounds instead of LinkedIn blue and gray. Some screens drawn by LinkedIn's servers may keep their own colors. |  |
| [Messaging](#messaging) | Hides sponsored messages, and adds an optional ghost mode that does not send typing indicators or read status. |  |
| [Open links directly](#open-links-directly) | Opens external links without LinkedIn's safety/go warning page. |  |
| [Sanitize share links](#sanitize-share-links) | Removes tracking parameters from LinkedIn links when they are copied or shared. |  |

</details>

<!-- PATCHES_END -->

### 🌐 Translations

The settings screens are available in English, Bahasa Indonesia, Español, Português (Brasil), Français, Deutsch,
Tiếng Việt, ไทย, Türkçe, Русский, and 日本語. They follow your phone's language, and you can pick another one under
**Other → Language**.

Found a wrong or awkward translation, or want to add a language? The texts are in
[`extensions/extension/src/main/translations`](extensions/extension/src/main/translations), one JSON file per
language with the English text as the key. Open an issue or a pull request.

### 💖 Support

If Michii Patches is useful to you, you can support its development:

- [Ko-fi](https://ko-fi.com/heyymichii)
- [Trakteer](https://trakteer.id/heyymichii) (for supporters in Indonesia)

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Michii Patches are licensed under the [GNU General Public License v3.0](LICENSE), including the
additional terms in [NOTICE](NOTICE).

Based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template).
