package app.template.patches.sofascore.layout

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.eventHeadFlag
import app.template.patches.sofascore.controls.eventTabGuardPatch
import app.template.patches.sofascore.controls.hevalFlagGetter
import app.template.patches.sofascore.controls.sofascoreControls

internal val HIDE_AI_INSIGHTS = HevalFeature(
    id = "sofascore.hide_ai_insights",
    name = "Hide AI insights",
    description = "Hides AI insights on match pages.",
    category = SofascoreControlsCategory.MATCH_PAGE,
)

// A Heval Controls feature, off in Manager by default (a new hide), on in Controls once selected.
@Suppress("unused")
val hideAiInsightsPatch = sofascoreControls.featurePatch(
    HIDE_AI_INSIGHTS,
    default = false,
    dependencies = setOf(eventTabGuardPatch),
) {
    // EventHeadFlags.aiInsights is the server's per-match flag for the AI Insights tab; the
    // Details page's AI teaser cards read the same getter. While the feature is on it answers
    // false, so neither is built; the shared guard keeps navigateToTab from adding the tab back.
    eventHeadFlag("getAiInsights").hevalFlagGetter(HIDE_AI_INSIGHTS.id)
}
