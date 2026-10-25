## ❓ About

Patches for some apps I use myself.

[Add it to morphe](https://morphe.software/add-source?github=jzl1/morphe-patches)

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/jzl1/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;7 patches total
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
<summary>📦 analiti&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.10.98884 | 2026.10.98554 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable telemetry](#disable-telemetry) | Forces Firebase analytics and crash reporting off, ignoring the in-app privacy toggles and their defaults. |  |
| [Hide sign-in banner](#hide-sign-in-banner) | Removes the orange "Sign in" prompt below the toolbar. The account screen stays reachable from the drawer. |  |
| [Neutralize tamper fork bomb](#neutralize-tamper-fork-bomb) | Stops the native anti-tamper response that spawns unbounded threads and crashes the app a few seconds after launch on a repackaged build. |  |
| [Unlock Expert](#unlock-expert) | Unlocks the Expert tier and disables the PairIP licence check. |  |

</details>

<!-- PATCHES_END -->
