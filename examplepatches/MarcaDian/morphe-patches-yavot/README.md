# Morphe Patches: Yandex VoT add-on

Yandex voice-over translation add-on for [Morphe Patches](https://github.com/MorpheApp/morphe-patches).

This bundle ships the `Voice Over Translation (Yandex)` patch for YouTube. It is meant to be loaded **alongside** the base `morphe-patches` bundle in Morphe Manager, not as a replacement. All classes, resources, preference keys and extension descriptors are renamed with a `yandex_vot` / `YandexVot*` prefix so nothing collides with the built-in Google-TTS-based VoT patch.

## Install

### Morphe Manager

1. Install/keep the base [morphe-patches](https://github.com/MorpheApp/morphe-patches) bundle in [Morphe Manager](https://github.com/MorpheApp/morphe-manager).
2. Add this bundle as an additional source in Morphe Manager (`Patch sources → Add`).
3. When patching YouTube, both patches are available:
   - `Voice Over Translation` (base, Google/OpenRouter/MyMemory backends)
   - `Voice Over Translation (Yandex)` (this bundle)
   
### Morphe Desktop
Patch with two mpp bundles: Morphe official bundle (morphe.mpp) and this yavot addon bundle (yavot.mpp):

`java -Xms1024m -jar morphe-desktop*-all.jar patch --patches morphe.mpp --patches yavot.mpp youtube_original.apk --out youtube_patched.apk`

## What is renamed vs upstream yavot

Everything that would get baked into the patched YouTube APK uses a distinct namespace:

- Kotlin patch package: `app.morphe.patches.youtube.video.yandexvot`
- Extension package: `app.morphe.extension.youtube.patches.yandexvot`
- Player button class: `YandexVotButton` (was `VoiceOverTranslationButton`)
- OAuth preference class: `YandexVotOAuthPreference`
- Settings constants: `YANDEX_VOT_ENABLED`, `YANDEX_VOT_SOURCE_LANGUAGE`, ...
- SharedPreferences keys: `morphe_yandex_vot_*` (was `morphe_vot_*`)
- Drawables: `morphe_yt_yandex_vot(_activated).xml`
- Settings sit directly next to the built in `Voice over translation` entry on the `Video` screen, under the key `morphe_vot_screen_yandex`, and are titled the same with `(Yandex)` appended.

## How the add-on attaches to the base bundle

Morphe Manager loads every patch bundle in its own class loader, so this bundle cannot reference
any patch of morphe-patches. Everything goes through the patched app instead, using the hooks the
`Add-on support` patch of morphe-patches provides:

- The patch adds a call to `YandexVotAddOn.register()` to `AddOnManager.registerAddOns()` of the
  base extension, in a finalize block.
- `register()` subscribes to `AddOnApi`: player overlay buttons, legacy player controls, new video,
  video id and video time.
- The player button uses `PlayerOverlayButton.addButton()`, and in the old player layout one of the
  legacy button slots the base bundle reserves for add-ons.
- Preferences are declared in `morphe_addon_prefs.xml` with `after="morphe_vot_screen"`, so the
  settings patch places them right next to the built in voice over translation entry. Strings,
  arrays and drawables are written into the app resources by this bundle itself.

Only the `AudioTrack.setVolume` hook that ducks the original audio is patched directly, using a
fingerprint of this bundle.

## Build

Requires a sibling checkout of `morphe-patcher`, `morphe-patches-library`, and — for the extension
code only — `morphe-patches`:

```
StudioProjects/
├── morphe-patcher
├── morphe-patches
├── morphe-patches-library
└── morphe-patches-yavot  ← this repo
```

The patch code (`patches/`) depends on `morphe-patcher` and `morphe-patches-library` only. The
extension code compiles against the compiled extension classes of morphe-patches with
`compileOnly`, since all extensions end up in the same patched app. Build the base extension first:

```
../morphe-patches/gradlew :extensions:youtube:compileReleaseKotlin :extensions:youtube:compileReleaseJavaWithJavac
```

## What is bundled

- 1 Kotlin patch plus its add-on support helpers (`YandexVoiceOverTranslationPatch.kt`, `AddOn.kt`)
- 9 Java extension classes (`YandexVot*`, including the add-on entry point `YandexVotAddOn`)
- `YandexVotSettings.java` (9 setting fields, isolated from base's `Settings.java`)
- `yandexvotbutton/` drawables
- Filtered `strings.xml` and `arrays.xml` with only `morphe_yandex_vot_*` keys (en + ru + uk)

## Credits

Yandex VoT implementation:
- [Jav1x](https://github.com/Jav1x) — original author of the patch, Morphe port
- [anddea](https://github.com/anddea) — revanced-patches port

Base bundle: [Morphe Patches](https://github.com/MorpheApp/morphe-patches), [Morphe Manager](https://github.com/MorpheApp/morphe-manager), [Morphe Patcher](https://github.com/MorpheApp/morphe-patcher).

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.0.4](https://github.com/MarcaDian/morphe-patches-yavot/releases/tag/v1.0.4)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;1 patches total
<details open>
<summary>📦 YouTube&nbsp;&nbsp;•&nbsp;&nbsp;1 patch</summary>
<br>

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Voice Over Translation (Yandex)](#voice-over-translation-yandex) | Adds an option to enable Yandex voice-over translation of video audio tracks. Requires a Morphe Patches version with add-on support. |  |

</details>

<!-- PATCHES_END -->

## License

GNU General Public License v3.0
