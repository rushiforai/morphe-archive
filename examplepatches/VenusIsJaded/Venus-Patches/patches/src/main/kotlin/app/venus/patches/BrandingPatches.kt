package app.venus.patches

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import org.w3c.dom.Element
import java.io.File

internal const val DISCORD_PACKAGE = "com.discord"
private const val BRAND_ICON = "venus_brand_icon"
private const val BRAND_IMAGE = "venus_brand_image"
private const val BRAND_FOREGROUND = "venus_brand_foreground"
private const val BRAND_BACKGROUND = "venus_brand_background"
private const val ANDROID_NS = "http://schemas.android.com/apk/res/android"
private val PACKAGE_NAME = Regex("^[a-z][a-z0-9_]*(\\.[a-z][a-z0-9_]*)+$")
private val HEX_COLOR = Regex("^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

/** Discord's own colors, so a recolored icon still looks like it belongs on the home screen. */
private val ICON_COLORS = mapOf(
    "Blurple" to "#5865F2",
    "Green" to "#57F287",
    "Yellow" to "#FEE75C",
    "Fuchsia" to "#EB459E",
    "Red" to "#ED4245",
    "Black" to "#23272A",
)

/** The user's image as an Android resource extension, by its first bytes (the file name can lie). */
internal fun imageExtension(bytes: ByteArray): String? = when {
    bytes.size >= 8 && bytes[0] == 0x89.toByte() && bytes[1] == 'P'.code.toByte() &&
        bytes[2] == 'N'.code.toByte() && bytes[3] == 'G'.code.toByte() -> "png"
    bytes.size >= 3 && bytes[0] == 0xFF.toByte() && bytes[1] == 0xD8.toByte() && bytes[2] == 0xFF.toByte() -> "jpg"
    bytes.size >= 12 && String(bytes, 0, 4, Charsets.US_ASCII) == "RIFF" &&
        String(bytes, 8, 4, Charsets.US_ASCII) == "WEBP" -> "webp"
    else -> null
}

/** aapt reads a leading @ or ? as a reference and treats quotes and backslashes specially. */
internal fun androidStringValue(text: String): String {
    val escaped = text.replace("\\", "\\\\").replace("\"", "\\\"").replace("'", "\\'")
        .replace("\n", "\\n")
    return if (escaped.startsWith("@") || escaped.startsWith("?")) "\\$escaped" else escaped
}

/** Every manifest value that names com.discord itself, renamed so both apps install side by side. */
internal fun renamePackage(manifest: org.w3c.dom.Document, newPackage: String) {
    val root = manifest.documentElement
    root.setAttribute("package", newPackage)
    val prefix = "$DISCORD_PACKAGE."
    fun rename(value: String) = if (value.startsWith(prefix)) newPackage + value.substring(DISCORD_PACKAGE.length) else value
    fun each(tag: String, block: (Element) -> Unit) {
        val nodes = manifest.getElementsByTagName(tag)
        for (i in 0 until nodes.length) block(nodes.item(i) as Element)
    }
    // Android refuses a second app declaring the same permission, and androidx builds this one from getPackageName().
    for (tag in listOf("permission", "uses-permission")) each(tag) {
        it.setAttribute("android:name", rename(it.getAttribute("android:name")))
    }
    // Two apps can't share a provider authority. Discord builds its file provider's from getPackageName() too.
    each("provider") { provider ->
        val authorities = provider.getAttribute("android:authorities")
        provider.setAttribute("android:authorities", authorities.split(";").joinToString(";", transform = ::rename))
    }
    // Activities sharing an affinity with real Discord's would open in its tasks.
    for (tag in listOf("activity", "activity-alias")) each(tag) {
        val affinity = it.getAttribute("android:taskAffinity")
        if (affinity.startsWith(prefix)) it.setAttribute("android:taskAffinity", rename(affinity))
    }
    each("meta-data") {
        if (it.getAttribute("android:value") == DISCORD_PACKAGE) it.setAttribute("android:value", newPackage)
    }
}

private fun ResourcePatchContext.writeResource(path: String, text: String) {
    get(path, false).apply { parentFile.mkdirs(); writeText(text) }
}

private fun ResourcePatchContext.addBackgroundColor(color: String) {
    val colors = get("res/values/colors.xml", false)
    if (!colors.exists()) colors.apply { parentFile.mkdirs(); writeText("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n<resources>\n</resources>\n") }
    document("res/values/colors.xml").use { document ->
        val element = document.createElement("color")
        element.setAttribute("name", BRAND_BACKGROUND)
        element.textContent = color
        document.documentElement.appendChild(element)
    }
}

@Suppress("unused")
val customBranding = resourcePatch(
    name = "Custom branding",
    description = "Installs Venus as its own app next to the normal Discord app, with the name, color and icon you pick. " +
        "It starts signed out and keeps its own settings. Notifications work in both.",
    default = false,
) {
    compatibleWith(discord)
    section(PLUGINS)
    // A root mount (#121) lays the patched APK over the installed Discord, and Android keeps reading that Discord's own
    // manifest: a new package name can't be mounted over com.discord, and a new name or icon would never show. Morphe's
    // own Custom branding patches are left out of mounts for the same reason.
    availability { installer, _ ->
        if (installer == InstallerType.MOUNT) PatchAvailability.UNAVAILABLE else PatchAvailability.ENABLED
    }

    // Shown in this order in Morphe. Name and package are plain text fields with no presets: with presets Morphe draws
    // a dropdown, which hid that you can type anything.
    val appName = stringOption(
        key = "appName",
        default = "Venus",
        title = "App name",
        description = "Type the name shown under the icon on your home screen and in your app list.",
        required = true,
    ) { it != null && it.isNotBlank() && it.trim().length <= 50 }

    val packageName = stringOption(
        key = "packageName",
        default = "com.discord.venus",
        title = "Package name",
        description = "Type any name made of lowercase words joined by dots, like com.discord.venus. A name other than " +
            "com.discord installs Venus next to the normal Discord app. Type com.discord to replace Discord instead.",
        required = true,
    ) { it != null && it.trim().matches(PACKAGE_NAME) }

    val iconBackground = colorOption(
        key = "iconBackground",
        values = ICON_COLORS,
        title = "Icon color",
        description = "The color behind the logo, to tell the two apps apart at a glance. Leave empty for Discord's blurple.",
    ) { it.isNullOrBlank() || it.matches(HEX_COLOR) }

    val appIcon = imageOption(
        key = "appIcon",
        title = "Icon picture",
        description = "Replaces Discord's logo with your own square picture (PNG, JPG or WebP). Icon color still shows " +
            "through any transparent parts. Leave empty to keep Discord's logo.",
        recommendedSize = ImageSize(512, 512),
    ) { it.isNullOrBlank() || File(it).isFile }

    finalize {
        val newPackage = packageName.value?.trim().orEmpty()
        if (!newPackage.matches(PACKAGE_NAME))
            throw PatchException("\"$newPackage\" isn't a valid package name. Use lowercase letters, digits and dots, like com.discord.venus")
        val name = appName.value?.trim().orEmpty().ifEmpty { "Discord" }
        val image = appIcon.file
        val color = iconBackground.value?.trim()?.takeIf { it.isNotEmpty() }
            ?.let { if (it.length == 7) "#FF${it.substring(1)}" else it }?.uppercase()

        if (name != "Discord") document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            val label = (0 until strings.length).map { strings.item(it) as Element }
                .firstOrNull { it.getAttribute("name") == "app_name" }
                ?: throw PatchException("Discord's app_name string is missing")
            label.textContent = androidStringValue(name)
        }

        val iconChanged = image != null || color != null
        if (iconChanged) {
            addBackgroundColor(color ?: "#FF5865F2")
            val foreground = if (image != null) {
                val bytes = image.readBytes()
                val extension = imageExtension(bytes) ?: throw PatchException("The App icon must be a PNG, JPG or WebP image")
                get("res/drawable-nodpi/$BRAND_IMAGE.$extension", false).apply { parentFile.mkdirs(); writeBytes(bytes) }
                // The launcher shows the middle 72 of an adaptive icon's 108dp, so a 1/6 inset fills exactly what's visible.
                writeResource("res/drawable-anydpi-v26/$BRAND_FOREGROUND.xml", """
                    <?xml version="1.0" encoding="utf-8"?>
                    <inset xmlns:android="$ANDROID_NS" android:drawable="@drawable/$BRAND_IMAGE" android:inset="16.667%" />
                """.trimIndent() + "\n")
                // Phones before Android 8 have no adaptive icons and show the image as it is.
                writeResource("res/mipmap-anydpi/$BRAND_ICON.xml", """
                    <?xml version="1.0" encoding="utf-8"?>
                    <bitmap xmlns:android="$ANDROID_NS" android:src="@drawable/$BRAND_IMAGE" android:gravity="fill" />
                """.trimIndent() + "\n")
                "@drawable/$BRAND_FOREGROUND"
            } else {
                writeResource("res/mipmap-anydpi/$BRAND_ICON.xml", """
                    <?xml version="1.0" encoding="utf-8"?>
                    <bitmap xmlns:android="$ANDROID_NS" android:src="@mipmap/ic_logo_square" android:gravity="fill" />
                """.trimIndent() + "\n")
                "@mipmap/ic_logo_foreground"
            }
            // A themed (monochrome) icon only keeps a picture's outline, so a custom image goes without one.
            val monochrome = if (image == null) "\n    <monochrome android:drawable=\"@mipmap/ic_logo_foreground\" />" else ""
            writeResource("res/mipmap-anydpi-v26/$BRAND_ICON.xml", """
                <?xml version="1.0" encoding="utf-8"?>
                <adaptive-icon xmlns:android="$ANDROID_NS">
                    <background android:drawable="@color/$BRAND_BACKGROUND" />
                    <foreground android:drawable="$foreground" />
                """.trimIndent() + monochrome + "\n</adaptive-icon>\n")
        }

        document("AndroidManifest.xml").use { manifest ->
            if (newPackage != DISCORD_PACKAGE) renamePackage(manifest, newPackage)
            if (iconChanged) {
                val application = manifest.getElementsByTagName("application").item(0) as Element
                application.setAttribute("android:icon", "@mipmap/$BRAND_ICON")
                application.setAttribute("android:roundIcon", "@mipmap/$BRAND_ICON")
            }
        }
    }
}
