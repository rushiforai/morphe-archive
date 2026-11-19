# 🧩 Lustx Patches

> **Lustx Patches by sqzass**  
> Custom patches for use with the Morphe app patcher.

## ❓ About

**Lustx Patches** is a custom patch bundle by **sqzass**, built for compatibility with the [Morphe](https://morphe.software) patcher ecosystem and based on prior work of the Morphe and [ReVanced](https://github.com/ReVanced) projects.

### How to use these patches

Add this repository source to Morphe Manager:
`https://github.com/sqzass/lustx-patches`

---

## 🛠️ Tools & Development

This repository includes a local helper tool for decompiling Android apps and split packages (`.apk`, `.apks`, `.xapk`, `.apkm`, `.aab`, `.zip`) to inspect Java sources, Smali bytecode, and Android resources when developing custom patches:

- **Decompile all app packages in `apks/`**:
  ```bash
  python scripts/decompile.py
  ```

_Note: All app files placed in `apks/` are processed and automatically deleted once decompilation successfully completes._

&nbsp;

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.23.0](https://github.com/sqzass/lustx-patches/releases/tag/v1.23.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;31 patches total
<details>
<summary>📦 PortDroid - Network Analysis&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) | Bypasses PortDroid's signature check so the re-signed app passes validation. |  |

</details>

<details>
<summary>📦 Pawxy - Fast VPN & Web Browser&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.15.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable media sniffer](#enable-media-sniffer) | Restores Pawxy's hidden media sniffer to the toolbar. |  |
| [Rate-us popup](#rate-us-popup) | Removes or rewrites the rate-us popup text. | • Remove popup entirely<br>• Dialog title<br>• Dialog body<br>• Confirm button |
| [Unlock premium](#unlock-premium) | Unlocks Pawxy premium features (VPN servers, removes paywall and upsell badges). |  |

</details>

<details>
<summary>📦 Postparty&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.7.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Remove clip bumper](#remove-clip-bumper) | Removes the Postparty logo bumper from all exports. |  |

</details>

<details>
<summary>📦 Radio Garden&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.0.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock subscription](#unlock-subscription) | Unlocks Radio Garden premium features (equalizer, sleep timer, removes ads). |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;25 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screen recording](#allow-screen-recording) | Clears FLAG_SECURE and disables secure surfaces so the app can be screen-recorded. |  |
| [Allow screenshots](#allow-screenshots) | Clears FLAG_SECURE from window flags so the app can be captured in screenshots. |  |
| [Allow text selection](#allow-text-selection) | Makes it so text can be selected and copied on apps that normally block it. |  |
| [Bypass root / emulator detection](#bypass-root-emulator-detection) | Bypasses root/emulator detection methods. |  |
| [Change package name](#change-package-name) | Renames the app package. | • Package name<br>• Update permissions<br>• Update provider authorities |
| [Change version name / code](#change-version-name-code) | Changes the manifest and BuildConfig version values. Current keeps the current one, duh, or just disable this patch. | • Version name<br>• Version code |
| [Custom font](#custom-font) | Overrides the app's typeface with a built-in font. | • Font family |
| [Disable ads](#disable-ads) | Neutralizes common ad SDKs (AdMob, Unity, Meta, AppLovin). |  |
| [Disable boot start-up](#disable-boot-start-up) | Prevents auto-start on boot. | • Also block update start-up |
| [Force dark / AMOLED theme](#force-dark-amoled-theme) | Forces AppCompat dark / AMOLED theme. | • Enable AMOLED / pure-black |
| [Force refresh rate](#force-refresh-rate) | Rewrites Surface.setFrameRate() to the selected refresh rate. | • Target refresh rate<br>• Patch Surface.setFrameRate() |
| [Forced-update bypass](#forced-update-bypass) | Neuters in-app forced-update gates. |  |
| [Hide app icon](#hide-app-icon) | Hides the app from the launcher. |  |
| [Remove PairIP](#remove-pairip) | Removes the PairIP Play licensing gate. |  |
| [Remove rate-us / review prompts](#remove-rate-us-review-prompts) | Suppresses in-app rating/review prompts. | • Block Play Core review dialog |
| [Rename app label](#rename-app-label) | Sets a literal launcher name. | • App label |
| [Skip splash](#skip-splash) | Skips splash/intro screens. | • Convert splash delays to immediate |
| [Spoof device identity](#spoof-device-identity) | Spoofs Android ID, MAC, SIM/carrier and Build fields. | • Spoof Android ID<br>• Android ID value<br>• Spoof MAC address<br>• MAC address value<br>• Spoof SIM / carrier<br>• SIM preset<br>• Spoof device / Build fields<br>• Device preset<br>• Also spoof OS version |
| [Spoof install source](#spoof-install-source) | Makes the app believe it was installed from a chosen store (Play Store by default). | • Install source |
| [Spoof rooted environment](#spoof-rooted-environment) | Spoofs root checks and Build fields. | • Spoof Build fields |
| [Strip VPN checks](#strip-vpn-checks) | Hides active VPN from the app. | • Also strip interface-name checks |
| [Strip sensitive permissions](#strip-sensitive-permissions) | Removes selected sensitive permissions from the manifest. | • Location<br>• Contacts & accounts<br>• SMS & call log<br>• Phone<br>• Camera & microphone<br>• Storage / media<br>• Sensors & activity<br>• Calendar<br>• Nearby devices<br>• Notifications |
| [Telemetry / crash-reporter kill](#telemetry-crash-reporter-kill) | No-ops analytics, crash-reporting and telemetry SDK calls. | • Also kill SDK initialization |
| [Toast on launch](#toast-on-launch) | Shows a Toast when the app launches. | • Toast message<br>• Long duration |
| [Universal cleanup](#universal-cleanup) | Removes junk metadata files and (optionally) strips debug logging calls. | • Strip debug logging<br>• Remove Kotlin module metadata |

</details>

<!-- PATCHES_END -->

## Contributing

If you have developed patches for other apps, you are encouraged to release your patches in a third party repository rather than request them to be added to mine (unless you don't want to deal with pushing... for whatever reason).
See the [Patches template](https://github.com/morpheapp/morphe-patches-template) for more information.

Before opening a pull request, read the [contribution guidelines](CONTRIBUTING.md).

## 📜 License

Lustx Patches are licensed under the [GNU General Public License v3.0](LICENSE), with additional conditions under GPLv3 Section 7 preserving upstream notices and disclaimers.

- **Attribution (7b):** Any use of this code, including derivative works, must preserve all original notices and disclaimers.
- **Name & Branding Restrictions (7c & 7e):** Derivative works must use their own distinct branding. The **"Morphe"** name, logos, and trademarks may not be used for the branding or title of derivative works (e.g., names like _"Morphe Plus"_, _"Morphe Expanded"_, or _"Morphe UserXYZ"_ are strictly prohibited).

See the [LICENSE](LICENSE) file for full GPLv3 terms and the [NOTICE](NOTICE) file for full conditions of GPLv3 Section 7 and upstream attributions.
