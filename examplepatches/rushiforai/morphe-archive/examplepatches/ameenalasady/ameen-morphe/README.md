# 🛠️ Ameen's Morphe Patches

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)

**A collection of modern, powerful patches for various Android apps using the Morphe framework.**

## 📱 Supported Apps

### 🥗 Foodvisor
[Foodvisor](https://www.foodvisor.io/) is an AI-powered nutrition coach. Our patches unlock premium features to help you track your nutrition more effectively.

### 🖼️ PhotoGrid
[PhotoGrid](https://www.photogrid.app/) is a popular photo and video editing app. Our patches unlock premium features, removing limits and watermarks.

## 🩹 What are Morphe Patches?
Morphe Patches are bytecode-level modifications that enhance the functionality of Android applications. They allow you to apply custom logic to APKs to unlock features or modify behavior without needing the original source code.

## 🚀 Get Started

### How to use these patches
The easiest way to apply these patches is through the **Morphe Manager** or **Morphe CLI**.

1. **Automatic Addition**:
   [Click here to add these patches to Morphe](https://morphe.software/add-source?github=ameenalasady/ameen-morphe)

2. **Manual Addition**:
   Add this repository URL as a patch source in your Morphe client:
   `https://github.com/ameenalasady/ameen-morphe`

## 🩹 Patches List

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/ameenalasady/ameen-morphe/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Foodvisor&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 7.0.0-3 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks premium features and diets. |  |

</details>

<details open>
<summary>📦 PhotoGrid&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 8.81 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all PhotoGrid premium features by making IabUtils always report the user as premium. |  |

</details>

<!-- PATCHES_END -->

## 🧑‍💻 Development & Usage

- **Workflow**: Development occurs in feature branches, merged into `dev`, then `main` for release.
- **Versioning**: We follow [Semantic Versioning (SemVer)](https://semver.org/).
- **Commits**: [Semantic Commits](https://www.conventionalcommits.org/) are used for a clean history.

### 🛠️ Building from Source
1. Clone this repository.
2. Run `./gradlew build` to compile the patches.
3. Use the Morphe CLI to apply the generated `.jar` to your target APK.

## 📜 License
These patches are licensed under the [GNU General Public License v3.0](LICENSE).

---
*Disclaimer: This project is not affiliated with, authorized, maintained, sponsored or endorsed by Foodvisor, PhotoGrid, or any of their affiliates.*
