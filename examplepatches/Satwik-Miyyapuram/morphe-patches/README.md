# 🧩 MMC Patches

**Ad-free Mini Militia Classic. Patches for use with [Morphe](https://morphe.software).**

[![Add to Morphe](https://img.shields.io/badge/Add%20to-Morphe-84cc16?style=for-the-badge&logo=android&logoColor=white)](https://morphe.software/add-source?github=Satwik-Miyyapuram/morphe-patches)
[![Latest release](https://img.shields.io/github/v/release/Satwik-Miyyapuram/morphe-patches?style=for-the-badge&label=release)](https://github.com/Satwik-Miyyapuram/morphe-patches/releases/latest)
[![License: GPLv3](https://img.shields.io/badge/license-GPLv3-blue?style=for-the-badge)](LICENSE)

> [!IMPORTANT]
> **For educational and research purposes only.** This project shows how Android bytecode
> patching works using the open-source Morphe patcher. It contains no game code or assets, and
> it is not affiliated with Appsomniacs LLC, Miniclip or the Morphe project.
> See the full [Disclaimer](#%EF%B8%8F-disclaimer).

## 📲 Add these patches to Morphe (one tap)

Open this link **on your Android phone** with [Morphe Manager](https://morphe.software) installed:

### 👉 https://morphe.software/add-source?github=Satwik-Miyyapuram/morphe-patches

Morphe Manager opens and adds this repository as a patch source. If the link doesn't open the app,
add it manually: **Morphe Manager → Sources → ＋ → GitHub** → `https://github.com/Satwik-Miyyapuram/morphe-patches`

## 🩹 Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/Satwik-Miyyapuram/morphe-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 Mini Militia Classic&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 0.14.4 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ad SDK auto-start](#remove-ad-sdk-auto-start) | Removes the AdMob and AppLovin init providers from the manifest so the ad SDKs never start in the background. |  |
| [Remove ads](#remove-ads) | Fully removes banner and interstitial ads (AppLovin MAX and AdMob) and disables rewarded video prompts. Optionally stops the ad SDKs and the ad-consent form from loading. | • Disable ad SDK initialization<br>• Skip ad consent form |
| [Spoof signature](#spoof-signature) | Reports the original Play Store signing certificate to the game, so the re-signed APK passes the game's integrity check and online play isn't affected. |  |

</details>

<!-- PATCHES_END -->

| | |
|---|---|
| App | Mini Militia Classic : DA2 MMC (`com.appsomniacs.mmc`) |
| Tested version | **0.14.4** (version code 88) |
| Other versions | Experimental. Patching may work, but it's untested. |

## 🚀 How to patch Mini Militia Classic

### On your phone (Morphe Manager), recommended
1. Install **Morphe Manager** from [morphe.software](https://morphe.software).
2. Tap the [**Add to Morphe**](https://morphe.software/add-source?github=Satwik-Miyyapuram/morphe-patches) link above.
3. Get the original APK: Mini Militia Classic **0.14.4**, **APK** variant (not "BUNDLE"),
   `arm64-v8a` for most phones, from [APKMirror](https://www.apkmirror.com/apk/appsomniacs-llc/mini-militia-classic-da2-mmc/).
4. In Morphe Manager, pick **Mini Militia Classic** (or *select from storage* and choose the APK).
5. Leave the default patches ticked (**Remove ads**, **Remove ad SDK auto-start**, **Spoof signature**) → **Patch**.
6. **Uninstall the Play Store version first**, then install the patched app when Manager asks.
   Android refuses to install over an app signed with a different key.
   Anything not synced to your online account is lost on uninstall.

### On a PC with adb (Windows, including ARM64, macOS or Linux)
1. Install Java 17+ (Windows ARM64: *Microsoft Build of OpenJDK*, ARM64 installer).
2. Download [`morphe-desktop-*-all.jar`](https://github.com/MorpheApp/morphe-desktop/releases/latest)
   and `patches-*.mpp` from this repo's [Releases](https://github.com/Satwik-Miyyapuram/morphe-patches/releases/latest).
3. Run:
   ```powershell
   java -jar morphe-desktop-1.17.0-all.jar patch -p patches-1.0.0.mpp -o mmc-adfree.apk "Mini Militia Classic 0.14.4.apk"
   adb uninstall com.appsomniacs.mmc
   adb install mmc-adfree.apk
   ```
   Add `-i` to the `patch` command to install straight to the phone over adb.
   Double-clicking the jar opens the same tool as a normal window app.

## 🔬 How it works

The game is Cocos2d-x (C++). The native code asks Java to show ads through JNI bridge methods:

```
libcocos2dcpp.so
  └─ DA2Activity.showAdBanner / prepareInterstitial / showInterstitial / showRewardedAd / isRewardedAdReady
       └─ PitBoss (facade) → AdsImperator (ad manager)
            ├─ AppLovinMaxAdNetworkAdapter → MaxAdView / MaxInterstitialAd
            └─ AdMobAdNetworkAdapter        → AdView / InterstitialAd
  ComplianceManager (Google UMP consent)   ·   manifest: MobileAdsInitProvider, AppLovinInitProvider
```

- **Every layer is stubbed** (31 methods), so if one path is missed, a lower layer still blocks the ad. The bridges are found by their
  unique strings (`ActivityNull%sshowAdBanner`, …), so class renames in future versions don't break the patch.
- **No empty banner space:** the banner never loads, so the game's `AdBannerShown` event never fires
  and the in-game "PRO PASS (REMOVE ADS)" strip is never attached.
- **Signature:** the game sends `PackageInfo.signatures[0]` to native code. Morphe re-signs the APK,
  so *Spoof signature* returns the original certificate (SHA-256 `19cb3ea9…bc4a93`).
- **Untouched:** gameplay, online and LAN play, login, Crashlytics. No native code is modified.

## ⚠️ Known limitations

- **In-app purchases and Pro Pass** are not unlocked, and buying them from the patched app will
  likely fail because it's re-signed. Buy them in the official Play Store app.
- **Login / passcode emails** are handled by the developer's servers; patching can't affect them.
  If the passcode doesn't arrive, check junk mail, double-check the email address, use *resend*, or reset it at
  <https://appsomniacs-mmc.azurewebsites.net/Account/Recover>. Official support: info@appsomniacs.com ·
  [Discord](https://discord.gg/93DgqsRtfg).

## ✅ Verification (0.14.4)

Compiled against morphe-patcher 1.14.1 and applied with Morphe Desktop 1.17.0 to the official APK
(sha256 `a4a1e33f…95a62c`). Results: 0 failed patches, 31/31 methods patched, both ad providers removed, signature
spoof byte-exact, patched dex re-validated with Google D8, output signed v1+v2+v3.

`tools/` contains the androguard scripts used for the analysis (`verify_targets.py`, `check_patched_apk.py`, …).

## 🛠️ Building

Releases are built automatically by GitHub Actions (`release.yml`) on every `feat:` / `fix:` commit.
To build locally you need JDK 17+, the Android SDK and a GitHub token with `read:packages`
(`gpr.user` / `gpr.key` in `~/.gradle/gradle.properties`), then run `./gradlew buildAndroid`.
The output is `patches/build/libs/patches-*.mpp`. For publishing your own copy, see [PUBLISHING.md](PUBLISHING.md).

## ⚖️ Disclaimer

- This repository is provided **for educational and research purposes only**: to study Android app
  structure, bytecode patching, and how ad SDKs are integrated.
- It is **not affiliated with, endorsed by or sponsored by** Appsomniacs LLC, Miniclip, Google,
  AppLovin or the Morphe project. *Mini Militia* and all related names and trademarks belong to their respective owners.
- **No APKs, game code or game assets are distributed here.** The patches only change a copy of
  the app that you obtained yourself, on your own device.
- Modifying apps may violate the app's Terms of Service. **You are solely responsible** for how
  you use this project. It is provided "as is", without warranty of any kind.
- Ads and purchases fund the developers. If you enjoy the game, **please support Appsomniacs**
  by buying Pro Pass or in-game items in the official app.
- Rights holders who want something changed or removed can open an issue and it will be handled promptly.

## 📜 License

[GPLv3](LICENSE). "Morphe" is referenced for compatibility only; this project isn't made by the Morphe project (see [NOTICE](NOTICE)).
