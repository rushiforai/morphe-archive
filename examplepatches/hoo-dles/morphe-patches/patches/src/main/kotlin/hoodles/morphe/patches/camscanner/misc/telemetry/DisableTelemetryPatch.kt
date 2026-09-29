/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.camscanner.misc.telemetry

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.changepackageinstaller.changePackageInstallerPatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val disableTelemetryPatch = bytecodePatch(
    name = "Disable telemetry",
    description = "Disables CamScanner's custom telemetry system."
) {
    compatibleWith(Compat.CAM_SCANNER)

    dependsOn(spoofSignaturePatch, changePackageInstallerPatch())

    execute {
        IsSkipLoggingFingerprint.method.returnEarly(true)
        LogAgentRecordFingerprint.method.returnEarly()
    }
}