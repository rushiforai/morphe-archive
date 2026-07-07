# 🧩 KineStop Patches for Morphe

Morphe patches for the **KineStop** app (`com.urbandroid.kinestop`).

## ❓ About

This bundle contains a patch that unlocks KineStop's premium features by forcing
`KineService$Companion.isTrial(Context)` to return `false` (the app's "pro / not trial"
state). All trial/premium gates in the app flow through that one method, so a single
override unlocks everything.

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/shaun-the-sheep-patches/morphe-patches/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
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
