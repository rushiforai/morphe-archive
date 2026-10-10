package app.tada.patches.music.misc.backgroundplayback

import app.morphe.patcher.patch.bytecodePatch
import app.tada.patches.music.misc.extension.sharedExtensionPatch
import app.tada.patches.music.misc.settings.settingsPatch
import app.tada.patches.music.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC
import app.tada.patches.shared.misc.fix.bitmap.fixRecycledBitmapPatch
import app.morphe.util.returnEarly

val backgroundPlaybackPatch = bytecodePatch(
    name = "Remove background playback restrictions",
    description = "Removes restrictions on background playback, including playing kids videos in the background.",
) {
    dependsOn(
        sharedExtensionPatch,
        settingsPatch,
        fixRecycledBitmapPatch,
    )

    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    execute {
        KidsBackgroundPlaybackPolicyControllerFingerprint.method.returnEarly()

        BackgroundPlaybackDisableFingerprint.method.returnEarly(true)
    }
}
