# Transit UI Patches

Unofficial patches for Yahoo! Transit (`jp.co.yahoo.android.apps.transit`), compatible with Morphe.

Supported version: **8.5.5 (478)**. Android **13 or later** for the language selector.

## Features

- English UI, translated image labels and help illustrations, preserving original icon artwork.
- In-app language selection: Japanese, English, or system default.
- Restart prompt with **Restart now** and **Later**. Restart now replaces the app process to refresh cached icons.
- Reduced repeated translation work while scrolling.
- Ad removal.

Station names, line names and addresses remain in Japanese. English remains experimental.

## Install

Add this repository as a patch source in Morphe:

[Add source](https://morphe.software/add-source?github=MohuttTT/yahoo-transit-patches)

Select the English UI patch and/or the ad removal patch, then patch an original Yahoo! Transit 8.5.5 APK. Switch languages in the app settings. Use **Restart now** to fully update cached text and icons.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/MohuttTT/yahoo-transit-patches/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;2 patches total
<details open>
<summary>📦 Yahoo!乗換案内&nbsp;&nbsp;•&nbsp;&nbsp;2 patches</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;8.5.5 |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [App language selector + English UI (experimental)](#app-language-selector-english-ui-experimental) | English UI with preserved original icon artwork and localized help illustrations. Line/station names remain Japanese. Android 13+. |  |
| [Hide selected ad layouts (experimental)](#hide-selected-ad-layouts-experimental) | Removes ads. |  |

</details>

<!-- PATCHES_END -->

## Build

Requirements: JDK 21 and Android SDK. Configure `ANDROID_HOME` or a local `sdk.dir`.

```shell
./gradlew buildAndroid
```

The bundle is generated in `patches/build/libs/`.

GitHub Packages credentials, when required, belong in environment variables (`GITHUB_ACTOR`, `GITHUB_TOKEN`) or user-level Gradle properties (`gpr.user`, `gpr.key`). Never commit credentials or `local.properties`.

## Releases

Development happens on `dev`; its releases are prereleases. Merge `dev` into `main` without squashing for a stable release. The existing semantic-release workflow generates version metadata, changelog, patch list and release assets. Use conventional commits such as `fix:`, `feat:` or `perf:`.

## Validation

The full-process restart was tested with Yahoo! Transit 8.5.5 on an Android 17 / API 37 emulator in both language directions. The English search-option artwork was visually checked after restarting. Device-specific testing is ongoing.

Report reproducible issues with app version, patch bundle version, Android version and screenshots/logs when useful.

## License

[GNU GPL v3](LICENSE). See [NOTICE](NOTICE) for the template's naming requirements. This project is independent of Yahoo and Morphe.
