# Неудачные patch-подходы

Читать запись нужного app/version/feature перед porting. Хранить только
отброшенный target или injection, причину отказа и рабочую замену.

## Ozon 19.27.0 — строки итогов в корзине

- Цель: убрать в блоке «Ваша корзина» строки «Товары (n)», «Скидка» и
  «Подробнее».
- Не использовать:
  - hooks в `cart.totalV3` (`PriceLineView`, `TextItemViewHolder`,
    `ButtonItemViewHolder`): fingerprints применяются, но активный экран
    использует `checkoutcomposer.total.presentation.main.TotalVH`;
  - новый label/branch внутри `TotalVH.bind`: после DEX rewrite вызывает
    `VerifyError: target dex pc ... is not at instruction start`.
- Использовать: в `TotalVH.bind(TotalVO, T30.d)` найти штатную проверку
  `pageType == "cart"` и сразу после её `if-eqz` скрыть `binding.pricesRv`.
  Новые branches не добавлять.
- Статус: runtime подтверждён; корзина открывается, нужные строки скрыты.

## Ozon 19.27.0 — рекламный `PromoStickyBubble`

- Цель: убрать редкий рекламный bubble справа снизу.
- Не использовать: поиск только объявленных в subclass методов `canMap`.
  `PromoStickyBubbleViewMapper` наследует `canMap`, поэтому такой scan его
  пропускает.
- Использовать: у direct subclasses
  `OverlayWidgetScreenViewItemMapper2` внутри `marketing.widgets` патчить
  собственные list-returning `map(...)` и возвращать `emptyList()`.
- Статус: build, root mount, patched DEX и cold start подтверждены; из-за
  редкого показа нужна длительная runtime-проверка.

## Ozon 19.27.0 — инициализация VK ID Tracer

- Цель: отключить VK ID telemetry без поломки auth и `VKCaptcha`.
- Не использовать: prepend полной `null`-инициализации полей и ранний `return`
  в `TrackingDeps.<init>`. Старые `try/catch` остаются недостижимыми, и JADX
  падает в `BlockProcessor`.
- Использовать: заменить создание Tracer на исключение внутри существующего
  `try`; штатный `catch (Throwable)` создаст предусмотренные SDK wrappers с
  `null` backend.
- Статус: build, exclusive/full apply, чистая JADX-декомпиляция и запуск
  приложения подтверждены.

## Ozon 19.27.0 — optional courier tips modules

- Цель: применять `Disable checkout tips` к разным builds с одним
  `versionName`.
- Не использовать: обязательный `.method` для targets из `fresh` и
  `checkoutorderdone`; отдельный build/split может их не содержать.
- Использовать: `matchAll(0..1)` для UI/API hooks, но оставлять три
  `CheckoutRequestInterceptor` hooks обязательными.
- Статус: локальный build/apply подтверждён; alternate build требует повторной
  проверки.

## RuStore 1.106.0.3 — Mine и navigation

- Не использовать: `MainViewState.featureMineRedesignEnabled` больше не
  читается UI; `ROOT_GRAPH_ROUTE` и hardcoded `tj1/t` descriptors исчезли после
  R8.
- Использовать: обнулять boolean в `MineDestination(Z)`; tabs находить по
  `ShowcaseTab.toString()`, Apps route — через `RecommendationAppsDestination`.
- Статус: full apply подтверждён, runtime не проверен.

## Ozon Банк 19.27.0 — предупреждение о VPN

- Цель: убрать snack `У вас включён VPN` после разблокировки и открытия
  главной.
- Не использовать: ранний `return-void` в
  `PinPadViewModel.showSnackVpn()`. Fingerprint, build и apply проходят, но
  предупреждение продолжает показываться после root mount.
- Подтверждено: mount был виден приложению, потому что одновременно
  применённая WebView-инъекция изменила главную. Следовательно,
  `showSnackVpn()` не является активным runtime-путём этого предупреждения.
- Использовать: возвращать `false` из
  `GetTypeNetworkBridgeInterface.isVpnConnected(ConnectivityManager)`. Этот
  отдельный native bridge сообщает VPN-флаг WebView главной страницы; не
  подменять одноимённый аналитический `NetworkInfoProvider`.
- Статус: старый target отвергнут после runtime-проверки; replacement прошёл
  build, apply, targeted JADX-проверку (`return false`) и runtime-проверку —
  предупреждение больше не показывается.

## Ozon Банк 19.27.0 — карточка `Новый счёт или продукт`

- Цель: убрать только рекламную карточку нового продукта, сохранив основной
  счёт и баланс.
- Не использовать:
  - безусловное скрытие ближайшего clickable-предка текстового узла. В текущем
    DOM этот предок охватывает весь carousel счетов, поэтому вместе с рекламой
    исчезают основной счёт и баланс;
  - только размерные ограничения `20–70%`/`40–240px` для карточки и
    `75%`/`25–110px` для строки. После повторного root mount баланс всё равно
    отсутствует, то есть размерная эвристика не гарантирует сохранность общего
    контейнера. Возможная, но не подтверждённая причина — промо появляется до
    асинхронной вставки данных основного счёта.
- Подтверждено: тем же observer успешно скрыты QR-реклама и
  `Увеличивайте накопления`; регресс ограничен выбором контейнера для карточки
  нового продукта.
- Использовать: дополнительно останавливать подъём по DOM на семантической
  границе пользовательского контента: `Основной счёт`, сумма с `₽`, совместное
  наличие быстрых действий `QR-код`/`Пополнить`/`Перевести` или
  `Последние операции`. Контейнер с такой границей запрещено скрывать даже как
  размерный match; выбирать последний предок до неё. Не запускать фильтр
  `Новый счёт или продукт`, пока в DOM не появился `Основной счёт`, и наблюдать
  также за `characterData` для асинхронного заполнения текста.
- Статус: исходная DOM-эвристика отвергнута после runtime-проверки;
  второй размерный replacement также отвергнут после runtime-проверки;
  отложенный семантический replacement прошёл build, apply, targeted
  JADX-проверку, JavaScript syntax check и runtime-проверку — основной счёт и
  баланс отображаются, карточка `Новый счёт или продукт` скрыта.

## Ozon Банк 19.27.0 — рекламная карусель под быстрыми действиями

- Цель: убрать всю рекламную карусель между быстрыми действиями и
  `Последними операциями`, независимо от текущего server-driven креатива.
- Не использовать: совпадение только по тексту `Сбор денег по QR`. Оно скрыло
  показанный QR-креатив, но после следующего root mount карусель отобразила
  другую карточку `Бесплатный совместный счёт для вас и близких`.
- Использовать: найти минимальный общий DOM-предок быстрых действий по
  совместному наличию `QR-код`, `Пополнить`, `Перевести`, затем скрыть самый
  крупный широкий (`>=75%` viewport) контейнер высотой `45–220px` в полосе
  сразу под ним и целиком выше заголовка `Последние операции`. Не принимать
  контейнеры, содержащие защищённый баланс, быстрые действия или сам заголовок
  операций.
- Статус: точечное совпадение с одним креативом отвергнуто после
  runtime-проверки; structural replacement прошёл build, apply, targeted
  JADX-проверку и JavaScript syntax check, но требует повторной
  runtime-проверки.

## Ozon Банк 19.27.0 — кавычки в WebView-инъекции

- Цель: скрывать штатные marketing banners по стабильному префиксу
  `data-testid="banner-type-…"`.
- Не использовать: двойные кавычки внутри JavaScript, который напрямую
  подставляется в smali `const-string`; Kotlin build проходит, но Morphe apply
  завершается parser error на содержимом CSS-селектора.
- Использовать: эквивалентный CSS attribute selector с unquoted identifier —
  `[data-testid^=banner-type-]`, не содержащий двойных кавычек.
- Статус: первый вариант отвергнут на exclusive apply; replacement прошёл
  build, exclusive apply, targeted JADX-проверку и JavaScript syntax check.

## Ozon Банк 19.27.0 — старый дизайн главной

- Цель: вместе с удалением рекламы автоматически включать старый дизайн
  главного экрана.
- Не использовать: поиск переключателя в native Android strings,
  `SharedPreferences`, WebView Local Storage или IndexedDB. Тексты настройки и
  состояние дизайна находятся в remote WebView frontend; соответствующих
  локальных Android-ключей нет.
- Использовать: штатный frontend user flag `DISABLED_MAIN_REDESIGN`. Экран
  настроек вызывает `UserFlagsStore.setFlag(DISABLED_MAIN_REDESIGN, true)` для
  старого дизайна; store и enum экспортируются из загруженного приложением
  self-service chunk.
- Статус: frontend-механизм подтверждён по production JS; инъекция прошла
  build, exclusive apply, targeted JADX-проверку и JavaScript syntax check,
  runtime-проверка после root mount ожидается.

## Ozon Банк 19.27.0 — несколько WebView-инъекций в одном method

- Цель: независимо применять базовую рекламную чистку и опциональную чистку
  секций через `FintechWebViewClient.onPageFinished`.
- Не использовать: несколько `addInstructions(0)` с условным переходом на
  terminal label, после которого внутри вставленного блока нет инструкции.
  При второй вставке label первой привязывается к новой инструкции по тому же
  индексу; результат — zero-offset branch.
- Подтверждено: root mount завершился успешно, но приложение упало до показа
  WebView. Logcat содержит `VerifyError` для `onPageFinished`: `branch offset
  of zero not allowed` по смещению `0x9`.
- Не использовать также: пытаться стабилизировать обе вставки на index `0`
  только добавлением `nop`. Zero-offset исчезает, но targeted JADX показывает
  искажённый null control-flow второй вставки в виде цикла; обращаться к
  `Fingerprint.method.instructions` — такого свойства в текущем patcher API
  нет, инструкции доступны через `method.implementation!!.instructions`.
- Не использовать также: вставку перед terminal `return-void`. На исходный
  return уже ведут штатные ветви, поэтому вставленный блок перехватывает их;
  targeted JADX снова показывает цикл и выполнение optional script после
  изменённого control-flow.
- Использовать: branch-free straight-line вставки из `const-string`, `const/4`
  и `invoke-virtual evaluateJavascript` в начале callback. Они не добавляют
  labels и не меняют control-flow при нескольких edits одного index;
  `onPageFinished` вызывается WebView с собственным `view` instance.
- Статус: варианты с terminal labels и вставкой перед return отвергнуты;
  branch-free replacement прошёл build, exclusive apply и targeted JADX:
  итоговый метод содержит два последовательных `evaluateJavascript`, после
  которых исходный control-flow сохранён. Повторный root mount и запуск
  подтвердили отсутствие прежнего `VerifyError`; приложение открывается.

## Ozon Банк 19.27.0 — глобальный поиск benefit-секций по тексту

- Цель: независимо убирать выбранные секции экрана `Выгода`, не затрагивая
  главную и другие страницы общего WebView.
- Не использовать: глобальный поиск заголовков benefit-секций без проверки
  текущего route. При включённой опции `hideOzonPremium` текст `Ozon Premium`
  совпадает с текстом профильного premium-бейджа на главной (верхний регистр
  задаётся стилями), после чего DOM-эвристика скрывает весь профильный блок.
- Подтверждено: после root mount со всеми четырьмя опциями приложение перестало
  падать, баланс сохранился, но верхний профильный блок на главной исчез;
  оригинальный APK задаёт маршруты `/m/lk/main` для главной и `/m/lk/bonus`
  для экрана benefit в `DefaultTabs`.
- Использовать: выполнять home cleanup только на `/m/lk/main`, а базовые и
  опциональные benefit cleanup — только на `/m/lk/bonus`; учитывать дочерние
  пути с завершающим `/`.
- Статус: глобальный текстовый target отвергнут после runtime-проверки;
  route-scoped replacement прошёл JavaScript syntax check, build, exclusive
  apply, targeted JADX и runtime-проверку: профильный блок и баланс главной
  восстановлены.

## Ozon Банк 19.27.0 — счётчик звёзд над benefit-контентом

- Цель: сохранить верхний счётчик звёзд при скрытии рекламных и опциональных
  секций экрана `Выгода`.
- Не использовать: ограничение только по route и размеру поднимаемого
  DOM-предка. Оно изолирует страницу, но не задаёт границу между верхним
  пользовательским состоянием и списком скрываемых секций. Не использовать
  также единственный literal `Выгода сейчас` как обязательный anchor: заголовок
  server-driven страницы может быть `Выгода за покупки`.
- Подтверждено: route-scoped версия восстановила главную, но после root mount
  счётчик звёзд над блоком `Выгода сейчас` отсутствует; сам блок и переключатели
  программы лояльности остаются на месте.
- Использовать: считать leaf `Выгода сейчас` семантическим началом очищаемого
  контента, принимая также актуальный вариант `Выгода за покупки`; обрабатывать
  только title nodes, которые следуют за найденным anchor в DOM, и останавливать
  подъём перед любым предком, содержащим этот anchor.
- Статус: прежняя DOM-граница отвергнута после runtime-проверки. Первый
  document-order replacement прошёл статические проверки, но на runtime не
  нашёл изменившийся заголовок `Выгода за покупки` и fail-closed оставил все
  benefit-секции видимыми. Replacement с двумя допустимыми anchor прошёл
  JavaScript syntax check, build, exclusive apply, targeted JADX и runtime:
  верхний счётчик звёзд сохранён, а benefit-cleanup снова выполняется. На
  runtime выявлен отдельный collateral hide секции `Купить за 1₽`.

## Ozon Банк 19.27.0 — сохранение `Купить за 1₽` рядом с рекламными секциями

- Цель: при `hideBuyForOneRuble=false` сохранить product carousel `Купить за
  1₽`, скрыв последующие рекламные и опциональные benefit-секции.
- Не использовать: в базовом `hideBenefitSection` останавливать подъём только
  по одному парному заголовку (`Розыгрыши`/`Бонусы`). Такой boundary не знает
  о соседних секциях и допускает выбор общего предка вместе с сохраняемым
  carousel.
- Подтверждено: после root mount `Купить за 1₽` сначала отрисовывается, затем
  исчезает при observer sweep. Итоговый DEX содержит
  `hideBuyForOneRuble=false`, а optional `selectedTitles` не содержит этот
  заголовок; следовательно, это не прямое опциональное скрытие.
- Использовать: нормализовать пробел перед `₽` и останавливать базовый подъём
  при появлении любого другого известного benefit-заголовка: `Купить за 1₽`,
  `Выгода от партнёров`, `Для покупок на Ozon`, `Ozon Premium`, `Розыгрыши и
  акции` или `Бонусы за рекомендации`.
- Статус: парная DOM-граница отвергнута после runtime-проверки; replacement со
  всеми sibling boundaries прошёл JavaScript syntax check, build, exclusive
  apply и targeted JADX-проверку. Итоговый optional `selectedTitles` не
  содержит `Купить за 1₽`. Root mount и runtime-проверка подтверждены: счётчик
  звёзд и carousel `Купить за 1₽` остаются, выбранные последующие секции
  скрыты, визуальных артефактов нет.

## Ozon Банк 19.27.0 — рекламная шторка при запуске

- Цель: убрать редкое стартовое предложение `Деньги в рассрочку`, не ломая
  функциональные нижние листы приложения.
- Не использовать: безусловный ранний success/no-op в
  `ShowCbottomBridgeInterface2.handleSync()`. Bridge `cbottom2.show` является
  общим транспортом для всех server-driven Cbottom-листов, поэтому глобальное
  отключение затронет не только рекламу.
- Использовать: до парсинга DTO проверять полученный `parameterJson` на
  нормализованную фразу `деньги в рассрочку`; только для этого payload
  возвращать штатный `NativeResult.Success`, а остальные payload передавать в
  исходную реализацию без изменений.
- Статус: выбранный target и наличие текста в Cbottom text-widget payload
  подтверждены статически; patch прошёл build, exclusive apply к оригинальному
  APK и targeted JADX-проверку с сохранённым исходным fallback. Из-за суточного
  ограничения показа требуется длительная runtime-проверка.

## RuStore 1.106.0.3 — самопроизвольная шторка VK ID

- Цель: отключить только автоматическое предложение входа через VK ID, не
  ломая ручной вход из профиля и защищённых действий.
- Не использовать: fingerprint только по `sourceFile =
  AuthSuggestDelegateImpl.kt`, object-return и одному object-параметру. Этим
  условиям одновременно соответствует coroutine continuation
  `AuthSuggestDelegateImpl$ensureAuthSuggestShown$1.invokeSuspend()`; ранний
  `return null` попадал в него, а исходный delegate продолжал открывать шторку.
- Использовать: дополнительно требовать `new-instance
  FullscreenAuthDestination` в `ensureAuthSuggestShown()`. Эта ветка находится
  в центральном suggest-delegate рядом с альтернативным показом bottom sheet
  и отсутствует в coroutine continuation.
- Статус: прежний fingerprint отвергнут после targeted JADX-проверки
  результата apply; уточнённый target прошёл build, exclusive apply и targeted
  JADX/smali-проверку: ранний выход находится в `l61.e`, исходный coroutine
  `l61.d` больше не является целью. Runtime-проверка редкого показа ожидается.

## RuStore 1.106.0.3 — фильтрация обновлений по installer source

- Цель: исключить из проверки обновлений пакеты с installer source
  `com.android.vending`, сохранив RuStore installs и sideload APK.
- Не использовать: глобально подменять `PackageManager`-данные в
  `InstalledAppDetailsDataSource`; эти данные имеют другие потребители. Не
  использовать также штатный whitelist-параметр
  `GetNewerAppsUseCaseImpl.getAppVersionInfoList(installer)`: значение
  `ru.vk.store` вместе с Google Play исключит приложения без installer source.
- Использовать: перед сетевым lookup задать сравниваемый installer как
  `com.android.vending` и обратить существующую ветку whitelist в blacklist.
  Нулевой installer и любое другое значение проходят исходный mapping.
- Статус: глобальная подмена и whitelist отвергнуты при статическом
  исследовании; blacklist replacement прошёл build, exclusive apply, targeted
  JADX/smali-проверку и apply полного default-набора RuStore. В итоговом smali
  совпадение с `com.android.vending` ветвится за mapping, а другие и нулевые
  installer source проходят в `AppVersionInfo`. Runtime-проверка ожидается.

## RuStore 1.106.0.3 — отключение программы лояльности

- Цель: отключить onboarding, `Points` в `Mine`, loyalty push/deeplink и
  отдельный верхний баннер с рекламой баллов.
- Не использовать: только `RawAdvertisementRepositoryImpl.get()`. Верхний
  server-driven блок приходит как position rule `BANNERS(upper=true)` через
  `InterestingPositionRulesRepository` и не проходит через общий рекламный
  repository.
- Использовать: переназначить зарегистрированный remote-key
  `featureLoyaltyEnabled` на отсутствующий ключ с исходным default `false`, а
  в mapper position rules пропускать только `BANNERS` с `upper=true`. Нижние
  позиции `BANNERS` и остальные элементы ленты сохраняются.
- Статус: оба независимых пути подтверждены по xrefs и smali. Патч прошёл
  build, exclusive apply, полный default apply и targeted smali-проверку:
  remote-key заменён, а `upper=true` ветвится на следующую итерацию mapper-а.
  Runtime-проверка ожидается.

## RuStore 1.106.0.3 — объединение cleanup hooks в patch options

- Цель: перенести VK ID cleanup и четыре настраиваемые чистки в единый patch
  `Disable ads`, не регистрируя helpers как отдельные user-facing patches.
- Не использовать: обычные top-level helper-функции, напрямую обращающиеся к
  `Fingerprint.method`. Вне `execute` им не передаётся обязательный
  `BytecodePatchContext`, поэтому Kotlin compilation завершается ошибкой `No
  context argument for BytecodePatchContext found`.
- Использовать: context-bound helpers с `context(_: BytecodePatchContext)` и
  вызывать их из `Disable ads.execute`. Boolean options проверять через
  `option != false`, чтобы сохранять включённое поведение и при default `true`,
  и при отсутствии явно переданного значения.
- Статус: первый вариант отвергнут на compile. Context-bound replacement
  прошёл build; exclusive apply с defaults изменяет 13 ожидаемых классов, со
  всеми четырьмя options=false — только 3 базовых класса рекламы/VK ID; полный
  default apply выполняет 5 user-facing RuStore patches и 21 class edit.

## Формат новой записи

```markdown
## <App> <version> — <feature>

- Цель:
- Не использовать:
- Использовать:
- Статус:
```
