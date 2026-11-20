<p align="center"><img src="patches-bundle.png" alt="Window Shopper" width="128"></p>

# Window Shopper

Morphe patches that declutter shopping apps: browse the products, skip the ads and the upsells.

Supported today: **Meesho** 30.0 and 29.9. More shopping apps may follow in the same bundle.

## How to use

Add this repo to Morphe Manager, or use the button:

<a href="https://morphe.software/add-source?github=semi-column/window-shopper">
  <img src=".github/assets/add-to-morphe.svg" alt="Add to Morphe" height="48">
</a>

Then patch your own copy of the app. This repo never ships patched APKs.

After patching Meesho, open **Profile → Morphe**, just below Settings, to switch each feature on or off.
Tap **Apply & reopen Meesho** to rebuild the tabs and profile; you stay signed in.

## What the Meesho patches do

- **Ads:** removes sponsored products, the order ad widgets, the loan banners in My Orders
  (repayment banners are kept), the Pay Later banner after ordering and the Wishlist Pay Later banner.
- **Product ratings only:** hides shop (supplier) ratings, so only the product's own rating shows.
- **Sort by rating count:** sorts each search page by rating count, and adds a floating
  **Sort loaded** button on search and category pages that re-sorts everything loaded so far.
- **Feed reels:** removes reel cards from feeds; the video tab stays.
- **Pay Later:** hides the "with Pay Later" secondary price, the Pay Later/Loans tab and the
  loan and Pay Later entries in Profile. Payment and checkout are unchanged.
- **Search trays:** optionally hides the Gold and "You may also like" rows in search, and Similar Products rows in search, category pages and the home feed.
- **Bottom tabs:** optionally hides Categories, Mall and Video Finds (off by default).

Known limits: the bottom-tab toggles match the English tab names. Sorting only covers products that
are already loaded; unloaded pages are not fetched in advance.

## Privacy

The patches add no network calls, analytics or tracking. They edit Meesho's own API responses
on the device, store only on/off switches in app-private preferences, and never log
response bodies or account data.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v0.0.1](https://github.com/semi-column/window-shopper/releases/tag/v0.0.1)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;10 patches total
<details open>
<summary>📦 Meesho&nbsp;&nbsp;•&nbsp;&nbsp;10 patches</summary>
<br>

**Package name:** `com.meesho.supply`

**🎯 Supported versions:**

| 30.0 | 29.9 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Hide Pay Later navigation tab](#hide-pay-later-navigation-tab) | Prevents Pay Later from taking the fourth navigation slot without disabling its payment services. |  |
| [Hide Pay Later secondary price](#hide-pay-later-secondary-price) | Hides the Pay Later secondary price on discovery listings without changing the primary price or checkout. |  |
| [Hide bottom navigation tabs](#hide-bottom-navigation-tabs) | Adds optional toggles to remove Categories, Mall and Video Finds from the bottom tab bar. |  |
| [Hide loan and Pay Later profile entries](#hide-loan-and-pay-later-profile-entries) | Removes the three finance entries from the account list without changing repayment or checkout. |  |
| [Hide reel cards in feeds](#hide-reel-cards-in-feeds) | Removes reel-format catalog cards from discovery feeds while leaving the video tab untouched. |  |
| [Hide search recommendation trays](#hide-search-recommendation-trays) | Removes the Gold Premium Quality and You may also like rows from search, and Similar Products rows from search, category pages and the home feed. |  |
| [Hide sponsored listings and order ads](#hide-sponsored-listings-and-order-ads) | Removes active sponsored product records, two identified My Orders finance banners and the Wishlist Pay Later banner, and disables configured order ads. |  |
| [Product ratings only](#product-ratings-only) | Removes supplier review summaries and supplier-typed catalog ratings. Missing product ratings stay missing. |  |
| [Sort loaded search results by rating count](#sort-loaded-search-results-by-rating-count) | Adds a button to sort currently loaded search and category products by product rating count. |  |
| [Sort search pages by rating count](#sort-search-pages-by-rating-count) | Sorts each returned search page by product rating count, highest first. Does not globally reorder unloaded pages. |  |

</details>

<!-- PATCHES_END -->

## Development

- Requires JDK 17+, the Android SDK and a GitHub token with `read:packages`
  (`gpr.user`/`gpr.key` in `~/.gradle/gradle.properties`) to fetch the Morphe Gradle plugin.
- `./gradlew test` runs the extension tests; `./gradlew buildAndroid` writes `patches/build/libs/patches-*.mpp`.
- `scripts/check-meesho-apk.py <dexdump> <patched.apk> 29.9|30.0` checks the injected bytecode in a patched APK.
- Use semantic commits (`feat:`, `fix:`, `chore:`). Releases are manual: run `release.yml` from the Actions tab
  (or `gh workflow run release.yml --ref main`); `dev` produces pre-releases.

## Disclaimer

Not affiliated with Meesho or the Morphe project. Use at your own risk.

## License

Window Shopper is licensed under the [GNU General Public License v3.0](LICENSE). See [NOTICE](NOTICE).
