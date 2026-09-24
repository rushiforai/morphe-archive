# Aidan's Morphe Patches

My [Morphe](https://morphe.software) patches

![WTFPL Badge](https://www.wtfpl.net/wp-content/uploads/2012/12/wtfpl-badge-4.png)

![Add to Morphe badge](https://github.com/ihatenodejs/aidans-patches/blob/main/assets/add-to-morphe.png?raw=true)

## 📱 Supported Applications & Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/ihatenodejs/aidans-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Sezzle&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 5.3.9 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Clean Authentication](#clean-authentication) | Shows Google sign-in only and removes the unavailable phone sign-in controls. |  |
| [Disable CodePush OTA Bundles](#disable-codepush-ota-bundles) | Always starts the embedded JavaScript bundle instead of a CodePush update. |  |
| [Patch Consent Screen](#patch-consent-screen) | Requires consent to a patched-app warning before opening Sezzle authentication. |  |
| [Remove Ads and Tracking](#remove-ads-and-tracking) | Removes all ads (AppLovin MAX, Google Mobile Ads, Rokt, Playtime, InBrain Surveys) and disables analytics and tracking SDKs (AppsFlyer, FullStory, Braze, Firebase Analytics, mParticle, Facebook SDK, AppCenter). |  |
| [Remove Rewards](#remove-rewards) | Removes the Rewards tab from the navigation bar and disables associated reward screens. |  |
| [Replace Shop with Home](#replace-shop-with-home) | Replaces the Shop bottom navigation tab with Home and removes home feed content. |  |

</details>

<!-- PATCHES_END -->
## 🛠️ Building

### Prerequisites
- JDK 17+ (JDK 27 tested)
- Android SDK (set `sdk.dir` in `local.properties` or export `ANDROID_HOME`)

### Build Command
```bash
./gradlew buildAndroid
```

The compiled patch bundle will be generated at:
```
patches/build/libs/patches-*.mpp
```

To update `patches-list.json`:
```bash
./gradlew generatePatchesList
```

## 📲 Applying Patches

Using [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop):

```bash
java -jar morphe-desktop.jar patch \
  --patches patches/build/libs/patches-1.0.0.mpp \
  --out sezzle-patched.apk \
  base.apk
```

## 📜 License

Licensed under the [GNU General Public License v3.0](LICENSE).
