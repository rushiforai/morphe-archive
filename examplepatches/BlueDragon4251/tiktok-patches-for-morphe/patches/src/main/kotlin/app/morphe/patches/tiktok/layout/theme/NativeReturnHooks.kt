package app.morphe.patches.tiktok.layout.theme

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal fun MutableMethod.hookNativeReturns(hook: String) {
    implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
        .map { it.index to (it.value as OneRegisterInstruction).registerA }.toList()
        .asReversed().forEach { (index, register) ->
            // Keep the original return's MethodLocation: the normal sidebar path jumps
            // directly here. Inserting before it lets that jump bypass registration.
            replaceInstruction(index, "invoke-static/range {v$register .. v$register}, Lapp/morphe/extension/tiktok/theme/ThemeNativeTargets;->$hook(Landroid/view/View;)V")
            addInstruction(index + 1, "return-object v$register")
        }
    verifyNativeReturnHooks(this, hook)
}

/** Verify the rewritten control flow, not just the presence of a hook before each return. */
internal fun verifyNativeReturnHooks(method: Method, hook: String) {
    val body = method.implementation ?: throw PatchException("Native root has no body: $method")
    val instructions = body.instructions.toList()
    var address = 0
    val addresses = instructions.map { instruction ->
        address.also { address += instruction.codeUnits }
    }
    val byAddress = addresses.zip(instructions).toMap()
    val entryPoints = mutableSetOf(0)
    body.tryBlocks.forEach { block ->
        block.exceptionHandlers.forEach { entryPoints += it.handlerCodeAddress }
    }
    instructions.forEachIndexed { index, instruction ->
        if (instruction is OffsetInstruction) {
            val origin = addresses[index]
            val target = origin + instruction.codeOffset
            if (instruction.opcode == Opcode.PACKED_SWITCH || instruction.opcode == Opcode.SPARSE_SWITCH) {
                val payload = byAddress[target] as? SwitchPayload
                    ?: throw PatchException("Native root has an invalid switch: $method")
                payload.switchElements.forEach { entryPoints += origin + it.offset }
            } else {
                entryPoints += target
            }
        }
    }
    var returns = 0
    instructions.forEachIndexed { index, instruction ->
        if (instruction.opcode == Opcode.RETURN_OBJECT) {
            returns++
            val previous = instructions.getOrNull(index - 1)
            val reference = (previous as? ReferenceInstruction)?.reference as? MethodReference
            val registers = previous as? RegisterRangeInstruction
            val register = (instruction as OneRegisterInstruction).registerA
            if (addresses[index] in entryPoints || previous?.opcode != Opcode.INVOKE_STATIC_RANGE ||
                reference == null || reference.definingClass != "Lapp/morphe/extension/tiktok/theme/ThemeNativeTargets;" ||
                reference.name != hook || reference.parameterTypes != listOf("Landroid/view/View;") ||
                reference.returnType != "V" || registers == null || registers.startRegister != register || registers.registerCount != 1) {
                throw PatchException("Native $hook return can bypass registration at ${addresses[index]}: $method")
            }
        }
    }
    if (returns == 0) throw PatchException("Native $hook root has no object returns: $method")
    println("[BlueIT Native Return Contract] $hook: $returns returns protected from branch/handler bypass")
}
