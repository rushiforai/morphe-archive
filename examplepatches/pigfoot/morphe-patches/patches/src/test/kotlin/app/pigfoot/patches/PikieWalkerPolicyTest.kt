package app.pigfoot.patches

import app.pigfoot.patches.pikiewalker.*
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.*
import org.junit.Test

class PikieWalkerPolicyTest {
    private fun entry(registers: Int = 13, name: String = "showAd") = MutableMethod(ImmutableMethod(
        PIKIE_OWNER, name, listOf("Landroid/app/Activity;", "Lkotlin/jvm/functions/Function1;")
            .map { ImmutableMethodParameter(it, emptySet(), null) }, "V", 17, emptySet(), emptySet(),
        ImmutableMethodImplementation(registers, listOf(ImmutableInstruction10x(Opcode.RETURN_VOID)), emptyList(), emptyList())))

    @Test fun exactTargetAndNearbyUnsupportedInputs() {
        requirePikieTarget(PIKIE_PACKAGE, "2.0.4", "42")
        for ((p,v,c) in listOf(Triple("other", "2.0.4", "42"), Triple(PIKIE_PACKAGE,"2.0.3","42"),
            Triple(PIKIE_PACKAGE,"2.0.4","43"), Triple(null,"2.0.4","42"))) {
            assertThrows(IllegalArgumentException::class.java) { requirePikieTarget(p,v,c) }
        }
    }

    @Test fun emittedControlFlowCallsOriginalCallbackOnceAndReturnsBeforeOriginalBody() {
        val method = entry()
        skipPikieRewardPlayback(method)
        val code = method.implementation!!.instructions.toList()
        val registers = mutableMapOf<Int, Any>(12 to "callback")
        var calls = 0
        var returnedAt = -1
        for ((pc,i) in code.withIndex()) {
            when (i.opcode) {
                Opcode.SGET_OBJECT -> {
                    val f = (i as ReferenceInstruction).reference as FieldReference
                    assertEquals(PIKIE_RESULT, f.definingClass); assertEquals("SUCCESS", f.name)
                    registers[(i as OneRegisterInstruction).registerA] = "SUCCESS"
                }
                Opcode.INVOKE_INTERFACE -> {
                    val r = i as FiveRegisterInstruction
                    val target = (i as ReferenceInstruction).reference as MethodReference
                    assertEquals("Lkotlin/jvm/functions/Function1;", target.definingClass)
                    assertEquals("invoke", target.name)
                    assertEquals("callback", registers[r.registerC]); assertEquals("SUCCESS", registers[r.registerD])
                    calls++
                }
                Opcode.RETURN_VOID -> { returnedAt = pc; break }
                else -> fail("Unexpected reachable opcode ${i.opcode}")
            }
        }
        assertEquals(1, calls); assertEquals(2, returnedAt)
        assertEquals(4, code.size) // Original body retained, but unreachable.
        assertTrue(method.implementation!!.tryBlocks.isEmpty()) // No exception-driven replay.
    }

    @Test fun wrongLayoutAndUnrelatedMethodsFailBeforeMutation() {
        for (method in listOf(entry(12), entry(name = "loadAd"))) {
            val before = method.implementation!!.instructions.toList()
            assertThrows(IllegalArgumentException::class.java) { skipPikieRewardPlayback(method) }
            assertEquals(before, method.implementation!!.instructions.toList())
        }
    }
}
