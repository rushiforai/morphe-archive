package app.template.patches.mailcom.misc.rating

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.template.patches.shared.Constants.COMPATIBILITY_MAILCOM

// InAppRatingManager.canRequestInAppReviewFlow (9.18.3): true at most once per 30 s. On a
// MailSentEvent, MailListFragment reads it through MailListModuleAdapter.shouldStartInAppFlow and
// then calls launchInAppReviewFlow, the app's only Play review request. Name plus shape: no
// parameters, boolean, reads the clock.
internal object CanRequestInAppReviewFlowFingerprint : Fingerprint(
    name = "canRequestInAppReviewFlow",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(methodCall(name = "getCurrentTimeMillis", parameters = listOf(), returnType = "J")),
    custom = { method, _ -> method.implementation != null },
)

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Disables the rating prompt.",
) {
    compatibleWith(COMPATIBILITY_MAILCOM)

    execute {
        CanRequestInAppReviewFlowFingerprint.method.returnEarly(false)
    }
}
