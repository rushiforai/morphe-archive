# yanmus — патчи Morphe для Яндекс Музыки

Убирают телеметрию и рекламные трекеры. Подписку не обходят: нужен свой Плюс.

## Как пользоваться

Добавьте этот репозиторий как источник патчей в Morphe Manager: https://github.com/murikbmx/yanmus

<a href="https://morphe.software/add-source?github=murikbmx/yanmus">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Проверено на Яндекс Музыке 2026.11.1 (#171gpr).

| Патч | По умолчанию | Что делает |
|---|---|---|
| Disable AppMetrica | да | Не отправляет события, ошибки, сессии и местоположение в AppMetrica. Идентификаторы для входа в аккаунт работают |
| Disable AppsFlyer | да | Рекламный трекер AppsFlyer не запускается и не отправляет события |
| Disable Firebase telemetry | да | Флаги манифеста выключают Analytics, Crashlytics, Performance; удаляется разрешение AD_ID |
| Remove tracker components | нет | Экспериментально: удаляет из манифеста сервисы и ресиверы трекеров |

Push-уведомления Яндекса идут через AppMetrica Push, с патчем Disable AppMetrica они могут перестать приходить.

## После патча проверьте

- вход в аккаунт, воспроизведение, офлайн-кеш;
- что в логах нет отправок: `adb logcat | grep -iE "appmetrica|appsflyer|firebase"`.

## 🩹 Список патчей

<!-- PATCHES_START EXPANDED -->
> **[v1.0.1](https://github.com/murikbmx/yanmus/releases/tag/v1.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;5 patches total
<details open>
<summary>📦 Яндекс Музыка&nbsp;&nbsp;•&nbsp;&nbsp;5 patches</summary>
<br>

**Package name:** `ru.yandex.music`

**🎯 Supported versions:**

| 2026.11.1 #171gpr |
| :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Disable AppMetrica](#disable-appmetrica) | Отключает отправку аналитики AppMetrica: события, ошибки, сессии и местоположение не отправляются. Идентификаторы устройства для входа в аккаунт продолжают работать. Push-уведомления Яндекса, которые идут через AppMetrica Push, могут перестать приходить. |  |
| [Disable AppsFlyer](#disable-appsflyer) | Отключает рекламный трекер AppsFlyer: он не запускается и не отправляет события. |  |
| [Disable Firebase telemetry](#disable-firebase-telemetry) | Отключает Firebase Analytics, Crashlytics, Performance и сбор рекламного ID через флаги манифеста. |  |
| [Extract native libraries](#extract-native-libraries) | Исправляет ошибку установки INSTALL_FAILED_NO_MATCHING_ABIS после патчинга на телефоне: библиотеки извлекаются при установке (приложение займёт на пару МБ больше). |  |
| [Remove tracker components](#remove-tracker-components) | Экспериментально. Удаляет из манифеста сервисы и ресиверы трекеров (AppsFlyer, Firebase Analytics/Crashlytics/Sessions). |  |

</details>

<!-- PATCHES_END -->

## Разработка

- Все изменения в ветку `dev`, стабильный релиз — слиянием `dev` в `main` (без squash).
- Сообщения коммитов: `feat:` (новая функция, minor), `fix:` (исправление, patch), `chore:` (без релиза).
- Релизы создаёт `release.yml` (semantic-release), вручную их не делать.
- Локальная сборка: `./gradlew :patches:buildAndroid` → `patches/build/libs/patches-*.mpp`
  (нужен GitHub-токен с `read:packages` в `gpr.user` / `gpr.key` или `GITHUB_ACTOR` / `GITHUB_TOKEN`).
