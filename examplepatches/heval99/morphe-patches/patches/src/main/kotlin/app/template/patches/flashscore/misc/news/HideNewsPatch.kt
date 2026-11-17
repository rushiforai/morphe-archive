package app.template.patches.flashscore.misc.news

import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch

private const val NEWS_HELPER_NAME = "morpheNewsGet"

// The app's own news switches, by key name: the news block in league match lists (MATCH_LIST_FS_NEWS,
// with FLASHSCORE_NEWS_ENABLED as its master switch) and the NEWS tab on team pages (NEWS_ENABLED).
private val NEWS_KEYS = linkedMapOf(
    "MATCH_LIST_FS_NEWS" to ForcedConfigValue.FALSE,
    "FLASHSCORE_NEWS_ENABLED" to ForcedConfigValue.FALSE,
    "NEWS_ENABLED" to ForcedConfigValue.FALSE,
)

internal val HIDE_NEWS = HevalFeature(
    id = "flashscore.hide_news",
    name = "Hide news",
    description = "Hides news in match lists and on team pages.",
    category = FlashscoreControlsCategory.NEWS,
    // The config values are read once when the app builds its config.
    restartRequired = true,
)

/** The app's own news switches answer false while the Patch settings switch is on. */
@Suppress("unused")
val hideNewsPatch = flashscoreControls.featurePatch(HIDE_NEWS, default = false) {
    forceRemoteConfigValues(
        patchName = "Hide news",
        helperName = NEWS_HELPER_NAME,
        forced = NEWS_KEYS,
        required = NEWS_KEYS.keys,
        gates = NEWS_KEYS.keys.associateWith { HIDE_NEWS.id },
    )
}
