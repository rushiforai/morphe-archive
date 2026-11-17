package app.template.patches.youcut.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_YOUCUT
import org.w3c.dom.Element

/**
 * Turns off Firebase Analytics, Crashlytics, Sessions and advertising-ID collection through the
 * manifest switches. YouCut declares none of them, so Firebase's defaults (all on) applied.
 * Firebase Messaging is not used by the app and is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_YOUCUT)

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
 * YouCut reports through Firebase Analytics (a batch logger plus a wrapper used by its analytics
 * facade, both reaching the Google Analytics collector) and Firebase Crashlytics (non-fatal
 * reports from 59 call sites, plus the automatic crash capture). The two analytics emitters now
 * return at once, and every public void method of FirebaseCrashlytics (recordException, log,
 * custom keys, user id, collection switch, unsent-report upload) does nothing, so the app cannot
 * switch collection back on or upload anything. The manifest switches stop automatic collection.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics and crash reporting.",
) {
    compatibleWith(COMPATIBILITY_YOUCUT)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        BatchEventFingerprint.method.returnEarly()
        EventWrapperFingerprint.method.returnEarly()

        val crashlytics = mutableClassDefBy("Lcom/google/firebase/crashlytics/FirebaseCrashlytics;")
        crashlytics.methods
            .filter {
                it.returnType == "V" &&
                    it.implementation != null &&
                    it.name != "<init>" &&
                    it.name != "<clinit>"
            }
            .forEach { it.returnEarly() }
    }
}
