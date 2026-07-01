/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/bandcamp/limitations/Fingerprints.kt
 */
package app.morphe.patches.bandcamp.limitations

import app.morphe.patcher.Fingerprint

internal object HandlePlaybackLimitsFingerprint : Fingerprint(
    strings = listOf("track_id", "play_count"),
)

