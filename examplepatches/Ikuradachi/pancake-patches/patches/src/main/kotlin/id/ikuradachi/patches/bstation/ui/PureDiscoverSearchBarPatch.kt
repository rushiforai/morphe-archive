package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val pureDiscoverSearchBarPatch = bytecodePatch(
    name = "Pure discover search bar",
    description = "Removes discover tabs and trending searches to make the Discover page a pure search bar.",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideDiscoverTabs = booleanOption(
        key = "hideDiscoverTabs",
        default = true,
        title = "Hide discover tabs",
        description = "Hides the sliding tab strip and ViewPager2 content on the Discover page.",
    )

    val hideTrendingSearches = booleanOption(
        key = "hideTrendingSearches",
        default = true,
        title = "Hide trending searches",
        description = "Hides trending searches and suppresses loading spinner on the Discover page.",
    )

    execute {
        if (hideDiscoverTabs.value == true) {
            DiscoverInitTabsFingerprint.method.addInstructions(0, "return-void")
        }

        if (hideTrendingSearches.value == true) {
            DiscoverTrendingSearchFingerprint.method.addInstructions(0, "return-void")
            DiscoverLoadingStateFingerprint.method.addInstructions(
                0,
                """
                    const/4 v0, 0x0
                    return-object v0
                """.trimIndent(),
            )
        }
    }
}
