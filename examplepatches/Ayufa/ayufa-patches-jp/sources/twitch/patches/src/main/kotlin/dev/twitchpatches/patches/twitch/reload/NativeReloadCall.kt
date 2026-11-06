package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.code

internal fun MutableMethod.replaceNativeVolume(index: Int, original: String, replacement: String) {
    val instruction = code().getOrNull(index)
    val registers = instruction as? FiveRegisterInstruction
        ?: throw PatchException("Reload stream: unexpected native volume invocation format.")
    val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        ?: throw PatchException("Reload stream: native volume target missing.")
    val count = implementation?.registerCount ?: 0
    val arguments = listOf(registers.registerC, registers.registerD, registers.registerE, registers.registerF)
    if (instruction.opcode != Opcode.INVOKE_STATIC || registers.registerCount != 4 ||
        target.toString() != original || target.returnType != "V" || target.parameterTypes.size != 4 ||
        target.parameterTypes.first() != "Z" || target.parameterTypes.last() != "I" ||
        target.parameterTypes.drop(1).dropLast(1).any { !it.startsWith("L") } || arguments.any { it >= count })
        throw PatchException("Reload stream: invalid native volume call contract.")
    replaceInstruction(index, "invoke-static {${arguments.joinToString { "v$it" }}}, $replacement")
}
