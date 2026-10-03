package app.aidan.patches.aftership.customization

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

private val AMOLED_COLOR_REPLACEMENTS = mapOf(
    "color_bottom_tab_background" to "#000000",
    "white_highlight" to "#000000",
    "color_f6f6f6" to "#000000",
    "color_windows_background" to "#000000",
    "tracking_detail_holder_bg_color" to "#000000",
    "color_0a000000" to "#000000",
    "background_quaternary_color" to "#000000",
    "insurance_card_container_bg" to "#000000",
    "insurance_page_bg" to "#000000"
)

@Suppress("unused")
val fullAmoledThemePatch = resourcePatch(
    name = "Full AMOLED Theme",
    description = "Themes AfterShip in pure AMOLED black by removing dark gray backgrounds from the bottom navigation bar, account items, cards, and windows.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        document("res/values-night/colors.xml").use { document ->
            val colorNodes = document.getElementsByTagName("color")
            for (i in 0 until colorNodes.length) {
                val element = colorNodes.item(i) as? Element ?: continue
                val name = element.getAttribute("name")
                val replacement = AMOLED_COLOR_REPLACEMENTS[name]
                if (replacement != null) {
                    element.textContent = replacement
                }
            }
        }
    }
}
