/*
 * Ported from ajstrick81's Fox One Android TV patch (GPL-3.0):
 * https://github.com/ajstrick81/morphe-androidtv-patches/tree/main/patches/src/main/kotlin/ajstrick81/morphe/patches/foxone/ads
 * ALL CREDIT FOR THE ORIGINAL HOOK DESIGN GOES TO ajstrick81.
 */

package semicoloncolonel.mobilestream.patches.foxone.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.foxone.shared.Constants

// Straight port of the TV "Skip ads" patch: every hook matches the phone build.
@Suppress("unused")
val skipAdsPatch = bytecodePatch(
    name = "Skip ads",
    description = "Suppresses ads in the Fox One phone app: IMA ad events and DAI streams for " +
        "on-demand video, and Yospace ad events and seek limits for live TV. " +
        "Experimental; test on-device.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    execute {

        // Hooks 1-3 — Fox IMA SDK.
        FoxImaAdEventListenerFingerprint.method.addInstructions(0, "return-void")
        FoxImaAdsLoadedListenerFingerprint.method.addInstructions(0, "return-void")
        FoxPlayerClearVodAdsFingerprint.method.addInstructions(0, "return-void")

        // Hooks 4-5 — fail the VOD and live DAI stream requests through their
        // own onFailure callbacks. In 1.24.0 both callbacks log a warning and
        // fall back to requestStreamMetadata, the plain (non-DAI) stream.
        // .locals 5, so p3 is v8 and fits a 4-bit invoke.
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

        // Hooks 6-8 — Yospace live ad events, slate events, and the
        // fast-forward seek policy that holds the viewer inside a break.
        YospaceDispatchAdEventFingerprint.method.addInstructions(0, "return-void")
        YospaceDispatchSlateEventFingerprint.method.addInstructions(0, "return-void")
        YospaceSeekPolicyFingerprint.method.addInstructions(0, "return-void")
    }
}
