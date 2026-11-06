// Ported from Jl4cTuk/morphe-patches (GPLv3), app/template/patches/all/analytics/Fingerprints.kt.
package app.privacy.patches.analytics.jl4ctuk

import app.morphe.patcher.Fingerprint

object FirebaseCrashlyticsCollectionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)

// Firebase ships a SECOND, separate public overload taking a boxed, nullable
// Kotlin `Boolean?` (confirmed live via dexdump on the shipped com.avito.android
// and ru.sberbankmobile artifacts, 2026-10-09: `setCrashlyticsCollectionEnabled
// (Ljava/lang/Boolean;)V`, PUBLIC, forwarding unconditionally to the same
// internal arbiter setter the (Z) overload calls). It is NOT a bridge/synthetic
// method and has an independent method_id - disabling only the (Z) overload
// above leaves this one fully callable, letting any code path re-enable
// collection without ever touching the overload this patch neutralizes.
object FirebaseCrashlyticsCollectionBoxedFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "setCrashlyticsCollectionEnabled",
    returnType = "V",
    parameters = listOf("Ljava/lang/Boolean;"),
)

// Firebase's own public docs confirm sendUnsentReports() is the *documented, supported*
// bypass of a disabled collection flag: "Use sendUnsentReports to upload existing reports
// even when automatic data collection is disabled." Any app code path that calls it would
// flush locally-buffered crash data (which can carry recordException/setCustomKey/setUserId/
// log content attached to the report) to Firebase regardless of the collection-enabled gate
// this patch forces off elsewhere. Disabling the setter alone does not close this path.
object FirebaseCrashlyticsSendUnsentReportsFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
    name = "sendUnsentReports",
    returnType = "V",
    parameters = emptyList(),
)

object FirebasePerformanceCollectionFingerprint : Fingerprint(
    definingClass = "Lcom/google/firebase/perf/FirebasePerformance;",
    name = "setPerformanceCollectionEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)
