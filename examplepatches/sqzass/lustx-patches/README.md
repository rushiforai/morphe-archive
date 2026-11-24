# 🧩 Lustx Patches

> Custom patches for [Morphe](https://morphe.software) - mostly universal, some per-app - by [sqzass](https://github.com/sqzass).

## About

A grab-bag of patches for apps I actually use... mostly. Most of it is universal patches that work across a bunch of apps, with a few app-specific ones thrown in.

## Get started

Add this repo as a patch source in Morphe Manager:

```bash
https://github.com/sqzass/lustx-patches
```

That'll pull in all the current patches automatically.
---

## Developing

There's a little helper script in `scripts/` for decompiling the apps you're patching. Point it at whatever's in `apks/`, and it'll spit out Java, Smali, and resource output you can actually read.

```bash
python scripts/decompile.py
```

Note: anything you put in `apks/` gets processed and deleted once it's done. Nothing sticks around, unless you pass the `-k` flag (pass `-h` or `--help` in the `decompile.py` script).

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.30.0](https://github.com/sqzass/lustx-patches/releases/tag/v1.30.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;37 patches total
<details>
<summary>📦 PortDroid - Network Analysis&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 1.0.7 | 1.3.0 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bypass signature check](#bypass-signature-check) | Bypasses PortDroid's signature check so the re-signed app passes validation. |  |
| [Unlock Pro](#unlock-pro) | Unlocks PortDroid Pro features (forces the pro gate and billing status). |  |

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
| [Remove clip bumper](#remove-clip-bumper) | Removes the Postparty logo bumper from all exports. NOTE: I SUCK AT CODING, USE *MODIFIED* CLIPS. TRIM A SECOND OR ADD A STICKER! |  |

</details>

<details>
<summary>📦 Ninja VPN&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.4.13 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Forces Ninja VPN's premium mode state to PREMIUM at every server/cache write site. only some servers work (defaults to US if it doesn't). |  |

</details>

<details>
<summary>📦 VPN - Super Unlimited Proxy&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.37.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Forces Super VPN VIP state, premium UserInfo state, disables promo banners, and suppresses crown/privacy/TV paywall triggers. |  |

</details>

<details>
<summary>📦 MEGA&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 16.15.2(263201951)(c9da563417) |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks all MEGA Pro features and removes ads. i'm actually not entirely sure it works - think it's jst cosmetic lol. | • Pro tier |

</details>

<details>
<summary>📦 SD Maid 2/SE&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 2.2.3-rc0 |
| :---: |
| GitHub build, not APKMirror. |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Forces SD Maid SE FOSS upgrade state to Pro. |  |

</details>

<details>
<summary>🌐 Universal&nbsp;&nbsp;•&nbsp;&nbsp;27 patches</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow screen recording](#allow-screen-recording) | Clears FLAG_SECURE and disables secure surfaces so the app can be screen-recorded. |  |
| [Allow screenshots](#allow-screenshots) | Clears FLAG_SECURE from window flags so the app can be captured in screenshots. |  |
| [Allow text selection](#allow-text-selection) | Makes it so text can be selected and copied on apps that normally block it. |  |
| [Bypass root / emulator detection](#bypass-root-emulator-detection) | Bypasses root/emulator detection methods. |  |
| [Bypass screen recording detection](#bypass-screen-recording-detection) | Blinds display/recording callbacks and recorder-package checks. |  |
| [Bypass screenshot detection](#bypass-screenshot-detection) | Blinds MediaStore ContentObservers and screenshot FileObservers. | • Block MediaStore observers<br>• Block file observers |
| [Change package name](#change-package-name) | Renames the app package. | • Package name<br>• Update permissions<br>• Update provider authorities |
| [Change version name / code](#change-version-name-code) | Changes the manifest and BuildConfig version values. Current keeps the current one, duh, or just disable this patch. | • Version name<br>• Version code |
| [Custom font](#custom-font) | Overrides the app's typeface with a built-in font. | • Font family |
| [Disable ads](#disable-ads) | Neutralizes common ad SDKs (AdMob, Unity, Meta, AppLovin). |  |
| [Disable boot start-up](#disable-boot-start-up) | Prevents auto-start on boot. | • Also block update start-up |
| [Force dark / AMOLED theme](#force-dark-amoled-theme) | Forces AppCompat dark / AMOLED theme. | • Enable AMOLED / pure-black |
| [Force refresh rate](#force-refresh-rate) | Rewrites Surface.setFrameRate() to the selected refresh rate. | • Target refresh rate<br>• Patch Surface.setFrameRate() |
| [Forced-update bypass](#forced-update-bypass) | Neuters in-app forced-update gates. |  |
| [Hide app icon](#hide-app-icon) | Hides the app from the launcher. |  |
| [Remove PairIP](#remove-pairip) | Removes PairIP licensing and signature gates. Note: VM-based variants may still enforce checks natively. |  |
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

If you've got your own patches for other apps, feel free to host them in a separate repo and link them — no need to shove them in here. If you do open a PR, read the [contribution guidelines](CONTRIBUTING.md) first. Not sure how to structure a patch repo? The [Morphe patches template](https://github.com/morpheapp/morphe-patches-template) has a solid example.

## License

Lustx Patches are licensed under the [GNU General Public License v3.0](LICENSE), with a few extra conditions under GPLv3 Section 7 for keeping upstream notices and disclaimers.

- **Attribution (7b):** any use of this code, including derivative works, must keep all original notices and disclaimers.
- **Name & branding (7c & 7e):** derivative works must use their own distinct branding. The **Morphe** name, logos, and trademarks may not be used for the title or branding of derivative works (e.g., "Morphe Plus", "Morphe Expanded", "Morphe UserXYZ" are off-limits).

Full GPLv3 terms are in [LICENSE](LICENSE), and [NOTICE](NOTICE) covers Section 7 conditions and upstream attributions.
