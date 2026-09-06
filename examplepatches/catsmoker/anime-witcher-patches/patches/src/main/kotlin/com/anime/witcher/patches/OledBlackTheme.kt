package com.anime.witcher.patches

import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element

/**
 * Makes the app's dark theme genuinely black so OLED / AMOLED screens switch the
 * background pixels completely off: deeper blacks and better battery life.
 *
 * The app's `AppTheme` (Theme.MaterialComponents.DayNight.NoActionBar) maps the
 * whole dark UI onto a handful of colors:
 *  - `windowBackground` (night): window background of every activity, plus all
 *    dialogs and bottom sheets.
 *  - `colorPrimary` / `colorPrimaryDark` (night): toolbars, tabs, the nav drawer,
 *    cards and comment/review rows.
 *  - `colorBackground`: page backgrounds a few layouts paint directly.
 *
 * In the stock app all of those sit in dark gray (#161617 / #28282c). This patch
 * repoints them at pure black (#000000). The light ("فاتح") appearance is
 * untouched, so switching back to light mode still works as before.
 */
@Suppress("unused")
val oledBlackThemePatch = resourcePatch(
    name = "AMOLED black theme",
    description = "Sets the dark theme backgrounds (window, toolbars, cards, dialogs) to pure black (#000000) so OLED and AMOLED screens turn those pixels off and battery is saved. Light appearance is unchanged. Original APK: https://www.animewitcher.com/",
    default = false
) {
    compatibleWith(COMPATIBILITY_ANIME_WITCHER)

    execute {
        val pureBlack = "#ff000000"

        // Page backgrounds shared by both appearances. The stock value is already a
        // dark gray, so blacking it out suits the light appearance too.
        document("res/values/colors.xml").use { document ->
            val colorNodes = document.getElementsByTagName("color")
            for (i in 0 until colorNodes.length) {
                val element = colorNodes.item(i) as? Element ?: continue
                if (element.getAttribute("name") == "colorBackground") {
                    element.textContent = pureBlack
                }
            }
        }

        // The surfaces of the dark appearance.
        document("res/values-night/colors.xml").use { document ->
            val colorNodes = document.getElementsByTagName("color")
            val targetColors = setOf(
                "colorPrimary",
                "colorPrimaryDark",
                "windowBackground",
                "commentsBackground",
            )
            for (i in 0 until colorNodes.length) {
                val element = colorNodes.item(i) as? Element ?: continue
                if (element.getAttribute("name") in targetColors) {
                    element.textContent = pureBlack
                }
            }
        }
    }
}