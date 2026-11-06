package app.bookspiko.patches.books.shared

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction21c
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

/**
 * Registers an instruction reads or writes, in operand order.
 * For invokes this is the argument list, so index 0 is `this` for instance methods.
 */
internal val Instruction.registersUsed: List<Int>
    get() = when (this) {
        is FiveRegisterInstruction ->
            listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
        is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
        is ThreeRegisterInstruction -> listOf(registerA, registerB, registerC)
        is TwoRegisterInstruction -> listOf(registerA, registerB)
        is OneRegisterInstruction -> listOf(registerA)
        else -> emptyList()
    }

internal val Instruction.stringLiteral: String?
    get() = if (opcode == Opcode.CONST_STRING || opcode == Opcode.CONST_STRING_JUMBO) {
        ((this as ReferenceInstruction).reference as StringReference).string
    } else {
        null
    }

/**
 * Where a string constant is expected to flow. Used to make sure a literal still means
 * what it meant when the patch was written before it is rewritten.
 */
internal fun interface LiteralSink {
    fun matches(instruction: Instruction, register: Int): Boolean
}

/**
 * The literal is passed to [definingClass]->[name] as the operand at [operandIndex]
 * (`this` counts as operand 0 for instance methods), or as any operand if null.
 */
internal fun methodArgument(definingClass: String?, name: String, operandIndex: Int? = null) =
    LiteralSink { instruction, register ->
        val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            ?: return@LiteralSink false
        if (definingClass != null && reference.definingClass != definingClass) return@LiteralSink false
        if (reference.name != name) return@LiteralSink false
        val operands = instruction.registersUsed
        if (operandIndex == null) register in operands else operands.getOrNull(operandIndex) == register
    }

internal val filledNewArray = LiteralSink { instruction, register ->
    (instruction.opcode == Opcode.FILLED_NEW_ARRAY || instruction.opcode == Opcode.FILLED_NEW_ARRAY_RANGE) &&
        register in instruction.registersUsed
}

internal val accountConstructorType = methodArgument("Landroid/accounts/Account;", "<init>", 2)

internal val stringEquals = methodArgument("Ljava/lang/String;", "equals")

/**
 * The first instruction after [index] that touches [register], or null when the register is
 * overwritten before being read. The scan is linear, which is exact for the short
 * straight-line sequences these patches target.
 */
internal fun MutableMethod.firstUseOf(index: Int, register: Int): Instruction? {
    for (instruction in instructions.drop(index + 1)) {
        val used = instruction.registersUsed
        if (register !in used) continue
        val onlyWritten = instruction.opcode.setsRegister() &&
            used.first() == register && register !in used.drop(1)
        return if (onlyWritten) null else instruction
    }
    return null
}

/**
 * Replaces every `const-string` of [from] in this method with [to].
 *
 * @param expectedCount How many occurrences the method must contain. A different count means the
 * method changed in a way the patch was not written for, so patching stops instead of guessing.
 * @param sinks If not empty, the first use of each literal must match one of them.
 */
internal fun MutableMethod.replaceStringLiteral(
    from: String,
    to: String,
    vararg sinks: LiteralSink,
    expectedCount: Int = 1,
) {
    val description = "$definingClass->$name"
    val indices = instructions.withIndex()
        .filter { (_, instruction) -> instruction.stringLiteral == from }
        .map { it.index }

    if (indices.size != expectedCount) {
        throw PatchException(
            "Expected $expectedCount occurrence(s) of \"$from\" in $description but found ${indices.size}",
        )
    }

    indices.forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA

        if (sinks.isNotEmpty()) {
            val use = firstUseOf(index, register)
                ?: throw PatchException("\"$from\" in $description is never read")
            if (sinks.none { it.matches(use, register) }) {
                throw PatchException("\"$from\" in $description is used by an unexpected instruction: ${use.opcode}")
            }
        }

        replaceInstruction(index, BuilderInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(to)))
    }
}
