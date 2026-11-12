# 👋🧩 Viper Patches

Morphe patches for apps I like.

## ❓ About

- **Unlock SAI Premium** — activates SAI Premium (com.mtv.sai 2.4.3) by forcing the local RevenueCat entitlement check to true in all three places that read it.
- **Remove ads (APKS Installer)** — disables all ads in APKS Installer (com.inwepo.apkinstaller 2.8-Google) by forcing the master ads flag off and making the ad initializer a no-op.
- **Shohay Pregnancy Health** (health.shohay.pregnancy 2.1.1) — four patches that work together: **MicroG RE Google Sign-In** redirects Google login to MicroG RE, **MicroG signature spoof** adds the original Play signature to the manifest so MicroG's OAuth is accepted, **Unlock Premium** unlocks all weekly premium videos (weeks 1–42), and **Spoof installer source (Play Store)** makes the app appear installed from Google Play so a manually installed build does not hit "not installed from Play Store" paths.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/viper/morphe-patches

<a href="https://morphe.software/add-source?github=viper/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/sabbirdj/viper-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;6 patches total
<details open>
<summary>📦 Shohay Pregnancy Health&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `health.shohay.pregnancy`

**🎯 Supported versions:**

| 2.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [MicroG RE Google Sign-In](#microg-re-google-sign-in) | Redirects Google Sign-In to MicroG RE (app.revanced.android.gms): forces normal sign-in mode, rewrites the sign-in action/package, and drops the unused ID-token request. Pair with the 'MicroG signature spoof' manifest patch or login fails with error 8. Verified on Shohay 2.1.1. |  |
| [MicroG signature spoof](#microg-signature-spoof) | Adds the original Play signature (SHA-1) as the app.revanced.android.gms.SPOOFED_PACKAGE_SIGNATURE manifest meta-data, so MicroG RE sends the original signature to Google during sign-in and the re-signed app is accepted. Required for the 'MicroG RE Google Sign-In' patch. Verified on Shohay 2.1.1. |  |
| [Spoof installer source (Play Store)](#spoof-installer-source-play-store) | Makes Shohay appear installed from Google Play (com.android.vending) so a manually installed build does not hit 'not installed from Play Store' paths. Same logic as the Morphe universal 'Change installer source' patch. Verified on Shohay 2.1.1. |  |
| [Unlock Premium](#unlock-premium) | Unlocks all weekly premium videos by making SubscribedWeeksDeriver return every week (1-42) as subscribed with 1000 days remaining. The premium gate is evaluated locally from this result, so no server change is needed. Verified on Shohay 2.1.1. |  |

</details>

<details open>
<summary>📦 APKS Installer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.inwepo.apkinstaller`

**🎯 Supported versions:**

| 2.8-Google |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove ads (APKS Installer)](#remove-ads-apks-installer) | Disables all ads by forcing the master ads flag MyApplication.m to false and making the ad initializer a no-op. Verified on APKS Installer 2.8-Google. |  |

</details>

<details open>
<summary>📦 SAI&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.mtv.sai`

**🎯 Supported versions:**

| 2.4.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock SAI Premium](#unlock-sai-premium) | Activates SAI Premium by forcing the local entitlement check to true in all three places that read it (ck0, fk0, dk0). Verified on SAI 2.4.3. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
