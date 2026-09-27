/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.emoji

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The parts of Use the phone's emoji that need no Facebook build: which method the patch takes for
 * the provider, and the code it puts in front of it.
 */
class SystemEmojiHookTest {
    /** A method loading each of [literals] into v0 and returning it, with [registers] in its frame. */
    private fun method(
        literals: List<String> = listOf(FORCE_SYSTEM_EMOJI_FONT, EMOJI_TYPEFACE_PROVIDER),
        static: Boolean = false,
        parameters: List<String> = emptyList(),
        returnType: String = TYPEFACE,
        registers: Int = 6,
    ): Method = ImmutableMethod(
        "Lfixture/Provider;",
        "A00",
        parameters.map { ImmutableMethodParameter(it, null, null) },
        returnType,
        AccessFlags.PUBLIC.value or AccessFlags.FINAL.value or (if (static) AccessFlags.STATIC.value else 0),
        null,
        null,
        ImmutableMethodImplementation(
            registers,
            literals.map { ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(it)) } +
                ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0),
            null,
            null,
        ),
    )

    @Test
    fun `the provider is the instance method answering a Typeface that holds the flag and the log tag`() {
        assertTrue(isEmojiTypefaceProvider(method()))
        // Either literal alone: the log tag also sits in a string table, the flag could move.
        assertFalse(isEmojiTypefaceProvider(method(literals = listOf(FORCE_SYSTEM_EMOJI_FONT))))
        assertFalse(isEmojiTypefaceProvider(method(literals = listOf(EMOJI_TYPEFACE_PROVIDER))))
        assertFalse(isEmojiTypefaceProvider(method(static = true)))
        assertFalse(isEmojiTypefaceProvider(method(parameters = listOf("I"))))
        assertFalse(isEmojiTypefaceProvider(method(returnType = "Ljava/lang/Object;")))
    }

    private fun MutableMethod.at(index: Int) = implementation!!.instructions.elementAt(index)

    /** The instruction index a branch at [index] lands on. */
    private fun MutableMethod.target(index: Int): Int {
        val instructions = implementation!!.instructions.toList()
        var address = 0
        val addresses = instructions.map { val at = address; address += it.codeUnits; at }
        return addresses.indexOf(addresses[index] + (instructions[index] as OffsetInstruction).codeOffset)
    }

    @Test
    fun `the provider asks the extension first and runs its own code on a null answer`() {
        val provider = MutableMethod(method())
        val own = provider.implementation!!.instructions.count()
        provider.answerPhoneEmojiFirst()

        val call = (provider.at(0) as ReferenceInstruction).reference as MethodReference
        assertEquals(Opcode.INVOKE_STATIC, provider.at(0).opcode)
        assertEquals(SYSTEM_EMOJI_TYPEFACE,
            call.definingClass + "->" + call.name + call.parameterTypes.joinToString("", "(", ")") + call.returnType)
        assertEquals(Opcode.MOVE_RESULT_OBJECT, provider.at(1).opcode)
        assertEquals(0, (provider.at(1) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, provider.at(2).opcode)
        assertEquals(Opcode.RETURN_OBJECT, provider.at(3).opcode)
        assertEquals(0, (provider.at(3) as OneRegisterInstruction).registerA)
        // The branch lands on the provider's own first instruction, so none of Facebook's code is skipped.
        assertEquals(own + 4, provider.implementation!!.instructions.count())
        assertEquals(4, provider.target(2))
        assertEquals(Opcode.CONST_STRING, provider.at(4).opcode)
    }

    /** A provider with no local to put the answer in is refused by name, before anything goes in. */
    @Test
    fun `a provider with no local register stops the patch`() {
        val tight = MutableMethod(method(registers = 1))
        val refusal = assertThrows(PatchException::class.java) { tight.answerPhoneEmojiFirst() }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(Opcode.CONST_STRING, tight.at(0).opcode)
    }
}
