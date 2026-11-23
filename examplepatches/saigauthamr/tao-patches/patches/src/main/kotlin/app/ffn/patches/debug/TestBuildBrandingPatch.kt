package app.ffn.patches.debug

import app.ffn.patches.shared.Constants.COMPATIBILITY_FANFICTION
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.resourceXml
import app.morphe.patcher.patch.stringOption

// Both launcher icons are adaptive icons whose background is a bitmap.
private val ADAPTIVE_ICONS = listOf(
    "res/mipmap-anydpi-v26/ic_boot.xml",
    "res/mipmap-anydpi-v26/ic_boot_round.xml",
)

@Suppress("unused")
val testBuildBrandingPatch = patch(
    name = "Test build branding",
    description = "Renames the app and recolors its launcher icon so a patched install " +
        "can be told apart from the official app installed alongside it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_FANFICTION)

    val appName by stringOption(
        key = "appName",
        default = "FFN Tao",
        title = "App name",
        description = "Launcher name of the patched app.",
        required = true,
    )

    execute {
        resourceXml("AndroidManifest.xml").use { manifest ->
            manifest.elements("application").first().setAttribute("android:label", appName!!)
        }

        ADAPTIVE_ICONS.forEach { path ->
            resourceXml(path).use { icon ->
                icon.elements("background").first()
                    .setAttribute("android:drawable", "@android:color/holo_orange_dark")
            }
        }
    }
}
