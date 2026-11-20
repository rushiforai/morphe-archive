package app.keyboardspeed.patches.youtube.comments

import app.keyboardspeed.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/keyboardspeed/extension/CommentsMenuItemPatch;"

/**
 * The flyout menu utilities of the extension of the Morphe YouTube patches,
 * which add the Morphe items to the menus of videos.
 */
private const val MORPHE_FLYOUT_UTILS_CLASS = "Lapp/morphe/extension/youtube/patches/utils/FlyoutUtils;"

/**
 * Adds the Morphe items to the menu of a video in a feed or list, with the index of the next item.
 */
private const val MORPHE_ADD_VIDEO_ITEMS_METHOD = "addVideoFlyoutButtons"

private const val MORPHE_PATCHES_MISSING =
    "The video menu code of the Morphe YouTube patches was not found. Apply this patch together with " +
        "the official Morphe Patches source and one of its patches that add video menu items, " +
        "such as 'Save to Watch later button'."

@Suppress("unused")
val commentsMenuItemPatch = bytecodePatch(
    name = "Comments menu item",
    description = "Adds a Comments item to the menu of videos in feeds and lists, such as the Home feed, " +
        "the watch history and playlists, which opens the comments of the video without playing it. " +
        "Apply together with the Morphe YouTube patches.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_YOUTUBE)

    extendWith("extensions/extension.mpe")

    // The menu code is merged into the app by the Morphe YouTube patches, which can be executed
    // after this patch. All patches are executed before any patch is finalized.
    finalize {
        val flyoutUtils = mutableClassDefByOrNull(MORPHE_FLYOUT_UTILS_CLASS)
            ?: throw PatchException(MORPHE_PATCHES_MISSING)
        val addVideoItems = flyoutUtils.methods.firstOrNull { method ->
            method.name == MORPHE_ADD_VIDEO_ITEMS_METHOD &&
                method.returnType == "I" &&
                method.parameterTypes.map { it.toString() } == listOf("Ljava/lang/Object;", "I")
        } ?: throw PatchException("$MORPHE_PATCHES_MISSING Missing method: $MORPHE_ADD_VIDEO_ITEMS_METHOD")

        // The item is added first, so it's the first of the Morphe items of the menu.
        addVideoItems.addInstructions(
            0,
            """
                invoke-static/range { p0 .. p1 }, $EXTENSION_CLASS->addMenuItem(Ljava/lang/Object;I)I
                move-result p1
            """,
        )
    }
}
