package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.patch.ImageSize
import app.morphe.patcher.patch.imageOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.io.File
import java.util.logging.Logger

/**
 * Applies a custom WhatsApp launcher icon.
 *
 * Styles:
 *  - blue / red / gold — built-in presets
 *  - custom — use a PNG (or JPG/WebP) picked from device storage via [customIconFile]
 *
 * When [customIconFile] is set, it wins over the style preset.
 */
@Suppress("unused")
val changeAppIconPatch = resourcePatch(
    name = "App icon",
    description = "Choose a classic / premium launcher icon, or pick a PNG from your phone.",
    default = false,
) {
    compatibleWith(WhatsAppCompatibility.WHATSAPP)

    val iconStyle by stringOption(
        key = "iconStyle",
        default = "blue",
        values = mapOf(
            "Blue" to "blue",
            "Red" to "red",
            "Gold premium" to "gold",
            "Custom file" to "custom",
        ),
        title = "Style",
        description = "Preset icon, or Custom file to use the PNG option below.",
    )

    val customIconFile by imageOption(
        key = "customIconFile",
        title = "Custom icon PNG",
        description = "Pick a square PNG from your phone (transparent background recommended). " +
            "Used when Style is Custom file, or whenever a path is set. " +
            "Ideal size ~432×432 px (xxxhdpi); the same file is copied to all densities.",
        required = false,
        allowedExtensions = listOf("png", "jpg", "jpeg", "webp"),
        recommendedSize = ImageSize(432, 432),
        validator = {
            if (it.isNullOrBlank()) true
            else {
                val f = File(it.trim())
                f.isFile && f.canRead() && f.length() > 0
            }
        },
    )

    execute {
        val log = Logger.getLogger("ChangeAppIcon")
        val customPath = customIconFile?.trim()?.takeIf { it.isNotEmpty() }
        val customFile = customPath?.let(::File)?.takeIf { it.isFile && it.canRead() }

        val style = when {
            customFile != null -> "custom"
            else -> iconStyle ?: "blue"
        }
        val resName = "mightymich_launcher_$style"

        val bg = when (style) {
            "blue" -> "#2B7BFF"
            "red" -> "#E53935"
            "gold" -> "#000000"
            "custom" -> "#00000000"
            else -> "#2B7BFF"
        }

        val colorsPath = "res/values/colors.xml"
        val colorsFile = get(colorsPath)
        if (colorsFile.exists()) {
            var colors = colorsFile.readText()
            if (!colors.contains("mightymich_icon_bg")) {
                colors = colors.replace(
                    "</resources>",
                    "    <color name=\"mightymich_icon_bg\">$bg</color>\n</resources>",
                )
            } else {
                colors = colors.replace(
                    Regex("""<color name="mightymich_icon_bg">[^<]*</color>"""),
                    """<color name="mightymich_icon_bg">$bg</color>""",
                )
            }
            colorsFile.writeText(colors)
        }

        val densityDirs = listOf(
            "mipmap-mdpi",
            "mipmap-hdpi",
            "mipmap-xhdpi",
            "mipmap-xxhdpi",
            "mipmap-xxxhdpi",
            "mipmap",
        )

        if (customFile != null) {
            val bytes = customFile.readBytes()
            for (dir in densityDirs) {
                get("res/$dir/$resName.png").writeBytes(bytes)
            }
            for (dir in densityDirs) {
                for (stock in listOf("ic_launcher", "ic_launcher_foreground", "ic_launcher_whatsapp")) {
                    val stockFile = get("res/$dir/$stock.png")
                    if (stockFile.exists()) {
                        try {
                            stockFile.writeBytes(bytes)
                        } catch (_: Exception) {
                        }
                    }
                }
            }
            log.info("Copied custom icon from ${customFile.absolutePath} (${bytes.size} bytes)")
        }

        val adaptiveXml = """
            <?xml version="1.0" encoding="utf-8"?>
            <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                <background android:drawable="@color/mightymich_icon_bg"/>
                <foreground android:drawable="@mipmap/$resName"/>
            </adaptive-icon>
        """.trimIndent() + "\n"

        get("res/mipmap-anydpi-v26/$resName.xml").writeText(adaptiveXml)

        for (name in listOf("ic_launcher", "ic_launcher_round")) {
            val anydpi = get("res/mipmap-anydpi-v26/$name.xml")
            if (anydpi.exists()) {
                anydpi.writeText(adaptiveXml)
            }
        }

        val manifest = get("AndroidManifest.xml")
        if (manifest.exists()) {
            var xml = manifest.readText()
            xml = xml.replace(
                Regex("""android:icon="@mipmap/[^"]+""""),
                """android:icon="@mipmap/$resName"""",
            )
            xml = xml.replace(
                Regex("""android:roundIcon="@mipmap/[^"]+""""),
                """android:roundIcon="@mipmap/$resName"""",
            )
            if (!xml.contains(resName) && xml.contains("<application")) {
                xml = xml.replace(
                    "<application",
                    """<application android:icon="@mipmap/$resName" android:roundIcon="@mipmap/$resName"""",
                )
            }
            manifest.writeText(xml)
            log.info("Applied launcher icon style=$style res=$resName custom=${customFile != null}")
        }

        get("assets/mightymich_icon.txt").writeText(
            buildString {
                appendLine("MightyMich icon style: $style")
                if (customFile != null) {
                    appendLine("Custom file: ${customFile.absolutePath}")
                    appendLine("Bytes: ${customFile.length()}")
                } else {
                    appendLine("Preset only — pack icon PNGs or pick Custom file.")
                }
                appendLine("If the icon did not update, reboot the launcher or reinstall the app.")
            },
        )
    }
}
