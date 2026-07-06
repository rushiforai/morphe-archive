package dev.jason.gboardpatches.patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import dev.jason.gboardpatches.patches.gboard.shared.findMutableMethodOrThrow
import dev.jason.gboardpatches.patches.gboard.shared.indexOfFirstMoveResultAfter
import dev.jason.gboardpatches.patches.gboard.shared.methodCallIndices

private const val EXPRESSION_CORPUS_MANAGER_CLASS = "Lfsg;"

internal val gboardZhuyinCustomSymbolsCorpusPatch = bytecodePatch(
    description = "在 expression corpus list 追加自訂 symbol tab。"
) {
    dependsOn(gboardZhuyinCustomSymbolsExtensionPatch)

    execute {
        val mutableMethod = findMutableMethodOrThrow(
            classType = EXPRESSION_CORPUS_MANAGER_CLASS,
            name = "a",
            returnType = "Ltvg;",
            parameterTypes = listOf("Landroid/view/inputmethod/EditorInfo;", "Z")
        )
        val collectCallIndices = mutableMethod.methodCallIndices(
            definingClass = "Lj$/util/stream/Stream;",
            name = "collect",
            returnType = "Ljava/lang/Object;",
            parameterTypes = listOf("Lj$/util/stream/Collector;")
        )
        check(collectCallIndices.isNotEmpty()) {
            "Unable to find Stream->collect(Lj$/util/stream/Collector;)Ljava/lang/Object; in fsg.a"
        }
        // fsg.a() has an earlier collect() that builds List<Lnzd>; we need the final collect()
        // that materializes the corpus-item list (List<Lmik> / Ltvg).
        val collectCallIndex = collectCallIndices.last()
        val moveResultIndex = mutableMethod.indexOfFirstMoveResultAfter(collectCallIndex)
        check(moveResultIndex >= 0) { "Could not resolve collect() move-result in fsg.a" }
        val resultRegister = mutableMethod.returnRegisterAt(moveResultIndex)
        mutableMethod.addInstructions(moveResultIndex + 2, buildCorpusAppendDelegate(resultRegister))
    }
}

private fun buildCorpusAppendDelegate(register: Int): String = """
    invoke-static {v$register}, Ldev/jason/gboardpatches/extension/addsymbols/GboardAddSymbolsRuntime;->appendCustomCorpusItem(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v$register

    check-cast v$register, Ltvg;
""".trimIndent()
