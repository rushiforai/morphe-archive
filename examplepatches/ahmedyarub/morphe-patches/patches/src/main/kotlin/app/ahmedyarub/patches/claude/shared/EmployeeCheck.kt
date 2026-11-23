package app.ahmedyarub.patches.claude.shared

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val MAX_CONST_4_REGISTER = 15

/**
 * Replaces the employee check's `move-result`, matched at [matchIndex] of this fingerprint, with a constant 1,
 * so this one call site sees an employee account. The check itself, and every other caller, is left alone.
 */
context(_: BytecodePatchContext)
internal fun Fingerprint.forceEmployeeResult(matchIndex: Int) = method.apply {
    val moveResultIndex = instructionMatches[matchIndex].index
    val register = getInstruction<OneRegisterInstruction>(moveResultIndex).registerA
    replaceInstruction(
        moveResultIndex,
        if (register <= MAX_CONST_4_REGISTER) "const/4 v$register, 0x1" else "const/16 v$register, 0x1"
    )
}
