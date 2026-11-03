/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 */
package app.morphe.patches.pinedrama.promobanners

import app.morphe.Fixtures
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.takes
import app.morphe.util.getReference
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

private const val PATCH = "Hide profile shortcuts"
private const val THOUGHTS = "Lapp/morphe/extension/pinedrama/profile/ProfileThoughts;"

/**
 * What Hide Thoughts on profiles (#122) hooks, held to each declared build: the one store of
 * the Thoughts bubble in the profile picture's onViewCreated, and the visibility callback the
 * note binding hands the Thoughts builder.
 */
class ProfileThoughtsAnchorsTest {
    @Test
    fun `the profile picture keeps its Thoughts bubble in one store and the hide follows it`() {
        Fixtures.forEachDeclared { apk ->
            val version = Fixtures.versionOf(apk)
            val taken = methodsOf(apk) { classDef, method -> ProfileAvatarViewCreatedFingerprint.takes(method, classDef) }
            assertEquals("$version: onViewCreated ${taken.size}", 1, taken.size)
            val native = taken.single().second
            val store = native.thoughtBubbleStore(PATCH)
            assertTrue("$version: answer v${store.answer}", store.answer < 16)

            // The field holds the bubble: its type declares the prompt PineDrama shows on your own profile.
            val bubbleType = store.field.substringAfterLast(':')
            val bubble = methodsOf(apk) { classDef, method ->
                classDef.type == bubbleType && method.name == "getNotePromptText" &&
                    method.returnType == "Ljava/lang/String;" && method.parameterTypes.isEmpty()
            }
            assertEquals("$version: $bubbleType has no prompt getter", 1, bubble.size)

            val before = native.implementation!!.instructions.toList()
            val patched = MutableMethod(native)
            patched.hideThoughtBubble(store)
            val after = patched.implementation!!.instructions.toList()
            val inserted = after.subList(store.index + 1, store.index + 7)
            assertEquals(
                "$version: the hide",
                listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.CONST_4, Opcode.IPUT_OBJECT, Opcode.NOP),
                inserted.map { it.opcode },
            )
            val call = inserted[0].getReference<MethodReference>()!!
            assertEquals(THOUGHTS, call.definingClass)
            assertEquals("hideBubble", call.name)
            assertEquals(store.bubble, (inserted[0] as RegisterRangeInstruction).startRegister)
            assertEquals(store.answer, (inserted[1] as OneRegisterInstruction).registerA)
            val empty = inserted[4] as TwoRegisterInstruction
            assertEquals(store.answer, empty.registerA)
            assertEquals(store.owner, empty.registerB)
            val field = inserted[4].getReference<FieldReference>()!!
            assertEquals(store.field, "${field.definingClass}->${field.name}:${field.type}")
            // PineDrama's own instructions are all still there, in their own order.
            val host = (after.take(store.index + 1) + after.drop(store.index + 7)).filter { it.opcode != Opcode.NOP }
            assertEquals(before.filter { it.opcode != Opcode.NOP }.map { it.opcode }, host.map { it.opcode })
        }
    }

    /** Every method of one build the filter takes, walked once and never held. */
    private fun methodsOf(apk: File, accept: (ClassDef, Method) -> Boolean): List<Pair<ClassDef, Method>> {
        val found = mutableListOf<Pair<ClassDef, Method>>()
        val container = Fixtures.dexContainer(apk, Opcodes.getDefault())
        for (entry in container.dexEntryNames) {
            for (classDef in container.getEntry(entry)!!.dexFile.classes) {
                for (method in classDef.methods) {
                    if (accept(classDef, method)) found += classDef to method
                }
            }
        }
        return found
    }
}
