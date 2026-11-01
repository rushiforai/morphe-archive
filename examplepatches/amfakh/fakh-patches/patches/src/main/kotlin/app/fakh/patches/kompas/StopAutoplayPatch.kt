package app.fakh.patches.kompas

import app.fakh.patches.kompas.shared.Constants.COMPATIBILITY_KOMPAS
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/** DetailItemEmbedViewHolder.initializeRecommendationVideo: sets up the "Video Pilihan" WebView under an article. */
private object RecommendationVideoFingerprint : Fingerprint(
    definingClass = "Lcom/ertanto/kompas/official/detail/itemView/content/DetailItemEmbedViewHolder;",
    name = "initializeRecommendationVideo",
    returnType = "V",
    parameters = listOf("Landroid/view/View;", "Ljava/lang/String;"),
)

@Suppress("unused")
val stopAutoplayPatch = bytecodePatch(
    name = "Stop autoplay",
    description = "Stops the videos in the \"Video Pilihan\" block under an article from playing on their own. They play when tapped.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_KOMPAS)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        RecommendationVideoFingerprint.method.apply {
            // The last client set is the one that opens tapped links; the extension wraps it.
            val setClient = instructions.indexOfLast {
                (it as? ReferenceInstruction)?.reference?.toString() ==
                    "Landroid/webkit/WebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V"
            }
            if (setClient < 0) throw PatchException("Kompas: setWebViewClient was not found in the Video Pilihan setup")
            val call = instructions[setClient] as FiveRegisterInstruction
            replaceInstruction(
                setClient,
                "invoke-static { v${call.registerC}, v${call.registerD} }, " +
                    "Lapp/fakh/extension/kompas/StopAutoplay;->setClient(Landroid/webkit/WebView;Landroid/webkit/WebViewClient;)V",
            )
        }
    }
}
