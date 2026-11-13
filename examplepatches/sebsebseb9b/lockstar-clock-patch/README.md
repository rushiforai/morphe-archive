# LockStar Clock Patches

Morphe patches for Samsung Good Lock LockStar.

## ❓ About

Forces the LockStar lock screen clock to be horizontally centered (built against LockStar 9.5.00.0).

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/sebsebseb9b/lockstar-clock-patch

<a href="https://morphe.software/add-source?github=sebsebseb9b/lockstar-clock-patch">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/sebsebseb9b/lockstar-clock-patch/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;3 patches total
<details open>
<summary>📦 LockStar&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.samsung.systemui.lockstar`

**🎯 Supported versions:**

| 9.5.00.0 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Center lock screen clock](#center-lock-screen-clock) | Anchors the lock screen clock to the horizontal center of the screen. Your vertical position is kept. Re-save the clock in LockStar after installing. |  |
| [Re-sign only (test)](#re-sign-only-test) | Does nothing. Select only this patch to test whether a re-signed LockStar opens at all. |  |
| [Use default clock position](#use-default-clock-position) | Alternative to 'Center lock screen clock': makes SystemUI use its stock (centered) clock position. Your vertical position is not kept. Enable only one of the two. |  |

</details>

<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
