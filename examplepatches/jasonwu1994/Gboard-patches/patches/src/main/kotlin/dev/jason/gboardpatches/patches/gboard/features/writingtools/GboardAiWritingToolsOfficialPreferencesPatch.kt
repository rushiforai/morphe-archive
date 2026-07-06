package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsOfficialPreferencesPatch = bytecodePatch(
    description = "觀察官方四顆 Writing tools switch 的實際值，供 runtime 決策使用。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectOfficialPreferenceObserver(
            classType = PREFERENCE_MANAGER_CLASS,
            name = "at",
            parameterTypes = listOf("I")
        )
    }
}

context(context: BytecodePatchContext)
private fun injectOfficialPreferenceObserver(
    classType: String,
    name: String,
    parameterTypes: List<String>
) = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = classType,
        name = name,
        returnType = "Z",
        parameterTypes = parameterTypes
    )

    mutableMethod.returnInstructionIndices()
        .asReversed()
        .forEach { returnIndex ->
            val instructions = mutableMethod.implementation?.instructions
                ?: error("No instructions available in $classType.$name")
            val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
                ?: error("RETURN at $returnIndex does not expose registerA")
            mutableMethod.addInstructions(
                returnIndex,
                buildOfficialPreferenceObserverDelegate(resultRegister)
            )
        }
}

private fun buildOfficialPreferenceObserverDelegate(register: Int): String = """
    invoke-static {p1, v$register}, $AI_WRITING_TOOLS_OFFICIAL_PREFS_CLASS->notePreferenceValue(IZ)V
""".trimIndent()
