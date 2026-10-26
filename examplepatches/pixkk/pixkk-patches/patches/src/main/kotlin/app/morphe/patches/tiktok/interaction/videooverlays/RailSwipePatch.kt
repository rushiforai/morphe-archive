/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.authorregion.DetailActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.extension.MainActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.util.addInstruction

private const val EXTENSION = "Lapp/pixkk/extension/feed/RailSwipeGuard;"

@Suppress("unused")
val railSwipePatch = bytecodePatch(
    name = "Don't open comments on icon swipe",
    description = "Lets a swipe that starts on one of the buttons down the right of a video " +
        "(avatar, like, comments, save, share) scroll to the next video, instead of pressing " +
        "the button when the finger comes up. It can be turned off in the " +
        "Pixkk Patches settings.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    execute {
        // p0 is the activity. The detail page too: a video opened from a profile or a search
        // plays there, not in the feed.
        listOf(MainActivityOnCreateFingerprint.method, DetailActivityOnCreateFingerprint.method).forEach {
            it.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION->install(Landroid/app/Activity;)V",
            )
        }
    }
}
