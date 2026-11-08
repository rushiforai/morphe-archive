# 🔧 Way2News Patches

Patches for the Way2News news app, for use with the Morphe patching framework.

> Unofficial. Not affiliated with or endorsed by Way2News or the Morphe project.

## ❓ About

These patches remove advertising and analytics tracking from Way2News.

- **Disable ads**: blocks all Google Mobile Ads and Facebook Audience Network ad requests.
- **Disable analytics**: stops the Singular attribution SDK, drops Firebase Analytics events, user ids and
  screen names, and switches off Firebase / Google Analytics data collection in the app manifest.

Sponsored posts that Way2News serves from its own server are not blocked.

### How to use these patches

Add Way2News Patches to Morphe Manager with this link:

https://morphe.software/add-source?github=pardhu23/morphe-patches

You need the original Way2News app file, which you supply yourself. This repository does not contain it.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/pardhu23/morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Way2News&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `sun.way2sms.hyd.com`

**🎯 Supported versions:**

| 9.58 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable ads](#disable-ads) | Blocks all Google Mobile Ads and Facebook Audience Network ad requests. |  |
| [Disable analytics](#disable-analytics) | Disables Singular attribution and Firebase Analytics tracking. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`. A plain `./gradlew build` produces a file Morphe Manager cannot load.
- The `.mpp` patch bundle is created in `patches/build/libs/patches-*.mpp`.
- Resolving the Morphe Gradle plugin needs a GitHub token with `read:packages` in your own
  `~/.gradle/gradle.properties` as `gpr.user` and `gpr.key`. Never commit that file or token.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Way2News Patches are licensed under the [GNU General Public License v3.0](LICENSE).
