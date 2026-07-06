package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsFlagValuePatch = bytecodePatch(
    description = "依官方四顆 Writing tools switch 與 runtime 設定覆寫 mky#g()。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectFlagValueOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectFlagValueOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = FLAG_VALUE_CLASS,
        name = "g",
        returnType = "Ljava/lang/Object;",
        parameterTypes = emptyList()
    )

    mutableMethod.addInstructions(0, PRESERVE_RECEIVER_DELEGATE)

    val instructions = mutableMethod.implementation?.instructions
        ?: error("No instructions available in mky.g")
    val returnIndices = mutableMethod.returnInstructionIndices()
        .filter { index ->
            instructions[index].opcode.name.uppercase().replace('-', '_') == "RETURN_OBJECT"
        }
    check(returnIndices.isNotEmpty()) { "Could not resolve RETURN_OBJECT in mky.g" }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN_OBJECT at $returnIndex does not expose registerA")
        mutableMethod.addInstructions(returnIndex, buildFlagValueDelegate(resultRegister))
    }
}

private fun buildFlagValueDelegate(register: Int): String = """
    invoke-static {v1, v$register}, $AI_WRITING_TOOLS_RUNTIME_CLASS->applyOverriddenFlagValue(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$register
""".trimIndent()

private val PRESERVE_RECEIVER_DELEGATE = """
    move-object v1, p0
""".trimIndent()
