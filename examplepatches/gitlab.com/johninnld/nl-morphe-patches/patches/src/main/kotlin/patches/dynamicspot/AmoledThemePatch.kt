package patches.dynamicspot

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch

/**
 * True black dark mode. The island popup is already pure black; this recolors every verified
 * dark background surface of the app UI: the Material3 night surface (spot_surface_dark, used
 * by Theme.Spot's colorBackground/colorSurface) and the legacy night palette (home window,
 * home cards, dialogs, list background and plan cards in values-night/colors.xml).
 * Text, accent, stroke and ripple colors are left untouched so they stay readable on black.
 */
@Suppress("unused")
val amoledThemePatch = resourcePatch(
    name = "AMOLED theme",
    description = "True black dark mode for AMOLED screens.",
) {
    compatibleWith(dynamicspot)
    dependsOn(patches.shared.originalInput(dynamicspot), fixPairipStartupPatch)

    execute {
        var recolored = 0
        fun recolor(path: String, replacements: Map<String, String>) {
            val file = get(path)
            if (!file.isFile) throw PatchException("$path not found")
            var text = file.readText()
            replacements.forEach { (name, old) ->
                val pattern = Regex("<color name=\"$name\">$old</color>")
                check(pattern.containsMatchIn(text)) { "dynamicSpot $path colour $name ($old) not found" }
                text = pattern.replace(text, "<color name=\"$name\">#ff000000</color>")
                recolored++
            }
            file.writeText(text)
        }
        recolor(
            "res/values/colors.xml",
            mapOf("spot_surface_dark" to "#1a1c1e"),
        )
        recolor(
            "res/values-night/colors.xml",
            mapOf(
                "home_bg" to "#211f26",
                "home_card" to "#1a1c1e",
                "home_dialog" to "#2b2930",
                "spot_list_bg" to "#211f26",
                "plan_card_bg" to "#ff1d1b20",
            ),
        )
        check(recolored == 6) { "expected 6 recolored surfaces, got $recolored" }
    }
}
