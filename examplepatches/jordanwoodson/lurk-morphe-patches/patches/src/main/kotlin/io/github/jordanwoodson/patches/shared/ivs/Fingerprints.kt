package io.github.jordanwoodson.patches.shared.ivs

import app.morphe.patcher.Fingerprint

private const val IVS_PLAYER = "Lcom/amazonaws/ivs/player/CorePlayerImpl;"

// Amazon IVS's only MediaPlayer, which Twitch plays everything through (Kick did too before 40.35). The SDK keeps
// its names.
internal object IvsPlayFingerprint : Fingerprint(
    definingClass = IVS_PLAYER, name = "play", returnType = "V", parameters = emptyList(),
)

internal object IvsPauseFingerprint : Fingerprint(
    definingClass = IVS_PLAYER, name = "pause", returnType = "V", parameters = emptyList(),
)

internal object IvsReleaseFingerprint : Fingerprint(
    definingClass = IVS_PLAYER, name = "release", returnType = "V", parameters = emptyList(),
)

internal object IvsLowLatencyFingerprint : Fingerprint(
    definingClass = IVS_PLAYER, name = "setLiveLowLatencyEnabled", returnType = "V", parameters = listOf("Z"),
)
