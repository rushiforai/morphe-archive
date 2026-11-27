package patches.gboard.features.sharedmodel
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.*
import patches.gboard.shared.runtimeabi.*

internal val gboardSharedGrammarPatch=bytecodePatch(description="Route optional inline grammar through the shared model's native grammar-result adapter."){
 compatibleWith(COMPATIBILITY_GBOARD)
 dependsOn(gboardSharedModelPatch,patches.gboard.features.featureflags.gboardGrammarCheckerFlagValuePatch)
 execute{
  listOf(GboardMethodTarget("Luum;","a",listOf("Lakpu;"),"Z"),GboardMethodTarget("Luum;","b",listOf("Ljava/lang/CharSequence;","Z"),"Lauaz;"),GboardMethodTarget("Luum;","close",emptyList(),"V"),GboardMethodTarget("Luuk;","<init>",emptyList(),"V"),GboardMethodTarget("Luuk;","a",emptyList(),"Luul;"),GboardMethodTarget("Lauaz;","n",listOf("Ljava/util/Collection;"),"Lauaz;")).forEach{it.resolve(this)}
  listOf(GboardFieldTarget("Luuj;","l","Landroid/content/Context;"),GboardFieldTarget("Luuk;","a","I"),GboardFieldTarget("Luuk;","b","I"),GboardFieldTarget("Luuk;","c","Ljava/util/List;")).forEach{it.resolve(this)}
  val factory=GboardMethodTarget("Luuj;","b",listOf("Lakpu;"),"Luum;").resolve(this)
  check(factory.implementation!!.registerCount>2)
  factory.addInstructionsWithLabels(0,"""
   iget-object v0, p0, Luuj;->l:Landroid/content/Context;
   ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_GRAMMAR_CREATE,"v0")}
   move-result-object v0
   if-eqz v0, :original
   return-object v0
  """,ExternalLabel("original",factory.implementation!!.instructions.first()))
  patchAndroidSentenceSuggestions()
 }
}

private const val SPELL_SESSION = "Luua;"
private const val STOCK_GRAMMAR = "Lutk;"
private const val CONTEXT = "Landroid/content/Context;"
private const val EDITOR_INFO = "Landroid/view/inputmethod/EditorInfo;"
private const val TEXT_INFO = "[Landroid/view/textservice/TextInfo;"
private const val SENTENCES = "[Landroid/view/textservice/SentenceSuggestionsInfo;"

private fun BytecodePatchContext.patchAndroidSentenceSuggestions() {
    val stock = GboardMethodTarget(
        SPELL_SESSION, "onGetSentenceSuggestionsMultiple", listOf(TEXT_INFO, "I"), SENTENCES,
    ).resolve(this)
    val plan = GboardMethodTarget(
        STOCK_GRAMMAR, "a", listOf(TEXT_INFO, "Ljava/lang/String;", "Lutp;", "Ljava/util/function/Supplier;"),
        "V",
    ).resolve(this)
    listOf(
        GboardFieldTarget(SPELL_SESSION, "j", CONTEXT),
        GboardFieldTarget(STOCK_GRAMMAR, "b", CONTEXT),
        GboardFieldTarget(STOCK_GRAMMAR, "g", "Lakpu;"),
    ).forEach { it.resolve(this) }
    listOf("d", "a").forEach { GboardMethodTarget("Lafcu;", it, emptyList(), EDITOR_INFO).resolve(this) }
    check(stock.implementation!!.instructions.any {
        it.isMethodReference("$STOCK_GRAMMAR->c($TEXT_INFO$SENTENCES" + "Luum;I)$SENTENCES")
    }) { "Gboard's Android sentence grammar route changed" }
    check(plan.implementation!!.instructions.any { it.isFieldReference("$STOCK_GRAMMAR->g:Lakpu;") })

    // Retain stock dictionary spans. Skip only the Google grammar delegate when
    // local inline grammar owns this session, even if its engine is unavailable.
    plan.addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        iget-object v1, v0, $STOCK_GRAMMAR->b:$CONTEXT
        ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_ANDROID_GRAMMAR_SELECTED, "v1")}
        move-result v1
        if-eqz v1, :stock
        const/4 v1, 0x0
        iput-object v1, v0, $STOCK_GRAMMAR->g:Lakpu;
        return-void
    """.trimIndent(), ExternalLabel("stock", plan.implementation!!.instructions.first()))

    val owner = mutableClass(SPELL_SESSION)
    val nativeName = "morpheStockSentenceSuggestions"
    val native = ImmutableMethod(
        stock.definingClass, nativeName, stock.parameters, stock.returnType,
        AccessFlags.PRIVATE.value or AccessFlags.FINAL.value,
        stock.annotations, stock.hiddenApiRestrictions, stock.implementation,
    ).toMutable()
    check(owner.methods.remove(stock) && owner.methods.add(native))
    owner.addHelperMethodIfMissing(stock.name, listOf(TEXT_INFO, "I"), SENTENCES,
        stock.accessFlags, 6, """
            invoke-direct {p0, p1, p2}, $SPELL_SESSION->$nativeName(${TEXT_INFO}I)$SENTENCES
            move-result-object v0
            iget-object v1, p0, $SPELL_SESSION->j:$CONTEXT
            invoke-static {}, Lafcu;->d()$EDITOR_INFO
            move-result-object v2
            if-nez v2, :merge
            invoke-static {}, Lafcu;->a()$EDITOR_INFO
            move-result-object v2
            :merge
            ${RuntimeCallEmitter.invoke(RuntimeCallId.SHARED_ANDROID_GRAMMAR_MERGE, "v1, v2, p1, v0")}
            move-result-object v0
            return-object v0
        """)
}
