# 👋🧩 MacroFactor Morphe Patches

## ❓ About

Morphe patches for **MacroFactor** (`com.sbs.diet`) only — forked from
[Beyonder Morphe Patches](https://github.com/callMeBeyonder/morphe-patches), stripped down
to the MacroFactor patches with the release pipeline intact.

> [!IMPORTANT]
> **Root required.** MacroFactor is shielded by Google Play PairIP and its premium/unlock
> patches also spoof the signing certificate hash, so the patched build must be mounted over
> the genuine Play-signed install (`requireRootMount`) — a normal sideload will not run.

### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=Parideboy/macrofactor-patches

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/Parideboy/macrofactor-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 MacroFactor&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.8.11 | 5.8.13 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Root)](#unlock-premium-root) | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<details open>
<summary>📦 MacroFactor Workouts&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.4.3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium (Root)](#unlock-premium-root) | Unlocks all premium features. Requires root: the patched build must be mounted over the genuine Play-signed install — a re-signed sideload will not work. |  |

</details>

<details open>
<summary>📦 Targapp&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 4.10.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Pro](#unlock-pro) | Reports an active RevenueCat entitlement to the Flutter layer, unlocking the Pro surfaces the app computes on-device (Pro badge, paywall bypass, report customization). Pro work executed by Targapp's backend (AI report compilation, revision requests) still requires a real subscription. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

MacroFactor Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
