/*
 * Ported from brosssh's Instagram patches.
 * https://github.com/brosssh/morphe-patches
 *
 * brosssh's version also hides suggested stories and highlights from the story tray. That is
 * "Filter stories" here, so the tray is configured in one place: with both patches offering the
 * same options, a user who turned highlights off in one still lost them to the other's default.
 */
package app.ahmedyarub.patches.instagram.distractionFree

import app.ahmedyarub.patches.shared.Constants.COMPATIBILITY_INSTAGRAM
import app.ahmedyarub.patches.shared.stringPoolsPatch
import app.morphe.library.instagram.patches.blockUrl
import app.morphe.library.instagram.patches.blockUrlBasePatch
import app.morphe.library.instagram.patches.overrideMobileConfigBooleanFlag
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch

@Suppress("unused")
val hideSuggestedContentPatch = bytecodePatch(
    name = "Hide suggested content",
    description = "Hides suggested reels and suggested accounts. Suggested stories are hidden by Filter stories.",
    default = true
) {
    compatibleWith(COMPATIBILITY_INSTAGRAM)

    val hideSuggestedReels by booleanOption(
        key = "hideSuggestedReels",
        default = true,
        title = "Hide suggested reels",
        description = "Hides suggested reels from feed and reels tab."
    )

    val hideSuggestedAccount by booleanOption(
        key = "hideSuggestedAccount",
        default = true,
        title = "Hide suggested accounts",
        description = "Hides suggested accounts from the list of followers and from other profiles."
    )

    dependsOn(
        overrideMobileConfigBooleanFlag(
            // Hides suggestions in search box
            override = "111509::3" to false // ig_search_ta_nullstate_suggestions::is_android_enabled
        ),
        blockUrlBasePatch,
        stringPoolsPatch,
    )

    execute {
        if (hideSuggestedReels == true) hideSuggestedReelsPatch()

        if (hideSuggestedAccount == true) blockUrl(
            "/discover/ayml",
            "/discover/chaining"
        )
    }
}
