/*
 * Adapted from piko <https://github.com/crimera/piko>, GPLv3.
 *
 * Simplified: piko's FilterStory decodes each reel item through its entity layer so it can
 * also filter on whether the poster is verified and on how many items a story has. Both of
 * those need the obfuscated model classes resolved at patch time, which is the part that
 * breaks on newer app versions. Only the reel type filtering is ported, using the story tray
 * filter already available in the Instagram patch library, so no entity decoding is involved.
 */

package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.morphe.library.instagram.patches.filterStories
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val filterStoriesPatch = bytecodePatch(
    name = "Filter stories",
    description = "Hides categories of stories from the story tray.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    dependsOn(filterStoriesTrayHook)

    val hideAds by booleanOption(
        key = "hideAdsStories",
        default = true,
        title = "Hide ad stories",
        description = "Hides advertisements from the story tray.",
    )

    val hideSuggested by booleanOption(
        key = "hideSuggestedStories",
        default = true,
        title = "Hide suggested stories",
        description = "Hides suggested users and creators from the story tray.",
    )

    val hideHighlights by booleanOption(
        key = "hideHighlightStories",
        default = false,
        title = "Hide highlights",
        description = "Hides resurfaced highlights from the story tray.",
    )

    execute {
        // Reel type constants, all confirmed present in 439 and 446.
        if (hideAds == true) filterStories("ads_reel")

        if (hideSuggested == true) filterStories(
            "suggested_user_reel",
            "suggested_user",
            "suggested_creator_reel",
        )

        if (hideHighlights == true) filterStories("highlight_rewind_reel")
    }
}
