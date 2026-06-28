package app.npci.bhim.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_BHIM

@Suppress("unused")
val bypassLicensePaywall = bytecodePatch(
    name = "Bypass License Paywall",
    description = "Neutralizes the license paywall and error dialog at the source by patching LicenseClient.processResponse, startPaywallActivity, and handleError to return immediately.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BHIM)

    execute {
        ProcessResponseFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        PaywallActivityFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )

        HandleErrorFingerprint.method.addInstructions(
            0,
            """
                return-void
            """,
        )
    }
}
