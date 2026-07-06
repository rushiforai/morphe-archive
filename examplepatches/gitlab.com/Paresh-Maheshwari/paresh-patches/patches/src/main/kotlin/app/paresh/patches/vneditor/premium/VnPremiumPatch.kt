package app.paresh.patches.vneditor.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.vneditor.shared.Constants.COMPATIBILITY_VN

@Suppress("unused")
val vnPremiumPatch = bytecodePatch(
    name = "VN Premium",
    description = "Unlocks premium features, removes watermark, and hides Pro tab."
) {
    compatibleWith(COMPATIBILITY_VN)

    execute {
        // Return true for isPremium — unlocks watermark removal, export quality, template limits
        IsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Hide Pro/Crown tab — force parameter to false so original code sets GONE
        SetShowProItemFingerprint.method.addInstructions(0, """
            const/4 p1, 0x0
        """)
    }
}
