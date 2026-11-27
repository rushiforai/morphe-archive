package dev.jason.gboardpatches.patches.gboard.features.customtheme

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD

internal val gboardCustomThemeAssetsPatch = resourcePatch(
    description = "複製 Custom Theme catalog 到 target APK。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    finalize { copyCustomThemeAssets() }
}

context(context: ResourcePatchContext)
private fun copyCustomThemeAssets() = with(context) {
    val loader = object {}.javaClass.classLoader
    val relativePath = "catalog.json"
    val bytes = loader.getResourceAsStream("$RESOURCE_ROOT/$relativePath")?.use { it.readBytes() }
        ?: error("Custom Theme catalog not found")
    val target = this["assets/gboard-custom-themes/$relativePath", false]
    target.parentFile?.mkdirs()
    target.outputStream().use { it.write(bytes) }
}

private const val RESOURCE_ROOT = "custom-theme-assets"
