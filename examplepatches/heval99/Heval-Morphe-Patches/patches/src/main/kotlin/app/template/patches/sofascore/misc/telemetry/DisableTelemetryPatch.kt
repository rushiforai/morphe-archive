package app.template.patches.sofascore.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated

// The concrete AppsFlyer implementation (AFa1tSDK in 26.10.12) subclasses the public
// AppsFlyerLib, which only declares abstract methods. These are the entry points that send
// data; the push APIs (sendPushNotificationData, ...) are left alone.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// FirebaseCrashlytics is R8-renamed in this build (the public class no longer exists),
// so it is located at patch time by the SharedPreferences key its settings class uses.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

// Firebase Analytics: in this build FirebaseAnalytics no longer declares logEvent, so every event
// funnels through the underlying Google Measurement SDK entry point (a stable library class).
private const val GMS_MEASUREMENT_SDK = "Lcom/google/android/gms/measurement/api/AppMeasurementSdk;"

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
        val appsFlyerPatched = mutableMapOf<String, Int>()
        classDefForEach { classDef ->
            if (classDef.superclass != APPSFLYER_LIB) return@classDefForEach
            mutableClassDefBy(classDef).methods
                .filter { it.name in APPSFLYER_METHODS && it.returnType == "V" && it.implementation != null }
                .forEach {
                    appsFlyerPatched.merge(it.name, 1, Int::plus)
                    it.returnEarly()
                }
        }
        APPSFLYER_METHODS.forEach { name ->
            if ((appsFlyerPatched[name] ?: 0) == 0) throw PatchException("No AppsFlyerLib implementation of $name() found")
        }

        // 2. Firebase Analytics: the manifest switch "firebase_analytics_collection_deactivated"
        // reads as true (see forceAnalyticsDeactivated), and every remaining app event funnels
        // through the Google Measurement SDK entry point.
        forceAnalyticsDeactivated()
        // Every concrete logEvent overload (abstract declarations have no body, rule 2).
        val measurementEvents = mutableClassDefBy(GMS_MEASUREMENT_SDK).methods
            .filter { it.name == "logEvent" && it.returnType == "V" && it.implementation != null }
        if (measurementEvents.isEmpty()) throw PatchException("No concrete AppMeasurementSdk.logEvent found")
        measurementEvents.forEach { it.returnEarly() }

        // 3. Crashlytics: two classes reference the collection-enabled pref key - the
        // settings holder (boolean getter that decides whether anything is collected)
        // and the FirebaseCrashlytics instance itself (log/recordException methods).
        // Disable collection and neuter the non-fatal reporting entry points.
        val crashlyticsClasses = classDefByStrings(CRASHLYTICS_COLLECTION_KEY)
        if (crashlyticsClasses.isEmpty()) throw PatchException("No class references $CRASHLYTICS_COLLECTION_KEY")
        var crashlyticsGetters = 0
        var crashlyticsReports = 0
        for (classDef in crashlyticsClasses) {
            val crashlytics = mutableClassDefBy(classDef)
            crashlytics.methods
                .filter { it.implementation != null }
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() }
                .forEach {
                    crashlyticsGetters++
                    it.returnEarly(false)
                }
            crashlytics.methods
                .filter { it.implementation != null }
                .filter {
                    it.returnType == "V" &&
                        it.parameterTypes.size == 1 &&
                        it.parameterTypes.first().toString() == "Ljava/lang/Throwable;"
                }
                .forEach {
                    crashlyticsReports++
                    it.returnEarly()
                }
        }
        if (crashlyticsGetters == 0) throw PatchException("Crashlytics collection-enabled getter not found")
        if (crashlyticsReports == 0) throw PatchException("Crashlytics recordException(Throwable) not found")

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

        // 6. Firebase In-App Messaging (2026-11-03): its data-collection getter answers false, so
        // FIAM never fetches campaigns and never logs impressions or clicks. Block marketing
        // notifications only gates the display, so with this step the campaigns never arrive at
        // all, whatever that switch says.
        InAppMessagingDataCollectionFingerprint.method.apply {
            if (implementation == null) throw PatchException("FIAM data-collection getter has no body")
            returnEarly(false)
        }

        // 7. EmojiCompat start-up (2026-11-03): its androidx.startup Initializer returns at once,
        // so no package-manager query for the emoji font provider runs at start-up and no font is
        // downloaded. Every EmojiCompat user in the app is androidx code (AppCompat text views,
        // Compose text, emoji2 views) that checks EmojiCompat.isConfigured() first and then
        // draws emoji with the system font, which is the documented result of removing this
        // initializer.
        mutableClassDefBy(EMOJI_COMPAT_INITIALIZER).methods.singleOrNull {
            it.name == "create" && it.returnType == "Ljava/lang/Object;" &&
                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;") &&
                it.implementation != null
        }?.addInstructionsChecked(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;
                return-object v0
            """,
        ) ?: throw PatchException("EmojiCompatInitializer has no create(Context)Object with a body")
    }
}
