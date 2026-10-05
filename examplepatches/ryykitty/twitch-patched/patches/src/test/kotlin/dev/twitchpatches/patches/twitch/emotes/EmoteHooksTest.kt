package dev.twitchpatches.patches.twitch.emotes

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class EmoteHooksTest {
    private fun binder(body: String) = ImmutableMethod("Lsynthetic/Holder;", "bind",
        listOf(ImmutableMethodParameter("Lsynthetic/Model;", null, null), ImmutableMethodParameter("Z", null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(8)).toMutable().apply { addInstructionsWithLabels(0, body) }

    @Test fun derivesReceiverThroughImmutableHolderAliasWithoutScratchRegisters() {
        val method = binder("""
            move-object v0, p0
            iget-object v1, v0, Lsynthetic/Base;->text:Landroid/widget/TextView;
            const/4 v2, 0x0
            const/4 v3, 0x0
            invoke-virtual {v1, v2, v3}, $TEXT_SETTER
            return-void
        """)
        assertEquals("text", textViewField(method, 4).name)
    }

    @Test fun rejectsOverwrittenParametersAndForeignReceiver() {
        for (prefix in listOf("move-object p1, p0", "move-object v0, p1")) {
            val method = binder("""
                move-object v0, p0
                $prefix
                iget-object v1, v0, Lsynthetic/Base;->text:Landroid/widget/TextView;
                invoke-virtual {v1, v2, v3}, $TEXT_SETTER
                return-void
            """)
            assertThrows(PatchException::class.java) { textViewField(method, 3) }
        }
    }

    @Test fun rejectsSetterReceiverChangedAfterFieldRead() {
        val method = binder("""
            iget-object v1, p0, Lsynthetic/Base;->text:Landroid/widget/TextView;
            const/4 v1, 0x0
            invoke-virtual {v1, v2, v3}, $TEXT_SETTER
            return-void
        """)
        assertThrows(PatchException::class.java) { textViewField(method, 2) }
    }

    @Test fun derivesSourceFieldFromItsLabelAndRejectsAmbiguity() {
        val method = binder("""
            const-string v0, ", sourceChannelId="
            iget-object v1, p0, Lsynthetic/Holder;->source:Ljava/lang/String;
            const-string v0, ", next="
            return-void
        """)
        assertEquals("source", sourceChannelField(method).name)
        val ambiguous = binder("""
            const-string v0, ", sourceChannelId="
            iget-object v1, p0, Lsynthetic/Holder;->source:Ljava/lang/String;
            iget-object v1, p0, Lsynthetic/Holder;->other:Ljava/lang/String;
            return-void
        """)
        assertThrows(PatchException::class.java) { sourceChannelField(ambiguous) }
    }
}
