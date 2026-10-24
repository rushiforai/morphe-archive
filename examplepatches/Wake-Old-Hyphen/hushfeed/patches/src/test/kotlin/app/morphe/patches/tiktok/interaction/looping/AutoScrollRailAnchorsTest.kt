/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.tiktok.interaction.looping

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

private const val COLUMN = "Lcom/ss/android/ugc/feed/platform/cell/interact/right/InteractRightAreaComponent;"
private const val EXTENSION = "Lapp/morphe/extension/tiktok/interaction/AutoAdvance;"

/**
 * #234: on tablets and unfolded foldables the video's right-hand column adds TikTok's Auto scroll
 * switch above or below the avatar once the feed gate says yes. Held to each declared build: one
 * feed gate, a column that reads it, and the hide answer taking each read's result right after it.
 */
class AutoScrollRailAnchorsTest {
    @Test
    fun `each build's right column reads the feed gate and every read gets the hide answer`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val gates = mutableListOf<Method>()
            var column: Method? = null
            val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
            for (entry in container.dexEntryNames) {
                for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                    for (method in classDef.methods) {
                        if (Availability.takes(method, classDef)) gates += method
                    }
                    if (classDef.type == COLUMN) {
                        column = classDef.methods.single {
                            it.name == "onViewCreated" &&
                                it.parameterTypes.map(CharSequence::toString) == listOf("Landroid/view/View;")
                        }
                    }
                }
            }
            assertEquals("$version: feed gates ${gates.map { "${it.definingClass}->${it.name}" }}", 1, gates.size)
            val gate = gates.single()
            val native = column
            assertNotNull("$version: the right column is gone", native)

            val before = native!!.implementation!!.instructions.toList()
            val patched = MutableMethod(native)
            val hooked = patched.answerRailGate(gate)
            val after = patched.implementation!!.instructions.toList()
            assertTrue("$version: no feed gate read hooked", hooked >= 1)
            assertEquals("$version: two instructions per read", before.size + 2 * hooked, after.size)

            var seen = 0
            after.forEachIndexed { index, instruction ->
                val target = instruction.getReference<MethodReference>()
                if (instruction.opcode != Opcode.INVOKE_STATIC || target?.definingClass != gate.definingClass ||
                    target.name != gate.name
                ) return@forEachIndexed
                val result = after[index + 1]
                assertEquals("$version: the gate's result at $index", Opcode.MOVE_RESULT, result.opcode)
                val register = (result as OneRegisterInstruction).registerA
                val call = after[index + 2]
                assertEquals("$version: the hide answer follows the read at $index", Opcode.INVOKE_STATIC_RANGE, call.opcode)
                val answer = call.getReference<MethodReference>()!!
                assertEquals(EXTENSION, answer.definingClass)
                assertEquals("railAvailable", answer.name)
                call as RegisterRangeInstruction
                assertEquals("$version: the hide answer reads the gate's register", register, call.startRegister)
                assertEquals(1, call.registerCount)
                val back = after[index + 3]
                assertEquals(Opcode.MOVE_RESULT, back.opcode)
                assertEquals("$version: the answer goes back where the gate's was", register, (back as OneRegisterInstruction).registerA)
                seen++
            }
            assertEquals("$version: every read carries the hide answer", hooked, seen)
        }
    }
}
