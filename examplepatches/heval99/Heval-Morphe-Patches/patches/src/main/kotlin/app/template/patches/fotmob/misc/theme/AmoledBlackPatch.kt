package app.template.patches.fotmob.misc.theme

import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobActivityHooksPatch
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.Constants.COMPATIBILITY_FOTMOB
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.misc.theme.AmoledAttribute
import app.template.patches.shared.misc.theme.amoledOverlayResourcePatch

/** The overlay style the resource step adds (read by AmoledBlack.applyTheme by name). */
internal const val AMOLED_OVERLAY = "HevalAmoledOverlay"

private const val AMOLED_EXTENSION_CLASS = "Lapp/template/extension/fotmob/AmoledBlack;"

internal val AMOLED_BLACK = HevalFeature(
    id = "fotmob.amoled_black",
    name = "AMOLED black",
    description = "Makes the dark theme pure black on OLED screens.",
    category = FotMobControlsCategory.DISPLAY,
    restartRequired = true,
    icon = "moon",
)

// FotMob 241 builds its dark theme as the night variant of Base.Theme.FotMob.DayNight: a list of
// theme attributes that point at named grays. The page background (appBackground, window
// background) is already `@color/black`; the cards and Material surfaces are `nero_black` (#1d1d1d),
// the bottom bar `chinese_black` (#141414), the card headers and unselected chips `raisin_black`
// (#262626) and the bottom sheets `dark_charcoal` (#333333). Those grays are shared color names
// (they also colour other things), so nothing is edited in place: the resource step adds an overlay
// style that holds twenty attributes at AMOLED values (#0a0a0a cards and surfaces, #000000 bottom bar,
// #141414 headers and chips, #121212 sheets and popup menus) after checking that the night theme still references
// the stock grays. The extension applies the overlay to each new screen while the Patch settings
// switch is on and the screen is in dark mode (restart required for screens already open). The
// light theme, the shared colors, dividers and texts are untouched. Not covered: screens that draw
// hard-coded grays or images.
// 2026-11-11 (issue #146): the overlay items reference new `heval_amoled_<rrggbb>` color resources
// instead of raw values. The league table row (TableLine item) tints its background with
// qo0.z = getColorStateList(TypedArray.getResourceId(cardBackgroundColor)); a raw value has resource
// id 0, so that threw and the row stopped binding after the team name (no played/W/D/L/GD/points).
// 2026-11-11: nine more night fills that were still gray joined (all nero_black, each used only as a
// background/fill in the decoded layouts and drawables, never as text): colorContainer (M3 button
// containers), predictorCardBackgroundColor, predictorBottomSheetBackgroundColor,
// onboardingBottomSheetBackground, newsTopTransferItemBackgroundColor, segmentedButtonsBackgroundColor,
// segmentedButtonsInsideCardSelectedBackgroundColor (still darker than the onyx inside-card track, and
// the other segmented selection stays outer_space), fifaRankGraphBackgroundColor and
// switchTrackBackgroundColorUnchecked, plus popupMenuBackgroundColor (dark_charcoal, #121212 like the
// sheets). compoundButtonIconTint is left out: it is a tint, not a fill.
private val amoledResourcePatch = amoledOverlayResourcePatch(
    COMPATIBILITY_FOTMOB,
    nightStylesPath = "res/values-night/styles.xml",
    baseStylesPath = "res/values/styles.xml",
    styleName = "Base.Theme.FotMob.DayNight",
    overlayName = AMOLED_OVERLAY,
    attributes = mapOf(
        "cardBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "colorSurface" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "colorSurfaceContainer" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "colorSurfaceContainerLow" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "colorSurfaceContainerHigh" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "colorSurfaceContainerHighest" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "bottomNavBackgroundColor" to AmoledAttribute("@color/chinese_black", "#ff000000"),
        "cardInCardHeaderBackground" to AmoledAttribute("@color/raisin_black", "#ff141414"),
        "chipBackgroundUnselected" to AmoledAttribute("@color/raisin_black", "#ff141414"),
        "bottomSheetBackgroundColor" to AmoledAttribute("@color/dark_charcoal", "#ff121212"),
        "popupMenuBackgroundColor" to AmoledAttribute("@color/dark_charcoal", "#ff121212"),
        "colorContainer" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "predictorCardBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "predictorBottomSheetBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "onboardingBottomSheetBackground" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "newsTopTransferItemBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "segmentedButtonsBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "segmentedButtonsInsideCardSelectedBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "fifaRankGraphBackgroundColor" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
        "switchTrackBackgroundColorUnchecked" to AmoledAttribute("@color/nero_black", "#ff0a0a0a"),
    ),
)

@Suppress("unused")
val amoledBlackPatch = fotMobControls.featurePatch(
    AMOLED_BLACK,
    name = "AMOLED black",
    description = "Makes the dark theme pure black on OLED screens. Can be turned off in Patch settings.",
    default = false,
    dependencies = setOf(amoledResourcePatch, fotMobActivityHooksPatch),
) {
    // The extension class must be merged; the hook that applies the overlay lives in ActivityHooks.
    classDefBy(AMOLED_EXTENSION_CLASS)
}
