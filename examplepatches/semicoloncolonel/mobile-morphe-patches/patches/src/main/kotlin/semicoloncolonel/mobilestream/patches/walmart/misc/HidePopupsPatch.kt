package semicoloncolonel.mobilestream.patches.walmart.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.walmart.shared.Constants
import semicoloncolonel.mobilestream.patches.walmart.shared.filterWalmartTempoModules
import semicoloncolonel.mobilestream.patches.walmart.shared.forceWalmartFlagsOff

// ─────────────────────────────────────────────────────────────────────────────
// Hide pop-ups.
//
// Walmart 26.42.2:
//
//   Flags        thank-you surveys and review requests, the thank-you
//                notification banner, the upgrade nudges, the home, cart,
//                and search tooltips and coach marks, the holiday splash,
//                and the Qualtrics and help surveys. The keys in
//                ShoppingAdsFilter.isWalmartPopupKey read as off.
//   Nudges       sign-in, write-a-review, and survey nudges that arrive as
//                Tempo modules are dropped from the page.
//   Feedback     the "We'd love to hear what you think! Give feedback" row
//                on item, list, and content pages. Its view state is always
//                built with isEnabled false, and the row collapses.
// ─────────────────────────────────────────────────────────────────────────────

internal object FeedbackViewStateFingerprint : Fingerprint(
    definingClass = "Lcom/walmart/glass/tempo/shared/component/feedback/viewstate/a;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Z"),
)

@Suppress("unused")
val hidePopupsPatch = bytecodePatch(
    name = "Hide pop-ups",
    description = "Removes surveys, review and feedback requests, tooltips, nudges, and the holiday splash.",
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        forceWalmartFlagsOff("isWalmartPopupKey")
        filterWalmartTempoModules("walmartNagModules")
        FeedbackViewStateFingerprint.method.addInstructions(0, "const/4 p1, 0x0")
    }
}
