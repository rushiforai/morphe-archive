package app.template.patches.forzafootball.misc.telemetry

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.StringComparisonType
import app.morphe.patcher.string

// The app's androidx.startup Sentry initializer (kept: the manifest names it). Sentry's own
// auto-init provider is switched off in the manifest (io.sentry.auto-init=false), so this is the
// only place Sentry starts.
internal object SentryInitializerCreateFingerprint : Fingerprint(
    definingClass = "Lcom/forzafootball/SentryInitializer;",
    name = "create",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Landroid/content/Context;"),
)

// Crashlytics' DataCollectionArbiter logger (6.15.10: mv2.c(Z)V, in a class R8 merged with an
// unrelated data class). It logs where the collection setting came from; the arbiter's
// synchronized isAutomaticDataCollectionEnabled()Z (mv2.b) is the class's ()Z method calling it.
internal object CrashlyticsArbiterLogFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Z"),
    filters = listOf(string("firebase_crashlytics_collection_enabled manifest flag", StringComparisonType.STARTS_WITH)),
)
