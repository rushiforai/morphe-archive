package app.noam.patches.spotify.shared

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction

/** Minimal instruction helpers, so the patches only depend on Morphe Patcher itself. */
internal fun Method.instructionList(): List<Instruction> =
    implementation?.instructions?.toList()
        ?: throw PatchException("$name has no implementation")

internal fun Method.indexOfFirst(startIndex: Int = 0, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in startIndex until instructions.size) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

internal fun Method.indexOfFirstOrThrow(
    startIndex: Int = 0,
    description: String,
    predicate: (Instruction) -> Boolean,
): Int = indexOfFirst(startIndex, predicate).also {
    if (it < 0) throw PatchException("Could not find $description in $name")
}

internal fun Method.indexOfLast(endIndex: Int, predicate: (Instruction) -> Boolean): Int {
    val instructions = instructionList()
    for (index in (endIndex - 1) downTo 0) {
        if (predicate(instructions[index])) return index
    }
    return -1
}

/** Rewrites a `return "..."` extension method to return [value] instead. */
internal fun MutableMethod.returnString(value: String) {
    replaceInstruction(0, "const-string v0, \"$value\"")
}
