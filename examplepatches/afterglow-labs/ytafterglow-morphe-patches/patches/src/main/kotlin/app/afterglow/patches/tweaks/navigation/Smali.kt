package app.afterglow.patches.tweaks.navigation

import app.morphe.patcher.Match
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction

/*
 * Small smali helpers of the navigation, tab bar, startup, Shorts and privacy hooks.
 */

/** The instruction at [index], as [T]. */
internal inline fun <reified T : Instruction> MutableMethod.instruction(index: Int): T = getInstruction<T>(index)

/** The number a matched `const` instruction loads, such as a resource id or a feature flag. */
internal val Match.InstructionMatch.literal: Long
    get() = (instruction as? WideLiteralInstruction)?.wideLiteral
        ?: throw PatchException("Instruction $index is not a literal: $instruction")

/**
 * An `invoke-static` of [method] with [registers] as its arguments: the short form when every
 * register fits in 4 bits, else the range form, which needs consecutive registers.
 */
internal fun invokeStatic(vararg registers: Int, method: String): String {
    if (registers.size <= 5 && registers.all { it < 16 }) {
        return "invoke-static { ${registers.joinToString { "v$it" }} }, $method"
    }
    val consecutive = registers.indices.all { registers[it] == registers[0] + it }
    if (!consecutive) throw PatchException("Registers ${registers.toList()} need a free register for $method")
    return "invoke-static/range { v${registers.first()} .. v${registers.last()} }, $method"
}

/** Indices of the `const` instructions of [method] that load [literal]. */
internal fun literalLoads(method: Method, literal: Long): List<Int> =
    method.implementation!!.instructions.withIndex().filter { (_, instruction) ->
        instruction is WideLiteralInstruction && instruction is OneRegisterInstruction &&
            instruction.wideLiteral == literal
    }.map { it.index }

/**
 * Passes every value [literal] loads in this method through [descriptor] (`(I)I` or `(J)J`
 * shaped), right after the load. Throws when the method never loads it.
 */
internal fun MutableMethod.overrideLiteralLoads(literal: Long, descriptor: String) {
    val loads = literalLoads(this, literal)
    if (loads.isEmpty()) throw PatchException("$definingClass->$name does not load $literal")
    // From last to first, so the indices still to visit do not move.
    loads.reversed().forEach { index ->
        val register = instruction<OneRegisterInstruction>(index).registerA
        addInstructions(
            index + 1,
            """
                ${invokeStatic(register, method = descriptor)}
                move-result v$register
            """,
        )
    }
}

/**
 * Overrides the result of the feature flag read that uses the flag id loaded at [literalIndex]:
 * the first `move-result` after the load gets passed through [descriptor] (`(Z)Z`). The read must
 * be the next invoke after the load, so an unrelated result is never changed.
 */
internal fun MutableMethod.overrideFlagRead(literalIndex: Int, descriptor: String) {
    val instructions = implementation!!.instructions
    val invokeIndex = (literalIndex + 1 until instructions.size).firstOrNull { index ->
        instructions[index].isInvoke
    } ?: throw PatchException("No flag read after index $literalIndex in $definingClass->$name")
    val result = instructions.getOrNull(invokeIndex + 1)
    if (result?.opcode != Opcode.MOVE_RESULT) {
        throw PatchException("Flag read at $invokeIndex in $definingClass->$name has no boolean result")
    }
    val register = (result as OneRegisterInstruction).registerA
    addInstructions(
        invokeIndex + 2,
        """
            ${invokeStatic(register, method = descriptor)}
            move-result v$register
        """,
    )
}

/** True for any invoke instruction (dexlib2's Opcode.name is the smali name, such as "invoke-virtual"). */
internal val Instruction.isInvoke: Boolean
    get() = (this as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference is
        com.android.tools.smali.dexlib2.iface.reference.MethodReference && opcode.name.startsWith("invoke-")
