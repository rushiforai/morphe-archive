<div align="center">

<img src="assets/banner.svg" alt="VK Zen" width="100%">

<p>
  <img src="https://img.shields.io/github/v/release/PerfLite/VK-Zen?style=flat-square" alt="release">
  <img src="https://img.shields.io/github/license/PerfLite/VK-Zen?style=flat-square" alt="license">
  <img src="https://img.shields.io/github/languages/top/PerfLite/VK-Zen?style=flat-square" alt="language">
  <img src="https://img.shields.io/github/stars/PerfLite/VK-Zen?style=flat-square" alt="stars">
  <img src="https://img.shields.io/github/downloads/PerfLite/VK-Zen/total?style=flat-square" alt="downloads">
</p>

<p>
  <a href="https://github.com/PerfLite/VK-Zen/releases/latest"><b>⬇️ Скачать</b></a> ·
  <a href="https://github.com/PerfLite/VK-Zen/releases">📦 Все релизы</a>
</p>

</div>

## ⬇️ Скачать

| Файл | Описание | Ссылка |
|---|---|---|
| `patches-1.1.0.mpp` | Бандл патчей Morphe для ВКонтакте | [Скачать](https://github.com/PerfLite/VK-Zen/releases/latest/download/patches-1.1.0.mpp) |

> Старые версии и список изменений: [Релизы](https://github.com/PerfLite/VK-Zen/releases)

---

## Описание

Патчи Morphe для Android-клиента ВКонтакте — блокировка рекламы, фоновое воспроизведение музыки, скачивание в кэш, выбор качества видео и кастомизация интерфейса.

### Возможности

- **VK Видео:** Выбор предпочтительного качества по умолчанию (Авто, 1080p Full HD, 720p HD, 480p, 360p), блокировка рекламы в плеере (preroll, midroll, postroll), скрытие навязчивых баннеров установки отдельного приложения.
- **Блокировка рекламы:** Полное удаление рекламных и спонсорских записей из новостной ленты (`marked_as_ads`, `author_ad`), отключение рекламы в VK Клипах и VK Музыке, скрытие промо-баннеров в Сервисах.
- **VK Музыка:** Воспроизведение треков в фоне и при выключенном экране без подписки, сохранение треков в офлайн-кэш («Скачанные»), скрытие баннеров подписки.
- **Кастомизация интерфейса:** Настройка всех 5 вкладок нижней панели (Tabbar), удобный раздел настроек «VK Zen» прямо в приложении.
- **Приватность и защита:** Обход нативных проверок целостности и подписи в `libvkcore.so` и `libvkmedia.so` (голосовые сообщения работают стабильно), блокировка трекеров и телеметрии, режим независимого клона.

### Установка

Добавьте репозиторий в Morphe Manager как удалённый источник:

```
https://github.com/PerfLite/VK-Zen
```

Либо вручную:
1. Скачайте `patches-1.1.0.mpp` со страницы [Релизы](https://github.com/PerfLite/VK-Zen/releases/latest).
2. Импортируйте файл бандла в Morphe Manager.
3. Выберите исходный APK ВКонтакте (рекомендуется версия 8.195) и запустите сборку.

### Сборка

```bash
# Сборка бандла патчей (.mpp)
./gradlew :patches:bundleRelease

# Или сборка патченного APK напрямую
./gradlew :patches:patchVk
```

### Лицензия

GPL-3.0 — см. [LICENSE](LICENSE).

<p align="right"><a href="#-скачать">↑ Наверх</a></p>
