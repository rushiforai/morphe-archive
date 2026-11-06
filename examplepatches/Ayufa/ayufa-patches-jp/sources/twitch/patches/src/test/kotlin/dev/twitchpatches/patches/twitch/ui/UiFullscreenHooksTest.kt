package dev.twitchpatches.patches.twitch.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import dev.twitchpatches.patches.twitch.shared.code
import org.junit.Assert.*
import org.junit.Test

class UiFullscreenHooksTest {
    @Test fun filtersBothBranchesAndPreservesQueriesRegistersAndLabels() {
        val method = fixture()
        val before = method.code()
        val implementation = requireNotNull(method.implementation)
        val labels = listOf(5, 9).map { implementation.newLabelForIndex(it) }
        injectUiInsetFilter(method)
        val code = method.code()
        assertEquals(5, implementation.registerCount)
        assertEquals(listOf(5, 11), labels.map { it.location.index })
        listOf(5, 11).forEach { index ->
            val call = code[index] as FiveRegisterInstruction
            assertEquals(3, call.registerC)
            assertEquals(2, call.registerD)
            assertEquals("$UI_SETTINGS->filterWindowInsetTypes(Landroid/view/View;I)I",
                (call as ReferenceInstruction).reference.toString())
            assertEquals(Opcode.MOVE_RESULT, code[index + 1].opcode)
            assertEquals(2, (code[index + 1] as OneRegisterInstruction).registerA)
        }
        assertEquals(before.map { it.opcode }, code.filterIndexed { index, _ -> index !in setOf(5, 6, 11, 12) }.map { it.opcode })
    }

    @Test fun rejectsChangedQueriesAndClobberedViewArguments() {
        assertThrows(IllegalArgumentException::class.java) { resolveUiInsetHooks(fixture(queryMask = "v0")) }
        assertThrows(IllegalArgumentException::class.java) { resolveUiInsetHooks(fixture(mask = "p1")) }
    }

    private fun fixture(mask: String = "p0", queryMask: String = "p0") =
        ImmutableMethod("Lfixture/Listener;", "onApplyWindowInsets",
            listOf("Landroid/view/View;", "Lfixture/Insets;").map { ImmutableMethodParameter(it, null, null) },
            "Lfixture/Insets;", AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(5)).toMutable().apply {
            addInstructionsWithLabels(0, """
                invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;
                iget-object p2, p2, Lfixture/Insets;->impl:Lfixture/InsetsImpl;
                iget-boolean p0, p0, Lfixture/Listener;->cutout:Z
                if-eqz p0, :withoutCutout
                const/16 $mask, 0x28f
                invoke-virtual {p2, $queryMask}, Lfixture/InsetsImpl;->insets(I)Lfixture/Edges;
                move-result-object p0
                goto :padding
                :withoutCutout
                const/16 $mask, 0x20f
                invoke-virtual {p2, $queryMask}, Lfixture/InsetsImpl;->insets(I)Lfixture/Edges;
                move-result-object p0
                :padding
                iget v0, p0, Lfixture/Edges;->left:I
                iget v1, p0, Lfixture/Edges;->top:I
                invoke-virtual {p1, v0, v1, v0, v1}, Landroid/view/View;->setPadding(IIII)V
                sget-object p0, Lfixture/Insets;->consumed:Lfixture/Insets;
                return-object p0
            """)
        }
}
