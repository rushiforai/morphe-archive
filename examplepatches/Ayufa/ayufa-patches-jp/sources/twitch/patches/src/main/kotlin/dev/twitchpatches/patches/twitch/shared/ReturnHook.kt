package dev.twitchpatches.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode

// Adapted from uyu's BytecodeUtils.kt.
internal fun MutableMethod.insertAtReturn(index: Int, instructions: String) {
    val original = getInstruction(index)
    if (original.opcode !in setOf(Opcode.RETURN_VOID, Opcode.RETURN_OBJECT)) {
        throw PatchException("Twitch patches: insertion target is not a supported return.")
    }
    insertBeforeWithLabels(index, instructions)
}

internal fun MutableMethod.insertBeforeWithLabels(index: Int, instructions: String) {
    val original = getInstruction(index)
    addInstruction(index + 1, original)
    addInstructions(index + 1, instructions)
    removeInstruction(index)
}
