// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.skips

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The queue predicate that decides whether skip counting applies at all.
 *
 * Stock answers true for a free account when the queue is not flagged as
 * exempting skips and the account has a positive skip allowance. Everything that
 * records, counts and refuses a skip hangs off this one answer, so it is the
 * narrowest point that removes the limit without touching the entitlement.
 */
private object SkipLogicFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/odin/playqueue/PlayQueue;",
    name = "isSkipLogicEnabled",
    isStatic = false,
    returnType = "Z",
    parameters = listOf("Lcom/anghami/ghost/local/Account;"),
)

/**
 * Stops the player counting and refusing skipped tracks.
 *
 * When this predicate is false the skip path takes its "no restriction" branch:
 * the skip is allowed immediately, no count is recorded, and the limit message
 * that sits on the same branch is never reached. The interface uses the same
 * answer to decide whether to show the remaining-skip hint, so the hint
 * disappears as well.
 *
 * Skipping is still reported to the server as a playback event; only the
 * client-side gate is removed.
 */
@Suppress("unused")
val unlimitedSkipsPatch = bytecodePatch(
    name = "Unlimited track skips",
    description = "Removes the client-side limit on skipping tracks.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.PLAYBACK.label)

    execute {
        SkipLogicFingerprint.method.returnEarly(false)
    }
}
