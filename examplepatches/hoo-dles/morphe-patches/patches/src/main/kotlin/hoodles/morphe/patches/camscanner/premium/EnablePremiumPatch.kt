/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.camscanner.premium

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.all.misc.fix.spoofsignature.spoofSignaturePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Enables some app features locked behind the subscription paywall. Certain server-side functionality may be unavailable."
) {
    compatibleWith(Compat.CAM_SCANNER)

    dependsOn(spoofSignaturePatch)

    execute {
        GetStatusCodeFingerprint.method.returnEarly(1L)
    }
}