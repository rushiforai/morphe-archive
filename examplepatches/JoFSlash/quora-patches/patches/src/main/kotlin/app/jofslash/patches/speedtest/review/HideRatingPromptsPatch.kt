package app.jofslash.patches.speedtest.review

import app.jofslash.patches.speedtest.shared.Constants.COMPATIBILITY_SPEEDTEST
import app.jofslash.patches.speedtest.shared.methodOf
import app.jofslash.patches.speedtest.shared.returnEarly
import app.morphe.patcher.patch.bytecodePatch

// The one class that implements InAppReviewManager; its name is R8-assigned. The single method
// takes the host Activity and kicks off Google Play's in-app review flow (requestReviewFlow then
// launchReviewFlow).
private const val IN_APP_REVIEW_MANAGER_IMPL = "Lcom/ookla/mobile4/screens/main/rating/e;"

@Suppress("unused")
val hideRatingPromptsPatch = bytecodePatch(
    name = "Hide rating prompts",
    description = "Stops the Google Play in-app review dialog that asks you to rate the app.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_SPEEDTEST)

    execute {
        methodOf(IN_APP_REVIEW_MANAGER_IMPL, "a", listOf("Landroid/app/Activity;")).returnEarly()
    }
}
