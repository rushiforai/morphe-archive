package app.asken.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.asken.patches.shared.Constants.ASKEN_COMPATIBILITY

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Unlocks premium features by forcing the local premium status to Premium."
) {
    compatibleWith(ASKEN_COMPATIBILITY)

    execute {
        PremiumStatusParserFingerprint.method.addInstruction(0, "const-string p0, \"2\"")
    }
}
