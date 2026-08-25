package app.template.patches.candylinkvpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CANDYLINK_VPN_COMPATIBILITY
import app.template.patches.candylinkvpn.IsTrackingFingerprint

@Suppress("unused")
val disableTrackingPatch = bytecodePatch(
    name = "Disable Tracking",
    description = "Disable tracking statistics for CandyLink VPN .",
    default = true
) {
    compatibleWith(CANDYLINK_VPN_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsTrackingFingerprint.method.apply {
            removeInstructions(instructions.size)
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """
            )
        }
    }
}