package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardPrunePatch = bytecodePatch(
    description = "移植 clipboard DB prune 策略"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_PRUNE_CALLABLE_CLASS,
            name = "call",
            returnType = "Ljava/lang/Object;",
            parameterTypes = emptyList()
        )
        mutableMethod.addInstructions(0, PRUNE_DELEGATE)
    }
}

private val PRUNE_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->handleCustomPrune(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :jasondev_continue

    const/4 v0, 0x0

    return-object v0

    :jasondev_continue
""".trimIndent()
