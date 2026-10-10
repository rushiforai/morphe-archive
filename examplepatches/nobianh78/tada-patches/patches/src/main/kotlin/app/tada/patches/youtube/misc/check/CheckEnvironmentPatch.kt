package app.tada.patches.youtube.misc.check

import app.tada.patches.shared.misc.checks.checkEnvironmentPatch
import app.tada.patches.youtube.misc.extension.sharedExtensionPatch
import app.tada.patches.youtube.shared.YouTubeActivityOnCreateFingerprint

internal val checkEnvironmentPatch = checkEnvironmentPatch(
    mainActivityOnCreateFingerprint = YouTubeActivityOnCreateFingerprint,
    extensionPatch = sharedExtensionPatch
)
