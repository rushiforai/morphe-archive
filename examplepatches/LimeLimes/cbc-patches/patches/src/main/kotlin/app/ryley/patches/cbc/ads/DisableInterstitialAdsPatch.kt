package app.ryley.patches.cbc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ryley.patches.cbc.shared.Constants.COMPATIBILITY_CBC_NEWS

/**
 * Stops the app from showing full-screen interstitial ads.
 *
 * `showDefaultInterstitialAd(...)` returns whether an interstitial was shown. Returning `false`
 * reports "no ad was shown" to every caller, so the app carries on as it would when a fill is
 * missing instead of waiting on a dialog that never appears.
 */
@Suppress("unused")
val disableInterstitialAdsPatch = bytecodePatch(
    name = "Disable interstitial ads",
    description = "Prevents the app from showing full-screen interstitial ads.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CBC_NEWS)

    execute {
        ShowInterstitialAdFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )
    }
}
