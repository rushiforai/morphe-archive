package app.stylus.patches.chatgpt.font

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourceFile
import java.io.File
import java.util.Base64

internal const val PREVIEW_STYLESHEET = "assets/spaces/visualize.css"

internal enum class ChatGptFont(
    val assetName: String,
    val previewFamily: String,
    val previewVariable: String,
    val previewFallback: String,
) {
    UI("ui-font", "stylus-chatgpt-ui", "--font-sans", "system-ui,sans-serif"),
    MONOSPACE("mono-font", "stylus-chatgpt-mono", "--font-mono", "monospace"),
}

internal fun installChatGptFont(target: ChatGptFont, path: String?, features: String? = null) {
    val font = path?.trim()?.takeIf { it.isNotEmpty() }?.let(::File)
        ?: throw PatchException("No custom font was provided.")
    if (!font.isFile || font.extension.lowercase() !in setOf("ttf", "otf")) {
        throw PatchException("Select an existing TTF or OTF font file.")
    }

    val bytes = font.readBytes()
    val webFormat = when {
        bytes.startsWith(byteArrayOf(0, 1, 0, 0)) || bytes.startsWith("true".encodeToByteArray()) -> "ttf"
        bytes.startsWith("OTTO".encodeToByteArray()) -> "otf"
        else -> throw PatchException("The selected file does not contain a TrueType or OpenType font.")
    }
    val axes = detectFontAxes(bytes)

    val stylesheet = resourceFile(PREVIEW_STYLESHEET)
    if (!stylesheet.isFile || "var(${target.previewVariable})" !in stylesheet.readText()) {
        throw PatchException("Could not find ChatGPT's Spaces visualization stylesheet.")
    }

    val fontDir = resourceFile("assets/stylus/chatgpt").apply { mkdirs() }
    fontDir.resolve(target.assetName).writeBytes(bytes)
    fontDir.resolve("${target.assetName}-config.txt").writeText(
        listOf(if (axes?.hasWeight == true) "1" else "0", if (axes?.hasItalic == true) "1" else "0", features)
            .filterNotNull()
            .joinToString("\n"),
    )

    // The preview uses a sandboxed iframe whose existing CSP permits data fonts.
    val dataFont = Base64.getEncoder().encodeToString(bytes)
    val source = "font-family:${target.previewFamily};src:url(data:font/$webFormat;base64,$dataFont);"
    val weight = if (axes?.hasWeight == true) "1 1000" else "400"
    val italicCss = if (axes?.hasItalic == true) "@font-face{$source font-weight:$weight;font-style:italic;}\n" else ""
    val featureCss = features?.let {
        "body{font-feature-settings:$it;}\n:where(pre,code,kbd,samp){font-feature-settings:normal;}\n"
    }.orEmpty()
    stylesheet.appendText("\n@font-face{$source font-weight:$weight;}\n$italicCss$featureCss")
    patchVisualizationFontFamily(target)
}

private fun ByteArray.startsWith(prefix: ByteArray): Boolean =
    size >= prefix.size && prefix.indices.all { this[it] == prefix[it] }
