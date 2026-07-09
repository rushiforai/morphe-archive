package app.template.patches.instapaper

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.INSTAPAPER_COMPATIBILITY

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features (search, speed reading, unlimited highlights).",
    default = true
) {
    compatibleWith(INSTAPAPER_COMPATIBILITY)

    execute {
        runCatching {
            PremiumCheckFingerprint.method.apply {
                removeInstructions(0, instructions.count())
                // Return "1" which the U() method interprets as "subscription active"
                addInstructions(0, "const-string v0, \"1\"\nreturn-object v0")
            }
        }
    }
}