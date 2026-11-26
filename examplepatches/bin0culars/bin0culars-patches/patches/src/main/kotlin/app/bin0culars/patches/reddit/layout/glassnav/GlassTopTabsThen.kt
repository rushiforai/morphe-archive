package app.bin0culars.patches.reddit.layout.glassnav

import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.classDefByOrNull
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private fun isModifierThenRef(ref: MethodReference, modifierType: String): Boolean {
    if (ref.definingClass.toString() != modifierType || ref.returnType.toString() != modifierType) {
        return false
    }
    return ref.parameterTypes.singleOrNull()?.toString() == modifierType
}

private fun findThenRefInInstructions(
    instructions: Iterable<Instruction>,
    modifierType: String,
): MethodReference? = instructions.firstNotNullOfOrNull { inst ->
    val isInterface = inst.opcode == Opcode.INVOKE_INTERFACE || inst.opcode == Opcode.INVOKE_INTERFACE_RANGE
    ((inst as? ReferenceInstruction)?.reference as? MethodReference)
        ?.takeIf { isInterface && isModifierThenRef(it, modifierType) }
}

internal fun findThenRef(
    topBarMethod: MutableMethod,
    wrapperMethod: Method,
    modifierType: String,
): MethodReference? {
    val direct = classDefByOrNull(modifierType)?.methods?.singleOrNull { m ->
        (m.accessFlags and AccessFlags.STATIC.value) == 0 && isModifierThenRef(m, modifierType)
    }
    val directCall = direct ?: findThenRefInInstructions(topBarMethod.instructions, modifierType)
        ?: wrapperMethod.implementation?.instructions?.let { findThenRefInInstructions(it, modifierType) }
    return directCall ?: findThenRefViaHelpers(topBarMethod, wrapperMethod, modifierType)
}

private fun findThenRefViaHelpers(
    topBarMethod: MutableMethod,
    wrapperMethod: Method,
    modifierType: String,
): MethodReference? {
    val extra = wrapperMethod.implementation?.instructions?.toList().orEmpty()
    return (topBarMethod.instructions + extra).firstNotNullOfOrNull { inst ->
        val isStatic = inst.opcode == Opcode.INVOKE_STATIC || inst.opcode == Opcode.INVOKE_STATIC_RANGE
        val ref = ((inst as? ReferenceInstruction)?.reference as? MethodReference)
            ?.takeIf { isStatic && it.returnType.toString() == modifierType }
        val target = ref?.let { r ->
            classDefByOrNull(r.definingClass.toString())?.methods?.firstOrNull { m ->
                m.name == r.name && m.parameterTypes == r.parameterTypes
            }
        }
        target?.implementation?.instructions?.let { findThenRefInInstructions(it, modifierType) }
    }
}
