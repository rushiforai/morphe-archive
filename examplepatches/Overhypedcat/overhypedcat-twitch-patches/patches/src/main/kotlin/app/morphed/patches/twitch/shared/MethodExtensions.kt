package app.morphed.patches.twitch.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Fails the patch if any instruction writes [register]. Code added before a return reads a parameter
 * register (usually `this`) there; if the app's compiler reused it for another value, the call would
 * get the wrong object and Android would refuse to load the class. A clear patch error is better.
 */
internal fun MutableMethod.checkRegisterNotReused(register: Int) {
    implementation!!.instructions.forEachIndexed { index, instruction ->
        if (!instruction.opcode.setsRegister() || instruction !is OneRegisterInstruction) return@forEachIndexed
        val written = instruction.registerA
        val wide = instruction.opcode.setsWideRegister()
        check(written != register && !(wide && written + 1 == register)) {
            "$definingClass->$name reuses v$register (instruction $index, ${instruction.opcode.name}); " +
                "the patch needs an update for this app version"
        }
    }
}

/** Indices of every [opcode] instruction, last first so inserting code keeps them valid. */
internal fun MutableMethod.indicesOf(opcode: Opcode): List<Int> {
    val indices = implementation!!.instructions
        .withIndex()
        .filter { it.value.opcode == opcode }
        .map { it.index }
        .reversed()
    check(indices.isNotEmpty()) { "$name has no ${opcode.name}" }
    return indices
}

/**
 * Runs [smali] right before the return instruction at [returnIndex], on every path that reaches it.
 *
 * Inserting before a return is not enough: branches that jump to the return keep pointing at it and
 * skip the inserted code. So the return is replaced by the first new instruction (which keeps the
 * jump target) and the rest, followed by the original return, is added after it.
 */
internal fun MutableMethod.addInstructionsBeforeReturn(returnIndex: Int, smali: String) {
    val returnInstruction = getInstruction(returnIndex)
    val returnLine = when (returnInstruction.opcode) {
        Opcode.RETURN_VOID -> "return-void"
        Opcode.RETURN_OBJECT -> "return-object v${(returnInstruction as OneRegisterInstruction).registerA}"
        Opcode.RETURN -> "return v${(returnInstruction as OneRegisterInstruction).registerA}"
        else -> error("Not a supported return at $returnIndex in $name: ${returnInstruction.opcode}")
    }
    val lines = smali.lines().map { it.trim() }.filter { it.isNotEmpty() }
    check(lines.isNotEmpty()) { "Nothing to add before the return in $name" }

    replaceInstruction(returnIndex, lines.first())
    addInstructions(returnIndex + 1, (lines.drop(1) + returnLine).joinToString("\n"))
}
