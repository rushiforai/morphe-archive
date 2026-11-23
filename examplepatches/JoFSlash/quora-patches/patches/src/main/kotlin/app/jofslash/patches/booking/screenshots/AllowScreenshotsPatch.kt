package app.jofslash.patches.booking.screenshots

import app.jofslash.patches.booking.shared.Constants.COMPATIBILITY_BOOKING
import app.jofslash.patches.booking.shared.methodOf
import app.jofslash.patches.booking.shared.returnEarly
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/** Every screen of the app (BaseActivity) goes through this delegate. */
private const val BASE_ACTIVITY_DELEGATE = "Lcom/booking/di/commonui/BaseActivityDelegate;"

/** The payment screens (card entry, wallet, payment status, bank web pages) set the flag here. */
private const val PAYMENT_SCREENSHOTS_UTILS = "Lcom/booking/payment/component/ui/common/ScreenshotsUtilsKt;"

@Suppress("unused")
val allowScreenshotsPatch = bytecodePatch(
    name = "Allow screenshots",
    description = "Lets you take screenshots and record the screen on booking, trip and payment screens, " +
            "which the app normally shows as a black image. Useful for keeping your own copy of a " +
            "booking or a price.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_BOOKING)

    execute {
        // Screens that show your bookings or personal details call this on start. It adds
        // FLAG_SECURE (0x2000) unless the hidden "sensitive screenshots" setting is on. Never add it.
        methodOf(BASE_ACTIVITY_DELEGATE, "disableScreenshots").returnEarly()

        // The payment screens add or clear FLAG_SECURE depending on what the app tells the payment
        // module (ALLOW_SCREENSHOTS, normally false). Always clear it.
        methodOf(
            PAYMENT_SCREENSHOTS_UTILS,
            "allowScreenshotsBasedOnUiScreenshotsDependency",
            listOf("Landroid/view/Window;"),
        ).addInstructions(
            0,
            """
                const/16 v0, 0x2000
                invoke-virtual { p0, v0 }, Landroid/view/Window;->clearFlags(I)V
                return-void
            """
        )
    }
}
