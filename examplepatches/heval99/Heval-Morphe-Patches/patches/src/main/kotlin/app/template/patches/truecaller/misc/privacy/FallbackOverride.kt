package app.template.patches.truecaller.misc.privacy

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.util.findFreeRegister
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.requireNoBranchTargetAt
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

/**
 * Overrides the boolean fallback argument (the third register) of the getBoolean read at [call]
 * for that read only. R8 shares constant registers between reads, so the register is put back
 * right after the call (after its move-result):
 * - when the register holds a literal loaded in the same block (`const/4 vF, N` with no jump
 *   target between it and the read), the restore loads that literal again;
 * - otherwise it is copied to a free local before and moved back after.
 * ```
 * [move/16 vS, vF]
 * <override(vF)>            # sets vF for this read
 * <the read>(..., vF)
 * move-result vR
 * const/16 vF, N  |  move/16 vF, vS
 * ```
 * When the result goes into vF itself, the old value is dead and nothing is restored.
 */
internal fun MutableMethod.overrideFallback(call: Int, what: String, override: (fallback: String) -> String) {
    val insns = instructions.toList()
    val invoke = insns[call]
    val (callRegisters, fallback) = when (invoke) {
        is FiveRegisterInstruction ->
            listOf(invoke.registerC, invoke.registerD, invoke.registerE).take(invoke.registerCount) to invoke.registerE
        is RegisterRangeInstruction ->
            (invoke.startRegister until invoke.startRegister + invoke.registerCount).toList() to invoke.startRegister + 2
        else -> throw PatchException("$what: the read is not an invoke with registers (${invoke.opcode})")
    }
    requireNoBranchTargetAt(call, what)

    val next = insns.getOrNull(call + 1)
    val result = (next as? OneRegisterInstruction)?.registerA?.takeIf { next.opcode == Opcode.MOVE_RESULT }
    val restoreAt = if (result != null) call + 2 else call + 1

    var save = ""
    val restore = when {
        result == fallback -> null
        else -> literalBefore(call, fallback)?.let { "const/16 v$fallback, 0x${Integer.toHexString(it)}" }
            ?: run {
                val parameterRegisters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
                    if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
                val locals = implementation!!.registerCount - parameterRegisters
                val exclude = (callRegisters + listOfNotNull(result)).distinct().toIntArray()
                val scratch = runCatching { findFreeRegister(call, *exclude) }.getOrNull()
                if (scratch == null || scratch !in 0 until locals || scratch in exclude) {
                    throw PatchException("$what: v$fallback is not a literal and no local is free to keep it")
                }
                save = "move/16 v$scratch, v$fallback\n"
                "move/16 v$fallback, v$scratch"
            }
    }

    // The restore first (it sits after the read), then the prefix, so the indices stay valid.
    if (restore != null) addInstructionsChecked(restoreAt, restore)
    addInstructionsChecked(call, save + override("v$fallback").trimIndent())
}

/**
 * The literal [register] holds at [call] when it was loaded by a const/4 or const/16 in the same
 * block: walking back, the first instruction that sets the register, with no jump target on the way.
 */
private fun MutableMethod.literalBefore(call: Int, register: Int): Int? {
    val insns = implementation!!.instructions
    for (index in call - 1 downTo 0) {
        val insn = insns[index]
        if (insn.opcode.setsRegister() && (insn as? OneRegisterInstruction)?.registerA == register) {
            if (insn.opcode != Opcode.CONST_4 && insn.opcode != Opcode.CONST_16) return null
            return (insn as NarrowLiteralInstruction).narrowLiteral
        }
        // A jump into the stretch between the load and the read could bring another value.
        if (insn.location.labels.isNotEmpty()) return null
        // The setsRegister check misses the wide half (vR-1 of a wide write); be conservative.
        if (insn.opcode.setsWideRegister() && (insn as? OneRegisterInstruction)?.registerA == register - 1) return null
    }
    return null
}
