[![Add to Morphe](add-to-morphe.svg)](https://morphe.software/add-source?github=debakarr/morphe-patches)

# Debakar's Morphe Patches

Morphe patch source for sorting search results by **number of ratings** (descending) on Amazon and Flipkart.

> **Neither app offers a "sort by ratings count" option.** Amazon's "Avg. Customer Review" sorts by *average* rating; Flipkart's "Popularity" is an opaque heuristic. These patches add true descending sort by the *number* of ratings/reviews.

## Patches

### Amazon — Sort by number of ratings

**App:** Amazon Shopping / Amazon India (WebView)

| Detail | Value |
|---|---|
| Approach | Client-side DOM reorder via `evaluateJavascript` |
| Scope | Search results pages |
| Compatibility | `com.amazon.mShop.android.shopping` v32.13.2.100 · `in.amazon.mShop.android.shopping` v32.16.2.300 |

On search/listing pages a **"Sort: Most rated"** floating button appears. Tap it to reorder product cards descending by parsed review count. Tap again to restore the original order. Sponsored/ad cards are never moved.

### Flipkart — Sort by number of ratings

**App:** Flipkart (React Native)

| Detail | Value |
|---|---|
| Approach | Native hook on the React Native `NetworkCaller` bridge (`OnSuccess(String)`) |
| Scope | All API responses; non-search responses pass through unchanged |
| Compatibility | `com.flipkart.android` v9.13 (versionCode 3220300) |

Flipkart 9.13+ is a React Native app — product listings are rendered from a JS bundle, not a WebView. This patch hooks the `NetworkCaller` bridge callback to intercept the raw JSON API response, sort the `"product"` map entries by `trackingDataV2.ratingCount` descending, and splice the sorted entries back into the JSON string using order-preserving surgery (avoiding `org.json.JSONObject` which does not preserve insertion order).

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

- **Amazon:** `SortByRatingsHelper.injectSortByRatings()` is called from a WebView `onPageFinished` hook. It evaluates JavaScript that collects product cards, extracts rating counts from text nodes, and reorders them.
- **Flipkart:** `SortByRatingsHelper.processFlipkartSearchResponse()` is injected at the start of the RN bridge `OnSuccess(String)V` callback. It parses the JSON, sorts the product map by `ratingCount`, and returns a modified JSON string — all before the JS bundle processes the response.

## Development

```bash
# Build the patch bundle (requires Gradle + Java 21)
./gradlew patches:build

# Release (via GitHub Actions)
gh workflow run release.yml --ref main
```

## License

This project is licensed under the GNU General Public License v3.0 — see [LICENSE](LICENSE) for details.
