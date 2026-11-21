package app.stylus.patches.chatgpt.font

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.decode
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction11x
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction31c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference

private const val EXTENSION = "Lapp/stylus/extension/chatgpt/patches/CustomFontPatch;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val PAINT = "Landroid/graphics/Paint;"
private const val TEXT_VIEW = "Landroid/widget/TextView;"
private const val STRING = "Ljava/lang/String;"

internal val chatGptFontHooksPatch = patch {
    extendWith("extensions/extension.mpe")

    execute {
        decode(PREVIEW_STYLESHEET)
        val application = mutableClassDefBy("Lcom/openai/chatgpt/app/MainApplication;")
        val applicationBase = application.superclass
            ?: throw PatchException("Could not find ChatGPT's application base class.")
        method(applicationBase, "attachBaseContext", "(Landroid/content/Context;)V")
            .addInstructionsWithLabels(0, "invoke-static {p1}, $EXTENSION->initialize(Landroid/content/Context;)V")

        patchComposeTypeface()
        patchValdiTypeface()
    }
}

// These obfuscated classes are scoped to the supported ChatGPT build.
private fun patchComposeTypeface() {
    // The Android platform font implementations take the family name, weight, and style.
    for ((owner, name) in listOf("Lwau0;" to "c", "Lqop0;" to "i")) {
        method(owner, name, "(${STRING}Ldv90;I)$TYPEFACE").returnCustomTypeface(
            """
                iget v0, p1, Ldv90;->a:I
                invoke-static {p0, v0, p2}, $EXTENSION->composeTypeface(${STRING}II)$TYPEFACE
            """.trimIndent(),
        )
    }

    // The legacy generic-family branch specializes sans-serif before reaching its helper.
    method("Lqop0;", "b", "(Lkfa0;Ldv90;I)$TYPEFACE").returnCustomTypeface(
        """
            iget-object v0, p1, Lkfa0;->f:$STRING
            iget v1, p2, Ldv90;->a:I
            invoke-static {v0, v1, p3}, $EXTENSION->composeTypeface(${STRING}II)$TYPEFACE
        """.trimIndent(),
    )
}

internal fun patchComposeDesignTypeface() {
    // The design system also loads two bundled text faces through Compose resources.
    method(
        "Lujf0;", "h",
        "(Landroid/content/res/AssetManager;${STRING}Landroid/content/Context;Lzu90;)$TYPEFACE",
    ).returnCustomTypeface(
        "invoke-static/range {p1 .. p1}, $EXTENSION->composeDesignTypeface($STRING)$TYPEFACE",
    )
}

private fun patchValdiTypeface() {
    // The registered-family path covers the C++ text renderer and weighted Android spans.
    method("Llt90;", "a", "(FZ)$TYPEFACE").returnCustomTypeface(
        """
            iget-object v0, p0, Llt90;->a:Lzs90;
            iget-object v1, v0, Lzs90;->b:$STRING
            iget-object v0, v0, Lzs90;->a:$STRING
            invoke-static {v0, v1, p1, p2}, $EXTENSION->valdiTypeface($STRING${STRING}FZ)$TYPEFACE
        """.trimIndent(),
    )

    // The named lookup is also used directly by Valdi's Android text views.
    method("Lut90;", "d", "(Lzs90;)$TYPEFACE").returnCustomTypeface(
        """
            iget-object v0, p1, Lzs90;->a:$STRING
            iget-object v1, p1, Lzs90;->c:Lcv90;
            iget-short v1, v1, Lcv90;->a:S
            iget v2, p1, Lzs90;->d:I
            invoke-static {v0, v1, v2}, $EXTENSION->valdiNamedTypeface(${STRING}II)$TYPEFACE
        """.trimIndent(),
    )
}

internal fun patchVisualizationFontFamily(target: ChatGptFont) {
    val method = mutableClassDefBy("Lkl50;").methods.singleOrNull { candidate ->
        candidate.implementation?.instructions?.any {
            ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == target.previewVariable
        } == true
    } ?: throw PatchException("Could not find ChatGPT's Spaces visualization theme.")

    val fontValue = method.implementation!!.instructions.withIndex().singleOrNull { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? StringReference)?.string == target.previewFallback
    } ?: throw PatchException("Could not find the Spaces ${target.previewVariable} value.")
    val register = (fontValue.value as OneRegisterInstruction).registerA
    method.replaceInstruction(
        fontValue.index,
        BuilderInstruction31c(
            Opcode.CONST_STRING_JUMBO,
            register,
            ImmutableStringReference("${target.previewFamily},${target.previewFallback}"),
        ),
    )
}

internal fun patchDirectMonospaceSpans() {
    val getMonospace = ImmutableMethodReference(EXTENSION, "monospaceTypeface", emptyList(), TYPEFACE)
    // Some code spans read Typeface.MONOSPACE directly instead of using Compose's resolver.
    for (owner in listOf("Lgzl;", "Lwxl;")) {
        for (name in listOf("updateDrawState", "updateMeasureState")) {
            val span = method(owner, name, "(Landroid/text/TextPaint;)V")
            val field = span.implementation!!.instructions.withIndex().singleOrNull { (_, instruction) ->
                instruction.opcode == Opcode.SGET_OBJECT &&
                    (instruction as? ReferenceInstruction)?.reference.toString() == "$TYPEFACE->MONOSPACE:$TYPEFACE"
            } ?: throw PatchException("Could not find the direct monospace typeface in $owner->$name.")
            val register = (field.value as OneRegisterInstruction).registerA
            span.replaceInstruction(field.index, BuilderInstruction35c(Opcode.INVOKE_STATIC, 0, 0, 0, 0, 0, 0, getMonospace))
            span.addInstruction(field.index + 1, BuilderInstruction11x(Opcode.MOVE_RESULT_OBJECT, register))
        }
    }
}

internal fun patchFontFeatureCalls() {
    val paragraph = method("Lp73;", "<init>", "(${STRING}Luaa1;Ljava/util/List;Ljava/util/List;Lat90;Ldhz;Z)V")
    if (paragraph.replacePaintCalls() == 0) {
        throw PatchException("Could not find Compose font operations in the paragraph renderer.")
    }

    val spans = listOf("Ltxb1;", "Lsxb1;", "Lgzl;", "Ljgx;", "Lwxl;")
    for (owner in spans) {
        for (name in listOf("updateDrawState", "updateMeasureState")) {
            method(owner, name, "(Landroid/text/TextPaint;)V").replacePaintCalls()
        }
    }

    val valdiPaintClasses = listOf(
        "Lcom/snap/valdi/attributes/impl/fonts/ElementFont;",
        "Lcom/snap/valdi/attributes/impl/richtext/ElementTextLayoutBuilder;",
        "Lws90;",
        "Lnba1;",
    )
    for (owner in valdiPaintClasses) {
        if (mutableClassDefBy(owner).methods.sumOf { it.replacePaintCalls() } == 0) {
            throw PatchException("Could not find Valdi font operations in $owner.")
        }
    }
}

private fun MutableMethod.replacePaintCalls(): Int {
    val instructions = implementation?.instructions ?: return 0
    var count = 0
    for ((index, instruction) in instructions.withIndex()) {
        val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference ?: continue
        val extensionCall = when (call.toString()) {
            "$PAINT->setTypeface($TYPEFACE)$TYPEFACE" ->
                ImmutableMethodReference(EXTENSION, "setTypeface", listOf(PAINT, TYPEFACE), TYPEFACE)
            "$PAINT->setFontFeatureSettings($STRING)V" ->
                ImmutableMethodReference(EXTENSION, "setFontFeatureSettings", listOf(PAINT, STRING), "V")
            "$TEXT_VIEW->setTypeface($TYPEFACE)V" ->
                ImmutableMethodReference(EXTENSION, "setViewTypeface", listOf(TEXT_VIEW, TYPEFACE), "V")
            "$TEXT_VIEW->setFontFeatureSettings($STRING)V" ->
                ImmutableMethodReference(EXTENSION, "setViewFontFeatureSettings", listOf(TEXT_VIEW, STRING), "V")
            else -> continue
        }
        val replacement = when (instruction.opcode) {
            Opcode.INVOKE_VIRTUAL -> (instruction as FiveRegisterInstruction).run {
                BuilderInstruction35c(
                    Opcode.INVOKE_STATIC, registerCount, registerC, registerD, registerE, registerF, registerG,
                    extensionCall,
                )
            }
            Opcode.INVOKE_VIRTUAL_RANGE -> (instruction as RegisterRangeInstruction).run {
                BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, startRegister, registerCount, extensionCall)
            }
            else -> continue
        }
        replaceInstruction(index, replacement)
        count++
    }
    return count
}

private fun MutableMethod.returnCustomTypeface(loadTypeface: String) {
    addInstructionsWithLabels(
        0,
        """
            $loadTypeface
            move-result-object v0
            if-eqz v0, :original
            return-object v0
            :original
            nop
        """.trimIndent(),
    )
}

private fun method(owner: String, name: String, descriptor: String): MutableMethod =
    mutableClassDefBy(owner).methods.singleOrNull {
        it.name == name && it.parameterTypes.joinToString("", "(", ")") + it.returnType == descriptor
    } ?: throw PatchException("Could not find the ChatGPT font hook $owner->$name$descriptor.")
