package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsOfficialPreferencesPatch = bytecodePatch(
    description = "觀察 17.7.7 官方 Proofread 與 suggestion-strip Writing Tools 偏好值。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        findMutableMethodOrThrow(
            classType = PREFERENCE_MANAGER_CLASS,
            name = "at",
            returnType = "Z",
            parameterTypes = listOf("I")
        ).applyWritingToolsOfficialPreferenceObserver()
    }
}

internal fun MutableMethod.applyWritingToolsOfficialPreferenceObserver() {
    val instructions = implementation?.instructions
        ?: error("No instructions available in $definingClass->$name")
    val returnIndices = returnInstructionIndices()
    check(returnIndices.isNotEmpty()) { "Missing RETURN in $definingClass->$name" }
    val parameterRegister = implementation!!.registerCount - 1
    val observerIndices = instructions.indices.filter { index ->
        instructions[index].officialMethodDescriptor() == OFFICIAL_OBSERVER_DESCRIPTOR
    }
    val completedReturns = returnIndices.count { returnIndex ->
        val returned = instructions[returnIndex] as? OneRegisterInstruction
        returnIndex > 0 && returned != null &&
            instructions[returnIndex - 1].isExactWritingToolsStaticInvoke(
                OFFICIAL_OBSERVER_DESCRIPTOR,
                parameterRegister,
                returned.registerA,
            )
    }
    if (observerIndices.isNotEmpty()) {
        check(observerIndices.size == returnIndices.size && completedReturns == returnIndices.size) {
            "Malformed partial Writing Tools preference observer in $definingClass->$name"
        }
        return
    }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN at $returnIndex does not expose registerA")
        addInstructions(returnIndex, buildOfficialPreferenceObserverDelegate(resultRegister))
    }
}

private fun buildOfficialPreferenceObserverDelegate(register: Int): String = """
    invoke-static {p1, v$register}, $AI_WRITING_TOOLS_OFFICIAL_PREFS_CLASS->notePreferenceValue(IZ)V
""".trimIndent()

private const val OFFICIAL_OBSERVER_DESCRIPTOR =
    "$AI_WRITING_TOOLS_OFFICIAL_PREFS_CLASS->notePreferenceValue(IZ)V"

private fun com.android.tools.smali.dexlib2.iface.instruction.Instruction.officialMethodDescriptor(): String? =
    ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()
