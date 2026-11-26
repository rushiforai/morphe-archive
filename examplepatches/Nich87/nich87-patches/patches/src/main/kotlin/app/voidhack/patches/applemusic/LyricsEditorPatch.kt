package app.voidhack.patches.applemusic

import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val lyricsEditorPatch = bytecodePatch(
    name = "Lyrics editor",
    description = "Adds an Apple Music-style full-song lyrics editor (accessed by long-pressing any lyric line) with batch editing, timing adjustments, interlude insertion with native three-dot indicators, LRC export, and edit restore controls.",
) {
    dependsOn(
        lyricsBasePatch,
        lyricsLineEditPatch,
        lyricsInterludePatch,
        lyricsScrollSyncPatch,
    )
    compatibleWith(appleMusicCompatibility)
    extendWith("extensions/extension.mpe")

    execute {
        enableLyricsFeature("editor")
    }
}
