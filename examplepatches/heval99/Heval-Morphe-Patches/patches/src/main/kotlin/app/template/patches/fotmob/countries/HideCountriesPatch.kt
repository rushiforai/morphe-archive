package app.template.patches.fotmob.countries

import app.morphe.util.returnEarly
import app.template.patches.fotmob.controls.FotMobControlsCategory
import app.template.patches.fotmob.controls.fotMobControls
import app.template.patches.shared.hevalcontrols.HevalListFeature
import app.template.patches.shared.hevalcontrols.featurePatch

internal val HIDDEN_COUNTRIES = HevalListFeature(
    id = "fotmob.hidden_countries",
    name = "Hidden countries",
    description = "Leagues and matches from the countries you pick are hidden. Favourite leagues and teams stay.",
    category = FotMobControlsCategory.LEAGUES,
    restartRequired = true,
)

// A Patch settings list (2026-11-03, owner request), opt-in in Manager. The keys are FotMob's
// league country codes (FIFA three-letter codes, "INT" national-team and "INT-2" club
// competitions); CountryFilter in extensions/fotmob does the filtering. The hook sites (match lists,
// the leagues list, search) are shared with "Hide competitions" since 2026-11-03
// (fotMobListFiltersPatch, ListFilterHooks.kt); this patch turns the country part on
// (CountryFilter.patched() -> true). Favourite leagues and teams always stay. The picker is seeded
// from FotMobApp.onCreate through ActivityHooks.register (CountryFilter.init). The widget and
// notifications are not filtered.
@Suppress("unused")
val hideCountriesPatch = fotMobControls.featurePatch(
    HIDDEN_COUNTRIES,
    name = "Hide countries",
    description = "Hides the countries you pick in Patch settings from match lists, leagues and search.",
    default = false,
    dependencies = setOf(fotMobListFiltersPatch),
) {
    mutableClassDefBy(COUNTRY_FILTER).methods
        .single { it.name == "patched" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        .returnEarly(true)
}
