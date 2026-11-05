package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The "firebase_analytics_collection_deactivated" read fingerprint lives in
// shared/misc/telemetry/FirebaseAnalyticsDeactivated.kt (shared with FotMob, 2026-10-22).

// Firebase Analytics: in this build FirebaseAnalytics no longer declares logEvent, so
// every event funnels through the underlying Google Measurement SDK entry point.
object GmsMeasurementLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;",
    name = "logEvent",
)

// Sofascore's own first-party analytics sender (b9e.c in 26.10.12): every app analytics event
// goes through this (String eventName, FirebaseBundle)V method, which stamps the bundle with
// "event_timestamp" / "event_date" and hands it to a coroutine that adds user_id,
// analytics_user_id, the account id, the advertising id, device info and geo and publishes it.
// FirebaseBundle is an unobfuscated app model, and the two keys appear together nowhere else.
// The method never touches the NATS client or the live-update connection itself.
object SofascoreAnalyticsEventFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Lcom/sofascore/model/FirebaseBundle;"),
    strings = listOf(
        string("event_date", StringComparisonType.CONTAINS),
        string("event_timestamp", StringComparisonType.CONTAINS),
    ),
)

// Firebase In-App Messaging: DataCollectionHelper.isAutomaticDataCollectionEnabled() (R8-renamed,
// p5d.T in 26.10.19, a merged class), which FIAM asks before it fetches campaigns and before it
// logs impressions. It is the only no-arg boolean reading both the manifest key
// "firebase_inapp_messaging_auto_data_collection_enabled" and the "auto_init" preference.
object InAppMessagingDataCollectionFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(
        string("firebase_inapp_messaging_auto_data_collection_enabled", StringComparisonType.EQUALS),
        string("auto_init", StringComparisonType.EQUALS),
    ),
)

// androidx.startup: the EmojiCompat Initializer (an InitializationProvider meta-data entry, so the
// class name is kept). create(Context) asks the package manager for the downloadable emoji font
// provider at start-up and loads the font on a background thread after the first activity resumes.
internal const val EMOJI_COMPAT_INITIALIZER = "Landroidx/emoji2/text/EmojiCompatInitializer;"

// Firebase Performance: ConfigResolver.isPerformanceMonitoringEnabled() (R8-renamed, vp3.o in
// 26.10.12), the gate both the transport and FirebasePerformance consult before collecting or
// sending a trace. It is the only no-arg boolean that reads the "fpr_enabled" and
// "fpr_disabled_android_versions" remote-config keys and caches "com.google.firebase.perf.SdkEnabled".
object PerformanceMonitoringEnabledFingerprint : Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    strings = listOf(
        string("fpr_enabled", StringComparisonType.CONTAINS),
        string("fpr_disabled_android_versions", StringComparisonType.CONTAINS),
        string("com.google.firebase.perf.SdkEnabled", StringComparisonType.CONTAINS),
    ),
)
