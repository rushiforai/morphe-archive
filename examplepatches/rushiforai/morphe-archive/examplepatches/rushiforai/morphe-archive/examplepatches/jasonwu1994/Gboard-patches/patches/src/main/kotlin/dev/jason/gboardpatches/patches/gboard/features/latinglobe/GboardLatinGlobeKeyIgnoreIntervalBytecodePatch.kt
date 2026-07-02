package dev.jason.gboardpatches.patches.gboard.features.latinglobe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val LATIN_IME_CLASS =
    "Lcom/google/android/apps/inputmethod/libs/latin5/LatinIme;"
private const val LATIN_RUNTIME_PARAMS_TYPE = "Lvky;"
private const val LATIN_GLOBE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/keyboard/GboardLatinGlobeKeyIgnoreIntervalRuntime;"

internal val gboardLatinGlobeKeyIgnoreIntervalBytecodePatch = bytecodePatch(
    description = "允許覆寫英文地球鍵忽略時間。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectLatinGlobeKeyIgnoreIntervalOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectLatinGlobeKeyIgnoreIntervalOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = LATIN_IME_CLASS,
        name = "U",
        returnType = LATIN_RUNTIME_PARAMS_TYPE,
        parameterTypes = emptyList()
    )
    val instructions = mutableMethod.implementation?.instructions
        ?: error("No instructions available in LatinIme.U")
    val returnIndices = mutableMethod.returnInstructionIndices()
        .filter { index ->
            instructions[index].opcode.name.uppercase().replace('-', '_') == "RETURN_OBJECT"
        }
    check(returnIndices.isNotEmpty()) { "Could not resolve RETURN_OBJECT in LatinIme.U" }

    returnIndices.asReversed().forEach { returnIndex ->
        val resultRegister = (instructions[returnIndex] as? OneRegisterInstruction)?.registerA
            ?: error("RETURN_OBJECT at $returnIndex does not expose registerA")
        mutableMethod.addInstructions(returnIndex, buildLatinGlobeDelegate(resultRegister))
    }
}

private fun buildLatinGlobeDelegate(register: Int): String = """
    invoke-static {v$register}, $LATIN_GLOBE_RUNTIME_CLASS->applyOverride(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$register

    check-cast v$register, $LATIN_RUNTIME_PARAMS_TYPE
""".trimIndent()
