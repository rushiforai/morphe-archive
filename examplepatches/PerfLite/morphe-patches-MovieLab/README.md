<div align="center">

<img src="assets/banner.svg" alt="MovieLab Patches" width="100%">

<p>
  <img src="https://img.shields.io/github/v/release/PerfLite/morphe-patches-MovieLab?style=flat-square" alt="release">
  <img src="https://img.shields.io/github/license/PerfLite/morphe-patches-MovieLab?style=flat-square" alt="license">
  <img src="https://img.shields.io/github/languages/top/PerfLite/morphe-patches-MovieLab?style=flat-square" alt="language">
  <img src="https://img.shields.io/github/stars/PerfLite/morphe-patches-MovieLab?style=flat-square" alt="stars">
  <img src="https://img.shields.io/github/downloads/PerfLite/morphe-patches-MovieLab/total?style=flat-square" alt="downloads">
</p>

<p>
  <a href="https://github.com/PerfLite/morphe-patches-MovieLab/releases/latest"><b>⬇️ Скачать</b></a> ·
  <a href="https://github.com/PerfLite/morphe-patches-MovieLab/releases">📦 Все релизы</a>
</p>

</div>

## ⬇️ Скачать

| Файл | Описание | Ссылка |
|---|---|---|
| `patches-1.0.0.mpp` | Пакет патчей Morphe | [Скачать](https://github.com/PerfLite/morphe-patches-MovieLab/releases/latest/download/patches-1.0.0.mpp) |

> Предыдущие версии и список изменений: [Релизы](https://github.com/PerfLite/morphe-patches-MovieLab/releases)

---

## Возможности

Патчи Morphe для Android-приложения MovieLab — просмотр без рекламы, отключение телеметрии и возможность параллельной установки (клон).

- **Вырезание рекламы**: Отключение видео-прероллов VAST/VMAP перед просмотром, баннеров на паузе, нативных рекламных блоков в каталоге и рекламных эндпоинтов.
- **Отключение телеметрии**: Полная нейтрализация Firebase Analytics, Firebase Crashlytics и фонового трекинга сессий OneSignal.
- **Установка отдельным приложением (Клон)**: Возможность изменить имя пакета и название приложения для параллельной установки рядом с оригиналом.
- **Быстрый запуск**: Мгновенное начало воспроизведения видео без ожидания рекламы.

### Поддерживаемые версии

- **MovieLab** `2.0.22-movielab-mobile` (versionCode `1`, пакет `com.movielab.mobile`).

### Установка

Добавьте репозиторий источников в Morphe Manager или пропатчите APK вручную:

```
https://github.com/PerfLite/morphe-patches-MovieLab
```

### Сборка

```bash
./gradlew build
```

Скомпилированный пакет патчей находится по пути `patches/build/libs/patches-1.0.0.mpp`.

### Лицензия

GNU General Public License v3.0 — см. [LICENSE](LICENSE).

<p align="right"><a href="#">↑ Наверх</a></p>
