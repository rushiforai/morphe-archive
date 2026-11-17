package app.template.patches.flashscore.misc.theme

import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.shared.Constants.COMPATIBILITY_FLASHSCORE
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.misc.theme.AmoledColor
import app.template.patches.shared.misc.theme.amoledBlackResourcePatch

// AMOLED black (2026-11-14, owner request for the sports apps). Opt-in. Flashscore 26.11.6 keeps its
// dark theme in night-qualified named colors, read by the View screens and by the Compose token
// registry alike (the tokens resolve to the same color resources). Every `background_*` color used
// as a surface has a default (light) value and a night value, so only the night entries of
// res/values-night/colors.xml are rewritten and the light theme stays as it is. Pure `#000000`:
// the page and tab backgrounds (`background_primary` #010a0f, `tab_bg`, `navigationHeader_primary`
// #01131f), the cards and list rows (`background_secondary` #001e28, which `header_popular`,
// `secondary_button_active_bg`, `surface` and `header` reference), `background_dualTone`,
// `background_dialog`, `background_highlight`, `background_input`, `modalContent_primary` and
// `background_base` #0f2d37 (live and extra-row event info backgrounds). `tab_bg` and
// `event_info_background_non_live` pointed at `background_supportBlack` at night; that color has no
// night value and is also a text and stroke color, so it is not edited and those two night entries
// get `#000000` themselves. Two colors that follow `background_base`/`background_secondary` through
// their light value are a border or a divider (`participant_logo_border`, `fs_support_1`): they get a night entry with the stock shade so they do not vanish. Left alone on purpose: borders_*, dividers_*, highlights_*, `main_secondary`,
// shadows, the `glance_*` widget colors and the elevated `#0f2d37`/`#213d46` fills
// (`background_baseAlt`, `background_descriptive`, `background_interactive`, `background_onSecondary`),
// so chips, tooltips and dividers keep their contrast on black.
// A build-time resource edit, not a Patch settings switch: the Compose screens resolve their colors
// through R8-renamed token classes, so a runtime hook would anchor on obfuscated names.
private val amoledColorsPatch = amoledBlackResourcePatch(
    COMPATIBILITY_FLASHSCORE,
    "res/values-night/colors.xml",
    mapOf(
        "background_primary" to AmoledColor("#ff010a0f", "#ff000000"),
        "background_dualTone" to AmoledColor("#ff00141e", "#ff000000"),
        "background_secondary" to AmoledColor("#ff001e28", "#ff000000"),
        "background_dialog" to AmoledColor("#ff001e28", "#ff000000"),
        "background_highlight" to AmoledColor("#ff001e28", "#ff000000"),
        "background_input" to AmoledColor("#ff001e28", "#ff000000"),
        "background_base" to AmoledColor("#ff0f2d37", "#ff000000"),
        "navigationHeader_primary" to AmoledColor("#ff01131f", "#ff000000"),
        "modalContent_primary" to AmoledColor("#ff00141e", "#ff000000"),
        "tab_bg" to AmoledColor("@color/background_supportBlack", "#ff000000"),
        "event_info_background_non_live" to AmoledColor("@color/background_supportBlack", "#ff000000"),
    ),
    named = false,
    // These follow background_base / background_secondary through their default value but are a border or a
    // divider fill, so they get a night entry with the stock shade and stay visible: participant_logo_border
    // (#0f2d37) and fs_support_1 (#001e28; the settings divider style, which also keeps the table label and
    // the Switch surface variant at the stock shade).
    added = mapOf(
        "participant_logo_border" to "#ff0f2d37",
        "fs_support_1" to "#ff001e28",
    ),
)

// The resource edit is fixed in the APK, so the Patch settings screen can only show it: a read-only row
// "Applied at patch time" (no switch). To go back, patch again without "AMOLED black".
internal val AMOLED_BLACK = HevalFeature(
    id = "flashscore.amoled_black",
    name = "AMOLED black",
    description = "The dark theme was made pure black when the app was patched. Patch again without AMOLED black to go back.",
    category = FlashscoreControlsCategory.DISPLAY,
    buildTimeOnly = true,
    icon = "moon",
)

@Suppress("unused")
val amoledBlackPatch = flashscoreControls.featurePatch(
    AMOLED_BLACK,
    name = "AMOLED black",
    description = "Makes the dark theme pure black on OLED screens.",
    default = false,
    dependencies = setOf(amoledColorsPatch),
) {
    // Nothing to edit in code: the resource step did the work; this registers the settings row.
}
