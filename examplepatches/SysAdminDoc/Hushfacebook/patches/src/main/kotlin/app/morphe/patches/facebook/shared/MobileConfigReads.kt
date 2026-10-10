/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.shared

import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

/** Facebook's MobileConfig reader. The class keeps its name; its methods are Redex names. */
internal const val MOBILE_CONFIG = "Lcom/facebook/mobileconfig/factory/MobileConfigUnsafeContext;"

private const val OBJECT = "Ljava/lang/Object;"

/** The most a helper that only casts the config and asks it can hold: cast, ask, result, box, its result, return. */
private const val HELPER_SIZE = 6

private val STATIC_CALLS = setOf(Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE)
private val INTERFACE_CALLS = setOf(Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE)

/**
 * Whether [instruction] reads one of Facebook's MobileConfig values, answering [returnType], by its
 * long id. Up to 581 such a read is a static call on [MOBILE_CONFIG] itself taking the config as an
 * Object and the id, and 582 still has some of those. 582's Redex inlined or moved the rest, so
 * three more forms count:
 *
 * - the config's own interface method taking the id, on a config cast in place (582's `B4j(J)Z`);
 * - a static helper elsewhere taking the config typed and the id (`LX/48Z;->A0h`, which boxes the
 *   answer);
 * - a static helper on a utility class taking an Object and the id, whose body casts it to the
 *   config and asks the interface (`LX/3gg;->A1I`). Only [classOf] sees that body, so without it
 *   this form doesn't count.
 */
internal fun readsMobileConfig(
    instruction: Instruction,
    returnType: String,
    classOf: ((String) -> ClassDef?)? = null,
): Boolean {
    val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    if (call.returnType != returnType) return false
    val parameters = call.parameterTypes.map { it.toString() }
    if (instruction.opcode in INTERFACE_CALLS) return call.definingClass == MOBILE_CONFIG && parameters == listOf("J")
    if (instruction.opcode !in STATIC_CALLS) return false
    return when {
        parameters == listOf(MOBILE_CONFIG, "J") -> true
        parameters != listOf(OBJECT, "J") -> false
        call.definingClass == MOBILE_CONFIG -> true
        else -> classOf?.invoke(call.definingClass)?.methods?.firstOrNull { it.isCalledBy(call) }?.let(::castsToConfig) == true
    }
}

private fun Method.isCalledBy(call: MethodReference): Boolean =
    name == call.name && returnType == call.returnType &&
        parameterTypes.map { it.toString() } == call.parameterTypes.map { it.toString() }

/** Whether [method] is a static helper that only casts its Object to the config and asks the config's interface. */
private fun castsToConfig(method: Method): Boolean {
    if (!AccessFlags.STATIC.isSet(method.accessFlags)) return false
    val code = method.implementation?.instructions?.toList() ?: return false
    return code.size <= HELPER_SIZE &&
        code.any { it.opcode == Opcode.CHECK_CAST && ((it as ReferenceInstruction).reference as TypeReference).type == MOBILE_CONFIG } &&
        code.any { instruction ->
            val asked = (instruction as? ReferenceInstruction)?.reference as? MethodReference
            instruction.opcode in INTERFACE_CALLS && asked != null && readsMobileConfig(instruction, asked.returnType)
        }
}
