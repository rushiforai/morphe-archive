package app.pepper.patches.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.pepper.patches.shared.PEPPER_FAMILY
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference

/**
 * Hide banner ads in feed
 *
 * In stock Pepper, banner ads load via Pubmatic OpenWrap (POBBannerView)
 * inside the renderer method `rc.d(bn9, ha)V` — the ViewHolder bind-method
 * for banner-ad cells in the deal RecyclerView.
 *
 * Two effects we want:
 *   1. POBBannerView.loadAd() never gets called → no ad request.
 *   2. The empty AdViewContainer cell (gray box) is collapsed so it leaves
 *      zero visible trace BETWEEN deal cards in the Hot Deals feed.
 *
 * Both achieved by replacing rc.d() body with a compact stub that:
 *   - Sets visibility=GONE on the cell root view.
 *   - Sets LayoutParams.height = 0.
 *   - If LayoutParams is MarginLayoutParams, also zeros all 4 margins
 *     (top/bottom/left/right) — RecyclerView still allocates space for vertical
 *     margins around a GONE item, leaving a visible gap between deal cards.
 *   - Re-applies LayoutParams.
 *
 * The original method body (POBBannerView creation + listener attach +
 * loadAd) is removed in full via removeInstructions(0, count).
 */
@Suppress("unused")
val hideBannerAdsPatch = bytecodePatch(
    name = "Hide banner ads in feed",
    description = "Removes the banner ads in the deal feed.",
) {
    compatibleWith(*PEPPER_FAMILY)

    execute {
        val method = BannerAdRendererFingerprint.method
        val impl = method.implementation!!

        // Read the FIRST iget-object that fetches a View — its declaring class &
        // field name give us the ViewHolder structure to use in our stub.
        val rootViewField = impl.instructions
            .filterIsInstance<ReferenceInstruction>()
            .mapNotNull { it.reference as? FieldReference }
            .firstOrNull { it.type == "Landroid/view/View;" }
            ?: throw PatchException(
                "Couldn't find root-view field accessor in renderer. " +
                "ViewHolder structure may have changed."
            )

        val originalCount = impl.instructions.toList().size

        // Wipe the entire body, then write our compact stub.
        // Sequence:
        //   1. Hide view (visibility = GONE).
        //   2. Set LayoutParams.height to 0.
        //   3. If LayoutParams is MarginLayoutParams, also zero ALL FOUR margins
        //      — RecyclerView still allocates space for vertical margins around
        //      a GONE item, leaving a visible gap between deal cards otherwise.
        //   4. Apply LayoutParams back.
        method.removeInstructions(0, originalCount)
        method.addInstructions(
            0,
            """
            iget-object v0, p1, ${rootViewField.definingClass}->${rootViewField.name}:Landroid/view/View;
            const/16 v1, 0x8
            invoke-virtual { v0, v1 }, Landroid/view/View;->setVisibility(I)V
            invoke-virtual { v0 }, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup${'$'}LayoutParams;
            move-result-object v1
            if-eqz v1, :end
            const/4 v2, 0x0
            iput v2, v1, Landroid/view/ViewGroup${'$'}LayoutParams;->height:I
            instance-of v3, v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;
            if-eqz v3, :apply
            check-cast v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;
            iput v2, v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;->topMargin:I
            iput v2, v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;->bottomMargin:I
            iput v2, v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;->leftMargin:I
            iput v2, v1, Landroid/view/ViewGroup${'$'}MarginLayoutParams;->rightMargin:I
            :apply
            invoke-virtual { v0, v1 }, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup${'$'}LayoutParams;)V
            :end
            return-void
            """.trimIndent()
        )
    }
}
