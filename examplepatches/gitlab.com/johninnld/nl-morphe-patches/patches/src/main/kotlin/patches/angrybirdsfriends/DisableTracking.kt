package patches.angrybirdsfriends

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import patches.shared.disableMeasurementAndAttribution
import patches.shared.setMetaData
import patches.shared.removeAdServicesPermissions
import patches.shared.silenceRovioBeaconTracking
import patches.shared.rovioLocalConsentDex
import patches.shared.useRovioLocalConsent

private val trackingResources = resourcePatch {
    dependsOn(originalInput)
    execute {
        document("AndroidManifest.xml").use { manifest ->
            disableMeasurementAndAttribution(manifest)
            removeAdServicesPermissions(manifest)
            // The Unity Facebook plugin stays for sign-in, but neither its event upload nor the
            // advertiser identifier may leave the device.
            setMetaData(manifest, "com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            setMetaData(manifest, "com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
        }
    }
}

internal val angryBirdsFriendsTrackingGate = bytecodePatch {
    dependsOn(originalInput, trackingResources)
    extendWith(java.util.function.Supplier { rovioLocalConsentDex() })

    execute {
        silenceRovioBeaconTracking("Angry Birds Friends")
        useRovioLocalConsent("Angry Birds Friends")
    }
}

@Suppress("unused")
val angryBirdsFriendsDisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Stops advertising identifier and app set ID collection, install-referrer " +
        "attribution, Google measurement and Firebase Analytics, and turns off Facebook's " +
        "advertiser identifier and event upload. Play Games sign-in and cloud saves keep working; " +
        "telemetry inside the Unity engine is out of reach from this layer.",
    default = true,
) {
    compatibleWith(angryBirdsFriends)
    dependsOn(angryBirdsFriendsTrackingGate)
}
