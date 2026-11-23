package app.bin0culars.patches.reddit.layout.collapseall

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal data class ComposerGroups(val startGroupName: String, val endGroupName: String)

private fun isComposerEndCall(ref: MethodReference?, composerClass: String): Boolean =
    ref != null && ref.definingClass == composerClass &&
        ref.returnType == "V" && ref.parameterTypes.singleOrNull()?.toString() == "Z"

private fun isComposerStartCall(ref: MethodReference?): Boolean =
    ref != null && ref.returnType == "V" && ref.parameterTypes.singleOrNull()?.toString() == "I"

internal fun findComposerGroupNames(method: MutableMethod, firstIndex: Int): ComposerGroups {
    val searchEnd = minOf(method.instructions.size, firstIndex + 5)
    val startGroupEntry = (firstIndex + 1 until searchEnd)
        .mapNotNull { i ->
            val ref = (method.instructions[i] as? ReferenceInstruction)?.reference as? MethodReference
            if (isComposerStartCall(ref)) i to ref!! else null
        }
        .firstOrNull()
        ?: throw PatchException("Could not find startGroupName (I)V call within 4 instructions of comment pill call")

    val startGroupIndex = startGroupEntry.first
    val composerClass = startGroupEntry.second.definingClass

    val endGroupRef = (startGroupIndex + 1 until method.instructions.size)
        .mapNotNull { i -> (method.instructions[i] as? ReferenceInstruction)?.reference as? MethodReference }
        .firstOrNull { isComposerEndCall(it, composerClass) }
        ?: throw PatchException("Could not find matching endGroupName (Z)V call on $composerClass")

    return ComposerGroups(startGroupEntry.second.name, endGroupRef.name)
}
