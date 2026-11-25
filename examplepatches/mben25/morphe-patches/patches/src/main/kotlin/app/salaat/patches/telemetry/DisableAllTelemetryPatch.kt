package app.salaat.patches.telemetry

import app.salaat.patches.integrity.neutralizeSignatureCheckPatch
import app.salaat.patches.shared.Constants.COMPATIBILITY_SALAAT
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAllTelemetryPatch = bytecodePatch(
    name = "Disable All Telemetry",
    description = "Comprehensive privacy patch: disables the OpenSignal and CellRebel " +
        "data-collection SDKs and deactivates Firebase/Google Analytics, Crashlytics and session " +
        "tracking. Does not affect app functionality.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SALAAT)

    dependsOn(
        neutralizeSignatureCheckPatch,
        disablePartnerSdksPatch,
        deactivateFirebaseTelemetryPatch,
    )

    execute {
        // Orchestrator only; the real work is in the dependency patches.
    }
}
