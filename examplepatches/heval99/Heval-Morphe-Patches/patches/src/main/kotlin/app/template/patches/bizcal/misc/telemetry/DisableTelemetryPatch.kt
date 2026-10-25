// Based on o0b/morphe-patches (GPL-3.0), patches/src/main/kotlin/app/template/patches/businesscalendar2/telemetry/
// BusinessCalendar2DisableTelemetryPatch.kt: the Fyber crash-handler provider kill and the promo
// push no-ops. Firebase is handled the Shazam/Sofascore way (reporting calls only) instead of the
// reference's FirebaseInitProvider and FirebaseUtil kills, which would also stop Remote Config.
package app.template.patches.bizcal.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_BUSINESSCALENDAR
import org.w3c.dom.Element

// Firebase Analytics' documented manifest kill switch. It also stops the automatic events
// (first_open, session_start, screen_view) that the logEvent hooks cannot reach. Remote Config
// does not depend on Analytics, so the app's flags keep updating. The stock 2.55.7 manifest does
// not set it.
private const val ANALYTICS_DEACTIVATED_KEY = "firebase_analytics_collection_deactivated"

private const val FIREBASE_CRASHLYTICS = "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;"

// Crashlytics' data-collection arbiter reads this SharedPreferences/manifest key; the pref key is
// stable even where R8 renames the class (Sofascore), so the class is found by it.
private const val CRASHLYTICS_COLLECTION_KEY = "firebase_crashlytics_collection_enabled"

// FirebaseUtil identifies the user and sets custom keys through these; none returns a value.
private val ANALYTICS_IDENTITY_METHODS = setOf("setUserId", "setUserProperty")
private val CRASHLYTICS_REPORTING_METHODS = setOf("recordException", "log", "setUserId", "setCustomKey")

/** Sets the Firebase Analytics manifest switch under `<application>`. */
private val disableAnalyticsManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_BUSINESSCALENDAR)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            // Overwrite in place should a later build ship the key; only direct children count.
            val metas = application.getElementsByTagName("meta-data")
            val meta = (0 until metas.length)
                .mapNotNull { metas.item(it) as? Element }
                .firstOrNull { it.parentNode == application && it.getAttribute("android:name") == ANALYTICS_DEACTIVATED_KEY }
                ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", ANALYTICS_DEACTIVATED_KEY)
                    application.appendChild(it)
                }
            meta.setAttribute("android:value", "true")
        }
    }
}

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics, crash reporting and sale promo notifications."
) {
    compatibleWith(COMPATIBILITY_BUSINESSCALENDAR)

    // Firebase Analytics' manifest switch, for the automatic events the hooks below cannot reach.
    dependsOn(disableAnalyticsManifestPatch)

    execute {
        // 1. Fyber's process-start crash handler never installs. Its provider returns true
        //    normally; false only tells the framework nothing, as the authority is never queried.
        FyberCrashHandlerProviderFingerprint.method.returnEarly(false)

        // 2. Sale promo push notifications: neither armed nor posted.
        SchedulePushNotificationFingerprint.method.returnEarly()
        ShowPushNotificationFingerprint.method.returnEarly()

        // 3. Firebase Analytics: app events, the user id/properties, and connector events.
        FirebaseAnalyticsLogEventFingerprint.method.returnEarly()
        FirebaseAnalyticsLogEventFingerprint.classDef.methods
            .filter { it.name in ANALYTICS_IDENTITY_METHODS && it.returnType == "V" && it.implementation != null }
            .forEach { it.returnEarly() }
        MeasurementSdkLogEventFingerprint.method.returnEarly()

        // 4. Crashlytics: every concrete reporting entry point on the public API (both
        //    setCustomKey overloads), then the collection switch in the arbiter, which also
        //    covers automatic crash upload and Firebase Sessions.
        val crashlytics = mutableClassDefBy(FIREBASE_CRASHLYTICS)
        val reporting = crashlytics.methods.filter {
            it.name in CRASHLYTICS_REPORTING_METHODS && it.returnType == "V" && it.implementation != null
        }
        if (reporting.none { it.name == "recordException" }) {
            throw PatchException("Disable telemetry: $FIREBASE_CRASHLYTICS has no concrete recordException")
        }
        reporting.forEach { it.returnEarly() }

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
            throw PatchException("Disable telemetry: no Crashlytics collection getter next to \"$CRASHLYTICS_COLLECTION_KEY\"")
        }
    }
}
