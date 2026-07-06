package app.paresh.patches.cricbuzz.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.cricbuzz.shared.Constants.COMPATIBILITY_CRICBUZZ

@Suppress("unused")
val cricbuzzPremiumPatch = bytecodePatch(
    name = "Cricbuzz Premium",
    description = "Unlocks premium features like live streaming and premium articles."
) {
    compatibleWith(COMPATIBILITY_CRICBUZZ)

    execute {
        IsSubscribedUserFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
