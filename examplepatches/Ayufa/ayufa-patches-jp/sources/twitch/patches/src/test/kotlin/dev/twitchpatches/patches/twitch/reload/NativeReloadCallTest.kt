package dev.twitchpatches.patches.twitch.reload

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.assertEquals
import org.junit.Test

class NativeReloadCallTest {
    private val original = "Lsynthetic/Controls;->volume(ZLsynthetic/Click;Lsynthetic/Composer;I)V"
    private val wrapper = "Lsynthetic/Reload;->controls(ZLsynthetic/Click;Lsynthetic/Composer;I)V"

    @Test fun preservesNoncontiguousArgumentsAndIncomingBranch() {
        val method = nativeReloadMethod("Lsynthetic/Controls;", "row", emptyList(), "V", 16, """
            goto :volume
            :volume
            invoke-static {v15, v4, v12, v0}, $original
            return-void
        """, true)
        val branchBefore = (method.code()[0] as OffsetInstruction).codeOffset
        method.replaceNativeVolume(1, original, wrapper)
        val invoke = method.code()[1] as FiveRegisterInstruction
        assertEquals(listOf(15, 4, 12, 0), listOf(invoke.registerC, invoke.registerD, invoke.registerE, invoke.registerF))
        assertEquals(wrapper, (invoke as ReferenceInstruction).reference.toString())
        assertEquals(branchBefore, (method.code()[0] as OffsetInstruction).codeOffset)
    }

    @Test(expected = PatchException::class) fun rejectsInstanceCallWithExtraReceiver() {
        val method = nativeReloadMethod("Lsynthetic/Controls;", "row", emptyList(), "V", 5, """
            invoke-virtual {v0, v1, v2, v3, v4}, $original
            return-void
        """, true)
        method.replaceNativeVolume(0, original, wrapper)
    }

    @Test(expected = PatchException::class) fun rejectsChangedArgumentWidth() {
        val changed = "Lsynthetic/Controls;->volume(JLsynthetic/Click;I)V"
        val method = nativeReloadMethod("Lsynthetic/Controls;", "row", emptyList(), "V", 4, """
            invoke-static {v0, v1, v2, v3}, $changed
            return-void
        """, true)
        method.replaceNativeVolume(0, changed, wrapper)
    }
}
