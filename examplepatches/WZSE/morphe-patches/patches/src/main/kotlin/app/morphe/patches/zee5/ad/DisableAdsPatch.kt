/*
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches
 *
 * Disables ad loading in the ZEE5 player. The app uses Google IMA
 * (Interactive Media Ads) for server-side ad insertion. By returning null
 * from `getServerSideAdLoader()`, the IMA ad loader is never created, so no
 * ads are fetched or inserted into playback. Normal content playback is
 * unaffected. This does not remove any paid/subscription functionality.
 */

package app.morphe.patches.zee5.ad

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.zee5.shared.Constants.COMPATIBILITY_ZEE5_TV
import app.morphe.patches.zee5.shared.MediaPlayerAdLoaderFingerprint

@Suppress("unused")
val disableAdsPatch = bytecodePatch(
    name = "Disable ads",
    description = "Disables ad loading (Google IMA server-side ad insertion) in the player. " +
        "Content playback is unaffected. No paid/subscription features are touched."
) {
    compatibleWith(COMPATIBILITY_ZEE5_TV)

    execute {
        // The method returns an ImaServerSideAdInsertionMediaSource$AdsLoader.
        // Returning null makes the player skip ad insertion entirely.
        MediaPlayerAdLoaderFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x0
                return-object v0
            """
        )
    }
}
