package io.github.henr1klmb.patches.mobilede

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val RETURN_NULL = """
    const/4 p0, 0x0
    return-object p0
"""

private const val RETURN_FALSE = """
    const/4 p0, 0x0
    return p0
"""

private const val COLLAPSE_ITEM_INSTRUCTIONS = """
    iget-object v0, p0, Landroidx/recyclerview/widget/o;->itemView:Landroid/view/View;
    const/16 v1, 0x8
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
    move-result-object v1
    if-nez v1, :cond_collapse
    return-void
    :cond_collapse
    const/4 v2, 0x0
    iput v2, v1, Landroid/view/ViewGroup${'$'}LayoutParams;->height:I
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup${'$'}LayoutParams;)V
    return-void
"""

private const val COLLAPSE_FAB_INSTRUCTIONS = """
    const/16 v0, 0x8
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V
    return-void
"""

@Suppress("unused")
val hideAiPatch = patch(
    name = "Hide AI",
    description = "Hides AI Assistant and summaries etc.",
) {
    compatibleWith(MOBILE_DE_COMPATIBILITY)

    execute {
        // Hide AI call summaries in dealer lead details
        LeadHistoryCallDataGetAiSummaryFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_NULL.trimIndent(),
        )

        LeadHistoryItemCallGetAiSummaryFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_NULL.trimIndent(),
        )

        // Disable Mobee AI assistant FAB
        MobeeSrpVariationGetShowsFabFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_FALSE.trimIndent(),
        )

        AiExtendedFloatingActionButtonExtendFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_FAB_INSTRUCTIONS.trimIndent(),
        )

        // Omit and collapse HomeFeed mobee (Beta) teaser card
        HomeFeedDataToEntityMapperMapSearchChatTeaserItemFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_NULL.trimIndent(),
        )

        HomeFeedToHomeFeedUiMapperMapSearchChatTeaserFingerprint.methodOrNull?.addInstructions(
            0,
            RETURN_NULL.trimIndent(),
        )

        HomeFeedSearchChatTeaserViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )
    }
}
