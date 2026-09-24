# Upstream и автоматические обновления

## Источники

Workflow **VK Video auto build** каждые 6 часов проверяет:

- RuStore;
- Google Play через gplaydl;
- APKPure через apkeep.

Каждый кандидат проверяется по package и оригинальному сертификату VK. Из прошедших проверку выбирается APK с максимальным подтверждённым `versionCode`. При одинаковом `versionCode` источник используется только как tie-breaker.

## Baseline

Текущая подтверждённая baseline хранится в `ci/baseline.json`.

Она содержит Android `versionName`, `versionCode` и tag последнего стабильного проектного Release. После успешной публикации workflow сам обновляет baseline и коммитит её в `main`.

Downgrade ниже baseline не публикуется.

## Проверки совместимости

До публикации workflow проверяет:

1. package `com.vk.vkvideo`;
2. оригинальный SHA-256 сертификата VK;
3. `versionName` и `versionCode`;
4. обязательные Morphe patches;
5. manifest coexistence с обычным VK;
6. Application class / multidex;
7. ARM64 native signature-bypass pattern;
8. отсутствие v1/JAR signature;
9. `zipalign`;
10. постоянный сертификат проекта на финальном APK.

Если новая версия VK Видео меняет fingerprints или native pattern, сборка завершается ошибкой и APK **не публикуется**. Вместо молчаливого выпуска несовместимой сборки workflow создаёт compatibility issue.

## Версии Releases

Номер GitHub Release отделён от Android `versionName` и имеет вид:

```text
<android-version>.<project-revision>
```

Пример:

```text
1.163.6   текущий стабильный релиз
1.163.7   следующий rebuild Android 1.163
1.164.0   первый релиз Android 1.164
```

Существующий Release никогда не перезаписывается: каждый APK получает новый immutable tag и новый GitHub asset ID.

## Что публикуется

В публичный GitHub Release помещается только:

```text
VK-Video-<release-tag>-patched.apk
```

`upstream.json`, build metadata, Morphe report, static/final gate и checksum сохраняются как GitHub Actions artifacts. Они остаются доступны для диагностики, но не засоряют список файлов Release.
