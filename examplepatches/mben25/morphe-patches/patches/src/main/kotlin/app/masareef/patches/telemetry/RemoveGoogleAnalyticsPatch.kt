package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.removeReceiver
import app.masareef.patches.telemetry.resource.removeService

val removeGoogleAnalyticsPatch = resourcePatch(
    description = "Removes Google Analytics's broadcast receivers and services."
) {
    execute {
        androidManifest {
            removeReceiver("""com\.google\.android\.gms\.analytics\..+Receiver$""")
            removeService("""com\.google\.android\.gms\.analytics\..+Service$""")
        }
    }
}
