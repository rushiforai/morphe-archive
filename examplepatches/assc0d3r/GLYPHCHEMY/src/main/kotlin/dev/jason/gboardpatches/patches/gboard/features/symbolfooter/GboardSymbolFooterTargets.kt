package dev.jason.gboardpatches.patches.gboard.features.symbolfooter

import app.morphe.patcher.patch.BytecodePatchContext
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_EXPRESSION_CORPUS_18_8
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_6_3
import dev.jason.gboardpatches.patches.gboard.shared.GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_8
import dev.jason.gboardpatches.patches.gboard.shared.GboardExpressionCorpusFingerprints
import dev.jason.gboardpatches.patches.gboard.shared.GboardMethodTarget
import dev.jason.gboardpatches.patches.gboard.shared.generated.GboardVersionBindings
import dev.jason.gboardpatches.patches.gboard.shared.selectReleaseTargets

/**
 * What the footer reorder needs from one release: the corpus-list method it rewrites and the
 * receiver wrapper that method constructs with `(self, EditorInfo, boolean)`.
 *
 * The receiver is part of the contract because the stock gate counts its constructor call: it is
 * how the method is told apart from a body that builds its list some other way, and it has to be
 * re-derived with the class names whenever the release renames them.
 */
internal data class SymbolFooterOrderTargets(
    val corpusList: GboardMethodTarget,
    val receiverConstructor: String,
    val fingerprints: GboardExpressionCorpusFingerprints,
)

/**
 * Chooses by what the APK actually declares. The generated projection describes 18.6.3 only, so a
 * build whose corpus method does not resolve there falls through to the audited 18.8.0 table
 * instead of failing on names that are not present.
 */
internal fun symbolFooterOrderTargets(context: BytecodePatchContext): SymbolFooterOrderTargets =
    selectReleaseTargets(
        context = context,
        projection = ::symbolFooterOrderProjection,
        probe = SymbolFooterOrderTargets::corpusList,
        audited = SYMBOL_FOOTER_ORDER_18_8,
    )

private fun symbolFooterOrderProjection() = SymbolFooterOrderTargets(
    corpusList = GboardVersionBindings.symbolFooterCorpus,
    receiverConstructor =
        "Lguy;-><init>(Lgva;Landroid/view/inputmethod/EditorInfo;Z)V",
    fingerprints = GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_6_3,
)

private val SYMBOL_FOOTER_ORDER_18_8 = SymbolFooterOrderTargets(
    corpusList = GBOARD_EXPRESSION_CORPUS_18_8,
    receiverConstructor =
        "Lnxp;-><init>(Lnxt;Landroid/view/inputmethod/EditorInfo;Z)V",
    fingerprints = GBOARD_EXPRESSION_CORPUS_FINGERPRINTS_18_8,
)
