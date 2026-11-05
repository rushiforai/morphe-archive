package dev.hyzor.patches.chesscom.misc.rating

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import dev.hyzor.patches.chesscom.misc.settings.settingsPatch
import dev.hyzor.patches.chesscom.shared.Constants
import dev.hyzor.patches.chesscom.shared.markFeaturePatched

private const val RATING_PROMPTS = "${Constants.EXTENSION_PACKAGE}/misc/RatingPrompts;"

@Suppress("unused")
val noRatingPromptsPatch = bytecodePatch(
    name = "No rating prompts",
    description = "The app doesn't ask you to rate it on Google Play. Switch it in Noam's Patches.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("noRatingPromptsPatched")

        val manager = mutableClassDefBy("Lcom/chess/ratedialog/PleaseRateManager;")

        // The after-game hook that arms the prompt.
        manager.methods.single {
            it.returnType == "V" && it.parameterTypes.map { type -> type.toString() } == listOf("Z")
        }.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $RATING_PROMPTS->allowed()Z
                    move-result v0
                    if-nez v0, :morphe_rating
                    return-void
                """,
                ExternalLabel("morphe_rating", getInstruction(0)),
            )
        }
    }
}
