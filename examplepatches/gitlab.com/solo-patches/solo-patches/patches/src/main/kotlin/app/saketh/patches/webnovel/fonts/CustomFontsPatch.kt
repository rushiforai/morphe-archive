package app.saketh.patches.webnovel.fonts

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.saketh.patches.webnovel.controls.hookAt
import app.morphe.patcher.patch.mutableClassDefBy
import app.morphe.patcher.patch.patch
import app.morphe.patcher.util.findFreeRegister
import app.saketh.patches.shared.Constants.COMPATIBILITY_WEBNOVEL
import app.saketh.patches.webnovel.controls.patchControlsRuntime
import app.saketh.patches.webnovel.controls.registerFeature
import app.saketh.patches.webnovel.reader.ReaderTypefaceFingerprint
import app.saketh.patches.webnovel.reader.invalidateCall
import app.saketh.patches.webnovel.reader.readerPaintFontsFingerprint
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

private const val HOOKS = "Lapp/saketh/extension/fonts/FontHooks;"
private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val CONTEXT = "Landroid/content/Context;"

@Suppress("unused")
val customFontsPatch = patch(
    name = "Custom fonts",
    description = "Adds separate private TTF/OTF imports for native app text and reader text in Settings > Patch controls.",
    default = false,
) {
    compatibleWith(COMPATIBILITY_WEBNOVEL)
    dependsOn(patchControlsRuntime)

    execute {
        registerFeature("custom_fonts")
        val reader = ReaderTypefaceFingerprint.method
        val fonts = ReaderTypefaceFingerprint.classDef
        // The native UI faces are the font class's system "sans-serif" families.
        val ui = fonts.methods.filter { method ->
            method.returnType == TYPEFACE && method.parameterTypes == listOf(CONTEXT) &&
                method.implementation?.instructions.orEmpty().any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string?.startsWith("sans-serif") == true
                }
        }
        check(ui.size == 4) { "Expected four native UI typefaces, found ${ui.map { it.name }}" }

        val paints = readerPaintFontsFingerprint()
        val invalidate = paints.classDef.invalidateCall()
        // The reader's empty-selection fallback must not inherit the UI font.
        paints.method.apply {
            val selected = paints.instructionMatches.single().index
            val index = implementation!!.instructions.withIndex().first { (index, instruction) ->
                val call = (instruction as? ReferenceInstruction)?.reference as? MethodReference
                index > selected && call?.definingClass == fonts.type && ui.any { it.name == call.name }
            }.index
            val register = getInstruction<FiveRegisterInstruction>(index).registerC
            replaceInstruction(index,
                "invoke-static { v$register }, $HOOKS->readerFallbackTypeface($CONTEXT)$TYPEFACE")
        }
        (ui + reader).forEach { method ->
            val target = if (method == reader) "readerTypeface" else "uiTypeface"
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }.reversed().forEach { (index, register) ->
                    method.hookAt(index, """
                        invoke-static/range { v$register .. v$register }, $HOOKS->$target($TYPEFACE)$TYPEFACE
                        move-result-object v$register
                    """)
                }
        }

        val helper = mutableClassDefBy("Landroidx/appcompat/widget/AppCompatTextHelper;")
        val viewField = helper.fields.single { it.type == "Landroid/widget/TextView;" }.name
        val signatures: Set<List<CharSequence>> = setOf(
            listOf("Landroid/util/AttributeSet;", "I"),
            listOf(CONTEXT, "I"),
        )
        val setters = helper.methods.filter { it.returnType == "V" && it.parameterTypes in signatures }
        check(setters.size == 2)
        setters.forEach { method ->
            val receiver = method.implementation!!.registerCount - method.parameterTypes.size - 1
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach { index ->
                    val register = method.findFreeRegister(index, receiver)
                    check(register < 16)
                    method.hookAt(index, """
                        move-object/from16 v$register, p0
                        iget-object v$register, v$register, ${helper.type}->$viewField:Landroid/widget/TextView;
                        invoke-static { v$register }, $HOOKS->apply(Landroid/view/View;)V
                    """)
                }
        }
        // Async resource callbacks must carry the selected face into their posted Runnable.
        helper.methods.single {
            it.returnType == "V" && it.parameterTypes == listOf("Ljava/lang/ref/WeakReference;", TYPEFACE)
        }.addInstructions(0, """
            invoke-static/range { p2 .. p2 }, $HOOKS->uiTypeface($TYPEFACE)$TYPEFACE
            move-result-object p2
        """)
        mutableClassDefBy("Lskin/support/app/SkinCompatDelegate;").methods.filter {
            it.name == "onCreateView" && it.returnType == "Landroid/view/View;"
        }.forEach { method ->
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
                .map { it.index to (it.value as OneRegisterInstruction).registerA }.reversed().forEach { (index, register) ->
                    method.hookAt(index, "invoke-static/range { v$register .. v$register }, $HOOKS->apply(Landroid/view/View;)V")
                }
        }
        val changes = mutableClassDefBy(HOOKS).methods.filter { it.name in setOf("importFont", "reset") }
        check(changes.size == 2)
        changes.forEach { method ->
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.reversed().forEach { index ->
                    // Reuse the reader's own paint-cache invalidation before its next screen opens.
                    method.hookAt(index, invalidate)
                }
        }
    }
}
