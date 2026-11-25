package app.jofslash.patches.wikipedia.prompts

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.methodOf
import app.jofslash.patches.wikipedia.shared.setPrefsTrueAtStart
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

// BaseActivity.maybeShowAnnouncement, inlined by R8 into onResume, starts this coroutine. It opens
// at most one full-screen promotion over the home screen or an article: the Reading Challenge
// widget onboarding, the Year in Review onboarding, or the "create an account" screen.
private const val ANNOUNCEMENT_COROUTINE = "Lorg/wikipedia/activity/BaseActivity\$maybeShowAnnouncement\$2;"

@Suppress("unused")
val hideFeaturePromptsPatch = bytecodePatch(
    name = "Hide feature prompts",
    description = "Stops the screens and dialogs that advertise app features by themselves: the Reading " +
            "Challenge, Year in Review and \"create an account\" screens that open over the home screen " +
            "or an article, the prompts to add the search and Reading Challenge widgets, and the " +
            "\"swipe to explore\" hint. The features stay where they are in the app.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        methodOf(ANNOUNCEMENT_COROUTINE, "invokeSuspend", listOf("Ljava/lang/Object;")).addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )

        // The other prompts are shown once and then remember it in a preference.
        setPrefsTrueAtStart(
            listOf(
                "homeSwipeToExplorePromptShown",
                "searchWidgetInstallPromptShown",
                "readingChallengeInstallPromptShown",
            )
        )
    }
}
