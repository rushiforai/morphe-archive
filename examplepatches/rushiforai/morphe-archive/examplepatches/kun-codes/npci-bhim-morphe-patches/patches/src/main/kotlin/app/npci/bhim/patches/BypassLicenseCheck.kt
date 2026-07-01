package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM

@Suppress("unused")
val bypassLicenseCheck = bytecodePatch(
    name = "Bypass License Check",
    description = "Bypasses Google Play Store license verification in com.pairip.licensecheck.LicenseClient to prevent System.exit(0) on non-Play Store installs.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        LicenseCheckFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
