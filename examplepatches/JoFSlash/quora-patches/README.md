# 🧩 JoFSlash Patches

Patches for [Quora](https://play.google.com/store/apps/details?id=com.quora.android) for use with [Morphe](https://morphe.software).

🌐 Website: https://jofslash.github.io/quora-patches/  
📲 Get Morphe Manager from the official site: https://morphe.software

## ❓ About

- **Remove ads**: hides promoted answers, sponsored posts and Google ads in the feed and on question pages, and blocks requests to ad servers.
- **Disable analytics**: turns off Firebase Analytics, Crashlytics, Firebase Performance and Facebook app events, and stops the advertising ID from being collected.

Tested with Quora 3.2.42 and 3.2.30 from [APKMirror](https://www.apkmirror.com/apk/quora-inc/quora/) (APKM bundle).

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/JoFSlash/quora-patches

<a href="https://morphe.software/add-source?github=JoFSlash/quora-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/JoFSlash/quora-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Quora&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.quora.android`

**🎯 Supported versions:**

| 3.2.42 | 3.2.30 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable analytics](#disable-analytics) | Turns off Firebase Analytics, Crashlytics, Firebase Performance and Facebook app events, and stops the advertising ID from being collected. |  |
| [Remove ads](#remove-ads) | Hides promoted answers, sponsored posts and Google ads in the feed and on question pages, and blocks requests to ad servers. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Building

Requires JDK 21 and a GitHub token with `read:packages` (see the [Morphe docs](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/1_setup.md)).

```bash
./gradlew buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`.

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE).
This project is not affiliated with Quora or with the Morphe project.
