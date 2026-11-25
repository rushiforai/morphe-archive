[English](README.md) | **Русский**

# Nyandex

> [!WARNING]
> **Nyandex является полным вайбкодом.** Весь код написан ИИ.

Патчи для Яндекс Музыки на базе [Morphe](https://morphe.software): 
- тексты песен из LRCLIB
- Тема Material You
- Скрываемые вкладки нижней панели
- Тактильный отклик
- Страница настроек в самом приложении
- Вырез телеметрии

Nyandex не связан ни с Яндексом, ни с Morphe.

## Как пользоваться

Добавьте патчи в Morphe Manager как источник:

<a href="https://morphe.software/add-source?github=Ser1-1y/nyandex">
  <img src=".github/assets/add-to-morphe.svg" alt="Добавить в Morphe" height="48">
</a>

- Не выключайте **Подменить подпись приложения**.
  Без него вход через Яндекс ID не работает.
- После патчинга в приложении появятся настройки Nyandex:
  **Настройки → Nyandex → Настройки Nyandex**.

### Поддерживаемые версии

| Приложение | Версии |
|---|---|
| Яндекс Музыка (`ru.yandex.music`) | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` |

Проверялось только на этих версиях.

## Патчи

<!-- PATCHES_START EXPANDED -->
> **[v1.7.0](https://github.com/Ser1-1y/nyandex/releases/tag/v1.7.0)**&nbsp;&nbsp;&middot;&nbsp;&nbsp;`main`&nbsp;&nbsp;&middot;&nbsp;&nbsp;Патчей: **15** · Приложений: **1**&nbsp;&nbsp;&middot;&nbsp;&nbsp;[Подробнее](PATCHES.md)

| # | Приложение | Патчи | Версия | Пакет |
|---|---|---|---|---|
| 1 | [**Yandex Music**](PATCHES.md#yandex-music-ruyandexmusic) | 15 | `2026.11.1 #171gpr`, `2026.11.2 #172.1gpr` | [`ru.yandex.music`](https://play.google.com/store/apps/details?id=ru.yandex.music) |
<!-- PATCHES_END -->

## Примечания

- **Тексты песен**: берутся из LRCLIB, бесплатной базы, которую пополняют слушатели.
- **Чистые ссылки**: убирают из ссылок «Поделиться» и «Скопировать ссылку» метки `utm_*` и `ref_id`.
- **Monet**: тема для Android 12+.
- **Скрытие вкладок** нижней панели настраивается в Настройки → Nyandex → Настройки Nyandex.
- **Скрытие промо**, предложений Плюса и баннеров настраивается там же.
- **Тактильный отклик**: добавляет короткую вибрацию при нажатии кнопок. Настраивается в настройках Nyandex.

## Сборка

Нужны JDK 17 или новее и Android SDK (`ANDROID_HOME`).

```bash
./gradlew :patches:buildAndroid
```

### Тесты

```bash
YM_APK=/path/to/stock/base.apk ./gradlew :patches:test --rerun
```

## Лицензия

GPLv3, см. [LICENSE](LICENSE). Собрано на основе
[шаблона патчей Morphe](https://github.com/MorpheApp/morphe-patches-template); об ограничении на
использование названия Morphe см. [NOTICE](NOTICE). Патч «Подменить подпись приложения» использует
подмену подписи из библиотеки патчей Morphe.
