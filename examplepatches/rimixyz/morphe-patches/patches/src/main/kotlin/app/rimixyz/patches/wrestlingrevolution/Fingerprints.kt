package app.rimixyz.patches.wrestlingrevolution

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprints for Wrestling Revolution 2.150.64 (air.WRCareer).
 *
 * All targets were confirmed by dumping the DEX with androguard. The game
 * logic itself lives in ActionScript (SWF/ABC) and cannot be patched by
 * Morphe, so every fingerprint below points at a Java ANE / SDK boundary.
 */

private const val BILLING_CONTROLLER =
    "Lcom/distriqt/extension/inappbilling/controller/playbilling/PlayBillingController;"
private const val YODO1_BRIDGE = "Lcom/AdobeAir/Yodo1Mas/Yodo1MasBridge;"
private const val THINKING_DATA = "Lcom/yodo1/mas/analytics/Yodo1MasThinkingData;"

private const val GET_PURCHASES_HANDLER =
    "Lcom/distriqt/extension/inappbilling/controller/playbilling/PlayBillingController\$5;"
private const val RESTORE_PURCHASES_HANDLER =
    "Lcom/distriqt/extension/inappbilling/controller/playbilling/PlayBillingController\$4;"

/**
 * PlayBillingController$5.onSuccess(I, List) — answers getPurchases().
 *
 * After processPendingPurchases() and formatPurchasesForEvent(), the method
 * dispatches the JSON payload as "get:purchases:complete". The string filter
 * gives us the exact index right before that dispatch, where the formatted
 * payload lives.
 */
internal object GetPurchasesCompleteFingerprint : Fingerprint(
    definingClass = GET_PURCHASES_HANDLER,
    name = "onSuccess",
    returnType = "V",
    parameters = listOf("I", "Ljava/util/List;"),
    filters = listOf(string("get:purchases:complete")),
)

/**
 * PlayBillingController$4.onSuccess(I, List) — answers restorePurchases().
 *
 * Same shape as above, but the event is "purchases:updated" and the purchase
 * array is built with restored = true.
 */
internal object PurchasesUpdatedFingerprint : Fingerprint(
    definingClass = RESTORE_PURCHASES_HANDLER,
    name = "onSuccess",
    returnType = "V",
    parameters = listOf("I", "Ljava/util/List;"),
    filters = listOf(string("purchases:updated")),
)

/** PlayBillingController$5.onFailure(I, String) — getPurchases() failed. */
internal object GetPurchasesFailedFingerprint : Fingerprint(
    definingClass = GET_PURCHASES_HANDLER,
    name = "onFailure",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;"),
)

/** PlayBillingController$4.onFailure(I, String) — restorePurchases() failed. */
internal object RestorePurchasesFailedFingerprint : Fingerprint(
    definingClass = RESTORE_PURCHASES_HANDLER,
    name = "onFailure",
    returnType = "V",
    parameters = listOf("I", "Ljava/lang/String;"),
)

/**
 * PlayBillingController.onSetupComplete() dispatches "inappbilling:setup:success".
 * Right after it, the ActionScript setup_successHandler sets optPurchases = 1 and
 * asks for products. Dispatching a synthetic products:loaded (which sets
 * optPurchases = 2 in products_loadedHandler) and then the purchase events makes
 * the unlock automatic at boot, independent of whether the real product query
 * later succeeds. LegitPurchase() only checks optPurchases >= 2.
 */
internal object OnSetupCompleteFingerprint : Fingerprint(
    definingClass = BILLING_CONTROLLER,
    name = "onSetupComplete",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Yodo1MasBridge.handleInitSuccess() preloads app-open, rewarded and
 * interstitial ads through the real SDK. Returning early right after
 * dispatching onSdkInitSuccess keeps the ActionScript state machine happy
 * while preventing those three ad requests.
 */
internal object Yodo1HandleInitSuccessFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "handleInitSuccess",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1LoadBannerFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "loadBannerAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object Yodo1ShowBannerFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "showBannerAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "I"),
)

internal object Yodo1HideBannerFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "hideBannerAd",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1DestroyBannerFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "destroyBannerAd",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1IsBannerLoadedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "isBannerAdLoaded",
    returnType = "Z",
    parameters = emptyList(),
)

internal object Yodo1LoadInterstitialFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "loadInterstitialAd",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1ShowInterstitialFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "showInterstitialAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object Yodo1IsInterstitialLoadedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "isInterstitialAdLoaded",
    returnType = "Z",
    parameters = emptyList(),
)

internal object Yodo1LoadRewardedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "loadRewardedAd",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1ShowRewardedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "showRewardedAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object Yodo1IsRewardedLoadedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "isRewardedAdLoaded",
    returnType = "Z",
    parameters = emptyList(),
)

internal object Yodo1LoadAppOpenFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "loadAppOpenAd",
    returnType = "V",
    parameters = emptyList(),
)

internal object Yodo1ShowAppOpenFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "showAppOpenAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

internal object Yodo1IsAppOpenLoadedFingerprint : Fingerprint(
    definingClass = YODO1_BRIDGE,
    name = "isAppOpenAdLoaded",
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Yodo1MasThinkingData.initWithAppKey(Context, JSONObject, boolean) creates
 * the ThinkingAnalyticsSDK pointed at https://c1.yodo1.com and enables
 * auto-track. Every other method in the class null-guards this field, so an
 * early return disables the tracker without breaking Yodo1 MAS itself.
 */
internal object ThinkingDataInitFingerprint : Fingerprint(
    definingClass = THINKING_DATA,
    name = "initWithAppKey",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lorg/json/JSONObject;",
        "Z",
    ),
)
