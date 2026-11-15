package app.memorizepi.patches.mtisland.tracking

import app.memorizepi.patches.mtisland.shared.Constants
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml

/**
 * Google Analytics for Firebase meta-data switches (see the Firebase Android
 * reference for `firebase_analytics_collection_deactivated` and
 * `google_analytics_adid_collection_enabled`).
 *
 * - `firebase_analytics_collection_deactivated = true` makes the SDK drop
 *   every event before it is queued, regardless of the (obfuscated) call
 *   site in the app.
 * - `google_analytics_adid_collection_enabled = false` stops the measurement
 *   SDK from reading the advertising ID.
 * - `google_analytics_ssaid_collection_enabled = false` does the same for the
 *   App Set ID.
 */
private val ANALYTICS_META_DATA = mapOf(
    "firebase_analytics_collection_deactivated" to "true",
    "google_analytics_adid_collection_enabled" to "false",
    "google_analytics_ssaid_collection_enabled" to "false",
)

/**
 * Permissions that exist in this APK only for the measurement/ads pipeline.
 * The app itself bundles no ad SDK (no AdMob, AppLovin, Unity Ads, ironSource,
 * ...); the AD_ID and Privacy-Sandbox permissions are merged in by
 * `play-services-measurement`.
 */
private val TRACKING_PERMISSIONS = listOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
)

/**
 * Disables Firebase Analytics collection and drops the advertising-ID
 * permissions.
 *
 * Material Capsule wires up Google Analytics for Firebase
 * (`FirebaseInitProvider`, `AppMeasurementService`, the analytics component
 * registrars) and logs events such as `select_item` from its own wrapper.
 * The patch works at the manifest level instead of patching obfuscated
 * call sites:
 *
 * - collection is deactivated through the documented Firebase meta-data,
 *   so no event leaves the device,
 * - the advertising-ID / Privacy-Sandbox permissions are removed, so the
 *   measurement SDK cannot read the device advertising ID either.
 *
 * Nothing else is changed: no DEX method is touched, and every other app
 * feature (capsule, accessibility service, notifications, billing) keeps
 * working.
 */
val disableFirebaseAnalyticsPatch = patch(
    name = "Disable Firebase Analytics tracking",
    description = "Deactivates Google Analytics for Firebase through the documented " +
            "manifest switches, so no analytics event is uploaded, and removes the " +
            "advertising-ID / Privacy-Sandbox permissions. No app feature is changed.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY_MATERIAL_CAPSULE)

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.elements("application").first()
            val existingMetaData = application.elements("meta-data").toList()

            ANALYTICS_META_DATA.forEach { (name, value) ->
                // Replace an existing switch of the same name instead of
                // adding a duplicate.
                val existing = existingMetaData.firstOrNull {
                    it.attribute("android:name") == name
                }
                if (existing != null) {
                    existing.setAttribute("android:value", value)
                } else {
                    application.appendChild("meta-data") {
                        setAttribute("android:name", name)
                        setAttribute("android:value", value)
                    }
                }
            }

            val usesPermissions = manifest.elements("uses-permission").toList()
            TRACKING_PERMISSIONS.forEach { permission ->
                usesPermissions
                    .filter { it.attribute("android:name") == permission }
                    .forEach { it.remove() }
            }
        }
    }
}
