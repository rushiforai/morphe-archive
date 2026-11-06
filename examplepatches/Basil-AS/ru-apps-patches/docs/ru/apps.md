# Поддерживаемые приложения

Полный, автоматически генерируемый на релизе список патчей (94 на данный момент) — в разделе
между `<!-- PATCHES_START -->`/`<!-- PATCHES_END -->` в [README](../../README.md) — не редактируется
руками. Здесь — обзор по приложениям, какие пакеты покрыты и чем.

| Приложение | Пакет | Что покрыто |
|---|---|---|
| MAX | `ru.oneme.app` | Обход проверки VPN, отключение фоновых телеметрийных воркеров (диагностические аплоады, ежедневный аудит разрешений) |
| Авито | `com.avito.android` | Реклама, блок-лист объявлений, телеметрия, "профи"-продавцы, принудительные обновления, настройки, UI |
| Ozon | `ru.ozon.app.android` | Реклама (два независимых набора патчей — xob0t и Jl4cTuk, держатся раздельно для сравнения) |
| Wildberries | `com.wildberries.ru` | Реклама |
| Т-Банк | `com.idamob.tinkoff.android` | Реклама, обход anti-tamper (RASP) |
| Альфа-Банк | `ru.alfabank.mobile.android` | Compatibility target для проверенной версии; app-specific bytecode patch пока не добавлен |
| ВТБ Онлайн | `ru.vtb24.mobilebanking.android` | Compatibility target для проверенной версии; app-specific bytecode patch пока не добавлен |
| Mir Pay | `ru.nspk.mirpay` | Compatibility target для проверенной версии; app-specific bytecode patch пока не добавлен |
| RuStore | `ru.vk.store` | Реклама, аналитика, фоновый антивирус-скан, permissions, push, device-id (два независимых набора — Freeman022026 и Jl4cTuk) |
| Сбербанк | `ru.sberbankmobile` | Фоновый антивирус-скан (Kaspersky KAV SDK) — первый открытый патч для этого приложения |
| RuTube | `ru.rutube.app` | Реклама, фоновое воспроизведение, ограничения на скачивание, подписка |
| VK Видео | `com.vk.vkvideo` | Реклама, совместная установка со штатным VK |
| Озон Банк | `ru.ozon.fintech.finance` | VPN-предупреждение, реклама, промо |
| — универсально, любое приложение | — | Спуфинг VPN-детекта (API + JVM-прокси + default-прокси + DNS + MTU + enum. VPN-приложений + телеметрийное поле), отключение MyTracker/AppMetrica (оба namespace)/Firebase/Sentry/Adjust/AppsFlyer/freeRASP, спуф emulator/install-source/USB-debug статусов |

Разведка (без отдельного патча — покрыто универсальными патчами, либо риск патчить выше пользы):
Газпромбанк, Альфа-Банк, ВТБ, Яндекс Go, Яндекс Карты и ещё 79 приложений — подробности и методология
в `apps/COVERAGE.md` и `apps/MULTILAYER_DEFENSE_MATRIX.md` (локальные, не публикуются).
