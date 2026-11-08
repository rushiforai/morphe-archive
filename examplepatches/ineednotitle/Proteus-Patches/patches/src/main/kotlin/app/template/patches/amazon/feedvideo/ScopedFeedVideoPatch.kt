// App-scoped Amazon entry — thin wrapper depending on the universal
// "Disable video autoplay (ExoPlayer/Media3)" heuristic. No app-specific
// fingerprints (no Amazon binary analysis has been done in this environment).
// Unverified on device.
//
// Why this exists separately from "Disable video autoplay" (default ON):
// that patch only gates WebView media gesture playback (MShopWebView). The
// Amazon home-feed native video units ("live" promotional videos, review
// carousels, sponsored reels) are native ExoPlayer/Media3 players and are
// NOT covered by it — see issue #21.
package app.template.patches.amazon.feedvideo

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.AMAZON_IN_COMPATIBILITY
import app.template.patches.shared.Constants.AMAZON_SHOPPING_COMPATIBILITY
import app.template.patches.shared.logUniversal
import app.template.patches.shared.media.disableAutoplayPatch

@Suppress("unused")
val amazonStopFeedVideoAutoplayPatch = bytecodePatch(
    name = "Amazon: Stop feed video autoplay",
    description = """
        Stops Amazon's home-feed native video units (live promotional videos,
        review carousels, sponsored reels) from starting on their own, using
        the same setPlayWhenReady(true) → false heuristic as the universal
        'Disable video autoplay (ExoPlayer/Media3)' patch.

        Covers native ExoPlayer/Media3 players only — NOT the in-app WebView
        pages (use the default-on 'Disable video autoplay' patch for those),
        and NOT WebView CSS-injected ad blocks (use 'Remove ads'). Heuristic:
        reflection or obfuscated player setup is not covered. Can stop playback
        entirely in apps whose only play path is a flipped literal call — turn
        it off if videos never start. Unverified on device.
    """.trimIndent(),
    default = false,
) {
    compatibleWith(AMAZON_SHOPPING_COMPATIBILITY, AMAZON_IN_COMPATIBILITY)
    dependsOn(disableAutoplayPatch)

    execute {
        logUniversal("Amazon: enabling ExoPlayer feed video autoplay block.")
    }
}
