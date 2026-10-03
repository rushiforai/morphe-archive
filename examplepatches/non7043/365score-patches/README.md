<div align="center">

<h1>365Score & TikTok Morphe Patches</h1>

Morphe patches for <strong>365Scores</strong> and <strong>TikTok</strong><br>
<em>(com.scores365 · v14.9.5+) & (com.zhiliaoapp.musically · v46.2.3, v47.1.4+)</em>

</div>

## 🕹️ Usage

### Morphe Manager

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe-blue?logo=android&style=for-the-badge)](https://morphe.software/add-source?github=non7043/365score-patches)

[**➕ Click here to add Patches to Morphe Manager**](https://morphe.software/add-source?github=non7043/365score-patches)

Or in Morphe Manager (**Settings** / **Sources** ➔ **+**), enter:
`https://github.com/non7043/365score-patches`
*(or `https://raw.githubusercontent.com/non7043/365score-patches/main/patches-bundle.json`)*

Then select your app (365Scores or TikTok) in Morphe Manager, select the APK/APKM, and tap Patch!

---

## ⚙️ Supported Apps & Available Patches

### ⚽ 365Scores (`com.scores365` · v14.9.5)

| 💊 Patch | 📜 Description |
|----------|----------------|
| **Unlock premium** | Unlocks 365Score premium features (ad-free, tipster, plus, notification sounds) |
| **Disable ads** | Removes banner and interstitial advertisements |
| **Disable analytics** | Removes analytics and tracking SDK initialization (AppsFlyer, Firebase) |
| **Block update screen** | Blocks the "This app is out of date" update prompt on launch |
| **Change version code** | Changes version code to prevent Play Store from overwriting the app |

### 🎵 TikTok (`com.zhiliaoapp.musically` · v46.2.3, v47.1.4)

| 💊 Patch | 📜 Description |
|----------|----------------|
| **Downloads** | Adds watermark-free video downloads, filename templates, and comment sticker saving |
| **Feed filter** | Hides feed ads, TikTok Shop items, livestreams, stories, and photo posts |
| **Disable long-press repost** | Prevents holding Like from triggering accidental reposts |
| **Disable screen capture detection** | Disables capture detection and secure-window screenshot protection |
| **Playback speed** | Enables playback speed controls on all videos and remembers your selection |
| **Show seekbar & thumbnail** | Shows native seekbar and scrub thumbnail preview on all videos |
| **Stop video looping** | Stops video after playing once instead of auto-looping |
| **Translate comments** | Adds in-line translation controls for comments |
| **Fix Google login** | Restores Google account sign-in after patching |
| **Hide CAPTCHA popups** | Hides non-account puzzle verification dialogs |
| **Region spoof** | Adds in-app controls to change region signals (SIM/carrier) |
| **Settings** | Adds in-app configuration settings menu inside TikTok |
| *And 30+ more patches!* | See [patches-list.json](patches-list.json) for the full list of 42 TikTok patches. |

---

## 🔧 Development

### Prerequisites

- JDK 21+
- Android SDK (for compiling extensions)
- A GitHub account with access to the [MorpheApp registry](https://github.com/orgs/MorpheApp/packages)

### Build

```sh
./gradlew :patches:buildAndroid -Pversion=1.1.0
```

The output `.mpp` bundle is written to `patches/build/libs/`.

---

## 📄 License

[GNU General Public License v3.0](LICENSE)
