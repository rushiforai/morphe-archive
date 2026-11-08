package com.anderson.applemusic.core

/** Catalogue types the companion search asks the amp-api for, in display order. */
enum class SearchKind(val apiName: String, val label: String) {
    SONG("songs", "Músicas"),
    ALBUM("albums", "Álbuns"),
    ARTIST("artists", "Artistas"),
    PLAYLIST("playlists", "Playlists"),
}

/** One catalogue hit of [SearchClient]. */
data class SearchResult(
    val id: String,
    val kind: SearchKind,
    val title: String,
    val artist: String,
    val artworkUrl: String? = null,
)

/** Result of one search call: the UI decides what to render for each case. */
sealed interface SearchOutcome {
    data class Results(val results: List<SearchResult>) : SearchOutcome

    /**
     * The engine's developer token could not be read or decrypted (engine signed out,
     * different keystore layout, …): only the engine's own search is available.
     */
    data object TokenUnavailable : SearchOutcome

    data class Failure(val message: String) : SearchOutcome
}

/**
 * `mediaId`s to hand to `MediaController.playFromMediaId`, best guess first.
 *
 * The engine builds playback from `MediaSessionCallbacks.onSetMediaItems`
 * (`com/apple/android/music/player/C3928e0.java:55-89`): it asks its
 * `PlaybackMediaIdHandler` — the Android Auto provider (`p032b7/C3124a.java:154`) — for
 * a queue provider and, when that returns null, falls back to
 * `StorePlaybackQueueItemProvider(mediaId)`. The provider only claims ids under
 * `__AUTO_ROOT__/`, so a bare catalogue id reaches the store path — measured on the
 * phone: a song, an album and a playlist id all started playing. An artist has nothing
 * to play, so it returns no candidate and the caller falls back to the engine search.
 */
fun SearchResult.mediaIdCandidates(): List<String> = when (kind) {
    SearchKind.ARTIST -> emptyList()
    else -> listOf(id)
}

