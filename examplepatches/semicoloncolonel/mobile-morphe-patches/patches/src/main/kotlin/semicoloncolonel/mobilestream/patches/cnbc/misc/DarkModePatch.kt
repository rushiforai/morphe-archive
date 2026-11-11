package semicoloncolonel.mobilestream.patches.cnbc.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.cnbc.shared.Constants

// CNBC 8.8.2 has only a light theme (AppThemeMaterial, based on
// Theme.AppCompat.Light). Android's Force Dark darkens a light app while the
// phone is in dark mode, but only when the app's theme allows it. The patch
// sets android:forceDarkAllowed on each of the app's own window themes, the
// styles whose parent is a full theme rather than an overlay or a widget
// style.

@Suppress("unused")
val darkModePatch = resourcePatch(
    name = "Dark mode",
    description = "Lets Android darken the app while the phone is in dark mode. " +
        "Android picks the colors, so some screens may look different from a designed dark theme.",
    default = false,
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        var themes = 0
        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")
            for (i in 0 until styles.length) {
                val style = styles.item(i) as Element
                val name = style.getAttribute("name")
                val parent = style.getAttribute("parent")
                val isAppTheme = name.startsWith("AppTheme") || name.startsWith("Theme.CNBC") ||
                    (parent.contains("Theme.") && !parent.contains("ThemeOverlay") && !name.contains("Overlay") &&
                        !name.startsWith("Base.") && !name.startsWith("Platform.") && !name.startsWith("Theme.") &&
                        !name.startsWith("Widget"))
                if (!isAppTheme) continue
                val items = style.getElementsByTagName("item")
                val existing = (0 until items.length).map { items.item(it) as Element }
                    .firstOrNull { it.getAttribute("name") == "android:forceDarkAllowed" }
                val item = existing ?: document.createElement("item").also {
                    it.setAttribute("name", "android:forceDarkAllowed")
                    style.appendChild(it)
                }
                item.textContent = "true"
                themes++
            }
        }
        if (themes == 0) throw PatchException("CNBC: no app themes found")
    }
}
