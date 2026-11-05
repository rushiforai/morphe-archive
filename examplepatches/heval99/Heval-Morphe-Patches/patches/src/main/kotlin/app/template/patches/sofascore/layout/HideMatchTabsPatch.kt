package app.template.patches.sofascore.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.eventHeadFlag
import app.template.patches.sofascore.controls.eventTabGuardPatch
import app.template.patches.sofascore.controls.hevalFlagGetter
import app.template.patches.sofascore.controls.sofascoreControls
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE

/**
 * One switch per optional match page tab: the EventHeadFlags getter that decides whether the tab
 * is built, and the tab title. The tab enum names they stand for are mapped in the extension's
 * SofascoreControls.tabFeature. Details (the fallback tab), the core data tabs and the odds tabs
 * (under Hide betting content) are not offered. All start off, so the page is stock until the
 * user hides a tab.
 */
internal val MATCH_TAB_FEATURES: List<Pair<String, HevalFeature>> = listOf(
    "getCommentary" to "Commentary",
    "getCrowdsourcing" to "Contribute",
    "getMedia" to "Media",
    "getGraphs" to "Graphs",
    "getStandings" to "Standings",
    "getCupTree" to "Knockout",
    "getMatches" to "Matches",
).map { (getter, title) ->
    val key = getter.removePrefix("get").replace(Regex("(?<=[a-z])(?=[A-Z])"), "_").lowercase()
    getter to HevalFeature(
        id = "sofascore.hide_tab_$key",
        name = "Hide $title tab",
        description = "Hides the $title tab on match pages.",
        category = SofascoreControlsCategory.MATCH_PAGE,
        default = false,
    )
}

// Several Heval Controls features in one patch, so featurePatch (one feature) is not used: the
// features are registered once every getter is gated.
@Suppress("unused")
val hideMatchTabsPatch = bytecodePatch(
    name = "Hide match tabs",
    description = "Adds switches to hide match page tabs.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch, eventTabGuardPatch)

    execute {
        // Validate every getter before the first edit.
        val getters = MATCH_TAB_FEATURES.map { (getter, feature) -> eventHeadFlag(getter) to feature }
        // The tab builder asks each tab's EventHeadFlags getter (through a property reference); a
        // getter answering false leaves its tab out. getMedia is also read by the Details page
        // (EventDetailsFragment), so its media block follows the tab. The shared guard keeps
        // navigateToTab from adding a hidden tab back.
        getters.forEach { (method, feature) -> method.hevalFlagGetter(feature.id) }
        MATCH_TAB_FEATURES.forEach { (_, feature) -> sofascoreControls.register(feature) }
    }
}
