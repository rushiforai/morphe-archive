package com.openbubbles.wear.patches

import app.morphe.patcher.patch.PatchException
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction35c
import com.android.tools.smali.dexlib2.builder.instruction.BuilderInstruction3rc
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith

class SettingsMenuTest {
    private val original = ImmutableMethodReference(ACCOUNT_SECTION, "AccountStatusSection",
        listOf("Landroidx/compose/runtime/Composer;", "I"), "V")

    @Test fun `preserves the composer and flags registers`() {
        val call = settingsMenuCall(BuilderInstruction35c(Opcode.INVOKE_STATIC, 2, 7, 9, 0, 0, 0, original)) as BuilderInstruction35c
        assertEquals(7, call.registerC)
        assertEquals(9, call.registerD)
        assertEquals("Lcom/openbubbles/wear/patch/PatchSettings;->accountStatusAndPatches(Landroidx/compose/runtime/Composer;I)V", call.reference.toString())
    }

    @Test fun `supports high register range calls without allocating registers`() {
        val call = settingsMenuCall(BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 30, 2, original)) as BuilderInstruction3rc
        assertEquals(30, call.startRegister)
        assertEquals(2, call.registerCount)
    }

    @Test fun `rejects unexpected invocation types and argument counts`() {
        assertFailsWith<PatchException> { settingsMenuCall(BuilderInstruction35c(Opcode.INVOKE_VIRTUAL, 2, 0, 1, 0, 0, 0, original)) }
        assertFailsWith<PatchException> { settingsMenuCall(BuilderInstruction3rc(Opcode.INVOKE_STATIC_RANGE, 0, 3, original)) }
    }
}
