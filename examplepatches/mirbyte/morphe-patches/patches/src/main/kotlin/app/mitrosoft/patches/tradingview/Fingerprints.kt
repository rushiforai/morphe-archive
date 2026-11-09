package app.mitrosoft.patches.tradingview

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * GoProBannersInteractorImpl.getProfileBanner: profile menu upsell banner ("Supercharge your trading").
 * Callers: MenuProfileInteractorImpl.profileBannerFlow.
 */
object GetProfileBannerFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/gopro/impl/core/interactor/GoProBannersInteractorImpl;",
    name = "getProfileBanner",
    accessFlags = listOf(AccessFlags.PUBLIC),
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/Continuation;"),
)

object ShowGoProAdFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/ads/api/view/AdvertisementContainerView;",
    name = "showGoProAd",
    isStatic = false,
    returnType = "V",
    parameters = listOf(),
)

object AreAdsAvailableFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/ads/impl/entity/AdsInitializationEntity;",
    name = "areAdsAvailable",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Z",
        "Lcom/tradingview/tradingviewapp/feature/ads/api/model/toggle/AdsConfigToggleInfo;",
        "J",
        "J",
    ),
)

object ProPlanDefineFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/profile/api/plan/ProPlan\$Companion;",
    name = "define",
    isStatic = false,
    returnType = "Lcom/tradingview/tradingviewapp/feature/profile/api/plan/ProPlan;",
    parameters = listOf("Ljava/lang/String;"),
)

object ToPlanStateFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/profile/impl/interactor/UserStateInteractorImplKt;",
    name = "toPlanState",
    isStatic = true,
    returnType = "Lcom/tradingview/tradingviewapp/feature/profile/api/plan/UserPlanState;",
    parameters = listOf("Lcom/tradingview/tradingviewapp/feature/profile/api/user/CurrentUser;"),
)

object GetUserBadgeTypeFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/profile/api/user/CurrentUser;",
    name = "getUserBadgeType",
    isStatic = false,
    returnType = "Lcom/tradingview/tradingviewapp/feature/profile/model/user/UserBadgeType;",
    parameters = listOf(),
)

object MarketUIBlockFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/market/module/feed/model/ui/MarketUIBlockBuilderKt;",
    name = "block",
    isStatic = true,
    returnType = "Ljava/util/List;",
    parameters = listOf("Lcom/tradingview/tradingviewapp/feature/market/module/feed/model/ui/MarketBrokersState;"),
)

object BrokersIsFeatureEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/brokers/list/impl/shared/interactor/BrokersToggleInteractorImpl;",
    name = "isFeatureEnabled",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(),
)

object BrokersShouldShowHaveAccountFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/brokers/list/impl/shared/interactor/BrokersToggleInteractorImpl;",
    name = "shouldShowBrokersHaveAccount",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(),
)

object BrokersWasBannerClosedFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/brokers/list/impl/shared/BrokersListPreferenceManagerImpl;",
    name = "wasBannerClosed",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(),
)

object TradingButtonBindTradingStateFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/sheet/more/view/TradingButtonView;",
    name = "bindTradingState",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/tradingview/tradingviewapp/feature/chart/model/TradingButtonState;"),
)

object ChartNativePanelButtonIsVisibleFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/chart/impl/module/chart/presenter/nativepanel/ChartNativePanelPresentationButtonItem;",
    name = "isVisible",
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf(),
)

object AnalyticsServiceSendEventFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "sendEvent",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Lcom/tradingview/tradingviewapp/feature/analytics/api/base/AnalyticSendEvent;",
        "Ljava/util/Map;",
    ),
)

object AnalyticsServiceSetUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "setUserId",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object AnalyticsServiceSetUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "setUserProperty",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object AnalyticsServiceStartTraceFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "startTrace",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object AnalyticsServiceStopTraceFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "stopTrace",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object AnalyticsServiceStartTrackScreenFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "startTrackScreen",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object AnalyticsServiceStopTrackScreenFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/AnalyticsServiceImpl;",
    name = "stopTrackScreen",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object SnowPlowServiceLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "logEvent",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/util/Map;", "Ljava/lang/String;"),
)

object SnowPlowServiceLogGeneralEventFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "logGeneralEvent",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
    ),
)

object SnowPlowServiceConfigureFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "configureSnowPlow",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Z"),
)

object SnowPlowServiceSetUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "setUserId",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object SnowPlowServiceSetDomainUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "setDomainUserId",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object SnowPlowServiceSetLanguageFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/SnowPlowAnalyticsServiceImpl;",
    name = "setLanguage",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object SnowPlowTrackerTrackFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/snowplow/SnowPlowTrackerImpl;",
    name = "track",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/snowplowanalytics/snowplow/event/SelfDescribing;"),
)

object SnowPlowTrackerConfigureFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/snowplow/SnowPlowTrackerImpl;",
    name = "configureSnowPlow",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Z"),
)

object FirebaseLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "logEvent",
    isStatic = false,
    returnType = "V",
    parameters = listOf(
        "Lcom/tradingview/tradingviewapp/feature/analytics/api/base/AnalyticSendEvent;",
        "Ljava/util/Map;",
    ),
)

object FirebaseSetUserIdFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "setUserId",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object FirebaseSetUserPropertyFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "setUserProperty",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object FirebaseStartTraceFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "startTrace",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object FirebaseStopTraceFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "stopTrace",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

object FirebaseStartTrackScreenFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/firebase/FirebaseAnalyticsWrapper;",
    name = "startTrackScreen",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object FunnelServiceTrackFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/FunnelServiceImpl;",
    name = "track",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
)

object FunnelServiceAddFunnelFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/FunnelServiceImpl;",
    name = "addFunnel",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Lcom/tradingview/tradingviewapp/feature/analytics/api/funnel/Funnel;"),
)

object ScreenTimeAddSpentTimeFingerprint : Fingerprint(
    definingClass = "Lcom/tradingview/tradingviewapp/feature/analytics/impl/services/ScreenTimeTrackingServiceImpl;",
    name = "addSpentTimeForSession",
    isStatic = false,
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "J"),
)
