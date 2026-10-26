package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import id.ikuradachi.patches.bstation.shared.Constants.COMPATIBILITY_BSTATION

@Suppress("unused")
val debloatSearchPagePatch = bytecodePatch(
    name = "Debloat search landing page",
    description = "Debloats the search landing page by hiding trending searches, discovery modules, and promotional search bar hints.",
) {
    category("Layout")
    compatibleWith(COMPATIBILITY_BSTATION)

    val hideTrendingSearches = booleanOption(
        key = "hideTrendingSearches",
        default = true,
        title = "Hide trending searches",
        description = "Hides trending search hot words and suppresses the network request.",
    )

    val hideDiscoveryModules = booleanOption(
        key = "hideDiscoveryModules",
        default = true,
        title = "Hide discovery modules",
        description = "Hides discovery section modules, tabs, and dividers on the search landing page.",
    )

    val cleanSearchBarHint = booleanOption(
        key = "cleanSearchBarHint",
        default = true,
        title = "Clean search bar hint",
        description = "Neutralizes promotional default keywords and forces the default 'Search' hint.",
    )

    execute {
        if (hideTrendingSearches.value == true) {
            TrendingSearchHotWordsFingerprint.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/bilibili/search/history/TrendingSearchViewModel;->X:Landroidx/lifecycle/d0;
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v1
                    invoke-virtual {v0, v1}, Landroidx/lifecycle/d0;->q(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        if (hideDiscoveryModules.value == true) {
            TrendingSearchModulesFingerprint.method.addInstructions(
                0,
                """
                    iget-object v0, p0, Lcom/bilibili/search/history/TrendingSearchViewModel;->f0:Landroidx/lifecycle/d0;
                    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
                    move-result-object v1
                    invoke-virtual {v0, v1}, Landroidx/lifecycle/d0;->q(Ljava/lang/Object;)V
                    return-void
                """.trimIndent(),
            )
        }

        if (cleanSearchBarHint.value == true) {
            val invokeMatch = SearchDefaultWordIntentFingerprint.instructionMatches[1]
            val invokeIndex = invokeMatch.index
            SearchDefaultWordIntentFingerprint.method.removeInstruction(invokeIndex + 1)
            SearchDefaultWordIntentFingerprint.method.replaceInstruction(invokeIndex, "const/4 p1, 0x0")

            SearchControllerDefaultHintFingerprint.method.addInstructions(
                0,
                "const/4 p2, 0x0",
            )
        }
    }
}
