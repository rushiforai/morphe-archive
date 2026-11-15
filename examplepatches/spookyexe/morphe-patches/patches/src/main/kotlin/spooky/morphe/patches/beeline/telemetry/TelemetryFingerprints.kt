package spooky.morphe.patches.beeline.telemetry

import app.morphe.patcher.Fingerprint
import com.android.tools.smali.dexlib2.AccessFlags

// ─────────────────────────────────────────────────────────────────────────────
// Fingerprints for Beeline telemetry disable patch.
// All targets are void methods that dispatch/log telemetry events.
// Validated against 4.2.8704 (xapk).
// ─────────────────────────────────────────────────────────────────────────────

/**
 * Segment Analytics — `wc.c(Event)` is the central dispatch for all Segment
 * events (track, screen, identify, group, alias). Called from e09, yz8 and dx8.
 * Making this a no-op stops all Segment telemetry from leaving the device.
 */
object SegmentAnalyticsDispatchFingerprint : Fingerprint(
    definingClass = "/wc;",
    name = "c",
    returnType = "V",
    parameters = listOf("Lcom/segment/analytics/kotlin/core/a;"),
)

/**
 * Firebase Analytics — `logEvent(String, Bundle)`. Patching this stops Firebase
 * Analytics event logging. The FirebaseAnalytics instance is cached in f49.f
 * and used across the app, so patching the SDK method covers all call sites.
 */
object FirebaseAnalyticsLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/analytics/FirebaseAnalytics;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Landroid/os/Bundle;"),
)

/**
 * Firebase Crashlytics — `log(String)`. Patching this stops Crashlytics log
 * messages from being included in crash reports.
 */
object FirebaseCrashlyticsLogFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "log",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;"),
)

/**
 * Firebase Crashlytics — `recordException(Throwable)`. Patching this stops
 * caught exceptions from being reported to Crashlytics.
 */
object FirebaseCrashlyticsRecordExceptionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "recordException",
    returnType = "V",
    parameters = listOf("Ljava/lang/Throwable;"),
)
