package app.template.patches.fotmob.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.misc.telemetry.forceAnalyticsDeactivated
import com.android.tools.smali.dexlib2.AccessFlags

// The concrete AppsFlyer implementation (AFa1tSDK in 239) subclasses the public AppsFlyerLib,
// which only declares abstract methods. These are the entry points that send data; the push
// APIs (sendPushNotificationData, ...) are left alone.
private const val APPSFLYER_LIB = "Lcom/appsflyer/AppsFlyerLib;"
private val APPSFLYER_METHODS = setOf("start", "logEvent", "logSession", "logAdRevenue")

// FirebaseCrashlytics is R8-renamed and merged in this build, so its data collection arbiter is
// located at patch time by the SharedPreferences key it reads.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting."
) {
    compatibleWith(COMPATIBILITY_FOTMOB)

    execute {
        // 1. AppsFlyer: start, every logEvent overload, logSession and logAdRevenue (the
        // Sofascore patch's approach), so the SDK never starts sending.
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
        // reads as true (shared with Sofascore), and every remaining app event funnels through
        // the Google Measurement SDK entry point.
        forceAnalyticsDeactivated()
        val logEvent = GmsMeasurementLogEventFingerprint.method
        if (logEvent.implementation == null) {
            throw PatchException("AppMeasurementSdk.logEvent has no implementation")
        }
        logEvent.returnEarly()

        // 3. Crashlytics: R8 merged the SDK into shared classes, so the two classes holding the
        // collection-enabled key also carry unrelated code (239: e93 is the DataCollectionArbiter,
        // hai a helper bag whose static n()Z is an SDK_INT >= 26 check with ten callers). Only
        // the arbiter's isAutomaticDataCollectionEnabled() is forced false: the synchronized
        // no-arg boolean (dex marks Java synchronized methods DECLARED_SYNCHRONIZED). Nothing
        // is uploaded while it is false; non-fatal reporting is left alone.
        val arbiterGetters = classDefByStrings(CRASHLYTICS_COLLECTION_KEY).flatMap { classDef ->
            mutableClassDefBy(classDef).methods.filter {
                it.implementation != null &&
                    it.returnType == "Z" && it.parameterTypes.isEmpty() &&
                    (AccessFlags.DECLARED_SYNCHRONIZED.isSet(it.accessFlags) ||
                        AccessFlags.SYNCHRONIZED.isSet(it.accessFlags))
            }
        }
        val arbiter = arbiterGetters.singleOrNull()
            ?: throw PatchException(
                "Expected one synchronized ()Z Crashlytics collection getter, found " +
                    arbiterGetters.map { "${it.definingClass}->${it.name}" }
            )
        arbiter.returnEarly(false)
    }
}
