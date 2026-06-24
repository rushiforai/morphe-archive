package dev.jason.gboardpatches.patches.gboard.features.settingshomepage

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

private const val SETTINGS_ACTIVITY_CLASS =
    "Lddg;"
private const val SETTINGS_HOMEPAGE_RUNTIME_CLASS =
    "Ldev/jason/gboardpatches/extension/settingshomepage/GboardSettingsHomepageRuntime;"

internal val gboardSettingsHomepageBytecodePatch = bytecodePatch(
    description = "允許覆蓋 Gboard 設定頁新舊版樣式選擇"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    dependsOn(gboardPatchesExtensionCarrierPatch)

    execute {
        injectSettingsHomepageOverride()
    }
}

context(context: BytecodePatchContext)
private fun injectSettingsHomepageOverride() = with(context) {
    val mutableMethod = findMutableMethodOrThrow(
        classType = SETTINGS_ACTIVITY_CLASS,
        name = "a",
        returnType = "Z",
        parameterTypes = listOf("Landroid/content/Context;")
    )

    mutableMethod.addInstructions(0, SETTINGS_STYLE_OVERRIDE_DELEGATE)
}

private val SETTINGS_STYLE_OVERRIDE_DELEGATE = """
    invoke-static {p0}, $SETTINGS_HOMEPAGE_RUNTIME_CLASS->shouldUseNewSettingsStyle(Landroid/content/Context;)Z

    move-result v0

    return v0
""".trimIndent()
