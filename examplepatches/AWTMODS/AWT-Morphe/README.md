# 👋🧩 Morphe Patches template

Template repository for Morphe Patches.

## ❓ About

Patches for Android apps, distributed as a Morphe patch bundle. The Regain patch set includes an optional MicroG-RE integration for Google ID Credential Manager and supported GMS services.

See [Regain MicroG-RE integration notes](docs/GMSCORE_INTEGRATION.md) for provider setup, patch behavior, and the remaining device checks.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/AWTMODS/AWT-Morphe

<a href="https://morphe.software/add-source?github=AWTMODS/AWT-Morphe">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START -->
> **[v1.1.0](https://github.com/AWTMODS/AWT-Morphe/releases/tag/v1.1.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**2 patches** across **1 app**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Regain**](PATCHES.md#regain-airegainapp) | 2 | `76.2.2151`, `76.1.2139` | [`ai.regainapp`](https://play.google.com/store/apps/details?id=ai.regainapp) |
<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

UserXYZ Patches are licensed under the [GNU General Public License v3.0](LICENSE)
