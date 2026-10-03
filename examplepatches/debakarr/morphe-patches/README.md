[![Add to Morphe](add-to-morphe.svg)](https://morphe.software/add-source?github=debakarr/morphe-patches)

# Debakar's Morphe Patches

Morphe patch source for **ranking search results** on Amazon, Flipkart, Myntra and Meesho: sort by **number of ratings** or by **average rating**, hide products rated **below 4★**, **remove ad/sponsored items**, and open a **Ranked list** that orders every product from every page the app has loaded.

> **None of these apps offers a "sort by ratings count" option.** Amazon's "Avg. Customer Review" is a blended ranking, and Flipkart's "Popularity" is an opaque heuristic. These patches add a true descending sort by the *number* of ratings or by the *average* rating, and strip sponsored placements.

## The controls

On a listing screen four floating buttons appear (they only show while a listing has recently loaded):

| Button | What it does |
|---|---|
| **Sort: Off / Most rated / Top rated** | Cycles the order of every page loaded *after* you tap. *Most rated*: most ratings first (ties → higher average). *Top rated*: highest average first (ties → more ratings). Products with no rating are listed last and are never treated as 0. |
| **4★+** | Hides products rated below 4.0. A product with no rating is unknown, not "below 4", so it stays. |
| **Hide ads** | Removes sponsored products and ad widgets. |
| **Ranked (N)** | Opens a list of **all N products seen so far, across pages**, ordered by *Most rated* or *Top rated* (and the 4★+ filter), each row opening the product in the app. This is what lets a well-rated product from page 3 rise above a poorly rated one on page 1. *Clear* starts over; it also resets itself after 20 minutes without a new page. |

Everything starts off and is remembered. Amazon's **Ranked** panel can also **load 5 more result pages** itself (it runs in a WebView, so it fetches with the page's own session); on Flipkart, Myntra and Meesho the list holds the pages *you scroll to*, because those apps' next-page requests carry private cursors and headers that cannot be replayed safely.

> The Ranked list uses each app's own numbers; it is not a verdict on the product.

## Patches

### Amazon — Sort by number of ratings

**App:** Amazon Shopping / Amazon India (WebView)

| Detail | Value |
|---|---|
| Approach | Client-side DOM reorder via `evaluateJavascript` |
| Scope | Search results pages |
| Compatibility | `com.amazon.mShop.android.shopping` v32.13.2.100 · `in.amazon.mShop.android.shopping` v32.18.0.300 / v32.16.2.300 |

On search pages two floating buttons appear:

- **"Sort: Most rated"** — re-orders every loaded result by review count, across all infinite-scroll chunks, and keeps doing so as more results load. Sponsored cards keep their slots. Tap again to restore the original order.
- **"Hide ads"** — hides sponsored results, including ones loaded later. Tap again to show them.

Both toggles are remembered, so the next search is sorted and cleaned as soon as it renders.

### Flipkart — Sort by number of ratings

**App:** Flipkart (React Native + ATLAS feed)

| Detail | Value |
|---|---|
| Approach | Hook on the base mapi Gson converter (`converter.h.convert`), plus the RN `NetworkCaller` callbacks |
| Scope | Every mapi page: search, category, browse, pagination, … |
| Compatibility | `com.flipkart.android` v9.15 (versionCode 3240500) · v9.13 (versionCode 3220300) |

Flipkart serves product listings as ATLAS feed rows (`RESPONSE.slots[].widget.data.dlsData`). Each row holds a list of product cards; every card carries the rating count in `ratingData_0.reviewText` (e.g. `| 4.7K+`) and ad cards carry a `tagData_0` badge (`AD` / `Sponsored`). Whole ad widgets (e.g. the "Top rated products" carousel with a header `AD` badge) are removed as well.

The patch wraps the response reader inside the base mapi Gson converter, parses the JSON, re-orders every product row by rating count descending, drops ad cards and ad widgets, and hands Gson the rewritten JSON — before any native or JS consumer sees it.

### Myntra — Sort by number of ratings

**App:** Myntra (React Native)

| Detail | Value |
|---|---|
| Approach | Rewrites listing JSON before it crosses the React Native bridge: the layout engine (`/v3/layout/...` search and listing pages), the `APIRequest` module, prefetched pages, and RN `fetch` blob responses |
| Scope | Search and listing pages |
| Compatibility | `com.myntra.android` v4.2609.30 |

### Meesho — Sort by number of ratings

**App:** Meesho (native)

| Detail | Value |
|---|---|
| Approach | Rewrites the response body in Retrofit's `MoshiResponseBodyConverter` |
| Scope | Catalog feeds, search, CLP, collections |
| Compatibility | `com.meesho.supply` v29.6 · v29.5 |

Products in `catalogs[]` / `products[]` are sorted by `catalog_reviews_summary.rating_count`; ad catalogs (`ad.active`) are removed. Banners and widgets in the same list keep their position.

> **Infinite scroll (Flipkart, Myntra, Meesho):** each page is sorted as it arrives, so on its own a well-rated item on page 3 cannot move above page 1 — use **Ranked** for the cross-page order. To make each page's sort cover more, Meesho requests 100 items per page and Myntra 60 while a sort is on. Flipkart's next-page cursor is an opaque token, so its page size can't be changed. Amazon's WebView patch re-sorts everything loaded so far.

> **Verified on a device (Redmi 3S, Android 13):** **Flipkart 9.15**, **Amazon India 32.18.0.300**, **Myntra 4.2609.30** and **Meesho 29.6** — the sort modes, 4★+, Hide ads, the Ranked list across pages (e.g. 111 of 137 on Flipkart; Amazon's "Load 5 more pages" took one search from 20 to 120 products), and tapping a row to open the product in the app. Field names were confirmed against real responses: Meesho's average is `catalog_reviews_summary.average_rating`, and its product link code is the base-36 of the catalog's `hero_pid` (not its `id`); Myntra's V2 tiles keep the full name in `onLongPress.modalData.productName` and prices as strings like `₹558`. Flipkart row titles are the brand plus the app's own description text, so they follow the app's language. Where a field is missing the row shows less, never a made-up number. Not tested: Meesho 29.5, Flipkart 9.13, Amazon (`com.amazon.mShop.android.shopping`) 32.13 and 32.16.

## Add to Morphe

1. Open **Morphe Manager**
2. Go to **Settings → Patch sources**
3. Add:
   ```
   https://github.com/debakarr/morphe-patches
   ```
4. Select the app, enable the patch, and build

Or tap the badge at the top of this page.

## How it works

The Morphe patcher builds a `.mpp` bundle containing patch metadata and bytecode. When applied, patches modify the target APK's DEX files to inject helper logic. For these patches:

- **Amazon:** `SortByRatingsHelper.injectSortByRatings()` is called from a WebView `onPageFinished` hook. It evaluates JavaScript (`AmazonSortScript`) that collects product cards, reads each card's rating and rating count, reorders them (by count or by average), hides sponsored cards and sub-4★ products, and keeps a store of every product seen — fetching further result pages for the Ranked list.
- **Myntra:** `SortByRatingsHelper.processMyntraResponse()` / `processMyntraBytes()` rewrite the page in `LayoutEngineModule` (search/listing pages) and in the other places Myntra hands listing JSON to React Native. Tiles (`PRODUCT_TILE`, `PRODUCT_TILE_V2`) are sorted by `ratingInfo.count`; tiles with an `adLabel` are removed.
- **Meesho:** `SortByRatingsHelper.processMeeshoResponse()` runs on the body at the top of `MoshiResponseBodyConverter.convert`, which is swapped for a rewritten body.
- **All three response-rewriting apps** read every listing page that goes by into `RankedStore` (in memory, de-duplicated, bounded) — whether or not a toggle is on — so **Ranked** is already filled when you open it. The ordering rules live in one place, `Ranker`.
- **Flipkart:** `SortByRatingsHelper.processResponseReader()` is injected at the start of the base mapi Gson converter (`converter.h.convert`). It reads the response body, rewrites every ATLAS product row (sort by rating count descending, drop ad cards and ad widgets), and returns a reader over the modified JSON. Additional hooks on the RN `NetworkCaller` callbacks cover the legacy raw-string path.

## Development

```bash
# Build the patch bundle (requires Java 21, the Android SDK, and a GitHub
# token with read:packages for the Morphe Gradle plugin)
export ANDROID_HOME=~/android-sdk GITHUB_ACTOR=<user> GITHUB_TOKEN=$(gh auth token)
./gradlew patches:build

# Unit tests for the JSON rewriters
./gradlew :extensions:extension:testDebugUnitTest

# Release (via GitHub Actions)
gh workflow run release.yml --ref main
```

## License

This project is licensed under the GNU General Public License v3.0 — see [LICENSE](LICENSE) for details.
