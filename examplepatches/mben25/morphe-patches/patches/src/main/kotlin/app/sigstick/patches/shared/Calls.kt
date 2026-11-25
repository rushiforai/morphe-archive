package app.sigstick.patches.shared

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/** Index of the first call to a method named [name] at or after [from]. */
internal fun MutableMethod.indexOfCall(name: String, from: Int = 0): Int =
    (from until instructions.size).firstOrNull { index ->
        ((instructions[index] as? ReferenceInstruction)?.reference as? MethodReference)?.name == name
    } ?: throw PatchException("Call to $name not found in ${this.name}")

/**
 * Replaces the first call to [name] at or after [from] with a nop and returns its index.
 * Only for calls whose result is unused (composables, `List.add`), so no move-result follows.
 * Replacing in place keeps every other index valid.
 */
internal fun MutableMethod.nopCall(name: String, from: Int = 0): Int =
    indexOfCall(name, from).also { replaceInstruction(it, "nop") }
