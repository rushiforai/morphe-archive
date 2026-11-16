/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-14.
 */
package app.morphe.patches.music.interaction.crossfade

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.*
import org.junit.Test

class MiniplayerDismissalHookTest {
    private fun method(body: String) = ImmutableMethod(
        "LWatchWhileListener;", "dismissed", emptyList(), "V", AccessFlags.PUBLIC.value,
        null, null, MutableMethodImplementation(2)
    ).toMutable().apply { addInstructions(0, body) }.let { ImmutableMethod.of(it).toMutable() }

    @Test fun cleanupRunsAfterNativeResetAndBeforeEveryReturn() {
        val native = method("""
            invoke-static {}, LPlayback;->reset()V
            if-eqz v0, :done
            invoke-static {}, LPlayback;->clearNotification()V
            return-void
            :done
            return-void
        """).apply { installMiniplayerDismissalHook() }
        val code = native.implementation!!.instructions

        assertEquals("reset", code.first().getReference<MethodReference>()!!.name)
        val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_VOID }
        assertEquals(2, returns.size)
        returns.forEach { index ->
            val cleanup = code[index - 1].getReference<MethodReference>()!!
            assertEquals("onQueueDismissed", cleanup.name)
            assertTrue(cleanup.parameterTypes.isEmpty())
        }
    }

    @Test fun nativeBranchToReturnCannotBypassCleanup() {
        val native = method("""
            if-eqz v0, :done
            invoke-static {}, LPlayback;->reset()V
            :done
            return-void
        """).apply { installMiniplayerDismissalHook() }
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

        assertEquals("onQueueDismissed", targetInstruction.getReference<MethodReference>()!!.name)
    }
}
