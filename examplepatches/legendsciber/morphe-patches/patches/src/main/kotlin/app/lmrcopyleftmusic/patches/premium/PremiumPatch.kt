package app.lmrcopyleftmusic.patches.premium

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.lmrcopyleftmusic.patches.shared.Constants.COMPATIBILITY_LMR

@Suppress("unused")
val lmrPremiumPatch = bytecodePatch(
    name = "Premium",
    description = "Unlocks premium permanently: ad-free playback, no premium prompts and no active subscription requirement. The re-sign tamper check is also neutralised so the app does not fall back into limited mode after patching.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LMR)

    execute {
        MainActivityPremiumFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        RenderPremiumFingerprint.method.addInstructions(0, "const/4 p1, 0x1")

        val fieldInitIndex = PremiumFieldInitializationFingerprint.instructionMatches[0].index
        PremiumFieldInitializationFingerprint.method.addInstructions(fieldInitIndex, "const/4 v0, 0x1")
        PremiumFieldInitializationFingerprint.method.addInstructions(fieldInitIndex + 2, "const/4 v0, 0x0")

        SignatureValidationFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )

        PremiumStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
    }
}
