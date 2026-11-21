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
The menu uses Meesho's native controls and typography; an account divider separates it from Settings.
Tap **Apply & reopen Meesho** to rebuild the tabs and profile; you stay signed in.
Backup exports your settings as JSON (clipboard or share sheet) and imports them back. About shows the version and links to this repo.

On new installs, ad and finance-promotion hiding, product-only ratings and telemetry blocking are
on. Sorting and layout changes are off; the tab bar keeps Meesho's order. Saved choices are preserved.

## What the Meesho patches do

- **Ads:** removes sponsored products, the order ad widgets, the loan banners in My Orders
  (repayment banners are kept), the Pay Later banner after ordering, the Wishlist Pay Later banner
  and floating sale promotions like Locked Deals.
- **Refer and Earn:** hides the referral shortcut on the home header and account screen.
- **Product ratings only:** hides shop (supplier) ratings, so only the product's own rating shows.
- **Sort by rating count:** sorts each search page by rating count, and adds a floating
  **Sort loaded** button on search and category pages that re-sorts everything loaded so far.
- **Feed reels:** removes reel cards from feeds; the video tab stays.
- **Pay Later:** hides the secondary price in listings, the "Pay next month" product banner and the
  loan and Pay Later entries in Profile. Payment and checkout are unchanged.
- **Recommendation trays:** optionally hides the Gold, "You may also like" and related category rows in search, the recently viewed category shelf on home, and Similar Products rows in search, category pages and the home feed.
- **Tab bar:** pick and reorder up to 5 tabs (Account included; untick Loans to drop it), and optionally hide Account in
  the home header (off by default).
- **Block analytics and telemetry:** stops Meesho's event uploads (which also carry the SMS inbox
  and device-data uploads), OTPless and Juspay logs, and opts out of AppsFlyer, Facebook and
  Firebase analytics. Login, payments and fraud checks (Shield, Juspay, NPCI, Truecaller) and
  Crashlytics are left alone.

Known limits: the bottom-tab toggles match the English tab names. Sorting only covers products that
are already loaded; unloaded pages are not fetched in advance.

## Privacy

The patches add no network calls, analytics or tracking. They edit Meesho's own API responses
on the device, store only on/off switches in app-private preferences, and never log
response bodies or account data.

## Patches list

<!-- PATCHES_START EXPANDED -->
> **[v0.2.0](https://github.com/semi-column/window-shopper/releases/tag/v0.2.0)**&nbsp;&nbsp;•&nbsp;&nbsp;`main`&nbsp;&nbsp;•&nbsp;&nbsp;11 patches total
<details open>
<summary>📦 Meesho&nbsp;&nbsp;•&nbsp;&nbsp;11 patches</summary>
<br>

**Package name:** `com.meesho.supply`

**🎯 Supported versions:**

| 30.0 | 29.9 |
| :---: | :---: |

| 💊&nbsp;Patch | 📜&nbsp;Description | ⚙️&nbsp;Options |
|----------|----------------|-----------|
| [Block analytics and telemetry](#block-analytics-and-telemetry) | Answers Meesho event and SDK logging calls locally, skips the SMS inbox upload worker, and opts out of AppsFlyer, Facebook and Firebase analytics. |  |
| [Customize tab bar](#customize-tab-bar) | Adds settings to pick and reorder up to 5 tab bar tabs, including Account, and to hide Account in the home header. |  |
| [Hide Pay Later secondary price](#hide-pay-later-secondary-price) | Hides the Pay Later secondary price on listings and the Pay next month banner on product pages without changing the primary price or checkout. |  |
| [Hide Refer and Earn](#hide-refer-and-earn) | Removes Refer and Earn from the home header and account screen. |  |
| [Hide loan and Pay Later profile entries](#hide-loan-and-pay-later-profile-entries) | Removes the three finance entries from the account list without changing repayment or checkout. |  |
| [Hide recommendation trays](#hide-recommendation-trays) | Removes the Gold Premium Quality, You may also like and related category rows from search, the recently viewed category shelf from home, and stops Similar Products rows in search, category pages and the home feed. |  |
| [Hide reel cards in feeds](#hide-reel-cards-in-feeds) | Removes reel-format catalog cards from discovery feeds while leaving the video tab untouched. |  |
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
