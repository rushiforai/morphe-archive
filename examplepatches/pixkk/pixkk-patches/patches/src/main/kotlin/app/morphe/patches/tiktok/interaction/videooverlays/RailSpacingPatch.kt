/*
 * Copyright 2026 pixkk
 */
package app.morphe.patches.tiktok.interaction.videooverlays

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.interaction.authorregion.DetailActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.extension.MainActivityOnCreateFingerprint
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.shared.bakeDefault
import app.morphe.util.addInstruction

private const val EXTENSION = "Lapp/pixkk/extension/feed/RailSpacing;"

@Suppress("unused")
val railSpacingPatch = bytecodePatch(
    name = "Right column spacing",
    description = "Lets you widen or close up the gap between the buttons down the right of a " +
        "video: avatar, like, comments, save and share. The gap is set in the " +
        "Pixkk Patches settings, and 0 leaves TikTok's own spacing.",
) {
    category("Interface")
    compatibleWith(*AppCompatibilities.tiktok())
    dependsOn(sharedExtensionPatch)

    // What the settings page shows until a value is changed there. A patched app starts with
    // these every time, so they need not be set again after each patching.
    val gapBetweenButtons by intOption(
        key = "gapBetweenButtons",
        default = 0,
        title = "Gap between buttons, dp",
        description = "From -30 to 60. 0 leaves TikTok's own spacing.",
    )
    val gapUnderAvatar by intOption(
        key = "gapUnderAvatar",
        default = 0,
        title = "Gap under avatar, dp",
        description = "From -30 to 60. 0 leaves TikTok's own spacing.",
    )
    val gapAboveDisc by intOption(
        key = "gapAboveDisc",
        default = 0,
        title = "Gap above disc, dp",
        description = "From -30 to 60. 0 leaves TikTok's own spacing.",
    )

    execute {
        bakeDefault("railSpacingDp", (gapBetweenButtons ?: 0).coerceIn(-30, 60))
        bakeDefault("railAvatarGapDp", (gapUnderAvatar ?: 0).coerceIn(-30, 60))
        bakeDefault("railDiscGapDp", (gapAboveDisc ?: 0).coerceIn(-30, 60))

        // p0 is the activity. /range because a parameter register is usually above v15. The
        // detail page too: a video opened from a profile or a search plays there, not in the feed.
        listOf(MainActivityOnCreateFingerprint.method, DetailActivityOnCreateFingerprint.method).forEach {
            it.addInstruction(
                0,
                "invoke-static/range { p0 .. p0 }, $EXTENSION->install(Landroid/app/Activity;)V",
            )
        }
    }
}
