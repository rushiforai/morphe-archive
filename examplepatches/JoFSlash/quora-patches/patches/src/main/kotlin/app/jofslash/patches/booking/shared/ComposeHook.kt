package app.jofslash.patches.booking.shared

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Right after each static call to [targetClass]->[targetName] in this method, calls the static
 * [extensionMethod] with the same first [argCount] arguments (which must be objects, such as a
 * composable's props and its Composer). The argument registers still hold them after the call.
 *
 * @return how many calls were hooked.
 */
internal fun MutableMethod.callAfter(
    targetClass: String,
    targetName: String,
    argCount: Int,
    extensionMethod: String,
): Int {
    val instructions = implementation?.instructions?.toList() ?: return 0
    var hooked = 0
    // From the end, so the indexes of the calls not yet changed stay right.
    instructions.indices.reversed().forEach { index ->
        val insn = instructions[index]
        if (insn.opcode != Opcode.INVOKE_STATIC && insn.opcode != Opcode.INVOKE_STATIC_RANGE) return@forEach
        val reference = (insn as ReferenceInstruction).reference as? MethodReference ?: return@forEach
        if (reference.definingClass != targetClass || reference.name != targetName) return@forEach
        if (reference.parameterTypes.take(argCount).any { it.length == 1 }) {
            throw PatchException("$targetName's first $argCount arguments aren't all objects")
        }
        val call = if (insn.opcode == Opcode.INVOKE_STATIC_RANGE) {
            val start = (insn as RegisterRangeInstruction).startRegister
            "invoke-static/range { v$start .. v${start + argCount - 1} }"
        } else {
            val c = insn as Instruction35c
            val registers = listOf(c.registerC, c.registerD, c.registerE, c.registerF, c.registerG)
                .take(c.registerCount).take(argCount)
            if (registers.size != argCount) throw PatchException("Unexpected call to $targetName")
            "invoke-static { ${registers.joinToString { "v$it" }} }"
        }
        addInstruction(index + 1, "$call, $extensionMethod")
        hooked++
    }
    return hooked
}

/**
 * [callAfter] in every method of the classes whose type starts with [classPrefix]. Throws when
 * nothing was hooked, so a changed app fails loudly.
 */
internal fun BytecodePatchContext.callAfterIn(
    classPrefix: String,
    targetClass: String,
    targetName: String,
    argCount: Int,
    extensionMethod: String,
): Int {
    val classes = mutableListOf<String>()
    classDefForEach { classDef -> if (classDef.type.startsWith(classPrefix)) classes += classDef.type }
    var hooked = 0
    classes.forEach { type ->
        mutableClassDefBy(type).methods.forEach { method ->
            hooked += method.callAfter(targetClass, targetName, argCount, extensionMethod)
        }
    }
    if (hooked == 0) throw PatchException("Couldn't find a call to $targetClass->$targetName in $classPrefix*")
    return hooked
}
