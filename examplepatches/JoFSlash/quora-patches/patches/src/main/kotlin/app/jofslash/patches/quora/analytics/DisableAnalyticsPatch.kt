package app.jofslash.patches.quora.analytics

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Manifest flags read by the Firebase and Facebook SDKs at startup.
 */
private val METADATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
    "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
    "com.facebook.sdk.AutoInitEnabled" to "false",
)

@Suppress("unused")
val disableAnalyticsPatch = resourcePatch(
    name = "Disable analytics",
    description = "Turns off Firebase Analytics, Crashlytics, Firebase Performance and Facebook app events, " +
            "and stops the advertising ID from being collected.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0) as Element

            // Overwrite flags the app already declares (Quora enables Crashlytics explicitly).
            val existing = mutableSetOf<String>()
            val nodes = application.getElementsByTagName("meta-data")
            for (i in 0 until nodes.length) {
                val node = nodes.item(i) as Element
                if (node.parentNode != application) continue
                val name = node.getAttribute("android:name")
                METADATA[name]?.let {
                    node.setAttribute("android:value", it)
                    existing += name
                }
            }

            METADATA.filterKeys { it !in existing }.forEach { (name, value) ->
                application.appendChild(
                    document.createElement("meta-data").apply {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    }
                )
            }
        }
    }
}
