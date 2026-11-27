package patches.gboard.features.addsymbols

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import patches.gboard.Constants.COMPATIBILITY_GBOARD
import patches.gboard.shared.GboardFieldTarget
import patches.gboard.shared.GboardMethodTarget
import patches.gboard.shared.gboardPatchesExtensionCarrierPatch
import patches.gboard.shared.isFieldReference
import patches.gboard.shared.isMethodReference
import patches.gboard.shared.isOpcode
import patches.gboard.shared.runtimeabi.RuntimeCallEmitter
import patches.gboard.shared.runtimeabi.RuntimeCallId

private const val EMOTICON =
    "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonKeyboardM2;"
private const val RECYCLER =
    "Lcom/google/android/apps/inputmethod/libs/search/emoticon/EmoticonRecyclerView;"
private const val STRING = "Ljava/lang/String;"
private const val LIST = "Lauaz;"
private const val CONTEXT = "Landroid/content/Context;"
private const val CLICK = "Ltit;"
private const val HEADER = "Ltiv;"

internal val gboardNativeSymbolsPatch = bytecodePatch(
    description = "Show the custom corpus using Gboard's native themed expression keyboard.",
) {
    compatibleWith(COMPATIBILITY_GBOARD)
    dependsOn(gboardPatchesExtensionCarrierPatch)
    execute {
        val activate = GboardMethodTarget(EMOTICON, "e",
            listOf("Landroid/view/inputmethod/EditorInfo;", "Ljava/lang/Object;"), "V").resolve(this)
        val deactivate = GboardMethodTarget(EMOTICON, "f", emptyList(), "V").resolve(this)
        val render = GboardMethodTarget(EMOTICON, "E", listOf(RECYCLER, STRING), "V").resolve(this)
        val selection = GboardMethodTarget(EMOTICON, "o", listOf(LIST), "I").resolve(this)
        val categoryChanged = GboardMethodTarget(EMOTICON, "G", listOf("I", "I"), "V").resolve(this)
        val title = GboardMethodTarget(EMOTICON, "cF", emptyList(), STRING).resolve(this)
        val header = GboardMethodTarget(HEADER, "accept", listOf("Ljava/lang/Object;"), "V").resolve(this)
        val click = GboardMethodTarget(CLICK, "accept", listOf("Ljava/lang/Object;"), "V").resolve(this)
        listOf(
            GboardMethodTarget(EMOTICON, "A", listOf("I"), STRING),
            GboardMethodTarget(EMOTICON, "I", listOf(RECYCLER, LIST, STRING), "V"),
            GboardMethodTarget(LIST, "n", listOf("Ljava/util/Collection;"), LIST),
            GboardMethodTarget("Lagoq;", "<init>", listOf("Lagoo;"), "V"),
            GboardMethodTarget("Laars;", "a", listOf("Lagoq;"), "Laars;"),
            GboardMethodTarget("Lafae;", "bT", listOf("Ladan;"), "V"),
        ).forEach { it.resolve(this) }
        listOf(
            GboardFieldTarget("Lagoo;", "g", "Lagoo;"),
            GboardFieldTarget("Laars;", "b", "Ladan;"),
            GboardFieldTarget(CLICK, "a", EMOTICON),
            GboardFieldTarget("Ltiq;", "a", LIST),
        ).forEach { it.resolve(this) }
        check(render.implementation!!.instructions.any { it.isMethodReference("$EMOTICON->I($RECYCLER$LIST$STRING)V") })
        check(click.implementation!!.registerCount >= 4)
        check(activate.implementation!!.instructions.any { it.isMethodReference("Lnxt;->b(Lahws;Ljava/lang/Class;)V") })
        activate.addInstructions(0, emission(RuntimeCallId.NATIVE_SYMBOLS_ENTER, "p0 .. p1"))
        deactivate.addInstructions(0, emission(RuntimeCallId.NATIVE_SYMBOLS_LEAVE, "p0 .. p0"))
        render.withCustomSymbols(emission(RuntimeCallId.NATIVE_SYMBOLS_RENDER, "p0 .. p2"), "return-void")
        selection.withCustomSymbols(activeCall, "const/4 v0, 0x1\nreturn v0")
        categoryChanged.withCustomSymbols(activeCall, "return-void")
        title.withCustomSymbols(activeCall, """const-string v0, "Custom Symbols"
            return-object v0""".trimIndent())
        click.withCustomSymbols("""
            move-object/from16 v0, p0
            iget-object v0, v0, $CLICK->a:$EMOTICON
            move-object/from16 v1, p1
            ${emission(RuntimeCallId.NATIVE_SYMBOLS_INSERT, "v0, v1")}
        """.trimIndent(), "return-void")
        header.installCustomCategoryLabels()
    }
}

private val activeCall = emission(RuntimeCallId.NATIVE_SYMBOLS_ACTIVE, "p0 .. p0")

private fun emission(id: RuntimeCallId, registers: String) = RuntimeCallEmitter.invoke(id, registers)

private fun MutableMethod.withCustomSymbols(call: String, customBody: String) {
    val code = checkNotNull(implementation)
    check(code.registerCount > parameterTypes.size + 1) { "No scratch register for $name" }
    addInstructionsWithLabels(0, """
        $call
        move-result v0
        if-eqz v0, :stock
        $customBody
    """.trimIndent(), ExternalLabel("stock", code.instructions.first()))
}

private fun MutableMethod.installCustomCategoryLabels() {
    val body = implementation!!.instructions
    val arrayIndex = body.indices.single { body[it].isOpcode("SGET_OBJECT") &&
            body[it].isFieldReference("Ltiq;->a:$LIST") }
    val array = (body[arrayIndex] as OneRegisterInstruction).registerA
    val captionIndex = body.indices.single { body[it].isMethodReference("$CONTEXT->getString(I)$STRING") }
    check(body.getOrNull(captionIndex + 1)?.isOpcode("MOVE_RESULT_OBJECT") == true)
    val captionArguments = when (val call = body[captionIndex]) {
        is FiveRegisterInstruction -> "v${call.registerC}, v${call.registerD}"
        is RegisterRangeInstruction -> "v${call.startRegister} .. v${call.startRegister + 1}"
        else -> error("Unsupported native expression category caption call")
    }
    replaceInstruction(captionIndex, emission(RuntimeCallId.NATIVE_SYMBOLS_LABEL, captionArguments))
    addInstructions(arrayIndex + 1, """
        ${emission(RuntimeCallId.NATIVE_SYMBOLS_RESOURCES, "v$array .. v$array")}
        move-result-object v$array
        check-cast v$array, $LIST
    """.trimIndent())
}
