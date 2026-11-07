package app.noam.patches.chesscom.gamereview

import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

/**
 * Adds the fourth reviewer to Unlimited Game Review: Stockfish on the user's own computer, searched
 * over sf-bridge. The review code is already in the extension; this patch switches it on.
 */
@Suppress("unused")
val computerReviewPatch = bytecodePatch(
    name = "Game Review on your computer",
    description = "Adds Stockfish on your computer to Game Review: the same review, searched there over Wi-Fi " +
        "by sf-bridge, much faster than on the phone. The settings have the computer's address and token, its " +
        "own depth and thread count, a connection test and a benchmark. Selected by default. Needs Unlimited " +
        "Game Review from this bundle: select both patches, and do not also select Unlimited Game Review from " +
        "another source - two of them cannot be applied to one app, the second one fails.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(gameReviewPatch)

    execute {
        markFeaturePatched("computerReviewPatched")
    }
}
