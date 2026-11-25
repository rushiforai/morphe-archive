package app.masareef.patches.branding

import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Legacy vector viewport, before it is cropped down to the icon's actual content bounds.
 */
private const val ORIGINAL_VIEWPORT_WIDTH = "1509.9972"
private const val ORIGINAL_VIEWPORT_HEIGHT = "1457.4625"

/**
 * Tight viewport around the icon content bounding box (with a small margin), used to zoom the
 * foreground so it fills the adaptive icon shape instead of floating in a padded box.
 */
private const val FILLED_VIEWPORT_WIDTH = "1020.8"
private const val FILLED_VIEWPORT_HEIGHT = "985.4"
private const val FILLED_TRANSLATE_X = "17.16"
private const val FILLED_TRANSLATE_Y = "16.59"

@Suppress("unused")
val fillAdaptiveIconPatch = resourcePatch(
    name = "Fill Adaptive Icon",
    description = "Scales the launcher adaptive icon foreground to fill the whole icon shape, " +
        "removing the empty padding around it.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        val document = try {
            document("res/drawable/ic_launcher_foreground.xml")
        } catch (_: java.io.FileNotFoundException) {
            return@execute
        }
        document.use { document ->
            val vector = document.getElementsByTagName("vector").item(0) as Element
            if (vector.getAttribute("android:viewportWidth") != ORIGINAL_VIEWPORT_WIDTH ||
                vector.getAttribute("android:viewportHeight") != ORIGINAL_VIEWPORT_HEIGHT
            ) {
                return@use
            }
            vector.setAttribute("android:viewportWidth", FILLED_VIEWPORT_WIDTH)
            vector.setAttribute("android:viewportHeight", FILLED_VIEWPORT_HEIGHT)

            val group = document.getElementsByTagName("group").item(0) as Element
            group.setAttribute("android:translateX", FILLED_TRANSLATE_X)
            group.setAttribute("android:translateY", FILLED_TRANSLATE_Y)
        }
    }
}
