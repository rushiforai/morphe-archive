package app.kirklandpickles.gboardofflinevoice

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.MethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val NETWORK_CLASS = "Landroid/net/Network;"
private const val CAPABILITIES_CLASS = "Landroid/net/NetworkCapabilities;"
private const val INTERNET_CAPABILITY = 12L
private const val NETWORK_ERROR = "Network has no NET_CAPABILITY_INTERNET capability."

private fun Method.containsNetworkError(): Boolean {
    val instructions = implementation?.instructions ?: return false
    for (instruction in instructions) {
        val value = ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string
        if (value == NETWORK_ERROR) return true
    }
    return false
}

private fun Method.sameAs(other: Method): Boolean {
    if (name != other.name || returnType != other.returnType || parameterTypes.size != other.parameterTypes.size) {
        return false
    }
    return parameterTypes.indices.all { parameterTypes[it].toString() == other.parameterTypes[it].toString() }
}

private fun Instruction.invokeReceiverAndArgument(): Pair<Int, Int>? = when (this) {
    is FiveRegisterInstruction -> if (registerCount == 2) registerC to registerD else null
    is RegisterRangeInstruction -> if (registerCount == 2) startRegister to startRegister + 1 else null
    else -> null
}

/** Boundaries prevent a linear backwards trace from crossing a control-flow merge. */
private fun MethodImplementation.blockStarts(instructions: List<Instruction>): Set<Int> {
    val addresses = ArrayList<Int>(instructions.size)
    var address = 0
    for (instruction in instructions) {
        addresses += address
        address += instruction.codeUnits
    }
    val indices = addresses.withIndex().associate { it.value to it.index }
    val starts = mutableSetOf(0)
    for ((index, instruction) in instructions.withIndex()) {
        if (instruction.opcode in setOf(Opcode.RETURN, Opcode.RETURN_VOID, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)) {
            starts += index + 1
        }
        val offset = instruction as? OffsetInstruction ?: continue
        indices[addresses[index] + offset.codeOffset]?.let { target ->
            starts += target
            val payload = instructions[target] as? SwitchPayload
            payload?.switchElements?.forEach { element ->
                indices[addresses[index] + element.offset]?.let { starts += it }
            }
        }
        starts += index + 1
    }
    for (block in tryBlocks) {
        indices[block.startCodeAddress]?.let { starts += it }
        indices[block.startCodeAddress + block.codeUnitCount]?.let { starts += it }
        for (handler in block.exceptionHandlers) {
            indices[handler.handlerCodeAddress]?.let { starts += it }
        }
    }
    return starts
}

private fun List<Instruction>.integerConstantBefore(
    index: Int,
    targetRegister: Int,
    blockStarts: Set<Int>,
): Long? {
    var register = targetRegister
    for (instructionIndex in index - 1 downTo 0) {
        if (instructionIndex + 1 in blockStarts) return null
        val instruction = this[instructionIndex]
        val destination = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        if (!instruction.opcode.setsRegister()) continue
        if (instruction.opcode.setsWideRegister() && destination + 1 == register) return null
        if (destination != register) continue

        when (instruction.opcode) {
            Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_HIGH16 ->
                return (instruction as NarrowLiteralInstruction).narrowLiteral.toLong()
            Opcode.SGET -> {
                val field = (instruction as ReferenceInstruction).reference as? FieldReference
                return if (field?.definingClass == CAPABILITIES_CLASS &&
                    field.name == "NET_CAPABILITY_INTERNET" && field.type == "I"
                ) INTERNET_CAPABILITY else null
            }
            Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16 ->
                register = (instruction as TwoRegisterInstruction).registerB
            else -> return null
        }
    }
    return null
}

private fun BytecodePatchContext.findNetworkStateMethod(): Pair<ClassDef, Method> {
    var match: Pair<ClassDef, Method>? = null
    classDefForEach { classDef ->
        for (method in classDef.methods) {
            val parameters = method.parameterTypes
            if (parameters.size != 1 || parameters[0].toString() != NETWORK_CLASS) continue
            if (!method.containsNetworkError()) continue
            if (match != null) {
                throw PatchException("Gboard network monitor: found more than one matching method")
            }
            match = classDef to method
        }
    }
    return match ?: throw PatchException("Gboard network monitor: internet-capability check not found")
}

@Suppress("unused")
val offlineSystemVoiceTypingPatch = bytecodePatch(
    name = "Offline system voice typing",
    description = "Makes Gboard use Android's offline speech recognizer for voice typing when its language model is installed.",
    default = true,
) {
    compatibleWith(GBOARD)

    execute {
        val (classDef, method) = findNetworkStateMethod()
        val mutableMethod = mutableClassDefBy(classDef).methods.single { it.sameAs(method) }
        val instructions = mutableMethod.implementation?.instructions?.toList()
            ?: throw PatchException("Gboard network monitor has no implementation")

        val blockStarts = mutableMethod.implementation!!.blockStarts(instructions)
        var internetCall = -1
        val candidates = ArrayList<String>(2)
        for (index in instructions.indices) {
            val instruction = instructions[index]
            val reference = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
            if (reference.definingClass != CAPABILITIES_CLASS || reference.name != "hasCapability" ||
                reference.parameterTypes.size != 1 || reference.parameterTypes[0].toString() != "I" ||
                reference.returnType != "Z"
            ) continue

            val registers = instruction.invokeReceiverAndArgument()
            val capability = registers?.let { instructions.integerConstantBefore(index, it.second, blockStarts) }
            candidates += "$index=${capability?.toString() ?: "unknown"}"
            if (capability == INTERNET_CAPABILITY) {
                if (internetCall >= 0) {
                    throw PatchException("Gboard internet-capability check is ambiguous (calls: ${candidates.joinToString()})")
                }
                internetCall = index
            }
        }

        if (internetCall < 0) {
            throw PatchException("Gboard internet-capability check not found (calls: ${candidates.joinToString()})")
        }
        val resultIndex = internetCall + 1
        val result = instructions.getOrNull(resultIndex)
        if (result?.opcode != Opcode.MOVE_RESULT) {
            throw PatchException("Gboard internet-capability result not found")
        }
        val resultRegister = (result as OneRegisterInstruction).registerA
        if (resultRegister > 255) throw PatchException("Gboard internet-capability result uses an unsupported register")

        val replacement = if (resultRegister <= 15) "const/4 v$resultRegister, 0x0" else "const/16 v$resultRegister, 0x0"
        mutableMethod.replaceInstruction(resultIndex, replacement)
    }
}
