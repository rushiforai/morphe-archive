# 🧩 TgSeed Morphe Patches

[Morphe](https://morphe.software) patch bundle for the apps I use.

## ❓ About

Patches for apps I use, maintained for my own devices and shared as they are.
Built on the [Morphe Patches template](https://github.com/MorpheApp/morphe-patches-template);
this is an independent project and is not affiliated with or endorsed by the Morphe authors.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/TgSeed/Morpheeeps

<a href="https://morphe.software/add-source?github=TgSeed/Morpheeeps">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://github.com/TgSeed/Morpheeeps/releases/tag/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Symfonium&nbsp;&nbsp;•&nbsp;&nbsp;9 patches</summary>
<br>

**Package name:** `app.symfonik.music.player`

**🎯 Supported versions:**

| 15.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Crashlytics](#disable-crashlytics) | Makes the Crashlytics Firebase registrar report no components, so the SDK is never instantiated and its crash handler is never installed. |  |
| [Disable Firebase Analytics](#disable-firebase-analytics) | Makes every void method of FirebaseAnalytics return immediately, so no analytics event is recorded or uploaded. Getters and getInstance() are untouched. |  |
| [Disable LeakCanary](#disable-leakcanary) | Stops the bundled LeakCanary memory profiler from installing itself by making its ContentProvider onCreate() return false. |  |
| [Disable Matomo analytics](#disable-matomo-analytics) | Rewrites the Matomo collector URL so every analytics beacon targets an unroutable host. The Tracker is still constructed; nothing is ever delivered. |  |
| [Disable beta expiry tripwire](#disable-beta-expiry-tripwire) | Stops the app from randomly replacing the requested screen with the "beta version has expired" update wall. |  |
| [Force licensed state](#force-licensed-state) | Makes the licence verdict always positive and rewrites stored trial/locked entitlement values to the purchased value, so premium features stay unlocked. |  |
| [Force purchased state](#force-purchased-state) | Reports a purchased licence by forcing the purchase state to its success value wherever the app sets an error or not-started state. |  |
| [Hide trial card](#hide-trial-card) | Stops the licence screen from showing the free-trial expiry card and its purchase button by never storing the trial end date the server reports. |  |
| [Remove third-party QR code service](#remove-third-party-qr-code-service) | Points the share-as-QR image URL at a local placeholder so shared content is never sent to api.qrserver.com. |  |

</details>

<details open>
<summary>📦 XYZ app&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.example.app`

**🎯 Supported versions:**

| 2.0.0 | 1.0.2 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Example Patch](#example-patch) | Example patch to start with. |  |

</details>

<details open>
<summary>📦 Call Recorder - SKVALEX&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `org.skvalex.cr`

**🎯 Supported versions:**

| 3.7.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Ignore trial expiry](#ignore-trial-expiry) | Makes the trial/grace expiry predicates report "not expired", so recording is never blocked and the purchase wall never appears. The licence state itself is left untouched, so the app keeps telling its licence engine the truth. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

TgSeed Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
