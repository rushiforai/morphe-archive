package morningentree.morphe.patches.all.misc.tracking

import app.morphe.patcher.patch.resourcePatch
import morningentree.morphe.util.asElementSequence
import morningentree.morphe.util.get
import org.w3c.dom.Element
import java.util.logging.Logger

private val TRACKER_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
)

private val COLLECTION_FLAGS_OFF = mapOf(
    "firebase_analytics_collection_enabled" to "false",
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_crashlytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
)

@Suppress("unused")
val disableAnalyticsPatch = resourcePatch(
    name = "Disable analytics & ad tracking",
    description = "Turns off Firebase / Google Analytics collection and removes the advertising-ID " +
        "and ad-services permissions. Blocks ad personalization and analytics opt-in without " +
        "cutting off the app's legitimate network features. Pair with a host blocker to also stop " +
        "the traffic.",
    default = false,
) {
    execute {
        val logger = Logger.getLogger(this::class.java.name)

        document("AndroidManifest.xml").use { document ->
            val manifest = document["manifest"]
            val application = document["application"]

            COLLECTION_FLAGS_OFF.forEach { (name, value) ->
                val existing = application.getElementsByTagName("meta-data")
                    .asElementSequence()
                    .firstOrNull { it.getAttribute("android:name") == name }

                if (existing != null) {
                    existing.removeAttribute("android:resource")
                    existing.setAttribute("android:value", value)
                } else {
                    val meta = document.createElement("meta-data") as Element
                    meta.setAttribute("android:name", name)
                    meta.setAttribute("android:value", value)
                    application.appendChild(meta)
                }
            }

            var removedPermissions = 0
            manifest.getElementsByTagName("uses-permission")
                .asElementSequence()
                .filter { it.getAttribute("android:name") in TRACKER_PERMISSIONS }
                .toList()
                .forEach {
                    it.parentNode.removeChild(it)
                    removedPermissions++
                }

            logger.info(
                "Disable analytics: collection flags forced off, " +
                    "$removedPermissions ad permission(s) removed.",
            )
        }
    }
}
