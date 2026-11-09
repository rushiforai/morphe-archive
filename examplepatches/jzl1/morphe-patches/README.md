## ❓ About

Patches for some apps I use myself.

[Add it to morphe](https://morphe.software/add-source?github=jzl1/morphe-patches)

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.4.0](https://github.com/jzl1/morphe-patches/releases/tag/v1.4.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;13 patches total
<details open>
<summary>📦 Network Signal Guru&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**🎯 Supported versions:**

| 4.8.8 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Bundle QuickTest configuration](#bundle-quicktest-configuration) | Adds the stock QTRUN-signed configuration.xml and skips the native config-integrity mismatch gate, so the app can start without a fresh /cgi/report response. |  |
| [Export AdvancedActivity (test only)](#export-advancedactivity-test-only) | Marks AdvancedActivity as exported for adb-based license-state verification. Disabled by default; not needed for normal use. |  |
| [Unlock Ultimate](#unlock-ultimate) | Unlocks all Ultimate features and makes the app usable on a clean install by bundling a signed config and bypassing the native config-integrity gate. |  |

</details>

<details open>
<summary>📦 analiti&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.10.99133 | 2026.10.98884 | 2026.10.98554 |
| :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable telemetry](#disable-telemetry) | Forces Firebase analytics and crash reporting off, ignoring the in-app privacy toggles and their defaults. |  |
| [Hide sign-in banner](#hide-sign-in-banner) | Removes the orange "Sign in" prompt below the toolbar. The account screen stays reachable from the drawer. |  |
| [Neutralize tamper fork bomb](#neutralize-tamper-fork-bomb) | Stops the native anti-tamper response that spawns unbounded threads and crashes the app a few seconds after launch on a repackaged build. |  |
| [Skip update attestation](#skip-update-attestation) | Stops the app updater from sending the client key and Android Keystore attestation chain to analiti.com during its version check. Other backend calls are unaffected. |  |
| [Unlock Expert](#unlock-expert) | Unlocks the Expert tier and disables the PairIP licence check. |  |

</details>

<details open>
<summary>📦 Yamby&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2.1.0.11 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Pro row](#hide-pro-row) | Removes the Yamby Pro row from Settings. Pro features remain unlocked by the Unlock Pro patch. |  |
| [Unlock Pro](#unlock-pro) | Unlocks all Yamby Pro features by seeding a local licence code, making the client-side HMAC comparator accept it, and forcing the cached list-animation entitlement flag. No Play purchase is required. |  |

</details>

<details open>
<summary>📦 JuiceSSH&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.2.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks JuiceSSH Pro features without a Play purchase by forcing the client-side entitlement and signature checks. Online features (CloudSync, TeamShare, EC2 Link, plugin repository, purchase/restore) will not work because api.sonelli.com is offline. |  |

</details>

<details open>
<summary>📦 LTE Discovery&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 7.6.33 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Unlocks Pro and Pro Plus features by forcing the two client-side BillingEntitlements predicates to true. Also disables Google PairIP App Licensing so the repackaged build can start. |  |
| [Unlock Pro Plus / Donate](#unlock-pro-plus-donate) | Marks the Pro Plus / Donate (e6) tier as owned. It does not add any feature beyond Pro Plus - the only visible effect is the 'Pro Plus / Donate' label and the supporter badge. Requires Unlock Pro. |  |

</details>

<!-- PATCHES_END -->
