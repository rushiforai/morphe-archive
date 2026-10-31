package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.*

private const val TOKENIZER = "Landroid/widget/MultiAutoCompleteTextView;->setTokenizer(Landroid/widget/MultiAutoCompleteTextView\$Tokenizer;)V"

internal fun legacyEmoteInputBinding(all: List<Method>): Method = all.filter { method ->
        val calls = method.references().filterIsInstance<MethodReference>()
        calls.any { it.toString() == TOKENIZER } && calls.any {
            it.definingClass == "Landroid/widget/AutoCompleteTextView;" && it.name == "setAdapter"
        }
    }.uniqueHook("legacy native autocomplete binding")

internal fun BytecodePatchContext.injectLegacyEmoteInput(all: List<Method>) {
    val bind = legacyEmoteInputBinding(all)
    val method = mutableClassDefBy(bind.definingClass).methods.single { it.reference == bind.reference }
    val instructions = method.code()
    val at = instructions.indices.filter { position ->
        (instructions[position] as? com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction)?.reference?.toString() == TOKENIZER
    }.uniqueHook("legacy autocomplete tokenizer call")
    val call = instructions[at]
    require(call.opcode == Opcode.INVOKE_VIRTUAL && call is FiveRegisterInstruction && call.registerCount == 2) {
        "Emotes: legacy autocomplete register layout changed."
    }
    method.replaceInstruction(at, "invoke-static {v${call.registerC}, v${call.registerD}}, " +
        "Ldev/twitchpatches/extension/emotes/EmoteDraftRuntime;->tokenizer(Landroid/widget/MultiAutoCompleteTextView;" +
        "Landroid/widget/MultiAutoCompleteTextView\$Tokenizer;)V")
}
