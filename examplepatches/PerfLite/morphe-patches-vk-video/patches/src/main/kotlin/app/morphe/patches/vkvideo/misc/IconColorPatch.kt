package app.morphe.patches.vkvideo.misc

import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.colorOption
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO
import org.w3c.dom.Element

private const val BACKGROUND_LAYER = "res/drawable/ic_launcher_background.xml"
private const val FOREGROUND_LAYER = "res/drawable/ic_launcher_foreground.xml"

private const val DEFAULT_BACKGROUND_COLOR = "#0077FF"
private const val DEFAULT_FOREGROUND_COLOR = "#FFFFFF"

private val hexColor = Regex("^#([0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")

private fun ResourcePatchContext.recolorLayer(path: String, color: String) {
    if (!get(path).exists()) {
        println("WARNING: icon layer $path not found - left unchanged")
        return
    }

    var recolored = 0
    document(path).use { document ->
        val nodes = document.getElementsByTagName("path")
        for (i in 0 until nodes.length) {
            val element = nodes.item(i) as? Element ?: continue
            if (!element.hasAttribute("android:fillColor")) continue
            element.setAttribute("android:fillColor", color)
            recolored++
        }
    }

    println("IconColorPatch: recolored $recolored fill(s) in $path to $color")
}

@Suppress("unused")
val iconColorPatch = resourcePatch(
    name = "App icon colors",
    description = "Recolors the adaptive launcher icon: the background plate and the glyph drawn on top of it.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    val backgroundColor: Option<String> = colorOption(
        key = "backgroundColor",
        default = DEFAULT_BACKGROUND_COLOR,
        title = "Icon background color",
        description = "Color of the icon background plate (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    val foregroundColor: Option<String> = colorOption(
        key = "foregroundColor",
        default = DEFAULT_FOREGROUND_COLOR,
        title = "Icon glyph color",
        description = "Color of the glyph on top of the background (#RRGGBB or #AARRGGBB).",
        required = true,
        validator = { it == null || it.matches(hexColor) },
    )

    execute {
        recolorLayer(BACKGROUND_LAYER, backgroundColor.value!!)
        recolorLayer(FOREGROUND_LAYER, foregroundColor.value!!)
    }
}
