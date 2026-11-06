package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class UiFullscreenStateHooksTest {
    @Test fun preservesReceiverWhenHostReusesItsParameterRegister() {
        val original = ImmutableMethod("Lsynthetic/Controller;", "hide", emptyList(), "V",
            AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(2)).toMutable().apply {
            addInstructionsWithLabels(0, "const/4 p0, 0x0\nreturn-void")
        }
        val before = original.code().toList()
        val wrapper = wrapSystemBarOperation(original,
            ImmutableFieldReference(original.definingClass, "activity", "Landroid/app/Activity;"), true)
        assertEquals("hide", wrapper.name)
        assertEquals("twitchPatchesHideBarsOriginal", original.name)
        assertEquals(before, original.code().toList())
        val calls = wrapper.code().mapNotNull { (it as? ReferenceInstruction)?.reference as? MethodReference }
        assertEquals(listOf(original.name, "hostSystemBars"), calls.map { it.name })
        assertEquals(3, requireNotNull(wrapper.implementation).registerCount)
    }

    private fun model(body: String) = ImmutableMethod("Lsynthetic/State;", "toString", emptyList(),
        "Ljava/lang/String;", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(5))
        .toMutable().apply { addInstructionsWithLabels(0, body) }

    @Test fun resolvesPrimitiveAndObjectFieldsBesideTheirLabels() {
        val method = model("""
            const-string v0, "TheatreViewState(isPortrait="
            iget-boolean v1, p0, Lsynthetic/State;->portrait:Z
            iget-boolean v2, p0, Lsynthetic/State;->keyboard:Z
            const-string v0, ", playerMode="
            iget-object v1, p0, Lsynthetic/State;->mode:Lsynthetic/Mode;
            return-object v0
        """)
        assertEquals("portrait", fieldAfterLabel(method, "TheatreViewState(isPortrait=", "Z").name)
        assertEquals("mode", fieldAfterLabel(method, ", playerMode=", null).name)
        assertThrows(IllegalArgumentException::class.java) { fieldAfterLabel(method, ", playerMode=", "Z") }
    }

    @Test fun rejectsAFieldFromAnotherOwner() {
        val method = model("""
            const-string v0, "TheatreViewState(isPortrait="
            iget-boolean v1, p0, Lsynthetic/Other;->portrait:Z
            return-object v0
        """)
        assertThrows(IllegalArgumentException::class.java) { fieldAfterLabel(method, "TheatreViewState(isPortrait=", "Z") }
    }
}
