package app.template.patches.music

import app.morphe.patcher.Fingerprint

/**
 * Matches MusicBrowserService.onGetRoot in YouTube Music.
 * MusicBrowserService is declared in AndroidManifest.xml and is never obfuscated.
 * onGetRoot is the entry point that authenticates connecting media clients (e.g. Google Maps, Android Auto).
 * Matches by the distinctive log string "Client not allowlisted" present across all YTM versions.
 */
object MusicBrowserServiceFingerprint : Fingerprint(
    definingClass = "Lcom/google/android/apps/youtube/music/mediabrowser/MusicBrowserService;",
    strings = listOf("Client not allowlisted")
)
