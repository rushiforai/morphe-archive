package app.ffn.patches.privacy

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

/**
 * Firebase reads these manifest flags at startup. With them set, Analytics, Crashlytics and
 * Sessions stay initialized (so app calls like FirebaseCrashlytics.getInstance() keep working)
 * but never collect or upload anything.
 */
private val TELEMETRY_FLAGS = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
)

@Suppress("unused")
val disableFirebaseTelemetryPatch = patch(
    name = "Disable Firebase telemetry",
    description = "Stops Firebase Analytics, Crashlytics and Sessions from collecting and uploading data.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()

            TELEMETRY_FLAGS.forEach { (name, value) ->
                val metaData = application.children("meta-data")
                    .firstOrNull { it.attribute("android:name") == name }
                    ?: application.appendChild("meta-data") { setAttribute("android:name", name) }
                metaData.setAttribute("android:value", value)
            }
        }
    }
}
