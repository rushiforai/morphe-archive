package app.template.patches.sofascore.misc.popups

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.template.patches.shared.hevalcontrols.HevalFeature
import app.template.patches.sofascore.controls.SofascoreControlsCategory
import app.template.patches.sofascore.controls.hasModal
import app.template.patches.sofascore.controls.modalQueueHookPatch
import app.template.patches.sofascore.controls.sofascoreControls

/**
 * One switch per promotional modal: the modal's name in the queue and its feature. The ids are
 * mapped back to the names in the extension's SofascoreControls.modalFeature. The consent modals
 * (Regulatory Age Consent, Google Consent) and Active subscription (handled by Disable ads) have no
 * switch. All start on: they are nags, and each can be switched back in Patch settings.
 */
internal val PROMO_POPUP_FEATURES: List<Pair<String, HevalFeature>> = listOf(
    Triple("Match of the Week", "match_of_the_week", "Match of the Week"),
    Triple("Remove Ads", "remove_ads", "Remove Ads"),
    Triple("Promotion modal", "promotion", "promotion"),
    Triple("Weekly Challenge", "weekly_challenge", "Weekly Challenge"),
    Triple("Survey", "survey", "survey"),
    Triple("Propose Follow Entity", "propose_follow", "follow suggestion"),
).map { (modal, key, title) ->
    modal to HevalFeature(
        id = "sofascore.hide_modal_$key",
        name = "Hide ${title.replaceFirstChar(Char::uppercaseChar)} pop-up",
        description = "Stops the $title pop-up.",
        category = SofascoreControlsCategory.POPUPS,
    )
}

// Several Heval Controls features in one patch: each is registered only when its modal exists.
@Suppress("unused")
val hidePromoPopupsPatch = bytecodePatch(
    name = "Hide promo pop-ups",
    description = "Stops promotional pop-ups.",
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(sofascoreControls.patch, modalQueueHookPatch)

    execute {
        // The modal queue hook drops a modal whose switch is on before it is queued, whichever
        // path adds it (startup evaluator or on-demand enqueue).
        val present = PROMO_POPUP_FEATURES.filter { (modal, _) -> hasModal(modal) }
        if (present.isEmpty()) throw PatchException("None of the promotional modals exists")
        present.forEach { (_, feature) -> sofascoreControls.register(feature) }
    }
}
