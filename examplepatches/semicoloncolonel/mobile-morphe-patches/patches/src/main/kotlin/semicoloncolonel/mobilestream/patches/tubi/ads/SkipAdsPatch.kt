/*
 * Ported from ajstrick81's Tubi Android TV patch:
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/tubi/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.tubi.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.shared.misc.disableAutoUpdatesPatch
import semicoloncolonel.mobilestream.patches.tubi.shared.Constants

// Port of the TV "Skip ads" patch to the phone app. Dropped from the TV
// patch: the legacy ImagePauseAds.n hook (that method no longer exists; its
// work moved into suspend functions) and the two SPA WebView hooks (the phone
// UI is native and never loads ott-androidtv.tubitv.com).
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Suppresses ads in the Tubi phone app: IMA ad events and DAI streams, " +
        "Rainmaker ad breaks, and image pause ads. Also stops the Play Store from " +
        "auto-updating the patched app.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    // A Play Store update would replace the patched app and bring the ads
    // back, so Tubi always gets the auto-update block with this patch.
    dependsOn(disableAutoUpdatesPatch)

    execute {

        // Hooks 1-3 — Fox IMA SDK, identical to the TV build.
        FoxImaAdEventListenerFingerprint.method.addInstructions(0, "return-void")
        FoxImaAdsLoadedListenerFingerprint.method.addInstructions(0, "return-void")
        FoxPlayerClearVodAdsFingerprint.method.addInstructions(0, "return-void")

        // Hooks 4-5 — fail the VOD and live DAI stream requests through their
        // own onFailure callbacks, as the TV patch does.
        FoxImaVodStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface {p3, v0}, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamUrlCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """
        )
        FoxImaLiveStreamRequestFingerprint.method.addInstructions(
            0,
            """
                const-string v0, "dai_blocked"
                invoke-interface {p3, v0}, Lcom/fox/android/video/player/loaders/ImaStreamIdLoader${"$"}ImaStreamIdCallback;->onFailure(Ljava/lang/String;)V
                return-void
            """
        )

        // Hook 6 — Rainmaker ad-break fetch. Same approach as the TV patch:
        // return an immediate error result instead of suspending, so the
        // coroutine completes and the caller takes its existing error branch.
        // The callers test only `instance-of p9d$d` (success); anything else
        // is treated as "no ad breaks". p9d$c(Throwable) is the generic error
        // subtype of the NetworkResponse wrapper in 10.43.1. R8 renames the
        // wrapper per release (10.42.0: u9d, TV 10.40: Bn/d), so re-pin it on
        // bumps.
        PhoneGetAdBreaksFingerprint.method.addInstructions(
            0,
            """
                new-instance v0, Ljava/io/IOException;
                const-string v1, "ads_blocked"
                invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
                new-instance v1, Lp9d${"$"}c;
                invoke-direct {v1, v0}, Lp9d${"$"}c;-><init>(Ljava/lang/Throwable;)V
                return-object v1
            """
        )

        // Hooks 7-8 — both places that post the pause-ad bitmap to the
        // LiveData PauseAdsView observes. Skipping them means the view is
        // never raised, for one-shot and rotating pause ads alike.
        PhonePauseAdCallbackFingerprint.method.addInstructions(0, "return-void")
        PhonePauseAdRotationFingerprint.method.addInstructions(0, "return-void")
    }
}
