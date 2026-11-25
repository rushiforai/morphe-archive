package app.masareef.patches.telemetry

import app.morphe.patcher.patch.resourcePatch
import app.masareef.patches.telemetry.resource.androidManifest
import app.masareef.patches.telemetry.resource.removeReceiver
import app.masareef.patches.telemetry.resource.removeService

val removeCrashlyticsServicesPatch = resourcePatch(
    description = "Removes Firebase Crashlytics broadcast receivers and services."
) {
    execute {
        androidManifest {
            removeService("""com\.google\.firebase\.crashlytics\..+Service$""")
            removeReceiver("""com\.google\.firebase\.crashlytics\..+Receiver$""")
        }
    }
}
