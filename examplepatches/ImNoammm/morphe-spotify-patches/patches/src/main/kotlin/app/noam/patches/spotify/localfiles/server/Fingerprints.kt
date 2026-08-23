package app.noam.patches.spotify.localfiles.server

import app.morphe.patcher.Fingerprint

private const val MEDIA_STORE_READER = "Lcom/spotify/localfiles/mediastore/MediaStoreReader;"

/**
 * Reads every local audio file and returns them as a serialised QueryResult.
 *
 * The class is annotated @Keep because Spotify's native library calls it, so its name survives
 * obfuscation and the fingerprint can name it directly.
 */
internal object RunQueryFingerprint : Fingerprint(
    definingClass = MEDIA_STORE_READER,
    name = "runQuery",
    returnType = "[B",
)

/** Registers the observer that triggers a rescan when the media store changes. */
internal object StartListeningFingerprint : Fingerprint(
    definingClass = MEDIA_STORE_READER,
    name = "startListening",
    returnType = "V",
    parameters = listOf("J"),
)
