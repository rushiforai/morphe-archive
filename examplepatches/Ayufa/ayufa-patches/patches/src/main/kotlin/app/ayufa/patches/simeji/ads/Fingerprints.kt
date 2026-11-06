package app.ayufa.patches.simeji.ads

import app.morphe.patcher.Fingerprint

/**
 * The central ad gate. Its result combines the server-side ad switch
 * with the paid-user (VIP) state, and the suggestion area reads it to
 * decide whether ads may be shown at all. Verified against Simeji 20.7.
 */
internal object AdFilterHelperCanShowFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/ad/AdFilterHelper;",
    name = "canShow",
    returnType = "Z"
)

/**
 * Prepares network ad candidates that get mixed into the keyboard's
 * suggestion bar. Verified against Simeji 20.7.
 */
internal object AdCandidateManagerPrepareFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/ad/sug/AdCandidateManager;",
    name = "prepareAdCandidates",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * Stores refreshed ad candidates for the suggestion bar.
 * Verified against Simeji 20.7.
 */
internal object AdCandidateManagerRefreshFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/ad/sug/AdCandidateManager;",
    name = "refreshAdCandidates",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONArray;")
)

/**
 * Starts the store-entry interstitial ad flow shown when opening the
 * Simeji store. Verified against Simeji 20.7.
 */
internal object StoreEntryAdTriggerStartGoingFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/ad/StoreEntryAdTrigger;",
    name = "startGoing",
    returnType = "Ljp/baidu/simeji/ad/StoreEntryAdTrigger;"
)

/**
 * Shows the web operation popup (campaign / EC web view overlay).
 * Verified against Simeji 20.7.
 */
internal object WebOperationPopupShowFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/ad/web/WebOperationPopup;",
    name = "popupShow",
    returnType = "Z"
)

/**
 * Preloads a rewarded ad. Verified against Simeji 20.7.
 */
internal object AdShowHelperPreloadRewardedFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/AdShowHelper;",
    name = "preLoadRewardedAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Shows a rewarded ad. Verified against Simeji 20.7.
 */
internal object AdShowHelperShowRewardedFingerprint : Fingerprint(
    definingClass = "Ljp/baidu/simeji/AdShowHelper;",
    name = "showRewardedAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljp/baidu/simeji/RewardedAdShowCallback;"
    )
)
