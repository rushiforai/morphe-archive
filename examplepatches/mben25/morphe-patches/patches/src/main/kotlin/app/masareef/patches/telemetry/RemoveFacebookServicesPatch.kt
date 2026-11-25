package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.removeReceiver
import app.masareef.patches.telemetry.resource.removeService

val removeFacebookServicesPatch = resourcePatch(
    description = "Removes Facebook SDK broadcast receivers and services."
) {
    execute {
        androidManifest {
            removeReceiver("""com\.facebook\..+Receiver$""")
            removeService("""com\.facebook\..+Service$""")
            removeService("""com\.facebook\.ads\..+Service$""")
        }
    }
}
