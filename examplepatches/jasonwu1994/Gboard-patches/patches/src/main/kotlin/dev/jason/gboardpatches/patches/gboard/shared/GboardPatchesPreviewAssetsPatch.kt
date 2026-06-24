package dev.jason.gboardpatches.patches.gboard.shared

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import kotlin.text.Charsets.UTF_8

internal val gboardPatchesPreviewAssetsPatch = resourcePatch(
    description = "複製 Patches settings 預覽圖片資源到 target APK。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        copyBundledPreviewAssets()
    }
}

context(context: ResourcePatchContext)
private fun copyBundledPreviewAssets() = with(context) {
    listBundledPreviewAssets().forEach { (relativePath, assetBytes) ->
        val targetPath = "$PREVIEW_ASSET_TARGET_ROOT/$relativePath"
        val targetFile = this[targetPath, false]
        targetFile.parentFile?.mkdirs()
        targetFile.outputStream().use { output ->
            output.write(assetBytes)
        }
    }
}

private fun listBundledPreviewAssets(): List<Pair<String, ByteArray>> {
    val resourceClassLoader = object {}.javaClass.classLoader
    val indexedAssets = resourceClassLoader.getResourceAsStream(PREVIEW_ASSET_INDEX_PATH)
        ?.bufferedReader(UTF_8)
        ?.use { reader ->
            val assets = mutableListOf<String>()
            while (true) {
                val line = reader.readLine() ?: break
                val trimmedLine = line.trim()
                if (trimmedLine.isNotEmpty() && !trimmedLine.startsWith("#")) {
                    assets += trimmedLine
                }
            }
            assets
        }
        ?: error("Preview asset index \"$PREVIEW_ASSET_INDEX_PATH\" not found")

    check(indexedAssets.isNotEmpty()) {
        "Preview asset index \"$PREVIEW_ASSET_INDEX_PATH\" does not list any assets"
    }

    val assets = mutableListOf<Pair<String, ByteArray>>()
    indexedAssets.forEach { relativePath ->
        val resourcePath = "$PREVIEW_ASSET_RESOURCE_ROOT/$relativePath"
        val assetBytes = resourceClassLoader.getResourceAsStream(resourcePath)?.use { it.readBytes() }
            ?: error("Preview asset resource \"$resourcePath\" not found")
        assets += relativePath to assetBytes
    }
    return assets
}

private const val PREVIEW_ASSET_RESOURCE_ROOT = "settings-previews"
private const val PREVIEW_ASSET_INDEX_PATH = "$PREVIEW_ASSET_RESOURCE_ROOT/index.txt"
private const val PREVIEW_ASSET_TARGET_ROOT = "assets/settings-previews"
