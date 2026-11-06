package semicoloncolonel.mobilestream.patches.foxnews.misc

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import semicoloncolonel.mobilestream.patches.foxnews.shared.Constants

// ─────────────────────────────────────────────────────────────────────────────
// Fox News 5.49.2 — Hide prediction markets.
//
// Fox News embeds Kalshi market widgets (widgets.kalshi.com) in articles and
// live blogs. Each embed arrives as a web view component, and the article and
// live-blog item factories turn it into a list item (a dedicated Kalshi card,
// or a generic web view card). Every list those two factories return is
// passed through PredictionMarkets, which removes the items whose embed loads
// Kalshi, Polymarket, or PredictIt, so no empty space is left behind.
// ─────────────────────────────────────────────────────────────────────────────

private const val MARKETS = "Lsemicoloncolonel/mobilestream/extension/shared/misc/PredictionMarkets;"

private val FACTORIES = listOf(
    "Lcom/foxnews/article/factory/ArticleDetailItemEntryListFactory;",
    "Lcom/foxnews/liveblog/factory/LiveBlogPostComponentItemEntryListFactory;",
)

@Suppress("unused")
val hidePredictionMarketsPatch = bytecodePatch(
    name = "Hide prediction markets",
    description = "Removes Kalshi and Polymarket market widgets from articles and live blogs.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        var hooked = 0
        FACTORIES.forEach { type ->
            mutableClassDefBy(type).methods.forEach { method ->
                if (method.returnType != "Ljava/util/List;") return@forEach
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                // From the end, so earlier indices stay valid.
                instructions.indices.reversed().forEach { index ->
                    val instruction = instructions[index]
                    if (instruction.opcode != Opcode.RETURN_OBJECT) return@forEach
                    val register = (instruction as OneRegisterInstruction).registerA
                    method.addInstructions(
                        index,
                        """
                            invoke-static/range { v$register .. v$register }, $MARKETS->filterFoxItems(Ljava/util/List;)Ljava/util/List;
                            move-result-object v$register
                        """.trimIndent(),
                    )
                    hooked++
                }
            }
        }
        if (hooked == 0) throw PatchException("No article or live-blog item lists found")
    }
}
