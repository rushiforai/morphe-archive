<div align="center">

<img src="assets/banner.svg" alt="Zona Patches" width="100%">

<p>
  <a href="#english">🇬🇧 English</a> ·
  <a href="#русский">🇷🇺 Русский</a>
</p>

<p>
  <img src="https://img.shields.io/github/v/release/PerfLite/morphe-patches-zona?style=flat-square" alt="release">
  <img src="https://img.shields.io/github/license/PerfLite/morphe-patches-zona?style=flat-square" alt="license">
  <img src="https://img.shields.io/github/languages/top/PerfLite/morphe-patches-zona?style=flat-square" alt="language">
  <img src="https://img.shields.io/github/stars/PerfLite/morphe-patches-zona?style=flat-square" alt="stars">
  <img src="https://img.shields.io/github/downloads/PerfLite/morphe-patches-zona/total?style=flat-square" alt="downloads">
</p>

<p>
  <a href="https://github.com/PerfLite/morphe-patches-zona/releases/latest"><b>⬇️ Download / Скачать</b></a> ·
  <a href="https://github.com/PerfLite/morphe-patches-zona/releases">📦 All releases / Все релизы</a>
</p>

</div>

## ⬇️ Download / Скачать

| File / Файл | Description / Описание | Link / Ссылка |
|---|---|---|
| `patches-1.2.4.mpp` | Morphe patch bundle for FreeZona World · Бандл патчей Morphe для FreeZona World | [Download](https://github.com/PerfLite/morphe-patches-zona/releases/latest/download/patches-1.2.4.mpp) |

> Older versions and changelogs: [Releases](https://github.com/PerfLite/morphe-patches-zona/releases) ·
> Старые версии и список изменений: [Релизы](https://github.com/PerfLite/morphe-patches-zona/releases)

---

## English

A [Morphe](https://morphe.software/) patch source for **FreeZona World** (`free.zona`).

### Features

- **Force landscape player:** Switches to landscape orientation when movie or series playback starts.
- **Preferred quality priority:** Plays at the quality from the "Preferred quality" setting instead of the last quality chosen by hand, keeping the chosen voice-over, and waits for preferred quality sources before falling back.
- **Install as a separate app:** Installs the patched app beside the original one under its own package name and app name, so the original keeps updating on its own.
- **Video buffer:** Increases ExoPlayer buffer duration (10 min min, 20 min max) to eliminate stutter and rebuffering on slow connections.
- **Disable analytics:** Disables internal event tracking, ClickHouse telemetry, crash reporting, and AppMetrica SDK to enhance privacy and battery life.

### Install

Add this repository URL to **Morphe** as a custom source (Settings → Sources → Add):

```
https://github.com/PerfLite/morphe-patches-zona
```

> Target app: FreeZona World `3.0.75` (1075) / `3.0.76` (1076) / `3.0.77` (1077), available at [julay123/mobi.zona](https://github.com/julay123/mobi.zona/releases/latest).

### Build

```
./gradlew :patches:buildAndroid
```

### License

GPL-3.0 — see [LICENSE](LICENSE).

<p align="right"><a href="#english">↑ Back to top</a> · <a href="#русский">Русский ↓</a></p>

---

## Русский

Источник патчей [Morphe](https://morphe.software/) для приложения **FreeZona World** (`free.zona`).

### Возможности

- **Автоповорот в ландшафт (Force landscape player):** Автоматически переключает плеер в альбомную ориентацию при старте воспроизведения фильма или сериала.
- **Приоритет качества (Preferred quality priority):** Запускает видео в качестве из настройки «Предпочитаемое качество» вместо последнего выбранного вручную, сохраняет озвучку и ожидает загрузки потоков высокого качества перед переключением на более низкое.
- **Установка отдельным приложением (Install as a separate app):** Устанавливает пропатченную версию рядом с оригиналом под собственным именем пакета, позволяя оригиналу обновляться самостоятельно.
- **Видеобуфер (Video buffer):** Увеличивает буфер ExoPlayer (10 минут минимум, 20 минут максимум) для стабильного воспроизведения без подгрузок и заиканий.
- **Отключение аналитики (Disable analytics):** Вырезает трекинг событий, телеметрию ClickHouse, отчёты о сбоях и AppMetrica SDK для приватности и экономии батареи.

### Установка

Добавьте ссылку на репозиторий в **Morphe** в качестве источника патчей (Настройки → Источники → Добавить):

```
https://github.com/PerfLite/morphe-patches-zona
```

> Целевое приложение: FreeZona World `3.0.75` (1075) / `3.0.76` (1076) / `3.0.77` (1077), доступно в [julay123/mobi.zona](https://github.com/julay123/mobi.zona/releases/latest).

### Сборка

```
./gradlew :patches:buildAndroid
```

### Лицензия

GPL-3.0 — см. [LICENSE](LICENSE).

<p align="right"><a href="#русский">↑ Наверх</a> · <a href="#english">English ↑</a></p>
