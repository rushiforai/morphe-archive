# 👋🧩 iPusnas Patches

Morphe patches for the **iPusnas** digital library app
(`mam.reader.ipusnas`, v2.1.4 / v2.1.6).

## 🔁 v2.1.6 rebase notes

2.1.6 (versionCode 210000027) re-obfuscated several classes the patches hook.
All six patches carry 2.1.4 + 2.1.6 fingerprints with automatic fallback:

| Target | 2.1.4 | 2.1.6 |
|--------|-------|-------|
| PairIP `LicenseClient.performLocalInstallerCheck` | unchanged | unchanged |
| `SecurityReporter.reportBreach` | unchanged | unchanged |
| `SecurityReporter.reportIntegrityFailure` | named method | reobfuscated to `b` (still static `(String)V`, verified by body) |
| `LandingPageAct` FCM token registration | `B()V` | moved to `C()V` (B now returns the view binding) |
| Reader-intent builder | `Liq;->a` | now `Llq;->a`; `Liq;` is a RecyclerView adapter; `BookModel` moved to `mam.reader.ilibrary.core.model` |
| `RetrofitHelper` pinning | `certificatePinner` field + named `SSLPinningInterceptor` inner class | field renamed to `a`, interceptor replaced by synthesised `Liz;` (uses native `NativePinning.verify`) |
| `PDFViewAct` / `FolioActivity` `setFlags(0x2000)` | unchanged | unchanged |
| `SecurityNative` (root/debug checks) | present | renamed to `DeviceIntegrityNative` (`isAdbEnabled`/`isDebugBuild` wrappers + native `probe()` from libdrm-bridge.so) — currently **dead code, zero call sites**, reference fingerprints shipped |

The Firebase patch no longer `return-void`s the whole FCM method (that also
killed notification-channel creation in 2.1.6); it now inserts a `goto` that
skips only the `FirebaseMessaging` token block.


## ❓ About

A set of patches that improve privacy and add a "Save to Downloads" feature
to the iPusnas e-reader app. These patches are applied with
[Morphe](https://morphe.software) and are based on the manual smali modding
pipeline documented in `research/docs/modifications.md`.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.3.1](https://github.com/suakamargas121/shiny-train/releases/tag/v1.3.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 iPusnas&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**🎯 Supported versions:**

| 2.1.4 | 2.1.5 | 2.1.6 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Android 10 compatibility (minSdk 29)](#android-10-compatibility-minsdk-29) | Lowers minSdkVersion to 29 so the patched app installs on Android 10 and 11. All newer-API calls in the app are version-guarded. |  |
| [Bypass Play Integrity token (keep attestation)](#bypass-play-integrity-token-keep-attestation) | Replaces the Play Integrity token with an empty one during device attestation. The attestation, PoP signing and token refresh keep working; the server accepts an empty integrity token. |  |
| [Bypass Play Store redirect](#bypass-play-store-redirect) | Disables the PairIP license check entirely (initial + repeated checks and the trial path) so a sideloaded or patched build is never flagged, and no Play Store redirect or shutdown happens. |  |
| [Bypass device attestation](#bypass-device-attestation) | Skips device attestation entirely. The server rejects sessions without attestation — use 'Bypass Play Integrity token' instead. |  |
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
