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
> **[v1.8.3](https://github.com/ch3thanhs/stylus/releases/tag/v1.8.3)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;9 patches total
<details open>
<summary>📦 GitHub&nbsp;&nbsp;•&nbsp;&nbsp;4 patches</summary>
<br>

**Package name:** `com.github.android`

**🎯 Supported versions:**

| 1.282.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Custom font (GitHub)](#custom-font-github) | Replaces GitHub's bundled Inter and Mona Sans UI fonts with a custom font file. | • Custom font |
| [Custom monospace font (GitHub)](#custom-monospace-font-github) | Replaces GitHub's bundled Roboto Mono code font with a custom monospace font file. | • Custom monospace font |
| [Force system font (GitHub)](#force-system-font-github) | Renders GitHub UI text using the device system font by overriding bundled font resources at runtime. |  |
| [Force system font (including monospace) (GitHub)](#force-system-font-including-monospace-github) | Renders GitHub UI and monospace text using the device system UI font. |  |

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
| [Custom font (Where is my Train)](#custom-font-where-is-my-train) | Replaces Where is my Train's bundled Google Sans, Nunito Sans, and Roboto UI fonts with a custom font file. Optional OpenType feature settings can enable alternate digits such as Inter's ss01 open-style numbers. | • Custom font<br>• Font feature settings |
| [Force system font (Where is my Train)](#force-system-font-where-is-my-train) | Renders the app using the device's system font instead of Google Sans / Nunito Sans. |  |

</details>

<details open>
<summary>📦 Bitwarden&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**Package name:** `com.x8bit.bitwarden`

**🎯 Supported versions:**

| 2026.10.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Force system font (Bitwarden)](#force-system-font-bitwarden) | Renders the app using the device's system font instead of DM Sans / Roboto. |  |

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
| [Force system font (Telegram)](#force-system-font-telegram) | Renders the app using the device's system font instead of Telegram's bundled font. |  |

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
| [Force system font (Telegram)](#force-system-font-telegram) | Renders the app using the device's system font instead of Telegram's bundled font. |  |

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
