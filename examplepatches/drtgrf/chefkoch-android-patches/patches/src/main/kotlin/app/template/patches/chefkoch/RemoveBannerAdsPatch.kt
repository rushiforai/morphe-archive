package app.template.patches.chefkoch

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.template.patches.shared.Constants.COMPATIBILITY_CHEFKOCH

@Suppress("unused")
val removeBannerAdsPatch = patch(
    name = "Remove Banner Ads",
    description = "Removes banner advertisements from the Chefkoch app.",
    default = true
) {
    compatibleWith(COMPATIBILITY_CHEFKOCH)

    execute {
        CkAdmoBannerFingerprint.method.addInstructions(
            0,
            """
                return-void
            """
        )
    }
}
