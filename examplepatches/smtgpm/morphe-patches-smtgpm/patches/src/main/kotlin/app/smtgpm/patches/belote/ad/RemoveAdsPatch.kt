/*
 * Copyright 2026 smtgpm.
 * https://github.com/smtgpm/morphe-patches-smtgpm
 *
 * See the included NOTICE file for GPLv3 Section 7 terms.
 */

package app.smtgpm.patches.belote.ad

import app.morphe.patcher.patch.rawResourcePatch
import app.smtgpm.patches.belote.shared.Constants.COMPATIBILITY_BELOTE
import app.smtgpm.patches.belote.shared.NativeData
import app.smtgpm.patches.belote.shared.applyNativeEdits
import app.smtgpm.patches.belote.shared.resignFixPatch
import app.smtgpm.patches.belote.shared.verifyNativeLibraryPatch

/**
 * The only interstitial placement is before Solo (training) games. InterstitialAdTask.Load
 * returns immediately, so no interstitial is requested, and
 * MenuUIViewController.OnTableTileTraining always takes its "no ad loaded" branch.
 * Opt-in rewarded videos are not changed.
 */
@Suppress("unused")
val removeAdsPatch = rawResourcePatch(
    name = "Remove ads",
    description = "Removes the full-screen ads before Solo games. Optional reward videos stay.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_BELOTE)

    dependsOn(resignFixPatch, verifyNativeLibraryPatch)

    execute {
        applyNativeEdits(NativeData.REMOVE_INTERSTITIAL_ADS)
    }
}
