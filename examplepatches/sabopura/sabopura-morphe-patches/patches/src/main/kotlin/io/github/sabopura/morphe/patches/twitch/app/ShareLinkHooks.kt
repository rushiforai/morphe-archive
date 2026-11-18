package io.github.sabopura.morphe.patches.twitch.app

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import io.github.sabopura.morphe.patches.twitch.support.TWITCH_EXTENSION
import io.github.sabopura.morphe.patches.twitch.support.callRegisters
import io.github.sabopura.morphe.patches.twitch.support.classesWithStrings

private const val APP = "Lio/github/sabopura/morphe/extension/twitch/app/AppHooks;"
private const val PUT_EXTRA = "Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;"
private const val NEW_PLAIN_TEXT =
    "Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;"
private const val SHARE_CONTENT = "Ltv/twitch/android/shared/twitch/share/sheet/pub/TwitchShareableContent;"
private const val RN_CLIPBOARD = "Lcom/facebook/react/modules/clipboard/ClipboardModule;"
private const val EXTRA_TEXT = "android.intent.extra.TEXT"

private fun Method.calls(signature: String) =
    implementation?.instructions?.any { (it as? ReferenceInstruction)?.reference?.toString() == signature } == true

private fun MutableMethod.cleanClipboardText() {
    val index = instructions.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == NEW_PLAIN_TEXT }
    val call = instructions[index] as? FiveRegisterInstruction ?: throw PatchException("Twitch: clipboard call registers changed")
    val text = call.registerD
    addInstructions(index, """
        invoke-static/range {v$text .. v$text}, $APP->cleanClipboard(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;
        move-result-object v$text
    """)
}

internal val cleanShareLinksHook = bytecodePatch {
    extendWith(TWITCH_EXTENSION)
    execute {
        val shares = classesWithStrings(EXTRA_TEXT).flatMap { owner ->
            owner.methods.filter { m ->
                m.calls(PUT_EXTRA) && m.implementation?.instructions?.any {
                    ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == EXTRA_TEXT
                } == true
            }.map { owner to it }
        }
        if (shares.isEmpty()) throw PatchException("Twitch: share intents not found")
        shares.forEach { (owner, found) ->
            mutable(owner, found).apply {
                instructions.toList().forEachIndexed { index, instruction ->
                    if ((instruction as? ReferenceInstruction)?.reference?.toString() != PUT_EXTRA) return@forEachIndexed
                    val args = instruction.callRegisters()
                    val invoke = if (instruction is RegisterRangeInstruction) "invoke-static/range {v${args.first()} .. v${args.last()}}"
                    else "invoke-static {${args.joinToString { "v$it" }}}"
                    replaceInstruction(index, "$invoke, $APP->putShareExtra(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;")
                }
            }
        }

        methodWith("copy share link", "copy_link") {
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/String;", SHARE_CONTENT) && it.calls(NEW_PLAIN_TEXT)
        }.cleanClipboardText()
        methodWith("clipboard copy", "clipboard") {
            it.parameterTypes.map { p -> p.toString() } == listOf("Ljava/lang/CharSequence;") && it.calls(NEW_PLAIN_TEXT)
        }.cleanClipboardText()
        classesWithStrings("clipboard").firstOrNull { it.type == RN_CLIPBOARD }?.let { module ->
            mutableClassDefBy(module).methods.first { it.name == "setString" }.cleanClipboardText()
        }
    }
}
