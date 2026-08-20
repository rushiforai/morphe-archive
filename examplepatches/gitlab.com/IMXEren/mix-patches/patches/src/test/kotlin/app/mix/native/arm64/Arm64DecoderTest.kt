package app.mix.native.arm64

import kotlin.test.Test
import kotlin.test.assertEquals

class Arm64DecoderTest {
    @Test
    fun decodesCommonFunctionAndConditionalBranchInstructions() {
        assertEquals("stp", Arm64Decoder.decode(0xA9BF7BFD.toInt(), 0x1000).mnemonic)
        assertEquals("ldp", Arm64Decoder.decode(0xA8C17BFD.toInt(), 0x1000).mnemonic)
        assertEquals("cbz", Arm64Decoder.decode(0x34000000, 0x1000).mnemonic)
        assertEquals("cbnz", Arm64Decoder.decode(0x35000000, 0x1000).mnemonic)
        assertEquals("cbz", Arm64Decoder.decode(0xB4000000.toInt(), 0x1000).mnemonic)
        assertEquals("cbnz", Arm64Decoder.decode(0xB5000000.toInt(), 0x1000).mnemonic)
        assertEquals("tbz", Arm64Decoder.decode(0x36000000, 0x1000).mnemonic)
        assertEquals("tbnz", Arm64Decoder.decode(0x37000000, 0x1000).mnemonic)
    }

    @Test
    fun resolvesConditionalBranchTargets() {
        assertEquals(0x1004, Arm64Decoder.decode(0x34000020, 0x1000).branchTarget)
        assertEquals(0x1004, Arm64Decoder.decode(0x36000020, 0x1000).branchTarget)
    }
}
