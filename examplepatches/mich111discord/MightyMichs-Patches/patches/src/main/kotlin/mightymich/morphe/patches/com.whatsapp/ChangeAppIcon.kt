package mightymich.morphe.patches.com.whatsapp

import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.patch.stringOption
import java.util.logging.Logger

/**
 * Applies a custom WhatsApp launcher icon.
 *
 * Styles (user artwork):
 *  - blue  Blue gradient bubble (default)
 *  - red   Solid red bubble
 *  - gold  Premium gold on black
 *
 * PNGs: icons/icon_blue.png, icon_red.png, icon_gold.png
 * (+ density variants icon_<style>_{mdpi,hdpi,xhdpi,xxhdpi,xxxhdpi}.png)
 */
@Suppress("unused")
val changeAppIconPatch = resourcePatch(
    name = "App icon",
    description = "Choose a classic or premium-style launcher icon.",
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
        ),
        title = "Style",
        description = "Icon shown on your home screen.",
    )

    execute {
        val style = iconStyle ?: "blue"
        val log = Logger.getLogger("ChangeAppIcon")
        val resName = "mightymich_launcher_$style"

        val bg = when (style) {
            "blue" -> "#2B7BFF"
            "red" -> "#E53935"
            "gold" -> "#000000"
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

        // Density map for optional PNG install from patch assets
        val densityDirs = listOf(
            "mdpi" to "mipmap-mdpi",
            "hdpi" to "mipmap-hdpi",
            "xhdpi" to "mipmap-xhdpi",
            "xxhdpi" to "mipmap-xxhdpi",
            "xxxhdpi" to "mipmap-xxxhdpi",
        )

        // Adaptive icon XML pointing at foreground mipmap if present, else stock
        val adaptive = get("res/mipmap-anydpi-v26/$resName.xml")
        adaptive.writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                <background android:drawable="@color/mightymich_icon_bg"/>
                <foreground android:drawable="@mipmap/$resName"/>
            </adaptive-icon>
            """.trimIndent() + "\n",
        )

        // Also write a plain fallback adaptive that reuses stock foreground
        // when custom PNG was not packed into the patcher jar.
        val adaptiveFallback = get("res/mipmap-anydpi-v26/${resName}_legacy.xml")
        adaptiveFallback.writeText(
            """
            <?xml version="1.0" encoding="utf-8"?>
            <adaptive-icon xmlns:android="http://schemas.android.com/apk/res/android">
                <background android:drawable="@color/mightymich_icon_bg"/>
                <foreground android:drawable="@mipmap/ic_launcher"/>
            </adaptive-icon>
            """.trimIndent() + "\n",
        )

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
            log.info("Applied launcher icon style=$style res=$resName")
        }

        get("assets/mightymich_icon.txt").writeText(
            "MightyMich icon style: $style\n" +
                "Pack icons/icon_$style.png (and density variants) into the patch resources for a full replace.\n" +
                "If the icon did not update, reboot the launcher or reinstall the app.\n",
        )
    }
}
