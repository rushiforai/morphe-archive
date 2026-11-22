package app.finni.patches.telegraph.analytics

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

/** ApplicationLoader.onCreate (obfuscated class) calls AppMetrica.activate(Context, AppMetricaConfig). */
internal object AppMetricaActivateFingerprint : Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lio/appmetrica/analytics/AppMetrica;",
            name = "activate",
            parameters = listOf("Landroid/content/Context;", "Lio/appmetrica/analytics/AppMetricaConfig;"),
        ),
    ),
)
