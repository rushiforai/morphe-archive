package app.noam.patches.spotify.localfiles.server

import app.morphe.patcher.Fingerprint

private const val MEDIA_STORE_READER = "Lcom/spotify/localfiles/mediastore/MediaStoreReader;"

internal object RunQueryFingerprint : Fingerprint(
    definingClass = MEDIA_STORE_READER,
    name = "runQuery",
    returnType = "[B",
)

internal object StartListeningFingerprint : Fingerprint(
    definingClass = MEDIA_STORE_READER,
    name = "startListening",
    returnType = "V",
    parameters = listOf("J"),
)
