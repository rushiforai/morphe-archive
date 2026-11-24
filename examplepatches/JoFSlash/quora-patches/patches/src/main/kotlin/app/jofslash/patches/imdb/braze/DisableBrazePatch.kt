package app.jofslash.patches.imdb.braze

import app.jofslash.patches.imdb.shared.Constants.COMPATIBILITY_IMDB
import app.jofslash.patches.imdb.shared.methodOf
import app.jofslash.patches.imdb.shared.returnBoolean
import app.morphe.patcher.patch.bytecodePatch

// Braze (Appboy) marketing/engagement. BrazeCoordinator.applyBrazeEligibility() starts Braze when
// UserPrivacy.isBrazeAllowed(), and otherwise runs the app's own disableBraze(): the SDK is turned
// off and Braze is marked not eligible, so nothing waits for it.
private const val USER_PRIVACY = "Lcom/imdb/mobile/user/privacy/UserPrivacy;"

@Suppress("unused")
val disableBrazePatch = bytecodePatch(
    name = "Disable Braze",
    description = "Stops the Braze (Appboy) marketing SDK from starting. This also turns off Braze push " +
            "notifications (with Block tracking on, IMDb then sends no push notifications at all), content " +
            "cards and in-app messages, so it is off by default; turn it on only if you don't want Braze at all.",
    default = false
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_IMDB)

    execute {
        // Take the app's own "Braze not allowed" path, as when you decline it in the privacy choices.
        methodOf(USER_PRIVACY, "isBrazeAllowed").returnBoolean(false)
    }
}
