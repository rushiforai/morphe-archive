# Morphe Patches: Yandex VoT add-on

Yandex voice-over translation add-on for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

This bundle ships the `Voice Over Translation (Yandex)` patch for YouTube. It is meant to be loaded **alongside** the base `morphe-patches` bundle in Morphe Manager, not as a replacement. All classes, resources, preference keys and extension descriptors are renamed with a `yandex_vot` / `YandexVot*` prefix so nothing collides with the built-in Google-TTS-based VoT patch.

## Install

1. Install/keep the base [morphe-patches](https://github.com/MorpheApp/morphe-patches) bundle in [Morphe Manager](https://github.com/MorpheApp/morphe-manager).
2. Add this bundle as an additional source in Morphe Manager (`Patch sources → Add`).
3. When patching YouTube, both patches are available:
   - `Voice Over Translation` (base, Google/OpenRouter/MyMemory backends)
   - `Voice Over Translation (Yandex)` (this bundle)

## What is renamed vs upstream yavot

Everything that would get baked into the patched YouTube APK uses a distinct namespace:

- Kotlin patch package: `app.morphe.patches.youtube.video.yandexvot`
- Extension package: `app.morphe.extension.youtube.patches.yandexvot`
- Player button class: `YandexVotButton` (was `VoiceOverTranslationButton`)
- OAuth preference class: `YandexVotOAuthPreference`
- Settings constants: `YANDEX_VOT_ENABLED`, `YANDEX_VOT_SOURCE_LANGUAGE`, ...
- SharedPreferences keys: `morphe_yandex_vot_*` (was `morphe_vot_*`)
- Drawables: `morphe_yt_yandex_vot(_activated).xml`
- Settings live under `Video → Voice Over Translation (Yandex)` sub-screen (`morphe_yandex_vot_screen`), same nesting as the base Google-VoT patch. No new root screen is added.

## Status

Delta bundle. The Kotlin patch tree contains only the two `yandexvot` patches; base morphe-patches classes (`videoInformationPatch`, `PreferenceScreen`, `sharedExtensionPatch`, etc.) are resolved at compile time via Gradle composite build pointing at `../morphe-patches`.

## Build

Requires a sibling checkout of `morphe-patches`, `morphe-patcher`, `morphe-patches-library`:

```
StudioProjects/
├── morphe-patcher
├── morphe-patches
├── morphe-patches-library
└── morphe-patches-yavot  ← this repo
```

`settings.gradle.kts` uses `includeBuild("../morphe-patches")` with `dependencySubstitution` to substitute the fake maven coord `app.morphe:morphe-patches-base` with base's `:patches` project. `patches/build.gradle.kts` declares `compileOnly("app.morphe:morphe-patches-base")`.

## What is bundled vs referenced from base

Shipped in yavot bundle:
- 2 Kotlin patches (`YandexVoiceOverTranslationPatch.kt`, `YandexVotOriginalVolumeBytecodePatch.kt`)
- 8 Java extension classes (`YandexVot*`)
- `YandexVotSettings.java` (9 setting fields, isolated from base's `Settings.java`)
- `yandexvotbutton/` resources (2 drawables + host layout)
- Filtered `strings.xml` and `arrays.xml` with only `morphe_yandex_vot_*` keys (en + ru)
- Base `extensions/shared`, `extensions/shared-youtube`, `extensions/youtube` modules (kept for build; identical to base at fork time — DEX merger deduplicates)

Referenced at compile time from base (not shipped):
- All `app.morphe.patches.youtube.*` and `app.morphe.patches.shared.*` Kotlin patch declarations
- All non-yavot Kotlin patches (390 files not shipped)
- All non-yavot resources
- Extension modules for music, reddit (not shipped)

## Credits

Yandex VoT implementation:
- [Jav1x](https://github.com/Jav1x) — original author of the patch, Morphe port
- [anddea](https://github.com/anddea) — revanced-patches port

Base bundle: [Morphe Patches](https://github.com/MorpheApp/morphe-patches), [Morphe Manager](https://github.com/MorpheApp/morphe-manager), [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.0](https://github.com/MarcaDian/morphe-patches-yavot/releases/tag/v1.0.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

**🎯 Supported versions:**

| 🧪&nbsp;21.29.366 | 🧪&nbsp;21.28.204 | 🧪&nbsp;21.26.360 | 🧪&nbsp;21.05.265 | 21.04.223 | 20.51.39 | 20.31.42 | 20.21.37 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Voice Over Translation (Yandex)](#voice-over-translation-yandex) | Adds an option to enable Yandex voice-over translation of video audio tracks. |  |

</details>

<!-- PATCHES_END -->

## License

GNU General Public License v3.0, with additional GPL Section 7 attribution terms for portions authored by anddea/Jav1x. See `LICENSE` and `NOTICE`.
