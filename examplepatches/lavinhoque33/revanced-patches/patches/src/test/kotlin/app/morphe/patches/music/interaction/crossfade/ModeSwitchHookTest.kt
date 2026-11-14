/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-13.
 */
package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.*
import org.junit.Test

class ModeSwitchHookTest {
    private fun method(body: String): MutableMethod = ImmutableMethod(
        "LToggleTest;", "toggle", listOf(ImmutableMethodParameter("Z", null, null)), "V",
        AccessFlags.PUBLIC.value, null, null, MutableMethodImplementation(3)
    ).toMutable().apply { addInstructions(0, body) }.let {
        // Rebind assembler labels through the same immutable-to-mutable boundary as a native DEX method.
        ImmutableMethod.of(it).toMutable()
    }

    @Test
    fun nativeBranchToSharedReturnCannotBypassCompletion() {
        val native = method(
            """
                if-eqz p1, :done
                const/4 p0, 0x1
                :done
                return-void
            """
        ).apply { installModeSwitchHooks() }
        val code = native.implementation!!.instructions
        val branchIndex = code.indexOfFirst { it.opcode == Opcode.IF_EQZ }
        val target = code.take(branchIndex).sumOf { it.codeUnits } +
            (code[branchIndex] as OffsetInstruction).codeOffset
        var address = 0
        val targetInstruction = code.first {
            val matches = address == target
            address += it.codeUnits
            matches
        }
        val completion = targetInstruction.getReference<MethodReference>()!!
        assertEquals("onVideoToggleFinished", completion.name)
        assertTrue(completion.parameterTypes.isEmpty())
    }

    @Test
    fun everyReturnRunsCompletionWithoutReadingReusedParameters() {
        val native = method(
            """
                if-eqz p1, :other
                return-void
                :other
                const/4 p0, 0x1
                return-void
            """
        ).apply { installModeSwitchHooks() }
        val code = native.implementation!!.instructions
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
        assertEquals(2, returns.size)
        returns.forEach { index ->
            val completion = code[index - 1].getReference<MethodReference>()!!
            assertEquals("onVideoToggleFinished", completion.name)
            assertTrue(completion.parameterTypes.isEmpty())
        }
    }
}
