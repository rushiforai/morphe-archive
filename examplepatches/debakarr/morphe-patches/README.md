[![Add to Morphe](add-to-morphe.svg)](https://morphe.software/add-source?github=debakarr/morphe-patches)

# Debakar's Morphe Patches

Morphe patch source for **sorting search results by number of ratings** (descending) and **removing ad/sponsored items** on Amazon, Flipkart, Myntra and Meesho.

> **None of these apps offers a "sort by ratings count" option.** Amazon's "Avg. Customer Review" sorts by *average* rating; Flipkart's "Popularity" is an opaque heuristic. These patches add true descending sort by the *number* of ratings/reviews, and strip sponsored placements.

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
| Compatibility | `com.meesho.supply` v29.5 |

Products in `catalogs[]` / `products[]` are sorted by `catalog_reviews_summary.rating_count`; ad catalogs (`ad.active`) are removed. Banners and widgets in the same list keep their position.

**Buttons (Flipkart, Myntra, Meesho):** on listing screens two floating buttons appear, **Sort: Most rated** and **Hide ads**. Both start off and are remembered. They control how every page the app loads *after* you tap is rewritten; items already on screen keep their order, so turn them on before searching. With only "Most rated" on, sponsored items stay in their slots.

> **Infinite scroll (Flipkart, Myntra, Meesho):** each page is sorted as it arrives, so a well-rated item on page 3 cannot move above page 1. To make each sort cover more, Meesho requests 100 items per page and Myntra 60 while "Most rated" is on. Flipkart's next-page cursor is an opaque token, so its page size can't be changed. Amazon's WebView patch re-sorts everything loaded so far.

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

- **Amazon:** `SortByRatingsHelper.injectSortByRatings()` is called from a WebView `onPageFinished` hook. It evaluates JavaScript that collects product cards, extracts rating counts from text nodes, reorders them, and can hide sponsored cards.
- **Myntra:** `SortByRatingsHelper.processMyntraResponse()` / `processMyntraBytes()` rewrite the page in `LayoutEngineModule` (search/listing pages) and in the other places Myntra hands listing JSON to React Native. Tiles (`PRODUCT_TILE`, `PRODUCT_TILE_V2`) are sorted by `ratingInfo.count`; tiles with an `adLabel` are removed.
- **Meesho:** `SortByRatingsHelper.processMeeshoResponse()` runs on the body at the top of `MoshiResponseBodyConverter.convert`, which is swapped for a rewritten body.
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
