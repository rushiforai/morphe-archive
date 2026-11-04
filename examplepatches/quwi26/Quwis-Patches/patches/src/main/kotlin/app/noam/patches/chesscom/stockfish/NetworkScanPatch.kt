package app.noam.patches.chesscom.stockfish

import app.morphe.patcher.patch.bytecodePatch
import app.noam.patches.chesscom.gamereview.computerReviewPatch
import app.noam.patches.chesscom.shared.Constants
import app.noam.patches.chesscom.shared.markFeaturePatched

/**
 * Finds sf-bridge on the phone's own Wi-Fi, so the computer's address is never read off ipconfig and
 * does not go stale when the router hands out a different one. The scan itself is in the extension,
 * next to the bridge's own settings; this patch switches it on.
 */
@Suppress("unused")
val networkScanPatch = bytecodePatch(
    name = "Find the computer on the network",
    description = "Adds Find on the network to the computer review settings: it sweeps the phone's Wi-Fi " +
        "and fills in the address sf-bridge answers on, keeps the addresses that worked, and lets a review " +
        "find the computer by itself when the set address no longer answers. In a guest, office or " +
        "co-working network the devices are often kept apart, and then nothing is found. Needs Game Review " +
        "on your computer, from this bundle.",
    default = true,
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(computerReviewPatch)

    execute {
        markFeaturePatched("networkScanPatched")
    }
}
