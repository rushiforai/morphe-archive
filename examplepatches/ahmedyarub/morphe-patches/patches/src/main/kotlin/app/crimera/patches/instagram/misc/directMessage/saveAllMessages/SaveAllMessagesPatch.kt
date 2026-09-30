/*
 * Copyright (C) 2026 piko <https://github.com/crimera/piko>
 *
 * See the included NOTICE file for GPLv3 §7(b) terms that apply to this code.
 */

package app.crimera.patches.instagram.misc.directMessage.saveAllMessages

import app.crimera.patches.instagram.entity.messageInfoEntity.messageInfoEntity
import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

internal object DMLongPressButtonAdderFingerprint : Fingerprint(
    returnType = "V",
    strings = listOf("⏰", "userSession"),
)

@Suppress("unused")
val saveAllMessagesPatch =
    bytecodePatch(
        description = "Enables save option for all direct messages",
    ) {
        compatibleWith(COMPATIBILITY_INSTAGRAM)
        dependsOn(messageInfoEntity)
        execute {

            // Make Save option available for all DM content: the save row is added behind two
            // checks, and the first, whether the item can be saved, is removed.
            DMLongPressButtonAdderFingerprint.method.apply {
                val saveabilityChecks =
                    instructions.filter { instruction ->
                        val index = instruction.location.index
                        instruction.opcode == Opcode.IF_NEZ &&
                            getInstruction(index - 1).opcode == Opcode.IF_EQZ &&
                            getInstruction(index + 1).opcode == Opcode.SGET_OBJECT
                    }
                if (saveabilityChecks.size != 1) {
                    throw PatchException("Expected one save row guard in the DM long-press menu, found ${saveabilityChecks.size}")
                }
                removeInstruction(saveabilityChecks.single().location.index - 1)
            }
        }
    }
