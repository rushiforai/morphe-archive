package app.aimal.patches.viki

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

/**
 * Removes advertising from Viki.
 *
 * Viki runs two independent ad systems and this turns off both:
 *
 *  * **Video ads** - pre-roll and mid-roll, served through Google IMA as
 *    VAST/VMAP and inserted with media3's local ad insertion, with Amazon
 *    header bidding in front of the ad request.
 *  * **Display ads** - a Google Ad Manager banner driven by
 *    `com.viki.adsmanager.AdManager`.
 *
 * Three methods are rewritten, none longer than two instructions:
 *
 *  1. `SessionManagerImpl.hasNoAdsFeature()` -> true. This is the entitlement
 *     the app itself consults for both ad systems, so this alone already
 *     silences the banners and makes `shouldShowAds()` return false.
 *  2. `VideoFragment.shouldShowAds()` -> false, directly, so video ads are off
 *     even if a future build stops routing that decision through the session
 *     manager.
 *  3. `AdsViewModel.getAdSetting()` -> null, so no ad tag can be built at all.
 *
 * (2) is what stops the ad *requests*, not just the playback: the coroutine
 * that fetches the ad tag is launched inside the `shouldShowAds() == true`
 * branch, so with it false nothing is ever sent to doubleclick.net or to
 * Amazon's bidder. (3) is redundant insurance and is skipped silently if it
 * does not match.
 *
 * Every branch this takes is a branch the app already takes today for Viki Pass
 * subscribers, so nothing here reaches code paths that Viki does not run
 * itself.
 *
 * This does not touch DRM, licensing, or paid-content entitlement: rentals and
 * subscriber-only titles are unaffected. `Features.hd` is deliberately left
 * alone, because forcing it changes the quality label and nothing else - see
 * the note in Fingerprints.kt.
 */
@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes pre-roll and mid-roll video ads, and the display banners.",
    default = true,
) {
    compatibleWith(VIKI)

    execute {
        // 1. Hold the no-ads entitlement. Both ad systems read this.
        val hasNoAds = SessionManagerHasNoAdsFingerprint.methodOrNull
            ?: throw PatchException(
                "Could not find the no-ads entitlement check. Viki has " +
                    "probably reworked com.viki.library.beans.Features."
            )

        hasNoAds.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """,
        )

        // 2. Never show video ads.
        //
        // Also the reason no ad request is made: the ad-tag coroutine is
        // launched from inside this method's true branch.
        val shouldShowAds = VideoFragmentShouldShowAdsFingerprint.methodOrNull
            ?: throw PatchException(
                "Could not find VideoFragment.shouldShowAds. Viki has " +
                    "probably reworked its player."
            )

        shouldShowAds.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return v0
            """,
        )

        // 3. Belt and braces: never build an ad tag.
        //
        // Unreachable once (2) is applied, so a miss here is not an error -
        // ads are already gone. Returning null is safe because the field this
        // result lands in is nullable and every read of it is null-checked;
        // null is exactly what a subscriber's session produces today.
        AdsViewModelGetAdSettingFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """,
        )
    }
}
