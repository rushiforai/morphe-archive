# 🧩 Morphe Patches

Morphe patches for various Android apps.

## ❓ About

This repository contains patch bundles for various Android apps to unlock features, improve usability, or remove ads.


## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/shaun-the-sheep-patches/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 RSS Reader&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 1.48.2 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [RSS Reader Premium](#rss-reader-premium) | Unlock premium features and remove ads in RSS Reader. |  |

</details>

<details open>
<summary>📦 KineStop&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 5.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Unlock Premium](#unlock-premium) | Unlocks all premium features by forcing KineService.Companion.isTrial() to return false (pro state). |  |

</details>

<!-- PATCHES_END -->

#### How to use these patches

Click here to add these patches to Morphe: https://morphe.software/add-source?github=shaun-the-sheep-patches/morphe-patches

Or manually add this repository url as a patch source in Morphe: https://github.com/shaun-the-sheep-patches/morphe-patches

### 🛠️ Building

Releases are built automatically by the `release.yml` GitHub Actions workflow on push to
`main`/`dev`. To build locally, follow the
[Morphe documentation](https://github.com/MorpheApp/morphe-documentation) (you'll need a
GitHub PAT with `read:packages` in `~/.gradle/gradle.properties` as `gpr.user`/`gpr.key`
to resolve the `MorpheApp/registry` Gradle plugin).

## 📜 License

KineStop Patches are licensed under the [GNU General Public License v3.0](LICENSE)
