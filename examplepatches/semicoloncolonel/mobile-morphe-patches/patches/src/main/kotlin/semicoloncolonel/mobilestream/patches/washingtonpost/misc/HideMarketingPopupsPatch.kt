package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.disableAirshipInAppMessages
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// WaPo phone 7.18.1. The app's marketing pop-ups (subscription offers and
// other campaigns) are Airship in-app messages; see AirshipInAppMessages.kt.
//
// The paywall is a separate, native bottom sheet driven by metering
// (com.washingtonpost.android.paywall) and is not touched.
@Suppress("unused")
val hideMarketingPopupsPatch = bytecodePatch(
    name = "Hide marketing pop-ups",
    description = "Stops the Washington Post phone app from showing in-app marketing " +
        "pop-ups, such as subscription offers. The paywall itself is not changed, and push " +
        "notifications still work. Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute { disableAirshipInAppMessages() }
}
