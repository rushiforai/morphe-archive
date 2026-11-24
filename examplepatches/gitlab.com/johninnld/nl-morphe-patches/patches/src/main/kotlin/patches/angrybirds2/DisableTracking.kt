package patches.angrybirds2

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
            setMetaData(manifest, "com.facebook.sdk.AutoLogAppEventsEnabled", "false")
            setMetaData(manifest, "com.facebook.sdk.AdvertiserIDCollectionEnabled", "false")
            // An empty DSN disables the Sentry SDK cleanly; removing the meta-data makes the
            // auto-init provider crash with "DSN is required".
            setMetaData(manifest, "io.sentry.dsn", "")
        }
    }
}

internal val angryBirds2TrackingGate = bytecodePatch {
    dependsOn(originalInput, trackingResources)
    extendWith(java.util.function.Supplier { rovioLocalConsentDex() })

    execute {
        silenceRovioBeaconTracking("Angry Birds 2")
        useRovioLocalConsent("Angry Birds 2")
    }
}

@Suppress("unused")
val angryBirds2DisableTracking = bytecodePatch(
    name = "Disable tracking",
    description = "Stops advertising identifier and app set ID collection, install-referrer " +
        "attribution, Google measurement, Firebase Analytics, Crashlytics and Sessions upload, " +
        "turns off Facebook's advertiser identifier and event upload, and empties the Sentry " +
        "crash-report endpoint. The game's own cloud services keep working; telemetry inside the " +
        "Unity engine is out of reach from this layer.",
    default = true,
) {
    compatibleWith(angryBirds2)
    dependsOn(angryBirds2TrackingGate)
}
