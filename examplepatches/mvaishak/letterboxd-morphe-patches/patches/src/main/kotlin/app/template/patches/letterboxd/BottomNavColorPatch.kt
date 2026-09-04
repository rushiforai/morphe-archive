package app.template.patches.letterboxd

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_LETTERBOXD
import org.w3c.dom.Element

private const val BOTTOM_NAV_STYLE = "Widget.Letterboxd.BottomNavigationView"

// Letterboxd's top app bar (Widget.Letterboxd.AppBarLayout) uses this color as its background.
private const val TOP_BAR_COLOR = "@color/black100"

@Suppress("unused")
val bottomNavColorPatch = resourcePatch(
    name = "Match bottom nav to top bar color",
    description = "Sets Letterboxd's bottom navigation bar background to the same color as the top bar " +
        "($TOP_BAR_COLOR), so it blends into the app's dark chrome instead of showing the default slate bar.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LETTERBOXD)

    execute {
        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")

            val bottomNavStyle = (0 until styles.length)
                .map { styles.item(it) as Element }
                .firstOrNull { it.getAttribute("name") == BOTTOM_NAV_STYLE }
                ?: throw PatchException("Could not find <style name=\"$BOTTOM_NAV_STYLE\"> in res/values/styles.xml")

            val items = bottomNavStyle.getElementsByTagName("item")
            val background = (0 until items.length)
                .map { items.item(it) as Element }
                .firstOrNull { it.getAttribute("name") == "android:background" }
                ?: throw PatchException("Style \"$BOTTOM_NAV_STYLE\" has no <item name=\"android:background\"> to patch")

            // Was @color/gray445566 (#445566), which is also colorPrimary and therefore
            // cannot be swapped safely in colors.xml.
            background.textContent = TOP_BAR_COLOR
        }
    }
}
