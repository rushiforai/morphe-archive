package dev.jason.gboardpatches.patches.gboard.features.writingtools

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardAiWritingToolsSettingsVisibilityPatch = bytecodePatch(
    description = "在 runtime 啟用時固定保留官方四顆 Writing tools settings rows。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectSettingsRemovalBypass()
    }
}

context(context: BytecodePatchContext)
private fun injectSettingsRemovalBypass() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = PREFERENCE_WRAPPER_CLASS,
        name = "g",
        returnType = "V",
        parameterTypes = listOf("I")
    )

    mutableMethod.addInstructions(0, SETTINGS_REMOVAL_BYPASS_DELEGATE)
}

private val SETTINGS_REMOVAL_BYPASS_DELEGATE = """
    invoke-static {p1}, $AI_WRITING_TOOLS_RUNTIME_CLASS->shouldBypassSettingsRemoval(I)Z

    move-result v0

    if-eqz v0, :cond_jasondev_continue_original

    return-void

    :cond_jasondev_continue_original
""".trimIndent()
