package app.unlimited.sportsnet.patches.ads

import app.morphe.patcher.Fingerprint

private const val ADS_MODEL = "Lcom/rogers/sportsnet/service/advertisements/model/"

/** Starts the Google Mobile Ads SDK and publishes the result as the advertisement state. */
internal object AdInitializeFingerprint : Fingerprint(
    definingClass = "${ADS_MODEL}AdvertisementService;",
    name = "initialize",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/app/Application;", "Lkotlin/coroutines/Continuation;"),
)

/** The banner and in-feed ads a screen (news, scores, ...) places between its items. */
internal object AdListForScreenFingerprint : Fingerprint(
    definingClass = "${ADS_MODEL}AdvertisementService;",
    name = "adListForScreen",
    returnType = "Lkotlinx/coroutines/flow/Flow;",
)

/** The full screen ad shown when the app opens. */
internal object ShowFullscreenAdFingerprint : Fingerprint(
    definingClass = "Lcom/rogers/sportsnet/service/advertisements/AdvertisementDelegate;",
    name = "showFullscreenAd",
    returnType = "V",
)

/** Adds Google IMA pre, mid and post roll ads to highlight and clip videos. */
internal object SetupGoogleImaFingerprint : Fingerprint(
    definingClass = "/BrightCoveDelegate;",
    name = "setupGoogleIMA",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)
