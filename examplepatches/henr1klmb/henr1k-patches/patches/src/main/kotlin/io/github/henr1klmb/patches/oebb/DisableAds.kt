package io.github.henr1klmb.patches.oebb

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.patch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

private const val HELPER = "Lio/github/henr1klmb/patches/shared/WebViewHelper;"

@Suppress("unused")
val disableAdsPatch = patch(
    name = "Disable ads",
    description = "Blocks Wegfinder ad, marketing banners and others.",
) {
    compatibleWith(OEBB_COMPATIBILITY)
    extendWith("extensions/extension.mpe")

    execute {
        // Inject ad blocking script into WebViews
        HafasWebViewClientFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static {p1}, $HELPER->injectAdBlock(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // Force WAYFINDER_AD_ENABLED to false in connection overview list, triggering the app's
        // native ad hiding path (View.GONE) without crashing RecyclerView measurements
        OebbConnectionOverviewAdFingerprint.methodOrNull?.let { method ->
            val instructions = method.implementation?.instructions?.toList() ?: emptyList()
            val wayfinderIndex = instructions.indexOfFirst {
                (it.opcode == Opcode.CONST_STRING) &&
                    ((it as? ReferenceInstruction)?.reference?.toString() == "WAYFINDER_AD_ENABLED")
            }
            if (wayfinderIndex != -1 && wayfinderIndex + 2 < instructions.size) {
                val moveResultIndex = wayfinderIndex + 2
                if (instructions[moveResultIndex].opcode == Opcode.MOVE_RESULT) {
                    method.replaceInstruction(moveResultIndex, "const/4 v0, 0x0")
                }
            }
        }

        // Hide Wegfinder ad banner in the navigation drawer and return immediately
        OebbDrawerAdFingerprint.methodOrNull?.addInstructions(
            0,
            """
                iget-object v0, p0, Lde/hafas/app/menu/HafasDrawerProvider;->oebbAdView:Landroid/view/View;
                if-nez v0, :cond_hide
                return-void
                :cond_hide
                const/16 v1, 0x8
                invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V
                return-void
            """.trimIndent(),
        )

        // Neutralize TRM (Targeted Relationship Marketing) banners in drawer
        ShowTrmBannersFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )

        // Neutralize Wegfinder ad click handler
        OebbAdClickHandlerFingerprint.methodOrNull?.addInstructions(
            0,
            "return-void",
        )
    }
}
