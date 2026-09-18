package app.ryley.patches.cbc.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.ryley.patches.cbc.shared.Constants.COMPATIBILITY_CBC_NEWS

/**
 * Disables on-demand video ads (the pre/mid-rolls played by Google IMA).
 *
 * Forcing the `hasOnDemandAds` parameter of `PlayerManager.prepareAndPlayContent(...)` to false
 * makes the player take its ad-free path: no ad `DataSpec` is built from `MediaItem.getAdUrl()`,
 * no IMA-backed media source factory is created and `ImaAdsLoader.setPlayer(...)` is never called.
 * Content itself is unaffected — this is the same path the app already uses for clips that have no
 * ad tag.
 *
 * Live streams that use Google DAI are stitched server-side and are not addressed here.
 */
@Suppress("unused")
val disableVideoAdsPatch = bytecodePatch(
    name = "Disable video ads",
    description = "Prevents pre-roll and mid-roll ads from playing in the video player.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_CBC_NEWS)

    execute {
        // v12 is this method's `hasOnDemandAds` parameter.
        ImaOnDemandAdsFingerprint.method.addInstructions(0, "const/4 v12, 0x0")
    }
}
