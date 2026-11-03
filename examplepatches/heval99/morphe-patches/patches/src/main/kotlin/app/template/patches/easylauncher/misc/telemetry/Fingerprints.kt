package app.template.patches.easylauncher.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The app's analytics base class (kept). Firebase, Braze, Singular, Rudderstack, the
// "sad retained" set-as-default tracker and two debug services all extend it, and the analytics
// dispatcher fans every event out to them.
internal const val ANALYTICS_SERVICE = "Lcom/eet/core/analytics/AnalyticsService;"

// The methods that send data. getAppInstanceId, generateUserId, isTestLabDevice and getName
// return values other code relies on and are left alone.
internal val ANALYTICS_SEND_METHODS = setOf(
    "logEvent",
    "logException",
    "setUserId",
    "setUserProperties",
    "setUserProperty",
    "setCustomKey",
    "dropBreadcrumb",
    "sendScreenshot",
)

// Singular's public API class (kept by the SDK's consumer rules).
internal const val SINGULAR = "Lcom/singular/sdk/Singular;"
internal val SINGULAR_INIT_OVERLOADS = setOf(
    listOf("Landroid/content/Context;", "Lcom/singular/sdk/SingularConfig;"),
    listOf("Landroid/content/Context;", "Ljava/lang/String;", "Ljava/lang/String;"),
)

// RudderstackAnalyticsService(Application): reads the write key from resources and only builds
// the Rudderstack client when the key is not empty.
internal object RudderstackConstructorFingerprint : Fingerprint(
    definingClass = "Lcom/eet/service/rudderstack/analytics/RudderstackAnalyticsService;",
    name = "<init>",
    filters = listOf(string("init: failed to initialize Rudderstack", StringComparisonType.STARTS_WITH)),
)

// BrazePushService.initialize(Context, Continuation): enqueues BrazeInitWorker, which starts the
// Braze SDK. FCM delivery (com.eet.core.push) does not depend on it.
internal object BrazePushInitializeFingerprint : Fingerprint(
    definingClass = "Lcom/eet/service/braze/push/BrazePushService;",
    name = "initialize",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;", "Lkotlin/coroutines/Continuation;"),
)

internal object FirebaseSetCrashCollectionEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/eet/core/analytics/service/firebase/FirebaseAnalyticsService;",
    name = "setCrashCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)
