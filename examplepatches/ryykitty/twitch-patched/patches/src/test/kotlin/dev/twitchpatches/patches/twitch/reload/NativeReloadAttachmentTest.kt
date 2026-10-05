package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import org.junit.Assert.assertEquals
import org.junit.Test
import dev.twitchpatches.patches.twitch.shared.code
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

class NativeReloadAttachmentTest {
    private val owner = "Lsynthetic/Controller;"
    private val delegate = "Lsynthetic/Delegate;"
    private val field = "$owner->delegate:$delegate"

    @Test fun usesSavedDelegateWhenArgumentBecomesView() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iput-object p1, p0, $field
            iget-object p1, p1, $delegate->view:Landroid/view/View;
            return-void
        """)
        val store = method.code().first() as TwoRegisterInstruction
        assertEquals(4, method.implementation?.registerCount)
        assertEquals(3, store.registerA)
        assertEquals(2, store.registerB)
        assertEquals(field, (store as ReferenceInstruction).reference.toString())
        assertEquals(field, resolveReloadDelegate(method).toString())
        requireReloadParametersPreserved(method, setOf(0))
    }

    @Test(expected = PatchException::class) fun rejectsReusingClobberedArgumentAtReturn() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iput-object p1, p0, $field
            iget-object p1, p1, $delegate->view:Landroid/view/View;
            return-void
        """)
        requireReloadParametersPreserved(method, setOf(0, 1))
    }

    @Test(expected = PatchException::class) fun rejectsWideWriteOverlappingReceiver() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iput-object p1, p0, $field
            const-wide/16 v1, 0x0
            return-void
        """)
        resolveReloadDelegate(method)
    }

    @Test(expected = PatchException::class) fun rejectsConditionalDelegateAssignment() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            if-eqz p1, :done
            iput-object p1, p0, $field
            :done
            return-void
        """)
        resolveReloadDelegate(method)
    }
}
