# 🧩 App Patches

Patches for Android apps, built for [Morphe](https://morphe.software).

<a href="https://morphe.software/add-source?github=toidicakhia/morphe-app-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## ✨ What's inside

This bundle currently supports:

| App | Version | Patches |
|-----|---------|---------|
| EZVIZ | 7.6.1.0824 | Remove ads, bypass SSL pinning, bypass signature check |
| 1.1.1.1 | 6.38.11 | Disable analytics, disable SSL pinning, spoof WARP+ unlimited UI |
| TeraBox | 4.27.5 | Hide ads while keeping rewarded ads on the Benefits page |
| Universal Copy | 7.2.0 | Unlock Plus, remove ads/upgrade prompts and the Internet permission |
| NetMonster | 4.0.5 | Unlock premium |
| HTTP Sniffer | 2.5.2-ad_mob, 2.4.9-ad_mob | Unlock VIP |
| VTVGo | 12.11.05 | Remove video/product ads, disable analytics, remove Ad ID permissions |

Only the exact versions listed above are supported. Newer app releases usually need
updated fingerprints before a patch can be applied.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.7.0](https://github.com/toidicakhia/morphe-app-patches/releases/tag/v1.7.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;19 patches total
<details open>
<summary><img src=".github/assets/apps/vn.vtv.vtvgo.png" alt="" height="20"> VTVGo&nbsp;&nbsp;•&nbsp;&nbsp;6 patches</summary>
<br>

**🎯 Supported versions:**

| 12.11.05 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block Product Ad Banners](#block-product-ad-banners) | Points the product-ad API endpoint at a non-existent path so in-app ad banners are not loaded. Best effort: ads embedded in content responses are not affected. |  |
| [Disable Analytics / Telemetry](#disable-analytics-telemetry) | Disables Firebase Analytics, Crashlytics and Performance, stops Sentry uploads and turns off Facebook app events. The firebase_data_collection_default_enabled flag also prevents the SDKs from re-enabling collection. |  |
| [Remove Ad ID Permissions](#remove-ad-id-permissions) | Removes the advertising ID, Privacy Sandbox ad-services and Play install-referrer permissions. Device identification used for device management is left untouched. |  |
| [Remove Calendar Permissions](#remove-calendar-permissions) | Removes calendar read/write permissions. Programme reminders will no longer work. |  |
| [Remove Video Ads](#remove-video-ads) | Removes VTVGo pre-roll, mid-roll, welcome TVC and other VAST/IMA ads by rejecting ad requests before playback starts. |  |
| [Trust User Certificates](#trust-user-certificates) | Adds user-installed CA certificates to the network security config so native traffic can be inspected with a debugging proxy. Flutter's Dart HTTP stack keeps its own trust store. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.ezviz.png" alt="" height="20"> EZVIZ&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 7.6.1.0824 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass SSL pinning](#bypass-ssl-pinning) | Bypasses EZVIZ certificate pinning and hostname checks so a debugging proxy can read its HTTPS traffic. Also trusts user-installed certificates. Not selected by default. |  |
| [Bypass Signature Check](#bypass-signature-check) | Skips the repack signature hash check in LoadingActivity that closes the app before it can start. |  |
| [Remove Ads](#remove-ads) | Removes banner, splash and hot open-screen ads. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.cloudflare.onedotonedotonedotone.png" alt="" height="20"> 1.1.1.1&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 6.38.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Analytics / Telemetry](#disable-analytics-telemetry) | Disables all Cloudflare telemetry by no-oping the analytics bundle builder and the Firebase event dispatchers. |  |
| [Disable SSL Pinning](#disable-ssl-pinning) | Bypasses OkHttp certificate pinning on Cloudflare API calls to allow TLS traffic inspection. |  |
| [Spoof WARP+ Unlimited UI](#spoof-warp-unlimited-ui) | Forces WarpPlusState to UNLIMITED on every AccountData instance by intercepting the primary constructor before the account type field is written. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.devolutions.remotedesktopmanager.png" alt="" height="20"> Remote Desktop Manager&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.3.1.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable Analytics / Telemetry](#disable-analytics-telemetry) | Disables Firebase Analytics, Crashlytics and Performance, including advertising-ID and app-set-ID collection. The Devolutions product telemetry is sent by the .NET code inside the AOT assemblies, use the app's "Disable sending analytics" option to turn it off. |  |
| [Disable SSL Pinning](#disable-ssl-pinning) | Bypasses the certificate validation of the .NET/Mono TLS stack so a debugging proxy can read the app's HTTPS traffic. Certificate pinning implemented in managed code lives in the ahead-of-time compiled .NET assemblies and is not affected. Not selected by default. |  |
| [Remove Ad ID Permissions](#remove-ad-id-permissions) | Removes the advertising ID, Privacy Sandbox ad-services and Play install-referrer permissions. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.dubox.drive.png" alt="" height="20"> TeraBox&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.27.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Blocks feed, banner, interstitial, app-open and video player ads on every page except Benefits, where rewarded ads stay available. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.camel.corp.universalcopy.png" alt="" height="20"> Universal Copy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Plus](#unlock-plus) | Unlocks Universal Copy Plus: removes ads, upgrade prompts and the Internet permission, and bypasses the PairIP license check so the patched app starts. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/cz.mroczis.netmonster.png" alt="" height="20"> NetMonster&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.0.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all premium features. |  |

</details>

<details open>
<summary><img src=".github/assets/apps/com.anetcapture.mock.png" alt="" height="20"> HTTP Sniffer&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.5.2-ad_mob | 2.4.9-ad_mob |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock VIP](#unlock-vip) | Forces permanent professional VIP tier, removes ads and upgrade popups, bypasses PairIP. |  |

</details>

<!-- PATCHES_END -->

&nbsp;

## 📲 How to use

1. Install [Morphe Manager](https://github.com/MorpheApp/morphe-manager) or
   [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop).
2. Add this source using the link at the top of this page, or add the generated
   `patches-bundle.json` URL manually.
3. Select the app and the patches you want, then apply them.
4. Install the patched APK. Uninstall the original app first if the signatures conflict.

> **Note:** patched APKs are signed with a different key. Back up app data before
> replacing the original app. Some patches intentionally remove permissions or
> features, such as the Internet permission in Universal Copy.

## 🛠️ Build from source

### Prerequisites

- JDK 21.
- Android SDK 36 (`ANDROID_HOME` or `sdk.dir` in `local.properties`).
- GitHub credentials with `read:packages` for the Morphe GitHub Packages registry.
  Set `GITHUB_ACTOR` / `GITHUB_TOKEN`, or add `gpr.user` / `gpr.key` to
  `~/.gradle/gradle.properties`.

```bash
export GITHUB_ACTOR=<your GitHub user>
export GITHUB_TOKEN=<token with read:packages>
export SHARED_MAPS_API_KEY=<optional Google Maps key for NetMonster>
```

### Build the patch bundle

```bash
./gradlew :patches:buildAndroid
```

The bundle is written to `patches/build/libs/patches-*.mpp`. Apply it with
Morphe Desktop, or with the Morphe CLI:

```bash
java -jar morphe-desktop.jar patch \
  -p patches/build/libs/patches-<version>.mpp \
  -e "Patch name" \
  app.apk
```

To refresh the generated patch list and README table locally:

```bash
./gradlew :patches:generatePatchesList
python3 .github/scripts/generate_patches_readme.py \
  toidicakhia/morphe-app-patches main patches-list.json README.md
```

## 📁 Project layout

- `patches/src/main/kotlin/app/apppatches/patches/` — patch code, grouped by app.
- `patches/src/main/kotlin/app/apppatches/patches/shared/` — compatibility declarations
  and shared patch helpers.
- `extensions/extension/` — Java code injected into patched apps.
- `.github/workflows/` — CI and release automation.
- `patches-list.json`, `patches-bundle.json`, `CHANGELOG.md` — generated by the release
  workflow. Do not edit them by hand.

## 🧑‍💻 Development workflow

- Make changes on the `dev` branch.
- Use [semantic commit](https://kapeli.com/cheat_sheets/Semantic_Commits.docset/Contents/Resources/Documents/index)
  messages:
  - `feat: add a new feature`
  - `fix: fix a problem`
  - `chore: a change that should not appear in the user-facing changelog`
- Releases are **not** created automatically. Run the
  [release workflow](.github/workflows/release.yml) manually from the Actions tab
  (**Run workflow**). [`.releaserc`](.releaserc) determines the version from the commit
  history.
- Run the workflow on `dev` for a pre-release and on `main` for a stable release.
- Do not create releases or edit generated files manually.

## 🤓 Tips

- See the [patcher documentation](https://github.com/MorpheApp/morphe-patcher/blob/main/docs/1_patcher_intro.md)
  for examples of patches and fingerprints.
- Do not force-push semantic-release commits. If a release is broken, create a new release
  instead of rewriting the old one.
- When adding support for a new app version, verify every fingerprint against the exact
  APK and update the compatibility target in `shared/Constants.kt`.

## 📜 License

App Patches are licensed under the [GNU General Public License v3.0](LICENSE).
