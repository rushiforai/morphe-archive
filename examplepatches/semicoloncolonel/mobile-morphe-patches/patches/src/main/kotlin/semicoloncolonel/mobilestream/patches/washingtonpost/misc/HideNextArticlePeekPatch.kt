package semicoloncolonel.mobilestream.patches.washingtonpost.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import semicoloncolonel.mobilestream.patches.washingtonpost.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Hide next article peek.
//
// Articles open in a ViewPager2, one article per page. At the top of an
// article, the pager's page transformer moves each page left by the
// "viewpager_next_article_visible" and "viewpager_current_item_horizontal_margin"
// dimensions (12dp together), so the edge of the next article shows on the
// right. When the reader scrolls down, the fragment sets the transformer
// again with its "expand" flag on, which uses a zero offset, and the edge
// goes away.
//
// The method that sets the transformer now always takes "expand" as on, so
// the next article never shows. Swiping between articles still works.
//
// Found in 7.16.0. Articles2Fragment and ViewPager2 keep their names, and the
// method is found by its one boolean parameter and its setPageTransformer
// call.
// ─────────────────────────────────────────────────────────────────────────────

internal object ArticlesPagerTransformerFingerprint : Fingerprint(
    definingClass = "Lcom/wapo/flagship/features/articles2/fragments/Articles2Fragment;",
    returnType = "V",
    parameters = listOf("Z"),
    custom = { method, _ ->
        method.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.let { ref ->
                ref.definingClass == "Landroidx/viewpager2/widget/ViewPager2;" && ref.name == "setPageTransformer"
            } == true
        } == true
    },
)

@Suppress("unused")
val hideNextArticlePeekPatch = bytecodePatch(
    name = "Hide next article peek",
    description = "Hides the edge of the next article that shows on the right at the top of an article.",
    default = false,
) {
    category("Interface")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ArticlesPagerTransformerFingerprint.method.addInstructions(0, "const/4 p1, 0x1")
    }
}
