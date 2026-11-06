package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class DeletedMessageHooksTest {
    private val stockBody = """
        const-class v1, Lsynthetic/PlaceholderSpan;
        const-class v1, Lsynthetic/NameSpan;
        invoke-virtual {p1, v1}, Landroid/text/SpannedString;->getSpanEnd(Ljava/lang/Object;)I
        const/4 v0, 0x0
        return-object v0
    """.trimIndent()

    private fun formatter(body: String = stockBody) = ImmutableMethod("Lsynthetic/Formatter;", "format",
        listOf("Ljava/lang/String;", "Landroid/text/SpannedString;", "Landroid/content/Context;", CHAT_DISPATCHER, "Z")
            .map { ImmutableMethodParameter(it, null, null) },
        "Landroid/text/Spanned;", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(11)).toMutable().apply { addInstructionsWithLabels(0, body) }

    @Test fun returnsTheLabelledMessageBeforeTheStockPlaceholder() {
        val code = formatter().also { keepDeletedMessageText(it) }.code()
        assertEquals(Opcode.INVOKE_STATIC, code[2].opcode)
        assertEquals("$DELETED_POLICY->labelDeletedMessage(Landroid/text/SpannedString;Ljava/lang/Class;)Landroid/text/Spanned;",
            (code[2] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[3].opcode)
        assertEquals(Opcode.IF_EQZ, code[4].opcode)
        assertEquals(Opcode.RETURN_OBJECT, code[5].opcode)
        assertEquals((code[3] as OneRegisterInstruction).registerA, (code[5] as OneRegisterInstruction).registerA)
    }

    @Test fun passesTheSpanTwitchUsesForTheSenderName() {
        val code = formatter().also { keepDeletedMessageText(it) }.code()
        assertEquals(Opcode.CONST_CLASS, code[1].opcode)
        assertEquals("Lsynthetic/NameSpan;", (code[1] as ReferenceInstruction).reference.toString())
        assertNotEquals((code[0] as OneRegisterInstruction).registerA, (code[1] as OneRegisterInstruction).registerA)
    }

    @Test fun keepsTheStockPathWhenThePolicyDeclines() {
        val code = formatter().also { keepDeletedMessageText(it) }.code()
        assertEquals(stockBody.lines().size + 6, code.size)
        assertEquals(Opcode.CONST_CLASS, code[6].opcode)
    }

    @Test fun failsClearlyWithoutASenderNameSpan() {
        val failure = assertThrows(IllegalStateException::class.java) {
            keepDeletedMessageText(formatter("const/4 v0, 0x0\nreturn-object v0"))
        }
        assertTrue(failure.message.orEmpty().contains("sender name span"))
    }
}
