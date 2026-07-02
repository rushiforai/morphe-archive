package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsSignalPatch = bytecodePatch(
    description = "強制放行 Writing tools top-bar 與 account/minors signals。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectSignalOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectSignalOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = SIGNAL_GATE_CLASS,
        name = "e",
        returnType = "Z",
        parameterTypes = listOf(SIGNAL_MARKER_CLASS)
    )

    mutableMethod.addInstructions(0, SIGNAL_OVERRIDE_DELEGATE)
}

private val SIGNAL_OVERRIDE_DELEGATE = """
    invoke-static {p0}, $AI_WRITING_TOOLS_RUNTIME_CLASS->shouldForceSignalTrue(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_jasondev_continue_original

    const/4 v0, 0x1

    return v0

    :cond_jasondev_continue_original
""".trimIndent()
