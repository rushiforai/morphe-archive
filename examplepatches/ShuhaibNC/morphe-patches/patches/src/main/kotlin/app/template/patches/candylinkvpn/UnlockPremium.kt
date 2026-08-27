package app.template.patches.candylinkvpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CANDYLINK_VPN_COMPATIBILITY
import app.template.patches.candylinkvpn.IsPremiumFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Premium features are unlocked and ads are disabled.",
    default = true
) {
    compatibleWith(CANDYLINK_VPN_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsPremiumFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
    }
}
