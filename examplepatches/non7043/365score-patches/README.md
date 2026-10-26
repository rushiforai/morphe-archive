<div align="center">

<h1>Vibe Patches</h1>

Morphe patches for <strong>365Scores</strong> and <strong>HDO Box</strong><br>
<em>(com.scores365 · v14.9.7 &nbsp;·&nbsp; com.hdoapp.hdo_box · v4.4.7)</em>

</div>

## 🕹️ Usage

### Morphe Manager

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe-blue?logo=android&style=for-the-badge)](https://morphe.software/add-source?github=0xtalos/vibe-patches)

[**➕ Click here to add Patches to Morphe Manager**](https://morphe.software/add-source?github=0xtalos/vibe-patches)

Or in Morphe Manager (**Settings** / **Sources** ➔ **+**), enter:
`https://github.com/0xtalos/vibe-patches`
*(or `https://raw.githubusercontent.com/0xtalos/vibe-patches/main/patches-bundle.json`)*

Then select 365Scores or HDO Box in Morphe Manager, select the APK/APKM, and tap Patch!

---

## ⚙️ Available Patches

### ⚽ 365Scores (`com.scores365` · v14.9.7)

| 💊 Patch | 📜 Description |
|----------|----------------|
| **Unlock premium** | Unlocks 365Score premium features (ad-free, tipster, plus, notification sounds) |
| **Disable ads** | Removes banner and interstitial advertisements |
| **Disable analytics** | Removes analytics and tracking SDK initialization (AppsFlyer, Firebase) |
| **GmsCore support** | Routes Google APIs (including Google Sign-In) to **MicroG RE**. Enabled by default; also applies **Spoof signature** automatically |
| **Block update screen** | Blocks the "This app is out of date" update prompt on launch |
| **Change version code** | Changes version code to prevent Play Store from overwriting the app |

> **Google Sign-In on 365Scores:** a re-signed APK cannot talk to Google Play
> services, so **GmsCore support** is on by default and is required for sign-in,
> sync and push notifications. Install [MicroG RE](https://github.com/MorpheApp/MicroG-RE)
> (`app.revanced.android.gms`), open it and add your Google account, then sign in
> from 365Scores. Vanilla microG/Vanced microG is **not** supported.
>
> **Spoof signature** is not enabled on its own — it is pulled in by **GmsCore
> support** and reports the original Play signing certificate to Firebase/API-key
> checks. Do not disable it when you use Google features.

### 🎬 HDO Box (`com.hdoapp.hdo_box` · v4.4.7)

| 💊 Patch | 📜 Description |
|----------|----------------|
| **Remove ads** | Neutralises the Unity Ads plugin, so no ad is ever initialized, loaded or shown, and "watch ad" flows complete instantly |
| **Disable analytics** | Disables Firebase Analytics collection (including screen reporting and advertising id collection) and blocks the app from turning it back on |
| **Remove tracking permissions** | Removes the `AD_ID` and Privacy Sandbox (AdServices) permissions |

> **Note on HDO Box premium:** the "Remove Ads Forever", 4K and 3D unlocks are
> validated on HDO's servers (Polar purchase + Firebase/Appwrite + Play Integrity),
> so they cannot be unlocked by a client-side patch. These patches only remove the
> ad experience and tracking — they do not fake a premium account.

---

## 🔧 Development

### Prerequisites

- JDK 21+
- A GitHub account with access to the [MorpheApp registry](https://github.com/orgs/MorpheApp/packages)

### Build

```sh
./gradlew :patches:buildAndroid
```

The bundle version is set in `patches/build.gradle.kts`. The output `.mpp` bundle is
written to `patches/build/libs/`.

`./gradlew :patches:test` runs the smoke tests, which patch the APKs listed in the
repository root (skipped when the APK is absent).

---

## 📄 License

[GNU General Public License v3.0](LICENSE)
