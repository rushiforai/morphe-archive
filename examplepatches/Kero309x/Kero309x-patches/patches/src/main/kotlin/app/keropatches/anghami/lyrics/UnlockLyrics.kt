// SPDX-License-Identifier: GPL-3.0-only
// Copyright (C) 2026 Kero309x

package app.keropatches.anghami.lyrics

import app.keropatches.anghami.AnghamiApp
import app.keropatches.core.PatchCategory
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.returnEarly

/**
 * The account predicate that decides whether lyrics may be opened.
 *
 * The stock body is `isPlusUser() || lyricsfreeenabled`, so both the stored
 * entitlement and the server-provided free-lyrics flag live here. That is what
 * makes this method the narrow place to answer, rather than the entitlement
 * predicate it delegates to: changing the entitlement would also grant downloads
 * and lift skip limits, which are separate patches in this bundle.
 */
private object LyricsAccessFingerprint : Fingerprint(
    definingClass = "Lcom/anghami/ghost/local/Account;",
    name = "lyricsEnabled",
    isStatic = false,
    returnType = "Z",
    parameters = emptyList(),
)

/**
 * Lets every account open the lyrics screen.
 *
 * The screen itself is not gated: the entry point reads this predicate once and,
 * when it is false, shows the subscription page instead of starting the lyrics
 * activity. Answering `true` here therefore lets the normal request proceed, and
 * the screen still behaves exactly as it does for a subscriber.
 *
 * The patch does not fabricate access to lyrics the server does not serve. If the
 * request is refused upstream, the patched screen shows the same failure it shows
 * to a subscriber for a track without lyrics.
 */
@Suppress("unused")
val fullLyricsAccessPatch = bytecodePatch(
    name = "Unlock lyrics",
    description = "Opens the lyrics screen for every account instead of showing the subscription prompt.",
    default = true,
) {
    compatibleWith(AnghamiApp.compatibility)
    category(PatchCategory.MEDIA.label)

    execute {
        LyricsAccessFingerprint.method.returnEarly(true)
    }
}
