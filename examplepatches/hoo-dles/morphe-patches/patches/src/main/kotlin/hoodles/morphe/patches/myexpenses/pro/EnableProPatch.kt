/**
 * Copyright 2026 Hoo-dles
 * https://github.com/hoo-dles/morphe-patches
 */

package hoodles.morphe.patches.myexpenses.pro

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import hoodles.morphe.compatibility.Compat

@Suppress("unused")
val enableProPatch = bytecodePatch(
    name = "Enable Pro",
    description = "Enables app features locked behind the subscription paywall."
) {
    compatibleWith(Compat.MY_EXPENSES)

    execute {
        // Make setter value (first param) always LicenseStatus.PROFESSIONAL.
        SetLicenseStatusFingerprint.method.addInstruction(
            0,
            "sget-object p1, Lorg/totschnig/myexpenses/util/licence/LicenceStatus;->PROFESSIONAL:Lorg/totschnig/myexpenses/util/licence/LicenceStatus;"
        )

        // No expiration license date is set to 0.
        GetValidUntilFingerprint.method.returnEarly(0L)
    }
}
