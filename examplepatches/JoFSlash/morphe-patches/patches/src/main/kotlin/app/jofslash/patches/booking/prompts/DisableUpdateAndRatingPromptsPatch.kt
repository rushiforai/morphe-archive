package app.jofslash.patches.booking.prompts

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/** Runs Google Play's in-app update (and its "go to the website" fallback) on every screen. */
private const val IN_APP_UPDATE_DELEGATE = "Lcom/booking/inappupdate/InAppUpdateActivityDelegate;"

/** Opens the "This version is no longer supported" screen when Booking's server says so. */
private const val OBSOLETE_APP_COMPANION = "Lcom/booking/activity/ObsoleteAppActivity\$Companion;"

/** Asks Google Play for the "Rate this app" card after a booking. */
private const val APP_REVIEW_HELPER = "Lcom/booking/appreviews/AppReviewHelper;"

@Suppress("unused")
val disableUpdateAndRatingPromptsPatch = bytecodePatch(
    name = "Disable update and rating prompts",
    description = "Stops the \"update available\" and \"this version is no longer supported\" prompts, which " +
            "a patched app can't act on, and the Google Play \"rate this app\" card after a booking.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        // When Booking's server says an update is due, this starts Google Play's update flow
        // (a download bar, or a full-screen update) or, without Google Play, a dialog that sends
        // you to the mobile website. It's a suspend function: return Unit, as when no update is due.
        methodOf(IN_APP_UPDATE_DELEGATE, "updateAppIfNecessary").addInstructions(
            0,
            """
                sget-object v0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;
                return-object v0
            """
        )
        methodOf(IN_APP_UPDATE_DELEGATE, "showWebUpdateDialog").returnEarly()

        // The "obsolete" screen, shown when the server answers the app's start-up check with
        // status "obsolete" and Google Play isn't usable (as with MicroG). When the update is
        // forced it closes every other screen, so the app can't be used at all.
        methodOf(OBSOLETE_APP_COMPANION, "showUpdateDialogIfNeeded").returnEarly()

        // The only in-app review request: Google Play's review card on the booking confirmation.
        methodOf(APP_REVIEW_HELPER, "requestInAppReviewAfterBooking").returnEarly()
    }
}
