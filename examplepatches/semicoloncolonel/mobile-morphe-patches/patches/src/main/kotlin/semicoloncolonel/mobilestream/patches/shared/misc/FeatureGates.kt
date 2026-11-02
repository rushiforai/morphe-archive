package semicoloncolonel.mobilestream.patches.shared.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method

// Helpers for the "Disable AI" patches, which put a check at the top of each
// app's feature-flag reader.

internal const val AI_FILTER = "Lsemicoloncolonel/mobilestream/extension/shared/misc/AiFeatureFilter;"

private fun Method.parameterRegisterCount() =
    parameterTypes.sumOf { if (it.toString() == "J" || it.toString() == "D") 2 else 1 } +
        if (AccessFlags.STATIC.isSet(accessFlags)) 0 else 1

/**
 * Puts [gate] at the top of the method. The gate may use v0 and jumps to :msp_orig to run
 * the original code. v0 must be a local, not a parameter, so the original code still gets
 * its arguments: a method without locals is refused.
 */
internal fun MutableMethod.prependGate(gate: String) {
    val implementation = implementation ?: throw PatchException("$definingClass->$name has no code")
    if (implementation.registerCount <= parameterRegisterCount()) {
        throw PatchException("$definingClass->$name has no free register for the gate")
    }
    addInstructionsWithLabels(0, gate, ExternalLabel("msp_orig", getInstruction(0)))
}

/** Replaces the method body's start with an immediate return of [smali]'s value. */
internal fun MutableMethod.returnEarly(smali: String) {
    implementation ?: throw PatchException("$definingClass->$name has no code")
    addInstructions(0, smali)
}

/**
 * Runs [action] on every method that [methodFilter] accepts in the classes [classFilter]
 * accepts, and returns how many there were. Classes are collected first and changed after,
 * since mutableClassDefBy swaps the class map entry.
 */
internal fun BytecodePatchContext.forEachMatchingMethod(
    classFilter: (ClassDef) -> Boolean,
    methodFilter: (Method) -> Boolean,
    action: (MutableMethod) -> Unit,
): Int {
    val types = mutableListOf<String>()
    classDefForEach { classDef ->
        if (classFilter(classDef) && classDef.methods.any(methodFilter)) types += classDef.type
    }
    var count = 0
    types.forEach { type ->
        mutableClassDefBy(type).methods.filter(methodFilter).forEach {
            action(it)
            count++
        }
    }
    return count
}

/** The method takes these parameter types and returns [returnType]. */
internal fun Method.hasSignature(returnType: String, vararg parameters: String) =
    this.returnType == returnType && parameterTypes.map { it.toString() } == parameters.toList()
