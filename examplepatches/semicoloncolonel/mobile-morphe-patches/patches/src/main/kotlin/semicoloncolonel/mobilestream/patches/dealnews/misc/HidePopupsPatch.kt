package semicoloncolonel.mobilestream.patches.dealnews.misc

import semicoloncolonel.mobilestream.patches.shared.misc.isOptionOn
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.shared.misc.HERMES_BUNDLE
import semicoloncolonel.mobilestream.patches.shared.misc.HermesBundle

// ─────────────────────────────────────────────────────────────────────────────
// Hide pop-ups.
//
// DealNews 10.7.2 draws two prompts as Hermes components, and both now render
// nothing:
//
//   UserReviewCard    the "Enjoying DealNews?" card that leads to a rating
//                     in the Play Store.
//   OnboardingModal   the walkthrough shown on first launch.
//
// Not touched: the sign-in modal, which may also be what opens when you
// choose to sign in.
// ─────────────────────────────────────────────────────────────────────────────

private val hidePopupsInBundlePatch = rawResourcePatch {
    execute {
        if (!isOptionOn(hidePromptsAndPopupsPatch, "popUps")) return@execute
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("UserReviewCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("OnboardingModal", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

// Part of hidePromptsAndPopupsPatch: runs only when its "popUps" option is on.
internal val hidePopupsPatch = resourcePatch {
    dependsOn(hidePopupsInBundlePatch)
}
