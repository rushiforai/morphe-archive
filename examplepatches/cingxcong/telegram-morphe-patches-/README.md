# 🧩 Telegram Morphe Patches

[![Build](https://github.com/cingxcong/telegram-morphe-patches-/actions/workflows/buildAndroid.yml/badge.svg)](https://github.com/cingxcong/telegram-morphe-patches-/actions/workflows/buildAndroid.yml)
[![License: GPL-3.0](https://img.shields.io/badge/License-GPL--3.0-blue.svg)](LICENSE)

A maintained Morphe patch bundle for **Telegram 12.10.3**, focused on privacy, customization, content controls, and quality-of-life tweaks.

> **Target:** Telegram `12.10.3` · versionCode `70892`

## 🚀 Install

Add this patch source directly to Morphe:

**[➜ Add Telegram patches to Morphe](https://morphe.software/add-source?github=cingxcong/telegram-morphe-patches-)**

## ✨ Highlights

- 🛡️ Message and disappearing-media controls
- 🔓 Content and channel restriction controls
- 👑 Premium feature unlocking
- 🚫 Ad and auto-update controls
- 🎙️ Voice-to-music playback
- ⚡ Download performance tweaks
- 👻 Typing-indicator and channel-switching controls
- 🔐 Certificate/signature compatibility patches

## 📦 Releases

See **[Releases](https://github.com/cingxcong/telegram-morphe-patches-/releases)** for published `.mpp` bundles.

> Patch compatibility is version-specific. A patch source working on another Telegram release should not be assumed compatible here.

## ❓ Support

If a patch fails to match, please open an issue and include:

1. Telegram version and version code
2. Morphe Manager and Patcher versions
3. The complete `PatchException` traceback
4. Which patch failed

Please do not post private account data, authentication tokens, or modified APKs containing personal information.

<!-- PATCHES_START EXPANDED -->
> **[v1.8.1](https://github.com/cingxcong/telegram-morphe-patches-/releases/tag/v1.8.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;44 patches total
<details open>
<summary>📦 Telegram&nbsp;&nbsp;•&nbsp;&nbsp;15 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass channel restrictions](#bypass-channel-restrictions) | Allows opening, viewing, saving and forwarding content from restricted, sensitive, and copyright-restricted channels. |  |
| [Bypass content restrictions](#bypass-content-restrictions) | Allows saving and forwarding content from restricted channels, chats, and users. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Bypass translation restrictions](#bypass-translation-restrictions) | Keeps the translation UI available when a chat or user has disabled translations. |  |
| [Disable auto-update](#disable-auto-update) | Disables Telegram update availability/state and the update-state refresh path without replacing the 12.10.3 update UI method wholesale. |  |
| [Disable channel switching](#disable-channel-switching) | Disables the pull-down gesture that switches to the next unread channel. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram 12.10.3's Rich HTML branch while preserving normal clipboard handling. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>📦 Telegram Web&nbsp;&nbsp;•&nbsp;&nbsp;12 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Bypass translation restrictions](#bypass-translation-restrictions) | Keeps the translation UI available when a chat or user has disabled translations. |  |
| [Disable auto-update](#disable-auto-update) | Disables Telegram update availability/state and the update-state refresh path without replacing the 12.10.3 update UI method wholesale. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram 12.10.3's Rich HTML branch while preserving normal clipboard handling. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>📦 Telegram Plus&nbsp;&nbsp;•&nbsp;&nbsp;13 patches</summary>
<br>

**🎯 Supported versions:**

| 12.10.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Anti-delete messages](#anti-delete-messages) | Prevents messages deleted by other users from being removed locally. |  |
| [Anti-disappearing media](#anti-disappearing-media) | Keeps view-once photos, videos and voice messages viewable indefinitely. |  |
| [Anti-screenshot notification](#anti-screenshot-notification) | Blocks screenshot notifications from being sent to the other user. |  |
| [Bypass integrity check](#bypass-integrity-check) | Spoofs certificate fingerprint and SafetyNet results so login works on patched APK. |  |
| [Bypass translation restrictions](#bypass-translation-restrictions) | Keeps the translation UI available when a chat or user has disabled translations. |  |
| [Disable analytics](#disable-analytics) | Blocks Firebase analytics and event tracking in Telegram Plus. FirebaseApp.initializeApp() is preserved so push notifications keep working. |  |
| [Disable auto-update](#disable-auto-update) | Disables Telegram update availability/state and the update-state refresh path without replacing the 12.10.3 update UI method wholesale. |  |
| [Download speed boost](#download-speed-boost) | Increases download chunk size to 1 MB and max concurrent requests to 12. |  |
| [Hide typing indicator](#hide-typing-indicator) | Hides your typing indicator from other users in all chats. On Telegram Plus also silences the controller-level sendTyping dispatcher. |  |
| [Remove ads](#remove-ads) | Removes sponsored messages and video ads from all chats and channels. On Telegram Plus also blocks native banner and inline ads. |  |
| [Unlock Premium](#unlock-premium) | Unlocks Telegram Premium features for the current account. |  |
| [Use normal paste](#use-normal-paste) | Skips Telegram 12.10.3's Rich HTML branch while preserving normal clipboard handling. |  |
| [Voice to music](#voice-to-music) | Plays voice notes in the full music player with seek bar and background playback. |  |

</details>

<details open>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Fix Firebase after re-signing](#fix-firebase-after-re-signing) | Fixes Firebase services (push notifications, Remote Config, Firebase Auth) that break after Morphe re-signs the app with a different certificate.<br><br>Apply with Original app certificate patch — no other config needed. |  |
| [Provide Original app certificate](#provide-original-app-certificate) | Automatically reads the signing certificate from the APK you are patching — no original app installed or file provided needed. Only fill the options below if you are patching an APK that was already re-signed (e.g. a previously patched build): in that case point to the original APK file, or enter the certificate manually. | • Path to original APK (if uninstalled)<br>• Certificate SHA-1 (manual)<br>• Certificate SHA-256 (manual)<br>• Certificate Base64 DER (manual) |
| [Spoof app signature](#spoof-app-signature) | Makes the app think its signing certificate is unchanged after Morphe re-signs it.<br><br>Useful when an app crashes or shows a tamper warning because it checks its own certificate.<br><br>Does not bypass Play Integrity / SafetyNet hardware attestation.<br><br>Apply with Original app certificate patch. | • Package name override (optional) |
| [Spoof install source](#spoof-install-source) | Makes the app think it was installed from a specific store (default: Google Play).<br><br>Useful when an app blocks features or shows errors because it detects it was not installed from the Play Store.<br><br>Only affects what the app itself sees - does not change the real system install record. | • Store to impersonate |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

These patches are licensed under the [GNU General Public License v3.0](LICENSE)
