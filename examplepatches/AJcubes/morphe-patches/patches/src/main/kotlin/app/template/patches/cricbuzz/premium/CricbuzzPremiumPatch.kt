package app.template.patches.cricbuzz.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.CRICBUZZ_COMPATIBILITY

@Suppress("unused")
val cricbuzzPremiumPatch = bytecodePatch(
    name = "Cricbuzz Premium",
    description = "Unlocks premium features like live streaming and premium articles (always up to date with latest version!)"
) {
    compatibleWith(CRICBUZZ_COMPATIBILITY)

    execute {
        IsSubscribedUserFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
