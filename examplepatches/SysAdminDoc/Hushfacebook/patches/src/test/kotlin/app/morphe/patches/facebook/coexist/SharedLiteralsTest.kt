/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.coexist

import app.morphe.PatchContexts
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction35c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableMethodReference
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * The code half of Install beside Meta's apps: each place Facebook loads a shared permission's
 * name hands it to the extension, into the same register, before anything reads it.
 */
class SharedLiteralsTest {
    private val sendBroadcast = ImmutableMethodReference(
        "Landroid/content/Context;", "sendBroadcast", listOf("Landroid/content/Intent;", "Ljava/lang/String;"), "V",
    )

    private fun load(register: Int, literal: String): Instruction =
        ImmutableInstruction21c(Opcode.CONST_STRING, register, ImmutableStringReference(literal))

    private fun loadJumbo(register: Int, literal: String): Instruction =
        ImmutableInstruction31c(Opcode.CONST_STRING_JUMBO, register, ImmutableStringReference(literal))

    private fun immutable(type: String, registers: Int, vararg instructions: Instruction) = ImmutableMethod(
        type, "send", emptyList(), "V", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
        ImmutableMethodImplementation(registers, instructions.toList(), null, null),
    )

    private fun method(registers: Int, vararg instructions: Instruction): MutableMethod =
        MutableMethod(immutable("Lcom/example/Broadcasts;", registers, *instructions))

    private fun classDef(type: String, method: Method): ClassDef =
        ImmutableClassDef(type, AccessFlags.PUBLIC.value, "Ljava/lang/Object;", null, null, null, null, listOf(method))

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    /** The call and the move right after the load at [index], on the load's own register. */
    private fun assertRouted(instructions: List<Instruction>, index: Int) {
        val register = (instructions[index] as OneRegisterInstruction).registerA
        val call = instructions[index + 1]
        assertEquals("after $index", Opcode.INVOKE_STATIC_RANGE, call.opcode)
        assertEquals(NAME_CALL, (call as ReferenceInstruction).reference.toString())
        assertEquals("the call reads the load's register", register to 1,
            (call as RegisterRangeInstruction).startRegister to call.registerCount)
        val move = instructions[index + 2]
        assertEquals(Opcode.MOVE_RESULT_OBJECT, move.opcode)
        assertEquals("the answer goes back where the name was", register, (move as OneRegisterInstruction).registerA)
    }

    @Test
    fun aLoadedNameGoesThroughTheExtensionBeforeItsRead() {
        val method = method(
            3,
            load(1, APP_COMMUNICATION),
            ImmutableInstruction35c(Opcode.INVOKE_VIRTUAL, 3, 0, 2, 1, 0, 0, sendBroadcast),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(1, method.routeSharedLiterals())

        val instructions = method.instructions()
        assertEquals(5, instructions.size)
        assertEquals(APP_COMMUNICATION, ((instructions[0] as ReferenceInstruction).reference as StringReference).string)
        assertRouted(instructions, 0)
        assertEquals("Facebook's own call reads the answer", Opcode.INVOKE_VIRTUAL, instructions[3].opcode)
    }

    /**
     * The format Facebook fills its flavour into, a jumbo load, and a register above v15 that a
     * four-bit call can't name: the patcher would drop that call without a word, so it's a range.
     */
    @Test
    fun everySpellingAndRegisterIsRouted() {
        val method = method(
            210,
            loadJumbo(200, APP_COMMUNICATION_FORMAT),
            load(16, RECEIVER_ACCESS),
            load(0, APP_COMMUNICATION),
            ImmutableInstruction11x(Opcode.RETURN_OBJECT, 200),
        )

        assertEquals(3, method.routeSharedLiterals())

        val instructions = method.instructions()
        assertEquals(10, instructions.size)
        assertRouted(instructions, 0)
        assertRouted(instructions, 3)
        assertRouted(instructions, 6)
        assertEquals(Opcode.RETURN_OBJECT, instructions[9].opcode)
    }

    /** Only the exact names: Facebook's package-scoped permission and near misses stay loads. */
    @Test
    fun otherStringsStay() {
        val method = method(
            3,
            load(0, "com.facebook.katana.provider.ACCESS"),
            load(1, "$APP_COMMUNICATION "),
            load(2, renamed(APP_COMMUNICATION)),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(0, method.routeSharedLiterals())
        assertEquals(4, method.instructions().size)
    }

    /**
     * Across the app, through the patcher's string index: Facebook's code is routed, and the
     * extension's own copies of the literals, which it compares names against, are left as they are.
     * Routing those would have the extension call itself.
     */
    @Test
    fun facebooksCodeIsRoutedAndTheExtensionIsLeftAlone() {
        val facebook = "Lcom/facebook/katana/Broadcasts;"
        val extension = NAME_CALL.substringBefore("->")
        val context = PatchContexts.of(
            listOf(
                classDef(facebook, immutable(facebook, 2, load(0, APP_COMMUNICATION_FORMAT), load(1, RECEIVER_ACCESS),
                    ImmutableInstruction10x(Opcode.RETURN_VOID))),
                classDef(extension, immutable(extension, 1, load(0, APP_COMMUNICATION), ImmutableInstruction10x(Opcode.RETURN_VOID))),
            ),
        )

        assertEquals(2, context.routeSharedLiterals())

        val routed = context.mutableClassDefBy(facebook).methods.single().instructions()
        assertEquals(7, routed.size)
        assertRouted(routed, 0)
        assertRouted(routed, 3)
        assertEquals("the extension's literal was routed", 2,
            context.mutableClassDefBy(extension).methods.single().instructions().size)
    }
}
