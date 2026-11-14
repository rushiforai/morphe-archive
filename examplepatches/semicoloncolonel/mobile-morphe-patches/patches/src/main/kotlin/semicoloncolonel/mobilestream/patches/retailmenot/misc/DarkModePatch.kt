package semicoloncolonel.mobilestream.patches.retailmenot.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.retailmenot.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// RetailMeNot 10.0.6 — Dark mode (OPT-IN, default OFF).
//
// RetailMeNot draws every screen with light colors and has no dark palette.
// Android's Force Dark darkens a light app while the phone is in dark mode,
// but only when the app's theme is a light theme that allows it. AppTheme is
// a DayNight theme, which turns dark with the phone and so rules Force Dark
// out. The patch makes AppTheme a light theme and sets
// android:forceDarkAllowed on it. Expo's user interface style is also set
// from "light" to "automatic": "light" pins the app to day mode, which keeps
// Force Dark off.
// ─────────────────────────────────────────────────────────────────────────────

@Suppress("unused")
val darkModePatch = resourcePatch(
    name = "Dark mode",
    description = "Lets Android darken the app while the phone is in dark mode. " +
        "Android picks the colors, so some screens may look different from a designed dark theme.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        var themes = 0
        document("res/values/styles.xml").use { document ->
            val styles = document.getElementsByTagName("style")
            for (i in 0 until styles.length) {
                val style = styles.item(i) as Element
                if (style.getAttribute("name") != "AppTheme") continue
                style.setAttribute("parent", "@style/Theme.AppCompat.Light.NoActionBar")
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
        if (themes == 0) throw PatchException("RetailMeNot: AppTheme not found")

        var styles = 0
        document("res/values/strings.xml").use { document ->
            val strings = document.getElementsByTagName("string")
            for (i in 0 until strings.length) {
                val string = strings.item(i) as Element
                if (string.getAttribute("name") != "expo_system_ui_user_interface_style") continue
                string.textContent = "automatic"
                styles++
            }
        }
        if (styles == 0) throw PatchException("RetailMeNot: expo_system_ui_user_interface_style not found")
    }
}
