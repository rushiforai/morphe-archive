package app.morphe.patches.music.misc.dns

import app.morphe.patches.music.misc.extension.sharedExtensionPatch
import app.morphe.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.morphe.patches.music.shared.MusicActivityOnCreateFingerprint
import app.morphe.patches.shared.misc.dns.checkWatchHistoryDomainNameResolutionPatch

val checkWatchHistoryDomainNameResolutionPatch = checkWatchHistoryDomainNameResolutionPatch(
    block = {
        category("Full Collection")
        dependsOn(app.bdcrusher.ytmusic.nativeentry.fullEditionGuard)
        dependsOn(
            sharedExtensionPatch
        )

        compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)
    },

    mainActivityFingerprint = MusicActivityOnCreateFingerprint
)
