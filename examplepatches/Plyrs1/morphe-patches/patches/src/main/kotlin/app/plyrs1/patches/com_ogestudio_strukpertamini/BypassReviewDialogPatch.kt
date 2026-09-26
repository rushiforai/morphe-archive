package app.plyrs1.patches.com_ogestudio_strukpertamini

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.plyrs1.patches.shared.Constants.COMPATIBILITY_STRUKPERTAMINI

@Suppress("unused")
val bypassReviewDialogPatch = bytecodePatch(
    name = "Bypass Review Dialog",
    description = "Bypasses the in-app review confirmation dialog when pressing Back on the Home screen, allowing immediate exit.",
    default = true
) {
    compatibleWith(COMPATIBILITY_STRUKPERTAMINI)
    dependsOn(brandCreditPatch)

    execute {
        // Force AppPreference.getReview() to always return Boolean.TRUE
        // This ensures HomeFragment$2.handleOnBackPressed() exits immediately via requireActivity().finish()
        // and InAppReview.requestReviewFlow() short-circuits.
        AppPreferenceGetReviewFingerprint.method.addInstructions(
            0,
            """
                sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;
                return-object v0
            """
        )
    }
}
