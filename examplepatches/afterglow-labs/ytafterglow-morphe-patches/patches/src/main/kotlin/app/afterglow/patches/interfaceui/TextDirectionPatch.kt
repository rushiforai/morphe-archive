package app.afterglow.patches.interfaceui

import app.afterglow.patches.shared.Constants.COMPATIBILITY_YOUTUBE
import app.afterglow.patches.shared.Constants.EXTENSION_PACKAGE
import app.afterglow.patches.shared.MainActivityOnCreateFingerprint
import app.afterglow.patches.shared.afterglowExtensionPatch
import app.afterglow.patches.shared.invokeRegisters
import app.afterglow.patches.shared.writtenRegisters
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.fieldAccess
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.addInstructionsAtControlFlowLabel
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val HEURISTIC = "Landroid/text/TextDirectionHeuristic;"
private const val POLICY = "$EXTENSION_PACKAGE/interfaceui/TextDirectionPolicy;"

/** Android counterpart of NSParagraphStyle's default writing-direction override. */
internal val textDirectionHookPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_YOUTUBE)
    dependsOn(afterglowExtensionPatch)
    execute {
        val paragraphDefaults = listOf(
            Fingerprint(definingClass = "Laclf;", name = "af", returnType = HEURISTIC,
                parameters = listOf("I", "I"), filters = listOf(
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_RTL:$HEURISTIC"),
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_LTR:$HEURISTIC"),
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->RTL:$HEURISTIC"),
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->LTR:$HEURISTIC"))).method,
            Fingerprint(definingClass = "Ljyi;", name = "r", returnType = HEURISTIC,
                parameters = emptyList(), filters = listOf(
                    methodCall(smali = "Lcom/google/android/libraries/youtube/rendering/ui/spec/typography/YouTubeAppCompatTextView;->getLayoutDirection()I"),
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_RTL:$HEURISTIC"),
                    fieldAccess(smali = "Landroid/text/TextDirectionHeuristics;->FIRSTSTRONG_LTR:$HEURISTIC"))).method,
        )
        val litho = Fingerprint(definingClass = "Lhfb;", name = "a", returnType = "Landroid/text/Layout;",
            parameters = emptyList(), filters = listOf(methodCall(
                smali = "Landroid/text/StaticLayout\$Builder;->setTextDirection($HEURISTIC)Landroid/text/StaticLayout\$Builder;"))).match()

        // These are the native base classes used by app labels, controls, text
        // inputs and legacy/modern Elements text views. Framework TextView calls
        // its virtual heuristic when it builds/rebuilds a paragraph layout.
        val textBases = linkedMapOf(
            "Landroid/support/v7/widget/AppCompatTextView;" to "Landroid/widget/TextView;",
            "Landroid/support/v7/widget/AppCompatEditText;" to "Landroid/widget/EditText;",
            "Landroid/support/v7/widget/AppCompatButton;" to "Landroid/widget/Button;",
            "Lks;" to "Landroid/widget/AutoCompleteTextView;",
            "Lku;" to "Landroid/widget/CheckBox;",
            "Lkv;" to "Landroid/widget/CheckedTextView;",
            "Llb;" to "Landroid/widget/MultiAutoCompleteTextView;",
            "Lle;" to "Landroid/widget/RadioButton;",
            "Llw;" to "Landroid/widget/ToggleButton;",
            "Lcom/google/android/libraries/youtube/common/ui/YouTubeTextView;" to "Landroid/widget/TextView;",
            "Lcom/google/android/apps/youtube/app/common/widget/WrappingTextView;" to "Landroid/widget/TextView;",
            "Lcom/google/android/apps/youtube/app/common/widget/WrappingTextViewForClarifyBox;" to "Landroid/widget/TextView;",
            "Lvlo;" to "Landroid/widget/EditText;",
        ).map { (type, parent) ->
            mutableClassDefBy(type).also { owner ->
                require(owner.superclass == parent && owner.methods.any { it.name == "<init>" }
                        && owner.methods.none { it.name == "getTextDirectionHeuristic" }) {
                    "Native text-view heuristic ownership changed: $type"
                }
            }
        }
        val activities = listOf(MainActivityOnCreateFingerprint.method,
            Fingerprint(definingClass = "$EXTENSION_PACKAGE/ui/AfterglowActivity;", name = "onCreate",
                returnType = "V", parameters = listOf("Landroid/os/Bundle;")).method)
        paragraphDefaults.forEach { method ->
            val returns = method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_OBJECT }
            require(returns.size == 1) { "Native paragraph heuristic return changed" }
            val result = returns.single()
            val register = (result.value as OneRegisterInstruction).registerA
            method.addInstructionsAtControlFlowLabel(result.index, """
                invoke-static/range { v$register .. v$register }, $POLICY->paragraph($HEURISTIC)$HEURISTIC
                move-result-object v$register
            """)
        }
        val layoutCall = litho.instructionMatches.single()
        val layoutDirection = layoutCall.instruction.invokeRegisters[1]
        litho.method.addInstructionsAtControlFlowLabel(layoutCall.index, """
            invoke-static/range { v$layoutDirection .. v$layoutDirection }, $POLICY->paragraph($HEURISTIC)$HEURISTIC
            move-result-object v$layoutDirection
        """)
        textBases.forEach { owner ->
            owner.methods.add(ImmutableMethod(owner.type, "getTextDirectionHeuristic", emptyList(), HEURISTIC,
                AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable().apply {
                addInstructions(0, """
                    invoke-super { p0 }, ${owner.superclass}->getTextDirectionHeuristic()$HEURISTIC
                    move-result-object v0
                    invoke-static { v0 }, $POLICY->paragraph($HEURISTIC)$HEURISTIC
                    move-result-object v0
                    return-object v0
                """)
            })
        }
        activities.forEach { method ->
            val receiver = method.implementation!!.registerCount - 2
            require(method.implementation!!.instructions.none { receiver in it.writtenRegisters }) {
                "Activity receiver is no longer preserved at the paragraph-direction callback"
            }
            method.implementation!!.instructions.withIndex().filter { it.value.opcode == Opcode.RETURN_VOID }
                .map { it.index }.asReversed().forEach { index ->
                    method.addInstructionsAtControlFlowLabel(index,
                        "invoke-static/range { p0 .. p0 }, $POLICY->onActivityCreate(Landroid/app/Activity;)V")
                }
        }
        println("Afterglow paragraph direction: two native default heuristics, Litho layout, ${textBases.size} native text-view bases")
    }
}
