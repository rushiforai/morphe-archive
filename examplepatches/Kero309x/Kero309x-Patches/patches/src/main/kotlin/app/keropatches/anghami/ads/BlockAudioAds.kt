// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.ads

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The player's answer to "does an advertisement belong after this track?".
 *
 * The player asks this once per finished track. Stock answers true when the queue
 * allows ads, the current song is not exempt, the server's ad frequency is
 * positive and no offline playback is in progress. The same answer is used when
 * the player reports how long the current item runs, so the advertisement is
 * included in the reported timeline only while this is true.
 */
private object AdSlotFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/core/S;",
    name = "L0",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Stops the player from putting an advertisement between tracks.
 *
 * The queue asks this predicate when a track ends. Answering false takes the
 * player's ordinary "advance to the next track" branch: the same branch that runs
 * when the server sends no ad, when the queue disables ads, or when the current
 * song is exempt. Because that branch already exists in the stock build, playback
 * continues without any new code and without leaving the player in an ad state.
 *
 * Only the decision is changed. The ad pipeline still fetches and caches its
 * models, and the player still knows how to play an ad if one is handed to it
 * from somewhere else; that is deliberate, so nothing here has to reason about a
 * half-initialised ad player.
 */
@Suppress("unused")
val blockAudioAdsPatch = bytecodePatch(
    name = "Block ads between tracks",
    description = "Stops the player from inserting audio and video advertisements between tracks.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.ADS.label)

    execute {
        AdSlotFingerprint.method.returnEarly(false)
    }
}
