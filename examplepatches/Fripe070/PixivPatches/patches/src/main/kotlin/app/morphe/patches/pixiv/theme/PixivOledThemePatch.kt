package app.morphe.patches.pixiv.theme

import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.ResourcePatch
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

val pixivOledThemePatch: ResourcePatch = resourcePatch(
    name = "Pixiv OLED Dark Theme",
    description = "Overrides dark gray surface and background colors with pure pitch black (#ff000000) for OLED battery savings and true high-contrast dark mode.",
    default = true
) {
    compatibleWith(
        Compatibility(
            name = "Pixiv",
            packageName = "jp.pxv.android",
            targets = listOf(AppTarget("6.196.0"))
        )
    )

    execute {
        // Override color definitions in res/values/colors.xml
        try {
            document("res/values/colors.xml").use { doc ->
                val colorNodes = doc.getElementsByTagName("color")
                val oledOverrides = setOf(
                    "charcoal_color_background1_dark",
                    "charcoal_color_surface1_dark",
                    "charcoal_color_surface9_dark",
                    "charcoal_gray_90",
                    "charcoal_gray_80",
                    "cardview_dark_background",
                    "design_dark_default_color_surface",
                    "design_snackbar_background_color",
                    "background_dark",
                    "background_material_dark",
                    "background_floating_material_dark",
                    "primary_material_dark",
                    "material_grey_900",
                    "material_grey_850",
                    "material_grey_800",
                    "feature_novelviewer_novel_background_black",
                    "notification_material_background_media_default_color"
                )

                for (i in 0 until colorNodes.length) {
                    val element = colorNodes.item(i) as? Element ?: continue
                    val name = element.getAttribute("name")
                    if (oledOverrides.contains(name)) {
                        element.textContent = "#ff000000"
                    }
                }
            }
        } catch (_: Throwable) {
        }
    }
}
