package app.aapam.patches.sonyliv.ads

import app.aapam.patches.sonyliv.shared.AdEligibilityFingerprint
import app.aapam.patches.sonyliv.shared.AdTagUrlBuilderFingerprint
import app.aapam.patches.sonyliv.shared.Constants
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable video ads",
    description = "Disables client-side Google IMA video ads in the SonyLIV player by forcing " +
        "the ad eligibility check to false and returning an empty ad tag URL.",
) {
    compatibleWith(Constants.COMPATIBILITY_SONYLIV)

    execute {
        // Force the ad eligibility check to return false
        AdEligibilityFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // Force the ad tag URL builder to return an empty string
        AdTagUrlBuilderFingerprint.method.addInstructions(
            0,
            """
                const-string v0, ""
                return-object v0
            """,
        )
    }
}
