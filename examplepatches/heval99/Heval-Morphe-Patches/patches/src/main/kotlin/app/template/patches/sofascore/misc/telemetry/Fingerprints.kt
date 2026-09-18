package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.Fingerprint

// AppsFlyer: the public AppsFlyerLib class only declares abstract overloads and the
// concrete implementation lives in an R8-renamed internal class, so anchor on any
// subclass of AppsFlyerLib that implements the full logEvent overload. The implementation
// check matters: matching an abstract declaration would make returnEarly() crash.
object AppsFlyerLogEventFingerprint : Fingerprint(
    name = "logEvent",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/util/Map;",
        "Lcom/appsflyer/share/attribution/AppsFlyerRequestListener;",
    ),
    custom = { method, classDef ->
        classDef.superclass == "Lcom/appsflyer/AppsFlyerLib;" && method.implementation != null
    },
)

// Firebase Analytics: in this build FirebaseAnalytics no longer declares logEvent, so
// every event funnels through the underlying Google Measurement SDK entry point.
object GmsMeasurementLogEventFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;",
    name = "logEvent",
)
