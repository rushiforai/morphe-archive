package app.template.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.toInstructions
import com.android.tools.smali.dexlib2.Opcode

/**
 * Inserts [smali] so it runs on EVERY path that reaches the instruction at
 * [index], including branches and switch cases that jump to a label on it.
 */
fun MutableMethod.addInstructionsAtLabel(index: Int, smali: String) {
    val displaced = implementation!!.instructions[index]
    when (displaced.opcode) {
        Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT, Opcode.MOVE_EXCEPTION ->
            throw PatchException("cannot insert in front of ${displaced.opcode}: it has to stay where it is")
        else -> Unit
    }
    if (smali.lines().any { it.trim().startsWith(":") || Regex(",\\s*:\\w+\\s*$").containsMatchIn(it) }) {
        throw PatchException("addInstructionsAtLabel takes straight-line code only")
    }
    val compiled = smali.toInstructions(this)
    if (compiled.isEmpty()) throw PatchException("nothing to insert")
    replaceInstruction(index, compiled.first())
    addInstructions(index + 1, compiled.drop(1) + displaced)
}

/**
 * Makes a switch case (or any labelled block) run [smali] instead of its own
 * body. [smali] must end by leaving the method (return or throw).
 */
fun MutableMethod.replaceBlockAtLabel(index: Int, smali: String) {
    val last = smali.trim().lines().last().trim()
    if (!last.startsWith("return") && !last.startsWith("throw")) {
        throw PatchException("replacement for a block must leave the method, ends with: $last")
    }
    addInstructionsAtLabel(index, smali)
}
