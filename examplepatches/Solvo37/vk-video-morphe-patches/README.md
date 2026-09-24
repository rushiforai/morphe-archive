# VK Video Patched

[![CI](https://github.com/Solvo37/vk-video-morphe-patches/actions/workflows/ci.yml/badge.svg)](https://github.com/Solvo37/vk-video-morphe-patches/actions/workflows/ci.yml)
[![Auto build](https://github.com/Solvo37/vk-video-morphe-patches/actions/workflows/auto-update.yml/badge.svg)](https://github.com/Solvo37/vk-video-morphe-patches/actions/workflows/auto-update.yml)
[![License: GPL-3.0](https://img.shields.io/badge/license-GPL--3.0-blue.svg)](./LICENSE)
[![Добавить в Obtainium](https://img.shields.io/badge/Obtainium-%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C-7c4dff?logo=android&logoColor=white)](https://apps.obtainium.imranr.dev/redirect?r=obtainium%3A%2F%2Fapp%2F%257B%2522id%2522%253A%2522com.vk.vkvideo%2522%252C%2522url%2522%253A%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%2522%252C%2522author%2522%253A%2522Solvo37%2522%252C%2522name%2522%253A%2522VK%2520Video%2520Patched%2522%252C%2522installedVersion%2522%253Anull%252C%2522latestVersion%2522%253A%25221.163.6%2522%252C%2522apkUrls%2522%253A%2522%255B%255B%255C%2522VK-Video-1.163.6-patched.apk%255C%2522%252C%255C%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%252Freleases%252Fdownload%252F1.163.6%252FVK-Video-1.163.6-patched.apk%255C%2522%255D%255D%2522%252C%2522preferredApkIndex%2522%253A0%252C%2522additionalSettings%2522%253A%2522%257B%255C%2522includePrereleases%255C%2522%253Afalse%252C%255C%2522fallbackToOlderReleases%255C%2522%253Atrue%252C%255C%2522filterReleaseTitlesByRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522filterReleaseNotesByRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522verifyLatestTag%255C%2522%253Atrue%252C%255C%2522sortMethodChoice%255C%2522%253A%255C%2522date%255C%2522%252C%255C%2522useLatestAssetDateAsReleaseDate%255C%2522%253Afalse%252C%255C%2522releaseTitleAsVersion%255C%2522%253Afalse%252C%255C%2522trackOnly%255C%2522%253Afalse%252C%255C%2522versionExtractionRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522matchGroupToUse%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522versionDetection%255C%2522%253Atrue%252C%255C%2522releaseDateAsVersion%255C%2522%253Afalse%252C%255C%2522useVersionCodeAsOSVersion%255C%2522%253Afalse%252C%255C%2522apkFilterRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522invertAPKFilter%255C%2522%253Afalse%252C%255C%2522autoApkFilterByArch%255C%2522%253Afalse%252C%255C%2522appName%255C%2522%253A%255C%2522VK%2520Video%2520Patched%255C%2522%252C%255C%2522appAuthor%255C%2522%253A%255C%2522Solvo37%255C%2522%252C%255C%2522shizukuPretendToBeGooglePlay%255C%2522%253Afalse%252C%255C%2522allowInsecure%255C%2522%253Afalse%252C%255C%2522exemptFromBackgroundUpdates%255C%2522%253Afalse%252C%255C%2522skipUpdateNotifications%255C%2522%253Afalse%252C%255C%2522about%255C%2522%253A%255C%2522VK%2520Video%2520patched%2520builds%2520by%2520Solvo37%255C%2522%252C%255C%2522refreshBeforeDownload%255C%2522%253Afalse%257D%2522%252C%2522overrideSource%2522%253Anull%252C%2522allowIdChange%2522%253Afalse%252C%2522releaseUrl%2522%253A%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%252Freleases%252Ftag%252F1.163.6%2522%257D)

Патчи **Morphe** и готовая подписанная ARM64-сборка **VK Видео** без найденных рекламных блоков. Модифицированный VK Видео устанавливается рядом с обычным VK.

## Скачать

**Текущий стабильный релиз: 1.163.6**  
Android внутри APK: **1.163 / versionCode 51920**.

➡️ [Скачать последний APK](https://github.com/Solvo37/vk-video-morphe-patches/releases/latest)

В Releases публикуется **только один APK**. Служебные отчёты, checksums и build metadata остаются в GitHub Actions и не засоряют список загрузок.

## Что изменено

- совместная установка с обычным `com.vkontakte.android`;
- bypass проверки подписи в `libvkcore.so`;
- отключение встроенного update prompt VK Видео;
- удаление найденных рекламных путей в обычном видео и VK Клипах;
- скрытие рекламных карточек/баннеров на Home, Discover и в профиле;
- блокировка ad pixel tracking;
- fail-closed проверки: если новая версия VK Видео несовместима с патчами, APK не публикуется.

Полный список активных патчей хранится в [patches-list.json](./patches-list.json).

## Установка

1. Если установлен официальный **VK Видео**, удалите его один раз — официальный APK и этот проект подписаны разными сертификатами.
2. Обычный **VK** удалять не нужно.
3. Установите APK из [Latest Release](https://github.com/Solvo37/vk-video-morphe-patches/releases/latest).

Все релизы проекта подписываются одним постоянным сертификатом, поэтому следующие сборки ставятся поверх предыдущих.

## Автообновление

Workflow **VK Video auto build** каждые 6 часов проверяет RuStore, Google Play и APKPure, валидирует package/certificate и выбирает самый новый подтверждённый `versionCode`.

Схема версий Releases отделена от Android `versionName`:

- текущий стабильный релиз: `1.163.6`;
- следующий rebuild этой же Android-версии: `1.163.7`;
- новая Android-версия 1.164 начнётся с `1.164.0`.

Каждый Release immutable: существующий APK не перезаписывается. Это важно для корректной работы клиентов обновлений и кэша GitHub asset IDs.

### Obtainium

[![Добавить в Obtainium](https://img.shields.io/badge/Obtainium-%D0%94%D0%BE%D0%B1%D0%B0%D0%B2%D0%B8%D1%82%D1%8C-7c4dff?logo=android&logoColor=white)](https://apps.obtainium.imranr.dev/redirect?r=obtainium%3A%2F%2Fapp%2F%257B%2522id%2522%253A%2522com.vk.vkvideo%2522%252C%2522url%2522%253A%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%2522%252C%2522author%2522%253A%2522Solvo37%2522%252C%2522name%2522%253A%2522VK%2520Video%2520Patched%2522%252C%2522installedVersion%2522%253Anull%252C%2522latestVersion%2522%253A%25221.163.6%2522%252C%2522apkUrls%2522%253A%2522%255B%255B%255C%2522VK-Video-1.163.6-patched.apk%255C%2522%252C%255C%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%252Freleases%252Fdownload%252F1.163.6%252FVK-Video-1.163.6-patched.apk%255C%2522%255D%255D%2522%252C%2522preferredApkIndex%2522%253A0%252C%2522additionalSettings%2522%253A%2522%257B%255C%2522includePrereleases%255C%2522%253Afalse%252C%255C%2522fallbackToOlderReleases%255C%2522%253Atrue%252C%255C%2522filterReleaseTitlesByRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522filterReleaseNotesByRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522verifyLatestTag%255C%2522%253Atrue%252C%255C%2522sortMethodChoice%255C%2522%253A%255C%2522date%255C%2522%252C%255C%2522useLatestAssetDateAsReleaseDate%255C%2522%253Afalse%252C%255C%2522releaseTitleAsVersion%255C%2522%253Afalse%252C%255C%2522trackOnly%255C%2522%253Afalse%252C%255C%2522versionExtractionRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522matchGroupToUse%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522versionDetection%255C%2522%253Atrue%252C%255C%2522releaseDateAsVersion%255C%2522%253Afalse%252C%255C%2522useVersionCodeAsOSVersion%255C%2522%253Afalse%252C%255C%2522apkFilterRegEx%255C%2522%253A%255C%2522%255C%2522%252C%255C%2522invertAPKFilter%255C%2522%253Afalse%252C%255C%2522autoApkFilterByArch%255C%2522%253Afalse%252C%255C%2522appName%255C%2522%253A%255C%2522VK%2520Video%2520Patched%255C%2522%252C%255C%2522appAuthor%255C%2522%253A%255C%2522Solvo37%255C%2522%252C%255C%2522shizukuPretendToBeGooglePlay%255C%2522%253Afalse%252C%255C%2522allowInsecure%255C%2522%253Afalse%252C%255C%2522exemptFromBackgroundUpdates%255C%2522%253Afalse%252C%255C%2522skipUpdateNotifications%255C%2522%253Afalse%252C%255C%2522about%255C%2522%253A%255C%2522VK%2520Video%2520patched%2520builds%2520by%2520Solvo37%255C%2522%252C%255C%2522refreshBeforeDownload%255C%2522%253Afalse%257D%2522%252C%2522overrideSource%2522%253Anull%252C%2522allowIdChange%2522%253Afalse%252C%2522releaseUrl%2522%253A%2522https%253A%252F%252Fgithub.com%252FSolvo37%252Fvk-video-morphe-patches%252Freleases%252Ftag%252F1.163.6%2522%257D)

Кнопка сразу импортирует текущий стабильный APK и настройки GitHub-обновлений. APK-фильтр не нужен: в каждом Release публикуется ровно один APK.

Repository URL:

```text
https://github.com/Solvo37/vk-video-morphe-patches
```

APK asset filter:

```text
^VK-Video-.*-patched\.apk$
```

Release title filter при необходимости:

```text
^VK Video
```

## Для разработки

Сборка Morphe bundle:

```bash
gradle :patches:buildAndroid
```

Ключевые файлы:

- `patches/` — исходники патчей;
- `ci/` — проверки совместимости и выбор upstream;
- `.github/workflows/auto-update.yml` — автоматическая сборка и публикация;
- `CHANGELOG.md` — история изменений.

## Важно

Проект не связан с VK, VK Видео, Morphe или Obtainium и не одобрен ими. Репозиторий не содержит исходный код VK Видео.

Код проекта: [GPL-3.0](./LICENSE).
