package app.mix.native

import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertNotNull
import kotlin.test.assertNull
import kotlin.test.assertSame

class NativeFingerprintTest {
    @Test
    fun matchFirstMatchesOnlyTheFunctionEntry() {
        val function = testFunction(0x1000, listOf("nop", "ret"))
        val fingerprint = NativeFingerprint(
            filters = listOf(mnemonic("ret", NativeInstructionLocation.MatchFirst())),
        )

        assertNull(fingerprint.matchOrNull(NativeLibPatchContext(listOf(function.library)), function))
    }

    @Test
    fun orderedFiltersBacktrackAcrossLaterFailures() {
        val function = testFunction(0x1000, listOf("adr", "ret", "adr", "bl"))
        val fingerprint = NativeFingerprint(
            filters = listOf(
                mnemonic("adr"),
                mnemonic("bl", NativeInstructionLocation.MatchAfterImmediately()),
            ),
        )

        val match = fingerprint.matchOrNull(NativeLibPatchContext(listOf(function.library)), function)
        assertNotNull(match)
        assertEquals(listOf(2, 3), match.instructionMatches.map { it.index })
    }

    @Test
    fun matchesAreNotReusedAcrossContexts() {
        val first = testFunction(0x1000, listOf("ret"))
        val second = testFunction(0x2000, listOf("ret"))
        val fingerprint = NativeFingerprint(filters = listOf(mnemonic("ret")))

        assertEquals(0x1000, fingerprint.match(NativeLibPatchContext(listOf(first.library))).function.entryAddress)
        assertEquals(0x2000, fingerprint.match(NativeLibPatchContext(listOf(second.library))).function.entryAddress)
    }

    @Test
    fun callerResolutionStaysInTheCallersLibrary() {
        val firstLibrary = TestLibrary(
            "first.so", listOf(
                functionSpec(0x1000, "b", 0x2000),
                functionSpec(0x2000, "ret"),
            )
        )
        val secondLibrary = TestLibrary("second.so", listOf(functionSpec(0x2000, "nop")))
        val caller = NativeFingerprint(definingLibrary = "first.so", filters = listOf(mnemonic("b")))
        val callee = NativeFingerprint(caller = caller, filters = listOf(mnemonic("ret")))

        val match = callee.matchOrNull(NativeLibPatchContext(listOf(firstLibrary, secondLibrary)))
        assertNotNull(match)
        assertSame(firstLibrary, match.function.library)
    }

    private fun testFunction(entry: Long, mnemonics: List<String>): NativeFunction {
        val library = TestLibrary("lib.so", listOf(FunctionSpec(entry, mnemonics.mapIndexed { index, mnemonic ->
            NativeInstruction(entry + index * 4L, index, mnemonic)
        })))
        return library.functions.single()
    }

    private fun functionSpec(entry: Long, mnemonic: String, target: Long? = null) = FunctionSpec(
        entry,
        listOf(NativeInstruction(entry, 0, mnemonic, branchTarget = target)),
    )

    private data class FunctionSpec(val entry: Long, val instructions: List<NativeInstruction>)

    private class TestLibrary(name: String, specs: List<FunctionSpec>) : NativeLibrary(name) {
        private val specsByEntry = specs.associateBy { it.entry }
        override val codeStartAddress = specs.minOf { it.entry }
        override val functions = specs.sortedBy { it.entry }.mapIndexed { index, spec ->
            NativeFunction(
                this,
                spec.entry,
                specs.sortedBy { it.entry }.getOrNull(index + 1)?.entry
                    ?: (spec.entry + spec.instructions.size * 4L),
                null,
            )
        }
        override val symbolFunctions = emptyList<NativeFunction>()
        override fun decodeRange(startAddress: Long, endAddress: Long) =
            specsByEntry[startAddress]?.instructions.orEmpty()

        override fun readStringBytes(va: Long): ByteArray? = null
        override fun vaToFileOffset(va: Long) = va
    }
}
