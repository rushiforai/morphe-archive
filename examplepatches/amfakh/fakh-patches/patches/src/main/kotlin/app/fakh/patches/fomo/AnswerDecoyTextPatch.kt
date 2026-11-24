/*
 * Copyright 2026 amfakh
 * SPDX-License-Identifier: GPL-3.0-only
 */

package app.fakh.patches.fomo

import app.fakh.patches.fomo.shared.Constants.COMPATIBILITY_FOMO
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val DECOY_TEXT = "Lapp/fakh/extension/fomo/DecoyText;"

/** React Native's builder of the styled text of a label, which every label of the app goes through. */
private object SpannableFingerprint : Fingerprint(
    definingClass = "Lcom/facebook/react/views/text/TextLayoutManager;",
    name = "createSpannableFromAttributedString",
    returnType = "Landroid/text/Spannable;",
)

/** Adds a reply under the "Kamu pasti hacker" placeholders of blurred reviews. Part of every patch, with no switch. */
internal val answerDecoyTextPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_FOMO)
    extendWith("extensions/extension.mpe")

    execute {
        val method = SpannableFingerprint.method
        val returns = method.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }.map { it.index }
        if (returns.isEmpty()) throw PatchException("FOMO: createSpannableFromAttributedString has no return.")
        // Back to front, so the earlier indexes stay valid while instructions are added.
        returns.asReversed().forEach { index ->
            val register = method.getInstruction<OneRegisterInstruction>(index).registerA
            method.addInstructions(
                index,
                """
                    invoke-static { v$register }, $DECOY_TEXT->replace(Landroid/text/Spannable;)Landroid/text/Spannable;
                    move-result-object v$register
                """,
            )
        }
    }
}
