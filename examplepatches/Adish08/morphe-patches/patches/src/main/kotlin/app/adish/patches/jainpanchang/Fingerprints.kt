package app.adish.patches.jainpanchang

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.AccessFlags

object HasActiveSubscriptionsFingerprint : Fingerprint(
    definingClass = "Ldev/hyo/openiap/OpenIapModule\$hasActiveSubscriptions\$1;",
    name = "invokeSuspend",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

object GetAvailablePurchasesFingerprint : Fingerprint(
    definingClass = "Ldev/hyo/openiap/OpenIapModule\$getAvailablePurchases\$1;",
    name = "invokeSuspend",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;")
)

object RestorePurchasesFingerprint : Fingerprint(
    definingClass = "Ldev/hyo/openiap/helpers/HelpersKt;",
    name = "restorePurchases",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Lcom/android/billingclient/api/BillingClient;",
        "Ldev/hyo/openiap/helpers/ActiveStoreOperationRegistry;",
        "Z",
        "Lkotlin/coroutines/Continuation;"
    )
)

object SharedStorageSetFingerprint : Fingerprint(
    definingClass = "Lcom/jaindarshan/panchangtithi/SharedStorage;",
    name = "set",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    filters = listOf(
        string("isPremium")
    )
)

object FullScreenLoadFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsFullScreenAdModule;",
    name = "load",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;"
    )
)

object FullScreenShowFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsFullScreenAdModule;",
    name = "show",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "V",
    parameters = listOf(
        "I",
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    )
)

object BaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;")
)

object BannerRequestAdFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsBannerAdViewManager;",
    name = "requestAd",
    accessFlags = listOf(AccessFlags.PRIVATE),
    returnType = "V",
    parameters = listOf("Lio/invertase/googlemobileads/common/ReactNativeAdView;")
)

object NativeAdLoadFingerprint : Fingerprint(
    definingClass = "Lio/invertase/googlemobileads/ReactNativeGoogleMobileAdsNativeModule;",
    name = "load",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/facebook/react/bridge/ReadableMap;",
        "Lcom/facebook/react/bridge/Promise;"
    )
)
