# 🌸 Gracie Patches

<p align="center">🌷 · 💐 · 🪻 · 🌼 · 🌸</p>

A little garden of **[Morphe](https://morphe.software)** patches for the apps I open every single day. I started it to learn how patching works, and I keep adding to it as I go.

> [!NOTE]
> Unofficial and not made by the Morphe team. I build these with the help of AI and try them on my own phone, so something may not behave the same on yours.

## 🌿 Add it to Morphe

Tap the button, or paste the link as a source in Morphe Manager:

<a href="https://morphe.software/add-source?github=Sabrina-Moonlight/gracie-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

```
https://github.com/Sabrina-Moonlight/gracie-patches
```

## 🌷 Available patches

<!-- PATCHES_START -->
> **[v1.0.72](https://github.com/Sabrina-Moonlight/gracie-patches/releases/tag/v1.0.72)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;16 patches total
<details open>
<summary>🌸 Orientation Control&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `net.mm2d.android.orientationfaker`

**🌻 Supported versions:**

| 7.10.3 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Ads](#disable-ads) | Removes ads from Orientation Control. |  |

</details>

<details open>
<summary>🌸 Glass Widgets&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.jndapp.glass.widgets`

**🌻 Supported versions:**

| 1.0.2 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Pairip](#disable-pairip) | Restores the normal app entry and recovers offline method bodies so the app can keep running. |  |
| [Local Preference](#local-preference) | Uses a local preference so optional widget features stay available offline. |  |
| [Remove Pairip Protection](#remove-pairip-protection) | Skips the local license check entry point. |  |

</details>

<details open>
<summary>🌸 Minimal Widgets&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.jndapp.minimal.widgets`

**🌻 Supported versions:**

| 2.2.11 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Pairip](#disable-pairip) | Skips the local license and integrity checks so the app can keep running offline. |  |
| [Local Preference](#local-preference) | Uses a local preference so optional widget features stay available offline. |  |

</details>

<details open>
<summary>🌸 Quick Settings&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `it.simonesestito.ntiles`

**🌻 Supported versions:**

| 12.0.3-17888438 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Pairip](#disable-pairip) | Skips the local license and integrity checks so the app can keep running offline. |  |
| [Hide Ads Preference](#hide-ads-preference) | Uses a local preference so interstitial and banner ads stay off. |  |

</details>

<details open>
<summary>🌸 Screen Recording App&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `de.twokit.screen.recording.app`

**🌻 Supported versions:**

| 1.11 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Pairip](#disable-pairip) | Skips the local license and integrity checks so the app can keep running offline. |  |
| [Pro Options](#pro-options) | Uses a local preference so optional Pro options stay available. |  |

</details>

<details open>
<summary>🌸 Themezy&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.themezy.theme.iconwidgets`

**🌻 Supported versions:**

| 1.0.9 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Disable Pairip](#disable-pairip) | Skips the local license check so the app can keep running offline. |  |
| [Hide Ads](#hide-ads) | Turns off every ad gate and every show/preload path in Themezy. |  |
| [Unlock Local](#unlock-local) | Marks icons, wallpapers and widgets as unlocked so only Add/Apply shows, never Unlock. |  |

</details>

<details open>
<summary>🌸 Aesthetic Widgets&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.remi.widget`

**🌻 Supported versions:**

| 85.1.4 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Local Features](#local-features) | Uses a local preference so optional widget features stay available offline. |  |

</details>

<details open>
<summary>🌸 Glassix: Glass Widgets & Theme&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.saban.glassy.glasswidgets.themes`

**🌻 Supported versions:**

| 1.0.3 |
| :---: |

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Local Premium](#local-premium) | Uses a local preference so premium widgets and no-ads stay available offline. |  |

</details>

<details open>
<summary>🌼 Universal&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 🌷&nbsp;Patch | 💐&nbsp;Description | 🪻&nbsp;Options |
|----------|----------------|-----------|
| [Clone app](#clone-app) | Changes the app package name and label so you can install several clones. Pick a clone number (1–50). Each number is a different package (app.clone1, app.clone2…). On update, re-apply the same number on each clone. | • Clone number<br>• Custom package (optional)<br>• Update permissions<br>• Update providers |

</details>

<!-- PATCHES_END -->

## 🛠️ Behind the scenes

The AI writes the changes, following the rules in [`AGENTS.md`](AGENTS.md) and the notes in [`Morphe-Development-Guide.md`](Morphe-Development-Guide.md). Then:

1. I upload the files to `Drop-Files/`.
2. **Sort Uploads** puts each one in its place.
3. **Release** builds the patches and publishes them by itself.

## 🔧 Build it yourself

You don't have to: **Release** already does it. But if you want to:

- Run `./gradlew buildAndroid`
- Your `.mpp` file will be in `patches/build/libs/patches-*.mpp`

More details in the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## 📄 License

Gracie Patches uses the [GNU General Public License v3.0](LICENSE). See also [NOTICE](NOTICE).

<p align="center">🌸 · 💐 · 🪻 · 🌼 · 🌷</p>
