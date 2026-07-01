package dev.jason.gboardpatches.patches.gboard.features.toprowswipe

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow

internal val TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE = """
    invoke-static {p0, p1}, $TOP_ROW_SWIPE_RUNTIME_CLASS->patchIncomingSoftKeyMetadata(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Loaa;
""".trimIndent()

internal val TOP_ROW_SWIPE_AFTER_BIND_DELEGATE = """
    invoke-static {p0, p1}, $TOP_ROW_SWIPE_RUNTIME_CLASS->afterSoftKeyBound(Ljava/lang/Object;Ljava/lang/Object;)V
""".trimIndent()

internal val TOP_ROW_SWIPE_ENTRY_DELEGATE = """
$TOP_ROW_SWIPE_PATCH_INCOMING_METADATA_DELEGATE

$TOP_ROW_SWIPE_AFTER_BIND_DELEGATE
""".trimIndent()

internal val gboardTopRowSwipeSoftKeyPatch = bytecodePatch(
    description = "攔 SoftKeyView bind，按 custom page 狀態改寫第一排 key metadata。"
) {
    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = TOP_ROW_SWIPE_SOFT_KEY_VIEW_CLASS,
            name = "p",
            returnType = "Z",
            parameterTypes = listOf("Loaa;", "J")
        )

        mutableMethod.addInstructions(0, TOP_ROW_SWIPE_ENTRY_DELEGATE)
    }
}
