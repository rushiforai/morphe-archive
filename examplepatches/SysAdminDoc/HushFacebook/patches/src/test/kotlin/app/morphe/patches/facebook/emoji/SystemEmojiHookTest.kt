/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.emoji

import app.morphe.RepoFiles
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
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
import java.io.File

/**
 * The parts of Use the phone's emoji that need no Facebook build: which methods the patch takes for
 * the provider and for the maker of emoji picture addresses, and the code it puts in front of each.
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

    private val sizeEnum = "Lfixture/EmojiSize;"

    /** Facebook's address maker: static, (name, size, version, density) to a String, 9 registers. */
    private fun urlMaker(
        literals: List<String> = listOf(REMOTE_EMOJI_BASE),
        static: Boolean = true,
        parameters: List<String> = listOf(STRING, sizeEnum, STRING, "I"),
        returnType: String = STRING,
        registers: Int = 9,
    ) = method(literals, static, parameters, returnType, registers)

    @Test
    fun `the address maker is the static method answering a String that holds the picture base`() {
        assertTrue(isRemoteEmojiUrlMaker(urlMaker()))
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(literals = listOf("https://www.facebook.com/images/emoji"))))
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(static = false)))
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(returnType = "Ljava/lang/Object;")))
        // The cache key maker next to it takes the same size but builds a drawable, not an address.
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(parameters = listOf(sizeEnum, STRING))))
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(parameters = listOf(STRING, sizeEnum, STRING, "J"))))
        assertFalse(isRemoteEmojiUrlMaker(urlMaker(parameters = listOf(STRING, sizeEnum, STRING, "I", "I"))))
    }

    @Test
    fun `the address maker asks the extension first and answers no address only when told to`() {
        val maker = MutableMethod(urlMaker())
        val own = maker.implementation!!.instructions.count()
        maker.answerNoPictureFirst()

        val call = (maker.at(0) as ReferenceInstruction).reference as MethodReference
        assertEquals(Opcode.INVOKE_STATIC, maker.at(0).opcode)
        assertEquals(SKIP_REMOTE_EMOJI,
            call.definingClass + "->" + call.name + call.parameterTypes.joinToString("", "(", ")") + call.returnType)
        assertEquals(Opcode.MOVE_RESULT, maker.at(1).opcode)
        assertEquals(0, (maker.at(1) as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, maker.at(2).opcode)
        assertEquals(0, (maker.at(2) as OneRegisterInstruction).registerA)
        // True: null, which Facebook reads as an emoji Meta has no picture of.
        assertEquals(Opcode.CONST_4, maker.at(3).opcode)
        assertEquals(0, (maker.at(3) as OneRegisterInstruction).registerA)
        assertEquals(0L, (maker.at(3) as WideLiteralInstruction).wideLiteral)
        assertEquals(Opcode.RETURN_OBJECT, maker.at(4).opcode)
        assertEquals(0, (maker.at(4) as OneRegisterInstruction).registerA)
        // False lands on the maker's own first instruction, so none of Facebook's code is skipped.
        assertEquals(own + 5, maker.implementation!!.instructions.count())
        assertEquals(5, maker.target(2))
        assertEquals(Opcode.CONST_STRING, maker.at(5).opcode)
    }

    /**
     * The receipt refuses a patched build whose provider or address maker doesn't ask the extension
     * first, by two start-call rules in scripts/injected-mutation-contracts.txt. They name what the
     * patch finds each method by and the call it puts there, so a rename on one side can't leave a
     * rule looking for something no build has.
     */
    @Test
    fun `the contract file holds both hooks`() {
        val rules = File(RepoFiles.root, "scripts/injected-mutation-contracts.txt").readLines()
            .map { it.trim() }
            .filter { it.startsWith("start-call ") && it.contains("/SystemEmoji;->") }
        assertEquals(
            listOf(
                "start-call $SYSTEM_EMOJI_TYPEFACE in instance ()$TYPEFACE holding $FORCE_SYSTEM_EMOJI_FONT " +
                    EMOJI_TYPEFACE_PROVIDER,
                "start-call $SKIP_REMOTE_EMOJI in static ($STRING*)$STRING holding $REMOTE_EMOJI_BASE",
            ),
            rules,
        )
    }

    /** A maker with no local for the answer is refused by name, before anything goes in. */
    @Test
    fun `an address maker with no local register stops the patch`() {
        val tight = MutableMethod(urlMaker(registers = 4))
        val refusal = assertThrows(PatchException::class.java) { tight.answerNoPictureFirst() }
        assertTrue(refusal.message, refusal.message!!.contains(PATCH))
        assertEquals(Opcode.CONST_STRING, tight.at(0).opcode)
    }
}
