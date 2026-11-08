package app.apppatches.patches.vtvgo

import app.apppatches.patches.shared.Constants.VTVGO_COMPATIBILITY
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.matchSingle

/**
 * Throwing "as1" from the IMA loader is caught by the Pigeon handler, which
 * sends a PlatformException back to Dart. The ad repository treats it as a
 * failed ad request and lets playback continue.
 */
private fun app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.disableImaRequest() {
    val provider = getFreeRegisterProvider(0, 4)
    val exception = provider.getFreeRegister4Bit()
    val code = provider.getFreeRegister4Bit()
    val message = provider.getFreeRegister4Bit()
    val details = provider.getFreeRegister4Bit()

    addInstructions(
        0,
        """
            new-instance v$exception, Las1;
            const-string v$code, "ad-disabled"
            const-string v$message, "Ads are disabled by patch"
            const-string v$details, ""
            invoke-direct {v$exception, v$code, v$message, v$details}, Las1;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
            throw v$exception
        """.trimIndent()
    )
}

@Suppress("unused")
val vtvgoRemoveVideoAdsPatch = bytecodePatch(
    name = "Remove Video Ads",
    description = "Removes VTVGo pre-roll, mid-roll, welcome TVC and other VAST/IMA ads by rejecting " +
        "ad requests before playback starts.",
    default = true
) {
    compatibleWith(VTVGO_COMPATIBILITY)

    execute {
        // BetterPlayer wraps the content source in AdsMediaSource when this is
        // called. Skipping it plays the content without any ad break.
        BetterPlayerAttachAdsFingerprint.matchSingle().method.addInstructions(0, "return-void")

        // interactive_media_ads (welcome TVC and any IMA-based player ads).
        ImaAdsLoaderRequestAdsFingerprint.matchSingle().method.disableImaRequest()
        ImaAdsLoaderRequestStreamAdsFingerprint.matchSingle().method.disableImaRequest()
    }
}

@Suppress("unused")
val vtvgoBlockProductAdsPatch = bytecodePatch(
    name = "Block Product Ad Banners",
    description = "Points the product-ad API endpoint at a non-existent path so in-app ad banners are " +
        "not loaded. Best effort: ads embedded in content responses are not affected.",
    default = true
) {
    compatibleWith(VTVGO_COMPATIBILITY)
    dependsOn(vtvgoBlockProductAdsHexPatch)

    execute {}
}
