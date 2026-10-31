package app.morphe.patches.reddit.customclients.sync.syncforreddit.ui.gestures

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.customclients.sync.SyncForRedditCompatible
import app.morphe.patches.reddit.customclients.sync.syncforreddit.extension.sharedExtensionPatch

private const val EXTENSION_CLASS_DESCRIPTOR =
    "Lapp/morphe/extension/syncforreddit/ui/gestures/VideoGesturePatch;"

private const val INSTALL_METHOD = "install($PLAYER_CLASS)V"

@Suppress("unused")
val videoGesturesPatch = bytecodePatch(
    name = "Gestures for the video player",
    description = "Double tap a video or GIF to play or pause it rather than zoom, drag " +
            "sideways to seek, and drag up or down after a double tap for volume.",
    default = true
) {
    dependsOn(sharedExtensionPatch, videoGestureSettingsPatch)

    compatibleWith(*SyncForRedditCompatible)

    execute {
        // Both ways the player is built, and at the end of each: the building of the view a
        // touch lands on has finished by then, and neither has anything branching past it.
        listOf(playerFromALayoutFingerprint, playerBuiltInCodeFingerprint).forEach { built ->
            built.method.apply {
                addInstructions(
                    instructions.count() - 1,
                    "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->$INSTALL_METHOD"
                )
            }
        }
    }
}
