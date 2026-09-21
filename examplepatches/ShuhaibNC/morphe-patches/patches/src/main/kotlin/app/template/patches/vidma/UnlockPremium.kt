package app.template.patches.vidma

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.VIDMA_COMPATIBILITY
import app.template.patches.vidma.*
import app.template.patches.shared.clearBody

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Vip Of Vidma",
    description = "Unlock Vip features and removes ads.",
    default = true
) {
    compatibleWith(VIDMA_COMPATIBILITY)

    execute {
        listOf(
            VipFingerprint1,
            VipFingerprint2,
            VipFingerprint3,
            VipFingerprint4,
            VipFingerprint5
        ).forEach { fingerprint ->
            fingerprint.method.apply {
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
}
