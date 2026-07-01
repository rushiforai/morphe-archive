package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardColumnCountPatch = bytecodePatch(
    description = "移植 clipboard 欄數 override。"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_KEYBOARD_CLASS,
            name = "k",
            returnType = "I",
            parameterTypes = emptyList()
        )
        mutableMethod.addInstructions(0, COLUMN_COUNT_DELEGATE)
    }
}

private val COLUMN_COUNT_DELEGATE = """
    move-object v0, p0

    invoke-static {v0}, ${CLIPBOARD_RUNTIME_CLASS}->resolveColumnCountOverride(Ljava/lang/Object;)Ljava/lang/Integer;

    move-result-object p0

    if-eqz p0, :jasondev_continue

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :jasondev_continue
    move-object p0, v0
""".trimIndent()
