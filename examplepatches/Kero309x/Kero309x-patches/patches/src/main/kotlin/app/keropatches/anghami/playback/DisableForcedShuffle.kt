// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.playback

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/**
 * The list presenter's answer to "should this list be played as a radio?".
 *
 * Two callers use it, and only two: the page play button and the play-one-song
 * action. When it answers true, both build a radio queue instead of a queue over
 * the list they were given. The stock answer reads the server's play mode on the
 * first song and on the section.
 */
private object RadioConversionFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/app/base/list_fragment/c;",
    name = "shouldPlayRadio",
    isStatic = false,
    returnType = "Z",
    parameters = listOf(
        "Lcom/anghami/ghost/pojo/Song;",
        "Lcom/anghami/ghost/pojo/section/Section;",
    ),
)

/**
 * Stops free accounts from being moved into a shuffled radio queue.
 *
 * The server marks a song or a section with play mode `shuffle` when the account
 * is not entitled to listen in order. The presenter then replaces the list with a
 * radio queue whose own play mode is `shuffle`, which is why shuffle cannot be
 * turned off from the player: the queue is not the album the user opened.
 *
 * The patch answers the conversion question with "no" for accounts that do not
 * have an active plan. The presenter then takes its ordinary branch and builds a
 * plain queue over the list, starting at the chosen song, exactly as it does for a
 * list the server did not mark. The queue's own shuffle toggle is untouched, so
 * turning shuffle on and off still works on that queue.
 *
 * Accounts with an active Plus plan keep the stock answer on purpose. For them
 * the same play mode is a property of content that is meant to be a radio, not a
 * restriction, and turning it into a plain queue would remove a feature rather
 * than a limit.
 */
@Suppress("unused")
val disableForcedShufflePatch = bytecodePatch(
    name = "Disable forced shuffle",
    description = "Plays a list in its own order instead of turning it into a shuffled radio queue for accounts without Plus.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.PLAYBACK.label)

    execute {
        RadioConversionFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, Lcom/anghami/ghost/local/Account;->isPlus()Z
                move-result v0
                if-nez v0, :keropatches_keep_radio
                const/4 v0, 0x0
                return v0
                :keropatches_keep_radio
            """.trimIndent(),
        )
    }
}
