package app.pablobaro.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.Reference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.w3c.dom.NodeList

// Backports of helpers from morphe-patcher 2.x and morphe-patches-library (both GPLv3),
// so these patches build against the morphe-patcher 1.x that the Spicetify patches use.

internal inline fun <reified T : Reference> Instruction.getReference() =
    (this as? ReferenceInstruction)?.reference as? T

/**
 * The actual register number of p0 for this method.
 */
internal val Method.p0Register: Int
    get() {
        val implementation = implementation ?: throw IllegalStateException("Method has no implementation: $this")
        var parameterRegisters = 0
        for (type in parameterTypes) {
            parameterRegisters += if (type.toString() == "J" || type.toString() == "D") 2 else 1
        }
        if (!AccessFlags.STATIC.isSet(accessFlags)) parameterRegisters += 1

        return implementation.registerCount - parameterRegisters
    }

/**
 * Overrides the first instructions of a method with a constant boolean return value.
 */
internal fun MutableMethod.returnEarly(value: Boolean) {
    check(returnType == "Z") { "Mismatch between override type and method return type" }
    addInstructions(
        0,
        """
            const/4 v0, ${if (value) "0x1" else "0x0"}
            return v0
        """,
    )
}

internal fun Method.indexOfFirstInstruction(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    var instructions = implementation?.instructions ?: return -1
    if (startIndex != 0) instructions = instructions.drop(startIndex)
    val index = instructions.indexOfFirst(filter)

    return if (index >= 0) startIndex + index else -1
}

internal fun Method.indexOfFirstInstructionOrThrow(startIndex: Int = 0, filter: Instruction.() -> Boolean): Int {
    val index = indexOfFirstInstruction(startIndex, filter)
    if (index < 0) throw PatchException("Could not find instruction index in $this")

    return index
}

internal fun Method.indexOfFirstStringInstruction(string: String) =
    indexOfFirstInstruction { getReference<StringReference>()?.string == string }

/**
 * @return The mutable method for this method call reference.
 */
internal fun MethodReference.getMutableMethod(context: BytecodePatchContext): MutableMethod =
    context.mutableClassDefBy(definingClass).methods.first { method ->
        MethodUtil.methodSignaturesMatch(method, this)
    }

/**
 * Inserts instructions at a given index, using the existing control flow label at that index.
 */
internal fun MutableMethod.addInstructionsAtControlFlowLabel(
    insertIndex: Int,
    instructions: String,
    vararg externalLabels: ExternalLabel,
) {
    // Duplicate the original instruction and add it at the +1 index.
    addInstruction(insertIndex + 1, getInstruction(insertIndex))

    // Add the patch code at the index of the duplicate, so it uses the original control flow label.
    addInstructionsWithLabels(insertIndex + 1, instructions, *externalLabels)

    // Remove the original, non duplicated instruction.
    removeInstruction(insertIndex)
}

internal fun NodeList.asSequence() = (0 until length).asSequence().map { item(it) }
