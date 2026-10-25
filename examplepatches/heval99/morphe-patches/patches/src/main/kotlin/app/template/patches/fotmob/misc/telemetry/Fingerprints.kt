package app.template.patches.fotmob.misc.telemetry

import app.morphe.patcher.Fingerprint

// The "firebase_analytics_collection_deactivated" read fingerprint is shared with Sofascore:
// shared/misc/telemetry/FirebaseAnalyticsDeactivated.kt (jrg.L()Z in 239).

// Firebase Analytics: every app event funnels through the Google Measurement SDK entry point
// AppMeasurementSdk.logEvent(String, String, Bundle), a public library API R8 keeps by name
// (one overload, with code, in 239).
internal object GmsMeasurementLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;",
    name = "logEvent",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;", "Landroid/os/Bundle;"),
)
