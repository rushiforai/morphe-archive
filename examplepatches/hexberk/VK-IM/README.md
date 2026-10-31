# VK IM patches

Патчи [Morphe](https://github.com/MorpheApp) для VK Мессенджера (`com.vk.im`). Убирают рекламу
и трекинг, функции приложения не трогают. Собраны из патчей
[PerfLite/VK-Zen](https://github.com/PerfLite/VK-Zen) для большого клиента ВКонтакте.

Поддерживаемая версия: VK Мессенджер 1.332.

## Патчи

| Патч | Что делает |
|---|---|
| Hide feed ads | Убирает рекламные и спонсорские записи (`marked_as_ads`, рекламные вложения) в записях, которые открываются внутри мессенджера |
| Hide clips ads | Убирает рекламу в клипах |
| Video ads | Отключает рекламу в видеоплеере (preroll, midroll, postroll) |
| Disable audio ads | Отключает аудиорекламу |
| Disable telemetry | Выключает MyTracker, Firebase Analytics, Crashlytics, выгрузки отчётов OK Tracer (сбои, OpenTelemetry, дампы памяти) |
| Clone app | Ставит приложение рядом с официальным под пакетом `com.vk.im.morphe` и названием «VK IM» |
| Fix push notifications | Подставляет в запросы Firebase пакет и сертификат официального приложения, чтобы клон получал FCM-токен и пуши |
| Bypass security and package checks | Снимает проверки подписи и имени пакета, из-за которых переподписанный клон не входит в аккаунт |
| Native anti-tamper bypass | Обезвреживает проверку целостности в `libvkmedia.so`, которая роняет голосовые сообщения |

Внутренняя статистика VK (`AppStartReporter`, `BaseAnalyticsSender`) не отключена: через неё
идут синхронизация уведомлений и счётчик непрочитанных.

## Установка

В Morphe Manager добавьте источник патчей:

```
https://github.com/hexberk/VK-IM
```

Или скачайте `patches-<версия>.mpp` со страницы
[релизов](https://github.com/hexberk/VK-IM/releases/latest) и импортируйте в Morphe Manager. Клон
подписывается вашим ключом и встаёт рядом с официальным приложением, вход в аккаунт заново.

## Сборка

```bash
./gradlew :patches:buildAndroid :patches:generatePatchesList
```

Нужны `ANDROID_HOME` и доступ к GitHub Packages (`GITHUB_ACTOR`, `GITHUB_TOKEN`) для плагина
Morphe.

## Лицензия

GPL-3.0, см. [LICENSE](LICENSE). Основано на [PerfLite/VK-Zen](https://github.com/PerfLite/VK-Zen).
