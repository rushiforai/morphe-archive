# 👋🧩 iPusnas Patches

Morphe patches for the **iPusnas** digital library app
(`mam.reader.ipusnas`, v2.1.4).

## ❓ About

A set of patches that improve privacy and add a "Save to Downloads" feature
to the iPusnas e-reader app. These patches are applied with
[Morphe](https://morphe.software) and are based on the manual smali modding
pipeline documented in `research/docs/modifications.md`.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/kuchingneko28/ipusnas-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 iPusnas&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 2.1.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass Play Store redirect](#bypass-play-store-redirect) | Makes the PairIP license check pass for sideloaded installs so the app no longer redirects to the Play Store and closes. |  |
| [Disable Firebase Analytics and FCM](#disable-firebase-analytics-and-fcm) | Disables Google Firebase Analytics tracking and removes Firebase Cloud Messaging push notifications. |  |
| [Neuter Telegram security breach reporter](#neuter-telegram-security-breach-reporter) | Stops the app from reporting security breaches or APK integrity failures to the developers' Telegram channel. |  |
| [Remove certificate pinning](#remove-certificate-pinning) | Removes the hard-coded OkHttp certificate pins and SSL pinning interceptor so the app trusts system and user CAs. |  |
| [Remove screenshot restriction](#remove-screenshot-restriction) | Disables the FLAG_SECURE window flag in the PDF and EPUB readers so screenshots and screen recordings are allowed. |  |
| [Save book to Downloads](#save-book-to-downloads) | Adds a menu option that downloads, decrypts, and saves the book as a readable PDF or EPUB in the public Downloads folder. |  |

</details>

<!-- PATCHES_END -->

## 🚀 Getting development started

1. [Setup](https://github.com/MorpheApp/morphe-documentation/blob/main/docs/morphe-development/README.md)
   your development environment, including a GitHub PAT with `read:packages`
   scope (used to resolve the `app.morphe.patches` Gradle plugin). Add it to
   `~/.gradle/gradle.properties` as `gpr.user` / `gpr.key` or export
   `GITHUB_ACTOR` / `GITHUB_TOKEN`. An Android SDK is also required
   (`local.properties` with `sdk.dir=...`).
2. Build the patch bundle:
   ```bash
   ./gradlew buildAndroid
   # Output: patches/build/libs/patches-*.mpp
   ```
3. Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
   like any other patch bundle.

### 🛠️ Verifying against a real APK

A small harness applies every patch to a real APK and reports whether each
fingerprint matched:

```bash
./gradlew :patches:verifyPatches --args="path/to/base.apk build/verify-output"
```

## 📜 License

GPLv3 — see [LICENSE](LICENSE).
