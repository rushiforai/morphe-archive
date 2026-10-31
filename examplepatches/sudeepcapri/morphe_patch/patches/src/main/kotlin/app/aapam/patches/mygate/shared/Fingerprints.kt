package app.aapam.patches.mygate.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.string

/**
 * Fingerprint for KotlinUtils.Companion.u()Z which checks whether the current user
 * has an active USER_PREMIUM_PLAN or SOCIETY_PREMIUM_PLAN.
 */
internal object PremiumPlanCheckFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/KotlinUtils\$Companion;",
    returnType = "Z",
    parameters = emptyList(),
    filters = listOf(
        string("USER_PREMIUM_PLAN"),
        string("SOCIETY_PREMIUM_PLAN"),
    ),
)

/**
 * Fingerprint for SocietyPlan.getCode() returning the subscription plan code.
 */
internal object SocietyPlanGetCodeFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    name = "getCode",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for SocietyPlan.getName() returning the subscription plan name.
 */
internal object SocietyPlanGetNameFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    name = "getName",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserProfile.getCombinedUserPlanStatus() returning the combined plan status string.
 */
internal object UserProfileGetCombinedPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
    name = "getCombinedUserPlanStatus",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserProfile.getUserPlan() returning the active user SocietyPlan.
 */
internal object UserProfileGetUserPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
    name = "getUserPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserProfile.getSocietyHighestPlan() returning the society SocietyPlan.
 */
internal object UserProfileGetSocietyHighestPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
    name = "getSocietyHighestPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)

/**
 * Fingerprint for MygateAdLoader.getMyGateAdData(...) which initiates single ad requests.
 */
internal object MygateAdLoaderGetAdDataFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
    name = "getMyGateAdData",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/mygate/adsdk/utils/MygateAdDataListener;",
        "Z",
        "Z",
    ),
)

/**
 * Fingerprint for MygateAdLoader.getMyGateMultiAdData(...) which initiates multi ad requests.
 */
internal object MygateAdLoaderGetMultiAdDataFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
    name = "getMyGateMultiAdData",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Lcom/mygate/adsdk/utils/MygateAdDataListener;",
        "Z",
        "Z",
    ),
)

/**
 * Fingerprint for MygateAdLoader.loadAd(...) which loads scratch and image ads into views.
 */
internal object MygateAdLoaderLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/ImageView;",
        "Lcom/mygate/adsdk/ScratchView;",
        "Landroid/widget/TextView;",
        "Landroid/widget/FrameLayout;",
    ),
)

/**
 * Fingerprint for MygateAdLoader.loadGlobalMastheadAd(...) which loads the masthead banner.
 */
internal object MygateAdLoaderLoadMastheadFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
    name = "loadGlobalMastheadAd",
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/ImageView;",
    ),
)

/**
 * Fingerprint for MygateAdLoader.loadImageAd(...) which loads generic image banner ads.
 */
internal object MygateAdLoaderLoadImageAdFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdLoader;",
    name = "loadImageAd",
    returnType = "V",
    parameters = listOf(
        "Landroid/widget/ImageView;",
        "I",
        "I",
    ),
)

/**
 * Fingerprint for FloatingBannerAdHandler.loadAd(String, boolean).
 */
internal object FloatingBannerAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Z",
    ),
)

/**
 * Fingerprint for FloatingBannerAdHandler.showAd().
 */
internal object FloatingBannerAdShowFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
    name = "showAd",
    returnType = "V",
    parameters = emptyList(),
)

/**
 * Fingerprint for FloatingBannerAdHandler.setupData(AdResponse).
 */
internal object FloatingBannerSetupDataFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/ads/FloatingBannerAdHandler;",
    name = "setupData",
    returnType = "V",
    parameters = listOf("Lcom/mygate/adsdk/pojo/AdResponse;"),
)

/**
 * Fingerprint for UserProfile.getAdTierLabel() returning the ad tier label.
 */
internal object UserProfileGetAdTierLabelFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserProfile;",
    name = "getAdTierLabel",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for Flat.getSerliazedUserinfo() returning the JSON user info.
 */
internal object FlatGetSerializedUserInfoFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "getSerliazedUserinfo",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for MygateAdSdk.getBASE_URL().
 */
internal object MygateAdSdkGetBaseUrlFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdSdk;",
    name = "getBASE_URL",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for MygateAdSdk.getMETRIC_BASE_URL().
 */
internal object MygateAdSdkGetMetricBaseUrlFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/adsdk/MygateAdSdk;",
    name = "getMETRIC_BASE_URL",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for MethodChannelHelper.h(String) which sends userInfo JSON to Flutter.
 */
internal object MethodChannelUpdateUserInfoFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/flutterUtils/MethodChannelHelper;",
    name = "h",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Fingerprint for Flat.getHomePageEnableAdSdk().
 */
internal object FlatGetHomePageEnableAdSdkFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "getHomePageEnableAdSdk",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for Flat.getNotificationEnableAdSdk().
 */
internal object FlatGetNotificationEnableAdSdkFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "getNotificationEnableAdSdk",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for Flat.getSocietyPlan().
 */
internal object FlatGetSocietyPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "getSocietyPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getAdTierLabel().
 */
internal object UserInfoPojoTempGetAdTierLabelFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getAdTierLabel",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getHomePageEnableAdSdk().
 */
internal object UserInfoPojoTempGetHomePageEnableAdSdkFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getHomePageEnableAdSdk",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getNotificationEnableAdSdk().
 */
internal object UserInfoPojoTempGetNotificationEnableAdSdkFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getNotificationEnableAdSdk",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getSocietyPlan().
 */
internal object UserInfoPojoTempGetSocietyPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getSocietyPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getUserPlan().
 */
internal object UserInfoPojoTempGetUserPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getUserPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getSocietyHighestPlan().
 */
internal object UserInfoPojoTempGetSocietyHighestPlanFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getSocietyHighestPlan",
    returnType = "Lcom/mygate/user/modules/flats/entity/SocietyPlan;",
    parameters = emptyList(),
)
/**
 * Fingerprint for Flat.setSerliazedUserinfo(String).
 */
internal object FlatSetSerializedUserInfoFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "setSerliazedUserinfo",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Fingerprint for Flat.getProductPackage().
 */
internal object FlatGetProductPackageFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/flats/entity/Flat;",
    name = "getProductPackage",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprint for UserInfoPojoTemp.getProductPackage().
 */
internal object UserInfoPojoTempGetProductPackageFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/userprofile/entity/UserInfoPojoTemp;",
    name = "getProductPackage",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
)

/**
 * Fingerprints for Payment Diagnostics and WebView instrumentation
 */
internal object CustomWebviewActivityU1Fingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/common/ui/CustomWebviewActivity;",
    name = "u1",
    returnType = "V",
    parameters = emptyList(),
)

internal object CustomWebviewActivityOpenUPIFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/common/ui/CustomWebviewActivity;",
    name = "openUPIHandler",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object WebChromeClientOnConsoleMessageFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/common/ui/CustomWebviewActivity\$3;",
    name = "onConsoleMessage",
    returnType = "Z",
    parameters = listOf("Landroid/webkit/ConsoleMessage;"),
)

internal object WebViewClientOnPageStartedFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/common/ui/CustomWebviewActivity\$4;",
    name = "onPageStarted",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;", "Landroid/graphics/Bitmap;"),
)

internal object WebViewClientOnPageFinishedFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/common/ui/CustomWebviewActivity\$4;",
    name = "onPageFinished",
    returnType = "V",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
)

internal object ReleaseLogImplDebugFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/logging/ReleaseLogImpl;",
    name = "debug",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object ReleaseLogImplInfoFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/logging/ReleaseLogImpl;",
    name = "info",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object ReleaseLogImplErrorFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/logging/ReleaseLogImpl;",
    name = "error",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

internal object CommonUtilityR0Fingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/CommonUtility;",
    name = "r0",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lcom/mygate/user/modules/flats/entity/Flat;", "Lcom/mygate/user/modules/userprofile/entity/UserProfile;"),
)

internal object CommonUtilityQ0Fingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/utilities/CommonUtility;",
    name = "q0",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/lang/String;", "Lcom/mygate/user/modules/flats/entity/Flat;", "Lcom/mygate/user/modules/userprofile/entity/UserProfile;"),
)

/**
 * Fingerprint for NotificationEngine.c(...) which requests approval alert ad creatives.
 */
internal object NotificationEngineGetAdCreativeFingerprint : Fingerprint(
    definingClass = "Lcom/mygate/user/modules/notifications/engine/NotificationEngine;",
    name = "c",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
    filters = listOf(
        string("APPROVAL_ALERT"),
        string("cmp/v1"),
    ),
)

