# 👋🧩 Plyrs1 Morphe Patches

This repo contains patches that either I personally use, or I find interesting to patch. Because of that, I cannot guarantee if it works properly, as I only patch things I need. But feel free to leave feature/pull request, I will check on my free time.

Note that most of the patches are done by AI, but I monitor the process and check the results, and verify it works at least in emulator.

## ❓ About

Custom patches for Android applications.

### How to use these patches

Click the button below, or manually add this repo url to Morphe Manager: https://github.com/Plyrs1/morphe-patches

<a href="https://morphe.software/add-source?github=Plyrs1/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.0-dev.10](https://github.com/Plyrs1/morphe-patches/releases/tag/v1.6.0-dev.10)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`dev`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**38 patches** across **8 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Android Auto**](PATCHES.md#android-auto-comgoogleandroidprojectiongearhead) | 1 | `17.7.663654-release` | [`com.google.android.projection.gearhead`](https://play.google.com/store/apps/details?id=com.google.android.projection.gearhead) |
| 2 | [**E-Ujian Browser**](PATCHES.md#e-ujian-browser-comdooveraeujianbrowser) | 18 | `3.1.3` | [`com.doovera.eujianbrowser`](https://play.google.com/store/apps/details?id=com.doovera.eujianbrowser) |
| 3 | [**GajiHub**](PATCHES.md#gajihub-comgajihubapp) | 6 | `2.0.14`, `2.0.4` | [`com.gajihub.app`](https://play.google.com/store/apps/details?id=com.gajihub.app) |
| 4 | [**Habitica**](PATCHES.md#habitica-comhabitrpgandroidhabitica) | 3 | `4.10.5`, `4.11.2` | [`com.habitrpg.android.habitica`](https://play.google.com/store/apps/details?id=com.habitrpg.android.habitica) |
| 5 | [**Nusuk**](PATCHES.md#nusuk-commohnusukapp) | 1 | `17.6.2` | [`com.moh.nusukapp`](https://play.google.com/store/apps/details?id=com.moh.nusukapp) |
| 6 | [**Pertaminiku**](PATCHES.md#pertaminiku-compertaminiku) | 3 | `1.0.2` | [`com.pertaminiku`](https://play.google.com/store/apps/details?id=com.pertaminiku) |
| 7 | [**Struk POM**](PATCHES.md#struk-pom-comgarnesappsstrukpom) | 3 | `1.17.057` | [`com.garnesapps.strukpom`](https://play.google.com/store/apps/details?id=com.garnesapps.strukpom) |
| 8 | [**Struk Pom / SPBU**](PATCHES.md#struk-pom-spbu-comogestudiostrukpertamini) | 3 | `1.2.7` | [`com.ogestudio.strukpertamini`](https://play.google.com/store/apps/details?id=com.ogestudio.strukpertamini) |
<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches .mpp file is found in `patches/build/libs/patches-*.mpp`
- Patch the mpp file using [Morphe-Desktop](https://github.com/MorpheApp/morphe-desktop)
  like any other patch bundle.

See the [Morphe documentation](https://github.com/MorpheApp/morphe-documentation) for more information.

## 📜 License

Plyrs1 Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE)
