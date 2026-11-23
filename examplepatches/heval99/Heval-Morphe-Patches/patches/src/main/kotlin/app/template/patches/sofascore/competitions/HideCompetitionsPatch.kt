package app.template.patches.sofascore.competitions

import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.sofascoreControls
import app.template.patches.sofascore.countries.COMPETITION_FILTER
import app.template.patches.sofascore.countries.sofascoreListFiltersPatch

internal val HIDDEN_COMPETITIONS = HevalListFeature(
    id = "sofascore.hidden_competitions",
    name = "Hide competitions",
    description = "Hides the competitions you pick from match lists and search, not pinned leagues.",
    category = SofascoreControlsCategory.LEAGUES,
    restartRequired = true,
)

// A Patch settings list next to "Hide countries" (2026-11-03, owner request), opt-in in Manager.
// Keys are UniqueTournament ids ("17" Premier League); labels "category · name" ("England · Premier
// League") so the picker groups by country; the picker draws Sofascore's competition logo
// (img.sofascore.com/api/v1/unique-tournament/{id}/image) over the country's flag or a trophy.
// CompetitionFilter in extensions/sofascore holds the keys and checks; the hook sites are shared
// with "Hide countries" (sofascoreListFiltersPatch, ListFilterHooks.kt). Filtered: the Live tab, the
// chronological view, an expanded country of the date feed and (2026-11-22) a date's popular
// matches in the Matches tab (events by their tournament's UniqueTournament id), the date feed's
// country rows when every competition of the row is hidden, search (competition results and
// events) and a country's competitions in Leagues. Options are offered from Leagues, expanded
// countries and search, not from the Live tab, the chronological view or the popular matches: the
// first two carry hundreds of competitions a day and the picker keeps at most 500 seen options; the
// popular matches use the same helper (filterEventList).
// Not filtered: pinned/favourite leagues fetched by their own tournament requests (the Matches tab's
// pinned section, uniqueTournamentScheduledEvents per pinned league; kept on purpose), row counts in
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
