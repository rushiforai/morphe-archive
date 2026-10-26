# Wolt Export-Cart — Data Flow & Hook (v26.40.1, classes8.dex)

## Where the cart items actually live
`CartModel` does **not** hold line items. It holds:
- `getOrderState(): NewOrderState` — real cart source (`com.wolt.android.new_order.entities.NewOrderState`)
- `getCartDishIds(): Set<Integer>` — ids of dishes in the cart
- rest = discounts / subscription / wolt+ / group-order UI state

Line items = `Menu.Dish` (`com.wolt.android.domain_entities.Menu$Dish`), selected from the venue `Menu` by `cartDishIds`. Wolt calls every line item a "Dish", including grocery/retail products.

## The display pipeline (CartMenuRenderer) — our template for serialization
`CartMenuRenderer` collaborators:
- `DishItemModelComposer` — turns a `Menu.Dish` → `DishItemModel` (display row)
- `MoneyFormatUtils` — formats prices w/ currency  ← reuse for correct money strings
- `ExperimentProvider`

Key method (deobf names are jadx letters; verify smali):
- `f(Menu menu, MenuScheme scheme, String currency, Set<Integer> dishIds, String venueCountry, String venueTimezone, Integer expandedDishId, ...) : List<DishItemModel>`
  → filters `menu` dishes where `dishIds.contains(dish.getId())`, maps each to a `DishItemModel`.
- `renderCartDishes(WorkState old, WorkState new, Menu menu, MenuScheme scheme, ... )` — public render entry.

`Menu.Dish` getters seen in use: `getId()`, `getSchemeDishId()`, `getDateAddedToCart()`, `copy$default(...)` (has count + name + price params). Need full `Menu$Dish` decompile to pin name/count/price/currency getters.

## Two serialization strategies
- **A — read display rows (simplest):** hook where `List<DishItemModel>` is built/rendered; `DishItemModel` already carries formatted name + price strings. Extension iterates them → CSV. Pro: money already formatted, grocery/restaurant agnostic. Con: must decompile `DishItemModel` getters.
- **B — read domain model:** pass `Menu` + `Set<Integer> dishIds` + `currency` to extension; iterate `Menu.Dish`, read name/count/unit-price, format via `MoneyFormatUtils`. Pro: raw numbers (better CSV). Con: more getters + MoneyFormatUtils call.

Lean **A** for MVP (formatted strings → CSV), revisit B if raw numeric columns wanted.

## Hook candidates (refined)
1. **Toolbar/overflow menu** — preferred UX ("Export cart" item). Need to find where the cart screen inflates its Toolbar/menu (not obviously in CartMenuRenderer — that's a *list* renderer, misleading name). Check `CartController` for `Toolbar`/`inflateMenu`/`MenuItem`.
2. **CartRenderer** — holds the root view + checkout button (`$Anchor`, `$CheckoutButtonState`); could attach an export button or long-press. Has a Context/View + access to rendered list.
3. **Fallback** — long-press on an existing always-present view (e.g. checkout/total) → export.

## Extension contract (draft)
`Lapp/cavla/extension/wolt/CartExporter;`
- MVP: `export(Landroid/view/View;Ljava/util/List;)V`  — (anchorView, List<DishItemModel or formatted rows>) → build CSV string → `Intent.ACTION_SEND`, `type="text/csv"`, `EXTRA_TEXT`=csv, via `view.getContext()`. User chooses Save-to-Files / share target. No FileProvider, no manifest, no storage permission.
- Needs: read name/price off each row via typed access OR patch passes pre-extracted `String[]`/`List<String>` rows (most robust vs R8) — decide after DishItemModel decompile.

## Still TODO before writing the patch
1. Decompile `Menu$Dish` + `DishItemModel` (which dex?) → exact getters for name/count/price/currency.
2. Decompile `CartController` toolbar/menu setup → find the real menu hook (or confirm renderer/long-press path).
3. Dynamic recon: open a **supermarket** cart, `uiautomator dump` → confirm same `CartController`, capture toolbar + resource ids.
4. Build gate: `read:packages` token, then prove a clean template build on Termux aarch64.

---
## CONFIRMED signatures (v26.40.1) — update after verifying in smali

### Toolbar hook
- Method: `CartController.A0()` — `private final void`, no args (jadx name `A0`; verify real smali name — likely a letter). Runs once, sets up the toolbar. Inject our call at method end (after `setStartIcon`).
- In-scope regs at that point: the `RegularToolbar` (from `d0()`), `venueName` (String, may be null → falls back to `cart_title`).
- Shop name source: `((CartArgs) getArgs()).getVenueName()` — nullable.

### RegularToolbar — `Lcom/wolt/android/core_ui/widget/RegularToolbar;` (classes6.dex)
Observed API (from CartController usage):
- `setTitle(String, Function0)`
- `setSubtitle(String, Function0)`
- `setStartIcon(Integer iconRes, String contentDesc, Function0 onClick)`  ← add-icon-with-click pattern
- `setElevation(float)`
- EXPECT `setEndIcon(Integer, String, Function0)` — **VERIFY by decompiling RegularToolbar.** This is where our "Export" icon goes.

### Row model — `Lcom/wolt/android/new_order/controllers/misc/DishItemModel;` (classes8.dex)
Real (non-obfuscated) getters usable for CSV columns:
- `getName():String`, `getDesc():String`
- `getCount():int`, `getCountText():String`, `getCountMultiplierText():String`, `getCountWithCopies():int`
- `getPrice():PriceModel`, `getUnitPrice():PriceModel`, `getWeightedItemPrice():PriceModel`
- `getNetPriceFormatted():StringType`, `getNetPriceTotalFormatted():StringType`
- `getUnitInfo():StringType`, `getVenueCountry():String`, `getSchemeId():String`, `getId():int`
- OPEN: `PriceModel` + `StringType`/`AccessibleString` shape — need plain-text getters. `StringType` likely needs a Context to resolve → prefer plain `String` getters (getName, getCountText) + PriceModel's formatted/amount for CSV.

### Data capture (bridge)
- Need the current `List<DishItemModel>` at click time. Candidates: `CartMenuRenderer.f(...)`/`renderCartDishes(...)` (builds the list) or read `CartAdapter` items. Plan: hook the render/build method → `CartExporter.setRows(List)` static stash; toolbar onClick reads the stash.

### Build approach (to decide w/ advisor)
- Extension in Java → `.mpe`. To call `RegularToolbar.setEndIcon` + read `DishItemModel` getters, use **stub classes** (compile-time only, real names stable here) OR reflection. Leaning stubs.
- Sink: `MediaStore.Downloads` (API 29+, no permission) → `<venueName sanitized>-cart.csv`; share-intent fallback < API 29.
- Two hooks: (A) `A0()` add toolbar icon; (B) render method stash rows. One extension, one stub module.
