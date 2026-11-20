package app.southstar21.patches.youtubemusic.shared

import app.morphe.patcher.Fingerprint

/** MusicActivity.onCreate, a real override that keeps its name. */
internal object MusicActivityOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/activities/MusicActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)
