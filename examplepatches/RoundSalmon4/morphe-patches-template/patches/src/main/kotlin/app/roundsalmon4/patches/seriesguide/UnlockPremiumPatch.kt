package app.roundsalmon4.patches.seriesguide

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.roundsalmon4.patches.shared.Constants.COMPATIBILITY_SERIESGUIDE

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock Premium",
    description = "Unlocks all premium features.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SERIESGUIDE)

    execute {
        HasAccessToPaidFeaturesFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """
        )
    }
}
