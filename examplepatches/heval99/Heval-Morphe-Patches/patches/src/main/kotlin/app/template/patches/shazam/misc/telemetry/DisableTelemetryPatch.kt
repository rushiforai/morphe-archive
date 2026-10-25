package app.template.patches.shazam.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_SHAZAM

// Crashlytics' data-collection arbiter reads this SharedPreferences/manifest key; the pref key
// is stable even where R8 renames the class (Sofascore), so the arbiter is found by it.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

/**
 * A fingerprint can match an abstract declaration; calling returnEarly() on a
 * method without a body crashes the patcher, so only patch methods that
 * actually have an implementation.
 */
private fun MutableMethod?.returnEarlyIfImplemented() =
    this?.takeIf { it.implementation != null }?.returnEarly()

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting."
) {
    compatibleWith(COMPATIBILITY_SHAZAM)

    execute {
        // Firebase Analytics event logging.
        FirebaseAnalyticsLogEventFingerprint.method.returnEarlyIfImplemented()

        // Crashlytics: automatic data collection reads as off, so no crash report is sent,
        // the way the Business Calendar patch does it: the data-collection arbiter is found
        // by the SharedPreferences key it reads, and every no-arg boolean getter (16.63.0:
        // isAutomaticDataCollectionEnabled and its isFirebaseDataCollectionDefaultEnabled
        // fallback) returns false. FirebaseCrashlytics.isCrashlyticsCollectionEnabled
        // (forced false below) only delegates to the arbiter; IdManager, the settings
        // controller and the app-quality-sessions subscriber all call the arbiter directly,
        // so forcing the public getter alone never stopped collection. Every concrete
        // reporting entry point (recordException has two overloads - all matches, not just
        // the first) returns at once too.
        var collectionGetters = 0
        for (classDef in classDefByStrings(CRASHLYTICS_COLLECTION_KEY)) {
            mutableClassDefBy(classDef).methods
                .filter { it.returnType == "Z" && it.parameterTypes.isEmpty() && it.implementation != null }
                .forEach {
                    it.returnEarly(false)
                    collectionGetters++
                }
        }
        if (collectionGetters == 0) {
            throw PatchException("Disable telemetry: no Crashlytics data collection arbiter getter found")
        }

        CrashlyticsCollectionEnabledFingerprint.method
            .takeIf { it.implementation != null }?.returnEarly(false)
        mutableClassDefByOrNull("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
            ?.methods.orEmpty()
            .filter { it.implementation != null }
            .filter { it.name == "recordException" || it.name == "log" }
            .forEach { it.returnEarly() }
    }
}
