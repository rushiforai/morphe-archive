package app.southstar21.patches.youtubemusic.layout.playercolor

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.southstar21.patches.youtubemusic.misc.extension.markYouTubeMusicPatchIncluded
import app.southstar21.patches.youtubemusic.misc.extension.requireGmsCoreSupport
import app.southstar21.patches.youtubemusic.misc.extension.youTubeMusicSharedExtensionPatch
import app.southstar21.patches.youtubemusic.shared.Constants.COMPATIBILITY_YOUTUBE_MUSIC

private const val EXTENSION_CLASS =
    "Lapp/southstar21/extension/youtubemusic/playercolor/PlayerColorPatch;"

@Suppress("unused")
val youTubeMusicDisableDynamicPlayerColorPatch = bytecodePatch(
    name = "Disable dynamic player color",
    description = "Keeps the full player's background one neutral color instead of changing with each " +
        "song's album art. Switch it on and pick the color (YouTube Music's default, black or dark grey) " +
        "in the southstar21 Patches menu in the top bar. " +
        "Requires Morphe Patches with GmsCore support, applied together in Expert mode.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE_MUSIC)

    dependsOn(youTubeMusicSharedExtensionPatch)

    execute {
        // Both colors through the extension before the method uses them: the neutral color
        // while the patch is on. It also keeps the controller, to color the player again when
        // the setting changes.
        PlayerColorsFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0, p1, p2 }, $EXTENSION_CLASS->onColors(Ljava/lang/Object;II)V
                invoke-static { p1 }, $EXTENSION_CLASS->color(I)I
                move-result p1
                invoke-static { p2 }, $EXTENSION_CLASS->color(I)I
                move-result p2
            """,
        )

        markYouTubeMusicPatchIncluded(EXTENSION_CLASS)
    }

    // Stops the build without Morphe Patches' GmsCore support (see requireGmsCoreSupport).
    finalize {
        requireGmsCoreSupport()
    }
}
