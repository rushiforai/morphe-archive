# Stylus

A collection of font-related [Morphe](https://morphe.software) patches to improve readability/accessibility.

> [!NOTE]
> **Experimental & AI-Assisted**  
> These patches were created with AI assistance and have only been tested on my personal device. Please review the source code carefully and use them at your own risk.

> [!IMPORTANT]
> **Telegram** dependency
>
> Telegram font patch needs the `Bypass integrity check` patch from - [Doom's Morphe Patches](https://github.com/rushiranpise/morphe-patches/blob/main/PATCHES.md#telegram-orgtelegrammessenger)


## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.9.0](https://github.com/ch3thanhs/stylus/releases/tag/v1.9.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Bitwarden&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.x8bit.bitwarden`

**🎯 Supported versions:**

| 2026.10.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom font](#custom-font) | Replaces the bundled DM Sans UI fonts with your own font. | • Custom font<br>• Font feature settings |
| [Custom monospace font](#custom-monospace-font) | Replaces the bundled Roboto Mono font with your own monospace font. | • Custom monospace font |
| [Force system font](#force-system-font) | Uses the device's system font for UI text. Monospace text keeps its bundled font. |  |

</details>

<details open>
<summary>📦 GitHub&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.github.android`

**🎯 Supported versions:**

| 1.282.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom font](#custom-font) | Replaces the bundled Inter and Mona Sans UI fonts with your own font. | • Custom font |
| [Custom monospace font](#custom-monospace-font) | Replaces the bundled Roboto Mono code font with your own monospace font. | • Custom monospace font |
| [Force system font](#force-system-font) | Uses the device's system font for UI text. |  |
| [Force system font (including monospace)](#force-system-font-including-monospace) | Uses the device's system font for UI and monospace text. |  |

</details>

<details open>
<summary>📦 Where is my Train&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.whereismytrain.android`

**🎯 Supported versions:**

| 7.1.5.974952539 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom font](#custom-font) | Replaces the bundled Google Sans, Nunito Sans, and Roboto UI fonts with your own font. | • Custom font<br>• Font feature settings |
| [Force system font](#force-system-font) | Uses the device's system font for UI text. |  |

</details>

<details open>
<summary>📦 Telegram&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `org.telegram.messenger`

**🎯 Supported versions:**

| 13.1.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force system font](#force-system-font) | Uses the device's system font for all app text. |  |

</details>

<details open>
<summary>📦 Telegram (web version)&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `org.telegram.messenger.web`

**🎯 Supported versions:**

| 13.1.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force system font](#force-system-font) | Uses the device's system font for all app text. |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

<a href="https://morphe.software/add-source?github=ch3thanhs/stylus">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Or manually add this repository url as a patch source in Morphe: https://github.com/ch3thanhs/stylus

### Building

To build Stylus,
you can follow the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation).

## License

Stylus is licensed under the [GNU General Public License v3.0](LICENSE)
