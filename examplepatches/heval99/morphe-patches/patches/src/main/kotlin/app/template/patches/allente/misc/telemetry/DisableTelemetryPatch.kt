package app.template.patches.allente.misc.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_ALLENTE
import app.template.patches.shared.addInstructionsChecked
import org.w3c.dom.Element

/**
 * Turns off Firebase Analytics, Crashlytics, Sessions, Performance and advertising-ID collection
 * through the manifest switches. Firebase Messaging (push) is not touched.
 */
private val disableTelemetryManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_ALLENTE)

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
                "firebase_performance_collection_enabled" to "false",
                "firebase_performance_collection_deactivated" to "true",
                "firebase_sessions_enabled" to "false",
                "google_analytics_adid_collection_enabled" to "false",
            )) {
                // The app declares analytics and performance as enabled; overwrite both in place.
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
 * Allente reports usage through @react-native-firebase/analytics (the stock manifest ships it
 * enabled). The patch forces the native module's setAnalyticsCollectionEnabled argument to
 * Boolean.FALSE so the JS consent flow cannot switch collection back on, and sets the manifest
 * switches for the automatic collection, Crashlytics, Sessions and the advertising ID. Firebase
 * Messaging (push), the TV player and the account session are untouched.
 */
@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables analytics.",
) {
    compatibleWith(COMPATIBILITY_ALLENTE)

    dependsOn(disableTelemetryManifestPatch)

    execute {
        val switch = AnalyticsCollectionSwitchFingerprint.method
        val register = switch.implementation!!.registerCount - switch.parameterTypes.size
        switch.addInstructionsChecked(
            0,
            "sget-object v$register, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;",
        )
    }
}
