package app.template.patches.sofascore.controls

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.addInstructionsChecked
import app.template.patches.shared.hevalcontrols.hevalControlsPatch
import app.template.patches.shared.requireNoBranchTargetAt

internal const val SOFASCORE_CONTROLS_ENTRY = "Lapp/template/extension/sofascore/HevalControlsEntry;"

/** The Sofascore runtime hooks (modal queue, match tabs, sports list) in extensions/sofascore. */
internal const val SOFASCORE_CONTROLS = "Lapp/template/extension/sofascore/SofascoreControls;"

/** The "Animation speed" hooks (getFloat redirect, ValueAnimator scale, transitions) in extensions/sofascore. */
internal const val SOFASCORE_ANIMATION_SPEED = "Lapp/template/extension/sofascore/AnimationSpeed;"

/**
 * Sections of the Sofascore features on the Patch settings screen (titles only: the saved choices are
 * keyed by feature id, so regrouping never resets them). Listed in registration order, except that
 * the spoiler section always comes first. Regrouped 2026-11-11 (owner: plain sections a football fan
 * expects): betting joins the promo sections, and the theme, animation and widget rows share
 * "Look and feel". Row names and descriptions are plain, one short sentence each; the Manager patch
 * names stay as they were.
 */
internal object SofascoreControlsCategory {
    const val SPOILER_FREE = "Scores and spoilers"
    const val LEAGUES = "Leagues and countries"
    const val SPORTS = "Sports"
    const val MATCH_PAGE = "Match page"
    const val MAIN_TABS = "Bottom tabs"
    const val POPUPS = "Pop-ups and banners"
    const val BETTING = "Betting and promotions"
    const val PROMO_SECTIONS = BETTING
    const val DISPLAY = "Look and feel"
    const val PERFORMANCE = DISPLAY
}

/**
 * The in-app entry point: a "Patch settings" row after "Preferences" on Sofascore's Settings
 * screen, built like the stock rows (HevalControlsEntry in extensions/sofascore). It is part of
 * the "Patch settings" patch, so the screen can always be reached.
 */
private val sofascoreControlsEntryPatch = bytecodePatch(
    description = "Adds a \"Patch settings\" row to Sofascore's Settings screen.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    extendWith("extensions/sofascore.mpe")

    execute {
        classDefBy(SOFASCORE_CONTROLS_ENTRY)
        classDefBy(SOFASCORE_CONTROLS)

        // At the start: p1 is still the root view there (the method reuses p1 right away), and the
        // rows are already inflated (onCreateView built the binding). p1 may be a high register in
        // a later build, hence /range.
        val onViewCreated = SettingsFragmentViewCreatedFingerprint.method
        onViewCreated.requireNoBranchTargetAt(0, "Patch settings row")
        onViewCreated.addInstructionsChecked(
            0,
            "invoke-static/range {p1 .. p1}, $SOFASCORE_CONTROLS_ENTRY->addRow(Landroid/view/View;)V",
        )
    }
}

/** The Sofascore Heval Controls host; the switchable Sofascore patches are its feature patches. */
internal val sofascoreControls = hevalControlsPatch(
    COMPATIBILITY_SOFASCORE,
    dependencies = setOf(sofascoreControlsEntryPatch),
)

// Expose the host patch, so Manager lists "Patch settings".
@Suppress("unused")
val sofascoreHevalControlsPatch = sofascoreControls.patch
