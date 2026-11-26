package app.pomee4.patches.myspoti.carqueue

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.methodCall

internal const val CONTEXT_PAGE_CLASS = "Lcom/music/spotui/data/entity/ContextPageModel;"
internal const val SONG_PLAYER_CLASS = "Lcom/music/spotui/di/SongPlayer;"

/**
 * `AutoBrowser.playTrack(contextUri, key)`: plays a song picked in Android Auto, Waze or another
 * media browser, in the playlist or album it was listed in.
 *
 * ```kotlin
 * if (page != null) {
 *     Graph.currentSongState.updateQueue(page.tracks)
 *     ...
 * }
 * SongPlayer.playSong(key, contextUri = contextUri)
 * ```
 */
internal object AutoBrowserPlayTrackFingerprint : Fingerprint(
    definingClass = "Lcom/music/spotui/di/AutoBrowser;",
    name = "playTrack",
    returnType = "V",
    parameters = listOf("Ljava/lang/String;", "Ljava/lang/String;"),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/music/spotui/di/CurrentSongState;",
            name = "updateQueue",
        ),
        methodCall(
            definingClass = SONG_PLAYER_CLASS,
            name = "playSong\$default",
        ),
    )
)
