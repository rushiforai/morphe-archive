package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.insertOpenUrlGate
import org.junit.Assert.*
import org.junit.Test

class UiSettingsHooksTest {
    @Test fun navigationGatePreservesOriginalBranchesAndParameterRegisters() {
        val parameters = listOf("Ljava/lang/String;", "Lcom/facebook/react/bridge/Promise;")
        val method = ImmutableMethod("Lsynthetic/Intent;", "openURL",
            parameters.map { ImmutableMethodParameter(it, null, null) }, "V", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(4)).toMutable()
        method.addInstructionsWithLabels(0, """
            goto :body
            const/4 v0, 0x0
            :body
            return-void
        """)
        val original = method.code()
        val branch = (original.first() as OffsetInstruction).codeOffset
        val bridge = "Lsynthetic/Intent;->ui(Ljava/lang/String;Lcom/facebook/react/bridge/Promise;)Z"
        insertOpenUrlGate(method, bridge)
        val code = method.code()
        val call = code[0] as RegisterRangeInstruction
        assertEquals(2, call.startRegister)
        assertEquals(2, call.registerCount)
        assertEquals(bridge, (call as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(code[2].codeUnits + code[3].codeUnits, (code[2] as OffsetInstruction).codeOffset)
        assertEquals(original.map { it.opcode }, code.drop(4).map { it.opcode })
        assertEquals(branch, (code[4] as OffsetInstruction).codeOffset)
    }

    @Test fun validatesThePlayerScrollContentBeforeInjection() {
        validateUiPlayerLayout(layout("<LinearLayout><TextView android:id='@id/profile_header'/></LinearLayout>"))
        assertThrows(IllegalArgumentException::class.java) { validateUiPlayerLayout(layout("<LinearLayout/>")) }
        assertThrows(IllegalArgumentException::class.java) { validateUiPlayerLayout(layout("<FrameLayout/>")) }
        assertThrows(IllegalArgumentException::class.java) { validateUiPlayerLayout(layout("<LinearLayout/><LinearLayout/>")) }
    }

    @Test fun headerCapabilityRetainsItsReturnRegisterAndRejectsChangedStubs() {
        val method = ImmutableMethod("Lsynthetic/Ui;", "hasLeaderboardButton", emptyList(), "Z",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null, MutableMethodImplementation(2)).toMutable()
        method.addInstructionsWithLabels(0, "const/4 v1, 0x0\nreturn v1")
        for (available in listOf(true, false)) {
            injectUiHeaderCapability(method, available)
            val code = method.code()
            assertEquals(if (available) 1 else 0, (code[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(1, (code[0] as OneRegisterInstruction).registerA)
            assertEquals(1, (code[1] as OneRegisterInstruction).registerA)
            assertEquals(Opcode.RETURN, code[1].opcode)
        }
        method.addInstructionsWithLabels(0, "nop")
        assertThrows(IllegalArgumentException::class.java) { injectUiHeaderCapability(method, true) }
    }

    private fun layout(body: String) = """
        <androidx.core.widget.NestedScrollView xmlns:android="http://schemas.android.com/apk/res/android"
            android:id="@id/options_scrollview">$body</androidx.core.widget.NestedScrollView>
    """
}
