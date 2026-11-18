package app.ghostknow.patches.lihkg

import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.returnEarly
import app.ghostknow.patches.shared.Constants.COMPATIBILITY_LIHKG

/** 2100-01-01T00:00:00Z, so the account screen shows a valid 到期日. */
private const val PLUS_EXPIRY_EPOCH_MS = 4102444800000L

/**
 * LIHKG+ membership.
 *
 * The app keeps the entitlement in one SharedPreferences boolean, key "is_plus_user",
 * written from the API account model (Me.is_plus_user) at login and on every
 * /api_v2/system/property refresh, and read back through a single helper method.
 * Forcing that reader plus the model getter to true flips every client-side gate:
 *
 *  - fullscreen and in-feed ad placement
 *  - the X-LI-PLUS request header, which the app signs locally with
 *    Utils.loadPlusDigest (native libnative-vip.so: sha1 over the flag with an
 *    embedded salt), so the request goes out claiming plus=1
 *  - post_plus.html instead of post.html in the thread webview
 *  - the LIHKG+ row, "續購 LIHKG+" label and 到期日 on the account screen
 *  - the isPlus value handed to the WebView JS bridge
 *
 * Note: the X-LI-PLUS header is only added when signed in, so as a guest the server
 * still returns ad configs (Thread.acf). Log in to see the effect.
 */
@Suppress("unused")
val plusMembershipPatch = patch(
    name = "Always plus member",
    description = "Reports the signed-in account as an LIHKG+ member everywhere the app checks.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_LIHKG)

    execute {
        // The gate itself: the only reader of the "is_plus_user" preference.
        PlusUserPrefFingerprint.method.returnEarly(true)

        // The account model getter the preference is written from.
        MeIsPlusUserFingerprint.method.returnEarly(true)

        // Cosmetic: keep the account screen's expiry label in the future.
        MePlusExpiryFingerprint.method.returnEarly(PLUS_EXPIRY_EPOCH_MS)
    }
}
