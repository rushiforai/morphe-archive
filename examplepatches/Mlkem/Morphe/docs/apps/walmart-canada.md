# Walmart Canada Patch Pack — 1.5.0-beta.1

Targets **Walmart Canada 26.31**, package `ca.walmart.ecommerceapp`. Requires a Morphe release supporting Patcher 2.1.0. Import the MPP as a local patch source in Morphe Manager, select the original Canadian 26.31 APKM, and select the patches you want. This file is a patch bundle, not an installable APK. Use a consistent Morphe signing key for subsequent patched updates.

Use the uploaded **26.31 (26310017) four-architecture APKM**. It contains ARM64 libraries. On an ARM64 phone, keep `arm64-v8a` when Morphe offers an architecture selection. This version replaces the earlier 26.40-targeted pack; do not use that pack for 26.31.

## New in 1.5: Patch tools replaces Sparky

The existing **Sparky bottom-navigation slot** now says **Patch tools**, uses a tools icon and opens the local control panel. Its click no longer calls the Sparky launcher. The old Patch tools toolbar button is removed. The inspected Sparky FAB is redirected too, and the two tab callout/nudge views are suppressed. Other server-provided AI content is not claimed to be universally removed; no server-side Sparky setting is changed. The replacement uses the existing tab slot, so it requires the native navigation configuration to include that slot.

| Tool | Behaviour |
|---|---|
| Ad controls | Separate switches for native ad containers and sponsored cards; restores or hides currently tracked views immediately. |
| Recording controls | Pause all price recording, or select shopping-list and search/browse sources separately. Existing history is kept. Reopen product screens to refresh labels. |
| Search and sort history | Search product/store/seller; sort by recent observation, name, biggest drop or current price. |
| Filters | Favourites, observed price drops and targets met. |
| Trends | Latest, lowest, highest and previous different price; dated observations and a chart using actual observation times. |
| Watchlist | Favourite products and set/remove target prices in CAD. Targets compare the latest saved observation; no background polling or notifications. |
| History export | Copy/share CSV containing dated observations and store/offer context. Text fields are escaped for spreadsheet use. |
| Backup and restore | Copy/share JSON including favourites and targets. Paste to validate and merge; existing points win timestamp conflicts. Invalid input is rejected before any writes. |
| Native scanner | Open Walmart's barcode scanner from the panel, using its normal permission flow. |
| Unit-price comparison | Compare two offers, pack counts and g/kg, mL/L or each; shows normalized prices and percentage difference. Different measurement types cannot be compared. |
| Basket calculator | Manual price/subtotal, quantity, percentage discount, tax and optional budget. No guessed tax rate or claim of matching checkout rules. |
| Loaded checklist export | Copy/share text or CSV from the currently loaded checklist, including collected state and known line prices. Text export includes estimated subtotal and unpriced count. |
| Shopping mode controls | Keep the checklist awake, enlarge targets, show/hide collected items; applies to the current checklist if open. |
| Diagnostics | Installed patch names, session counters, observed errors and Android API level; refresh, copy or reset counters. No account tokens or product details in this report. |
| Data management | Delete one history or all histories after confirmation; restore tool preferences without deleting histories. |
| Feature guide | Explains scope, usage and unsupported functions. |

The control panel is in English and uses Android's native dialog theme. Ad/history/shopping switches are shown only when their corresponding patches are installed. Selecting Patch Tools alone gives the scanner, calculators, saved-history management and diagnostics; it does not silently install the other patches. Import the MPP and repatch the original **26.31 APKM** with your desired features.

Price history has no pre-install archive. All numbers come from prices you viewed or explicitly restored from your backup. Keep exports yourself before uninstalling/clearing data. Backups are limited to 128 histories, 30 observations per history and 512 KiB. Import refuses a merge that would exceed the history limit rather than deleting existing histories. Exports use Android's clipboard/share sheet; nothing is sent automatically.

## Launch recovery in 1.4.1

Version 1.4 contained a launch-breaking DEX type error in the new toolbar hook: `RootActivity.onCreateOptionsMenu` reuses its Menu parameter register for a boolean return value, and the hook passed that boolean to a method requiring Menu. The hook now runs before that register is overwritten. Clearing app data cannot repair this bytecode error.

The audit also found branches that could jump directly past inserted hooks. Incoming labels now target the injected code. Shopping mode, scanner and total setup now capture the checklist's root View immediately after its superclass callback, before the native method reuses that parameter register; their UI work remains posted until after native binding completes. All fourteen features remain available, including ad hiding and price history.

A new DEX data-flow regression check rejects the previous 1.4 APK and passes the corrected build: 52 injected calls, 57 live arguments and 54 hook/return path requirements across 23 modified methods. It checks runtime argument types and incoming branches, beyond fingerprint matching. It is static analysis, not a launch test on a phone.

Repatch the **original Canada 26.31 APKM** with this MPP, keeping `arm64-v8a` on an ARM64 phone, and install with your existing Morphe signing key. Do not patch the already-patched APK. Further data clearing is unnecessary for this defect.

## Features added in 1.4

The earlier history, stock and expiry hooks ran inside `setBuyMoreAndSaveView`, which is only reached by one conditional price-binding path. Normal list rows can bypass it, and checklist adapters explicitly hide the native price label. Version 1.4 hooks the common `h.H(ListDetailItem, S30.j)` row binding instead. History uses an explicit footer button and no longer depends on the native price label being visible. Stock/expiry now receive the same common row model.

Ad cleanup previously affected only the shopping-list deals banner. A separate **Hide Ads and Sponsored Content** patch now collapses native `AdsView` containers (including international ads, display ads and sponsored carousels) and entire sponsored cards in the shared grid/list product views. Organic cards are restored when recycled. This is display suppression, not a network blocker; some feed/grid layouts can retain empty slots. Untested server-delivered layouts may still show ads.

**Patch tools** replaces the Sparky bottom-navigation action. It shows installed patch names separately from session hook activity and recorded errors, and opens your saved price histories. Price history and ad hiding include this tool automatically as a dependency. Counters report hook activity, not a guarantee that every screen works.

## Included

| Patch | Default | Behaviour |
|---|---|---|
| Default Lists Tab — Canada | On | Opens Lists from My Items when the pager is at its default first tab and has more than one page. |
| Find Item for Linked Items — Canada | On | Restores the native Find item action for linked products, using Canada's action enum and resource IDs. |
| Stock Availability — Canada | On | Adds the availability status and message already supplied by Walmart to shopping-list item titles. It does not obtain privileged inventory data or infer physical inventory counts from purchase limits. Unknown status is explicitly shown as unknown. English and French labels. |
| Remove Shop — Canada | Off | Removes Shop from the navigation map when My Items exists and redirects the default Shop tab to My Items. Other tab selections remain intact. Enable this for the closest match to the original bundle. |
| Personal Price History — Canada | On | Records exact prices from list cards and shared search/browse product cards. List cards get a History button with the saved price/count; all saved items are accessible through Patch tools. Records start after installation. |
| Shopping Mode — Canada | On | Adds checklist switches for screen-awake mode and showing collected items. Enlarges checkboxes while enabled. Collected rows collapse by default, and can be restored with the switch. |
| Clearer Unit Prices — Canada | On | Enlarges and bolds Walmart's supplied unit-price text, including in the checklist where the native app hides it. Does not guess missing unit prices. |
| Aisle-Sorted Checklist — Canada | On | Groups remaining checklist items using supplied aisle locations, sorted naturally (A2 before A10). Unknown locations last. Preserves item identity, quantity and checked state. |
| Running List Total — Canada | On | Estimated subtotal, remaining and collected values for every loaded checklist item, including offscreen rows. Shows how many unpriced items were excluded. |
| Quick Scanner — Canada | On | Adds a Scan barcode button to the checklist. Opens the existing Walmart scanner and its standard camera permission flow. |
| Promotion Cleanup — Canada | On | Collapses the deals promotional banner in shopping lists. Product discounts, conditions, rewards and checkout remain available. This is scoped to that banner, not app-wide advertising. |
| Sale-Ending Reminders — Canada | On | Makes supplied promotion-expiry text larger, bold and prominent on list cards. These are in-list reminders; there are no background alarms or invented expiry dates. |

| Hide Ads and Sponsored Content — Canada | On | Collapses native ad containers and entire sponsored grid/list product cards; restores organic cards on recycling. Some slots can remain empty. |
| Patch Tools — Canada | On | Sparky replacement and control panel: price trends, watchlists, exports/backups, live switches, shopping utilities and diagnostics. |

## Using the new features

- **Price history:** open a shopping list. Each product gets a **History · $price · N saved** button, including in checklist mode when Walmart hides its own price. Tap it to see dated observations; the first entry explicitly says that recording has just started. Missing/range/suppressed prices show an unavailable message. Search/browse grid and large-list product cards also save an exact displayed price when their shared binder supplies one; open **Patch tools → Price history** to review those entries. This does not claim coverage of every product-detail page. There is no historical backfill, polling or external notification. The original local observation store is retained on an in-place update.
- **Shopping mode:** enter the app's shopping checklist. Two switches appear above the list. Shopping mode keeps this screen awake and enlarges checkboxes. Show collected items restores collapsed rows so you can uncheck them. Turning Shopping mode off restores normal row display and screen behaviour. The native list and checkoff state are never deleted or modified by the hiding feature.
- **Unit prices:** list cards show the existing unit-price string in larger bold text. Missing values remain absent. This is clearer display, not automatic normalization between unrelated measurement units.
- **Aisle sorting:** applied whenever the checklist receives an updated list. The patch changes the display order only. It uses structured zone/aisle numbers, falling back to Walmart's displayed location. Items without a location appear last. If every location is missing, the original order remains. This is not a shortest-route map.
- **Running total:** appears above the checklist with total, remaining and collected amounts. It reads all items currently loaded by the app (not just visible cards) and refreshes once per second while the checklist is visible. Server-supplied line prices are used once, without multiplying quantity again. When a line price is missing, an exact unit price times a positive requested quantity is used only for EACH products. Missing prices, price ranges, suppressed offers, and unknown-weight calculations are excluded and counted. Amounts are estimated CAD before tax, deposits, delivery fees or checkout-only discounts. Loaded prices may be stale offline.
- **Scanner:** tap Scan barcode above the checklist. This opens the normal Walmart product scanner; it does not silently add scanned items to the list or provide Scan & Go checkout. Back returns through the native navigation flow.
- **Promotions:** the deals-list promotional banner collapses. Product savings and offer terms remain visible. Sale-ending reminders emphasize expiry text that Walmart already supplies for the item's current promotion; if the app supplies none, no deadline is fabricated.

The shopping controls, total and scanner share one container. Each patch can be selected independently. Shopping mode now also handles the separate collected-item adapter, so its Show collected items switch applies to both list sections.

Price histories are grouped by product ID, offer, seller, sales unit and the store name/address displayed on a checklist. Without an identifiable store they are explicitly labelled **store not identified** and kept apart from identified store histories. Fulfilment options may still differ. Price ranges are excluded. Up to 128 histories and 30 observations each are retained, with at most one unchanged-price observation per local day. Price changes within a day are retained. History is stored in the Walmart app's private data and is lost if that data is cleared or the patched app is uninstalled. No history is uploaded by these patches. Browse observations use a separate history namespace and include offer, seller, sales unit, supplied fulfilment intent and whether the displayed offer is marked as store pricing. Their store is explicitly unidentified. Only a single displayed price matching the supplied raw amount is recorded; see-price-in-cart and price ranges are excluded.

## Upstream features not included

The US Route My List and Flash Everywhere patches depend on native map-screen and shelf-tag implementations absent from the inspected Canadian 26.31 build. Shared data-model classes alone do not provide those screens or services. This bundle therefore does not claim those two features or include empty placeholder patches.

## Validation and limits

All fourteen patches are applied together to the original Canada 26.31 APKM with Morphe Desktop 1.20.0 and `--validate`, then merged/rebuilt retaining ARM64. The price-history/ad-hiding/tools selection is also validated independently. Ninety-nine pure JVM checks cover existing feature logic, sponsored classification, missing/range/suppressed prices and exact displayed-price matching. Thirty-six Robolectric Android API 35 regression tests exercise history-button clicks, hidden native prices, recycled rows, price changes, persistence limits, panel and shortcut actions, live controls, pause behaviour, search/targets, backup merge/rejection, CSV escaping, calculators, visible browse observations and ad hiding/restoration using minimal Walmart-compatible view/model fixtures. These tests do not run the full Walmart application.

DEX inspection verifies the common list-row hook, both browse/card hooks, the ad-container hook, exact reflection fields and the original twelve feature mappings. The new register and control-flow check validates argument types at injected calls and ensures branches cannot bypass their required hooks on normal return paths. All 18 ARM64 libraries are preserved byte-for-byte. See `validation/` for results, including the failing previous-version regression.

Version 1.5 remains a **phone-untested beta**. Rebuild validation, DEX analysis and simulated Android tests do not establish that every Walmart screen, login or checkout flow works on your phone. Version 1.4 received a launch-crash report; the corrected argument and branch handling are retained, and 1.5 removes the toolbar menu hook entirely. Avoid uninstalling if you want to keep local history. Do not force another app version. If launch still fails after repatching the original bundle, a crash log from the device is needed to identify any additional cause (`adb logcat -b crash -d`, collected immediately after reproducing the crash).

## Building in the combined collection

See the root README and `BUILD-MPP.md` for building all patches. The standalone
source archive's `build.py` is superseded here by `scripts/build_offline.py` and
the standard Gradle build. These paths use the same imported Walmart source.

Run the pure-JVM checks with `python3 scripts/test_walmart_logic.py` (set
`ANDROID_JAR` if no Android SDK is configured). Run Android fixture tests with:

```sh
./gradlew -p tests/walmart/android test --no-daemon
```

Set `ANDROID_JAR` to a local Android SDK `android.jar`, or use an Android SDK
containing platform 36 via `ANDROID_HOME`. The test runtime uses Robolectric's
Android API 35 implementation. Imported standalone validation records and
original dependency hashes are in `docs/apps/walmart-validation/` and
`docs/apps/walmart-dependencies.json`.

## Source and license

Based on https://github.com/R2bEEaton/walmart-morphe at commit `25ea2dd699ec08c30ef2451b96f14ea9dd1698d2` (v3.1.0). The Find item extension is adapted from that GPLv3 project; its notice and license are included. Other hooks and the standalone build path were written for this Canadian port. Changes include Canadian class/enum mappings, resolving resource IDs by name instead of US fallback values, post-setter injection at every return, explicit unknown stock states, and navigation-map copying. The complete corresponding source for this MPP is included in the accompanying source ZIP.
