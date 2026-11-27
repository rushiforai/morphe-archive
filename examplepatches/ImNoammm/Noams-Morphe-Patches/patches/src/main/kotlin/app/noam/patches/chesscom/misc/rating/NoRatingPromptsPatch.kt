package app.noam.patches.chesscom.misc.rating

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.chesscom.misc.settings.settingsPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.fieldReference
import app.noam.patches.chesscom.shared.markFeaturePatched
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

private const val RATING_PROMPTS = "${Constants.EXTENSION_PACKAGE}/misc/RatingPrompts;"
private const val RATE_MANAGER = "Lcom/chess/ratedialog/PleaseRateManager;"

@Suppress("unused")
val noRatingPromptsPatch = bytecodePatch(
    name = "No rating prompts",
    description = "The app doesn't ask you to rate it on Google Play. Switch it in Noam's Patches.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(settingsPatch)

    execute {
        markFeaturePatched("noRatingPromptsPatched")

        // PleaseRateManager's "should we ask now" check is inlined where Home starts: after the
        // feature flag, the manager's conditions object is read and its boolean decides. That
        // boolean becomes "and RatingPrompts.allowed()".
        val checks = mutableListOf<Triple<String, String, Int>>()
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val code = method.implementation?.instructions?.toList() ?: return@forEach
                for (index in 1 until code.size) {
                    val conditions = code[index - 1].fieldReference ?: continue
                    if (code[index - 1].opcode != Opcode.IGET_OBJECT || conditions.definingClass != RATE_MANAGER) continue
                    if (code[index].opcode == Opcode.IGET_BOOLEAN && code[index].fieldReference?.definingClass == conditions.type) {
                        checks += Triple(classDef.type, method.name + method.parameterTypes.joinToString("", "(", ")"), index)
                    }
                }
            }
        }
        val (owner, signature, index) = checks.singleOrNull()
            ?: throw PatchException("Expected one rating prompt check, found ${checks.size}")
        mutableClassDefBy(owner).methods.single { it.name + it.parameterTypes.joinToString("", "(", ")") == signature }.apply {
            val decision = getInstruction<TwoRegisterInstruction>(index).registerA
            addInstructionsWithLabels(
                index + 1,
                """
                    if-eqz v$decision, :morphe_rating
                    invoke-static { }, $RATING_PROMPTS->allowed()Z
                    move-result v$decision
                """,
                ExternalLabel("morphe_rating", getInstruction(index + 1)),
            )
        }
    }
}
