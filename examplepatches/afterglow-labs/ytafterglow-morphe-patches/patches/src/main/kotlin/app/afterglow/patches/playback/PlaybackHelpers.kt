package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/*
 * Small bytecode helpers for the playback tweaks: forwarding a flag's value or a method's
 * result through an extension method, and returning early when the extension says so.
 */

internal const val EXTENSION_PLAYBACK = "$EXTENSION_PACKAGE/playback"

/** `invoke-static` with one register, in the range form when the register is above v15. */
internal fun invokeStaticOne(register: Int, descriptor: String) =
    if (register < 16) "invoke-static { v$register }, $descriptor"
    else "invoke-static/range { v$register .. v$register }, $descriptor"

/** Indexes of every instruction that loads [literal]. */
internal fun Method.literalIndices(literal: Long): List<Int> =
    implementation?.instructions?.withIndex()?.filter { (_, instruction) ->
        (instruction as? WideLiteralInstruction)?.wideLiteral == literal
    }?.map { it.index } ?: emptyList()

/**
 * Passes the boolean result of the flag check that reads the literal at [literalIndex] through
 * [descriptor] (`(Z)Z`), right after the result is moved into its register.
 */
internal fun MutableMethod.overrideFlagAfterLiteral(literalIndex: Int, descriptor: String) {
    val instructions = implementation!!.instructions
    val moveResult = (literalIndex until minOf(instructions.size, literalIndex + 8)).firstOrNull { index ->
        instructions[index].opcode == Opcode.MOVE_RESULT
    } ?: throw PatchException("No flag result after the literal at $literalIndex in $this")
    val register = getInstruction<OneRegisterInstruction>(moveResult).registerA
    addInstructions(
        moveResult + 1,
        """
            ${invokeStaticOne(register, descriptor)}
            move-result v$register
        """,
    )
}

/** Passes every boolean this method returns through [descriptor] (`(Z)Z`). */
internal fun MutableMethod.overrideReturnedBoolean(descriptor: String) {
    if (returnType != "Z") throw PatchException("$this does not return a boolean")
    val returns = implementation!!.instructions.withIndex()
        .filter { (_, instruction) -> instruction.opcode == Opcode.RETURN }
        .map { it.index }
    if (returns.isEmpty()) throw PatchException("$this has no return")
    returns.asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                ${invokeStaticOne(register, descriptor)}
                move-result v$register
            """,
        )
    }
}

/**
 * Makes the method return at once when [condition] (`()Z`) is true: `return-void`, or
 * [returnValue] (0 or 1) for a boolean method. Needs one register that is free at the start,
 * which every method with a local has.
 */
internal fun MutableMethod.returnEarlyWhen(condition: String, returnValue: Int = 0) {
    val parameterRegisters = parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2L else 1L }.toInt() +
        if (com.android.tools.smali.dexlib2.AccessFlags.STATIC.isSet(accessFlags)) 0 else 1
    if (implementation!!.registerCount - parameterRegisters < 1) {
        throw PatchException("No free register at the start of $this")
    }
    val returnInstruction = when (returnType) {
        "V" -> "return-void"
        "Z" -> "const/4 v0, 0x$returnValue\n    return v0"
        else -> throw PatchException("Cannot return early from $this")
    }
    addInstructionsWithLabels(
        0,
        """
            invoke-static { }, $condition
            move-result v0
            if-eqz v0, :afterglow_continue
            $returnInstruction
            :afterglow_continue
            nop
        """,
    )
}
