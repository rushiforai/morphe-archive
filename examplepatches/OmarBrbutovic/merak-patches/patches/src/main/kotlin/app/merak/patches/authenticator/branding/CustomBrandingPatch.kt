package app.merak.patches.authenticator.branding

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceFile
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption
import app.merak.patches.shared.Constants.COMPATIBILITY_GOOGLE_AUTHENTICATOR
import java.io.File

/** Resource name of the new launcher icon and its layers. */
private const val ICON_NAME = "patched_launcher"

/** Foreground and monochrome layers of the original adaptive launcher icon. */
private const val ORIGINAL_FOREGROUND = "@mipmap/ic_launcher_foreground"
private const val ORIGINAL_MONOCHROME = "@drawable/ic_launcher_monochrome"

/** Background presets. The Google Authenticator mark is blue, red, yellow and green, so dark colors work best. */
private val BACKGROUND_PRESETS = mapOf(
    "Dark grey" to "#FF202124",
    "Black" to "#FF000000",
    "Deep green" to "#FF0F3D2A",
    "Deep purple" to "#FF2E1F4F",
    "Cream" to "#FFFFF3D6",
    "White (original)" to "#FFFFFFFF",
)

@Suppress("unused")
val customBrandingPatch = patch(
    name = "Custom branding",
    description = "Changes the app name and launcher icon, so the patched app is easy to tell apart " +
        "from the original Google Authenticator.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_GOOGLE_AUTHENTICATOR)

    val appName = stringOption(
        key = "appName",
        default = "Authenticator+",
        values = mapOf(
            "Authenticator+" to "Authenticator+",
            "Authenticator Organizer" to "Authenticator Organizer",
            "Authenticator" to "Authenticator",
        ),
        title = "App name",
        description = "The name of the app on the home screen and in the app list.",
        required = true,
        validator = { value: String? -> !value.isNullOrBlank() && value.length <= 50 },
    )

    val iconBackground = colorOption(
        key = "iconBackground",
        default = BACKGROUND_PRESETS.values.first(),
        values = BACKGROUND_PRESETS,
        title = "Icon background",
        description = "Background color of the launcher icon, behind the Authenticator mark. " +
            "Not used when a custom icon is set.",
        required = true,
    )

    // Arguments: key, default, title, description, required, file extensions, recommended size.
    val customIcon = imageOption(
        "customIcon",
        null,
        "Custom icon",
        "Optional square image (PNG, JPG or WEBP) to use as the whole launcher icon instead. " +
            "The launcher crops it to its icon shape, so keep important content away from the edges. " +
            "432 x 432 pixels or larger is recommended.",
        false,
        listOf("png", "jpg", "jpeg", "webp"),
        ImageSize(432, 432),
    )

    execute {
        // region Launcher icon.

        val customIconPath = customIcon.value?.trim()?.takeIf { it.isNotEmpty() }
        if (customIconPath != null) {
            val source = File(customIconPath)
            if (!source.isFile) throw PatchException("Custom icon file not found: $customIconPath")
            val extension = source.extension.lowercase().let { if (it == "jpeg") "jpg" else it }
            source.copyTo(resourceFile("res/drawable-nodpi/${ICON_NAME}_image.$extension", false), overwrite = true)

            // The image is the full bleed background layer, the launcher masks it to its shape.
            writeAdaptiveIcon(
                background = "@drawable/${ICON_NAME}_image",
                foreground = "@android:color/transparent",
                monochrome = null,
            )
        } else {
            val color = normalizeColor(iconBackground.value)
            resourceFile("res/drawable/${ICON_NAME}_background.xml", false).apply {
                parentFile.mkdirs()
                writeText(
                    buildString {
                        appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
                        appendLine("""<shape xmlns:android="http://schemas.android.com/apk/res/android" android:shape="rectangle">""")
                        appendLine("""    <solid android:color="$color" />""")
                        appendLine("</shape>")
                    },
                )
            }
            writeAdaptiveIcon(
                background = "@drawable/${ICON_NAME}_background",
                foreground = ORIGINAL_FOREGROUND,
                monochrome = ORIGINAL_MONOCHROME,
            )
        }

        // endregion

        resourceXml("AndroidManifest.xml").use { manifest ->
            val application = manifest.root.elements("application").first()
            application.setAttribute("android:icon", "@mipmap/$ICON_NAME")
            application.removeAttribute("android:roundIcon")
            application.setAttribute("android:label", appName.value!!.trim())
        }
    }
}

/** Writes the adaptive launcher icon resource. */
private fun writeAdaptiveIcon(background: String, foreground: String, monochrome: String?) {
    // Built line by line: the XML declaration must be the very first characters of the file.
    val xml = buildString {
        appendLine("""<?xml version="1.0" encoding="utf-8"?>""")
        appendLine("""<adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">""")
        appendLine("""    <background android:drawable="$background" />""")
        appendLine("""    <foreground android:drawable="$foreground" />""")
        if (monochrome != null) appendLine("""    <monochrome android:drawable="$monochrome" />""")
        appendLine("</adaptive-icon>")
    }
    resourceFile("res/mipmap-anydpi/$ICON_NAME.xml", false).apply {
        parentFile.mkdirs()
        writeText(xml)
    }
}

/** Accepts #RGB, #RRGGBB and #AARRGGBB, returns #AARRGGBB. */
private fun normalizeColor(value: String?): String {
    val hex = value?.trim()?.removePrefix("#")?.uppercase()
        ?: throw PatchException("No icon background color set")
    val argb = when (hex.length) {
        3 -> "FF" + hex.map { "$it$it" }.joinToString("")
        6 -> "FF$hex"
        8 -> hex
        else -> throw PatchException("Invalid icon background color: $value")
    }
    if (!argb.all { it in "0123456789ABCDEF" }) throw PatchException("Invalid icon background color: $value")
    return "#$argb"
}
