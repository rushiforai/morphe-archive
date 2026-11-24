package app.jofslash.patches.kaloricketabulky.review

import app.jofslash.patches.kaloricketabulky.shared.Constants.APP
import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.methodOf
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

private const val GET_REVIEW_BANNER_STATE = "$APP/screenFragment/home/reviews/GetReviewBannerStateUseCase;"
private const val REVIEW_CARD_HIDDEN = "$APP/screenFragment/home/ReviewCardState\$Hidden;"

@Suppress("unused")
val hideRatingPromptsPatch = bytecodePatch(
    name = "Hide rating prompts",
    description = "Hides the card on the home screen that asks how you like the app and then asks you to rate " +
            "it on Google Play.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // Decides which review card (if any) the home screen shows. It is a suspend function, so
        // returning the answer at once finishes it without suspending.
        methodOf(GET_REVIEW_BANNER_STATE, "invoke").addInstructions(
            0,
            """
                sget-object v0, $REVIEW_CARD_HIDDEN->INSTANCE:$REVIEW_CARD_HIDDEN
                return-object v0
            """
        )
    }
}
