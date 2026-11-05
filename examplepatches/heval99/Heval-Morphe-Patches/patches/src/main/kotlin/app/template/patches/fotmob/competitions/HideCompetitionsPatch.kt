package app.template.patches.fotmob.competitions

import app.morphe.util.returnEarly
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.fotmob.countries.COMPETITION_FILTER
import app.template.patches.fotmob.countries.fotMobListFiltersPatch
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch

internal val HIDDEN_COMPETITIONS = HevalListFeature(
    id = "fotmob.hidden_competitions",
    name = "Hidden competitions",
    description = "Matches of the competitions you pick are hidden. Favourite leagues and teams stay.",
    category = FotMobControlsCategory.LEAGUES,
    restartRequired = true,
)

// A Patch settings list next to "Hidden countries" (2026-11-03, owner request), opt-in in Manager.
// Keys are league ids ("47" Premier League); a stage or group league of the match lists (ParentId >
// 0) is keyed by its parent, the way FotMob's League picks its primary id, so all stages of a
// competition hide together. Labels are "country · name" ("England · Premier League") so the picker
// groups by country; the picker draws FotMob's league logo
// (images.fotmob.com/image_resources/logo/leaguelogo/{id}.png) over the country's flag or a trophy.
// CompetitionFilter in extensions/fotmob holds the keys and checks; the hook sites are shared with
// "Hide countries" (fotMobListFiltersPatch, ListFilterHooks.kt). Filtered: match lists (a league
// whose id or parent is hidden; favourite leagues stay and favourite teams' matches stay), the
// Leagues tab and onboarding's league picker (never emptied), and search (league hits by id, teams
// and matches by their leagueId). Options: the app's bundled leagues file is the in-memory seed,
// and the leagues list and search offer what the seed does not name the same way; match lists
// never do (the picker keeps at most 500 saved options). Not filtered: league/team/match pages,
// the widget and notifications. This patch only turns the competition part on
// (CompetitionFilter.patched() -> true).
@Suppress("unused")
val hideCompetitionsPatch = fotMobControls.featurePatch(
    HIDDEN_COMPETITIONS,
    name = "Hide competitions",
    description = "Hides the competitions you pick in Patch settings from match lists, leagues and search.",
    default = false,
    dependencies = setOf(fotMobListFiltersPatch),
) {
    mutableClassDefBy(COMPETITION_FILTER).methods
        .single { it.name == "patched" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .returnEarly(true)
}
