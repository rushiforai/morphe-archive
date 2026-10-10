package app.noam.patches.chesscom.misc.rating

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.AccessFlags

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

        // PleaseRateManager's public "should we ask now" check.
        mutableClassDefBy("Lcom/chess/ratedialog/PleaseRateManager;").methods.single {
            AccessFlags.PUBLIC.isSet(it.accessFlags) && it.returnType == "Z" && it.parameterTypes.isEmpty()
        }.apply {
            addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $RATING_PROMPTS->allowed()Z
                    move-result v0
                    if-nez v0, :morphe_rating
                    return v0
                """,
                ExternalLabel("morphe_rating", getInstruction(0)),
            )
        }
    }
}
