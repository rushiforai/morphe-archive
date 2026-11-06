package dev.twitchpatches.patches.twitch.ui

import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import dev.twitchpatches.patches.twitch.reload.nativeReloadMethod
import dev.twitchpatches.patches.twitch.shared.code
import dev.twitchpatches.patches.twitch.shared.reference
import org.junit.Assert.*
import org.junit.Test

class UiCompositionHooksTest {
    private val composer = "Lfixture/Composer;"
    private val original = nativeReloadMethod("Lfixture/Controls;", "share", listOf("Lfixture/Callback;", composer, "I"),
        "V", 3, "return-void", static = true)
    private val start = ImmutableMethodReference("Lfixture/Concrete;", "start", listOf("I"), "V")
    private val end = ImmutableMethodReference("Lfixture/Concrete;", "end", emptyList<String>(), "V")
    private val field = ImmutableFieldReference("Lfixture/Model;", "subscribe", "Lfixture/Model;")
    private val classicRow = UiClassicActionContract(original, field, field, start, start)
    private val contract = UiCompositionContract(composer, "Lfixture/Concrete;", start, end, start, end, start,
        original, original, original, emptyMap(), original, field, field, original, emptyList(), emptyMap(), classicRow)

    @Test fun hidingAndRenderingBothCloseTheCompositionGroupAndForwardOriginalArguments() {
        val wrapper = uiWrapper(original, "share", contract, "const/4 v1, 0x0\nif-nez v1, :done")
        val code = wrapper.code()
        val groupCalls = code.filter { (it as? ReferenceInstruction)?.reference?.toString() in setOf(start.toString(), end.toString()) }
        assertEquals(listOf(start.toString(), end.toString()), groupCalls.map { (it as ReferenceInstruction).reference.toString() })
        val invoke = code.single { (it as? ReferenceInstruction)?.reference?.toString() == original.reference } as RegisterRangeInstruction
        assertEquals(3, invoke.startRegister)
        assertEquals(3, invoke.registerCount)
        val branchIndex = code.indexOfFirst { it.opcode == Opcode.IF_NEZ }
        val offset = (code[branchIndex] as OffsetInstruction).codeOffset
        val target = code.drop(branchIndex).runningFold(0) { sum, instruction -> sum + instruction.codeUnits }.indexOf(offset)
        assertEquals(end.toString(), (code[branchIndex + target] as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.RETURN_VOID, code.last().opcode)
    }

    @Test fun rejectsWideArgumentsBeforeGeneratingIncorrectParameterRegisters() {
        val wide = nativeReloadMethod("Lfixture/Controls;", "wide", listOf("J", composer), "V", 3, "return-void", static = true)
        assertThrows(IllegalArgumentException::class.java) { uiWrapper(wide, "wide", contract, "") }
    }

    @Test fun onlyMaterializesMatchingMethodsAndPreservesBothInvocationFormats() {
        val unrelated = (0 until 1000).map {
            ImmutableMethod.of(nativeReloadMethod("Lfixture/Unrelated$it;", "unused", emptyList(), "V", 0,
                "return-void", static = true))
        }
        val caller = ImmutableMethod.of(nativeReloadMethod("Lfixture/Caller;", "render", emptyList(), "V", 3, """
            const/4 v0, 0x0
            const/4 v1, 0x0
            const/4 v2, 0x0
            invoke-static {v0, v1, v2}, ${original.reference}
            invoke-static/range {v0 .. v2}, ${original.reference}
            return-void
        """, static = true))
        val replacement = ImmutableMethodReference("Lfixture/Bridge;", "share", original.parameterTypes, "V")
        val materialized = mutableListOf<String>()
        val mutable = caller.toMutable()
        rewriteUiCalls(unrelated + caller, original.reference, replacement) {
            materialized.add(it.definingClass)
            mutable
        }
        assertEquals(listOf(caller.definingClass), materialized)
        assertEquals(caller.code().map { it.opcode }, mutable.code().map { it.opcode })
        val calls = mutable.code().filter { (it as? ReferenceInstruction)?.reference == replacement }
        assertEquals(2, calls.size)
        val compact = calls[0] as FiveRegisterInstruction
        assertEquals(listOf(3, 0, 1, 2), listOf(compact.registerCount, compact.registerC, compact.registerD, compact.registerE))
        val range = calls[1] as RegisterRangeInstruction
        assertEquals(0, range.startRegister)
        assertEquals(3, range.registerCount)
        assertEquals(original.reference, (caller.code()[3] as ReferenceInstruction).reference.toString())
    }

    @Test(expected = IllegalArgumentException::class) fun wrapperCannotBecomeItsOwnCaller() {
        val wrapper = ImmutableMethod.of(nativeReloadMethod("Lfixture/Bridge;", "share", emptyList(), "V", 0,
            "return-void", static = true))
        rewriteUiCalls(listOf(wrapper), "Lfixture/Original;->share()V", wrapper) { wrapper.toMutable() }
    }
}
