package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.util.getFreeRegisterProvider
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import dev.twitchpatches.patches.twitch.shared.code

internal fun keepDeletedMessageText(formatter: MutableMethod) {
    val nameSpan = resolveSenderNameSpan(formatter)
    val registers = formatter.getFreeRegisterProvider(0, 2)
    val message = registers.getFreeRegister4Bit()
    val nameSpanClass = registers.getFreeRegister4Bit()
    formatter.addInstructionsWithLabels(0, """
        move-object/from16 v$message, p1
        const-class v$nameSpanClass, $nameSpan
        invoke-static {v$message, v$nameSpanClass}, $DELETED_POLICY->labelDeletedMessage(Landroid/text/SpannedString;Ljava/lang/Class;)Landroid/text/Spanned;
        move-result-object v$message
        if-eqz v$message, :stock_placeholder
        return-object v$message
    """, ExternalLabel("stock_placeholder", formatter.getInstruction(0)))
}

private fun resolveSenderNameSpan(formatter: MutableMethod): String {
    val code = formatter.code()
    val nameEnd = code.indexOfFirst {
        (it as? ReferenceInstruction)?.reference.toString().endsWith("->getSpanEnd(Ljava/lang/Object;)I")
    }
    val nameSpan = code.take(maxOf(nameEnd, 0)).lastOrNull { it.opcode == Opcode.CONST_CLASS } as? ReferenceInstruction
    return checkNotNull(nameSpan) { "Deleted message formatter no longer locates the sender name span" }.reference.toString()
}
