/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-17.
 */
package app.morphe.patches.youtube.utils.navigation

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.util.getReference
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.MutableMethodImplementation
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotEquals
import org.junit.Test

class NavigationIconMapTest {
    private val enumField = "LImage;->NOTIFICATIONS:LImage;"
    private val callback = "LExtension;->withIcon"

    private fun method(body: String) = ImmutableMethod(
        "LIcons;", "<clinit>", emptyList(), "V", AccessFlags.STATIC.value,
        null, null, MutableMethodImplementation(3)
    ).toMutable().apply { addInstructions(0, body) }.let { ImmutableMethod.of(it).toMutable() }

    @Test
    fun replacesCompletedMapInItsOwnRegisterBeforePublication() {
        val native = method("""
            invoke-static {}, LPairs;->toMap()Ljava/util/Map;
            move-result-object v1
            sput-object v1, LIcons;->icons:Ljava/util/Map;
            return-void
        """).apply { hookNavigationIconMapStore(2, enumField, callback) }
        val code = native.implementation!!.instructions
        val invokeIndex = code.indexOfFirst { it.getReference<MethodReference>()?.name == "withIcon" }
        val invoke = code[invokeIndex] as FiveRegisterInstruction
        val result = code[invokeIndex + 1] as OneRegisterInstruction
        val store = code[invokeIndex + 2] as OneRegisterInstruction

        assertEquals(1, invoke.registerC)
        assertNotEquals(invoke.registerC, invoke.registerD)
        assertEquals(invoke.registerC, result.registerA)
        assertEquals(result.registerA, store.registerA)
        assertEquals(Opcode.SPUT_OBJECT, code[invokeIndex + 2].opcode)
        assertEquals(1, code.count { it.getReference<MethodReference>()?.name == "withIcon" })
    }

    @Test
    fun branchToPublicationCannotBypassTheReplacement() {
        val native = method("""
            invoke-static {}, LPairs;->toMap()Ljava/util/Map;
            move-result-object v1
            if-eqz v0, :publish
            nop
            :publish
            sput-object v1, LIcons;->icons:Ljava/util/Map;
            return-void
        """).apply { hookNavigationIconMapStore(4, enumField, callback) }
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

        assertEquals(Opcode.SGET_OBJECT, targetInstruction.opcode)
    }
}
