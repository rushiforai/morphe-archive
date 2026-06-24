package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices

internal val gboardClipboardAdapterTrimPatch = bytecodePatch(
    description = "移植 clipboard adapter trim 保險"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_ADAPTER_CLASS,
            name = "F",
            returnType = "V",
            parameterTypes = emptyList()
        )
        val returnIndices = mutableMethod.returnInstructionIndices()
        if (returnIndices.isEmpty()) {
            error("Could not resolve return instructions in Lemk.F()")
        }
        for (returnIndex in returnIndices.sortedDescending()) {
            mutableMethod.addInstructions(returnIndex, TRIM_DELEGATE)
        }
    }
}

internal val gboardClipboardItemBindPatch = bytecodePatch(
    description = "移植 clipboard countdown / creation time / preview lines bind。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_ADAPTER_CLASS,
            name = "p",
            returnType = "V",
            parameterTypes = listOf(RECYCLER_VIEW_HOLDER_CLASS, "I")
        )
        val returnIndices = mutableMethod.returnInstructionIndices()
        if (returnIndices.isEmpty()) {
            error("Could not resolve return instructions in Lemk.p(Lkm;I)")
        }
        for (returnIndex in returnIndices.sortedDescending()) {
            mutableMethod.addInstructions(returnIndex, ITEM_BIND_DELEGATE)
        }
    }
}

private val TRIM_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->afterAdapterTrim(Ljava/lang/Object;)V
""".trimIndent()

private val ITEM_BIND_DELEGATE = """
    invoke-static/range {p0 .. p2}, ${CLIPBOARD_RUNTIME_CLASS}->afterItemBind(Ljava/lang/Object;Ljava/lang/Object;I)V
""".trimIndent()
