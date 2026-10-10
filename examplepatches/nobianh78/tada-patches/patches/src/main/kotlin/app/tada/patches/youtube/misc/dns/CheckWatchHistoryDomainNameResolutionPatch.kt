package app.tada.patches.youtube.misc.dns

import app.tada.patches.shared.misc.dns.checkWatchHistoryDomainNameResolutionPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.shared.Constants.COMPATIBILITY_YOUTUBE
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint

val checkWatchHistoryDomainNameResolutionPatch = checkWatchHistoryDomainNameResolutionPatch(
    block = {
        dependsOn(sharedExtensionPatch)

        compatibleWith(COMPATIBILITY_YOUTUBE)
    },
    mainActivityFingerprint = YouTubeActivityOnCreateFingerprint
)
