package app.aphelion.patches.hint

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.aphelion.patches.shared.Constants.COMPATIBILITY_APHELION

@Suppress("unused")
val aphelionAdFreeHintUnlock = bytecodePatch(
    name = "Aphelion Ad-Free Hint Unlock",
    description = "Unlocks level hints instantly without watching an ad: the share gate's watch ad action grants the hint immediately, with no ad playback required, even offline.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_APHELION)

    execute {
        EmitHintRewardFingerprint.method.addInstructions(
            EmitHintRewardFingerprint.instructionMatches[0].index + 1,
            """
                invoke-virtual {p2}, Lvc2;->invoke()Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """.trimIndent(),
        )

        ShareGateTouchFingerprint.method.addInstructions(
            ShareGateTouchFingerprint.instructionMatches[2].index + 1,
            "const/4 v0, 0x1",
        )
        ShareGateTouchFingerprint.method.addInstructions(
            ShareGateTouchFingerprint.instructionMatches[0].index + 1,
            "const/4 v5, 0x1",
        )

        ShareGateDrawFingerprint.method.addInstructions(
            ShareGateDrawFingerprint.instructionMatches[0].index + 1,
            "const/4 v1, 0x1",
        )
    }
}
