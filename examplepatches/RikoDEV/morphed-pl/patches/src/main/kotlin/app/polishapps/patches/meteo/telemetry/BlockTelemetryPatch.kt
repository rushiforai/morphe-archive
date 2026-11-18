package app.polishapps.patches.meteo.telemetry

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.polishapps.patches.shared.Constants.COMPATIBILITY_METEO_ICM
import org.w3c.dom.Element

/**
 * The Dart side only calls Firebase Analytics `logEvent` / `setUserProperty`, Crashlytics `recordError`
 * and In-App Messaging `triggerEvent`. It never re-enables collection at runtime (the
 * `setXCollectionEnabled` channels are tree-shaken out of libapp.so), so the manifest flags are enough.
 */
private val manifestFlags = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "firebase_analytics_collection_enabled" to "false",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
    "firebase_crashlytics_collection_enabled" to "false",
    "firebase_performance_collection_deactivated" to "true",
    "firebase_performance_collection_enabled" to "false",
    "firebase_inappmessaging_auto_data_collection_enabled" to "false",
    "firebase_sessions_enabled" to "false",
)

private const val CCT_BACKEND = "backend:com.google.android.datatransport.cct.CctBackendFactory"

private val advertisingPermissions = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
)

@Suppress("unused")
val blockTelemetryPatch = resourcePatch(
    name = "Block telemetry",
    description = "Turns off Firebase Analytics, Crashlytics, Performance, In-App Messaging and Sessions, " +
        "removes the advertising ID permissions and the Google datatransport upload backend. " +
        "Push notifications (FCM), RevenueCat and the weather API keep working.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_METEO_ICM)

    execute {
        document("AndroidManifest.xml").use { manifest ->
            val application = manifest.getElementsByTagName("application").item(0) as? Element
                ?: throw PatchException("AndroidManifest.xml has no <application>")

            val metaData = application.getElementsByTagName("meta-data")
            val all = (0 until metaData.length).map { metaData.item(it) as Element }

            manifestFlags.forEach { (name, value) ->
                val element = all.firstOrNull { it.getAttribute("android:name") == name }
                    ?: manifest.createElement("meta-data").also { created ->
                        created.setAttribute("android:name", name)
                        application.appendChild(created)
                    }
                element.setAttribute("android:value", value)
            }

            val backend = all.firstOrNull { it.getAttribute("android:name") == CCT_BACKEND }
                ?: throw PatchException("$CCT_BACKEND not found in AndroidManifest.xml")
            backend.parentNode.removeChild(backend)

            val permissions = manifest.getElementsByTagName("uses-permission")
            val removable = (0 until permissions.length)
                .map { permissions.item(it) as Element }
                .filter { it.getAttribute("android:name") in advertisingPermissions }
            if (removable.isEmpty()) throw PatchException("No advertising permissions found in AndroidManifest.xml")
            removable.forEach { it.parentNode.removeChild(it) }
        }
    }
}
