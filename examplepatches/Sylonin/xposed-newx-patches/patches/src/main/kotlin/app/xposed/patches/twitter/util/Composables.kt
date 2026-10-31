package app.xposed.patches.twitter.util

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

private const val COMPOSER = "Landroidx/compose/runtime/Composer;"

/** The bits [mask] of int parameter [parameter]. */
internal data class ParameterBits(val parameter: Int, val mask: Long)

/**
 * How a composable reads one of its parameters. Before running, a composable checks each
 * parameter in turn: if its bit in a `$default` int is set, the default value is used instead;
 * else if its two bits in a `$changed` int are set, the caller has said whether the value
 * changed; else it asks the Composer. A hook that replaces the argument clears [default] and
 * [changed] so the composable takes the new value and compares it with the last one.
 */
internal class ComposableParameter(val changed: ParameterBits?, val default: ParameterBits?)

/**
 * Reads [ComposableParameter] for parameter [index] from the code, because R8 drops and
 * folds the `$changed` and `$default` ints, so their positions can't be derived from the
 * signature.
 */
internal fun Method.composableParameter(index: Int): ComposableParameter {
    val where = "$definingClass->$name"
    val types = parameterTypes.map { it.toString() }
    val composer = types.indexOf(COMPOSER)
    if (composer < 0 || types.lastIndexOf(COMPOSER) != composer) throw PatchException("$where has no single Composer")
    val flags = composer + 1 until types.size
    if (flags.any { types[it] != "I" }) throw PatchException("$where has parameters after the Composer that aren't ints")

    val flow = RegisterFlow(this)
    val instructions = flow.instructions

    /** The value a `Composer.changed(value)` call at [i] checks, or null if [i] is no such call. */
    fun checkedValue(i: Int): Set<Abstract>? {
        val instruction = instructions[i]
        val reference = instruction.methodRef ?: return null
        if (instruction.opcode != Opcode.INVOKE_VIRTUAL && instruction.opcode != Opcode.INVOKE_INTERFACE) return null
        if (reference.returnType != "Z" || reference.parameterTypes.size != 1) return null
        val registers = instruction.argumentRegisters()
        if (flow.valuesAt(i, registers[0]) != setOf(Abstract.Parameter(composer))) return null
        return flow.valuesAt(i, registers[1])
    }

    val checks = instructions.indices.filter { checkedValue(it) != null }
    val check = checks.firstOrNull { checkedValue(it) == setOf(Abstract.Parameter(index)) }
        ?: throw PatchException("$where never asks the Composer whether parameter $index changed")

    // The tests for this parameter sit between the previous parameter's check and its own.
    val tests = mutableSetOf<ParameterBits>()
    for (i in (checks.lastOrNull { it < check } ?: -1) + 1 until check) {
        val instruction = instructions[i]
        if (instruction.opcode != Opcode.IF_EQZ && instruction.opcode != Opcode.IF_NEZ) continue
        val condition = flow.valuesAt(i, (instruction as OneRegisterInstruction).registerA)
        if (Abstract.Any in condition) throw PatchException("$where: can't follow the test at instruction $i")
        val masked = condition.singleOrNull() as? Abstract.Masked ?: continue
        if (masked.parameter in flags) tests += ParameterBits(masked.parameter, masked.mask and 0xffffffffL)
    }

    // A parameter has three bits in a $changed int, after its force bit: two for same, different
    // or static, then one set when its type's stability is unknown, which makes the composable
    // compare by identity instead of equality.
    val changed = tests.filter { test -> (0 until 10).any { test.mask == 0b11L shl (3 * it + 1) } }
        .let { if (it.size > 1) throw PatchException("$where: several \$changed tests for parameter $index") else it.singleOrNull() }
    val stability = changed?.let { ParameterBits(it.parameter, java.lang.Long.highestOneBit(it.mask) shl 1) }
    val others = tests - setOfNotNull(changed, stability)
    val default = others.singleOrNull()?.takeIf { java.lang.Long.bitCount(it.mask) == 1 && it.parameter != changed?.parameter }
    if (others.isNotEmpty() && default == null) {
        throw PatchException("$where: unexpected tests before parameter $index is checked: $others")
    }
    return ComposableParameter(changed, default)
}

/** Smali that clears [bits] in their parameter, using two scratch registers below v16. */
internal fun Method.clearBitsSmali(bits: ParameterBits?, scratch: String, mask: String): String {
    if (bits == null) return ""
    val parameter = parameterRegister(bits.parameter)
    val inverted = bits.mask.toInt().inv()
    val literal = if (inverted < 0) "-0x" + (-inverted.toLong()).toString(16) else "0x" + inverted.toString(16)
    return """
        move/16 $scratch, $parameter
        const $mask, $literal
        and-int/2addr $scratch, $mask
        move/16 $parameter, $scratch
    """
}
