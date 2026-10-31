package app.morphe.patches.reddit.customclients.sync.syncforreddit.http.comments

import app.morphe.patcher.Fingerprint

/**
 * Reads the id out of a Reddit video address, by taking off each of the endings a video was once
 * served under. Those endings are what identifies it.
 */
internal val videoIdFingerprint = Fingerprint(
    parameters = listOf("Ljava/lang/String;"),
    returnType = "Ljava/lang/String;",
    strings = listOf("/HLSPlaylist.m3u8", "/DASHPlaylist.mpd", "/DASH_1080"),
)
