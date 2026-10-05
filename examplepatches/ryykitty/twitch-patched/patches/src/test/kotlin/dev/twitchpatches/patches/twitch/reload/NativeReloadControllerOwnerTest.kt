package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Test

class NativeReloadControllerOwnerTest {
    private val owner = "Lsynthetic/Wrapper;"
    private val controller = "Lsynthetic/Controller;"
    private val delegate = "Lsynthetic/Delegate;"
    private val field = ImmutableFieldReference(owner, "controller", controller)
    private val attach = "$controller->attach($delegate)V"

    @Test fun acceptsForwardingBeforeArgumentRegisterIsReused() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iget-object v0, p0, $field
            invoke-virtual {v0, p1}, $attach
            const/4 p1, 0x0
            return-void
        """)
        requireReloadControllerForwarding(method, field, attach)
    }

    @Test(expected = PatchException::class) fun rejectsControllerRegisterReplacement() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iget-object v0, p0, $field
            const/4 v0, 0x0
            invoke-virtual {v0, p1}, $attach
            return-void
        """)
        requireReloadControllerForwarding(method, field, attach)
    }

    @Test(expected = PatchException::class) fun rejectsDifferentInvocationReceiver() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iget-object v0, p0, $field
            invoke-virtual {v1, p1}, $attach
            return-void
        """)
        requireReloadControllerForwarding(method, field, attach)
    }

    @Test(expected = PatchException::class) fun rejectsConditionalForwarding() {
        val method = nativeReloadMethod(owner, "attach", listOf(delegate), "V", 4, """
            iget-object v0, p0, $field
            if-eqz v0, :done
            invoke-virtual {v0, p1}, $attach
            :done
            return-void
        """)
        requireReloadControllerForwarding(method, field, attach)
    }
}
