package app.template.patches.scores365.misc.theme

import app.template.patches.scores365.controls.Scores365ControlsCategory
import app.template.patches.scores365.controls.scores365Controls
import app.template.patches.shared.Constants.COMPATIBILITY_365SCORES
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.misc.theme.AmoledColor
import app.template.patches.shared.misc.theme.amoledBlackResourcePatch

// AMOLED black (2026-11-09, owner request for the sports apps). Opt-in. The app has its own theme
// switch ("Themes" in its Settings) and keeps the dark palette in plain `dark_theme_*` colors. In
// 15.0.0 the dark theme background is already `#000000` (`dark_theme_background`); the cards, the
// scores list rows and the secondary surfaces are `#151e22`, the toolbar `#151e22` and the picks
// trend card `#21292d`. The AMOLED values keep cards a hair above black (`#0a0a0a`, `#121212` for the
// trend card) so the dividers and card edges still read on an OLED panel, and the toolbar is pure
// black so it merges with the status bar. Dividers, texts and accents are left alone. Not covered:
// screens that draw hard-coded or image-based grays, the light theme, and a user who has not chosen
// the dark theme.
private val amoledColorsPatch = amoledBlackResourcePatch(
    COMPATIBILITY_365SCORES,
    "res/values/colors.xml",
    mapOf(
        "dark_theme_card_background" to AmoledColor("#ff151e22", "#ff0a0a0a"),
        "dark_theme_scores_new" to AmoledColor("#ff151e22", "#ff0a0a0a"),
        "dark_theme_surface_secondary" to AmoledColor("#ff151e22", "#ff0a0a0a"),
        "dark_theme_toolbar_color" to AmoledColor("#ff151e22", "#ff000000"),
        "dark_theme_picks_trend_card" to AmoledColor("#ff21292d", "#ff121212"),
    ),
    named = false,
)

// The resource edit is fixed in the APK, so the Patch settings screen can only show it: a read-only row
// "Applied at patch time" (no switch). To go back, patch again without "AMOLED black". A runtime switch
// needs the app's dark colors to come from theme attributes, as FotMob's do.
internal val AMOLED_BLACK = HevalFeature(
    id = "scores365.amoled_black",
    name = "AMOLED black",
    description = "The dark theme was made pure black when the app was patched. Patch again without AMOLED black to go back.",
    category = Scores365ControlsCategory.DISPLAY,
    buildTimeOnly = true,
    icon = "moon",
)

@Suppress("unused")
val amoledBlackPatch = scores365Controls.featurePatch(
    AMOLED_BLACK,
    name = "AMOLED black",
    description = "Makes the dark theme pure black on OLED screens.",
    default = false,
    dependencies = setOf(amoledColorsPatch),
) {
    // Nothing to edit in code: the resource step did the work; this registers the settings row.
}
