# 🧩 Darkaxt Morphe Patches

Custom [Morphe](https://morphe.software/) patches for Android apps and games.

## ❓ About

A personal collection of custom Morphe patches — starting with the **Doodle Jump — Endless Fall & 3-Lives** gameplay mod.

### How to use these patches

Click the button below, or manually add this repo URL to Morphe Manager: `https://github.com/Darkaxt/morphe-patches`

<a href="https://morphe.software/add-source?github=Darkaxt/morphe-patches">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

## 🩹 Patches list

<!-- PATCHES_START EXPANDED -->
> **[v1.6.2](https://github.com/Darkaxt/morphe-patches/releases/tag/v1.6.2)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**6 patches** across **2 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Doodle Jump**](PATCHES.md#doodle-jump-comlimadoodlejump) | 2 | `3.11.40` | [`com.lima.doodlejump`](https://play.google.com/store/apps/details?id=com.lima.doodlejump) |
| 2 | [**THE LONGING**](PATCHES.md#the-longing-deapplication_systemsthelonging) | 4 | `1.26` | [`de.application_systems.TheLonging`](https://play.google.com/store/apps/details?id=de.application_systems.TheLonging) |
<!-- PATCHES_END -->

### 🛠️ Building locally

- Run `./gradlew buildAndroid`
- The built patches `.mpp` file is found in `patches/build/libs/patches-*.mpp`
- Apply the `.mpp` file using [Morphe Manager](https://morphe.software/) or [Morphe Desktop](https://github.com/MorpheApp/morphe-desktop)

Native C++ mod sources are included under `native/` for reproducibility.

## 📜 License

Darkaxt Morphe Patches are licensed under the [GNU General Public License v3.0](LICENSE).
