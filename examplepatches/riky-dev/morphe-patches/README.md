# 👋🧩 riky's patches

## ❓ About

Personal Morphe patch bundle (ad removal, unlocks, and experiments).

This project is a fork of the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template) by the Morphe contributors, extended with additional patches and development tooling.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=riky-dev/morphe-patches

Stable releases come from `main`. To try preview builds from `dev`, enable **pre-release** for this source in Morphe Manager.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.2.0](https://github.com/riky-dev/morphe-patches/releases/tag/v1.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 CapCut&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**🎯 Supported versions:**

| 19.2.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide AI Lab Tab](#hide-ai-lab-tab) | Removes the third bottom navigation tab ('AI Lab' / 'Lab. IA') by forcing its visibility observer to always hide the tab. |  |
| [Hide False Hopes Features](#hide-false-hopes-features) | Hides 'IA ultra HD' (Export Super Resolution) and 'Flusso ottico' (Slow Motion Optical Flow) options since they are cloud-gated. |  |
| [Remove security notice](#remove-security-notice) | Suppresses the modified-build security notice by disabling the risk SDK dialog entry point and the isCracking flag writer. |  |
| [Suppress Telemetry and Trackers](#suppress-telemetry-and-trackers) | Disables background monitoring and analytics frameworks including ByteDance Helios, AppLog, and AppsFlyer. |  |
| [Unlock Premium](#unlock-premium) | Forces the VIP flag to true so premium features are unlocked client-side. Server-validated assets (cloud effects/templates) are not affected. |  |

</details>

<details open>
<summary>📦 Electron: battery health info&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 3.0.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Spoofs premium/unlocked state to disable ad-gated behavior. |  |

</details>

<details open>
<summary>📦 3BMeteo&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.9.15 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide ads](#hide-ads) | Removes banner, native, cover and interstitial ads and unlocks premium features. |  |

</details>

<details open>
<summary>📦 Komoot&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 2026.34.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium features](#unlock-premium-features) | Unlock Premium features. Some features are not possible to patch (server sided), such as saving a multi-days hike. |  |
| [Unlock map regions](#unlock-map-regions) | Spoof Komoot Maps ownership client-side (world pack / owned regions in shop and offline UI). Server-side limits may still apply: offline tile download auth, sync overwriting local state, and Play receipt validation. Does not replace a real Play Store purchase. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

```bash
make build
# or: ./gradlew :patches:buildAndroid
```

The built `.mpp` is at `patches/build/libs/patches-*.mpp`. Apply it with [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop) or Morphe Manager.

### 🧑‍💻 Developing patches

See **[AGENTS.md](AGENTS.md)** for the full agent-oriented guide. Independent tools live in `scripts/` and `Makefile`:

```bash
make check                    # environment preflight
make fetch APP=meteo3b        # download app bundle
make extract APP=meteo3b        # unzip to analysis/meteo3b/extract/
make decompile APP=meteo3b      # jadx + apktool output
make analyze APP=meteo3b        # optional analysis hints (not a patch plan)
make build && make verify APP=meteo3b
```

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 🚑 Troubleshooting

Patches modify bytecode, but some failures happen **before** any patch runs — at APK install time. These are device/package-state issues, not patch bugs.

### `INSTALL_FAILED_UPDATE_INCOMPATIBLE` (signatures do not match)

The patched APK is signed with a different key than the CapCut already on the device. Uninstall the existing CapCut first, then install the patched build.

### `INSTALL_FAILED_VERSION_DOWNGRADE` (update version code is older)

Android reports a **per-user** install. A normal uninstall from your main profile can leave a copy in a work profile, an OEM "Dual app"/"App clone" (Samsung Dual Messenger, Xiaomi Dual apps, etc.), or as a pending uninstall — and that leftover still blocks the install.

Fixes, easiest first:

1. **Choose a CapCut APK that is newer than or equal to the one installed.** You don't edit anything — just select a CapCut APK file that's the same age or newer than what's on your phone as the patch source. The patched output keeps that APK's `versionCode`, so patching a newer CapCut can never be a downgrade. (The common advice to use the ~271 MB `com.lemon.lvoverseas_19.2.0-19201600_…` build is exactly this — pick a version ≥ what's on your device.)
2. **Remove the leftover copy:**
   - Turn off CapCut in your phone's *Dual apps / App twin / Parallel Apps* setting.
   - For a work profile: Settings → *Passwords & accounts* (or *Work profile*) → remove the work profile.
3. **From a PC (most reliable):** fully remove it for every user, then reinstall:
   ```bash
   adb shell pm list packages --all-users | grep -i lemon   # find the offending user id
   adb uninstall --user 10 com.lemon.lvoverseas            # repeat for each user shown
   adb uninstall com.lemon.lvoverseas
   ```
4. **Without a PC (no root):** install **Shizuku** + a shell app (e.g. **aShell** / **App Manager**), pair it via *Wireless debugging*, then run the same `pm uninstall --user <id> com.lemon.lvoverseas` command locally.

## 📜 License

riky's patches are licensed under the [GNU General Public License v3.0](LICENSE).

This project is based on the [Morphe patches template](https://github.com/MorpheApp/morphe-patches-template). Copyright (C) 2025 Morphe contributors. Modifications copyright (C) 2026 [riky-dev](https://github.com/riky-dev).

See [NOTICE](NOTICE) for Morphe branding restrictions and additional terms.
