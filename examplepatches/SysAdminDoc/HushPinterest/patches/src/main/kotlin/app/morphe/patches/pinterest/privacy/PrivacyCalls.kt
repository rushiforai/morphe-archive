/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.privacy

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.sendToStandIn
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

/** A complete method identity, including overloads. */
internal fun MethodReference.identity(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

internal fun Instruction.callReference(): MethodReference? =
    if (opcode in INVOKES) (this as? ReferenceInstruction)?.reference as? MethodReference else null

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE,
    Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
)

/** Prepared outside the class pool, including parsed instructions and preserved method metadata. */
internal data class PrivacyMethodEdit(val original: String, val replacement: ImmutableMethod) {
    fun apply(context: BytecodePatchContext) {
        val owner = context.mutableClassDefBy(replacement.definingClass)
        val method = owner.methods.single { it.identity() == original }
        owner.methods.remove(method)
        owner.methods.add(replacement.toMutable())
    }
}

internal data class PrivacyCallPlan(val edits: List<PrivacyMethodEdit>, val counts: Map<String, Int>)

/** Resolves and assembles every replacement without changing a class in the APK. */
internal fun BytecodePatchContext.planPrivacyCalls(
    targets: Map<String, String>,
    callerAllowed: (String) -> Boolean = { true },
): PrivacyCallPlan {
    val edits = mutableListOf<PrivacyMethodEdit>()
    val counts = mutableMapOf<String, Int>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT) || !callerAllowed(owner.type)) return@classDefForEach
        for (method in owner.methods) {
            val sites = method.implementation?.instructions?.withIndex()?.mapNotNull { (index, instruction) ->
                instruction.callReference()?.identity()?.takeIf { it in targets }?.let { index to it }
            }.orEmpty()
            if (sites.isEmpty()) continue
            val replacement = ImmutableMethod.of(method).toMutable()
            for ((index, target) in sites.asReversed()) {
                val instruction = method.implementation!!.instructions.elementAt(index)
                val standIn = targets.getValue(target)
                val parameters = standIn.substringAfter('(').substringBefore(')')
                val words = Regex("\\[*(?:L[^;]+;|[ZBCSIJFD])").findAll(parameters).sumOf {
                    if (it.value == "J" || it.value == "D") 2 else 1
                }
                val registers = when (instruction) {
                    is RegisterRangeInstruction -> (instruction.startRegister until
                        instruction.startRegister + instruction.registerCount).toList()
                    is FiveRegisterInstruction -> listOf(instruction.registerC, instruction.registerD,
                        instruction.registerE, instruction.registerF, instruction.registerG).take(instruction.registerCount)
                    else -> throw PatchException("Privacy call ${method.identity()} at $index has no supported registers")
                }
                if (registers.size != words || registers.any { it >= method.implementation!!.registerCount } ||
                    standIn.substringAfter(')') != target.substringAfter(')')) {
                    throw PatchException("Privacy call ${method.identity()} at $index has incompatible registers or return type")
                }
                replacement.sendToStandIn(index, standIn)
                counts[target] = counts.getOrDefault(target, 0) + 1
            }
            edits += PrivacyMethodEdit(method.identity(), ImmutableMethod.of(replacement))
        }
    }
    return PrivacyCallPlan(edits.toList(), counts.toMap())
}

/** Replaces calls without borrowing registers or disturbing their following move-result. */
internal fun BytecodePatchContext.redirectPrivacyCalls(
    targets: Map<String, String>,
    callerAllowed: (String) -> Boolean = { true },
): Map<String, Int> = planPrivacyCalls(targets, callerAllowed).also { plan ->
    plan.edits.forEach { it.apply(this) }
}.counts
