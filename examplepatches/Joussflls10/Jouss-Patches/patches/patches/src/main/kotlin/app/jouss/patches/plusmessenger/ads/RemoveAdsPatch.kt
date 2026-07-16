package app.jouss.patches.plusmessenger.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.jouss.patches.plusmessenger.shared.Constants.COMPATIBILITY_PLUS_MESSENGER

object AdsDisabledFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsController;",
    name = "adsDisabled",
    returnType = "Z",
    parameters = listOf(),
)

object LoadAdsFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadAds",
    returnType = "V",
)

object LoadNativeAdFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/plus/ads/AdsInstance;",
    name = "loadNativeAd",
    returnType = "V",
)

object IsSponsoredDisabledFingerprint : Fingerprint(
    definingClass = "Lorg/telegram/messenger/MessagesController;",
    name = "isSponsoredDisabled",
    returnType = "Z",
    parameters = listOf(),
)

@Suppress("unused")
val removeAdsPatch = bytecodePatch(
    name = "Remove ads",
    description = "Removes all ads including Plus banner ads and Telegram sponsored messages."
) {
    compatibleWith(COMPATIBILITY_PLUS_MESSENGER)

    execute {
        // Force ads disabled flag
        AdsDisabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)

        // Block ad loading
        LoadAdsFingerprint.method.addInstructions(0, "return-void")
        LoadNativeAdFingerprint.method.addInstructions(0, "return-void")

        // Disable Telegram sponsored messages
        IsSponsoredDisabledFingerprint.method.addInstructions(0, """
            const/4 v0, 0x1
            return v0
        """)
    }
}
