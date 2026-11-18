package io.github.henr1klmb.patches.hellofitpro

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility

internal val HELLOFITPRO_COMPATIBILITY = Compatibility(
    packageName = "com.app.cy.hellofitpro",
    name = "HelloFit Pro",
    targets = listOf(AppTarget("1.3.9")),
)

private const val STRING_TYPE = "Ljava/lang/String;"
private const val CONTEXT_TYPE = "Landroid/content/Context;"
private const val MAP_TYPE = "Ljava/util/Map;"
private const val THROWABLE_TYPE = "Ljava/lang/Throwable;"
private const val INT_TYPE = "I"
private const val VOID_RETURN = "V"
private const val BOOLEAN_RETURN = "Z"

private const val ON_CREATE_NAME = "onCreate"
private const val REPORT_EVENT_NAME = "reportEvent"
private const val REPORT_ERROR_NAME = "reportError"
private const val ON_EVENT_NAME = "onEvent"
private const val LOAD_AD_NAME = "loadAd"
private const val INIT_NAME = "init"

// Ad Classes
private const val AD_INTERSTITIAL_MANAGER_CLASS = "Lcom/app/cy/GsFit/utils/AdInterstitialManager;"
private const val LIFECYCLE_AD_HOT_SPLASH_CLASS = "Lcom/app/cy/GsFit/ui/login/listener/LifecycleAdHotSplash;"
private const val SPLASH_AD_ACTIVITY_CLASS = "Lcom/app/cy/GsFit/ui/login/SplashAdActivity;"
private const val HEALTH_FRAGMENT_CLASS = "Lcom/app/cy/GsFit/ui/main/HealthFragment;"
private const val TU_SDK_CLASS = "Lcom/thinkup/core/api/TUSDK;"
private const val OGURY_CLASS = "Lcom/ogury/sdk/Ogury;"
private const val INMOBI_SDK_CLASS = "Lcom/inmobi/sdk/InMobiSdk;"

// Ad Provider Classes
private const val YANDEX_INIT_PROVIDER_CLASS = "Lcom/yandex/mobile/ads/core/initializer/MobileAdsInitializeProvider;"
private const val VUNGLE_PROVIDER_CLASS = "Lcom/vungle/ads/VungleProvider;"
private const val THINKUP_INIT_PROVIDER_CLASS = "Lcom/thinkup/core/api/TUInitializationProvider;"
private const val STARTAPP_INIT_PROVIDER_CLASS = "Lcom/startapp/sdk/adsbase/StartAppInitProvider;"
private const val AUDIENCE_NETWORK_CONTENT_PROVIDER_CLASS = "Lcom/facebook/ads/AudienceNetworkContentProvider;"
private const val GOOGLE_MOBILE_ADS_INIT_PROVIDER_CLASS = "Lcom/google/android/gms/ads/MobileAdsInitProvider;"
private const val BIGO_ADS_PROVIDER_CLASS = "Lsg/bigo/ads/controller/provider/BigoAdsProvider;"
private const val TRAMINI_CONTENT_PROVIDER_CLASS = "Lcom/tramini/plugin/api/TraminiContentProvider;"
private const val SDM_INITIALIZATION_PROVIDER_CLASS = "Lcom/smartdigimkt/sdk/api/SDMInitializationProvider;"

// Tracking Classes
private const val UM_CONFIGURE_CLASS = "Lcom/umeng/commonsdk/UMConfigure;"
private const val MOBCLICK_AGENT_CLASS = "Lcom/umeng/analytics/MobclickAgent;"
private const val APP_METRICA_CLASS = "Lio/appmetrica/analytics/AppMetrica;"
private const val PRELOAD_INFO_CONTENT_PROVIDER_CLASS = "Lio/appmetrica/analytics/internal/PreloadInfoContentProvider;"

// Feature Flag & Settings Classes
private const val SP_MAP_CLASS = "Lcom/app/cy/GsFit/utils/sp/SpMap;"

// In-App Ad Management & Splash Fingerprints

internal object AdInterstitialManagerShouldShowAdFingerprint : Fingerprint(
    definingClass = AD_INTERSTITIAL_MANAGER_CLASS,
    name = "shouldShowAd",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object AdInterstitialManagerShouldReportsShowFingerprint : Fingerprint(
    definingClass = AD_INTERSTITIAL_MANAGER_CLASS,
    name = "shouldReportsShow",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object LifecycleAdHotSplashCanShowADFingerprint : Fingerprint(
    definingClass = LIFECYCLE_AD_HOT_SPLASH_CLASS,
    name = "canShowAD",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object SplashAdActivityLoadAdFingerprint : Fingerprint(
    definingClass = SPLASH_AD_ACTIVITY_CLASS,
    name = LOAD_AD_NAME,
    returnType = VOID_RETURN,
    parameters = emptyList(),
)

internal object HealthFragmentInitBannerViewFingerprint : Fingerprint(
    definingClass = HEALTH_FRAGMENT_CLASS,
    name = "initBannerView",
    returnType = VOID_RETURN,
    parameters = emptyList(),
)

internal object TUSdkInitFingerprint : Fingerprint(
    definingClass = TU_SDK_CLASS,
    name = INIT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, STRING_TYPE),
)

internal object OguryStartFingerprint : Fingerprint(
    definingClass = OGURY_CLASS,
    name = "start",
    returnType = VOID_RETURN,
    parameters = listOf("Lcom/ogury/sdk/OguryConfiguration;"),
)

internal object InMobiSdkInitFingerprint : Fingerprint(
    definingClass = INMOBI_SDK_CLASS,
    name = INIT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, "Lorg/json/JSONObject;", "Lcom/inmobi/sdk/SdkInitializationListener;"),
)

internal object InMobiSdkIsInitializedFingerprint : Fingerprint(
    definingClass = INMOBI_SDK_CLASS,
    name = "isSDKInitialized",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

// Ad SDK ContentProvider Fingerprints

internal object YandexMobileAdsInitializeProviderOnCreateFingerprint : Fingerprint(
    definingClass = YANDEX_INIT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object VungleProviderOnCreateFingerprint : Fingerprint(
    definingClass = VUNGLE_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object ThinkUpInitializationProviderOnCreateFingerprint : Fingerprint(
    definingClass = THINKUP_INIT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object StartAppInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = STARTAPP_INIT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object AudienceNetworkContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = AUDIENCE_NETWORK_CONTENT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object GoogleMobileAdsInitProviderOnCreateFingerprint : Fingerprint(
    definingClass = GOOGLE_MOBILE_ADS_INIT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object BigoAdsProviderOnCreateFingerprint : Fingerprint(
    definingClass = BIGO_ADS_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object TraminiContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = TRAMINI_CONTENT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object SdmInitializationProviderOnCreateFingerprint : Fingerprint(
    definingClass = SDM_INITIALIZATION_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

// Tracking & Analytics ContentProvider Fingerprints

internal object PreloadInfoContentProviderOnCreateFingerprint : Fingerprint(
    definingClass = PRELOAD_INFO_CONTENT_PROVIDER_CLASS,
    name = ON_CREATE_NAME,
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

// Umeng Analytics & Config Fingerprints

internal object UmConfigureInitFingerprint : Fingerprint(
    definingClass = UM_CONFIGURE_CLASS,
    name = INIT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, STRING_TYPE, INT_TYPE, STRING_TYPE),
)

internal object UmConfigurePreInitFingerprint : Fingerprint(
    definingClass = UM_CONFIGURE_CLASS,
    name = "preInit",
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, STRING_TYPE),
)

internal object MobclickAgentOnEventStringFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = ON_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE),
)

internal object MobclickAgentOnEventStringStringFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = ON_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, STRING_TYPE),
)

internal object MobclickAgentOnEventMapFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = ON_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, MAP_TYPE),
)

internal object MobclickAgentOnEventObjectFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = "onEventObject",
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, STRING_TYPE, MAP_TYPE),
)

internal object MobclickAgentOnPageStartFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = "onPageStart",
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object MobclickAgentOnPageEndFingerprint : Fingerprint(
    definingClass = MOBCLICK_AGENT_CLASS,
    name = "onPageEnd",
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

// AppMetrica Fingerprints

internal object AppMetricaActivateFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = "activate",
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, "Lio/appmetrica/analytics/AppMetricaConfig;"),
)

internal object AppMetricaActivateReporterFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = "activateReporter",
    returnType = VOID_RETURN,
    parameters = listOf(CONTEXT_TYPE, "Lio/appmetrica/analytics/ReporterConfig;"),
)

internal object AppMetricaReportEventStringFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = REPORT_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE),
)

internal object AppMetricaReportEventStringStringFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = REPORT_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE),
)

internal object AppMetricaReportEventStringMapFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = REPORT_EVENT_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, MAP_TYPE),
)

internal object AppMetricaReportErrorStringThrowableFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = REPORT_ERROR_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, THROWABLE_TYPE),
)

internal object AppMetricaReportErrorStringStringFingerprint : Fingerprint(
    definingClass = APP_METRICA_CLASS,
    name = REPORT_ERROR_NAME,
    returnType = VOID_RETURN,
    parameters = listOf(STRING_TYPE, STRING_TYPE),
)

// Watchface & Dial Feature Flags

internal object SpMapGetHashAiDialFingerprint : Fingerprint(
    definingClass = SP_MAP_CLASS,
    name = "getHashAiDial",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object SpMapIsCustomDialNewFingerprint : Fingerprint(
    definingClass = SP_MAP_CLASS,
    name = "isCustomDialNew",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)

internal object SpMapIsDialsupportFingerprint : Fingerprint(
    definingClass = SP_MAP_CLASS,
    name = "isDialsupport",
    returnType = BOOLEAN_RETURN,
    parameters = emptyList(),
)
