package app.jofslash.patches.googlehealth.shared

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction35c
import com.android.tools.smali.dexlib2.iface.instruction.formats.Instruction3rc
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference

/** A framework method, as "Lclass;->name(params)return", whose calls are sent to a static method. */
internal class Redirect(
    val definingClass: String,
    val name: String,
    val parameters: List<String>,
    val returnType: String,
    /** The static method that gets the receiver first, then the same arguments. */
    val targetClass: String,
    val targetName: String,
)

private fun Redirect.matches(reference: MethodReference) =
    reference.definingClass == definingClass && reference.name == name &&
            reference.returnType == returnType && reference.parameterTypes.map { it.toString() } == parameters

private fun Instruction.redirectFor(redirects: List<Redirect>): Redirect? {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return null
    val reference = (this as ReferenceInstruction).reference as? MethodReference ?: return null
    return redirects.firstOrNull { it.matches(reference) }
}

/**
 * Replaces every invoke-virtual of a [Redirect]'s method in the app with an invoke-static of its
 * target, which takes the receiver as its first parameter. The registers stay the same, so a
 * move-result after the call keeps working. Classes in [skipPackage] (the extension) keep their calls.
 *
 * @return how many calls were changed.
 */
internal fun BytecodePatchContext.redirectCalls(
    redirects: List<Redirect>,
    skipPackage: String = "Lapp/jofslash/",
): Int {
    val targets = mutableListOf<ClassDef>()
    classDefForEach { classDef ->
        if (classDef.type.startsWith(skipPackage)) return@classDefForEach
        val hit = classDef.methods.any { method ->
            method.implementation?.instructions?.any { it.redirectFor(redirects) != null } == true
        }
        if (hit) targets += classDef
    }

    var changed = 0
    targets.forEach { classDef ->
        mutableClassDefBy(classDef).methods.forEach { method ->
            val instructions = method.implementation?.instructions?.toList() ?: return@forEach
            instructions.forEachIndexed { index, insn ->
                val redirect = insn.redirectFor(redirects) ?: return@forEachIndexed
                val target = ImmutableMethodReference(
                    redirect.targetClass,
                    redirect.targetName,
                    listOf(redirect.definingClass) + redirect.parameters,
                    redirect.returnType,
                )
                val replacement = when (insn) {
                    is Instruction35c -> BuilderInstruction35c(
                        Opcode.INVOKE_STATIC, insn.registerCount,
                        insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG,
                        target,
                    )
                    is Instruction3rc -> BuilderInstruction3rc(
                        Opcode.INVOKE_STATIC_RANGE, insn.startRegister, insn.registerCount, target,
                    )
                    else -> return@forEachIndexed
                }
                method.replaceInstruction(index, replacement)
                changed++
            }
        }
    }
    return changed
}
