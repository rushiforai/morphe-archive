**English** | [Русский](README.ru.md)

# Nyandex

> [!WARNING]
> **Nyandex is fully vibe-coded.** All of the actual coding work has 
> been done by AI.

Yandex Music patches for [Morphe](https://morphe.software): lyrics from LRCLIB, a Material You
theme, hideable bottom-bar tabs, haptic feedback, an in-app settings page, and privacy fixes.

Nyandex is not affiliated with Yandex or Morphe.

## How to use

Add to Morphe Manager as a patch source:

<a href="https://morphe.software/add-source?github=Ser1-1y/nyandex">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

- Keep **Spoof app signature** enabled.
  Without it Yandex ID login fails with "application signature mismatch".
- After patching, Nyandex options are in the app: **Settings → Nyandex → Nyandex Settings**.

### Supported versions

| App | Versions |
|---|---|
| Yandex Music (`ru.yandex.music`) | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` |

Only those versions are tested on.

## Patches

<!-- PATCHES_START EXPANDED -->
> **[v1.7.0](https://github.com/Ser1-1y/nyandex/releases/tag/v1.7.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;**15 patches** across **1 apps**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Full details](PATCHES.md)

| # | App | Patches | Version | Package |
|---|---|---|---|---|
| 1 | [**Yandex Music**](PATCHES.md#yandex-music-ruyandexmusic) | 15 | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` | [`ru.yandex.music`](https://play.google.com/store/apps/details?id=ru.yandex.music) |
<!-- PATCHES_END -->

## Notes

- **Custom Lyrics** come from LRCLIB, a free community database.
- **Clean share links** removes `utm_*` and `ref_id` from shared and copied links.
- **Monet** theme for Android 12+.
- **Hide tabs** from the Bottom bar (Settings -> Nyandex settings).
- **Hide promo** blocks, Plus offers and banners (Settings -> Nyandex settings).
- **Haptic feedback** adds a short vibration to taps on buttons and tabs, long presses and
  pull-to-refresh. You can configure what triggers the vibrations in Nyandex settings.

## Building

Requirements: JDK 17 or newer and the Android SDK (`ANDROID_HOME`).

```bash
./gradlew :patches:buildAndroid
```

### Tests

```bash
YM_APK=/path/to/stock/base.apk ./gradlew :patches:test --rerun
```

## License

GPLv3, see [LICENSE](LICENSE). Built from the
[Morphe patches template](https://github.com/MorpheApp/morphe-patches-template); see
[NOTICE](NOTICE) for the Morphe project's name restriction. «Подменить подпись приложения» uses
the signature spoof of the Morphe patches library.
