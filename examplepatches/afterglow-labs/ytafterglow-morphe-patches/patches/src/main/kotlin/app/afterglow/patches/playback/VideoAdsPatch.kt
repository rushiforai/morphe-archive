/*
 * YTAfterglow for Android.
 *
 * Adapted from the video ads part of the "Hide ads" patch of Morphe patches v2.2.0
 * (https://github.com/MorpheApp/morphe-patches, GPLv3), which was forked from ReVanced
 * patches (https://github.com/ReVanced/revanced-patches, GPLv3). Modified for
 * YTAfterglow: rewritten for patcher 2.1.0, gated by the iOS setting noAds.
 * Not an official Morphe or ReVanced file.
 *
 * Portions of this software are provided "AS IS" by the Morphe software project.
 * Any express or implied warranties, including the implied warranties of
 * merchantability and fitness for a particular purpose, are disclaimed.
 */

package app.afterglow.patches.playback

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.video.debugMatch
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch

private const val VIDEO_ADS_CLASS = "$EXTENSION_PLAYBACK/VideoAds;"

/** Loads the ads of a video when their trigger activates. 21.43.523: `Lacwh;->t(Ljava/util/List;)V`. */
internal object LoadVideoAdsFingerprint : Fingerprint(
    strings = listOf(
        "TriggerBundle doesn't have the required metadata specified by the trigger ",
        "Ping migration no associated ping bindings for activated trigger: ",
    ),
)

/** Builds the player ad layout of a video. 21.43.523: `Ladew;->b(Lalfi;)V`. */
internal object PlayerBytesAdLayoutFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("L"),
    strings = listOf("Bootstrapped layout construction resulted in non PlayerBytesLayout. PlayerAds count: "),
)

/**
 * Video ads for the iOS setting `noAds` (tweak "remove-ads"). iOS empties the ad arrays of the
 * player response and removes the ads playback coordinator; here the two places that load and
 * lay out a video's ads return at once, so no ad plays before or during the video. The feed
 * ads are the Litho filter's job.
 */
internal val videoAdsHookPatch = bytecodePatch(
    description = "Stops video ads from loading when Afterglow removes ads.",
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)

    execute {
        val loadAds = LoadVideoAdsFingerprint.method
        val adLayout = PlayerBytesAdLayoutFingerprint.method
        debugMatch("loadVideoAds", loadAds)
        debugMatch("playerAdLayout", adLayout)

        listOf(loadAds, adLayout).forEach { method ->
            method.returnEarlyWhen("$VIDEO_ADS_CLASS->hideVideoAds()Z")
        }
    }
}
