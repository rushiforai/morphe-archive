# 👋🧩 EHVN Morphe Patches

Morphe patches for Android apps.

## ❓ About

> [!IMPORTANT]
> **Currently, this repository only contains the patches for intergrating [ZaloXposed](https://github.com/ElectroHeavenVN/ZaloXposed/) into Zalo app to run on non-rooted devices.**
>
> For more information about the available features, issues, and feature requests, please visit the [ZaloXposed](https://github.com/ElectroHeavenVN/ZaloXposed/) repository.

> [!NOTE]
> If the target APK version needed for patching is not available on [APKMirror](https://www.apkmirror.com/apk/zalo-group/zalo/), you can download it from [here](https://github.com/ElectroHeavenVN/ZaloXposed/releases/tag/apk).

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/ElectroHeavenVN/morphe-patches

<a href="https://morphe.software/add-source?github=ElectroHeavenVN/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.1.0](https://github.com/ElectroHeavenVN/morphe-patches/releases/tag/v1.1.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Zalo**](PATCHES.md#zalo-comzingzalo) | 2 | `26.09.01`, `26.10.01`, `26.10.02`, `26.11.01`, `26.11.02` | [`com.zing.zalo`](https://play.google.com/store/apps/details?id=com.zing.zalo) |
<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

EHVN Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
