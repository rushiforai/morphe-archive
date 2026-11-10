package app.fakh.patches.jira

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * Adds the Fakh Patches category to Settings: a card between the Language/Theme card and the Quick Lock card. The
 * main Settings list is one composable in `SettingsKt` that draws its cards with several SpacedItemsKt.a calls, the
 * Language/Theme card first; the call to the extension goes after that one and only reads the composer's register.
 * Patches that have a switch depend on this one.
 */
val settingsRowsPatch = bytecodePatch {
    extendWith("extensions/extension.mpe")

    execute {
        var added = 0
        classDefForEach { classDef ->
            classDef.methods.forEach { method ->
                val instructions = method.implementation?.instructions?.toList() ?: return@forEach
                val cards = instructions.withIndex().filter { (_, instruction) ->
                    instruction.opcode == Opcode.INVOKE_STATIC_RANGE &&
                        ((instruction as ReferenceInstruction).reference as MethodReference).let {
                            it.definingClass.endsWith("/SpacedItemsKt;") && it.name == "a" && it.parameterTypes.size == 7
                        }
                }
                if (!classDef.type.endsWith("/settings/impl/SettingsKt;") || cards.size < 2) return@forEach
                val composer = (cards[0].value as RegisterRangeInstruction).startRegister + 4
                mutableClassDefBy(classDef).methods.first {
                    it.name == method.name && it.parameterTypes.map(CharSequence::toString) == method.parameterTypes.map(CharSequence::toString)
                }.addInstructions(
                    cards[0].index + 1,
                    "invoke-static/range { v$composer .. v$composer }, Lapp/fakh/extension/jira/FakhSettings;->addCard(Ljava/lang/Object;)V",
                )
                added++
            }
        }
        if (added != 1) throw PatchException("Expected one Settings list, found $added")
    }
}
