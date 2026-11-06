package app.template.patches.smartnews.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

// ============================================================================
// 1. SmartNews First-Party Ad & Feature Flag Fingerprints
// ============================================================================

/**
 * Global remote config flag: `adNetworkInterstitialConfigV2` (`lk.a(yb1): ij`).
 */
internal object AdNetworkInterstitialConfigFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        string("adNetworkInterstitialConfigV2")
    )
)

/**
 * Global remote config flag: `channelViewAdNetworkSetting` (`lk.c(yb1): o43`).
 */
internal object ChannelViewAdNetworkSettingFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        string("channelViewAdNetworkSetting")
    )
)

/**
 * Global remote config flag: `gamPlacements` (`lk.f(yb1): tj7`).
 */
internal object GamPlacementsConfigFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        string("gamPlacements")
    )
)

/**
 * Global remote config flag: `smartViewStickyBannerAd` (`lk.n(yb1): jvf`).
 */
internal object SmartViewStickyBannerAdConfigFingerprint : Fingerprint(
    returnType = "L",
    parameters = listOf("L"),
    filters = listOf(
        string("smartViewStickyBannerAd")
    )
)

/**
 * Global remote config flag: `isAdsInsertionEnabled` (`lk.q(yb1): boolean`).
 */
internal object IsAdsInsertionEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("isAdsInsertionEnabled")
    )
)

/**
 * Global remote config flag: `confiantEnabled` (`lk.r(yb1): boolean`).
 */
internal object ConfiantEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("confiantEnabled")
    )
)

/**
 * Global remote config flag: `isOtelForAdsEnabled` (`lk.u(yb1): boolean`).
 */
internal object IsOtelForAdsEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        string("isOtelForAdsEnabled")
    )
)

/**
 * Global remote config flag: SmartView hybrid native ad config (`lk.y(yb1): wna`).
 */
internal object SmartViewHybridNativeAdConfigFingerprint : Fingerprint(
    definingClass = "Llk;",
    name = "y",
    returnType = "Lwna;",
    parameters = listOf("Lyb1;")
)

/**
 * Weather channel ads config constructor (`xp.<init>(Map, boolean)`).
 */
internal object AdsInWeatherConfigConstructorFingerprint : Fingerprint(
    definingClass = "Lxp;",
    name = "<init>",
    parameters = listOf("Ljava/util/Map;", "Z")
)

/**
 * Delivery contract ad switch (`Delivery.isAdEnabled(): boolean`).
 */
internal object DeliveryIsAdEnabledFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/delivery/contract/Delivery;",
    name = "isAdEnabled",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * DeliveryItem header ad getter (`DeliveryItem.getHeaderAd(): ph`).
 */
internal object DeliveryItemGetHeaderAdFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/delivery/contract/DeliveryItem;",
    name = "getHeaderAd",
    parameters = emptyList()
)

/**
 * DeliveryItem header ad check (`DeliveryItem.hasHeaderAd(): boolean`).
 */
internal object DeliveryItemHasHeaderAdFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/delivery/contract/DeliveryItem;",
    name = "hasHeaderAd",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Private Marketplace ad manager prefetch (`jp.gocro.smartnews.android.ad.manager.a.b()`).
 */
internal object PrivateMarketplaceAdManagerFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/ad/manager/a;",
    name = "b",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Premium 3P Ad client condition (`y6d.a(): d53`).
 */
internal object PremiumAd3pClientConditionFingerprint : Fingerprint(
    definingClass = "Ly6d;",
    name = "a",
    returnType = "Ld53;",
    parameters = emptyList()
)

/**
 * Feed ad insertion check (`sjk.A(DeliveryItem): boolean`).
 */
internal object ShouldInsertDeliveryItemAdsFingerprint : Fingerprint(
    definingClass = "Lsjk;",
    name = "A",
    returnType = "Z",
    parameters = listOf("Ljp/gocro/smartnews/android/delivery/contract/DeliveryItem;")
)

/**
 * Feed ad slot allocator lambda (`yv3.invoke(Object, Object): Object`).
 */
internal object FeedAdSlotAllocatorLambdaFingerprint : Fingerprint(
    definingClass = "Lyv3;",
    name = "invoke",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/Object;", "Ljava/lang/Object;")
)

/**
 * SmartView WebView JS interface ad allocation (`mwf.allocateAd(String)`, `prefetchAds(String)`, `relocateAd(String)`).
 */
internal object SmartViewAllocateAdFingerprint : Fingerprint(
    name = "allocateAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object SmartViewPrefetchAdsFingerprint : Fingerprint(
    name = "prefetchAds",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object SmartViewRelocateAdFingerprint : Fingerprint(
    name = "relocateAd",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * SmartView 1P Ad bridge (`guf.send1PAdObject(String)`).
 */
internal object SmartViewSend1PAdObjectFingerprint : Fingerprint(
    name = "send1PAdObject",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Full-screen / interstitial ad loader (`ag7.b(cg7)`).
 */
internal object FullScreenAdRepositoryLoadFingerprint : Fingerprint(
    definingClass = "Lag7;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lcg7;")
)

/**
 * Premium 3P Ad manager loader (`c7d.e()`).
 */
internal object PremiumAd3pManagerLoadFingerprint : Fingerprint(
    definingClass = "Lc7d;",
    name = "e",
    returnType = "V",
    parameters = emptyList()
)

/**
 * GAM initialization helper (`cj7.b(Context)`).
 */
internal object GamInitializationHelperFingerprint : Fingerprint(
    definingClass = "Lcj7;",
    name = "b",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * AdsClientCondition builder (`qp.a(): pp`).
 */
internal object AdsClientConditionFingerprint : Fingerprint(
    definingClass = "Lqp;",
    name = "a",
    returnType = "Lpp;",
    parameters = emptyList()
)

/**
 * Ad request header / payload builders (`fe.e(e7g): qh6` and `fe.f(b7g, String, boolean): String`).
 */
internal object AdRequestHeadersFingerprint : Fingerprint(
    definingClass = "Lfe;",
    name = "e",
    returnType = "Lqh6;",
    parameters = listOf("Le7g;")
)

internal object AdRequestJsonPayloadFingerprint : Fingerprint(
    definingClass = "Lfe;",
    name = "f",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lb7g;", "Ljava/lang/String;", "Z")
)

/**
 * Ad beacon & impression reporter (`ri.a(j9e)` and `ri.b(ri, Function0, String)`).
 */
internal object AdBeaconSendFingerprint : Fingerprint(
    definingClass = "Lri;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lj9e;")
)

internal object AdBeaconAsyncSendFingerprint : Fingerprint(
    definingClass = "Lri;",
    name = "b",
    returnType = "V",
    parameters = listOf("Lri;", "Lkotlin/jvm/functions/Function0;", "Ljava/lang/String;")
)

/**
 * Advertising ID holder (`sq.a(): String` -> null, `sq.b(): boolean` -> true for LimitAdTracking).
 */
internal object GetAdvertisingIdFingerprint : Fingerprint(
    definingClass = "Lsq;",
    name = "a",
    returnType = "Ljava/lang/String;",
    parameters = emptyList()
)

internal object IsLimitAdTrackingEnabledFingerprint : Fingerprint(
    definingClass = "Lsq;",
    name = "b",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * Ad UID Token Manager (`bn.a(bn): boolean` and `bn.c(): void`).
 */
internal object AdUidTokenEnabledFingerprint : Fingerprint(
    definingClass = "Lbn;",
    name = "a",
    returnType = "Z",
    parameters = listOf("Lbn;")
)

internal object AdUidTokenRefreshFingerprint : Fingerprint(
    definingClass = "Lbn;",
    name = "c",
    returnType = "V",
    parameters = emptyList()
)

// ============================================================================
// 2. SmartNews First-Party Tracking & Telemetry Fingerprints
// ============================================================================

/**
 * ActionTracker (`jb.b()`, `jb.c(b9, boolean, hrd)`, `jb.d(b9)`).
 */
internal object ActionTrackerFlushFingerprint : Fingerprint(
    definingClass = "Ljb;",
    name = "b",
    returnType = "V",
    parameters = emptyList()
)

internal object ActionTrackerRecordDetailedFingerprint : Fingerprint(
    definingClass = "Ljb;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lb9;", "Z", "Lhrd;")
)

internal object ActionTrackerRecordFingerprint : Fingerprint(
    definingClass = "Ljb;",
    name = "d",
    returnType = "V",
    parameters = listOf("Lb9;")
)

/**
 * AdActionTracker helper (`lo4.c(a, String, Pair[])`).
 */
internal object AdActionTrackerHelperFingerprint : Fingerprint(
    definingClass = "Llo4;",
    name = "c",
    returnType = "V",
    parameters = listOf("Ljp/gocro/smartnews/android/tracking/action/a;", "Ljava/lang/String;", "[Lkotlin/Pair;")
)

/**
 * SmartNews internal Adjust wrapper (`gp.b(String, Map)`).
 */
internal object SmartNewsAdjustTrackerFingerprint : Fingerprint(
    definingClass = "Lgp;",
    name = "b",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/Map;")
)

/**
 * AdsCoreModule IPv6 telemetry lifecycle listener (`AdsCoreModule$Companion.provideIpv6LifecycleListener(...)`).
 */
internal object ProvideIpv6LifecycleListenerFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/ad/di/AdsCoreModule\$Companion;",
    name = "provideIpv6LifecycleListener",
    returnType = "Lg29;"
)

/**
 * Braze configuration flags (`re2.a()`, `re2.b()`, `re2.c()`).
 */
internal object BrazeConfigEnabledFingerprint : Fingerprint(
    definingClass = "Lre2;",
    name = "a",
    returnType = "Z",
    parameters = emptyList()
)

internal object BrazeConfigPushEnabledFingerprint : Fingerprint(
    definingClass = "Lre2;",
    name = "b",
    returnType = "Z",
    parameters = emptyList()
)

internal object BrazeConfigInAppMessageEnabledFingerprint : Fingerprint(
    definingClass = "Lre2;",
    name = "c",
    returnType = "Z",
    parameters = emptyList()
)

// ============================================================================
// 3. Third-Party Ad & Tracker SDK Fingerprints (All 14 Detected SDKs)
// ============================================================================

/**
 * 1. Adjust SDK (`com.adjust.sdk.Adjust` & `com.adjust.sdk.AdjustInstance`).
 */
internal object AdjustOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;")
)

internal object AdjustTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustEvent;")
)

internal object AdjustTrackAdRevenueFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackAdRevenue",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustAdRevenue;")
)

internal object AdjustTrackAdRevenueJsonFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackAdRevenue",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lorg/json/JSONObject;")
)

internal object AdjustTrackPlayStoreSubscriptionFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackPlayStoreSubscription",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustPlayStoreSubscription;")
)

internal object AdjustTrackThirdPartySharingFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "trackThirdPartySharing",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustThirdPartySharing;")
)

internal object AdjustOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "onResume",
    returnType = "V",
    parameters = emptyList()
)

internal object AdjustSetEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "setEnabled",
    returnType = "V",
    parameters = listOf("Z")
)

internal object AdjustIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal object AdjustGetAdidFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "getAdid",
    returnType = "Ljava/lang/String;",
    parameters = emptyList()
)

internal object AdjustGetAttributionFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/Adjust;",
    name = "getAttribution",
    returnType = "Lcom/adjust/sdk/AdjustAttribution;",
    parameters = emptyList()
)

internal object AdjustInstanceOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/AdjustInstance;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustConfig;")
)

internal object AdjustInstanceTrackEventFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/AdjustInstance;",
    name = "trackEvent",
    returnType = "V",
    parameters = listOf("Lcom/adjust/sdk/AdjustEvent;")
)

internal object AdjustInstanceIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/adjust/sdk/AdjustInstance;",
    name = "isEnabled",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * 2. Amazon Advertisement (`com.amazon.device.ads.*`, `com.amazon.aps.ads.*`, `defpackage.mz`).
 */
internal object AmazonTamBridgeBannerFingerprint : Fingerprint(
    definingClass = "Lmz;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lcom/google/android/gms/ads/AdSize;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
)

internal object AmazonTamBridgeVideoFingerprint : Fingerprint(
    definingClass = "Lmz;",
    name = "c",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
)

internal object AmazonAdRegistrationIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/AdRegistration;",
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object AmazonDtbAdRequestLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DTBAdRequest;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/amazon/device/ads/DTBAdCallback;")
)

internal object AmazonDtbAdRequestInternalLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DTBAdRequest;",
    name = "internalLoadAd",
    returnType = "V",
    parameters = emptyList()
)

internal object AmazonApsInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/aps/ads/Aps;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/amazon/aps/ads/listeners/ApsInitializationListener;"
    )
)

internal object AmazonApsInitializeWithConfigFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/aps/ads/Aps;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/amazon/aps/ads/model/ApsInitConfig;",
        "Lcom/amazon/aps/ads/listeners/ApsInitializationListener;"
    )
)

internal object AmazonApsIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/aps/ads/Aps;",
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object AmazonApsAdRequestLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/aps/ads/ApsAdRequest;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/amazon/aps/ads/listeners/ApsAdRequestListener;")
)

/**
 * Amazon DTB device registration (DtbDeviceRegistration.initializeAds(): void).
 */
internal object AmazonDtbDeviceRegistrationInitializeAdsFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbDeviceRegistration;",
    name = "initializeAds",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Amazon DTB device registration verification (DtbDeviceRegistration.verifyRegistration(): void).
 */
internal object AmazonDtbDeviceRegistrationVerifyRegistrationFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbDeviceRegistration;",
    name = "verifyRegistration",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Amazon DTB device registration config (DtbDeviceRegistration.registerConfig(String): boolean).
 */
internal object AmazonDtbDeviceRegistrationRegisterConfigFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbDeviceRegistration;",
    name = "registerConfig",
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * Amazon DTB SIS ping (DtbDeviceRegistration.pingSis(String, String): void).
 */
internal object AmazonDtbDeviceRegistrationPingSisFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbDeviceRegistration;",
    name = "pingSis",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

/**
 * Amazon DTB metrics submitter (DtbMetrics$Submitter.submitMetrics(): void).
 */
internal object AmazonDtbMetricsSubmitterSubmitMetricsFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbMetrics\$Submitter;",
    name = "submitMetrics",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Amazon DTB metrics submitter with instance (DtbMetrics$Submitter.submitMetrics(DtbMetrics): void).
 */
internal object AmazonDtbMetricsSubmitterSubmitMetricsWithArgFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbMetrics\$Submitter;",
    name = "submitMetrics",
    returnType = "V",
    parameters = listOf("Lcom/amazon/device/ads/DtbMetrics;")
)

/**
 * Amazon DTB HTTP client executeGET (DtbHttpClient.executeGET(int): void).
 */
internal object AmazonDtbHttpClientExecuteGetFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbHttpClient;",
    name = "executeGET",
    returnType = "V",
    parameters = listOf("I")
)

/**
 * Amazon DTB HTTP client executePOST (DtbHttpClient.executePOST(int): void).
 */
internal object AmazonDtbHttpClientExecutePostFingerprint : Fingerprint(
    definingClass = "Lcom/amazon/device/ads/DtbHttpClient;",
    name = "executePOST",
    returnType = "V",
    parameters = listOf("I")
)

/**
 * 3. Facebook Ads (`com.facebook.ads.AudienceNetworkAds`).
 */
internal object FacebookAudienceNetworkInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AudienceNetworkAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object FacebookAudienceNetworkIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/ads/AudienceNetworkAds;",
    name = "isInitialized",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;")
)

/**
 * 4. Facebook Analytics (`com.facebook.FacebookSdk`, `com.facebook.appevents.*`).
 */
internal object FacebookSdkInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "sdkInitialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object FacebookSdkInitializeCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "sdkInitialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/facebook/FacebookSdk\$InitializeCallback;")
)

internal object FacebookSdkIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object FacebookSdkGetAutoInitEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getAutoInitEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal object FacebookSdkGetAutoLogAppEventsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getAutoLogAppEventsEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal object FacebookSdkGetAdvertiserIDCollectionEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/FacebookSdk;",
    name = "getAdvertiserIDCollectionEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal object FacebookAppEventsActivateAppFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "activateApp",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;")
)

internal object FacebookAppEventsActivateAppWithIdFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "activateApp",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;", "Ljava/lang/String;")
)

internal object FacebookAppEventsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object FacebookAppEventsLogEventBundleFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLogger;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
)

internal object FacebookAppEventsImplLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLoggerImpl;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/Double;",
        "Landroid/os/Bundle;",
        "Z",
        "Ljava/util/UUID;"
    )
)

internal object FacebookAppEventsImplActivateAppFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/appevents/AppEventsLoggerImpl;",
    name = "activateApp",
    returnType = "V",
    parameters = listOf("Landroid/app/Application;", "Ljava/lang/String;")
)

/**
 * 5. Facebook Login (`com.facebook.login.LoginManager`).
 */
internal object FacebookLoginStartLoginFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/login/LoginManager;",
    name = "startLogin",
    returnType = "V",
    parameters = listOf("Lcom/facebook/login/StartActivityDelegate;", "Lcom/facebook/login/LoginClient\$Request;")
)

internal object FacebookLoginLogStartLoginFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/login/LoginManager;",
    name = "logStartLogin",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/facebook/login/LoginClient\$Request;")
)

internal object FacebookLoginLogCompleteLoginFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/login/LoginManager;",
    name = "logCompleteLogin",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/facebook/login/LoginClient\$Result\$Code;",
        "Ljava/util/Map;",
        "Ljava/lang/Exception;",
        "Z",
        "Lcom/facebook/login/LoginClient\$Request;"
    )
)

internal object FacebookLoginResolveIntentFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/login/LoginManager;",
    name = "resolveIntent",
    returnType = "Z",
    parameters = listOf("Landroid/content/Intent;")
)

/**
 * 6. Facebook Share (`com.facebook.share.widget.ShareDialog`).
 */
internal object FacebookShareCanShowClassFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/share/widget/ShareDialog;",
    name = "canShow",
    returnType = "Z",
    parameters = listOf("Ljava/lang/Class;")
)

internal object FacebookShareCanShowModeFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/share/widget/ShareDialog;",
    name = "canShow",
    returnType = "Z",
    parameters = listOf("Lcom/facebook/share/model/ShareContent;", "Lcom/facebook/share/widget/ShareDialog\$Mode;")
)

internal object FacebookShareShowFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/share/widget/ShareDialog;",
    name = "show",
    returnType = "V",
    parameters = listOf("Lcom/facebook/share/model/ShareContent;", "Lcom/facebook/share/widget/ShareDialog\$Mode;")
)

internal object FacebookShareLogDialogShareFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/share/widget/ShareDialog;",
    name = "logDialogShare",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/facebook/share/model/ShareContent;",
        "Lcom/facebook/share/widget/ShareDialog\$Mode;"
    )
)

/**
 * 7. Google AdMob / Google Ad Manager (`com.google.android.gms.ads.*`).
 */
internal object GoogleMobileAdsInitFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object GoogleMobileAdsInitListenerFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/MobileAds;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/initialization/OnInitializationCompleteListener;"
    )
)

internal object GoogleAdLoaderLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;")
)

internal object GoogleAdLoaderLoadGamAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;")
)

internal object GoogleAdLoaderLoadAdsFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/AdLoader;",
    name = "loadAds",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;", "I")
)

internal object GoogleBaseAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/BaseAdView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/AdRequest;")
)

internal object GoogleAdManagerAdViewLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerAdView;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf("Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;")
)

internal object GoogleAdManagerInterstitialLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
        "Lcom/google/android/gms/ads/admanager/AdManagerInterstitialAdLoadCallback;"
    )
)

internal object GoogleInterstitialAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/interstitial/InterstitialAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/interstitial/InterstitialAdLoadCallback;"
    )
)

internal object GoogleRewardedAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdRequest;",
        "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;"
    )
)

internal object GoogleRewardedGamAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/ads/rewarded/RewardedAd;",
    name = "load",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/admanager/AdManagerAdRequest;",
        "Lcom/google/android/gms/ads/rewarded/RewardedAdLoadCallback;"
    )
)

/**
 * 8. Google Crashlytics (`com.google.firebase.crashlytics.*`).
 */
internal object CrashlyticsRecordExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

internal object CrashlyticsLogFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "log",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object CrashlyticsSendUnsentReportsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "sendUnsentReports",
    returnType = "V",
    parameters = emptyList()
)

internal object CrashlyticsSetEnabledBoolFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z")
)

internal object CrashlyticsSetEnabledBoxedFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;")
)

internal object CrashlyticsIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "isCrashlyticsCollectionEnabled",
    returnType = "Z",
    parameters = emptyList()
)

internal object CrashlyticsCoreLogExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;",
    name = "logException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

internal object CrashlyticsCoreLogFatalExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;",
    name = "logFatalException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;")
)

internal object CrashlyticsCoreLogFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;",
    name = "log",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object CrashlyticsCoreDoBackgroundInitFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/CrashlyticsCore;",
    name = "doBackgroundInitialization",
    returnType = "V",
    parameters = listOf("Lcom/google/firebase/crashlytics/internal/settings/SettingsProvider;")
)

/**
 * 9. Google Firebase Analytics (`com.google.firebase.analytics.FirebaseAnalytics`).
 */
internal object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;")
)

internal object FirebaseAnalyticsSetUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserId",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object FirebaseAnalyticsSetUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setUserProperty",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;")
)

internal object FirebaseAnalyticsSetCurrentScreenFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setCurrentScreen",
    returnType = "V",
    parameters = listOf("Landroid/app/Activity;", "Ljava/lang/String;", "Ljava/lang/String;")
)

internal object FirebaseAnalyticsSetEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setAnalyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z")
)

internal object FirebaseAnalyticsSetDefaultParamsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "setDefaultEventParameters",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;")
)

/**
 * 10. IAB Open Measurement (`com.iab.omid.library.*`).
 * Matches all 8 vendor Omid classes (`adsbynimbus`, `amazon5`, `bytedance2`, `displayio`, `inmobi`, `prebidorg`, `smartnews`, `vungle`).
 */
internal object OmidActivateFingerprint : Fingerprint(
    definingClass = "Lcom/iab/omid/library/",
    name = "activate",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object OmidIsActiveFingerprint : Fingerprint(
    definingClass = "Lcom/iab/omid/library/",
    name = "isActive",
    returnType = "Z",
    parameters = emptyList()
)

internal object OmidAdSessionStartFingerprint : Fingerprint(
    definingClass = "Lcom/iab/omid/library/",
    name = "start",
    returnType = "V",
    parameters = emptyList(),
    custom = { method, classDef ->
        classDef.type.endsWith("/adsession/a;") && method.implementation != null
    }
)

internal object OmidAdSessionRegisterAdViewFingerprint : Fingerprint(
    definingClass = "Lcom/iab/omid/library/",
    name = "registerAdView",
    returnType = "V",
    parameters = listOf("Landroid/view/View;"),
    custom = { method, classDef ->
        classDef.type.endsWith("/adsession/a;") && method.implementation != null
    }
)

/**
 * 11. InMobi (`com.inmobi.*`).
 */
internal object InMobiSdkInitFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/sdk/InMobiSdk;",
    name = "init",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lorg/json/JSONObject;",
        "Lcom/inmobi/sdk/SdkInitializationListener;"
    )
)

internal object InMobiSdkIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/sdk/InMobiSdk;",
    name = "isSDKInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object InMobiSdkGetTokenFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/sdk/InMobiSdk;",
    name = "getToken",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Ljava/util/Map;", "Ljava/lang/String;")
)

internal object InMobiBannerLoadFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiBanner;",
    name = "load",
    returnType = "V",
    parameters = emptyList()
)

internal object InMobiBannerLoadContextFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiBanner;",
    name = "load",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object InMobiBannerLoadBytesFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiBanner;",
    name = "load",
    returnType = "V",
    parameters = listOf("[B")
)

internal object InMobiInterstitialLoadFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiInterstitial;",
    name = "load",
    returnType = "V",
    parameters = emptyList()
)

internal object InMobiInterstitialLoadBytesFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiInterstitial;",
    name = "load",
    returnType = "V",
    parameters = listOf("[B")
)

internal object InMobiInterstitialShowFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiInterstitial;",
    name = "show",
    returnType = "V",
    parameters = emptyList()
)

internal object InMobiNativeLoadFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiNative;",
    name = "load",
    returnType = "V",
    parameters = emptyList()
)

internal object InMobiNativeLoadBytesFingerprint : Fingerprint(
    definingClass = "Lcom/inmobi/ads/InMobiNative;",
    name = "load",
    returnType = "V",
    parameters = listOf("[B")
)

/**
 * 12. OpenTelemetry (`jp.gocro.smartnews.android.telemetry.*`, `defpackage.zug`, `defpackage.nx1`).
 */
internal object ProvideOpenTelemetryProviderFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/telemetry/di/OpenTelemetryInternalModule\$Companion;",
    name = "provideOpenTelemetryProvider",
    returnType = "Ldvg;"
)

internal object OtelNetworkInstrumentationEnabledFingerprint : Fingerprint(
    definingClass = "Lzug;",
    name = "a",
    returnType = "Z",
    parameters = emptyList()
)

internal object OtelBatchSpanProcessorOfferFingerprint : Fingerprint(
    definingClass = "Lnx1;",
    name = "h0",
    returnType = "V",
    parameters = listOf("Lswe;")
)

/**
 * 13. Pangle / ByteDance OpenAdSDK (`com.bytedance.sdk.openadsdk.*`).
 */
internal object PanglePagSdkInitFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;",
    name = "init",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/bytedance/sdk/openadsdk/api/init/PAGConfig;",
        "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk\$PAGInitCallback;"
    )
)

internal object PanglePagSdkIsInitSuccessFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;",
    name = "isInitSuccess",
    returnType = "Z",
    parameters = emptyList()
)

internal object PanglePagSdkGetBiddingTokenCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;",
    name = "getBiddingToken",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/bytedance/sdk/openadsdk/api/bidding/PAGBiddingRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/init/BiddingTokenCallback;"
    )
)

internal object PanglePagSdkGetBiddingTokenBidCallbackFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/init/PAGSdk;",
    name = "getBiddingToken",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/bytedance/sdk/openadsdk/api/bidding/PAGBiddingRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/init/PAGBidCallback;"
    )
)

internal object PangleBannerLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/banner/PAGBannerAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/bytedance/sdk/openadsdk/api/banner/PAGBannerRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/banner/PAGBannerAdLoadListener;"
    )
)

internal object PangleInterstitialLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/interstitial/PAGInterstitialAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/bytedance/sdk/openadsdk/api/interstitial/PAGInterstitialRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/interstitial/PAGInterstitialAdLoadListener;"
    )
)

internal object PangleNativeLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/nativeAd/PAGNativeAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/bytedance/sdk/openadsdk/api/nativeAd/PAGNativeRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/nativeAd/PAGNativeAdLoadListener;"
    )
)

internal object PangleAppOpenLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/open/PAGAppOpenAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/bytedance/sdk/openadsdk/api/open/PAGAppOpenRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/open/PAGAppOpenAdLoadListener;"
    )
)

internal object PangleRewardedLoadAdFingerprint : Fingerprint(
    definingClass = "Lcom/bytedance/sdk/openadsdk/api/reward/PAGRewardedAd;",
    name = "loadAd",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/bytedance/sdk/openadsdk/api/reward/PAGRewardedRequest;",
        "Lcom/bytedance/sdk/openadsdk/api/reward/PAGRewardedAdLoadListener;"
    )
)

/**
 * 14. Prebid Mobile (`org.prebid.mobile.*`, `defpackage.i3d`).
 */
internal object PrebidMobileInitializeSdkFingerprint : Fingerprint(
    definingClass = "Lorg/prebid/mobile/PrebidMobile;",
    name = "initializeSdk",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lorg/prebid/mobile/rendering/listeners/SdkInitializationListener;"
    )
)

internal object PrebidMobileIsSdkInitializedFingerprint : Fingerprint(
    definingClass = "Lorg/prebid/mobile/PrebidMobile;",
    name = "isSdkInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object PrebidAdUnitFetchDemandResultFingerprint : Fingerprint(
    definingClass = "Lorg/prebid/mobile/AdUnit;",
    name = "fetchDemand",
    returnType = "V",
    parameters = listOf("Lorg/prebid/mobile/api/original/OnFetchDemandResult;")
)

internal object PrebidAdUnitFetchDemandCompleteFingerprint : Fingerprint(
    definingClass = "Lorg/prebid/mobile/AdUnit;",
    name = "fetchDemand",
    returnType = "V",
    parameters = listOf("Ljava/lang/Object;", "Lorg/prebid/mobile/OnCompleteListener;")
)

internal object PrebidBridgeInitFingerprint : Fingerprint(
    definingClass = "Li3d;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
)

internal object PrebidBridgeBannerDemandFingerprint : Fingerprint(
    definingClass = "Li3d;",
    name = "b",
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lcom/google/android/gms/ads/AdSize;",
        "Ldk;",
        "Z",
        "Ldm;",
        "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"
    )
)

internal object PrebidBridgeNativeDemandFingerprint : Fingerprint(
    definingClass = "Li3d;",
    name = "e",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;")
)

/**
 * 15. Confiant & AppHarbr Ad Verification SDKs (`com.confiant.*`, `com.appharbr.*`).
 */
internal object ConfiantInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/confiant/android/sdk/Confiant\$Companion;",
    name = "initialize",
    returnType = "V",
    parameters = listOf("Libf;", "Lrk3;")
)

internal object AppHarbrInitializeConfigFingerprint : Fingerprint(
    definingClass = "Lcom/appharbr/sdk/engine/AppHarbr;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/appharbr/sdk/configuration/AHSdkConfiguration;",
        "Lcom/appharbr/sdk/engine/listeners/OnAppHarbrInitializationCompleteListener;"
    )
)

internal object AppHarbrInitializeKeyFingerprint : Fingerprint(
    definingClass = "Lcom/appharbr/sdk/engine/AppHarbr;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Lcom/appharbr/sdk/engine/listeners/OnAppHarbrInitializationCompleteListener;"
    )
)

internal object AppHarbrIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/appharbr/sdk/engine/AppHarbr;",
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

/**
 * 16. SmartNews 1P Ad Object Creation & Unified Feed Ad Insertion
 * (`df-thumbnail.smartnews-ads.com`, `thumbnail.smartnews-ads.com`, `creative.smartnews-ads.com`, `api.smartnews-ads.com`).
 */
internal object AdImplCompanionCreateFingerprint : Fingerprint(
    definingClass = "Lcom/smartnews/ad/android/AdImpl\$Companion;",
    name = "create",
    returnType = "Lph;",
    parameters = listOf("Lhf;", "Ljava/lang/String;", "Lri;")
)

internal object AdImplCompanionFromJsonStringFingerprint : Fingerprint(
    definingClass = "Lcom/smartnews/ad/android/AdImpl\$Companion;",
    name = "fromJsonString",
    returnType = "Lph;",
    parameters = listOf("Ljava/lang/String;")
)

internal object AdDeserializerDeserializeFingerprint : Fingerprint(
    definingClass = "Lcom/smartnews/ad/android/json/AdDeserializer;",
    name = "deserialize",
    returnType = "Lph;",
    parameters = listOf("Lvk9;", "La95;")
)

internal object StandardAdPlaceholderGetAdContentFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/ad/contract/response/StandardAdPlaceholder;",
    name = "getAdContent",
    returnType = "Ljp/gocro/smartnews/android/ad/contract/response/FeedAdContentResponse;",
    parameters = emptyList()
)

internal object UnifiedAdPlaceholderParserFingerprint : Fingerprint(
    definingClass = "Ljg;",
    name = "a",
    returnType = "Ljava/util/ArrayList;",
    parameters = listOf("Ljava/lang/String;", "Ljava/util/List;", "Ljava/util/Map;", "Lt2;")
)

internal object SmartNewsAdResponseParserFingerprint : Fingerprint(
    definingClass = "Lyrf;",
    name = "a",
    returnType = "Ljava/util/HashMap;",
    parameters = listOf("Lvbd;")
)

internal object AdDataLoaderCompanionGetExistingAdDataFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/ad/controller/AdDataLoader\$Companion;",
    name = "getExistingAdData\$ads_core",
    returnType = "Ljava/util/List;",
    parameters = listOf("Ljp/gocro/smartnews/android/delivery/contract/DeliveryItem;", "Ljava/util/Map;")
)

internal object AdRelatedAttributesIsAdsInsertionEnabledFingerprint : Fingerprint(
    definingClass = "Llk;",
    name = "q",
    returnType = "Z",
    parameters = listOf("Lyb1;"),
    strings = listOf("isAdsInsertionEnabled")
)

/**
 * 17. SmartNews 1P Ad Endpoints & OMSDK Javascript Loader
 * (`api.smartnews-ads.com`, `cdn.smartnews-ads.com`, `log.smartnews-ads.com`, `a6.smartnews-ads.com`).
 */
internal object StandardEndpointsBuildUrlFingerprint : Fingerprint(
    definingClass = "Lc7g;",
    name = "a",
    returnType = "Ljava/lang/String;",
    parameters = listOf("Lb7g;")
)

internal object StandardEndpointsInitFingerprint : Fingerprint(
    definingClass = "Lc7g;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lcom/smartnews/ad/android/EndpointsEnvironment;", "Ljava/lang/String;")
)

internal object SatEndpointsInitFingerprint : Fingerprint(
    definingClass = "Lrqe;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object OmSdkJavascriptLoaderOpenStreamFingerprint : Fingerprint(
    definingClass = "Lcom/smartnews/ad/android/omsdk/OmSdkJavascriptLoader\$Companion;",
    name = "a",
    returnType = "Ljava/io/InputStream;",
    parameters = listOf("Ljava/lang/String;")
)

/**
 * 18. SmartView WebView Preconnects & Ad Blocking
 * (`thumbnail.smartnews-ads.com`, `creative.smartnews-ads.com`, `cdn.smartnews-ads.com`, `api.smartnews-ads.com`).
 */
internal object SmartViewClientConditionsBlockingAdsEnabledFingerprint : Fingerprint(
    definingClass = "Lxtf;",
    name = "a",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("blockingSmartViewAdsEnabled")
)

internal object ArticleHtmlFormatterClinitFingerprint : Fingerprint(
    definingClass = "Lzv0;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf(
        "https://thumbnail.smartnews-ads.com/",
        "https://creative.smartnews-ads.com/",
        "https://cdn.smartnews-ads.com/",
        "https://api.smartnews-ads.com/"
    )
)

/**
 * 19. Vungle / Liftoff Monetize SDK & RemoteConfig Ad Settings (`com.vungle.ads.*`, `config.ads.vungle.com`, `logs.ads.vungle.com`).
 */
internal object VungleProviderOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleProvider;",
    name = "onCreate",
    returnType = "Z",
    parameters = emptyList()
)

internal object VungleAdsCompanionInitFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleAds\$Companion;",
    name = "init",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lcom/vungle/ads/InitializationListener;")
)

internal object VungleAdsCompanionIsInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleAds\$Companion;",
    name = "isInitialized",
    returnType = "Z",
    parameters = emptyList()
)

internal object VungleAdsCompanionGetBiddingTokenFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/VungleAds\$Companion;",
    name = "getBiddingToken",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/vungle/ads/BidTokenCallback;")
)

internal object VungleInitializerInitFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/v2;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/lang/String;", "Lcom/vungle/ads/InitializationListener;")
)

internal object VungleConfigManagerFetchConfigAsyncFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/ConfigManager;",
    name = "a",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lcom/vungle/ads/internal/p2;")
)

internal object VungleApiClientConfigFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/network/VungleApiClient;",
    name = "a",
    returnType = "Lcom/vungle/ads/internal/network/m;",
    parameters = emptyList()
)

internal object VungleApiClientReportErrorsFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/network/VungleApiClient;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/util/concurrent/LinkedBlockingQueue;", "Lcom/vungle/ads/internal/x;")
)

internal object VungleApiClientReportMetricsFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/network/VungleApiClient;",
    name = "a",
    returnType = "V",
    parameters = listOf("Ljava/util/concurrent/LinkedBlockingQueue;", "Lcom/vungle/ads/internal/y;")
)

internal object VungleAnalyticsClientReportFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/AnalyticsClient;",
    name = "report",
    returnType = "V",
    parameters = emptyList()
)

internal object VungleAnalyticsClientInitOrUpdateFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/internal/AnalyticsClient;",
    name = "a",
    returnType = "V",
    parameters = listOf("Lcom/vungle/ads/internal/network/VungleApiClient;", "Lcom/vungle/ads/internal/executor/j;", "I", "Z")
)

internal object VungleBaseAdLoadFingerprint : Fingerprint(
    definingClass = "Lcom/vungle/ads/BaseAd;",
    name = "load",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;")
)

internal object VungleMediationAdapterInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/google/ads/mediation/vungle/VungleMediationAdapter;",
    name = "initialize",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/google/android/gms/ads/mediation/InitializationCompleteCallback;",
        "Ljava/util/List;"
    )
)

internal object NimbusConfigParserFingerprint : Fingerprint(
    definingClass = "Lacj;",
    name = "L",
    returnType = "Ljrb;",
    parameters = listOf("Ljava/util/Map;"),
    strings = listOf("liftoffAppId", "metaAppId")
)

internal object PrebidConfigParserFingerprint : Fingerprint(
    definingClass = "Lacj;",
    name = "M",
    returnType = "Lu2d;",
    parameters = listOf("Ljava/util/Map;"),
    strings = listOf("accountId", "customHostUrl")
)

/**
 * 20. Google AppMeasurement / Server-Side Google Tag Manager (sGTM) & NTT Docomo OIDC GA4 Measurement Protocol
 * (`com.google.android.gms.measurement.*`, `app-measurement.com`, `www.google-analytics.com/mp/collect`).
 */
internal object MeasurementClientExecuteFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/internal/measurement/zzdy;",
    name = "g",
    returnType = "V",
    parameters = listOf("Lv9k;")
)

internal object MeasurementCoreIsEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzhy;",
    name = "e",
    returnType = "Z",
    parameters = emptyList()
)

internal object MeasurementCoreCheckInitializedFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzhy;",
    name = "f",
    returnType = "Z",
    parameters = emptyList(),
    strings = listOf("AppMeasurement is not initialized")
)

internal object MeasurementCoreGetEnabledStateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzhy;",
    name = "g",
    returnType = "I",
    parameters = emptyList(),
    strings = listOf("firebase_analytics_collection_deactivated", "measurement_enabled")
)

internal object MeasurementNetworkUploadBatchFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzgr;",
    name = "H0",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Lx1l;",
        "Lcom/google/android/gms/internal/measurement/zzfy\$zzj;",
        "Llnk;"
    )
)

internal object MeasurementNetworkIsConnectedFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzgr;",
    name = "J0",
    returnType = "Z",
    parameters = emptyList()
)

internal object MeasurementControllerUploadByAppIdFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zznv;",
    name = "Q",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("Failed to parse URL. Not uploading MeasurementBatch. appId")
)

internal object MeasurementControllerProcessBatchesFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zznv;",
    name = "c0",
    returnType = "V",
    parameters = emptyList(),
    strings = listOf("Processed MeasurementBatch for sGTM.")
)

internal object MeasurementListenerLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/internal/zzjq;",
    name = "Q0",
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "J",
        "Landroid/os/Bundle;",
        "Z",
        "Z",
        "Z"
    ),
    strings = listOf("com.google.android.gms.tagmanager.TagManagerService")
)

internal object AppMeasurementJobServiceOnStartJobFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurementJobService;",
    name = "onStartJob",
    returnType = "Z",
    parameters = listOf("Landroid/app/job/JobParameters;")
)

internal object AppMeasurementReceiverOnReceiveFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/AppMeasurementReceiver;",
    name = "onReceive",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Landroid/content/Intent;")
)

internal object DocomoOidcMeasurementIsEnabledFingerprint : Fingerprint(
    definingClass = "Lxa6;",
    name = "t",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    strings = listOf("oidcsdk_measurement_protocol_collection_deactivated", "MEASUREMENT_PROTOCOL_ENABLED")
)

internal object DocomoOidcMeasurementSendFingerprint : Fingerprint(
    definingClass = "Lxa6;",
    name = "o",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;")
)

internal object DocomoOidcMeasurementBuildUrlFingerprint : Fingerprint(
    definingClass = "Lxa6;",
    name = "s",
    returnType = "Ljava/lang/String;",
    parameters = emptyList(),
    strings = listOf("www.google-analytics.com", "/mp/collect")
)


// ============================================================================
// 21. WebViewWrapper / SmartView Web Tracker & GTM URL Interception
// ============================================================================

/**
 * Matches `vzh.a(String url): boolean` which evaluates whether a URL should be intercepted/blocked in WebViewWrapper.
 */
internal object WebViewUrlFilterShouldBlockFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf("Ljava/lang/String;"),
    strings = listOf("http://", "https://"),
    custom = { method, classDef ->
        classDef.fields.count() == 3 && classDef.methods.any { it.name == "b" && it.parameterTypes == listOf("Ljava/lang/String;") }
    }
)


/** Initialize the existing tracker filter once, before any article requests. */
internal object WebViewWrapperStaticInitializerFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/view/WebViewWrapper;",
    name = "<clinit>",
    returnType = "V",
    parameters = emptyList()
)

/**
 * Matches `WebViewWrapper`'s dedicated `WebViewClient` (e.g. `d1j.shouldInterceptRequest(WebView, WebResourceRequest)`).
 * Intercepts requests directly at the client entrypoint before any `WebViewWrapper.U` null-checks.
 */
internal object WebViewWrapperClientInterceptRequestFingerprint : Fingerprint(
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    custom = { method, classDef ->
        classDef.superclass == "Landroid/webkit/WebViewClient;" &&
        classDef.fields.any { it.type == "Ljp/gocro/smartnews/android/view/WebViewWrapper;" }
    }
)

/**
 * Matches `WebViewWrapper`'s dedicated `WebViewClient` (e.g. `d1j.shouldInterceptRequest(WebView, String)`).
 */
internal object WebViewWrapperClientInterceptUrlFingerprint : Fingerprint(
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Ljava/lang/String;"),
    custom = { method, classDef ->
        classDef.superclass == "Landroid/webkit/WebViewClient;" &&
        classDef.fields.any { it.type == "Ljp/gocro/smartnews/android/view/WebViewWrapper;" }
    }
)

/** Initialization point used only by the opt-in local Sentry diagnostic build. */
internal object WebViewWrapperInitializeDiagnosticsFingerprint : Fingerprint(
    definingClass = "Ljp/gocro/smartnews/android/view/WebViewWrapper;",
    returnType = "V",
    parameters = emptyList(),
    custom = { method, _ ->
        method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()
            ?.mapNotNull { it.reference as? MethodReference }?.any {
                it.definingClass == "Landroid/webkit/WebView;" && it.name == "setWebViewClient"
            } == true
    }
)


/** Shared page client observed on the home Morning Package WebView. */
internal object SharedPageWebViewClientInterceptRequestFingerprint : Fingerprint(
    name = "shouldInterceptRequest",
    returnType = "Landroid/webkit/WebResourceResponse;",
    parameters = listOf("Landroid/webkit/WebView;", "Landroid/webkit/WebResourceRequest;"),
    custom = { _, classDef ->
        classDef.superclass == "Landroid/webkit/WebViewClient;" &&
            classDef.fields.any { it.type == "Ljava/lang/Boolean;" } &&
            classDef.methods.any { method ->
                method.name == "onPageFinished" &&
                    method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()
                        ?.mapNotNull { it.reference as? MethodReference }?.any {
                            it.definingClass == "Landroid/webkit/WebView;" && it.name == "getOriginalUrl"
                        } == true
            } && classDef.methods.any { method ->
                method.name == "onReceivedError" &&
                    method.implementation?.instructions?.filterIsInstance<ReferenceInstruction>()
                        ?.mapNotNull { it.reference as? MethodReference }?.any {
                            it.definingClass == "Landroid/webkit/WebResourceRequest;" && it.name == "isForMainFrame"
                        } == true
            }
    }
)
