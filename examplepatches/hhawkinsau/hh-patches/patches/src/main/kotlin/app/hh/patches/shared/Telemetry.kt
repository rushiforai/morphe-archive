package app.hh.patches.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext

internal val AD_ID_PERMISSIONS = setOf(
    "com.google.android.gms.permission.AD_ID",
    "android.permission.ACCESS_ADSERVICES_AD_ID",
    "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
    "android.permission.ACCESS_ADSERVICES_TOPICS",
    "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
)

internal val FIREBASE_MEASUREMENT_COMPONENTS = setOf(
    "com.google.android.gms.measurement.AppMeasurementService",
    "com.google.android.gms.measurement.AppMeasurementJobService",
    "com.google.android.gms.measurement.AppMeasurementReceiver",
    "com.google.firebase.sessions.SessionLifecycleService",
)

private val REMOTE_CONFIG_META = mapOf(
    "firebase_remote_config_fetch_disallow" to "true",
)

/**
 * Disables Play Measurement senders and marks Remote Config fetch as disallowed.
 * Does not disable [FirebaseInitProvider] so Firebase.initializeApp() still works.
 */
internal fun ResourcePatchContext.disableRemoteConfig() {
    document("AndroidManifest.xml").use { document ->
        val application = document.applicationElement()
            ?: throw PatchException("AndroidManifest.xml is missing an <application> element.")

        REMOTE_CONFIG_META.forEach { (name, value) ->
            application.setMetaData(name, value)
        }

        FIREBASE_MEASUREMENT_COMPONENTS.forEach { componentName ->
            application.disableComponent(componentName)
        }

        // Drop Remote Config component registrars so the SDK is not discovered.
        application.childElements("service")
            .filter { it.androidName() == "com.google.firebase.components.ComponentDiscoveryService" }
            .forEach { service ->
                service.childElements("meta-data")
                    .filter { it.androidName().contains("remoteconfig", ignoreCase = true) }
                    .forEach { it.parentNode?.removeChild(it) }
            }
    }
}
