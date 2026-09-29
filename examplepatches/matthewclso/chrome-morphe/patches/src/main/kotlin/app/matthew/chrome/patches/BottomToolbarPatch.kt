package app.matthew.chrome.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

val bottomToolbarPatch = bytecodePatch(
    description = "Retains the bottom position on new-tab pages and during address entry when Chrome's bottom position is selected.",
    default = false,
) {
    compatibleWith(chromeCompatibility)
    dependsOn(modeTogglePatch)
    execute {
        requireTarget(packageMetadata)
        val controller = classDefByStrings("Set a new control position: ").single()
        check(controller.methods.any { it.hasString("omnibox.bottom_omnibox_ever_used") })
        val calculate = mutableClassDefBy(controller).methods.single {
            it.parameterTypes == listOf("Z", "Z", "Z", "Z", "Z", "Z", "Z", "I") && it.returnType == "I"
        }
        // Preserve tab-switcher/find-in-page behavior and the user's top/bottom preference.
        calculate.addInstructions(0, """
            invoke-static {p1}, Lapp/matthew/chrome/extension/PatchSettings;->keepNativeNtpOrFocus(Z)Z
            move-result p1
            invoke-static {p3}, Lapp/matthew/chrome/extension/PatchSettings;->keepNativeNtpOrFocus(Z)Z
            move-result p3
        """.trimIndent())
        val preference = controller.methods.single { it.name == "b" && it.parameterTypes.isEmpty() && it.returnType == "Z" }
        mutableClassDefBy(controller).methods.single { it.name == "b" && it.parameterTypes.isEmpty() }.addInstructions(0, """
            invoke-static {}, Lapp/matthew/chrome/extension/PatchSettings;->trueBottom()Z
            move-result v0
            if-eqz v0, :native_position
            const/4 v0, 0x0
            return v0
            :native_position
            nop
        """.trimIndent())
        mutableClassDefBy(BRIDGE).methods.single { it.name == "bottomSelected" }.addInstructions(0, """
            invoke-static {}, $preference
            move-result v0
            xor-int/lit8 v0, v0, 0x1
            return v0
        """.trimIndent())
        val suggestions = mutableClassDefBy("Lorg/chromium/chrome/browser/omnibox/suggestions/OmniboxSuggestionsContainer;")
            .methods.single { it.hasString("OmniboxSuggestionsList.Measure") }
        val code = suggestions.implementation!!.instructions
        val top = code.withIndex().single { (_, ins) ->
            ins.opcode == Opcode.IGET && (ins as? ReferenceInstruction)?.reference?.toString() == "Ltci;->b:I"
        }
        val height = code.withIndex().first { (_, ins) ->
            ins.opcode == Opcode.IGET && (ins as? ReferenceInstruction)?.reference?.toString() == "Ltci;->d:I"
        }
        val thisRegister = suggestions.implementation!!.registerCount - 3
        check(thisRegister < 16)
        for ((point, hook) in listOf(height to "suggestionHeight", top to "suggestionTop")) {
            val register = (point.value as OneRegisterInstruction).registerA
            suggestions.addInstructions(point.index + 1, """
                invoke-static {v$thisRegister, v$register}, $EXTENSION->$hook(Landroid/view/View;I)I
                move-result v$register
            """.trimIndent())
        }
        val toolbar = mutableClassDefBy("Lorg/chromium/chrome/browser/toolbar/top/ToolbarPhone;")
        var morphHooks = 0
        for (method in toolbar.methods) {
            val instructions = method.implementation?.instructions ?: continue
            val calls = instructions.withIndex().filter { (_, ins) ->
                ((ins as? ReferenceInstruction)?.reference as? MethodReference)?.toString() == "Lrnh;->k()Z"
            }.map { it.index }
            for (index in calls.reversed()) {
                val result = instructions[index + 1]
                check(result.opcode == Opcode.MOVE_RESULT)
                val register = (result as OneRegisterInstruction).registerA
                method.addInstructions(index + 2, """
                    invoke-static/range {v$register .. v$register}, $EXTENSION->useNtpMorph(Z)Z
                    move-result v$register
                """.trimIndent())
                morphHooks++
            }
        }
        check(morphHooks == 5) { "Expected five phone NTP morph decisions; found $morphHooks" }
        println("Bottom toolbar state hook: $calculate")
    }
}
