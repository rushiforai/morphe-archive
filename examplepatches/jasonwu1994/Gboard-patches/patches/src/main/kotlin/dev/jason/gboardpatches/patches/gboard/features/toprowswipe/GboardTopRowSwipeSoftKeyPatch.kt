package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.returnInstructionIndices
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import dev.jason.gboardpatches.patches.gboard.shared.runtimeabi.RuntimeCallId

private val softKeyMetadataType = GboardVersionBindings.softKeyMetadataType.descriptor

internal val TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE = """
    ${RuntimeCallEmitter.invoke(
        RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_PATCH_INCOMING_SOFT_KEY_METADATA,
        "p0, p1",
    )}

    move-result-object p1

    check-cast p1, $softKeyMetadataType
""".trimIndent()

internal val TOP_ROW_SWIPE_AFTER_BIND_DELEGATE = """
    ${RuntimeCallEmitter.invoke(RuntimeCallId.TOP_ROW_SWIPE_RUNTIME_AFTER_SOFT_KEY_BOUND, "p0")}
""".trimIndent()

internal val TOP_ROW_SWIPE_ENTRY_DELEGATE = """
$TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE
""".trimIndent()

internal val gboardTopRowSwipeSoftKeyPatch = bytecodePatch(
    description = "攔 SoftKeyView bind，按 custom page 狀態改寫第一排 key metadata。"
) {
    execute {
        val mutableMethod = findMutableMethodOrThrow(GboardVersionBindings.softKeyBind)

        mutableMethod.addInstructions(0, TOP_ROW_SWIPE_ENTRY_DELEGATE)
        val returnIndices = mutableMethod.returnInstructionIndices()
        check(returnIndices.isNotEmpty()) {
            "Could not find normal return in generated SoftKeyView bind target"
        }
        returnIndices.asReversed().forEach { returnIndex ->
            mutableMethod.addInstructions(returnIndex, TOP_ROW_SWIPE_AFTER_BIND_DELEGATE)
        }
    }
}
