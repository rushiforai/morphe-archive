package hoodles.morphe.patches.camscanner.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.patches.camscanner.misc.signature.spoofSignaturePatch
import hoodles.morphe.patches.camscanner.shared.Constants

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables CamScanner's custom telemetry system."
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(spoofSignaturePatch)

    execute {
        IsSkipLoggingFingerprint.method.returnEarly(true)
    }
}