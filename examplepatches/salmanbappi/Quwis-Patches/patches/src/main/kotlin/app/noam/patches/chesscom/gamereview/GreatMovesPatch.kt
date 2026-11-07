package app.noam.patches.chesscom.gamereview

import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

/**
 * Switches on chess.com's Great and Brilliant marks in a review by Local Stockfish or by Stockfish on
 * the computer. The classification is already in the extension; this patch turns it on.
 */
@Suppress("unused")
val greatMovesPatch = bytecodePatch(
    name = "Great and Brilliant moves analysis",
    description = "Marks chess.com's Great (!) and Brilliant (!!) moves in a review by Local Stockfish or by " +
        "Stockfish on your computer: the engine's own best move when it was the only one that kept the position " +
        "good, and a best or nearly best move that offers material for good. It needs the engine's second-best " +
        "line, so a review asks for two lines at once (MultiPV 2) - no extra time at the same node budget, but " +
        "the best line ends a ply or two shallower. Selected by default. Needs Unlimited Game Review from this " +
        "bundle: select both patches, and do not also select Unlimited Game Review from another source - two of " +
        "them cannot be applied to one app, the second one fails.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(gameReviewPatch)

    execute {
        markFeaturePatched("greatMovesPatched")
    }
}
