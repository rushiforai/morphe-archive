package app.nizarberyan.patches.avito.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Api of the server that provides the sponsored campaigns Avito serves itself.
 * The class and its methods are not obfuscated.
 */
internal const val MEDIA_SERVER_API_CLASS =
    "Lse/scmv/morocco/data/network/rest/media_server/MediaServerApi;"

/**
 * Methods of [MEDIA_SERVER_API_CLASS] that request the campaigns of each ad type:
 * the sticky banner, notification ads, swipe-up ads and touching points.
 */
internal val sponsoredCampaignRequestMethods = listOf(
    "getActiveSlideAds",
    "getNotifAds",
    "getSwipeUpAds",
    "fetchTouchingPoints",
)

/**
 * `ListingAd.DfpBanner.toString()`, the list item of a Google Ad Manager banner
 * shown between the search results.
 */
internal object DfpBannerListingToStringFingerprint : Fingerprint(
    name = "toString",
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("DfpBanner(uuid="),
    ),
)

/**
 * Banner view of the Google Mobile Ads SDK. Class and method names are part of
 * the public SDK api and are not obfuscated.
 */
internal object BaseAdViewOnMeasureFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "onMeasure",
    returnType = "V",
    parameters = listOf("I", "I"),
)

/**
 * Methods of the Google Mobile Ads SDK that request an ad from the ad network.
 * Each entry is a defining class and a method name, all overloads are matched.
 */
internal val adRequestMethods = listOf(
    "Lcom/google/android/gms/ads/BaseAdView;" to "loadAd",
    "Lcom/google/android/gms/ads/admanager/AdManagerAdView;" to "loadAd",
    "Lcom/google/android/gms/ads/AdLoader;" to "loadAd",
    "Lcom/google/android/gms/ads/AdLoader;" to "loadAds",
    "Lcom/google/android/gms/ads/interstitial/InterstitialAd;" to "load",
    "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;" to "load",
    "Lcom/google/android/gms/ads/appopen/AppOpenAd;" to "load",
)
