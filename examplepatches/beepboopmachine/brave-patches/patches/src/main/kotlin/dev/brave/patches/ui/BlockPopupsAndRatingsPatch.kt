package dev.brave.patches.ui

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch
import app.morphe.patcher.string
import dev.brave.patches.shared.COMPATIBILITY_BRAVE

internal object RateDialogEligibilityFingerprint : Fingerprint(
    definingClass = "Ltnf;",
    name = "d",
    returnType = "Z",
    parameters = listOf("Landroid/content/Context;"),
    filters = listOf(
        string("brave_rate_dont_show_again")
    )
)

internal object RateDialogShowFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/rate/BraveRateDialogFragment;",
    name = "L4",
    returnType = "V",
    parameters = listOf("Lhz7;", "Ljava/lang/String;"),
    filters = listOf(
        string("brave_rating_dialog_tag")
    )
)

internal object BraveAdsSignupEligibilityFingerprint : Fingerprint(
    definingClass = "Lorg/chromium/chrome/browser/dialogs/BraveAdsSignupDialog;",
    name = "a",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        string("should_show_onboarding_dialog_view_counter")
    )
)

@Suppress("unused")
val blockPopupsAndRatingsPatch = patch(
    name = "Block Popups & Ratings",
    description = "Disables Brave's rating prompt and Brave Ads signup onboarding dialog eligibility checks."
) {
    compatibleWith(COMPATIBILITY_BRAVE)

    execute {
        RateDialogEligibilityFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }

        RateDialogShowFingerprint.method.apply {
            addInstructions(0, "return-void")
        }

        BraveAdsSignupEligibilityFingerprint.method.apply {
            addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return v0
                """.trimIndent()
            )
        }
    }
}
