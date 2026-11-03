package app.template.patches.viaplay.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

// Viaplay is heavily R8-obfuscated: its own code and most of Firebase land in short top-level
// classes whose names rotate every release. The anchors below use only stable strings, kept
// library classes (com.npaw.*, com.nielsen.*), the kept com.viaplay.tracking model classes and
// method shape.

internal const val VP_TRACKING_EVENT = "Lcom/viaplay/tracking/data/VPTrackingEvent;"
internal const val VP_BASE_DATA = "Lcom/viaplay/tracking/network/model/BaseData;"

// Crashlytics: DataCollectionArbiter.isAutomaticDataCollectionEnabled() (obfuscated here), the
// gate every crash report upload asks first. It is the only ()Z method that builds the
// "Crashlytics automatic data collection ..." log line naming the manifest flag.
internal object CrashlyticsDataCollectionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(
        "Crashlytics automatic data collection ",
        "firebase_crashlytics_collection_enabled manifest flag",
    ),
)

// Firebase Performance: ConfigResolver.isPerformanceMonitoringEnabled() (obfuscated here), which
// reads the "fpr_enabled" remote flag and caches it as "com.google.firebase.perf.SdkEnabled".
// It is consulted before any trace, network metric or session gauge is collected or sent.
internal object PerformanceMonitoringEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("fpr_enabled", "com.google.firebase.perf.SdkEnabled"),
)

// NPAW (Youbora): the application initializer that names the app "Viaplay Android Mobile" in the
// AnalyticsOptions and then calls NpawPluginProvider.initialize. It is the only caller of
// NpawPluginProvider.initialize, and every reader of NpawPluginProvider.getInstance() (the player
// adapter, the Cast receiver, the error reporter) null-checks the plugin.
internal object NpawInitializeFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Viaplay Android Mobile"),
    filters = listOf(
        methodCall(definingClass = "Lcom/npaw/core/options/AnalyticsOptions;", name = "setAppName"),
        methodCall(definingClass = "Lcom/npaw/NpawPluginProvider;"),
    ),
)

// Nielsen: the wrapper that constructs com.nielsen.app.sdk.AppSdk(Context, JSONObject,
// IAppNotifier) and stores it in its AppSdk field, with "Failed to initialize Nielsen SDK" in its
// catch block. Every other use of that field (play, playhead, stop, end, opt-out, metadata)
// null-checks it, and the next player session just tries to initialise again.
internal object NielsenInitializeFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("Failed to initialize Nielsen SDK"),
    filters = listOf(
        methodCall(definingClass = "Lcom/nielsen/app/sdk/AppSdk;", name = "<init>"),
    ),
)

// Cronos, Viaplay's own event tracker (cronos-events.viaplay.com): the static, non-suspend
// dispatcher (VPTrackingEvent, BaseData, List)V. For every Cronos sender registered for the event
// it launches a fire-and-forget coroutine that opens the Cronos session and posts the event;
// its callers (the event queue and its flush) do not use any result.
internal object CronosDispatchFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC),
    returnType = "V",
    parameters = listOf(VP_TRACKING_EVENT, VP_BASE_DATA, "Ljava/util/List;"),
    filters = listOf(
        methodCall(definingClass = VP_TRACKING_EVENT, name = "getEventName"),
    ),
)
