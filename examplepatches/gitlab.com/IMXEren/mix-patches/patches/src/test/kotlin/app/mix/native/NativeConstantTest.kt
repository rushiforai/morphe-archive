package app.mix.native

import kotlin.test.Test
import kotlin.test.assertTrue

class NativeConstantTest {
    @Test
    fun movkReplacesItsLaneAndMovnInitializesAChain() {
        val entry = 0x1000L
        val instructions = listOf(
            moveWide(entry, "movz", 0x52824680, immediate = 0x1234),
            moveWide(entry + 4, "movk", 0x72B579A0, immediate = 0xABCD0000, shift = 16),
            NativeInstruction(entry + 8, 0, "add", rd = 0, rn = 1),
            moveWide(entry + 12, "movn", 0x92800021.toInt(), immediate = 1, rd = 1),
            moveWide(entry + 16, "movk", 0x72A00041, immediate = 0x20000, shift = 16, rd = 1),
        )
        val library = ConstantLibrary(instructions)
        val constants = library.functions.single().constants

        assertTrue(constants.any { it.value == 0xABCD1234L }, "constants=${constants.map { it.value.toString(16) }}")
        assertTrue(
            constants.any { it.value == 0xFFFF_FFFF_0002_FFFEUL.toLong() && it.fromMovn },
            "constants=${constants.map { it.value.toString(16) }}",
        )
    }

    private fun moveWide(
        address: Long,
        mnemonic: String,
        word: Int,
        immediate: Long,
        shift: Int = 0,
        rd: Int = 0,
    ) = NativeInstruction(address, word, mnemonic, rd = rd, immediate = immediate, shift = shift)

    private class ConstantLibrary(private val decoded: List<NativeInstruction>) : NativeLibrary("constants.so") {
        override val codeStartAddress = decoded.first().address
        override val functions = listOf(NativeFunction(this, codeStartAddress, decoded.last().address + 4, null))
        override val symbolFunctions = emptyList<NativeFunction>()
        override fun decodeRange(startAddress: Long, endAddress: Long) = decoded
        override fun readStringBytes(va: Long): ByteArray? = null
        override fun vaToFileOffset(va: Long) = va
    }
}
