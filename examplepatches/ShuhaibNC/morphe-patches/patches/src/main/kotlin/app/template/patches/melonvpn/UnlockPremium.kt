package app.template.patches.melonvpn

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.melonvpn.IsVipOneFingerprint
import app.template.patches.melonvpn.IsVipTwoFingerprint
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Pro",
    description = "Unlimited access to everything. 80+ Servers, Removed Ad, 5x Speed, Unlimited Time",
    default = true
) {
    compatibleWith(Constants.MELON_VPN_COMPATIBILITY)

    // Business logic to unlock premium features.
    execute {
        IsVipOneFingerprint.method.apply {
            clearBody()
            addInstructions(
                0,
                """
                    const/4 v0, 0x1
                    return v0
                """
            )
        }
        IsVipTwoFingerprint.method.apply {
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
