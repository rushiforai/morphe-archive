package app.template.patches.example

import app.morphe.patcher.Fingerprint

// The Yahoo Finance ad layer is NOT obfuscated, so we match each method by its
// exact defining class + method name (via the `custom` predicate), plus return
// type and parameters. This is far more robust than instruction fingerprints and
// survives app updates as long as Yahoo keeps these class/method names.

// AdFetcher.getNextAd(int) -> YFAdUnit : the provider of stream/feed ads
// (Home, News, QSP). Returning an EmptyAdUnit means no ad is ever fetched.
object GetNextAdFingerprint : Fingerprint(
    returnType = "Lcom/yahoo/mobile/client/android/finance/ads/model/YFAdUnit;",
    parameters = listOf("I"),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/ads/AdFetcher;" &&
            method.name == "getNextAd"
    },
)

// PencilAdDelegate.canAdBeShown() -> boolean : the Home top "pencil" banner gate.
object PencilAdCanBeShownFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/home/ad/PencilAdDelegate;" &&
            method.name == "canAdBeShown"
    },
)

// MarketsTopCenterAdDelegate.canAdBeShown() -> boolean : the Markets top ad gate.
object MarketsAdCanBeShownFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/markets/ad/MarketsTopCenterAdDelegate;" &&
            method.name == "canAdBeShown"
    },
)

// Markets screen ad module (Stocks/Crypto/ETF/... tabs). areAdsHidden() normally
// checks the AdsFree subscription feature; forcing it true makes the module take
// the app's own "ad-free user" path — it skips the network fetch AND renders no
// container (no empty placeholder box).
object MarketsAreAdsHiddenFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/markets/ad/MarketsTopCenterAdModule;" &&
            method.name == "areAdsHidden"
    },
)

// Quote (symbol detail) page top banner. TopCenterAdModule.buildRowViewModel(...)
// builds the banner row; it already returns null as its "no ad" path (the isHidden
// branch), so returning null removes the banner and the ad is never fetched.
object TopCenterAdBuildRowFingerprint : Fingerprint(
    returnType = "Lcom/yahoo/mobile/client/android/finance/core/app/model/RowViewModel;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/yahoo/mobile/client/android/finance/quote/model/QspViewData;",
    ),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/quote/model/TopCenterAdModule;" &&
            method.name == "buildRowViewModel"
    },
)

// Quote page pencil / native ad (Summary, Analysis and Financials tabs).
// BasePencilAdModule.buildRowViewModel(...) builds the pencil ad row with the same
// null semantics; PencilAdSummary/Analysis/Financials all inherit this method.
object PencilAdBuildRowFingerprint : Fingerprint(
    returnType = "Lcom/yahoo/mobile/client/android/finance/core/app/model/RowViewModel;",
    parameters = listOf(
        "Landroid/content/Context;",
        "Lcom/yahoo/mobile/client/android/finance/quote/model/QspViewData;",
    ),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/quote/model/BasePencilAdModule;" &&
            method.name == "buildRowViewModel"
    },
)

// ---- Tracking / telemetry (separate "Block tracking" patch) ----

// comScore audience measurement: no-op SDK startup.
object ComscoreStartFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/comscore/Analytics;" && method.name == "start"
    },
)

// AppsFlyer install/attribution tracking: no-op the app's init wrapper.
object AppsFlyerInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/appsflyer/AppsFlyerManager;" &&
            method.name == "initialize"
    },
)

// Embrace session/perf telemetry: no-op both start() overloads (isStarted stays
// false, so all later Embrace calls become no-ops).
object EmbraceStartFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { method, classDef ->
        classDef.type == "Lio/embrace/android/embracesdk/Embrace;" && method.name == "start"
    },
)

object EmbraceStartWithFrameworkFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Lio/embrace/android/embracesdk/AppFramework;"),
    custom = { method, classDef ->
        classDef.type == "Lio/embrace/android/embracesdk/Embrace;" && method.name == "start"
    },
)

// Yahoo's own analytics bridge: drop every logged event.
object YAnalyticsLogEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Lcom/yahoo/mobile/yanalytics/common/event/b;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/analytics/YAnalyticsLoggerImpl;" &&
            method.name == "logEvent"
    },
)

// ---- Nags (separate "Remove nags" patch) ----

// "Rate this app" prompt: askForRateOrSentiment decides whether to show it.
object AppRateAskFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(
        "Landroid/content/Context;",
        "J",
        "Lcom/yahoo/mobile/client/android/finance/analytics/data/TrackingData;",
    ),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/feedback/rating/AppRateManager;" &&
            method.name == "askForRateOrSentiment"
    },
)

// Feed "subscribe to Premium" upsell notification: suspend invoke() returns a
// nullable UpsellNotificationParams. Returning null suppresses the card.
object UpsellNotificationFetchFingerprint : Fingerprint(
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkotlin/coroutines/e;"),
    custom = { method, classDef ->
        classDef.type == "Lcom/yahoo/mobile/client/android/finance/activityfeed/usecase/FetchUpsellNotificationUseCase;" &&
            method.name == "invoke"
    },
)
