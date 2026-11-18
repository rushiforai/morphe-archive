<!-- HEADER_START -->
# <img src="../../assets/icons/com.truecaller.png" width="36" height="36" align="top" alt=""> Truecaller

![version](https://img.shields.io/badge/version-26.43.5-2563eb?style=for-the-badge&labelColor=0d1117) ![patches](https://img.shields.io/badge/patches-2-14b8a6?style=for-the-badge&labelColor=0d1117) ![file](https://img.shields.io/badge/file-APKM-0ea5e9?style=for-the-badge&labelColor=0d1117) ![menu](https://img.shields.io/badge/menu-Profile%20menu%20%C2%B7%20Settings-6e7681?style=for-the-badge&labelColor=0d1117)

[← All apps](../../README.md#apps)&nbsp;&nbsp;•&nbsp;&nbsp;`com.truecaller`&nbsp;&nbsp;•&nbsp;&nbsp;[v3.2.1](https://github.com/lokesh-sparrow/loki-patches/releases/tag/v3.2.1)

**🎯 Supported versions:** `26.43.5`
<!-- HEADER_END -->

## Features

| Feature | What you get |
|---|---|
| ⭐ **Premium features** | No ads, premium badge, incognito, ghost call, extended spam blocking, call recording, announce call, family sharing |
| 📵 **No after-call screen** | The screen Truecaller shows when a call ends is skipped, with a switch in the Loki Patches menu |
| ☁️ **Google sign-in and Drive backup** | Through MicroG-RE (optional patch) |

## How-to

### Open the Loki Patches menu

Open it from the profile menu or **Settings**: the entry with the puzzle icon, where Truecaller showed its Android watch entry, or long press the Truecaller icon on your home screen → **Loki Patches**.

### Show or hide the after-call screen

Loki Patches → **Calls** → **Hide after-call screen**. It applies from the next call; no restart needed.

### Sign in with Google and back up to Drive

1. Install [MicroG-RE](https://github.com/MorpheApp/microg-RE) and sign in to your Google account in it.
2. In Morphe Manager, tick **GmsCore support (Truecaller)** when you patch Truecaller.
3. Use **Continue with Google** in Truecaller as usual.
4. Turn on backup in Truecaller's settings; it is saved to your Google Drive through MicroG-RE.

## FAQ

**Which file do I download?**
The **APKM** bundle from APKMirror, version 26.43.5.

**Some premium screens are empty.**
Features whose content comes from Truecaller's servers (who viewed me, who searched for me, caller ID for unknown
numbers, fraud insurance) open but stay empty, because their data is not in the app.

## Patches

<!-- PATCHES_START -->
| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|---|---|---|
| **Enable premium features (Truecaller)** | Makes every premium feature the app decides on the device available, and the plan read as active instead of Free, and hides the after-call screen (switch in Loki Patches > Calls). Features whose content comes from Truecaller's servers (who viewed me, caller ID for unknown numbers, fraud insurance) open but stay empty - their data is not in the app. |  |
| **GmsCore support (Truecaller)** | Routes Google sign-in, the Google Drive backup of contacts and call logs, and Firebase push through MicroG-RE (GmsCore) instead of Google Play services. Signs the FCM registration with Truecaller's original certificate, so notifications still arrive on a re-signed build. MicroG-RE has to be installed and signed in to a Google account. |  |
<!-- PATCHES_END -->
