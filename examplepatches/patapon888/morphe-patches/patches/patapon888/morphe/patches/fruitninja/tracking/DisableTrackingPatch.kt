package patapon888.morphe.patches.fruitninja.tracking

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import patapon888.morphe.patches.fruitninja.FRUIT_NINJA_CLASSIC

// Without network access no analytics, crash report, support chat or attribution SDK can send anything.
private val REMOVED_PERMISSIONS = setOf(
    "android.permission.INTERNET",
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

// Also switched off at the source, in case a later Android lets them through anyway.
private val DISABLED_COLLECTION = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_default_allow_ad_personalization_signals" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_messaging_auto_init_enabled" to "false",
)

@Suppress("unused")
val disableTrackingPatch = resourcePatch(
    name = "Disable tracking",
    description = "Removes the game's network access and turns off analytics and crash reports. " +
        "Nothing the game needs is online once Offline mode is applied."
) {
    compatibleWith(FRUIT_NINJA_CLASSIC)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissions = document.getElementsByTagName("uses-permission")
            (0 until permissions.length).map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in REMOVED_PERMISSIONS }
                .forEach { manifest.removeChild(it) }

            val application = document.getElementsByTagName("application").item(0) as Element
            val metaData = document.getElementsByTagName("meta-data")
            (0 until metaData.length).map { metaData.item(it) as Element }
                .filter { it.getAttribute("android:name") in DISABLED_COLLECTION }
                .forEach { it.parentNode.removeChild(it) }
            DISABLED_COLLECTION.forEach { (name, value) ->
                application.appendChild(document.createElement("meta-data").apply {
                    setAttribute("android:name", name)
                    setAttribute("android:value", value)
                })
            }
        }
    }
}
