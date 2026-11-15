/*
 * Adapted from https://github.com/brosssh/morphe-patches
 * (GPL-3.0). See META-INF/PROTEUS-NOTICE.txt for details.
 */

package app.template.patches.instagram.distractionfree

import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.instagram.shared.blockInstagramUrl
import app.template.patches.instagram.shared.instagramBlockUrlBasePatch
import app.template.patches.instagram.shared.instagramFilterStoriesListPatch
import app.template.patches.instagram.shared.overrideInstagramMobileConfigBooleanFlag
import app.template.patches.shared.Constants.INSTAGRAM_COMPATIBILITY

@Suppress("unused")
val instagramHideSuggestedContentPatch = bytecodePatch(
    name = "Hide suggested content",
    description = "Choose the suggested content to hide using the patch options.",
    default = true,
) {
    compatibleWith(INSTAGRAM_COMPATIBILITY)

    val hideSuggestedReels by booleanOption(
        key = "hideSuggestedReels",
        default = true,
        title = "Hide suggested reels",
        description = "Hides suggested reels from feed and reels tab.",
    )

    val hideSuggestedStories by booleanOption(
        key = "hideSuggestedStories",
        default = true,
        title = "Hide suggested stories",
        description = "Hides suggested stories/users from story tray.",
    )

    val hideHighlightStories by booleanOption(
        key = "hideHighlightStories",
        default = true,
        title = "Hide highlights in stories",
        description = "Hides highlighted stories from story tray, sponsored stories which have no set expiration.",
    )

    val hideSuggestedAccount by booleanOption(
        key = "hideSuggestedAccount",
        default = true,
        title = "Hide suggested accounts",
        description = "Hides suggested accounts from the list of followers and from other profiles.",
    )

    dependsOn(
        overrideInstagramMobileConfigBooleanFlag(
            // Hides suggestions in search box.
            override = "111509::3" to false, // ig_search_ta_nullstate_suggestions::is_android_enabled
        ),
        instagramFilterStoriesListPatch,
        instagramBlockUrlBasePatch,
    )

    execute {
        if (hideSuggestedReels == true) hideSuggestedReelsPatch()

        if (hideSuggestedStories == true) filterSuggestedStories()

        if (hideHighlightStories == true) filterHighlightedStories()

        if (hideSuggestedAccount == true) blockInstagramUrl(
            "/discover/ayml",
            "/discover/chaining",
        )
    }
}
