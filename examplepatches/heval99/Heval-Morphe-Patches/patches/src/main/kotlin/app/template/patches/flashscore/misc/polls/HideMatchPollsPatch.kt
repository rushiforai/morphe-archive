package app.template.patches.flashscore.misc.polls

import app.template.patches.flashscore.controls.FlashscoreControlsCategory
import app.template.patches.flashscore.controls.flashscoreControls
import app.template.patches.flashscore.shared.ForcedConfigValue
import app.template.patches.flashscore.shared.forceRemoteConfigValues
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch

private const val POLLS_HELPER_NAME = "morpheMatchPollsGet"
private const val MATCH_POLL_ENABLED = "MATCH_POLL_ENABLED"

internal val HIDE_MATCH_POLLS = HevalFeature(
    id = "flashscore.hide_match_polls",
    name = "Hide match polls",
    description = "Hides the polls on match pages.",
    category = FlashscoreControlsCategory.MATCH_PAGE,
    // The config value is read once when the app builds its config.
    restartRequired = true,
)

/** The app's own match-poll switch answers false while the Patch settings switch is on. */
@Suppress("unused")
val hideMatchPollsPatch = flashscoreControls.featurePatch(HIDE_MATCH_POLLS) {
    forceRemoteConfigValues(
        patchName = "Hide match polls",
        helperName = POLLS_HELPER_NAME,
        forced = mapOf(MATCH_POLL_ENABLED to ForcedConfigValue.FALSE),
        required = setOf(MATCH_POLL_ENABLED),
        gates = mapOf(MATCH_POLL_ENABLED to HIDE_MATCH_POLLS.id),
    )
}
