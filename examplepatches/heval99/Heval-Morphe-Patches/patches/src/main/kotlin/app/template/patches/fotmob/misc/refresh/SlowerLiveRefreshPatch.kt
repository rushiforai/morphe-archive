package app.template.patches.fotmob.misc.refresh

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.PatchException
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.addHevalValueHelper
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.filterThroughHevalHelper
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction

/** Seconds between two match page refreshes while the feature is on (stock: 15). */
internal const val SLOWER_REFRESH_SECONDS = 30

internal val SLOWER_LIVE_REFRESH = HevalFeature(
    id = "fotmob.slower_live_refresh",
    name = "Slower live refresh",
    description = "Refreshes an open live match every 30 seconds instead of every 15.",
    category = FotMobControlsCategory.MATCH_PAGE,
)

// A Patch settings feature (2026-11-03), opt-in in Manager. The match page's one-second ticker
// (a Runnable case that bumps MatchActivity's tick counter, updates the clock and, once the
// counter reaches 15, logs "Refreshing match facts!", reloads the match and resets the counter)
// compares against 30 instead while the feature is on. The 15 goes through a value helper right
// before the `if-lt`, so the site needs no free register and the stock limit stays when off. The
// live matches list's own 60 s timer is left alone.
@Suppress("unused")
val slowerLiveRefreshPatch = fotMobControls.featurePatch(
    SLOWER_LIVE_REFRESH,
    default = false,
) {
    val method = MatchFactsRefreshFingerprint.method
    val matches = MatchFactsRefreshFingerprint.instructionMatches
    // filters: iget I (MatchActivity), const/16 15, if-lt, "Refreshing match facts!".
    val limitIndex = matches[1].index
    val branchIndex = matches[2].index
    val counter = method.getInstruction<TwoRegisterInstruction>(matches[0].index).registerA
    val limit = method.getInstruction<OneRegisterInstruction>(limitIndex).registerA
    val branch = method.getInstruction<TwoRegisterInstruction>(branchIndex)
    if (branch.registerA != counter || branch.registerB != limit) {
        throw PatchException("FotMob match refresh: the if-lt does not compare the tick counter (v$counter) with the limit (v$limit)")
    }

    val helper = mutableClassDefBy(method.definingClass).addHevalValueHelper(
        SLOWER_LIVE_REFRESH.id, "morpheMatchRefreshTicks", "I",
    ) { v -> "const/16 $v, $SLOWER_REFRESH_SECONDS\nreturn $v" }
    method.filterThroughHevalHelper(branchIndex, limit, helper)
}
