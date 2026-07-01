package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM

@Suppress("unused")
val bypassLicenseActivity = bytecodePatch(
    name = "Bypass License Activity",
    description = "Neutralizes LicenseActivity.onStart to prevent the paywall and error dialog from being displayed, acting as a catch-all guard if LicenseActivity is ever started.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        LicenseActivityOnStartFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
