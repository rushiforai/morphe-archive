package app.tada.patches.music.misc.dns

import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.music.shared.MusicActivityOnCreateFingerprint
import app.tada.patches.shared.misc.dns.checkWatchHistoryDomainNameResolutionPatch

val checkWatchHistoryDomainNameResolutionPatch = checkWatchHistoryDomainNameResolutionPatch(
    block = {
        dependsOn(
            sharedExtensionPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },

    mainActivityFingerprint = MusicActivityOnCreateFingerprint
)
