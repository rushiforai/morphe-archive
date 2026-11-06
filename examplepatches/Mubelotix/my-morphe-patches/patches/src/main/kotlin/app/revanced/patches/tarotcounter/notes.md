# French Tarot Score Counter

## Target and compatibility

- Package: `net.aasuited.tarotscore`
- Supported version: **3.12.4**, version code **134**
- The downloaded artifact is a split XAPK (base, ARM64, and mdpi splits). Merge it before patching or decompiling so resources and DEX files are analyzed together.
- The app's implementation packages use the shared `net.aasuited.belotescore` name.

## Feature map

### Purchases

- In-app purchase handling is organized around a purchase-status manager and its implementation.
- The manager is initialized with product codes including `no_ads_1` and `noads1`; the app checks purchase state to grant ad-removal behavior.
- Useful resource and code search terms include `purchaseStatusManager`, `inAppPurchases`, `consumePurchase`, `noAdsCodes`, `no_ads_1`, `noads1`, and `cell_remove_ads_purchase`.

### Ads in 3.12.4

- Banner views are created through a shared loader. It accepts an `ABaseActivity`, `Context`, ad-unit string, `FrameLayout`, and a boolean; it creates a Google `AdView`, adds it to the supplied container, configures its unit ID and size, and requests an ad. The callers guard the returned view result before using it.
- Banner containers occur in `activity_score_board.xml`, `activity_player_statistics.xml`, and `activity_multi_follow.xml`, all using the `adbanner_container` ID.
- Unit IDs are now Android string resources, not helper methods returning strings: `score_board_ad_unit_id`, `remote_score_board_ad_unit_id`, `player_ad_unit_id`, `camera_interstitial_ad_unit_id`, and `splashscreen_ad_unit_id`.
- The open-ad loader is a no-argument `void` method that calls the SDK's app-open `load(Context, String, ...)` API. Its enable flag is the `open_ads_enable` boolean resource. The app also stores an `open_ads_enabled` preference, defaulted from that resource.
- In this APK, `open_ads_enable` is already false and `splashscreen_ad_unit_id` is empty. The patch sets the flag and ad-unit resources explicitly and early-returns from the app-open loader to cover preference/config changes.

## Fingerprint rationale

- The former Tarot fingerprints matched static `(boolean, String) -> String` helper methods containing Google test-unit strings. Those methods and literals do not occur in 3.12.4; adding them as 3.12.4 targets would fail.
- The current banner fingerprint uses the stable activity/context/string/frame-layout/boolean parameter signature plus references to Google `AdView` construction and `setAdUnitId`. It intentionally does not match the obfuscated implementation class or method name.
- The current open-ad fingerprint matches a public final, no-argument, `void` method that references the SDK `load(Context, String, ...)` operation. It does not depend on the app's obfuscated class or method name, or the SDK's obfuscated callback/loader types.
- A static scan of the fully merged 3.12.4 APK found exactly one method for each semantic fingerprint. Re-check uniqueness against the APK whenever the supported app version changes.
- The test-unit fingerprints used by the older Score Counter patch live in the Score Counter package; Tarot 3.12.4 uses only its current semantic loader fingerprints.

## Patch and verification notes

- The 3.12.4 patch early-returns from the banner loader and open-ad loader, hides the three banner containers, blanks the five ad-unit string resources, and sets `open_ads_enable` to false.
- The Morphe CLI applied the custom patch and official Clone app patch to the merged 3.12.4 APK. The patching, resource rebuild, and signing steps succeeded; the output package ID was `net.aasuited.tarotscore.morphetest`.
- The APK signature and package/version metadata were verified, and the cloned package was installed alongside the original. This was a device install check, not a full exercise of every ad-bearing screen or camera flow.
