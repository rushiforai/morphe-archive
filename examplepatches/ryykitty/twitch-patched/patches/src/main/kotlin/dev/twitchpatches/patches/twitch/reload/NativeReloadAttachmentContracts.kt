package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.isInstance
import dev.twitchpatches.patches.twitch.shared.uniqueHook

internal fun requireReloadParametersPreserved(method: Method, parameters: Set<Int>) {
    if (!method.isInstance(method.parameterTypes.map { it.toString() }, "V") ||
        method.parameterTypes.any { !it.startsWith("L") } || method.code().none { it.opcode == Opcode.RETURN_VOID })
        throw PatchException("Reload stream: native attachment signature changed.")
    val registers = method.implementation?.registerCount
        ?: throw PatchException("Reload stream: native attachment has no code.")
    val firstParameter = registers - method.parameterTypes.size - 1
    val protected = parameters.map { firstParameter + it }.toSet()
    if (parameters.any { it < 0 || it > method.parameterTypes.size } || firstParameter < 0 || method.code().any {
            val destination = (it as? OneRegisterInstruction)?.registerA
            destination != null && it.opcode.setsRegister() &&
                (destination in protected || (it.opcode.setsWideRegister() && destination + 1 in protected))
        }) throw PatchException("Reload stream: native attachment overwrites a required parameter register.")
}

internal fun resolveReloadDelegate(method: Method): FieldReference {
    requireReloadParametersPreserved(method, setOf(0))
    if (method.parameterTypes.size != 1)
        throw PatchException("Reload stream: native delegate attachment parameter changed.")
    val registers = method.implementation?.registerCount
        ?: throw PatchException("Reload stream: native delegate attachment has no code.")
    val stores = method.code().withIndex().filter { (_, instruction) ->
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        val operands = instruction as? TwoRegisterInstruction
        instruction.opcode == Opcode.IPUT_OBJECT && field?.definingClass == method.definingClass &&
            field.type == method.parameterTypes[0].toString() && operands?.registerA == registers - 1 &&
            operands.registerB == registers - 2
    }
    val store = stores.uniqueHook("native saved view delegate assignment")
    if (method.code().take(store.index).any {
            !it.opcode.canContinue() || it is com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction ||
                (it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == registers - 1)
        }) throw PatchException("Reload stream: saved delegate assignment control flow changed.")
    val field = (store.value as ReferenceInstruction).reference as FieldReference
    if (method.code().count { it.opcode == Opcode.IPUT_OBJECT &&
            (it as? ReferenceInstruction)?.reference?.toString() == field.toString() } != 1 ||
        AccessFlags.STATIC.isSet(method.accessFlags))
        throw PatchException("Reload stream: saved delegate assignment is ambiguous.")
    return field
}
