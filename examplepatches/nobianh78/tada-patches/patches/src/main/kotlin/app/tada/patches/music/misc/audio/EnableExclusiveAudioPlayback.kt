/*
 * Copyright 2026 TADa.
 * https://github.com/TADaApp/tada-patches
 *
 * Original hard forked code:
 * https://github.com/ReVanced/revanced-patches/commit/724e6d61b2ecd868c1a9a37d465a688e83a74799
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to TADa contributions.
 */

package app.tada.patches.music.misc.audio

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.playservice.is_9_32_or_greater
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.util.returnEarly

@Suppress("unused")
val enableExclusiveAudioPlaybackPatch = bytecodePatch(
    name = "Enable exclusive audio playback",
    description = "Enables the option to play audio without video.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        val fingerprint = if (is_9_32_or_greater) {
            AllowExclusiveAudioPlaybackFingerprint
        } else {
            AllowExclusiveAudioPlaybackLegacyFingerprint
        }

        fingerprint.method.returnEarly(true)
    }
}
