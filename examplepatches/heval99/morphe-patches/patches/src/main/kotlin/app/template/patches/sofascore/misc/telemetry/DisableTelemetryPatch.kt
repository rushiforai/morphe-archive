package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated

// The concrete AppsFlyer implementation (AFa1tSDK in 26.10.12) subclasses the public
// AppsFlyerLib, which only declares abstract methods. These are the entry points that send
// data; the push APIs (sendPushNotificationData, ...) are left alone.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// FirebaseCrashlytics is R8-renamed in this build (the public class no longer exists),
// so it is located at patch time by the SharedPreferences key its settings class uses.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

/**
 * A fingerprint can match an abstract declaration (the AppsFlyer SDK ships one per
 * logEvent overload); calling returnEarly() on a method without a body crashes the
 * patcher, so only patch methods that actually have an implementation.
 */
private fun MutableMethod?.returnEarlyIfImplemented() =
    this?.takeIf { it.implementation != null }?.returnEarly()

// forceAnalyticsDeactivated() lives in shared/misc/telemetry/FirebaseAnalyticsDeactivated.kt
// (shared with FotMob, 2026-10-22).

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        // 1. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue (the
        // Flashscore patch's approach), so the SDK never starts sending.
        var appsFlyerStart = 0
        classDefForEach { classDef ->
            if (classDef.superclass != APPSFLYER_LIB) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    if (it.name == "start") appsFlyerStart++
                    it.returnEarly()
                }
        }
        if (appsFlyerStart == 0) throw PatchException("No AppsFlyerLib implementation of start() found")

        // 2. Firebase Analytics: the manifest switch "firebase_analytics_collection_deactivated"
        // reads as true (see forceAnalyticsDeactivated), and every remaining app event funnels
        // through the Google Measurement SDK entry point.
        forceAnalyticsDeactivated()
        GmsMeasurementLogEventFingerprint.method.returnEarlyIfImplemented()

        // 3. Crashlytics: two classes reference the collection-enabled pref key - the
        // settings holder (boolean getter that decides whether anything is collected)
        // and the FirebaseCrashlytics instance itself (log/recordException methods).
        // Disable collection and neuter the non-fatal reporting entry points.
        for (classDef in classDefByStrings(CRASHLYTICS_COLLECTION_KEY)) {
            val crashlytics = mutableClassDefBy(classDef)
            crashlytics.methods
                .filter { it.implementation != null }
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .forEach { it.returnEarly(false) }
            crashlytics.methods
                .filter { it.implementation != null }
                .filter {
                    it.returnType == "V" &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes.first().toString() == "Ljava/lang/Throwable;"
                }
                .forEach { it.returnEarly() }
        }

        // 4. Sofascore NATS analytics: the app's own first-party event sender (every analytics
        // event, enriched with user_id, analytics_user_id, the account id, the advertising id,
        // device info and geo) returns at once. It is only the event entry point; the NATS
        // client and the live-update connection are not touched.
        SofascoreAnalyticsEventFingerprint.method.apply {
            if (implementation == null) throw PatchException("Sofascore analytics sender has no body")
            returnEarly()
        }

        // 5. Firebase Performance off: ConfigResolver.isPerformanceMonitoringEnabled() returns
        // false, so no traces or network metrics are collected or sent.
        PerformanceMonitoringEnabledFingerprint.method.apply {
            if (implementation == null) throw PatchException("isPerformanceMonitoringEnabled has no body")
            returnEarly(false)
        }
    }
}
