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

/** Categories of the Sofascore features, in the order a full patch set usually registers them. */
internal object SofascoreControlsCategory {
    const val POPUPS = "Pop-ups & promotions"
    const val MATCH_PAGE = "Match page"
    const val SPORTS = "Sports"
    const val LEAGUES = "Leagues"
    const val BETTING = "Betting"
    const val PROMO_SECTIONS = "Promo sections"
    const val PERFORMANCE = "Speed & battery"
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
