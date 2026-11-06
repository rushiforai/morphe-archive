# Сводный целевой перечень российских приложений (Target List)

Локальный исследовательский реестр российских Android-приложений для анализа детекта VPN, аналитики и создания патчей.
Машиночитаемая версия: [`research/targets.tsv`](file:///var/home/basil/Projects/ru_apps_patching/research/targets.tsv).

Для расширения покрытия используется отдельная матрица [`research/ru_apps_expansion.tsv`](research/ru_apps_expansion.tsv): 24 уникальных пакета из запрошенного списка (Go/Taxi — один пакет), включая отдельный Яндекс Пэй. Все 24 APK-набора скачаны реализацией Basil-AS/rustore-downloader; package identity, версия, состав split-файлов, SHA-256, ZIP/CRC и подписи файлов проверены. Глобальный пакет AliExpress `com.alibaba.aliexpresshd` не опубликован в RuStore (API возвращает 404); российский AliExpress `ru.aliexpress.buyer` доступен и проверен. Результаты применения финального `.mpp` записаны в `research/ru_apps_validation_20261012.md`.

Проверка матрицы и локального каталога загрузок:

```text
python scripts/verify_rustore_downloads.py --matrix research/ru_apps_expansion.tsv --downloads /path/to/rustore-downloads
```

Для multi-APK строк SHA-256 вычисляется от канонического списка `filename<TAB>file_sha256` в лексикографическом порядке. Валидатор читает архивы только как байты и не исполняет APK или загруженные скрипты.

## Общая сводка

- **Всего целевых приложений:** 100
- **Источники данных:**
  1. `phone` — `research/phone_apps_russian.md` (88 приложений, установленных на устройстве realme GT Neo 5).
  2. `pdf` — `research/pdf_rks.txt` (30 приложений из отчёта RKS Global по детекции VPN и сбору телеметрии; 20 установлены на телефоне, 10 внешних).
  3. `vpnhide` — `source/vpnhide_stats.json` и `source/vpnhide_debug_20261004_145841/` (74 приложения из политики `policy.txt`; 73 на телефоне + `home.tuvio.com`).
  4. `4pda_mod` — `template/Описания.txt` (3 модификации с 4PDA: MAX `ru.oneme.app`, Яндекс Карты `ru.yandex.yandexmaps`, AliExpress `com.alibaba.aliexpresshd`).
- **Статус в RuStore (`in_rustore`):** `unknown` для всех записей (локальное статическое сведение без внешних сетевых запросов).

### Распределение по категориям

| Категория | Количество |
|---|---|
| Маркетплейсы и ритейл | 19 |
| Яндекс | 16 |
| Госсервисы и город | 13 |
| Банки и платежи | 12 |
| Развлечения и медиа | 10 |
| Прочее (рос. разработчики) | 9 |
| Соцсети и мессенджеры | 6 |
| Еда, доставка, рестораны | 5 |
| Транспорт и самокаты | 5 |
| Связь и операторы | 4 |
| Магазины приложений | 1 |
| **Итого** | **100** |

### Распределение по источникам

| Набор источников | Количество | Примеры |
|---|---|---|
| `phone,vpnhide` | 53 | СДЭК, Почта России, Whoosh |
| `phone,pdf,vpnhide` | 18 | Авито, Т-Банк, Wildberries |
| `phone` | 15 | Alias, Colizeum, Яндекс Афиша |
| `pdf` | 10 | VK Музыка, VK Видео, ВКонтакте |
| `phone,pdf,vpnhide,4pda_mod` | 2 | MAX, Яндекс Карты |
| `4pda_mod` | 1 | AliExpress |
| `vpnhide` | 1 | Tuvio |

## Примечания и неразрешённые идентификаторы

1. **Неразрешённые UID (5 штук):** В журнале статистики `source/vpnhide_stats.json` зафиксированы UID `10423`, `10480`, `10495`, `10517`, `10560` с нулевой сетевой активностью. Они отсутствуют в `policy.txt`, а команда сопоставления `adb shell pm list packages -U` не была выполнена из-за недоступности устройства в момент снятия дампа. Их пакеты невозможно однозначно восстановить из локальных файлов.
2. **Служебный пакет `dev.soranerai.vpnhidenext`:** Присутствует в `policy.txt` (UID 10561) для проведения встроенной самодиагностики хуков (40/40 тестов), но исключён из списка целевых приложений, так как является самим инструментом скрытия (KernelSU/LSPosed-модулем), а не сторонним российским приложением.
3. **Умный дом Tuvio (`home.tuvio.com`):** Включён в список как бренд умной техники Яндекса для российского рынка (установлен на телефоне, версия 1.2.1, присутствует в политике VPNHide).
4. **Особенность пакета клавиатуры:** Пакет Яндекс Клавиатуры на устройстве имеет имя `ru.yandex.androidkeyboare` (модифицированная сборка с версией 99999999). Имя сохранено в соответствии с фактическим состоянием системы.
5. **AliExpress:** В списке представлены две сущности — `ru.aliexpress.buyer` (клиент AliExpress Россия на телефоне и в политике VPNHide) и `com.alibaba.aliexpresshd` (глобальный клиент из мода 4PDA).

## Сводная таблица целевых приложений (100)

| № | Пакет | Название | Категория | Источники | Версия на телефоне | in_rustore |
|---|---|---|---|---|---|---|
| 1 | `com.alibaba.aliexpresshd` | AliExpress | Маркетплейсы и ритейл | `4pda_mod` | - | unknown |
| 2 | `com.avito.android` | Авито | Маркетплейсы и ритейл | `phone,pdf,vpnhide` | 234.0 | unknown |
| 3 | `com.berrylab.alias.premium` | Alias | Прочее (рос. разработчики) | `phone` | 1.2.9 | unknown |
| 4 | `com.colizeumarena.colizeum` | Colizeum | Прочее (рос. разработчики) | `phone` | 2.5.0 | unknown |
| 5 | `com.electro_tickets.app` | Яндекс Афиша | Развлечения и медиа | `phone` | 1.19.1 | unknown |
| 6 | `com.gpn.azs` | АЗС Газпромнефть | Транспорт и самокаты | `phone` | 5.1.0 | unknown |
| 7 | `com.icemobile.lenta.prod` | Лента | Маркетплейсы и ритейл | `phone` | 6.99.0 | unknown |
| 8 | `com.idamob.tinkoff.android` | Т-Банк | Банки и платежи | `phone,pdf,vpnhide` | 8.3.0 | unknown |
| 9 | `com.idamobile.android.crediteuropa` | Кредит Европа Банк | Банки и платежи | `phone` | 3.1.2163 | unknown |
| 10 | `com.logistic.sdek` | СДЭК | Маркетплейсы и ритейл | `phone,vpnhide` | 5.15.0 | unknown |
| 11 | `com.octopod.russianpost.client.android` | Почта России | Госсервисы и город | `phone,vpnhide` | 26.8.1 | unknown |
| 12 | `com.programmisty.emiasapp` | ЕМИАС.ИНФО | Госсервисы и город | `phone` | 7.61.1 | unknown |
| 13 | `com.punicapp.whoosh` | Whoosh | Транспорт и самокаты | `phone,vpnhide` | 3.20.1 | unknown |
| 14 | `com.rndelikateska` | Деликатеска.ру | Еда, доставка, рестораны | `phone` | 3.0.4 | unknown |
| 15 | `com.ru.dixy` | Дикси | Маркетплейсы и ритейл | `phone` | 4.14.0 | unknown |
| 16 | `com.salute.smarthome.prod` | Салют! Умный дом | Развлечения и медиа | `phone` | 26.09.1.18330 | unknown |
| 17 | `com.sdkit.search.app` | Салют | Развлечения и медиа | `phone` | 1.33.0.17 | unknown |
| 18 | `com.uma.musicvk` | VK Музыка | Развлечения и медиа | `pdf` | - | unknown |
| 19 | `com.vk.vkvideo` | VK Видео | Развлечения и медиа | `pdf` | - | unknown |
| 20 | `com.vkontakte.android` | ВКонтакте | Соцсети и мессенджеры | `pdf` | - | unknown |
| 21 | `com.wildberries.ru` | Wildberries | Маркетплейсы и ритейл | `phone,pdf,vpnhide` | 7.8.2002 | unknown |
| 22 | `com.yandex.browser` | Яндекс Браузер | Яндекс | `pdf` | - | unknown |
| 23 | `com.yandex.internetometer` | Интернетометр | Яндекс | `phone,vpnhide` | 1.0.2 | unknown |
| 24 | `com.yandex.iot` | Умный дом с Алисой | Яндекс | `phone,vpnhide` | 26.18.0.universal | unknown |
| 25 | `com.yandex.yamb` | Яндекс Мессенджер | Соцсети и мессенджеры | `phone,vpnhide` | 238.11.219 | unknown |
| 26 | `com.zvooq.openplay` | Звук | Развлечения и медиа | `phone` | 4.117.0 | unknown |
| 27 | `home.tuvio.com` | Tuvio | Яндекс | `vpnhide` | 1.2.1 | unknown |
| 28 | `io.itforces.android.timetable` | Мой колледж | Прочее (рос. разработчики) | `phone` | 9.2.0 | unknown |
| 29 | `me.rutrackersearch.app` | RuTracker Поиск | Прочее (рос. разработчики) | `phone` | 4.6.3 | unknown |
| 30 | `re.sova.five` | Sova V RE | Соцсети и мессенджеры | `phone,vpnhide` | 8.38 | unknown |
| 31 | `ru.alfabank.mobile.android` | Альфа-Банк | Банки и платежи | `phone,pdf,vpnhide` | 12.60.07 | unknown |
| 32 | `ru.aliexpress.buyer` | AliExpress Россия | Маркетплейсы и ритейл | `phone,vpnhide` | 8.89.1.3597464 | unknown |
| 33 | `ru.beeline.services` | билайн | Связь и операторы | `phone,vpnhide` | 5.48.1 | unknown |
| 34 | `ru.beru.android` | Яндекс Маркет | Яндекс | `phone,pdf,vpnhide` | 2026.37.2.a | unknown |
| 35 | `ru.burgerking` | Бургер Кинг | Еда, доставка, рестораны | `phone,vpnhide` | 11.10.0.g | unknown |
| 36 | `ru.crptech.mark` | Честный ЗНАК | Госсервисы и город | `phone,vpnhide` | 4.78.1 | unknown |
| 37 | `ru.dodopizza.app` | Додо Пицца | Еда, доставка, рестораны | `phone,vpnhide` | 26.18.1 | unknown |
| 38 | `ru.domopult.mosobleirc.android` | МосОблЕИРЦ | Госсервисы и город | `phone,vpnhide` | 6.4.8 | unknown |
| 39 | `ru.dostaevsky.android` | Dostaевский | Еда, доставка, рестораны | `phone,vpnhide` | 2.56.0 | unknown |
| 40 | `ru.dublgis.dgismobile` | 2ГИС | Транспорт и самокаты | `phone,pdf,vpnhide` | 7.28.0.629.18 | unknown |
| 41 | `ru.foodfox.client` | Яндекс Еда | Еда, доставка, рестораны | `pdf` | - | unknown |
| 42 | `ru.gazprombank.android.mobilebank.app` | Газпромбанк | Банки и платежи | `phone,vpnhide` | 6.4.3 | unknown |
| 43 | `ru.gosuslugi.goskey` | Госключ | Госсервисы и город | `phone,vpnhide` | 2.20.0 | unknown |
| 44 | `ru.instamart` | Купер | Маркетплейсы и ритейл | `phone,vpnhide` | 17.5.58 (37552743) | unknown |
| 45 | `ru.kinopoisk` | Кинопоиск | Развлечения и медиа | `pdf` | - | unknown |
| 46 | `ru.langame.cyberx` | CyberX | Прочее (рос. разработчики) | `phone,vpnhide` | 2.0.0 | unknown |
| 47 | `ru.lewis.dbo` | ПСБ | Банки и платежи | `phone,vpnhide` | 3.55.0 | unknown |
| 48 | `ru.mail.mailapp` | Почта Mail.ru | Прочее (рос. разработчики) | `pdf` | - | unknown |
| 49 | `ru.megafon.mlk` | МегаФон | Связь и операторы | `phone,pdf,vpnhide` | 4.69.0 | unknown |
| 50 | `ru.megamarket.marketplace` | Мегамаркет | Маркетплейсы и ритейл | `phone,pdf,vpnhide` | 6.9 | unknown |
| 51 | `ru.megaplan.megaplan3app` | Мегаплан | Прочее (рос. разработчики) | `phone,vpnhide` | 8.0.1 | unknown |
| 52 | `ru.more.play` | more.tv | Развлечения и медиа | `phone,vpnhide` | 8.186.0 | unknown |
| 53 | `ru.mos.ed` | Электронный дневник МЭШ | Госсервисы и город | `phone,vpnhide` | 2.47 | unknown |
| 54 | `ru.mos.ourcity` | Наш город | Госсервисы и город | `phone,vpnhide` | 1.15.0-8228 | unknown |
| 55 | `ru.mosmetro.metro` | Метро Москвы | Госсервисы и город | `phone,vpnhide` | 4.5.10 | unknown |
| 56 | `ru.msp.rf.app` | МСП.РФ | Банки и платежи | `phone,vpnhide` | 2.4.2-gms | unknown |
| 57 | `ru.mts.mymts` | Мой МТС | Связь и операторы | `phone,pdf,vpnhide` | 6.76 | unknown |
| 58 | `ru.netstatus.app` | NetStatus | Прочее (рос. разработчики) | `phone,vpnhide` | 0.5.5 | unknown |
| 59 | `ru.nspk.mirpay` | Mir Pay | Банки и платежи | `phone,pdf,vpnhide` | 1.64.5.350 | unknown |
| 60 | `ru.ok.android` | Одноклассники | Соцсети и мессенджеры | `pdf` | - | unknown |
| 61 | `ru.oneme.app` | MAX | Соцсети и мессенджеры | `phone,pdf,vpnhide,4pda_mod` | 26.34.1 | unknown |
| 62 | `ru.otpbank.mobile` | ОТП Банк | Банки и платежи | `phone,vpnhide` | 2.18.0-gms | unknown |
| 63 | `ru.ozon.app.android` | Ozon | Маркетплейсы и ритейл | `phone,pdf,vpnhide` | 19.37.0 | unknown |
| 64 | `ru.perekrestok.app` | Перекрёсток | Маркетплейсы и ритейл | `phone,vpnhide` | 3.99.0 | unknown |
| 65 | `ru.pyaterochka.app.browser` | Пятёрочка | Маркетплейсы и ритейл | `phone,vpnhide` | 3.43.0 | unknown |
| 66 | `ru.rostel` | Госуслуги | Госсервисы и город | `phone,pdf,vpnhide` | 27.0.1.9810-gms | unknown |
| 67 | `ru.rshb.dbo` | Россельхозбанк | Банки и платежи | `phone,vpnhide` | 26.09.2 | unknown |
| 68 | `ru.russianhighways.mobile` | Автодор | Госсервисы и город | `phone,vpnhide` | 2.2.4 | unknown |
| 69 | `ru.rutube.app` | Rutube | Развлечения и медиа | `pdf` | - | unknown |
| 70 | `ru.rzd.pass` | РЖД Пассажирам | Госсервисы и город | `phone,vpnhide` | 2.58.6765 | unknown |
| 71 | `ru.sbcs.store` | Самокат | Маркетплейсы и ритейл | `phone,pdf,vpnhide` | 4.18.0 | unknown |
| 72 | `ru.sberbankmobile` | СберБанк | Банки и платежи | `phone,pdf,vpnhide` | 17.12.0 | unknown |
| 73 | `ru.sigma.gisgkh` | ГИС ЖКХ | Госсервисы и город | `phone,vpnhide` | 5.0.0 | unknown |
| 74 | `ru.tander.magnit` | Магнит | Маркетплейсы и ритейл | `phone,vpnhide` | 8.123.0 | unknown |
| 75 | `ru.tele2.mytele2` | Мой Tele2 | Связь и операторы | `phone,vpnhide` | 6.50.1 | unknown |
| 76 | `ru.tii.lkcomu` | Мосэнергосбыт | Госсервисы и город | `phone,vpnhide` | 1.42.3GMS | unknown |
| 77 | `ru.tsk.ftc.bender.qpay` | Квартплата+ | Банки и платежи | `phone,vpnhide` | 3.199.0 | unknown |
| 78 | `ru.urentbike.app` | Юрент | Транспорт и самокаты | `phone,vpnhide` | 2.6.1 | unknown |
| 79 | `ru.usetech.velobike.v2` | Велобайк | Транспорт и самокаты | `phone,vpnhide` | 5.8.4 | unknown |
| 80 | `ru.uteka.app` | Ютека | Маркетплейсы и ритейл | `phone,vpnhide` | 2.23.11 | unknown |
| 81 | `ru.vk.store` | RuStore | Магазины приложений | `phone,pdf,vpnhide` | 1.110.0.5 | unknown |
| 82 | `ru.vkusvill` | ВкусВилл | Маркетплейсы и ритейл | `phone,vpnhide` | 26.17.5 | unknown |
| 83 | `ru.vtb24.mobilebanking.android` | ВТБ Онлайн | Банки и платежи | `phone,pdf,vpnhide` | 20.17.0.3 | unknown |
| 84 | `ru.winelab` | ВинЛаб | Маркетплейсы и ритейл | `phone,vpnhide` | 5.30.1 | unknown |
| 85 | `ru.x5.perekrestok.darkstore` | Впрок Перекрёсток | Маркетплейсы и ритейл | `phone,vpnhide` | 2.25.2 | unknown |
| 86 | `ru.yandex.androidkeyboare` | Яндекс Клавиатура | Яндекс | `phone,vpnhide` | 124.3 | unknown |
| 87 | `ru.yandex.disk` | Яндекс Диск | Яндекс | `phone,vpnhide` | 6.87.1 | unknown |
| 88 | `ru.yandex.key` | Яндекс Ключ | Яндекс | `phone,vpnhide` | 5.9.0 | unknown |
| 89 | `ru.yandex.mail` | Яндекс Почта | Яндекс | `phone,vpnhide` | 9.30.0 | unknown |
| 90 | `ru.yandex.music` | Яндекс Музыка | Яндекс | `phone,pdf,vpnhide` | 2026.09.4 #166gpr | unknown |
| 91 | `ru.yandex.rasp` | Яндекс Расписания | Яндекс | `phone,vpnhide` | 3.73.0 | unknown |
| 92 | `ru.yandex.simapp` | Яндекс Смена | Яндекс | `phone,vpnhide` | 1.7.0 | unknown |
| 93 | `ru.yandex.taxi` | Яндекс Go | Яндекс | `phone,pdf,vpnhide` | 5.98.0 | unknown |
| 94 | `ru.yandex.telemost` | Яндекс Телемост | Соцсети и мессенджеры | `phone,vpnhide` | 3.33.0.231 | unknown |
| 95 | `ru.yandex.translate` | Яндекс Переводчик | Яндекс | `phone,vpnhide` | 117.1 | unknown |
| 96 | `ru.yandex.weatherplugin` | Яндекс Погода | Яндекс | `phone,vpnhide` | 26.9.50 | unknown |
| 97 | `ru.yandex.yandexmaps` | Яндекс Карты | Яндекс | `phone,pdf,vpnhide,4pda_mod` | 31.0.3 | unknown |
| 98 | `ru.yourok.torrserve` | TorrServe MatriX | Прочее (рос. разработчики) | `phone` | MatriX.143.Client | unknown |
| 99 | `ru.zdravcity.app` | Здравсити | Маркетплейсы и ритейл | `phone,vpnhide` | 2.57.1 | unknown |
| 100 | `ru.zen.android` | Дзен | Развлечения и медиа | `pdf` | - | unknown |
