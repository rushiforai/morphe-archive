package app.noam.patches.spotify.lyrics

import app.morphe.patcher.Fingerprint

/**
 * The full screen lyrics page.
 *
 * The lyrics classes are not obfuscated, so the activity can be named directly.
 */
internal object LyricsPageOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/spotify/lyrics/fullscreenview/page/LyricsFullscreenPageActivity;",
    name = "onCreate",
    returnType = "V",
)
