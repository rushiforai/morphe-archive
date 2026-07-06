package app.paresh.patches.lumina.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.paresh.patches.lumina.shared.Constants.COMPATIBILITY_LUMINA

@Suppress("unused")
val luminaPremiumPatch = bytecodePatch(
    name = "Lumina Premium",
    description = "Unlocks all premium wallpapers and categories."

) {
    compatibleWith(COMPATIBILITY_LUMINA)

    execute {
        // Bypass the central lifetime premium check — unlocks everything
        LifetimePremiumCheckFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Make all wallpapers appear as free content
        WallpaperIsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Make all categories appear as free
        CategoryIsPremiumFingerprint.method.addInstructions(0, """
            const/4 v0, 0x0
            return v0
        """)

        // Bypass PairIP license check — force responseCode to 0 (success)
        PairipProcessResponseFingerprint.method.addInstructions(0, """
            const/4 p1, 0x0
            return-void
        """)

        // Skip PairIP signature validation entirely
        PairipValidateResponseFingerprint.method.addInstructions(0, """
            return-void
        """)
    }
}
