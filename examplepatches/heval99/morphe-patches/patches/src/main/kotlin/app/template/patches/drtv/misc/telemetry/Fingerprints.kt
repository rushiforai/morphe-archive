package app.template.patches.drtv.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

// DRTV is built on the Massive Axis SDK (axis.android.sdk.*) and R8 keeps its class and member
// names, as it keeps the Firebase ones here. The anchors below pair those kept names with a
// string or call that is unique to the method, so a rename still fails loudly.

internal const val NPAW_ANALYTICS_OPTIONS = "Lcom/npaw/core/options/AnalyticsOptions;"

// Crashlytics: DataCollectionArbiter.isAutomaticDataCollectionEnabled(), the gate every crash
// report upload and install-id refresh asks first.
internal object CrashlyticsDataCollectionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/internal/common/DataCollectionArbiter;",
    name = "isAutomaticDataCollectionEnabled",
    returnType = "Z",
    parameters = listOf(),
)

// Firebase Performance: ConfigResolver.isPerformanceMonitoringEnabled(), consulted before any
// trace, network metric or session gauge is collected or sent.
internal object PerformanceMonitoringEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/perf/config/ConfigResolver;",
    name = "isPerformanceMonitoringEnabled",
    returnType = "Z",
    parameters = listOf(),
)

// Segment: SegmentAnalyticsProvider.initializeSegmentSDK(ConfigModel) builds the Segment client
// from the config's "writeKey" and stores it in the provider's analytics field. Every app
// analytics event (page views, clicks, player events) goes through that client, and every reader
// of the field null-checks it.
internal object SegmentInitializeFingerprint : Fingerprint(
    definingClass = "Laxis/android/sdk/client/analytics/SegmentAnalyticsProvider;",
    name = "initializeSegmentSDK",
    returnType = "V",
    parameters = listOf("Laxis/android/sdk/client/config/ConfigModel;"),
    strings = listOf("writeKey"),
)

// Nielsen: NielsenUtilManager.initNielsen(Context, appId, appName, versionName, isDebug,
// enableFPid) logs its config under the "Nielsen_AppSDK" tag and creates the NielsenUtil that the
// VOD and live trackers use. The VOD tracker is only added when it exists, and live tracking only
// starts when it was handed over.
internal object NielsenInitFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Z",
        "Z",
    ),
    strings = listOf("Nielsen_AppSDK"),
)

// NPAW (Youbora) quality-of-experience analytics: FeatureFlagRepository's ()Z reader of the
// "npawEnabled" feature flag. QoEPluginManager reads it once and only builds the player adapter
// (the part that reports playback sessions) when it is true.
internal object NpawFeatureFlagFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf("npawEnabled"),
)

// NPAW: QualityOfExperienceUtilsKt.initializeNpaw(...) builds the AnalyticsOptions, calls
// setEnabled(true) and initialises the NpawPlugin singleton the player module provides.
internal object NpawInitializeFingerprint : Fingerprint(
    returnType = "Lcom/npaw/NpawPlugin;",
    strings = listOf("accountCode"),
    filters = listOf(
        methodCall(definingClass = NPAW_ANALYTICS_OPTIONS, name = "setEnabled"),
    ),
)
