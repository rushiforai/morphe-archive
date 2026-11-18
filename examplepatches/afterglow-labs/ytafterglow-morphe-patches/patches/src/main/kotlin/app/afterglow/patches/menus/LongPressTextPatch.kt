/* Copyright 2026 Morphe. Native boundaries adapted for YTAfterglow from Copy text
 * and TextComponentPatch at 44031c561ea048c8f196877f30a49c13bfd6afb6.
 * https://github.com/MorpheApp/morphe-patches
 * See NOTICE for GPLv3 Section 7 terms. Not an official Morphe file.
 * Rewritten for patcher 2.1 / stock 21.43.523: observe existing context/text
 * registers before reuse, preserve the native rendering flag, and expose typed
 * host and listener ownership bridges without native class stubs.
 * Portions provided "AS IS" by the Morphe software project, without express or implied
 * warranties, including merchantability and fitness for a particular purpose.
 */
package app.afterglow.patches.menus

import app.afterglow.patches.litho.disableRenderNextPatch
import app.afterglow.patches.litho.lithoConversionContextPatch
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.addMethod
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.smali
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableField.Companion.toMutable
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter

private const val TEXT_TOOLS = "$EXTENSION_PACKAGE/menus/LongPressTextTools;"
private const val TEXT_HOST = "$EXTENSION_PACKAGE/menus/LongPressTextHost;"
private const val TEXT_CONTEXT = "$EXTENSION_PACKAGE/litho/LithoContext;"
private const val HOST = "Lcom/facebook/litho/ComponentHost;"
private const val LONG_LISTENER = "Landroid/view/View\$OnLongClickListener;"

private fun Instruction.longPressMethod() = (this as? ReferenceInstruction)?.reference as? MethodReference
private fun Instruction.longPressField() = (this as? ReferenceInstruction)?.reference as? FieldReference

internal val longPressTextHookPatch = bytecodePatch {
    dependsOn(afterglowExtensionPatch, lithoConversionContextPatch, disableRenderNextPatch)
    execute {
        val old = Fingerprint(definingClass = "Lvuw;", name = "aC", parameters = listOf("Lhfs;"),
            returnType = "Lhfn;", filters = listOf(
                fieldAccess(smali = "Lvuw;->c:Lwuw;"),
                methodCall(definingClass = "Lvuq;", name = "k", returnType = "Ljava/lang/CharSequence;"),
                fieldAccess(smali = "Lhsl;->y:Ljava/lang/CharSequence;"), string("…"),
            )).method
        val oldCode = old.implementation!!.instructions.toList()
        val oldContext = oldCode.withIndex().single { it.value.longPressField()?.smali == "Lvuw;->c:Lwuw;" }
        val contextRegister = (oldContext.value as OneRegisterInstruction).registerA
        val storedText = oldCode.withIndex().single {
            it.value.opcode == Opcode.IPUT_OBJECT && it.value.longPressField()?.smali == "Lhsl;->y:Ljava/lang/CharSequence;"
        }
        val textRegister = (storedText.value as OneRegisterInstruction).registerA
        // Both the freshly generated and cached first text converge here (stock offset 0x00b5).
        // Later code reuses the context register; observe before that reuse, without cloning p0.
        val oldObserve = oldCode.indexOfFirst { it.longPressMethod()?.smali == "Lwhb;->n()Z" }
        require(oldObserve > oldContext.index && storedText.index > oldObserve)
        require(oldCode.subList(oldContext.index + 1, oldObserve).none { contextRegister in it.writtenRegisters })
        require(oldCode.subList(oldObserve, storedText.index).none { textRegister in it.writtenRegisters })
        require(contextRegister < 16 && textRegister < 16)
        old.addInstructionsAtControlFlowLabel(oldObserve,
            "invoke-static { v$contextRegister, v$textRegister }, $TEXT_TOOLS->onText(${TEXT_CONTEXT}Ljava/lang/CharSequence;)V")

        val modern = Fingerprint(definingClass = "Lvuz;", name = "L",
            parameters = listOf("Lhfs;", "Ljava/lang/Object;", "Lhhw;"), returnType = "V", filters = listOf(
                fieldAccess(smali = "Lvuz;->c:Lwuw;"),
                methodCall(smali = "Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V"),
                methodCall(name = "addOnLayoutChangeListener", parameters = listOf("Landroid/view/View\$OnLayoutChangeListener;")),
                methodCall(definingClass = "Lvuq;", name = "k", returnType = "Ljava/lang/CharSequence;"),
            )).method
        val modernCode = modern.implementation!!.instructions.toList()
        val modernContext = modernCode.withIndex().single { it.value.longPressField()?.smali == "Lvuz;->c:Lwuw;" }
        val modernContextRegister = (modernContext.value as OneRegisterInstruction).registerA
        val spans = modernCode.withIndex().filter {
            it.value.longPressMethod()?.smali == "Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V"
        }
        val fresh = modernCode.withIndex().filter {
            it.value.longPressMethod()?.let { ref -> ref.definingClass == "Lvuq;" && ref.name == "k"
                    && ref.returnType == "Ljava/lang/CharSequence;" } == true
        }
        require(spans.size == 2 && fresh.size == 2)
        val cached = spans.first()
        val cachedTextRegister = cached.value.invokeRegisters[1]
        require(modernCode.subList(modernContext.index + 1, cached.index)
            .none { modernContextRegister in it.writtenRegisters })
        val freshCall = fresh.first()
        require(freshCall.value.invokeRegisters.first() == modernContextRegister)
        require(modernCode[freshCall.index + 1].opcode == Opcode.MOVE_RESULT_OBJECT)
        val freshTextRegister = (modernCode[freshCall.index + 1] as OneRegisterInstruction).registerA
        require(listOf(modernContextRegister, cachedTextRegister, freshTextRegister).all { it < 16 })
        // Stock cached branch 0x0069; freshly generated branch 0x00df. Native style spans survive.
        modern.addInstructions(freshCall.index + 2,
            "invoke-static { v$modernContextRegister, v$freshTextRegister }, $TEXT_TOOLS->onText(${TEXT_CONTEXT}Ljava/lang/CharSequence;)V")
        modern.addInstructions(cached.index,
            "invoke-static { v$modernContextRegister, v$cachedTextRegister }, $TEXT_TOOLS->onText(${TEXT_CONTEXT}Ljava/lang/CharSequence;)V")

        val touch = Fingerprint(definingClass = HOST, name = "dispatchTouchEvent",
            parameters = listOf("Landroid/view/MotionEvent;"), returnType = "Z",
            filters = listOf(methodCall(name = "dispatchTouchEvent", opcode = Opcode.INVOKE_SUPER))).method
        Fingerprint(definingClass = HOST, name = "getTextContent", parameters = listOf(),
            returnType = "Lcom/facebook/litho/TextContent;",
            filters = listOf(methodCall(smali = "Lcci;->S(Ljava/util/List;)Lcom/facebook/litho/TextContent;"))).method
        require(classDefBy("Lcom/facebook/litho/TextContent;").methods.any {
            it.name == "getTextItems" && it.parameterTypes.isEmpty() && it.returnType == "Ljava/util/List;"
        })
        val host = mutableClassDefBy(HOST)
        require(host.methods.none { it.name == "setOnLongClickListener" }) {
            "Native ComponentHost now overrides long-press binding; ownership bridge must be rechecked"
        }
        host.interfaces.add(TEXT_HOST)
        host.addMethod("afterglow_textItems", "Ljava/util/List;", 2, """
            invoke-virtual { p0 }, $HOST->getTextContent()Lcom/facebook/litho/TextContent;
            move-result-object v0
            if-eqz v0, :empty
            invoke-interface { v0 }, Lcom/facebook/litho/TextContent;->getTextItems()Ljava/util/List;
            move-result-object v0
            return-object v0
            :empty
            invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;
            move-result-object v0
            return-object v0
        """)
        val listener = "$HOST->afterglow_longPressListener:$LONG_LISTENER"
        host.fields.add(ImmutableField(HOST, "afterglow_longPressListener", LONG_LISTENER,
            AccessFlags.PRIVATE.value, null, null, null).toMutable())
        host.addMethod("afterglow_longPressListener", LONG_LISTENER, 2, """
            iget-object v0, p0, $listener
            return-object v0
        """)
        // Track the current listener so cleanup can never erase a newer native replacement.
        // Keep this override non-final, preserving normal behavior for any native subclasses.
        host.methods.add(ImmutableMethod(HOST, "setOnLongClickListener",
            listOf(ImmutableMethodParameter(LONG_LISTENER, null, null)), "V", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(2)).toMutable().apply {
            addInstructions(0, """
                invoke-super { p0, p1 }, ${host.superclass}->setOnLongClickListener($LONG_LISTENER)V
                iput-object p1, p0, $listener
                return-void
            """)
        })
        touch.addInstructions(0,
            "invoke-static/range { p0 .. p1 }, $TEXT_TOOLS->touch(Landroid/view/View;Landroid/view/MotionEvent;)V")
        println("Afterglow temporary Morphe text copy: Lvuw.aC and Lvuz.L, native ComponentHost text/touch with listener ownership")
    }
}
