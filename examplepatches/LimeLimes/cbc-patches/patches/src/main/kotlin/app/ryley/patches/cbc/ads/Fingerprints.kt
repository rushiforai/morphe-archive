package app.ryley.patches.cbc.ads

import app.morphe.patcher.Fingerprint

/**
 * The ad request is built with Google Ad Manager types in every CBC ad provider:
 *
 * `ca.cbc.android.ads.AdProvider.loadAd(AdManagerAdRequest.Builder, AdManagerAdView, String, String, String): void`
 *
 * Implementations found in CBC News 7.11.0:
 * `DefaultAdProvider`, `GoogleAdProvider`, `AmazonAdProvider`, `TeadsAdProvider`.
 */
internal const val AD_MANAGER_AD_REQUEST_BUILDER =
    "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest\$Builder;"
internal const val AD_MANAGER_AD_VIEW = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;"

internal val LOAD_AD_PARAMETERS = listOf(
    AD_MANAGER_AD_REQUEST_BUILDER,
    AD_MANAGER_AD_VIEW,
    "Ljava/lang/String;",
    "Ljava/lang/String;",
    "Ljava/lang/String;",
)

/** Ad provider implementations that request a single ad unit. */
internal val AD_PROVIDER_CLASSES = listOf(
    "Lca/cbc/android/ads/DefaultAdProvider;",
    "Lca/cbc/android/ads/GoogleAdProvider;",
    "Lca/cbc/android/ads/AmazonAdProvider;",
    "Lca/cbc/android/ads/TeadsAdProvider;",
)

/**
 * Matches `loadAd(...)` in one ad provider implementation.
 *
 * The method name is required: `DefaultAdProvider` also declares `loadAmazonAd(...)` and
 * `loadTeadsAd(...)`, which share the exact same descriptor, so a descriptor-only fingerprint
 * would match the wrong method. Names are safe to use here because the app's own classes are
 * not obfuscated.
 */
internal fun loadAdFingerprint(providerClass: String) = Fingerprint(
    definingClass = providerClass,
    name = "loadAd",
    returnType = "V",
    parameters = LOAD_AD_PARAMETERS,
)

/**
 * `ca.cbc.android.utils.InterstitialAdManager.showDefaultInterstitialAd(Context, Boolean): Boolean`
 *
 * Called from the splash/startup path; the boolean result reports whether an interstitial was shown.
 */
internal val ShowInterstitialAdFingerprint = Fingerprint(
    definingClass = "Lca/cbc/android/utils/InterstitialAdManager;",
    name = "showDefaultInterstitialAd",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;", "Z"),
)
