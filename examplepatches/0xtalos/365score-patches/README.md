<div align="center">

<h1>365Score Morphe Patches</h1>

Morphe patches for <strong>365Scores</strong><br>
<em>(com.scores365 · v14.9.5+)</em>

</div>

## 🕹️ Usage

### Morphe Manager

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe-blue?logo=android&style=for-the-badge)](https://morphe.software/add-source?github=0xtalos/365score-patches)

[**➕ Click here to add Patches to Morphe Manager**](https://morphe.software/add-source?github=0xtalos/365score-patches)

Or in Morphe Manager (**Settings** / **Sources** ➔ **+**), enter:
`https://github.com/0xtalos/365score-patches`
*(or `https://raw.githubusercontent.com/0xtalos/365score-patches/main/patches-bundle.json`)*

Then select 365Scores in Morphe Manager, select the APK/APKM, and tap Patch!

---

## ⚙️ Available Patches

### ⚽ 365Scores (`com.scores365` · v14.9.5)

| 💊 Patch | 📜 Description |
|----------|----------------|
| **Unlock premium** | Unlocks 365Score premium features (ad-free, tipster, plus, notification sounds) |
| **Disable ads** | Removes banner and interstitial advertisements |
| **Disable analytics** | Removes analytics and tracking SDK initialization (AppsFlyer, Firebase) |
| **Block update screen** | Blocks the "This app is out of date" update prompt on launch |
| **Change version code** | Changes version code to prevent Play Store from overwriting the app |

---

## 🔧 Development

### Prerequisites

- JDK 21+
- A GitHub account with access to the [MorpheApp registry](https://github.com/orgs/MorpheApp/packages)

### Build

```sh
./gradlew :patches:buildAndroid -Pversion=1.2.0
```

The output `.mpp` bundle is written to `patches/build/libs/`.

---

## 📄 License

[GNU General Public License v3.0](LICENSE)
