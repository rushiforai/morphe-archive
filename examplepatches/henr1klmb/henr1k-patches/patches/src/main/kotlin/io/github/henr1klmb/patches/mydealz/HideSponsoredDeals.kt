package io.github.henr1klmb.patches.mydealz

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

private const val COLLAPSE_ITEM_INSTRUCTIONS = """
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView${'$'}ViewHolder;->itemView:Landroid/view/View;
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

@Suppress("unused")
val hideSponsoredDealsPatch = patch(
    name = "Hide sponsored deals",
    description = "Hides sponsored deals, discussions, and in-feed advertisement cards.",
) {
    compatibleWith(MYDEALZ_COMPATIBILITY)

    execute {
        // Prevent DisplayInformation from returning sponsored badges / logos / titles
        DisplayInformationSponsoredTitleFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )

        DisplayInformationSponsoredLogoUrlsFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )

        // Collapse in-feed ad container viewholders (small, medium, large, interscroller)
        AdContainerViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )

        // Collapse sponsored thread deals
        SponsoredDealViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )

        // Collapse sponsored discussions
        SponsoredDiscussionViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )

        // Collapse sponsored feedback cards
        SponsoredFeedbackViewHolderBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )
    }
}
