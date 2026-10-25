package app.template.patches.expertplayer.premium

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_EXPERTPLAYER
import app.template.patches.shared.addInstructionsChecked

@Suppress("unused")
val enablePremiumPatch = bytecodePatch(
    name = "Enable Premium",
    description = "Experimental: unlocks premium features. Server features stay locked.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_EXPERTPLAYER)

    execute {
        // Writes isActive = true before the original field store, so the value stored is always true.
        EntitlementInfoConstructorFingerprint.method.addInstructionsChecked(
            0,
            "const/4 p2, 0x1",
        )
    }
}
