package app.aidan.patches.canvas.privacy

import app.aidan.patches.canvas.shared.COMPATIBILITY_CANVAS
import app.aidan.patches.shared.disableRequiredVoidMethods
import app.aidan.patches.shared.returnRequiredBoolean
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val disableAiStudyToolsPatch = bytecodePatch(
    name = "Disable AI Study Tools",
    description = "Hides Study Tools and stops page content from being sent to Instructure's AI " +
        "study-assist endpoint.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_CANVAS)

    execute {
        // checkStudyToolsAvailability is the only path that calls GetStudyToolsUseCase.
        disableRequiredVoidMethods(
            "Lcom/instructure/pandautils/features/studytools/StudyToolsViewModel;",
            "checkStudyToolsAvailability"
        )
        // PageDetailsScreenKt renders the Study Tools button only when this is true.
        returnRequiredBoolean(
            "Lcom/instructure/pandautils/features/studytools/StudyToolsUiState;",
            "getAvailable",
            false
        )
    }
}
