package app.template.patches.sofascore.competitions

import app.morphe.util.returnEarly
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import app.template.patches.sofascore.countries.COMPETITION_FILTER
import app.template.patches.sofascore.countries.sofascoreListFiltersPatch

internal val HIDDEN_COMPETITIONS = HevalListFeature(
    id = "sofascore.hidden_competitions",
    name = "Hide competitions",
    description = "Hides matches of the competitions you pick, even favourites.",
    category = SofascoreControlsCategory.LEAGUES,
    restartRequired = true,
)

// A Patch settings list next to "Hide countries" (2026-11-03, owner request), opt-in in Manager.
// Keys are UniqueTournament ids ("17" Premier League); labels "category · name" ("England · Premier
// League") so the picker groups by country; the picker draws Sofascore's competition logo
// (img.sofascore.com/api/v1/unique-tournament/{id}/image) over the country's flag or a trophy.
// CompetitionFilter in extensions/sofascore holds the keys and checks; the hook sites are shared
// with "Hide countries" (sofascoreListFiltersPatch, ListFilterHooks.kt). Filtered: the Live tab, the
// chronological view and an expanded country of the date feed (events by their tournament's
// UniqueTournament id), the date feed's country rows when every competition of the row is hidden,
// search (competition results and events) and a country's competitions in Leagues. Options are
// offered from Leagues, expanded countries and search, not from the Live tab or the chronological
// view: those carry hundreds of competitions a day and the picker keeps at most 500 seen options.
// Not filtered: pinned/favourite leagues fetched by their own tournament requests, row counts in
// the date feed, team/player/tournament pages, the widget and notifications. This patch only turns
// the competition part on (CompetitionFilter.patched() -> true).
@Suppress("unused")
val hideCompetitionsPatch = sofascoreControls.featurePatch(
    HIDDEN_COMPETITIONS,
    name = "Hide competitions",
    description = "Hides the competitions you pick in Patch settings from match lists, leagues and search.",
    default = false,
    dependencies = setOf(sofascoreListFiltersPatch),
) {
    mutableClassDefBy(COMPETITION_FILTER).methods
        .single { it.name == "patched" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .returnEarly(true)
}
