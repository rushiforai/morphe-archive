package app.template.patches.textnow

import app.morphe.patcher.Fingerprint

/**
 * Fingerprints for TextNow 6.1.0.1 (versionCode 12231), package
 * `com.enflick.android.TextNow`.
 *
 * The ad/analytics SDK entry points below are third-party **library** classes, so their
 * real names survive the app's obfuscation.
 */

/** Google Mobile Ads `MobileAds.initialize(Context)V`. */
val TextNowMobileAdsInitContext = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

/** Google Mobile Ads `MobileAds.initialize(Context, String)V`. */
val TextNowMobileAdsInitAdUnit = Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)

/** Adjust `Adjust.onCreate(AdjustConfig)V` — attribution initialiser. */
val TextNowAdjustOnCreate = Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;"),
)

/** Flurry `FlurryAgent.init(Context, String)V` — analytics initialiser. */
val TextNowFlurryInit = Fingerprint(
    definingClass = "Lcom/flurry/android/FlurryAgent;",
    name = "init",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;"),
)
