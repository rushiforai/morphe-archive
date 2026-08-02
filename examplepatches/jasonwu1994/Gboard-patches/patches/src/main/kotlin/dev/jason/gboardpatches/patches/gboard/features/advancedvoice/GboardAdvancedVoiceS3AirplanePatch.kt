package dev.jason.gboardpatches.patches.gboard.features.advancedvoice

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAdvancedVoiceS3AirplanePatch = bytecodePatch(
    description = "略過 17.7.7 rvv#b() 的飛航模式硬性 veto，保留 stock 網路狀態判斷。",
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    execute {
        findMutableMethodOrThrow(GboardAdvancedVoice1777Bindings.s3NetworkAvailability)
            .applyAdvancedVoiceS3AirplaneModeOverride()
    }
}

internal fun MutableMethod.applyAdvancedVoiceS3AirplaneModeOverride() {
    val instructions = implementation?.instructions
        ?: error("Advanced Voice S3 target has no implementation")
    val airplaneReads = instructions.indices.filter { index ->
        val instruction = instructions[index]
        val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference
        instruction.opcode == Opcode.IGET_BOOLEAN &&
            field?.definingClass == "Lpwi;" &&
            field.name == "c" &&
            field.type == "Z"
    }
    check(airplaneReads.size == 1) {
        "Expected one exact pwi.c airplane read in ${descriptor()}"
    }

    val readIndex = airplaneReads.single()
    val read = instructions[readIndex] as OneRegisterInstruction
    val branch = instructions.getOrNull(readIndex + 1) as? OneRegisterInstruction
    check(branch != null && branch.opcode == Opcode.IF_EQZ &&
        branch.registerA == read.registerA) {
        "Airplane read branch changed in ${descriptor()}"
    }

    val vetoIndex = readIndex + 2
    val veto = instructions.getOrNull(vetoIndex)
        ?: error("Airplane veto is missing in ${descriptor()}")
    if (veto.opcode == Opcode.NOP) {
        return
    }
    check(veto.opcode == Opcode.RETURN && veto is OneRegisterInstruction) {
        "Airplane veto return changed in ${descriptor()}"
    }
    replaceInstruction(vetoIndex, "nop")
}

private fun MutableMethod.descriptor(): String =
    "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
