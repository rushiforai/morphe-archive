/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-16.
 */
package app.morphe.patches.shared.gms

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

class PrimesConfigurationCheckTest {
    private fun check(body: String, branch: Opcode) {
        val method = ImmutableMethod(
            "LPrimes;", "initialize", emptyList(), "V", AccessFlags.PUBLIC.value,
            null, null, MutableMethodImplementation(3)
        ).toMutable().apply { addInstructions(0, body) }
            .let { ImmutableMethod.of(it).toMutable() }
        val originalSize = method.implementation!!.instructions.size

        method.disablePrimesConfigurationCheck()

        val code = method.implementation!!.instructions
        val branchIndex = code.indexOfLast { it.opcode == branch }
        val constant = code[branchIndex - 1]
        assertEquals(originalSize + 1, code.size)
        assertEquals(Opcode.CONST_4, constant.opcode)
        assertEquals(1, (constant as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(2, (constant as OneRegisterInstruction).registerA)
        assertEquals(2, (code[branchIndex] as OneRegisterInstruction).registerA)

        val branchAddress = code.take(branchIndex).sumOf { it.codeUnits }
        val targetAddress = branchAddress + (code[branchIndex] as OffsetInstruction).codeOffset
        var address = 0
        val target = code.first {
            val matches = address == targetAddress
            address += it.codeUnits
            matches
        }
        if (branch == Opcode.IF_EQZ) {
            assertEquals(Opcode.NEW_INSTANCE, target.opcode)
            assertTrue(code[branchIndex + 1].opcode != Opcode.NEW_INSTANCE)
        } else {
            assertEquals(Opcode.RETURN_VOID, target.opcode)
            assertEquals(Opcode.NEW_INSTANCE, code[branchIndex + 1].opcode)
        }
    }

    @Test fun legacyBackgroundCheckKeepsTrueFallthrough() {
        check("""
            if-nez v0, :done
            invoke-static {}, LConfiguration;->allowInitialization()Z
            move-result v2
            if-eqz v2, :fail
            goto :done
            :fail
            new-instance v1, Ljava/lang/IllegalStateException;
            invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V
            throw v1
            :done
            return-void
        """, Opcode.IF_EQZ)
    }

    @Test fun experimentalBackgroundCheckAcceptsInvertedBranch() {
        check("""
            if-nez v0, :done
            invoke-static {}, LConfiguration;->allowInitialization()Z
            move-result v2
            if-nez v2, :done
            new-instance v1, Ljava/lang/IllegalStateException;
            invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V
            throw v1
            :done
            return-void
        """, Opcode.IF_NEZ)
    }

    @Test fun lifecycleCheckStillUpdatesInitializedState() {
        check("""
            if-nez v0, :done
            invoke-static {}, LConfiguration;->allowInitialization()Z
            move-result v2
            if-eqz v2, :fail
            invoke-static {}, LConfiguration;->markInitialized()V
            goto :done
            :fail
            new-instance v1, Ljava/lang/IllegalStateException;
            invoke-direct {v1}, Ljava/lang/IllegalStateException;-><init>()V
            throw v1
            :done
            return-void
        """, Opcode.IF_EQZ)
    }
}
