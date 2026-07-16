package app.template.patches.imperihome

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants
import app.template.patches.shared.clearBody

@Suppress("unused")
val imperihomePatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlock all premium features (no unlocker app required).",
    default = true
) {
    compatibleWith(Constants.COMPATIBILITY_IMPERIHOME)

    execute {
        PremiumCheckFingerprint.method.apply {
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
