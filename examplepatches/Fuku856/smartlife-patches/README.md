# 🧩 SmartLife Patches

Patches for the SmartLife (com.tuya.smartlife) app, for use with Morphe. Removes the intrusive Hey Tuya AI entry points added in app 7.0, in-app ads and telemetry.

## ❓ About

SmartLife 7.0+ was rebuilt around the "Hey Tuya" AI assistant and shows in-app ads when no system-level ad blocker is present. These patches turn those off and let you keep the app usable.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Fuku856/smartlife-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.1](https://github.com/Fuku856/smartlife-patches/releases/tag/v1.2.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;8 patches total
<details open>
<summary>📦 SmartLife&nbsp;&nbsp;•&nbsp;&nbsp;8 patches</summary>
<br>

**🎯 Supported versions:**

| 7.12.6 | 7.12.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable telemetry](#disable-telemetry) | Disables Firebase Analytics/Crashlytics and automatic page tracking, and stops the app's analytics, log-upload and attribution subsystems from starting. | • Disable Firebase<br>• Disable page tracking<br>• Stop tracking subsystems |
| [Hide AI assistant](#hide-ai-assistant) | Hides the "Hey Tuya" AI assistant added in app 7.0 (the AI bar on the home and smart tabs, the device-panel floating ball, the launcher shortcut and the other entry points). This is a runtime toggle: it can be turned on and off in the in-app "SmartLife Patches" settings screen (long-press the settings button in the profile tab, or the Settings screen toolbar). Hidden by default. |  |
| [Hide Smart App tab](#hide-smart-app-tab) | Hides the "Smart App" tab (AI app builder) at the top of the smart tab. This is a runtime toggle in the in-app "SmartLife Patches" settings screen. Hidden by default. |  |
| [Hide ads](#hide-ads) | Disables in-app ads (including the AdMob native ad on the home screen), promotional banners, ad push, and ad-related attribution. Stops the corresponding advertising subsystems and removes Home/Profile ad entries. | • Stop ad subsystems<br>• Remove Home/Profile ad entries<br>• Remove ad services (experimental) |
| [Hide home recommendations](#hide-home-recommendations) | Hides the "おすすめ" (Recommended) cards on the home screen. This is a runtime toggle in the in-app "SmartLife Patches" settings screen. Hidden by default. |  |
| [Hide scene recommendations](#hide-scene-recommendations) | Hides the recommended scenes ("お勧め") shown under the automation and tap-to-run lists of the smart tab. This is a runtime toggle in the in-app "SmartLife Patches" settings screen. Hidden by default. |  |
| [SmartLife Patches settings](#smartlife-patches-settings) | Adds two ways to open the in-app "SmartLife Patches" settings screen: long-press the settings button at the top of the profile tab, or long-press the toolbar of the app's Settings screen. |  |
| [Spoof signature](#spoof-signature) | Keeps the original APK signature visible to the app after re-signing, so the app's integrity self-check passes instead of showing "integrity check failed" and quitting, and so email/phone + password login keeps working. Enabled by default because the app does not start without it. |  |

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
