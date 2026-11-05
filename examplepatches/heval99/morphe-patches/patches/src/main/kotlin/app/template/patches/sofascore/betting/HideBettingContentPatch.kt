package app.template.patches.sofascore.betting

import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.shared.hevalcontrols.featurePatch
import app.template.patches.shared.hevalcontrols.hevalReturnEarly
import app.template.patches.shared.hevalcontrols.hevalReturnNull
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.eventHeadFlag
import app.template.patches.sofascore.controls.hevalFlagGetter
import app.template.patches.sofascore.controls.sofascoreControls

internal val HIDE_BETTING_CONTENT = HevalFeature(
    id = "sofascore.hide_betting_content",
    name = "Hide betting content",
    description = "Hides odds and betting content.",
    category = SofascoreControlsCategory.BETTING,
)

// A Heval Controls feature: every site below answers its stock value while the feature is off.
// Off in Manager by default, as before; on in Controls once the patch is selected.
@Suppress("unused")
val hideBettingContentPatch = sofascoreControls.featurePatch(
    HIDE_BETTING_CONTENT,
    default = false,
) {
    // Validate every site before the first edit.
    val oddsEnabled = OddsEnabledFingerprint.method
    val oddsFlags = EVENT_HEAD_ODDS_FLAGS.map { eventHeadFlag(it) }
    val signUpLink = Bet365SignUpLinkFingerprint.method
    val promotionsEnabled = PromotionsEnabledFingerprint.method
    val oddsProvidersDisabled = OddsProvidersDisabledFingerprint.method

    // 1. The app-wide odds decision: every list, match page and settings check asks it.
    oddsEnabled.hevalReturnEarly(HIDE_BETTING_CONTENT.id, false)

    // 2. The match page's extra odds tabs and blocks (additional odds, odds comparison,
    //    recommended pre-match odds), which follow server flags instead of step 1. The getters
    //    have no local register, so the gate sits before their return.
    oddsFlags.forEach { it.hevalFlagGetter(HIDE_BETTING_CONTENT.id) }

    // 3. No Bet365 sign-up link: both callers (the Bet Boost tab and its claim button)
    //    already treat null as "no link" and leave the entry out.
    signUpLink.hevalReturnNull(HIDE_BETTING_CONTENT.id)

    // 4. The "Promotions" setting off: streaming, ticket and betting promotions.
    promotionsEnabled.hevalReturnEarly(HIDE_BETTING_CONTENT.id, false)

    // 5. Report odds providers as disabled, so the settings screen hides the odds row that
    //    step 1 leaves without effect.
    oddsProvidersDisabled.hevalReturnEarly(HIDE_BETTING_CONTENT.id, true)
}
