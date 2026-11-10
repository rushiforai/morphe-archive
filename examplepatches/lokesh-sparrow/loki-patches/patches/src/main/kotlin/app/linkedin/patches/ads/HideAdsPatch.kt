/*
 * Copyright (C) 2026 Lokesh Sparrow
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

package app.linkedin.patches.ads

import app.linkedin.patches.shared.Constants.COMPATIBILITY_LINKEDIN
import app.linkedin.patches.shared.Constants.EXTENSION_PACKAGE
import app.linkedin.patches.shared.markIncluded
import app.linkedin.patches.shared.sduiComponentFilterPatch
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

private const val COLLECTION = "Lcom/linkedin/android/pegasus/gen/collection/CollectionTemplate;"

/** Drop-in for `copyWithNewElements`: same collection without the promoted items. */
private const val FILTERED_COPY =
    "$EXTENSION_PACKAGE/HideAdsPatch;->copyWithoutSponsored(Ljava/lang/Object;Ljava/util/List;)Ljava/lang/Object;"

/** The call rewritten in place: the receiver collection stays the first argument of the static method. */
private fun callWith(receiver: String, list: String) = "invoke-static { $receiver, $list }, $FILTERED_COPY"

@Suppress("unused")
val hideAdsPatch = bytecodePatch(
    name = "Hide ads",
    description = "Removes sponsored (promoted) posts from the feed.",
    default = true
) {
    compatibleWith(COMPATIBILITY_LINKEDIN)

    dependsOn(sduiComponentFilterPatch)

    execute {
        markIncluded("isHideAdsIncluded")

        // The classic RecyclerView feed; the server driven feed goes through the SDUI filter instead.
        sponsoredDuplicatesFilter.let { fingerprint ->
            val method = fingerprint.method
            val at = fingerprint.instructionMatches.last().index
            val copy = method.getInstruction(at)

            // Rewritten where it stands rather than preceded by extra code: the branches around this call
            // jump straight at it, and they would jump over anything inserted before it.
            val replacement = when (copy) {
                is FiveRegisterInstruction -> callWith("v${copy.registerC}", "v${copy.registerD}")
                is RegisterRangeInstruction ->
                    "invoke-static/range { v${copy.startRegister} .. v${copy.startRegister + 1} }, $FILTERED_COPY"
                else -> throw IllegalStateException("Unexpected instruction: $copy")
            }
            method.replaceInstruction(at, replacement)

            // The extension answers with Object; give the verifier back the CollectionTemplate type.
            val result = method.getInstruction<OneRegisterInstruction>(at + 1)
            check(result.opcode == Opcode.MOVE_RESULT_OBJECT) { "Expected move-result-object after copyWithNewElements" }
            method.addInstruction(at + 2, "check-cast v${result.registerA}, $COLLECTION")
        }
    }
}
