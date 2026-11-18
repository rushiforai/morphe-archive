package io.github.henr1klmb.patches.mydealz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

@Suppress("unused")
val hidePopupsPatch = patch(
    name = "Hide popups",
    description = "Disables in-app review prompts, popups, and surveys.",
) {
    compatibleWith(MYDEALZ_COMPATIBILITY)

    execute {
        // Neutralize Google Play In-App Review dialog
        PlayCoreReviewFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                invoke-static {p0}, Lcom/google/android/gms/tasks/Tasks;->forResult(Ljava/lang/Object;)Lcom/google/android/gms/tasks/Task;
                move-result-object p0
                return-object p0
            """.trimIndent(),
        )

        // Bypass notifications permission bottom sheet prompt and continue regular flow
        NotificationPermissionPromptFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-interface {p1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;
                return-void
            """.trimIndent(),
        )

        // Dismiss CSAT (Customer Satisfaction) survey popup dialog immediately
        CsatSurveyDialogFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-virtual {p0}, Lcom/google/android/material/bottomsheet/BottomSheetDialogFragment;->dismiss()V
                return-void
            """.trimIndent(),
        )
    }
}
