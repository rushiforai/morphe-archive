/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.collections

import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.NativeData
import app.smtgpm.patches.belote.shared.applyNativeEdits
import app.smtgpm.patches.belote.shared.resignFixPatch
import app.smtgpm.patches.belote.shared.verifyNativeLibraryPatch

/**
 * Zeroes the WaitForSeconds of the pack opening coroutines (ShowPackOpening, ShowGrantedItems,
 * ContAnim) and of the album hand-over (DistributePackRewards), and shortens the card flights
 * into the album from 0.5 s to 0.125 s. The star pack flow (duplicates exchange:
 * CollectionDuplicatesUIView.ShowRewards and AnimateNewPacksToIcon, and its own ContAnim) gets
 * the same treatment. The packs' own Animator clips still play.
 */
@Suppress("unused")
val fastPackOpeningPatch = rawResourcePatch(
    name = "Fast pack opening",
    description = "Shows all cards of a pack at once and skips the pauses between packs, star packs included.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch, verifyNativeLibraryPatch)

    execute {
        applyNativeEdits(NativeData.FAST_PACK_OPENING)
    }
}
