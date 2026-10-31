<div align="center">

<img src="assets/banner.svg" alt="VK Messenger" width="100%">

<p>
  <img src="https://img.shields.io/github/v/release/PerfLite/morphe-patches-vk-messenger?style=flat-square" alt="release">
  <img src="https://img.shields.io/github/license/PerfLite/morphe-patches-vk-messenger?style=flat-square" alt="license">
  <img src="https://img.shields.io/github/languages/top/PerfLite/morphe-patches-vk-messenger?style=flat-square" alt="language">
  <img src="https://img.shields.io/github/stars/PerfLite/morphe-patches-vk-messenger?style=flat-square" alt="stars">
  <img src="https://img.shields.io/github/downloads/PerfLite/morphe-patches-vk-messenger/total?style=flat-square" alt="downloads">
</p>

<p>
  <a href="https://github.com/PerfLite/morphe-patches-vk-messenger/releases/latest"><b>⬇️ Скачать</b></a> ·
  <a href="https://github.com/PerfLite/morphe-patches-vk-messenger/releases">📦 Все релизы</a>
</p>

</div>

## ⬇️ Скачать

| Файл | Описание | Ссылка |
|---|---|---|
| `patches-1.0.0.mpp` | Бандл патчей Morphe для «VK Мессенджер» | [Скачать](https://github.com/PerfLite/morphe-patches-vk-messenger/releases/latest/download/patches-1.0.0.mpp) |

> Старые версии и список изменений: [Релизы](https://github.com/PerfLite/morphe-patches-vk-messenger/releases)

---

## Описание

Набор патчей Morphe для официального Android-клиента «VK Мессенджер» (`com.vk.im`).
Проверено на версии **1.329** (versionCode 34779).

### Возможности

- **Обход защит и проверок подписи**: отключение проверки оригинальной подписи (`AuthBridge`), детекта VPN в `DeviceState`, нативного анти-тампера в `libvkmedia.so`.
- **Отключение телеметрии**: полная блокировка MyTracker.
- **Уведомления**: подмена `X-Android-Package` / `X-Android-Cert` для получения push через Firebase (FCM).
- **Обход детекта VPN**: снятие ограничений при подключении через VPN/прокси.
- **Клонирование приложения**: пакет переименован в `com.vk.im.morphe` для параллельной установки рядом с оригиналом; имя приложения меняется опцией при патчинге. Клон не попадает под встроенный детектор VK «опасное приложение», который иначе показывает уведомление о взломе аккаунта.
- **Свои цвета иконки**: перекраска плашки, пузыря и точек лончер-иконки (включая adaptive-слой), чтобы клон отличался от оригинала.

### Установка

Добавьте репозиторий в Morphe Manager как удалённый источник:

```
https://github.com/PerfLite/morphe-patches-vk-messenger
```

Либо вручную:
1. Скачайте `patches-1.0.0.mpp` со страницы [Релизы](https://github.com/PerfLite/morphe-patches-vk-messenger/releases/latest).
2. Импортируйте файл бандла в Morphe Manager.
3. Выберите исходный APK «VK Мессенджер» (проверено на 1.329) и запустите сборку.

### Сборка

```bash
# Сборка бандла патчей (.mpp в patches/build/libs/)
./gradlew :patches:publish

# Патчинг VK Мессенджера и создание подписанного APK
./gradlew :patches:patchVkMessenger
```

### Лицензия

GPL-3.0 — см. [LICENSE](LICENSE).

<p align="right"><a href="#-скачать">↑ Наверх</a></p>
