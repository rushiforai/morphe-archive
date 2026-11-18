package app.jofslash.patches.quora.review

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.bytecodePatch

/**
 * The handler for the web page's "request review" message, which launches the Google Play review dialog.
 */
internal object LaunchReviewFlowFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/util/RequestReviewFlow;",
    returnType = "V",
    strings = listOf("ReviewInfo object is null when requesting review flow"),
)

@Suppress("unused")
val disableRatingPromptsPatch = bytecodePatch(
    name = "Disable rating prompts",
    description = "Stops the app from asking you to rate it on Google Play.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    execute {
        LaunchReviewFlowFingerprint.method.addInstruction(0, "return-void")
    }
}
