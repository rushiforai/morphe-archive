"""Version-specific Mediahuis One contracts, independent of patch implementation."""

ADS = "Hide ads"
TRACKING = "Disable tracking"
CONSENT = "Skip consent screens"
PREMIUM = "Hide Premium banner"
NAMES = {ADS, TRACKING, CONSENT, PREMIUM, "Hide newspaper navigation"}
KACHING = "be/mediahuis/kaching/Kaching"
CORE = "be/mediahuis/core/"
SHARED = "com/mediahuis/oneapps/sharedsdk/"
PAGE = "Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/common/PageContext;"
ONBOARDING = ("be/mediahuis/one/ui/BottomNavigationActivity", "setUpNavController()V")
SETTINGS = "Lbe/mediahuis/core/data/datasources/settings/SettingsDataSource;"
DISABLED = "Lbe/mediahuis/kaching/KachingResult$AdsAndTrackingDisabled;"
MENU_SUBSCRIBE = (
    "com/mediahuis/oneapps/cueappsdk/domain/external/remoteconfig/services/RemoteConfigServiceKt",
    "isSubscribeButtonEnabled(Lcom/mediahuis/oneapps/cueappsdk/domain/external/remoteconfig/services/RemoteConfigService;)Z",
)
MENU_BUILDER = (
    "com/mediahuis/oneapps/cueappsdk/ui/features/more/MoreViewModel$combineToStateStream$1",
    "invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;",
)

# (class, exact signature, expected emitted boundary, control)
TARGETS = [
    (KACHING, "requestAd(Lbe/mediahuis/kaching/advertisement/models/AdRequest;Landroid/view/ViewGroup;ZLbe/mediahuis/kaching/advertisement/models/AdHeightConstraint;)Lbe/mediahuis/kaching/KachingResult;", "ad", ADS),
    (KACHING, "getVideoPrerollUrl(Lbe/mediahuis/kaching/preroll/PrerollContext;Lbe/mediahuis/kaching/preroll/VideoRatio;)Lbe/mediahuis/kaching/KachingResult;", "ad", ADS),
    (KACHING, "getAudioPrerollUrl(Lbe/mediahuis/kaching/preroll/PrerollContext;)Lbe/mediahuis/kaching/KachingResult;", "ad", ADS),
    (SHARED + "service/TrackingService", "createPartners(Lcom/mediahuis/oneapps/sharedsdk/core/model/AppInfo;Lcom/mediahuis/oneapps/sharedsdk/core/model/BrandInfo;Lcom/mediahuis/oneapps/sharedsdk/helper/IDeviceInformation;)Ljava/util/List;", "empty", TRACKING),
    (KACHING, "isAdsAndTrackingEnabled()Z", "false", TRACKING),
    (KACHING, "setAdsAndTrackingEnabled(Z)V", "argfalse", TRACKING),
    (KACHING, "trackPage(Ljava/lang/String;)Ljava/lang/String;", "null", TRACKING),
    ("com/google/android/gms/ads/identifier/AdvertisingIdClient", "getAdvertisingIdInfo(Landroid/content/Context;)Lcom/google/android/gms/ads/identifier/AdvertisingIdClient$Info;", "gaid", TRACKING),
    ("com/google/firebase/crashlytics/FirebaseCrashlytics", "setCrashlyticsCollectionEnabled(Z)V", "argfalse", TRACKING),
    ("com/google/firebase/analytics/FirebaseAnalytics", "setAnalyticsCollectionEnabled(Z)V", "argfalse", TRACKING),
    ("com/google/firebase/perf/FirebasePerformance", "setPerformanceCollectionEnabled(Z)V", "argfalse", TRACKING),
    ("com/urbanairship/analytics/Analytics", "setEnabled(Z)V", "argfalse", TRACKING),
    (CORE + "data/repositories/remoteconfig/RemoteConfigRepository", "isPaywallEnabled()Z", "false", PREMIUM),
    (CORE + "data/repositories/remoteconfig/RemoteConfigRepository", "isSubscribeButtonEnabled()Z", "false", PREMIUM),
    (*MENU_SUBSCRIBE, "false", PREMIUM),
]

VOID = {
    KACHING: ["e()V", "g()V", "i()V", "j()V", "setUserIds(Ljava/lang/String;Ljava/util/Map;)V"],
    SHARED + "service/AttentionTimeService": ["sendData(Ljava/lang/String;J)V"],
    SHARED + "service/CxenseSegmentService": ["loadSegments(Lcom/mediahuis/oneapps/sharedsdk/model/core/UserData;)V"],
    SHARED + "service/CxenseUserDataSyncService": ["syncUserData(Lcom/mediahuis/oneapps/sharedsdk/model/core/UserData;)V"],
    SHARED + "service/PromotionMonitoringService": ["track(Ljava/util/List;Lcom/mediahuis/oneapps/sharedsdk/model/promotionmonitoring/PromotionMonitoringSdkContext;Z)V"],
    CORE + "domain/services/tracking/CIMTrackingService": ["trackToCim(" + PAGE + ")V"],
    CORE + "domain/services/tracking/NMOTrackingService": ["trackToNmo(" + PAGE + ")V", "trackEpaperView(Lcom/mediahuis/oneapps/cueappsdk/data/components/models/NmoTrackingData;)V", "trackVideoEvent(" + PAGE + "Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V", "updateTrackingState()V"],
    CORE + "domain/usecases/thirdparties/InitializeThirdPartySdksUseCase": ["initCim()V"],
    CORE + "domain/services/performance/datadog/DatadogService": ["initialize(Ljava/lang/String;)V"],
    "com/google/firebase/crashlytics/FirebaseCrashlytics": ["recordException(Ljava/lang/Throwable;)V", "sendUnsentReports()V"],
    "com/google/firebase/perf/transport/TransportManager": ["syncLog(Lcom/google/firebase/perf/v1/PerfMetric$Builder;Lcom/google/firebase/perf/v1/ApplicationProcessState;)V"],
    "com/google/firebase/messaging/MessagingAnalytics": ["logToFirelog(Lcom/google/firebase/messaging/reporting/MessagingClientEvent$Event;Landroid/content/Intent;Lcom/google/android/datatransport/TransportFactory;)V", "logToScion(Ljava/lang/String;Landroid/os/Bundle;)V", "logNotificationOpen(Landroid/os/Bundle;)V"],
    "com/google/firebase/analytics/FirebaseAnalytics": ["logEvent(Ljava/lang/String;Landroid/os/Bundle;)V", "setUserId(Ljava/lang/String;)V", "setUserProperty(Ljava/lang/String;Ljava/lang/String;)V", "setCurrentScreen(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V", "setDefaultEventParameters(Landroid/os/Bundle;)V"],
    "com/egeniq/agno/agnoplayer/player/stats/MuxStatsTracker": ["init(Lcom/google/android/exoplayer2/ExoPlayer;Landroid/graphics/Point;Landroid/view/View;Ljava/lang/String;Lcom/egeniq/agno/agnoplayer/player/exoplayer/ad/AgnoImaAdsLoader;Lcom/egeniq/agno/agnoplayer/data/model/PlayerItem;)V"],
    "com/egeniq/agno/agnoplayer/data/model/cim/CimTracker": ["onNewAdData(Lcom/gemius/sdk/stream/Player;Lcom/google/ads/interactivemedia/v3/api/Ad;Lcom/egeniq/agno/agnoplayer/data/model/PlayerItem;)V", "onNewProgramData(Lcom/gemius/sdk/stream/Player;Lcom/google/android/exoplayer2/Player;Lcom/egeniq/agno/agnoplayer/data/model/PlayerItem;Lcom/google/android/exoplayer2/trackselection/DefaultTrackSelector;)V", "onNewProgramEvent(Lcom/gemius/sdk/stream/Player;Lcom/egeniq/agno/agnoplayer/data/model/PlayerItem;Lcom/google/android/exoplayer2/Player;Lcom/gemius/sdk/stream/Player$EventType;Ljava/lang/Integer;Ljava/lang/String;)V"],
}
for _cls, _methods in VOID.items():
    TARGETS.extend((_cls, sig, "void", TRACKING) for sig in _methods)

FALSE = {
    "com/google/firebase/crashlytics/internal/common/DataCollectionArbiter": ["isAutomaticDataCollectionEnabled()Z"],
    "com/google/firebase/perf/FirebasePerformance": ["isPerformanceCollectionEnabled()Z"],
    "com/google/firebase/messaging/MessagingAnalytics": ["deliveryMetricsExportToBigQueryEnabled()Z", "shouldUploadFirelogAnalytics(Landroid/content/Intent;)Z", "shouldUploadScionMetrics(Landroid/content/Intent;)Z", "shouldUploadScionMetrics(Landroid/os/Bundle;)Z"],
}
for _cls, _methods in FALSE.items():
    TARGETS.extend((_cls, sig, "false", TRACKING) for sig in _methods)

CONSENT_TARGETS = {
    CORE + "domain/services/consent/ConsentService": ["collectConsentIfNeeded(Landroidx/appcompat/app/AppCompatActivity;)V"],
    CORE + "domain/services/consent/AccountConsentService": ["updateAccountConsentInfo(Ljava/lang/String;Ljava/lang/String;)V"],
    "be/mediahuis/one/domain/usecases/navigation/DefaultNavigateToPayOrOkUseCase": ["execute(Landroidx/navigation/NavController;)V"],
    "be/mediahuis/one/ui/MainActivity": ["showCoachMark()V"],
}
for _cls, _methods in CONSENT_TARGETS.items():
    TARGETS.extend((_cls, sig, "void", CONSENT) for sig in _methods)

META = {
    "firebase_analytics_collection_deactivated": "true",
    "firebase_crashlytics_collection_enabled": "false",
    "firebase_performance_collection_deactivated": "true",
    "delivery_metrics_exported_to_big_query_enabled": "false",
    "com.facebook.sdk.AutoInitEnabled": "false",
    "com.facebook.sdk.AutoLogAppEventsEnabled": "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled": "false",
}
PERMISSIONS = {
    "com.google.android.gms.permission.AD_ID", "android.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID", "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS", "android.permission.ACCESS_ADSERVICES_CUSTOM_AUDIENCE",
    "android.permission.AD_SERVICES_CONFIG",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
}

# Independently inventoried first-party GA dispatchers.
GA_METHODS = ['trackArticleComplete(Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/article/ArticlePageContext;)V', 'trackArticleView(Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/article/ArticlePageContext;Z)V', 'trackEvent(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/tracking/EventContext;Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/common/PageContext;)V', 'trackExternalUrl(Ljava/lang/String;)V', 'trackLoginFail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 'trackLoginSuccess(Ljava/lang/String;Ljava/lang/String;)V', 'trackLogoutClick(Ljava/lang/String;Ljava/lang/String;)V', 'trackMediaAd(Lbe/mediahuis/core/domain/services/tracking/GoogleAnalyticsTrackingService$MediaEventWrapper;Ljava/lang/String;)V', 'trackMediaComplete(Lbe/mediahuis/core/domain/services/tracking/GoogleAnalyticsTrackingService$MediaEventWrapper;)V', 'trackMediaContentPlay(Lbe/mediahuis/core/domain/services/tracking/GoogleAnalyticsTrackingService$MediaEventWrapper;)V', 'trackMediaProgress(Lbe/mediahuis/core/domain/services/tracking/GoogleAnalyticsTrackingService$MediaEventWrapper;I)V', 'trackMediaUniquePlay(Lbe/mediahuis/core/domain/services/tracking/GoogleAnalyticsTrackingService$MediaEventWrapper;)V', 'trackNavigationClick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 'trackOnboardingClickEvent(Lcom/mediahuis/oneapps/cueappsdk/toclean/articles/tracking/EventContext;Z)V', 'trackOnboardingView(Z)V', 'trackOptinPush(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 'trackRegisterFail(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 'trackRegisterSuccess(Ljava/lang/String;Ljava/lang/String;)V', 'trackSearchResults(ILjava/lang/String;)V', 'trackServiceClick(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V', 'trackSettingsClick(Ljava/lang/String;Ljava/lang/Boolean;Ljava/lang/String;)V', 'trackShare(Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/article/ArticlePageContext;)V', 'trackSubscriptionPurchaseFailed(Ljava/lang/String;)V', 'trackSubscriptionPurchaseSuccess(Ljava/lang/String;Lbe/mediahuis/core/domain/services/subscriptions/BillingService$ValidatedReceipt;)V', 'trackSubscriptionWelcomePopupClose(Ljava/lang/String;Ljava/lang/String;)V', 'trackSubscriptionWelcomePopupDiscoverMoreClick(Ljava/lang/String;)V', 'trackSubscriptionWelcomePopupLoadedView(Ljava/lang/String;Ljava/lang/String;Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/common/PageContext;)V', 'trackView(Lcom/mediahuis/oneapps/cueappsdk/domain/external/pages/models/common/PageContext;)V', 'trackView(Ljava/lang/String;)V', 'trackView(Ljava/lang/String;Ljava/util/Map;)V', 'updateUserConsent(Ljava/util/List;Ljava/util/List;)V', 'updateUserStateProperties(ZLjava/lang/Integer;Ljava/lang/String;Lbe/mediahuis/core/data/models/authentication/UserProfile;)V']
TARGETS.extend((CORE + "domain/services/tracking/GoogleAnalyticsTrackingService", sig, "void", TRACKING) for sig in GA_METHODS)

# Prevent creation/context initialization of the separate video Gemius player.
TARGETS.append(("com/egeniq/agno/agnoplayer/player/exoplayer/AgnoExoMediaPlayer", "configureCim()V", "void", TRACKING))
TARGETS.append(("com/egeniq/agno/agnoplayer/player/exoplayer/AgnoExoMediaPlayer", "configureAgnoplayDataPlugin(Lcom/egeniq/agno/agnoplayer/data/model/PlayerItem;)V", "void", TRACKING))
