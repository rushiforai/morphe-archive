package app.fakh.patches.detik

import app.fakh.patches.detik.shared.Constants.COMPATIBILITY_DETIK
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val ARTICLE = "Lorg/detikcom/rss/data/model/item/RssDaoItem;"
private const val PAGINATION = "Lorg/detikcom/rss/data/model/item/detail_article/DetailPagination;"
private const val MULTI_PAGE_TYPE = 2

/** The article screen's list builder; it adds the row of page numbers for a multi-page article. */
private object ArticleRowsFingerprint : Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;", "Ljava/util/List;", ARTICLE, "I"),
    filters = listOf(methodCall(definingClass = PAGINATION, name = "<init>")),
)

/** The article type resolver (live report, multi-page, photo and so on). */
private object ArticleTypeFingerprint : Fingerprint(
    returnType = "I",
    parameters = listOf(ARTICLE),
    strings = listOf("articleItem"),
)

@Suppress("unused")
val mergePagesPatch = bytecodePatch(
    name = "Merge article pages",
    description = "Shows every page of a multi-page article in one continuous article, without the page numbers.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_DETIK)
    category("Feature")
    extendWith("extensions/extension.mpe")

    execute {
        val rows = ArticleRowsFingerprint.method
        val paginationIndex = rows.instructions.indexOfFirst {
            ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == PAGINATION
        }
        val addIndex = rows.instructions.withIndex().first { (index, instruction) ->
            index > paginationIndex && instruction.opcode == Opcode.INVOKE_INTERFACE &&
                ((instruction as ReferenceInstruction).reference as MethodReference).name == "add"
        }.index
        rows.replaceInstruction(addIndex, "nop")

        // The body getter is the static String(RssDaoItem) of the same class that reads description and resume.
        val body = mutableClassDefBy(rows.definingClass).methods.filter { method ->
            method.returnType == "Ljava/lang/String;" && method.parameterTypes.map { it.toString() } == listOf(ARTICLE) &&
                method.instructions.any { (it as? ReferenceInstruction)?.reference?.toString()?.endsWith("->resume:Ljava/lang/String;") == true }
        }.singleOrNull() ?: throw PatchException("detikcom: the article body getter was not found.")
        val type = ArticleTypeFingerprint.method
        body.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, ${type.definingClass}->${type.name}($ARTICLE)I
                move-result v0
                add-int/lit8 v0, v0, -$MULTI_PAGE_TYPE
                if-nez v0, :original
                invoke-static { p0 }, Lapp/fakh/extension/detik/MergePages;->body(Ljava/lang/Object;)Ljava/lang/String;
                move-result-object p0
                return-object p0
            """,
            ExternalLabel("original", body.getInstruction(0)),
        )
    }
}
