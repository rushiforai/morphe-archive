package semicoloncolonel.mobilestream.patches.checkout51.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.checkout51.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Checkout 51 9.22.10 — Dark mode (OPT-IN, default OFF).
//
// Checkout 51 draws every screen with light colors and has no dark palette;
// its only night resources belong to Braze's message cards. Android's Force
// Dark darkens a light app while the phone is in dark mode, when the theme
// allows it. Every activity theme inherits AppBaseTheme, a light Material
// theme, so the patch sets android:forceDarkAllowed on it.
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
                if (style.getAttribute("name") != "AppBaseTheme") continue
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
        if (themes == 0) throw PatchException("Checkout 51: AppBaseTheme not found")
    }
}
