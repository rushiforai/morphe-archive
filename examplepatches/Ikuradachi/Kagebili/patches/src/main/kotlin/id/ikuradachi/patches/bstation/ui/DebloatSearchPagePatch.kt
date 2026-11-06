package id.ikuradachi.patches.bstation.ui

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction

internal fun BytecodePatchContext.applySearchPage(
    hideTrendingSearches: Boolean,
    hideDiscoveryModules: Boolean,
    cleanSearchBarHint: Boolean,
) {
    if (hideTrendingSearches == true) {
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

    if (hideDiscoveryModules == true) {
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

    if (cleanSearchBarHint == true) {
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
