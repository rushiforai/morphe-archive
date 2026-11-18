package io.github.henr1klmb.patches.mobilede

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.patch

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

@Suppress("unused")
val hideCheck24InsurancePatch = patch(
    name = "Hide CHECK24 insurance",
    description = "Hides the CHECK24 vehicle insurance section in additional services.",
) {
    compatibleWith(MOBILE_DE_COMPATIBILITY)

    execute {
        // Prevent VIPListing from returning insurance plans so the item is omitted from the partnership list
        VipListingGetInsurancePlansFingerprint.methodOrNull?.addInstructions(
            0,
            """
                const/4 p0, 0x0
                return-object p0
            """.trimIndent(),
        )

        // Collapse CHECK24 partnership item viewholder
        Check24PartnershipItemBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )

        // Collapse generic / fallback insurance partnership item viewholder
        InsurancePartnershipItemBindFingerprint.methodOrNull?.addInstructions(
            0,
            COLLAPSE_ITEM_INSTRUCTIONS.trimIndent(),
        )
    }
}
