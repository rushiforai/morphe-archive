package dev.jason.gboardpatches.patches.gboard.features.cursortrackpad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeAbiCatalog
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCursorTrackpadPreferencePatch = bytecodePatch(
    description = "在 enable_scrub_move 字串與 resource Boolean preference read 後套用設定值",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = "Lpnp;",
            name = "av",
            returnType = "Z",
            parameterTypes = listOf("Ljava/lang/String;", "Z", "Z"),
        ).applyCursorTrackpadStringPreferenceOverride()
        findMutableMethodOrThrow(
            classType = "Lpnp;",
            name = "at",
            returnType = "Z",
            parameterTypes = listOf("I"),
        ).applyCursorTrackpadResourcePreferenceOverride()
    }
}

internal fun MutableMethod.applyCursorTrackpadStringPreferenceOverride() {
    injectCursorTrackpadPreferenceOverride(
        runtimeCall = RuntimeCallId.CURSOR_TRACKPAD_RUNTIME_APPLY_OVERRIDDEN_PREFERENCE_VALUE,
        parameterRegister = implementation!!.registerCount - 3,
    )
}

internal fun MutableMethod.applyCursorTrackpadResourcePreferenceOverride() {
    injectCursorTrackpadPreferenceOverride(
        runtimeCall =
            RuntimeCallId.CURSOR_TRACKPAD_RUNTIME_APPLY_OVERRIDDEN_RESOURCE_PREFERENCE_VALUE,
        parameterRegister = implementation!!.registerCount - 1,
    )
}

private fun MutableMethod.injectCursorTrackpadPreferenceOverride(
    runtimeCall: RuntimeCallId,
    parameterRegister: Int,
) {
    val abi = RuntimeAbiCatalog.abi(runtimeCall)
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    val returnIndices = returnInstructionIndices().filter { index ->
        instructions[index].opcode.name.normalized() == "RETURN"
    }
    check(returnIndices.isNotEmpty()) { "Missing RETURN in $definingClass->$name" }

    val invokeIndices = instructions.indices.filter { index ->
        val reference = (instructions[index] as? ReferenceInstruction)?.reference
            as? MethodReference
        reference?.toString() == abi.reference
    }
    if (invokeIndices.isNotEmpty()) {
        check(invokeIndices.size == returnIndices.size) {
            "Malformed partial cursor trackpad preference override in $definingClass->$name"
        }
        returnIndices.forEach { returnIndex ->
            val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
                ?: error("RETURN at $returnIndex does not expose registerA")
            val invokeIndex = returnIndex - 2
            val invoke = instructions.getOrNull(invokeIndex) as? FiveRegisterInstruction
            val reference = (instructions.getOrNull(invokeIndex) as? ReferenceInstruction)
                ?.reference as? MethodReference
            val moveResult = instructions.getOrNull(returnIndex - 1)
                as? OneRegisterInstruction
            check(
                invoke != null && reference?.toString() == abi.reference &&
                    invoke.registerCount == 2 &&
                    invoke.registerC == parameterRegister &&
                    invoke.registerD == resultRegister &&
                    moveResult?.opcode?.name?.normalized() == "MOVE_RESULT" &&
                    moveResult.registerA == resultRegister
            ) {
                "Malformed cursor trackpad preference delegate in $definingClass->$name"
            }
        }
        return
    }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN at $returnIndex does not expose registerA")
        addInstructions(
            returnIndex,
            """
                ${RuntimeCallEmitter.invoke(
                    runtimeCall,
                    "v$parameterRegister, v$resultRegister",
                )}
                move-result v$resultRegister
            """.trimIndent(),
        )
    }
}

private fun String.normalized(): String = uppercase().replace('-', '_')
