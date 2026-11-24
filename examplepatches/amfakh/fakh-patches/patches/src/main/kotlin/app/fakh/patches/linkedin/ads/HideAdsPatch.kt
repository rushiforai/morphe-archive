/*
 * Based on Michii Patches by heyymichii, GPLv3:
 * https://github.com/heyymichii/michii-patches
 *
 * Modifications copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.linkedin.ads

import app.fakh.patches.linkedin.shared.Constants.COMPATIBILITY_LINKEDIN
import app.fakh.patches.linkedin.shared.Constants.EXTENSION_PACKAGE
import app.fakh.patches.linkedin.shared.Constants.HIDE_ADS
import app.fakh.patches.linkedin.shared.sduiComponentFilterPatch
import app.fakh.patches.shared.register
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val EXTENSION_CLASS = "$EXTENSION_PACKAGE/HideAdsPatch;"
private const val COLLECTION_TEMPLATE = "Lcom/linkedin/android/pegasus/gen/collection/CollectionTemplate;"
private const val EXTENSION_METHOD =
    "$EXTENSION_CLASS->copyWithoutSponsored(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;"

@Suppress("unused")
val hideAdsPatch = patch(
    name = "Hide ads",
    description = "Removes promoted (sponsored) posts from the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)
    category("Ads")

    dependsOn(sduiComponentFilterPatch)

    execute {
        register(HIDE_ADS)

        // Legacy (RecyclerView) home feed. The server driven feed is handled by the SDUI filter.
        SponsoredDuplicatesFilterFingerprint.let {
            val index = it.instructionMatches.last().index

            // Replace collection.copyWithNewElements(list) in place rather than inserting before it,
            // because branches jump straight to this instruction and would skip inserted code.
            val replacement = when (val call = it.method.getInstruction(index)) {
                is FiveRegisterInstruction ->
                    "invoke-static { v${call.registerC}, v${call.registerD} }, $EXTENSION_METHOD"
                is RegisterRangeInstruction ->
                    "invoke-static/range { v${call.startRegister} .. v${call.startRegister + 1} }, $EXTENSION_METHOD"
                else -> throw IllegalStateException("Unexpected instruction: $call")
            }
            it.method.replaceInstruction(index, replacement)

            // The extension returns Object, so restore the CollectionTemplate type for the verifier.
            val moveResult = it.method.getInstruction<OneRegisterInstruction>(index + 1)
            check(moveResult.opcode == Opcode.MOVE_RESULT_OBJECT) {
                "Expected move-result-object after copyWithNewElements"
            }
            it.method.addInstruction(index + 2, "check-cast v${moveResult.registerA}, $COLLECTION_TEMPLATE")
        }
    }
}
