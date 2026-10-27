package dev.twitchpatches.patches.twitch.chat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class DeletedMessageHooksTest {
    private val span = "Lsynthetic/DeletedSpan;"
    private val original = ImmutableFieldReference(span, "original", "Landroid/text/SpannedString;")
    private val access = ImmutableFieldReference(span, "access", "Z")
    private val source = """
        const-class v1, $span
        const/4 v2, 0x0
        const/4 v0, 0x0
        invoke-virtual {p1, v2, v0, v1}, Landroid/text/SpannedString;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;
        move-result-object v0
        check-cast v0, [$span
        invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
        array-length v0, v0
        if-nez v0, :existing
        new-instance v0, $span
        invoke-direct {v0, p0, p1, p4, p3}, $span-><init>(Ljava/lang/String;Landroid/text/SpannedString;Z$CHAT_DISPATCHER)V
        iget-boolean v1, v0, $access
        :existing
        return-object p1
    """.trimIndent()

    private fun formatter(body: String = source) = ImmutableMethod("Lsynthetic/Formatter;", "format",
        listOf("Ljava/lang/String;", "Landroid/text/SpannedString;", "Landroid/content/Context;", CHAT_DISPATCHER, "Z")
            .map { ImmutableMethodParameter(it, null, null) },
        "Landroid/text/Spanned;", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        MutableMethodImplementation(11)).toMutable().apply { addInstructionsWithLabels(0, body) }

    @Test fun restoresPlaceholderTextWithoutWritingNativePermissions() {
        val method = formatter()
        restoreDeletedMessageFormatter(method, original)
        enableDeletedMessageAccess(method, access, 1)
        assertTrue(method.code().any { it.opcode == Opcode.IGET_OBJECT && (it as ReferenceInstruction).reference == original })
        assertFalse(method.code().any { it.opcode == Opcode.IPUT_BOOLEAN })
        assertFalse(method.code().any { it is OneRegisterInstruction && it.registerA == 10 && it.opcode.setsRegister() })
        assertEquals(2, method.code().count { (it as? ReferenceInstruction)?.reference.toString() == "$DELETED_POLICY->enabled()Z" })
    }

    @Test fun allocatesScratchWithoutClobberingALiveClassReference() {
        val method = formatter(source.replace(":existing\n", ":existing\ninvoke-static {v1}, Lsynthetic/Use;->type(Ljava/lang/Class;)V\n"))
        restoreDeletedMessageFormatter(method, original)
        val result = method.code().first { it.opcode == Opcode.MOVE_RESULT }
        assertNotEquals(1, (result as OneRegisterInstruction).registerA)
    }

    @Test(expected = PatchException::class) fun rejectsAnUnrelatedSpanArray() {
        restoreDeletedMessageFormatter(formatter(source.replace("check-cast v0, [$span", "check-cast v0, [Ljava/lang/Object;")), original)
    }

    @Test(expected = PatchException::class) fun rejectsADifferentSpanClass() {
        restoreDeletedMessageFormatter(formatter(source.replace("const-class v1, $span", "const-class v1, Lsynthetic/Other;")), original)
    }

    @Test(expected = PatchException::class) fun rejectsMissingAccessReads() {
        enableDeletedMessageAccess(formatter(source.replace("iget-boolean v1, v0, $access", "const/4 v1, 0x0")), access, 1)
    }
}
