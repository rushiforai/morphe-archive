package app.jofslash.patches.wikipedia.surveys

import app.jofslash.patches.wikipedia.shared.Constants.COMPATIBILITY_WIKIPEDIA
import app.jofslash.patches.wikipedia.shared.setPrefsTrueAtStart
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideSurveysPatch = bytecodePatch(
    name = "Hide surveys",
    description = "Stops the feedback surveys that pop up by themselves: the one about the home feed and " +
            "the one after using Read aloud. Feedback you send yourself still works.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_WIKIPEDIA)

    execute {
        // Once its "shown" flag is true, the app doesn't show that survey again. R8 inlined the
        // checks and SurveyDialog into their callers, so the flags are set instead.
        setPrefsTrueAtStart(
            listOf(
                "homeFeedSurveyShown",
                "readAloudLeadSectionSurveyShown",
            )
        )
    }
}
