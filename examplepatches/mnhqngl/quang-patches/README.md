# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for apps I like.

<!-- TODO: Update this about section with a brief introduction/summary about this repo and what it offers. -->

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/mnhqngl/quang-patches

<a href="https://morphe.software/add-source?github=mnhqngl/quang-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/mnhqngl/quang-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Zalo&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**Package name:** `com.zing.zalo`

**🎯 Supported versions:**

| 26.10.02 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Allow Zalo to see Photos (Zalo)](#allow-zalo-to-see-photos-zalo) | Thêm Google Photos bản Morphe vào <queries> của Zalo để Zalo nhìn thấy app này. | • Package Photos (Morphe) |
| [Change Photos picker package (Zalo)](#change-photos-picker-package-zalo) | Nút Google Photos trong trình chọn ảnh của Zalo sẽ mở Google Photos bản Morphe. | • Package Photos (Morphe) |

</details>

<details open>
<summary>📦 Messenger&nbsp;&nbsp;•&nbsp;&nbsp;3 patches</summary>
<br>

**Package name:** `com.facebook.orca`

**🎯 Supported versions:**

| 575.0.0.0.1 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Change Photos picker package](#change-photos-picker-package) | Nút Google Photos trong trình chọn ảnh/video của Messenger sẽ mở Google Photos bản Morphe. | • Package Photos (Morphe) |
| [Fix Photos picker button not opening](#fix-photos-picker-button-not-opening) | Sửa lỗi bấm nút Photos trong khay ảnh không có phản ứng sau khi Messenger tải cấu hình từ server. |  |
| [Remove conflicting permission declarations](#remove-conflicting-permission-declarations) | Sửa lỗi INSTALL_FAILED_DUPLICATE_PERMISSION khi máy đã cài app Facebook. |  |

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
