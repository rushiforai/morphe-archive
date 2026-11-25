package app.masareef.patches.branding

import app.masareef.patches.shared.Constants.COMPATIBILITY_MASAREEF
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Background/surface colors in res/values-night/colors.xml, flattened to pure black (#000000)
 * so the dark theme is true AMOLED black instead of the stock dark-gray palette.
 */
private val AMOLED_COLOR_OVERRIDES = mapOf(
    "windowBg" to "#000000",
    "lightWindowBg" to "#000000",
    "plainCardBgColor" to "#000000",
    "day_balance_bg" to "#000000",
    "cardBgColor" to "#000000",
    "dialogBg" to "#000000",
    "toolbarBgColor" to "#000000",
    "navigationBgColor" to "#000000",
    "grayToolbarColor" to "#000000",
    "grayToolbarColorDark" to "#000000",
    "roundedGray" to "#000000",
    "state_deactivated" to "#000000",
    "colorPrimary" to "#000000",
    "colorPrimaryDark" to "#000000",
    "searchBg" to "#000000",
    "searchAreaBg" to "#000000",
    "prioritiesBg" to "#000000",
    "calendar_bg" to "#000000",
    "calendar_active_month_bg" to "#000000",
    "calendar_inactive_month_bg" to "#000000",
)

@Suppress("unused")
val amoledDarkThemePatch = resourcePatch(
    name = "AMOLED Dark Theme",
    description = "Flattens dark theme backgrounds (window, cards, dialogs, toolbar, " +
        "navigation bar, search, calendar) to pure black instead of the stock dark-gray shades.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_MASAREEF)

    execute {
        document("res/values-night/colors.xml").use { document ->
            val colors = document.getElementsByTagName("color")
            for (i in 0 until colors.length) {
                val color = colors.item(i) as Element
                val newValue = AMOLED_COLOR_OVERRIDES[color.getAttribute("name")] ?: continue
                color.textContent = newValue
            }
        }
    }
}
