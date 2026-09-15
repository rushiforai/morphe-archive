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
                    "charcoal_gray_90",
                    "design_dark_default_color_surface",
                    "background_material_dark",
                    "material_grey_900",
                    "material_grey_850"
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
