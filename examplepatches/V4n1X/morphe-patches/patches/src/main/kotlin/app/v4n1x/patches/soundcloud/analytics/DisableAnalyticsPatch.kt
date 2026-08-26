package app.v4n1x.patches.soundcloud.analytics

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import app.v4n1x.patches.soundcloud.shared.Constants.COMPATIBILITY_SOUNDCLOUD

@Suppress("unused")
val disableAnalyticsPatch = bytecodePatch(
    name = "Disable analytics",
    description = "Disables SoundCloud's analytics.",
) {
    compatibleWith(COMPATIBILITY_SOUNDCLOUD)

    execute {
        HandleMessageFingerprint.methodOrNull?.returnEarly()
    }
}
