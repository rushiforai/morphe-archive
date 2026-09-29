/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.nomone.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat
import hoodles.morphe.patches.nomone.shared.tamper.disableAntiTamperPatch

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables event logging sent to the app's custom endpoint."
) {
    compatibleWith(Compat.NOMONE)

    dependsOn(disableAntiTamperPatch)

    execute {
        SendTelemetryEventFingerprint.method.returnEarly()
    }
}