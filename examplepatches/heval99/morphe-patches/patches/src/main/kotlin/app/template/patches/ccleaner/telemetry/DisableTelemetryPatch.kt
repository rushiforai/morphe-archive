package app.template.patches.ccleaner.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_CCLEANER
import org.w3c.dom.Element

/**
 * Turns off Firebase Analytics, Crashlytics, Sessions and advertising-ID collection through the
 * manifest switches. Firebase Messaging is not used by the cleaner and is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_CCLEANER)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) throw PatchException("AndroidManifest.xml has no <application>")
            val application = applications.item(0) as Element

            val existing = buildMap {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val meta = metas.item(i) as? Element ?: continue
                    if (meta.parentNode != application) continue
                    put(meta.getAttribute("android:name"), meta)
                }
            }

            for ((name, value) in mapOf(
                "firebase_analytics_collection_enabled" to "false",
                "firebase_analytics_collection_deactivated" to "true",
                "firebase_crashlytics_collection_enabled" to "false",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )) {
                val meta = existing[name] ?: doc.createElement("meta-data").also {
                    it.setAttribute("android:name", name)
                    application.appendChild(it)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

/**
 * CCleaner reports usage events through the Avast tracking2 stack: every domain event is mapped
 * to a Firebase event and sent by `FirebaseTracker.trackEvent`, with the app's
 * `FirebaseTrackerProxy` (name truncation and validation) in front of it. Both are no-oped, as is
 * `FirebaseManager` (user properties and Crashlytics keys). Crashlytics itself gets the same
 * treatment as in the other apps: every public void method returns at once, so non-fatal reports
 * from the app's error handler and the Kermit writer are dropped, and the manifest switch stops
 * automatic crash capture. The Burger tracker and local logging are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_CCLEANER)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        for (type in listOf(
            "Lcom/avast/android/tracking2/firebase/FirebaseTracker;",
            "Lcom/avast/android/cleaner/tracking/FirebaseTrackerProxy;",
            "Lcom/avast/android/cleaner/tracking/firebase/FirebaseManager;",
            "Lcom/google/firebase/crashlytics/FirebaseCrashlytics;",
        )) {
            val classDef = mutableClassDefByOrNull(type)
                ?: throw PatchException("Disable telemetry: $type not found")
            val targets = classDef.methods.filter {
                it.returnType == "V" &&
                    it.implementation != null &&
                    it.name != "<init>" &&
                    it.name != "<clinit>"
            }
            if (targets.isEmpty()) {
                throw PatchException("Disable telemetry: no concrete void methods on $type")
            }
            targets.forEach { it.returnEarly() }
        }
    }
}
