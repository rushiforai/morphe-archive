// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.ui

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The account's answer to "should a karaoke upsell button be drawn?".
 *
 * It is a plain getter over an attribute the server sends, so there is no UI
 * condition to relax: the button is shown only while this answers true.
 */
private object KaraokeUpsellButtonFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "isShowKaraokeUpsellButton",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Hides the buttons that advertise karaoke as a paid extra.
 *
 * Two surfaces ask the question: the full player screen, which shows the button
 * on a track the server says has karaoke, and the player's queue rows, which pass
 * the answer into the row holder. Both read this one getter, so answering false
 * removes the button from both and leaves the surrounding layout to decide what
 * fills the space, exactly as it does for a track without karaoke.
 *
 * The patch stops at the advertisement. Karaoke itself is governed by separate
 * answers that say whether the feature is available and whether the account may
 * use it; those are not touched, so an account that legitimately has karaoke
 * keeps its entry point and only loses the button that tries to sell it.
 */
@Suppress("unused")
val hidePremiumButtonsPatch = bytecodePatch(
    name = "Hide premium feature buttons",
    description = "Stops the player and the queue rows from drawing the karaoke upsell button.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.INTERFACE.label)

    execute {
        KaraokeUpsellButtonFingerprint.method.returnEarly(false)
    }
}
