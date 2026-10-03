package app.aidan.patches.aftership.feedback

import app.aidan.patches.aftership.auth.bypassSignatureCheckResourcePatch
import app.aidan.patches.aftership.shared.Constants.COMPATIBILITY_AFTERSHIP
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch

private const val TRACKING_DETAIL_PRESENTER = "LZ6/l;"
private const val TRACKING_DETAIL_FRAGMENT = "LA6/X;"

@Suppress("unused")
val removeFeedbackPatch = bytecodePatch(
    name = "Remove Feedback",
    description = "Removes prompting for feedback on shipments.",
    default = true
) {
    compatibleWith(COMPATIBILITY_AFTERSHIP)
    dependsOn(bypassSignatureCheckResourcePatch)

    execute {
        patchTrackingDetailPresenter()
        patchTrackingDetailFragment()
    }
}

/**
 * In `LZ6/l;` (`TrackingDetailPresenter` helper), patches `g(Lcom/aftership/shopper/views/shipment/adapter/ReviewEntity;Z)V`.
 *
 * In stock code, `g` sets the visibility of `floating_container_ll` (which contains `panel_up_report`
 * Feedback button and `panel_up_review` rating stars overlaying the map), sets `report_issue_rl`
 * (fallback Feedback button when no map is shown), and reports review exposure events.
 *
 * Forces `floating_container_ll` and `report_issue_rl` to `View.GONE` (`0x8`) and returns immediately.
 *
 * @throws PatchException if the presenter class or implemented g method is missing.
 */
private fun BytecodePatchContext.patchTrackingDetailPresenter() {
    val classDef = classDefByOrNull(TRACKING_DETAIL_PRESENTER)
        ?: throw PatchException("Class $TRACKING_DETAIL_PRESENTER not found")
    val mutableClass = mutableClassDefBy(classDef)

    val gMethod = mutableClass.methods.firstOrNull {
        it.name == "g" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method g not found in $TRACKING_DETAIL_PRESENTER")

    gMethod.addInstructions(
        0,
        """
            const/16 v0, 0x8
            iget-object v1, p0, LZ6/l;->b:Lz2/x;
            if-eqz v1, :cond_skip_g
            iget-object v2, v1, Lz2/x;->b:Landroid/widget/LinearLayout;
            if-eqz v2, :cond_skip_floating_g
            invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V
            :cond_skip_floating_g
            iget-object v1, v1, Lz2/x;->p:Lz2/y;
            if-eqz v1, :cond_skip_g
            iget-object v1, v1, Lz2/y;->c:Landroid/widget/RelativeLayout;
            if-eqz v1, :cond_skip_g
            invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V
            :cond_skip_g
            return-void
        """.trimIndent()
    )
}

/**
 * In `LA6/X;` (`TrackingDetailFragment`):
 * 1. Neutralizes `k3()V` (starts `FeedbackIssueActivity`) with an early `return-void`.
 * 2. Neutralizes `l3(I)V` (opens `ReviewDetailSheetFragment`) with an early `return-void`.
 *
 * @throws PatchException if the fragment class or either implemented k3/l3 method is missing.
 */
private fun BytecodePatchContext.patchTrackingDetailFragment() {
    val classDef = classDefByOrNull(TRACKING_DETAIL_FRAGMENT)
        ?: throw PatchException("Class $TRACKING_DETAIL_FRAGMENT not found")
    val mutableClass = mutableClassDefBy(classDef)

    val k3Method = mutableClass.methods.firstOrNull {
        it.name == "k3" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method k3 not found in $TRACKING_DETAIL_FRAGMENT")
    k3Method.addInstructions(0, "return-void")

    val l3Method = mutableClass.methods.firstOrNull {
        it.name == "l3" && it.returnType == "V" && it.implementation != null
    } ?: throw PatchException("Method l3 not found in $TRACKING_DETAIL_FRAGMENT")
    l3Method.addInstructions(0, "return-void")
}
