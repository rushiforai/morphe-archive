package io.github.ilikeadofai.vocacolle.patches

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import io.github.ilikeadofai.vocacolle.patches.shared.Constants.VOCACOLLE
import java.awt.Color
import java.awt.RenderingHints
import java.awt.image.BufferedImage
import java.io.File
import javax.imageio.ImageIO
import javax.xml.XMLConstants
import javax.xml.parsers.DocumentBuilderFactory
import javax.xml.transform.OutputKeys
import javax.xml.transform.TransformerFactory
import javax.xml.transform.dom.DOMSource
import javax.xml.transform.stream.StreamResult
import org.w3c.dom.Element

internal const val ORIGINAL_VOCACOLLE_APP_NAME = "ボカコレ"
internal const val APP_NAME_OPTION_KEY = "vocacolleAppName"
internal const val APP_ICON_PATH_OPTION_KEY = "vocacolleAppIconPath"
internal const val MAX_ICON_FILE_BYTES = 20_971_520L
internal const val MAX_ICON_DIMENSION = 4096

internal fun customAppNameOrNull(value: String): String? {
    val normalized = value.trim()
    require(normalized.isNotEmpty()) { "App name must not be blank" }
    require(normalized.length <= 50) { "App name must be 50 characters or fewer" }
    require(normalized.none { Character.isISOControl(it) }) {
        "App name must not contain control characters"
    }
    return normalized.takeUnless { it == ORIGINAL_VOCACOLLE_APP_NAME }
}

internal fun androidStringResourceText(value: String): String = buildString {
    value.forEachIndexed { index, character ->
        if (index == 0 && (character == '@' || character == '?')) append('\\')
        when (character) {
            '\\' -> append("\\\\")
            '\'' -> append("\\'")
            '"' -> append("\\\"")
            else -> append(character)
        }
    }
}

private data class IconMetadata(val width: Int, val height: Int)

private fun inspectPng(file: File): IconMetadata {
    require(file.length() <= MAX_ICON_FILE_BYTES) {
        "App icon must be 20 MiB or smaller"
    }
    val input = requireNotNull(ImageIO.createImageInputStream(file)) {
        "App icon is not a readable PNG file"
    }
    input.use {
        val readers = ImageIO.getImageReaders(input)
        require(readers.hasNext()) { "App icon is not a readable PNG file" }
        val reader = readers.next()
        try {
            reader.input = input
            require(reader.formatName.equals("png", ignoreCase = true)) {
                "App icon is not a readable PNG file"
            }
            val width = reader.getWidth(0)
            val height = reader.getHeight(0)
            require(width > 0 && height > 0) { "App icon dimensions must be positive" }
            require(width == height) { "App icon must be square" }
            require(width <= MAX_ICON_DIMENSION) {
                "App icon dimensions must not exceed ${MAX_ICON_DIMENSION}x$MAX_ICON_DIMENSION"
            }
            return IconMetadata(width, height)
        } finally {
            reader.dispose()
        }
    }
}

internal fun customIconFileOrNull(value: String): File? {
    val normalized = value.trim()
    if (normalized.isEmpty()) return null

    val file = File(normalized)
    require(file.isFile) { "App icon does not exist: $normalized" }
    require(file.extension.equals("png", ignoreCase = true)) { "App icon must be a PNG file" }
    inspectPng(file)
    return file
}

internal object LauncherIconRenderer {
    private data class Density(
        val qualifier: String,
        val legacySize: Int,
        val adaptiveSize: Int
    )

    private val densities = listOf(
        Density("mdpi", 48, 108),
        Density("hdpi", 72, 162),
        Density("xhdpi", 96, 216),
        Density("xxhdpi", 144, 324),
        Density("xxxhdpi", 192, 432)
    )

    fun render(sourceFile: File, resolveTarget: (String) -> File) {
        val metadata = inspectPng(sourceFile)
        val source = requireNotNull(ImageIO.read(sourceFile)) {
            "App icon is not a readable PNG file"
        }
        check(source.width == metadata.width && source.height == metadata.height) {
            "App icon dimensions changed while reading"
        }

        val cornerPixels = intArrayOf(
            source.getRGB(0, 0),
            source.getRGB(source.width - 1, 0),
            source.getRGB(0, source.height - 1),
            source.getRGB(source.width - 1, source.height - 1)
        )
        var red = 0
        var green = 0
        var blue = 0
        for (pixel in cornerPixels) {
            val color = Color(pixel, true)
            red += (color.red * color.alpha + 255 * (255 - color.alpha)) / 255
            green += (color.green * color.alpha + 255 * (255 - color.alpha)) / 255
            blue += (color.blue * color.alpha + 255 * (255 - color.alpha)) / 255
        }
        val backgroundColor = Color(
            red / cornerPixels.size,
            green / cornerPixels.size,
            blue / cornerPixels.size
        )

        for (density in densities) {
            val directory = "res/mipmap-${density.qualifier}-v4"

            val legacy = BufferedImage(
                density.legacySize,
                density.legacySize,
                BufferedImage.TYPE_INT_ARGB
            )
            val legacyGraphics = legacy.createGraphics()
            try {
                legacyGraphics.setRenderingHint(
                    RenderingHints.KEY_INTERPOLATION,
                    RenderingHints.VALUE_INTERPOLATION_BICUBIC
                )
                legacyGraphics.setRenderingHint(
                    RenderingHints.KEY_RENDERING,
                    RenderingHints.VALUE_RENDER_QUALITY
                )
                legacyGraphics.setRenderingHint(
                    RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON
                )
                legacyGraphics.drawImage(
                    source,
                    0,
                    0,
                    density.legacySize,
                    density.legacySize,
                    null
                )
            } finally {
                legacyGraphics.dispose()
            }

            val foreground = BufferedImage(
                density.adaptiveSize,
                density.adaptiveSize,
                BufferedImage.TYPE_INT_ARGB
            )
            val foregroundGraphics = foreground.createGraphics()
            try {
                foregroundGraphics.setRenderingHint(
                    RenderingHints.KEY_INTERPOLATION,
                    RenderingHints.VALUE_INTERPOLATION_BICUBIC
                )
                foregroundGraphics.setRenderingHint(
                    RenderingHints.KEY_RENDERING,
                    RenderingHints.VALUE_RENDER_QUALITY
                )
                foregroundGraphics.setRenderingHint(
                    RenderingHints.KEY_ANTIALIASING,
                    RenderingHints.VALUE_ANTIALIAS_ON
                )
                val iconSize = density.adaptiveSize * 2 / 3
                val inset = (density.adaptiveSize - iconSize) / 2
                foregroundGraphics.drawImage(source, inset, inset, iconSize, iconSize, null)
            } finally {
                foregroundGraphics.dispose()
            }

            val background = BufferedImage(
                density.adaptiveSize,
                density.adaptiveSize,
                BufferedImage.TYPE_INT_ARGB
            )
            val backgroundGraphics = background.createGraphics()
            try {
                backgroundGraphics.color = backgroundColor
                backgroundGraphics.fillRect(0, 0, density.adaptiveSize, density.adaptiveSize)
            } finally {
                backgroundGraphics.dispose()
            }

            val outputs = arrayOf(
                legacy to resolveTarget("$directory/ic_launcher.png"),
                foreground to resolveTarget("$directory/ic_launcher_foreground.png"),
                background to resolveTarget("$directory/ic_launcher_background.png")
            )
            for ((image, file) in outputs) {
                file.parentFile?.mkdirs()
                check(ImageIO.write(image, "png", file)) {
                    "Failed to write launcher icon: $file"
                }
            }
        }
    }
}

internal object BrandingResourceEditor {
    fun updateAppName(valuesFile: File, appName: String) {
        val factory = DocumentBuilderFactory.newInstance().apply {
            setFeature("http://apache.org/xml/features/disallow-doctype-decl", true)
            setFeature("http://xml.org/sax/features/external-general-entities", false)
            setFeature("http://xml.org/sax/features/external-parameter-entities", false)
            isExpandEntityReferences = false
            isXIncludeAware = false
        }
        val document = factory.newDocumentBuilder().parse(valuesFile)
        val stringNodes = document.getElementsByTagName("string")
        val appNameNodes = (0 until stringNodes.length)
            .map { stringNodes.item(it) }
            .filterIsInstance<Element>()
            .filter { it.getAttribute("name") == "app_name" }
        check(appNameNodes.size == 1) {
            "Expected exactly one app_name string resource, found ${appNameNodes.size}"
        }
        appNameNodes.single().textContent = androidStringResourceText(appName)

        TransformerFactory.newInstance().apply {
            setAttribute(XMLConstants.ACCESS_EXTERNAL_DTD, "")
            setAttribute(XMLConstants.ACCESS_EXTERNAL_STYLESHEET, "")
        }.newTransformer().apply {
            setOutputProperty(OutputKeys.ENCODING, "UTF-8")
            setOutputProperty(OutputKeys.INDENT, "yes")
        }.transform(DOMSource(document), StreamResult(valuesFile))
    }
}

@Suppress("unused")
val vocacolleBrandingPatch = resourcePatch(
    name = "Customize VocaColle branding",
    description = "Optionally changes the launcher name and icon while preserving the original Japanese branding by default.",
    default = false
) {
    compatibleWith(VOCACOLLE)

    val appNameOption = stringOption(
        key = APP_NAME_OPTION_KEY,
        default = ORIGINAL_VOCACOLLE_APP_NAME,
        title = "App name",
        description = "Launcher name. Keep ボカコレ to preserve the original Japanese name."
    ) { value ->
        value != null && runCatching { customAppNameOrNull(value) }.isSuccess
    }

    val appIconPathOption = stringOption(
        key = APP_ICON_PATH_OPTION_KEY,
        default = "",
        title = "App icon PNG path",
        description = "Path to a square PNG. Leave empty to preserve the original icon."
    ) { value ->
        value != null && runCatching { customIconFileOrNull(value) }.isSuccess
    }

    execute {
        customAppNameOrNull(checkNotNull(appNameOption.value))?.let { appName ->
            BrandingResourceEditor.updateAppName(
                this["res/values/strings.xml", false],
                appName
            )
        }
        customIconFileOrNull(checkNotNull(appIconPathOption.value))?.let { iconFile ->
            LauncherIconRenderer.render(iconFile) { path -> this[path, false] }
        }
    }
}
