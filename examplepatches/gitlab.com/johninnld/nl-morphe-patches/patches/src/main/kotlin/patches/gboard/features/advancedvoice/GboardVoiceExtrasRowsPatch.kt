package patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.findMutableMethodOrThrow
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isOpcode
import patches.gboard.shared.returnInstructionIndices

/**
 * Removes Gboard's stock "Advanced features / Add punctuation / Automatically switch language" rows
 * from the Standard voice typing page.
 *
 * That page is reached through the Parakeet entry while Parakeet replaces the engine those rows
 * configure, so leaving them there promises behaviour the substituted engine does not provide. The
 * same switches are offered under Patches -> AI & Voice.
 */
internal val gboardVoiceExtrasRowsPatch = bytecodePatch(
    description = "Hide the stock Standard-engine rows under the Parakeet voice typing page.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val fragment = "Lcom/google/android/libraries/inputmethod/preferencewidgets/CommonPreferenceFragment;"
        val method = findMutableMethodOrThrow(
            classType = fragment,
            name = "f",
            returnType = "V",
            parameterTypes = emptyList(),
        )
        val returns = method.returnInstructionIndices().filter {
            method.implementation!!.instructions[it].isOpcode("RETURN_VOID")
        }
        check(returns.isNotEmpty()) { "CommonPreferenceFragment.f has no return" }
        returns.sortedDescending().forEach { index ->
            method.addInstructions(
                index,
                "invoke-static {p0}, Ldev/jason/gboardpatches/extension/advancedvoice/GboardVoiceTypingExtras;->hideStockRows(Ljava/lang/Object;)V",
            )
        }
    }
}
