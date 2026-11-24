package app.aidan.patches.canvas.customization

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.aidan.patches.shared.compositeFeaturePatch
import app.aidan.patches.shared.isEnabled
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.stringOption
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
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
private const val SPLASH_BACKGROUND_COLOR_RESOURCE_NAME = "aidan_canvas_splash_background"
private const val VECTOR_FOREGROUND_PATH = "res/drawable/ic_launcher_foreground.xml"
private const val DEFAULT_FOREGROUND_COLOR = "#E62429"
private const val DEFAULT_BACKGROUND_COLOR = "#FFFFFF"
private const val DEFAULT_SPLASH_BACKGROUND_COLOR = "#FFFFFF"

private const val ADAPTIVE_ICON_PATH = "res/mipmap/ic_launcher.xml"
private const val ADAPTIVE_ICON_V26_PATH = "res/mipmap-anydpi/ic_launcher.xml"
private const val ADAPTIVE_ICON_VERSIONED_PATH = "res/mipmap-anydpi-v26/ic_launcher.xml"

private const val SPLASH_BACKGROUND_PATH = "res/drawable/splash_background_student.xml"
private const val SPLASH_LAYOUT_PATH = "res/layout/activity_init_login.xml"
private const val STYLES_PATH = "res/values/styles.xml"
private const val SPLASH_THEME_NAME = "LoginFlowTheme.Splash_Student"
private const val SPLASH_ICON_DRAWABLE = "@drawable/ic_splash_icon_student"
private const val LOGIN_LAYOUT_BACKGROUND = "@color/backgroundLightest"
private const val SPLASH_BACKGROUND_REFERENCE = "@color/$SPLASH_BACKGROUND_COLOR_RESOURCE_NAME"
private const val SPLASH_THEME_BACKGROUND_ATTRIBUTE = "android:windowSplashScreenBackground"
private const val LOGIN_ACTIVITY_DESCRIPTOR = "Lcom/instructure/student/activity/LoginActivity;"
private const val LOGIN_LANDING_ACTIVITY_DESCRIPTOR =
    "Lcom/instructure/student/activity/LoginLandingPageActivity;"
private const val LOGIN_THEME_COLOR_RESOURCE_ID = 0x7f06010c

@Suppress("unused")
val changeAppIconPatch = compositeFeaturePatch(
    name = "Change App Icon",
    description = "Recolors the Canvas launcher icon and optionally replaces its foreground with a custom PNG. " +
        "The colors also theme the launch splash screen and the signed-out Canvas logo when changed. " +
        "The image is an adaptive-icon foreground, so launchers mask it to their icon shape; keep artwork inside " +
        "the central safe area of a 432x432 PNG.",
    default = false
) {
    category("Customization")
    compatibleWith(COMPATIBILITY_CANVAS)

    val foregroundColorOption = registerOption(
        stringOption(
            key = "foregroundColor",
            default = DEFAULT_FOREGROUND_COLOR,
            title = "Foreground Color",
            description = "Color of the original launcher foreground vector (#RRGGBB or opaque #AARRGGBB). " +
                "Also tints the monochrome icon vector and, when changed from the default, the splash logo, " +
                "animated loader, and signed-out Canvas logo."
        )
    )

    val backgroundColorOption = registerOption(
        stringOption(
            key = "backgroundColor",
            default = DEFAULT_BACKGROUND_COLOR,
            title = "Background Color",
            description = "Adaptive icon background color (#RRGGBB or opaque #AARRGGBB)."
        )
    )

    val splashBackgroundColorOption = registerOption(
        stringOption(
            key = "splashBackgroundColor",
            default = DEFAULT_SPLASH_BACKGROUND_COLOR,
            title = "Splash Background Color",
            description = "Splash screen background color used when Theme Splash Screen is enabled " +
                "(#RRGGBB or opaque #AARRGGBB). Independent of the launcher icon background."
        )
    )

    val themeSplashScreenOption = booleanOption(
        key = "themeSplashScreen",
        default = true,
        title = "Theme Splash Screen",
        description = "Applies the splash background color to the Android 12+ system splash and the legacy splash " +
            "window, and the foreground color to the splash logo and animated loader, when each differs from " +
            "its default."
    )

    val themeLandingLogoOption = booleanOption(
        key = "themeLandingLogo",
        default = true,
        title = "Theme Signed-Out Logo",
        description = "Tints the Canvas mark on the signed-out landing page with the foreground color when it " +
            "differs from the default."
    )

    val customForegroundOption = registerOption(
        imageOption(
            key = "customForeground",
            default = "",
            title = "Custom Foreground Image",
            description = "Optional square PNG used as the adaptive icon foreground. The launcher masks the image " +
                "to its icon shape, so keep artwork inside the central safe area.",
            allowedExtensions = listOf("png"),
            recommendedSize = ImageSize(432, 432)
        )
    )

    resources {
        val foregroundColor = normalizeRgbColor("foregroundColor", foregroundColorOption.value)
        val backgroundColor = normalizeRgbColor("backgroundColor", backgroundColorOption.value)
        val splashBackgroundColor = normalizeRgbColor(
            "splashBackgroundColor",
            splashBackgroundColorOption.value
        )
        val customForeground = customForegroundOption.value?.trim().orEmpty()

        recolorForegroundVector(foregroundColor)
        updateColorResource(BACKGROUND_COLOR_RESOURCE_NAME, backgroundColor)
        updateAdaptiveIcons(backgroundColor, customForeground)

        // A customized splash color is intentionally not night-adaptive.
        val splashBackgroundCustomized = splashBackgroundColor != DEFAULT_SPLASH_BACKGROUND_COLOR
        val foregroundCustomized = foregroundColor != DEFAULT_FOREGROUND_COLOR
        val themeSplashScreen = themeSplashScreenOption.isEnabled

        if (themeSplashScreen && (splashBackgroundCustomized || foregroundCustomized)) {
            if (splashBackgroundCustomized) {
                updateColorResource(SPLASH_BACKGROUND_COLOR_RESOURCE_NAME, splashBackgroundColor)
            }
            updateSplashDrawable(
                recolorBackground = splashBackgroundCustomized,
                foregroundColor = foregroundColor.takeIf { foregroundCustomized },
            )
        }
        if (themeSplashScreen && splashBackgroundCustomized) {
            updateSplashLayoutBackground()
            updateSplashThemeBackground()
        }
    }

    bytecode {
        val foregroundColor = normalizeRgbColor("foregroundColor", foregroundColorOption.value)
        if (foregroundColor != DEFAULT_FOREGROUND_COLOR) {
            if (themeSplashScreenOption.isEnabled) {
                overrideThemeColor(LOGIN_ACTIVITY_DESCRIPTOR, foregroundColor)
            }
            if (themeLandingLogoOption.isEnabled) {
                overrideThemeColor(LOGIN_LANDING_ACTIVITY_DESCRIPTOR, foregroundColor)
            }
        }
    }
}

/** Normalized colors are "#RRGGBB"; Android color ints need the opaque alpha channel. */
private fun argbColorInt(color: String): Int = 0xFF000000.toInt() or color.substring(1).toLong(16).toInt()

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
            if (!fillColor.equals(DEFAULT_FOREGROUND_COLOR, ignoreCase = true)) continue
            path.setAndroidAttribute("fillColor", foregroundColor)
            updated++
        }

        if (updated == 0) {
            throw PatchException(
                "No path with android:fillColor=\"$DEFAULT_FOREGROUND_COLOR\" was found in $VECTOR_FOREGROUND_PATH."
            )
        }
    }
}

/**
 * AdaptiveIconDrawable resolves `<background android:drawable>` as a drawable. A raw color
 * literal compiles, but launchers can fail to inflate it and fall back to the default Android
 * icon. Keep the value in a color resource so the background is a normal resource reference.
 */
private fun ResourcePatchContext.updateColorResource(resourceName: String, color: String) {
    document("res/values/colors.xml").use { document ->
        val resources = document.documentElement
        if (resources.tagName != "resources") {
            throw PatchException("Expected <resources> root in res/values/colors.xml, found <${resources.tagName}>.")
        }

        val colors = document.getElementsByTagName("color")
        for (index in 0 until colors.length) {
            val existing = colors.item(index) as? Element ?: continue
            if (existing.getAttribute("name") != resourceName) continue
            existing.textContent = color
            return@use
        }

        val declared = document.createElement("color")
        declared.setAttribute("name", resourceName)
        declared.textContent = color
        resources.appendChild(declared)
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

private fun ResourcePatchContext.updateSplashDrawable(
    recolorBackground: Boolean,
    foregroundColor: String?,
) {
    document(SPLASH_BACKGROUND_PATH).use { document ->
        val root = document.documentElement
        if (root.tagName != "layer-list") {
            throw PatchException("Expected <layer-list> root in $SPLASH_BACKGROUND_PATH, found <${root.tagName}>.")
        }

        val colors = document.getElementsByTagName("color")
        if (colors.length != 1) {
            throw PatchException("Expected exactly one <color> in $SPLASH_BACKGROUND_PATH, found ${colors.length}.")
        }

        val bitmaps = document.getElementsByTagName("bitmap")
        if (bitmaps.length != 1) {
            throw PatchException("Expected exactly one <bitmap> in $SPLASH_BACKGROUND_PATH, found ${bitmaps.length}.")
        }

        val bitmap = bitmaps.item(0) as Element
        val src = bitmap.getAttribute("android:src")
        if (src != SPLASH_ICON_DRAWABLE) {
            throw PatchException(
                "Unexpected splash icon in $SPLASH_BACKGROUND_PATH: '$src'. Expected '$SPLASH_ICON_DRAWABLE'."
            )
        }

        // The stock background is a color attribute, not element text.
        if (recolorBackground) {
            (colors.item(0) as Element).setAndroidAttribute("color", SPLASH_BACKGROUND_REFERENCE)
        }
        foregroundColor?.let { bitmap.setAndroidAttribute("tint", it) }
    }
}

private fun ResourcePatchContext.updateSplashLayoutBackground() {
    document(SPLASH_LAYOUT_PATH).use { document ->
        val root = document.documentElement
        if (root.tagName != "FrameLayout") {
            throw PatchException("Expected <FrameLayout> root in $SPLASH_LAYOUT_PATH, found <${root.tagName}>.")
        }

        val current = root.getAttribute("android:background")
        if (current != LOGIN_LAYOUT_BACKGROUND) {
            throw PatchException(
                "Unexpected splash layout background '$current' in $SPLASH_LAYOUT_PATH. " +
                    "Expected '$LOGIN_LAYOUT_BACKGROUND'."
            )
        }

        root.setAndroidAttribute("background", SPLASH_BACKGROUND_REFERENCE)
    }
}

private fun ResourcePatchContext.updateSplashThemeBackground() {
    document(STYLES_PATH).use { document ->
        val styleNodes = document.getElementsByTagName("style")
        val matches = (0 until styleNodes.length).mapNotNull { styleNodes.item(it) as? Element }
            .filter { it.getAttribute("name") == SPLASH_THEME_NAME }
        if (matches.size != 1) {
            throw PatchException(
                "Expected exactly one <style name=\"$SPLASH_THEME_NAME\"> in $STYLES_PATH, found ${matches.size}."
            )
        }

        val style = matches.single()
        val items = style.getElementsByTagName("item")
        var updated = false
        for (index in 0 until items.length) {
            val item = items.item(index) as? Element ?: continue
            if (item.getAttribute("name") != SPLASH_THEME_BACKGROUND_ATTRIBUTE) continue
            item.textContent = SPLASH_BACKGROUND_REFERENCE
            updated = true
        }
        if (!updated) {
            val item = document.createElement("item")
            item.setAttribute("name", SPLASH_THEME_BACKGROUND_ATTRIBUTE)
            item.textContent = SPLASH_BACKGROUND_REFERENCE
            style.appendChild(item)
        }
    }
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

/**
 * BaseLoginInitActivity.applyTheme() feeds themeColor() into CanvasLoadingView.setOverrideColor(),
 * and BaseLoginLandingPageActivity.applyTheme() feeds it into ColorUtils.colorIt(canvasLogo), so
 * prepending a constant recolors the launch loader and the signed-out landing page logo together.
 * FindSchoolActivity and other login screens override themeColor() separately and stay untouched.
 */
private fun BytecodePatchContext.overrideThemeColor(classDescriptor: String, foregroundColor: String) {
    val activity = mutableClassDefByOrNull(classDescriptor)
        ?: throw PatchException("Missing class $classDescriptor for splash theming.")
    val themeColor = activity.methods.firstOrNull {
        it.name == "themeColor" && it.parameterTypes.isEmpty() && it.returnType == "I"
    } ?: throw PatchException("Missing themeColor()I in $classDescriptor.")
    val implementation = themeColor.implementation
        ?: throw PatchException("themeColor()I has no implementation in $classDescriptor.")

    val resolvesOriginalColor = implementation.instructions.any {
        (it as? NarrowLiteralInstruction)?.narrowLiteral == LOGIN_THEME_COLOR_RESOURCE_ID
    }
    if (!resolvesOriginalColor) {
        throw PatchException(
            "themeColor()I no longer resolves R.color.login_studentAppTheme " +
                "(0x${LOGIN_THEME_COLOR_RESOURCE_ID.toString(16)}) in $classDescriptor."
        )
    }
    if (implementation.registerCount < 2) {
        throw PatchException("themeColor()I has ${implementation.registerCount} registers; v0 is required.")
    }

    val literal = argbColorInt(foregroundColor).toUInt().toString(16).uppercase()
    themeColor.addInstructions(0, "const v0, 0x$literal\nreturn v0")
}
