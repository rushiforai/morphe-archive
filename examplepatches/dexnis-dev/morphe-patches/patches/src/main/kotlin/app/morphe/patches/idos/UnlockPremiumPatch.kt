package app.morphe.patches.idos

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.Constants.COMPATIBILITY_IDOS

@Suppress("unused")
val unlockPremiumPatch = bytecodePatch(
    name = "Unlock premium",
    description = "Spoofs the premium subscription check.",
    default = true
) {
    compatibleWith(COMPATIBILITY_IDOS)
    execute {
        CommonDbPremiumFingerprint.method.addInstructions(
            0,
            """
            const/4 v0, 0x0
            return v0
            """.trimIndent()
        )
        PremiumTextFingerprint.method.addInstructions(
            0,
            """
            const-string p1, "Reklamy jsou vypnuty"
            const/4 p2, 0x0
            """.trimIndent()
        )
    }
}
