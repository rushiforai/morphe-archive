package app.aidan.patches.canvas.customization

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Document
import org.w3c.dom.Element
import java.awt.image.BufferedImage
import java.io.File
import java.io.InputStream
import javax.imageio.ImageIO

private const val ANDROID_NAMESPACE = "http://schemas.android.com/apk/res/android"

private val RGB_COLOR_REGEX = Regex("^#(?:[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")
private val PNG_SIGNATURE = byteArrayOf(
    0x89.toByte(), 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A
)
private const val MAX_FOREGROUND_DIMENSION = 4096
private const val CUSTOM_FOREGROUND_RESOURCE_NAME = "aidan_canvas_launcher_foreground"
private const val CUSTOM_FOREGROUND_DRAWABLE = "@drawable/$CUSTOM_FOREGROUND_RESOURCE_NAME"
private const val BACKGROUND_COLOR_RESOURCE_NAME = "aidan_canvas_launcher_background"
private const val VECTOR_FOREGROUND_PATH = "res/drawable/ic_launcher_foreground.xml"
private const val ORIGINAL_FOREGROUND_COLOR = "#e62429"

private const val ADAPTIVE_ICON_PATH = "res/mipmap/ic_launcher.xml"
private const val ADAPTIVE_ICON_V26_PATH = "res/mipmap-anydpi/ic_launcher.xml"
private const val ADAPTIVE_ICON_VERSIONED_PATH = "res/mipmap-anydpi-v26/ic_launcher.xml"

@Suppress("unused")
val changeAppIconPatch = resourcePatch(
    name = "Change App Icon",
    description = "Recolors the Canvas launcher icon and optionally replaces its foreground with a custom PNG. " +
        "The image is an adaptive-icon foreground, so launchers mask it to their icon shape; keep artwork inside " +
        "the central safe area of a 432x432 PNG.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_CANVAS)

    val foregroundColorOption = stringOption(
        key = "foregroundColor",
        default = "#E62429",
        title = "Foreground Color",
        description = "Color of the original launcher foreground vector (#RRGGBB or opaque #AARRGGBB). Also tints the monochrome icon vector."
    )

    val backgroundColorOption = stringOption(
        key = "backgroundColor",
        default = "#FFFFFF",
        title = "Background Color",
        description = "Adaptive icon background color (#RRGGBB or opaque #AARRGGBB)."
    )

    val customForegroundOption = imageOption(
        key = "customForeground",
        default = "",
        title = "Custom Foreground Image",
        description = "Optional square PNG used as the adaptive icon foreground. The launcher masks the image " +
            "to its icon shape, so keep artwork inside the central safe area.",
        allowedExtensions = listOf("png"),
        recommendedSize = ImageSize(432, 432)
    )

    execute {
        val foregroundColor = normalizeRgbColor("foregroundColor", foregroundColorOption.value)
        val backgroundColor = normalizeRgbColor("backgroundColor", backgroundColorOption.value)
        val customForeground = customForegroundOption.value?.trim().orEmpty()

        recolorForegroundVector(foregroundColor)
        updateBackgroundColorResource(backgroundColor)
        updateAdaptiveIcons(backgroundColor, customForeground)
    }
}

private fun normalizeRgbColor(optionName: String, value: String?): String {
    val color = value?.trim().orEmpty()
    if (!RGB_COLOR_REGEX.matches(color)) {
        throw PatchException("Invalid $optionName: '$color'. Expected #RRGGBB or opaque #AARRGGBB.")
    }

    val hex = color.substring(1).uppercase()
    if (hex.length == 8) {
        if (!hex.startsWith("FF")) {
            throw PatchException("Invalid $optionName: '$color'. Alpha must be FF (opaque).")
        }
        return "#" + hex.substring(2)
    }
    return "#$hex"
}

private fun ResourcePatchContext.recolorForegroundVector(foregroundColor: String) {
    document(VECTOR_FOREGROUND_PATH).use { document ->
        var updated = 0
        val paths = document.getElementsByTagName("path")
        for (index in 0 until paths.length) {
            val path = paths.item(index) as? Element ?: continue
            val fillColor = path.getAttribute("android:fillColor")
            if (!fillColor.equals(ORIGINAL_FOREGROUND_COLOR, ignoreCase = true)) continue
            path.setAndroidAttribute("fillColor", foregroundColor)
            updated++
        }

        if (updated == 0) {
            throw PatchException(
                "No path with android:fillColor=\"$ORIGINAL_FOREGROUND_COLOR\" was found in $VECTOR_FOREGROUND_PATH."
            )
        }
    }
}

/**
 * AdaptiveIconDrawable resolves `<background android:drawable>` as a drawable. A raw color
 * literal compiles, but launchers can fail to inflate it and fall back to the default Android
 * icon. Keep the value in a color resource so the background is a normal resource reference.
 */
private fun ResourcePatchContext.updateBackgroundColorResource(backgroundColor: String) {
    document("res/values/colors.xml").use { document ->
        val resources = document.documentElement
        if (resources.tagName != "resources") {
            throw PatchException("Expected <resources> root in res/values/colors.xml, found <${resources.tagName}>.")
        }

        val colors = document.getElementsByTagName("color")
        for (index in 0 until colors.length) {
            val color = colors.item(index) as? Element ?: continue
            if (color.getAttribute("name") != BACKGROUND_COLOR_RESOURCE_NAME) continue
            color.textContent = backgroundColor
            return@use
        }

        val color = document.createElement("color")
        color.setAttribute("name", BACKGROUND_COLOR_RESOURCE_NAME)
        color.textContent = backgroundColor
        resources.appendChild(color)
    }
}

private fun ResourcePatchContext.updateAdaptiveIcons(backgroundColor: String, customForeground: String) {
    val customForegroundFile = customForeground
        .takeIf { it.isNotEmpty() }
        ?.let(::validateCustomForeground)

    if (customForegroundFile != null) {
        addCustomForegroundResource(customForegroundFile)
    }

    val effectiveAdaptiveIconPath = if (get(ADAPTIVE_ICON_VERSIONED_PATH).exists()) {
        ADAPTIVE_ICON_VERSIONED_PATH
    } else {
        ADAPTIVE_ICON_V26_PATH
    }

    for (path in listOf(ADAPTIVE_ICON_PATH, effectiveAdaptiveIconPath).distinct()) {
        document(path).use { document ->
            val root = document.documentElement
            if (root.tagName != "adaptive-icon") {
                throw PatchException("Expected <adaptive-icon> root in $path, found <${root.tagName}>.")
            }

            val background = root.ensureChild(document, "background")
            background.setAndroidAttribute("drawable", "@color/$BACKGROUND_COLOR_RESOURCE_NAME")

            if (path == effectiveAdaptiveIconPath) {
                requireOriginalForeground(document)
            }

            val foreground = root.ensureChild(document, "foreground")
            foreground.setAndroidAttribute(
                "drawable",
                if (customForegroundFile != null) CUSTOM_FOREGROUND_DRAWABLE else "@drawable/ic_launcher_foreground"
            )

            val monochrome = root.ensureChild(document, "monochrome")
            monochrome.setAndroidAttribute("drawable", "@drawable/ic_launcher_foreground")
        }
    }

    if (effectiveAdaptiveIconPath == ADAPTIVE_ICON_V26_PATH) {
        copyVersionedAdaptiveIcon()
    }
}

/**
 * The decoder strips the `-v26` qualifier because minSdk is 28. Restore it so the effective
 * adaptive icon keeps the same resource configuration as the input APK.
 */
private fun ResourcePatchContext.copyVersionedAdaptiveIcon() {
    val destination = get(ADAPTIVE_ICON_VERSIONED_PATH)
    if (destination.exists()) return

    val source = get(ADAPTIVE_ICON_V26_PATH)
    destination.parentFile?.mkdirs()
    source.copyTo(destination)
}

private fun requireOriginalForeground(document: Document) {
    val foreground = document.getElementsByTagName("foreground")
    if (foreground.length == 0) {
        throw PatchException("Adaptive launcher icon is missing its <foreground> element.")
    }

    val monochrome = document.getElementsByTagName("monochrome")
    if (monochrome.length == 0) {
        throw PatchException("Adaptive launcher icon is missing its <monochrome> element.")
    }

    val foregroundDrawable = (foreground.item(0) as Element).getAttribute("android:drawable")
    val monochromeDrawable = (monochrome.item(0) as Element).getAttribute("android:drawable")
    if (foregroundDrawable != "@drawable/ic_launcher_foreground" ||
        monochromeDrawable != "@drawable/ic_launcher_foreground"
    ) {
        throw PatchException(
            "Unexpected adaptive launcher icon foreground: foreground='$foregroundDrawable', " +
                "monochrome='$monochromeDrawable'. Expected both to reference " +
                "'@drawable/ic_launcher_foreground'."
        )
    }
}

private fun Element.setAndroidAttribute(name: String, value: String) {
    if (hasAttribute("android:$name")) {
        setAttribute("android:$name", value)
    } else {
        setAttributeNS(ANDROID_NAMESPACE, "android:$name", value)
    }
}

private fun Element.ensureChild(document: Document, tagName: String): Element {
    val existing = getElementsByTagName(tagName)
    if (existing.length > 0) return existing.item(0) as Element

    val child = document.createElement(tagName)
    appendChild(child)
    return child
}

private fun validateCustomForeground(path: String): File {
    val file = File(path)
    if (!file.isFile || !file.canRead()) {
        throw PatchException("Custom foreground image is not a readable file: '$path'.")
    }
    if (!file.extension.equals("png", ignoreCase = true)) {
        throw PatchException("Custom foreground image must be a PNG file: '$path'.")
    }

    val (width, height) = readPngDimensions(file)
    if (width != height) {
        throw PatchException("Custom foreground image must be square; '$path' is ${width}x$height.")
    }
    if (width > MAX_FOREGROUND_DIMENSION || height > MAX_FOREGROUND_DIMENSION) {
        throw PatchException(
            "Custom foreground image is ${width}x$height; the maximum is " +
                "${MAX_FOREGROUND_DIMENSION}x$MAX_FOREGROUND_DIMENSION."
        )
    }

    val decoded: BufferedImage? = try {
        ImageIO.read(file)
    } catch (exception: Exception) {
        throw PatchException("Custom foreground image could not be decoded as an image: '$path'.", exception)
    }
    if (decoded == null) {
        throw PatchException("Custom foreground image could not be decoded as an image: '$path'.")
    }
    if (decoded.width != width || decoded.height != height) {
        throw PatchException("Custom foreground image dimensions changed while decoding: '$path'.")
    }

    return file
}

private fun readPngDimensions(file: File): Pair<Int, Int> {
    file.inputStream().buffered().use { input ->
        val signature = input.readExact(8) ?: throw PatchException("PNG file is too short: '${file.path}'.")
        if (!signature.contentEquals(PNG_SIGNATURE)) {
            throw PatchException("Custom foreground image is not a PNG file: '${file.path}'.")
        }

        val headerLength = input.readIntBigEndian(file.path)
        if (headerLength != 13) {
            throw PatchException("PNG IHDR chunk has unexpected length $headerLength in '${file.path}'.")
        }
        val headerType = input.readExact(4) ?: throw PatchException("PNG IHDR chunk is truncated in '${file.path}'.")
        if (!headerType.contentEquals("IHDR".toByteArray(Charsets.US_ASCII))) {
            throw PatchException("PNG file does not start with an IHDR chunk: '${file.path}'.")
        }

        val width = input.readIntBigEndian(file.path)
        val height = input.readIntBigEndian(file.path)
        if (width <= 0 || height <= 0) {
            throw PatchException("PNG file has invalid dimensions ${width}x$height: '${file.path}'.")
        }
        return width to height
    }
}

private fun InputStream.readExact(size: Int): ByteArray? {
    val buffer = ByteArray(size)
    var offset = 0
    while (offset < size) {
        val read = read(buffer, offset, size - offset)
        if (read < 0) return null
        offset += read
    }
    return buffer
}

private fun InputStream.readIntBigEndian(path: String): Int {
    val bytes = readExact(4) ?: throw PatchException("PNG file is truncated: '$path'.")
    return ((bytes[0].toInt() and 0xFF) shl 24) or
        ((bytes[1].toInt() and 0xFF) shl 16) or
        ((bytes[2].toInt() and 0xFF) shl 8) or
        (bytes[3].toInt() and 0xFF)
}

private fun ResourcePatchContext.addCustomForegroundResource(source: File) {
    val destinationPath = "res/drawable-nodpi/$CUSTOM_FOREGROUND_RESOURCE_NAME.png"
    val existing = findResourceFiles(CUSTOM_FOREGROUND_RESOURCE_NAME)
    if (existing.isNotEmpty()) {
        throw PatchException(
            "Launcher foreground resource '$CUSTOM_FOREGROUND_RESOURCE_NAME' already exists: " +
                existing.joinToString { it.relativeTo(get("res")).invariantSeparatorsPath } + "."
        )
    }

    val destination = get(destinationPath)
    if (destination.exists()) {
        throw PatchException("Launcher foreground resource already exists: $destinationPath.")
    }
    destination.parentFile?.mkdirs()
    source.copyTo(destination)
}

private fun ResourcePatchContext.findResourceFiles(resourceName: String): List<File> {
    val resDirectory = get("res")
    if (!resDirectory.isDirectory) {
        throw PatchException("Decoded resource directory is missing: ${resDirectory.path}.")
    }

    return resDirectory.walkTopDown()
        .filter { it.isFile && it.nameWithoutExtension == resourceName }
        .toList()
}
