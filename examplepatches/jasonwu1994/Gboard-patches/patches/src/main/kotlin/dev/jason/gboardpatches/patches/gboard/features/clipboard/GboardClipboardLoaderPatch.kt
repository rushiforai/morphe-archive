package dev.jason.gboardpatches.patches.gboard.features.clipboard

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch

internal val gboardClipboardLoaderPatch = bytecodePatch(
    description = "移植 clipboard visible list 重組與 TTL cutoff"
) {
    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = CLIPBOARD_LOADER_CALLABLE_CLASS,
            name = "call",
            returnType = "Ljava/lang/Object;",
            parameterTypes = emptyList()
        )
        mutableMethod.addInstructions(0, LOADER_DELEGATE)
    }
}

private val LOADER_DELEGATE = """
    invoke-static/range {p0 .. p0}, ${CLIPBOARD_RUNTIME_CLASS}->maybeBuildLoaderResult(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :jasondev_continue

    return-object v0

    :jasondev_continue
""".trimIndent()
