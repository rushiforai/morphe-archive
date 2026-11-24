package app.southstar21.patches.youtubemusic.layout.askmusic

import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.youtubemusic.misc.extension.markYouTubeMusicPatchIncluded
import app.southstar21.patches.youtubemusic.misc.extension.requireGmsCoreSupport
import app.southstar21.patches.youtubemusic.misc.extension.youTubeMusicSharedExtensionPatch
import app.southstar21.patches.youtubemusic.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/youtubemusic/askmusic/HideAskMusicPatch;"

@Suppress("unused")
val youTubeMusicHideAskMusicButtonPatch = bytecodePatch(
    name = "Hide Ask Music button",
    description = "Removes the Ask Music AI assistant button (the sparkle) from the top bar, the full player, " +
        "the mini player, the video's fullscreen controls and the search bar, with its banner. It can be " +
        "switched off again in the southstar21 Patches menu in the top bar. " +
        "Requires Morphe Patches with GmsCore support, applied together in Expert mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(youTubeMusicSharedExtensionPatch)

    execute {
        // The extension hides the buttons itself, from the shared hook; this only switches it on.
        markYouTubeMusicPatchIncluded(EXTENSION_CLASS)
    }

    // Stops the build without Morphe Patches' GmsCore support (see requireGmsCoreSupport).
    finalize {
        requireGmsCoreSupport()
    }
}
