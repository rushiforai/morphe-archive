package semicoloncolonel.mobilestream.patches.dealseek.misc

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import org.w3c.dom.Element
import semicoloncolonel.mobilestream.patches.dealseek.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// DealSeek 1.64.0 — Dark mode (OPT-IN, default OFF).
//
// DealSeek draws every screen with light colors and has no dark palette.
// Android's Force Dark darkens a light app while the phone is in dark mode,
// but only when the app's theme is a light theme that allows it. AppTheme is
// a DayNight theme, which turns dark with the phone and so rules Force Dark
// out. The patch makes AppTheme a light theme and sets
// android:forceDarkAllowed on it.
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
        if (themes == 0) throw PatchException("DealSeek: AppTheme not found")
    }
}
