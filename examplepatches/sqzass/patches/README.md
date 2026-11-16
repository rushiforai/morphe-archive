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
> **[v1.21.0](https://github.com/sqzass/lustx-patches/releases/tag/v1.21.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;29 patches total
<details>
<summary>📦 PortDroid - Network Analysis&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.0.7 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) | Forces TamperCheck.validateAppSignature to true. Patched builds are re-signed, so the app's three hardcoded certificate SHA-1 hashes no longer match. |  |

</details>

<details>
<summary>📦 Pawxy - Fast VPN & Web Browser&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 1.15.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Enable media sniffer](#enable-media-sniffer) | Restores Pawxy's hidden video/media sniffer to the default tool menu. The toolbar builder excludes Tool$Action.SNIFFER from the default list; this patch removes that exclusion so the sniffer appears like any other tool. |  |
| [Rate-us popup](#rate-us-popup) | Either removes the rate-us popup entirely, or rewrites its text. Rewrite mode changes the dialog title/body/buttons. Remove mode kills the trigger so the popup never appears. | • Remove popup entirely<br>• Dialog title<br>• Dialog body<br>• Confirm button |
| [Unlock premium](#unlock-premium) | Unlocks Pawxy premium features (VPN servers, removes paywall and upsell badges). |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;25 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screen recording](#allow-screen-recording) | Clears FLAG_SECURE and disables secure surfaces so the app can be screen-recorded. |  |
| [Allow screenshots](#allow-screenshots) | Clears FLAG_SECURE from window flags so the app can be captured in screenshots. |  |
| [Allow text selection](#allow-text-selection) | Flips setTextIsSelectable(false)/setLongClickable(false) to true so text can be selected and copied. |  |
| [Bypass root / emulator detection](#bypass-root-emulator-detection) | Forces common root and emulator detection methods to report clean. Covers Java/Kotlin-level checks in app code; library packages and native (.so) detection are not affected. |  |
| [Change package name](#change-package-name) | Renames the app package (appends ".lustx" by default) and updates custom permissions and content-provider authorities. Changing the package name can break apps that hardcode their package or authorities in code. | • Package name<br>• Update permissions<br>• Update provider authorities |
| [Change version name / code](#change-version-name-code) | Rewrites the manifest versionName/versionCode and the baked-in BuildConfig values. 'Current' keeps the existing value. | • Version name<br>• Version code |
| [Custom font](#custom-font) | Overrides the app's typeface with a built-in font family. Affects explicit Typeface usage; views that never set a typeface keep the system default. | • Font family |
| [Disable ads](#disable-ads) | Neutralizes common ad SDKs (AdMob, Unity, Meta, AppLovin) by forcing their void load/show sinks to no-op and their boolean readiness predicates to false. Object-returning APIs are left intact to avoid null returns. Missing SDKs are skipped, so this is safe as a universal patch. Tradeoff: rewarded-ad gates never complete, so 'watch an ad to unlock' flows dead-end. |  |
| [Disable boot start-up](#disable-boot-start-up) | Prevents the app from auto-starting on device boot by removing boot intent-filter actions and the RECEIVE_BOOT_COMPLETED permission. | • Also block update start-up |
| [Force dark / AMOLED theme](#force-dark-amoled-theme) | Forces AppCompat night mode to YES and (optionally) flips AMOLED/pure-black flags. Covers AppCompat/Material apps; Jetpack Compose themes are not affected. | • Enable AMOLED / pure-black |
| [Force refresh rate](#force-refresh-rate) | Rewrites the float argument at Surface.setFrameRate() call sites to the selected refresh rate. This only affects apps that already request a frame rate; it does not globally force a display mode. Missing call sites are skipped safely. | • Target refresh rate<br>• Patch Surface.setFrameRate() |
| [Forced-update bypass](#forced-update-bypass) | Neuters in-app forced-update gates (dialogs, blocking checks, version prompts). Works on apps that keep readable method names; fully-obfuscated apps need per-app fingerprints. |  |
| [Hide app icon](#hide-app-icon) | Hides the app from the launcher by replacing the LAUNCHER category with DEFAULT. The app stays installed; launch it via another app or a shortcut. |  |
| [Remove PairIP](#remove-pairip) | Removes the PairIP Play licensing gate (startup license check, response validation, repeated checks and paywall/kill path). Does not bypass PairIP native virtualization or Play Integrity attestation. |  |
| [Remove rate-us / review prompts](#remove-rate-us-review-prompts) | Suppresses in-app rating/review dialogs and gates. Optionally blocks the Play Core system review dialog (may crash apps that don't null-check the returned Task). | • Block Play Core review dialog |
| [Rename app label](#rename-app-label) | Sets a literal launcher name on <application>, launcher activities and aliases. 'Current' keeps the existing label. | • App label |
| [Skip splash](#skip-splash) | Skips splash/intro screens by running their deferred navigation immediately and removing artificial sleeps. Scoped to splash-named Activity/Fragment classes. | • Convert splash delays to immediate |
| [Spoof device identity](#spoof-device-identity) | Unified device spoofing with per-category toggles: Android ID, MAC address, SIM/carrier, and Build device fields. Includes emulator presets. Library packages keep the real device so their internal behavior is unaffected. | • Spoof Android ID<br>• Android ID value<br>• Spoof MAC address<br>• MAC address value<br>• Spoof SIM / carrier<br>• SIM preset<br>• Spoof device / Build fields<br>• Device preset<br>• Also spoof OS version |
| [Spoof install source](#spoof-install-source) | Makes the app believe it was installed from a chosen store (Play Store by default). | • Install source |
| [Spoof rooted environment](#spoof-rooted-environment) | Makes Java-level root checks report rooted: forces named detection methods true, spoofs Build.TAGS/USER/HOST at read sites, and forces su-path file checks to succeed. String/field-based targeting survives obfuscation. Native checks and Runtime.exec("su") are not faked. | • Spoof Build fields |
| [Strip VPN checks](#strip-vpn-checks) | Hides an active VPN from the app by neutralizing NetworkCapabilities transport/capability checks and (optionally) network-interface name checks. | • Also strip interface-name checks |
| [Strip sensitive permissions](#strip-sensitive-permissions) | Removes selected sensitive permissions from the manifest. Can break features that rely on them; enable only the groups you want stripped. | • Location<br>• Contacts & accounts<br>• SMS & call log<br>• Phone<br>• Camera & microphone<br>• Storage / media<br>• Sensors & activity<br>• Calendar<br>• Nearby devices<br>• Notifications |
| [Telemetry / crash-reporter kill](#telemetry-crash-reporter-kill) | Silences common analytics, crash-reporting, attribution, session-replay and telemetry SDKs by forcing void logging/tracking sinks and boolean readiness predicates to no-op. Object-returning SDK methods are left intact to avoid null return crashes. Missing SDKs are skipped, so this is safe as a universal patch. | • Also kill SDK initialization |
| [Toast on launch](#toast-on-launch) | Shows a Toast when the app starts by injecting framework Toast calls into the Application subclass's onCreate(). Pure inline smali — adds no classes or methods. No-op, never crashes, if the app has no custom Application, does not override onCreate, or its onCreate has too few free registers. | • Toast message<br>• Long duration |
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
