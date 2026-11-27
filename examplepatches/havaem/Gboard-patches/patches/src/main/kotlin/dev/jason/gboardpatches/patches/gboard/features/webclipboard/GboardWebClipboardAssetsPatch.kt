package dev.jason.gboardpatches.patches.gboard.features.webclipboard

import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.resourcePatch
import dev.jason.gboardpatches.patches.shared.Constants.COMPATIBILITY_GBOARD
import kotlin.text.Charsets.UTF_8

internal val gboardWebClipboardAssetsPatch = resourcePatch(
    description = "複製 built Web Clipboard assets 到 target APK。"
) {
    compatibleWith(COMPATIBILITY_GBOARD)

    finalize {
        copyBundledWebClipboardAssets()
    }
}

context(context: ResourcePatchContext)
private fun copyBundledWebClipboardAssets() = with(context) {
    listBundledWebClipboardAssets().forEach { (relativePath, assetBytes) ->
        val targetPath = "$WEB_CLIPBOARD_ASSET_TARGET_ROOT/$relativePath"
        val targetFile = this[targetPath, false]
        targetFile.parentFile?.mkdirs()
        targetFile.outputStream().use { output ->
            output.write(assetBytes)
        }
    }
}

private fun listBundledWebClipboardAssets(): List<Pair<String, ByteArray>> {
    val resourceClassLoader = object {}.javaClass.classLoader
    val indexedAssets = resourceClassLoader.getResourceAsStream(WEB_CLIPBOARD_ASSET_INDEX_PATH)
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
        ?: error("Web Clipboard asset index \"$WEB_CLIPBOARD_ASSET_INDEX_PATH\" not found")

    check(indexedAssets.isNotEmpty()) {
        "Web Clipboard asset index \"$WEB_CLIPBOARD_ASSET_INDEX_PATH\" does not list any assets"
    }

    val assets = mutableListOf<Pair<String, ByteArray>>()
    indexedAssets.forEach { relativePath ->
        val resourcePath = "$WEB_CLIPBOARD_ASSET_RESOURCE_ROOT/$relativePath"
        val assetBytes = resourceClassLoader.getResourceAsStream(resourcePath)?.use { it.readBytes() }
            ?: error("Web Clipboard asset resource \"$resourcePath\" not found")
        assets += relativePath to assetBytes
    }
    return assets
}

private const val WEB_CLIPBOARD_ASSET_RESOURCE_ROOT = "web-clipboard-assets"
private const val WEB_CLIPBOARD_ASSET_INDEX_PATH = "$WEB_CLIPBOARD_ASSET_RESOURCE_ROOT/index.txt"
private const val WEB_CLIPBOARD_ASSET_TARGET_ROOT = "assets/web-clipboard"
