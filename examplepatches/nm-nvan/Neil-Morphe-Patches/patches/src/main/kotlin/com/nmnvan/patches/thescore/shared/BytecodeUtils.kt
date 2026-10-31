package com.nmnvan.patches.thescore.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

/**
 * Inserts code before the instruction at [index], so that branches which jump to that
 * instruction run the inserted code too. (Plain insertion leaves branch labels on the
 * original instruction, skipping the new code.)
 */
internal fun MutableMethod.addInstructionsAtControlFlowLabel(index: Int, smaliInstructions: String) {
    // Duplicate the original after itself, put the new code between, then remove the original.
    // Its label moves to the next instruction, which is the first new one.
    addInstruction(index + 1, getInstruction(index))
    addInstructionsWithLabels(index + 1, smaliInstructions)
    removeInstruction(index)
}

private fun MutableMethod.indicesOf(opcode: Opcode) = implementation!!.instructions
    .withIndex()
    .filter { it.value.opcode == opcode }
    .map { it.index }
    .also { if (it.isEmpty()) throw PatchException("No $opcode in $this") }

/**
 * Passes every returned object through [extensionMethod], a static method taking and returning
 * one object, e.g. `Lext;->filter(Ljava/util/List;)Ljava/util/List;`.
 *
 * @param castTo type to cast the result to, if the extension method returns a wider type.
 */
internal fun MutableMethod.filterReturnedObjects(extensionMethod: String, castTo: String? = null) {
    indicesOf(Opcode.RETURN_OBJECT).asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$register .. v$register }, $extensionMethod
                move-result-object v$register
            """ + (castTo?.let { "\ncheck-cast v$register, $it" } ?: "")
        )
    }
}

/**
 * Passes every returned int through [extensionMethod], e.g. `Lext;->map(I)I`.
 */
internal fun MutableMethod.filterReturnedInts(extensionMethod: String) {
    indicesOf(Opcode.RETURN).asReversed().forEach { index ->
        val register = getInstruction<OneRegisterInstruction>(index).registerA
        addInstructionsAtControlFlowLabel(
            index,
            """
                invoke-static/range { v$register .. v$register }, $extensionMethod
                move-result v$register
            """
        )
    }
}

/**
 * Calls [extensionMethod] with `this` before every return of a void method (e.g. a constructor).
 */
internal fun MutableMethod.callBeforeReturnVoid(extensionMethod: String) {
    indicesOf(Opcode.RETURN_VOID).asReversed().forEach { index ->
        addInstructionsAtControlFlowLabel(index, "invoke-static/range { p0 .. p0 }, $extensionMethod")
    }
}
