package semicoloncolonel.mobilestream.patches.dealnews.misc

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.patch.resourcePatch
import semicoloncolonel.mobilestream.patches.dealnews.shared.Constants
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
        val file = get(HERMES_BUNDLE)
        val bundle = HermesBundle(file.readBytes())
        bundle.returnAtStart("UserReviewCard", HermesBundle.Value.NULL)
        bundle.returnAtStart("OnboardingModal", HermesBundle.Value.NULL)
        file.writeBytes(bundle.toByteArray())
    }
}

@Suppress("unused")
val hidePopupsPatch = resourcePatch(
    name = "Hide pop-ups",
    description = "Removes the rating card and the first-launch walkthrough.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(hidePopupsInBundlePatch)
}
