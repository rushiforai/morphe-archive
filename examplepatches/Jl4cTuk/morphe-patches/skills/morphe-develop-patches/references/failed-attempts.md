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

## Формат новой записи

```markdown
## <App> <version> — <feature>

- Цель:
- Не использовать:
- Использовать:
- Статус:
```
