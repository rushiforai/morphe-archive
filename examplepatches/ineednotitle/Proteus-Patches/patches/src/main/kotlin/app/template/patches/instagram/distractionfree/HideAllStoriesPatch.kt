/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.instagramFilterStoriesListPatch
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramHideAllStoriesPatch = bytecodePatch(
    name = "Hide all stories",
    description = "Hides all stories from the tray in the feed page. " +
        "You may need to clean app data after the initial use of this patch to see its effects.",
    default = false,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    dependsOn(instagramFilterStoriesListPatch)

    execute {
        filterAllStories()
    }
}
