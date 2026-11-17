// Based on bearinmindcat/morphe-patches (GPL-3.0) @ 5f79152, patches/src/main/kotlin/org/ungoogled/patches/samsung/CallRedirects.kt.
// Modified for Heval's Morphe Patches on 2026-11-13: package renamed, call redirectors skip every Heval extension class.

package app.template.patches.shared.samsung

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Descriptor prefix of every extension class (this app's and any other Heval extension merged into it, such as
 * Patch settings). The call redirectors leave those classes alone, so their own Settings / Context / getIdentifier /
 * Window calls are never rewritten into the shims.
 */
internal const val EXTENSION_CLASS_PREFIX = "Lapp/template/extension/"

private val INVOKES = setOf(
    Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE,
    Opcode.INVOKE_STATIC, Opcode.INVOKE_STATIC_RANGE,
)

private fun Any.callKey(): String? {
    if (this !is ReferenceInstruction || opcode !in INVOKES) return null
    val r = reference as? MethodReference ?: return null
    return "${r.definingClass}->${r.name}(${r.parameterTypes.joinToString("")})${r.returnType}"
}

/**
 * Sends every call in the app (not in our extensions) to one of [calls]' keys ("Lowner;->name(params)return", an
 * Android method the phone has but refuses or answers differently off One UI) to its static replacement, which takes
 * the receiver (for an instance method) and then the same arguments. Same registers, so each site only changes its
 * target. Returns how many calls it moved.
 */
internal fun BytecodePatchContext.redirectCalls(calls: Map<String, String>): Int {
    val sites = mutableListOf<Pair<String, Method>>()
    classDefForEach { c ->
        if (c.type.startsWith(EXTENSION_CLASS_PREFIX)) return@classDefForEach
        for (m in c.methods) {
            if (m.implementation?.instructions?.any { it.callKey() in calls } == true) sites += c.type to m
        }
    }
    var moved = 0
    for ((type, method) in sites) {
        val mutable = mutableClassDefBy(type).methods.first {
            it.name == method.name && it.parameterTypes == method.parameterTypes && it.returnType == method.returnType
        }
        val instructions = mutable.implementation!!.instructions
        for (index in instructions.indices) {
            val insn = instructions[index]
            val target = insn.callKey()?.let { calls[it] } ?: continue
            val call = when (insn) {
                is FiveRegisterInstruction ->
                    listOf(insn.registerC, insn.registerD, insn.registerE, insn.registerF, insn.registerG)
                        .take(insn.registerCount).joinToString(", ", "invoke-static { ", " }, $target") { "v$it" }
                is RegisterRangeInstruction ->
                    "invoke-static/range { v${insn.startRegister} .. v${insn.startRegister + insn.registerCount - 1} }, $target"
                else -> throw PatchException("unexpected ${insn.opcode} in $type.${method.name}")
            }
            mutable.replaceInstruction(index, call)
            moved++
        }
    }
    return moved
}
