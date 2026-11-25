package app.salaat.patches.telemetry

import app.salaat.patches.telemetry.resource.androidManifest
import app.salaat.patches.telemetry.resource.removeProvider
import app.salaat.patches.telemetry.resource.removeReceiver
import app.salaat.patches.telemetry.resource.removeService
import app.morphe.patcher.patch.resourcePatch

/**
 * Strips the OpenSignal and CellRebel background components (job services, alarm/boot/power
 * receivers, storage provider) from the manifest so nothing can revive the SDKs out-of-process.
 * Paired with [disablePartnerSdksPatch], which stops in-process initialization.
 */
val removePartnerSdkComponentsPatch = resourcePatch(
    description = "Removes the OpenSignal and CellRebel background services, receivers and content provider.",
) {
    execute {
        androidManifest {
            removeService("""com\.opensignal\.sdk\..+""")
            removeReceiver("""com\.opensignal\.sdk\..+""")
            removeProvider("""com\.opensignal\.sdk\..+""")
            removeReceiver("""com\.cellrebel\.sdk\..+""")
            removeService("""com\.cellrebel\.sdk\..+""")
        }
    }
}
