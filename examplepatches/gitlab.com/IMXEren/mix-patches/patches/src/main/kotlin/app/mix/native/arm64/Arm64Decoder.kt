package app.mix.native.arm64

import app.mix.native.NativeInstruction

/**
 * Minimal AArch64 (arm64) instruction decoder - enough for native fingerprinting.
 *
 * Decodes the instruction classes needed by the fingerprinting engine: branches,
 * adr/adrp (string references), movz/movk/movn (constant building), ret,
 * stp/ldp (prologues/epilogues), and a few crash/call primitives (udiv,
 * null-deref patterns, svc).
 */
object Arm64Decoder {

    /**
     * Decodes a single 32-bit instruction at [address].
     *
     * @param word the raw instruction word
     * @param address the VA the instruction lives at (needed for pc-relative targets)
     */
    fun decode(word: Int, address: Long): NativeInstruction {
        // --- AArch64: top-level space 0 (misc) vs 1 (data proc) vs others ---
        val mnemonic = when {
            isAdr(word) -> "adr"
            isAdrp(word) -> "adrp"
            isB(word) -> "b"
            isBl(word) -> "bl"
            isBr(word) -> "br"
            isBlr(word) -> "blr"
            isRet(word) -> "ret"
            isMovz(word) -> "movz"
            isMovk(word) -> "movk"
            isMovn(word) -> "movn"
            isStp(word) -> "stp"
            isLdp(word) -> "ldp"
            isStr(word) -> "str"
            isLdr(word) -> "ldr"
            isSub(word) -> "sub"
            isAdd(word) -> "add"
            isCbz(word) -> "cbz"
            isCbnz(word) -> "cbnz"
            isTbz(word) -> "tbz"
            isTbnz(word) -> "tbnz"
            isUdiv(word) -> "udiv"
            isSvc(word) -> "svc"
            isNop(word) -> "nop"
            isBti(word) -> "bti"
            isPaciasp(word) -> "paciasp"
            isIsb(word) -> "isb"
            isDsb(word) -> "dsb"
            isDmb(word) -> "dmb"
            isLdarb(word) -> "ldarb"
            isCas(word) -> "cas"
            isLdar(word) -> "ldar"
            isStlr(word) -> "stlr"
            isMov(word) -> "mov"
            else -> "unknown"
        }

        // PC-relative target for branches and adr/adrp
        val branchTarget: Long? = when (mnemonic) {
            "adr" -> address + signExtend21(((word ushr 5) and 0x7FFFF shl 2) or ((word ushr 29) and 0x3))
            "adrp" -> (address and -0x1000L) + (signExtend21(((word ushr 5) and 0x7FFFF shl 2) or ((word ushr 29) and 0x3)) shl 12)
            "b", "bl" -> address + signExtend26(word and 0x3FFFFFF) * 4
            "cbz", "cbnz" -> address + signExtend19((word ushr 5) and 0x7FFFF) * 4
            "tbz", "tbnz" -> address + signExtend14((word ushr 5) and 0x3FFF) * 4
            else -> null
        }

        // Immediate for movz/movk/movn: (hw << 16) position of the 16-bit field
        val (immediate, shift) = when (mnemonic) {
            "movz", "movk", "movn" -> {
                val imm16 = (word ushr 5) and 0xFFFF
                val hw = (word ushr 21) and 0x3
                (imm16.toLong() shl (hw * 16)) to (hw * 16)
            }

            "svc" -> ((word ushr 5) and 0xFFFF).toLong() to 0
            "add", "sub" -> {
                val imm12 = (word ushr 10) and 0xFFF
                val shiftAmount = (word ushr 22) and 0x1
                (imm12.toLong() shl (shiftAmount * 12)) to (shiftAmount * 12)
            }

            else -> 0L to 0
        }

        // Registers: rd (bits 4:0), rn (bits 9:5), rt (bits 4:0 for load/store), rt2 (bits 14:10)
        val rd = word and 0x1F
        val rn = (word ushr 5) and 0x1F
        val rt = word and 0x1F
        val rt2 = (word ushr 10) and 0x1F

        // Immediate offset for load/store and add/sub
        val immediateOffset: Long? = when (mnemonic) {
            "add", "sub" -> {
                val imm12 = (word ushr 10) and 0xFFF
                val shiftAmount = (word ushr 22) and 0x1
                (imm12.toLong() shl (shiftAmount * 12)).let { if (mnemonic == "sub") -it else it }
            }

            "ldr", "str" -> {
                // Handle both unsigned immediate and pre/post-index forms loosely
                val imm12 = (word ushr 10) and 0xFFF
                imm12.toLong() shl ((word ushr 30) and 0x1)
            }

            else -> null
        }

        return NativeInstruction(
            address = address,
            word = word,
            mnemonic = mnemonic,
            rd = rd,
            rn = rn,
            rt = rt,
            rt2 = rt2,
            branchTarget = branchTarget,
            immediate = immediate,
            shift = shift,
            immediateOffset = immediateOffset,
        )
    }

    /**
     * Decodes a byte range into instructions starting at [baseAddress].
     * Stops cleanly at the first 4-byte-aligned misstep or the end of the buffer.
     */
    fun decodeRange(bytes: ByteArray, baseAddress: Long): List<NativeInstruction> {
        val count = bytes.size / 4
        val result = ArrayList<NativeInstruction>(count)
        for (i in 0 until count) {
            val offset = i * 4
            val word = (bytes[offset].toInt() and 0xFF) or
                    ((bytes[offset + 1].toInt() and 0xFF) shl 8) or
                    ((bytes[offset + 2].toInt() and 0xFF) shl 16) or
                    ((bytes[offset + 3].toInt() and 0xFF) shl 24)
            result += decode(word, baseAddress + i * 4L)
        }
        return result
    }

    // --- AArch64 instruction class predicates ---

    // adr/adrp: 0b0_00_10000 immhi immlo rd  (op=0: adr, op=1: adrp)
    private fun isAdr(word: Int): Boolean = (word and 0x9F000000.toInt()) == 0x10000000
    private fun isAdrp(word: Int): Boolean = (word and 0x9F000000.toInt()) == 0x90000000.toInt()

    // b/bl: 0b_0_00101 imm26 ; bl = 0b_1_00101 imm26
    private fun isB(word: Int): Boolean = (word ushr 26) == 0x05
    private fun isBl(word: Int): Boolean = (word ushr 26) == 0x25

    // br/blr/ret: 0b1101011_0_0_11_00000_11111_00000_rn
    private fun isBr(word: Int): Boolean = (word and 0xFFFFFC1F.toInt()) == 0xD61F0000.toInt()
    private fun isBlr(word: Int): Boolean = (word and 0xFFFFFC1F.toInt()) == 0xD63F0000.toInt()
    private fun isRet(word: Int): Boolean = (word and 0xFFFFFC1F.toInt()) == 0xD65F0000.toInt()

    // movz/movk/movn (move wide immediate): 0b_10_100101_hw_imm16_rd, sf bit 31
    private fun isMovz(word: Int): Boolean = (word and 0x7F800000) == 0x52800000
    private fun isMovk(word: Int): Boolean = (word and 0x7F800000) == 0x72800000
    private fun isMovn(word: Int): Boolean = (word and 0x7F800000) == 0x12800000

    // mov (alias of ORR/ADD immediate with 0): mov xN, xM = orr xN, xzr, xM
    private fun isMov(word: Int): Boolean =
        (word and 0x7FE0FFE0) == 0x2A0003E0 // orr (shifted register)

    // Load/store pair. Mask out element size, addressing mode, vector bit and operands.
    private fun isStp(word: Int): Boolean = (word and 0x3E400000) == 0x28000000
    private fun isLdp(word: Int): Boolean = (word and 0x3E400000) == 0x28400000

    // str/ldr (immediate + register + literal): loose
    private fun isStr(word: Int): Boolean =
        (word and 0x3B000000) == 0x39000000 || (word and 0xFFC00000.toInt()) == 0xF9000000.toInt()

    private fun isLdr(word: Int): Boolean =
        (word and 0x3B000000) == 0x39400000 || (word and 0xFFC00000.toInt()) == 0xF9400000.toInt() ||
                (word and 0x3B000000) == 0x18000000 // literal ldr

    // add/sub (immediate): 0b_10_100_010_shift_imm12_rn_rd (sf bit 31, op bit 30)
    private fun isSub(word: Int): Boolean = (word and 0xFF800000.toInt()) == 0x51000000 ||
            (word and 0xFF800000.toInt()) == 0xD1000000.toInt()

    private fun isAdd(word: Int): Boolean = (word and 0xFF800000.toInt()) == 0x11000000 ||
            (word and 0xFF800000.toInt()) == 0x91000000.toInt()

    // Compare/test and branch. Bit 24 selects zero/non-zero; bit 31 is operand width.
    private fun isCbz(word: Int): Boolean = (word and 0x7F000000) == 0x34000000
    private fun isCbnz(word: Int): Boolean = (word and 0x7F000000) == 0x35000000
    private fun isTbz(word: Int): Boolean = (word and 0x7F000000) == 0x36000000
    private fun isTbnz(word: Int): Boolean = (word and 0x7F000000) == 0x37000000

    // udiv: 0b_1_10_1101011_00000_000011_00001_rm_rn_rd
    private fun isUdiv(word: Int): Boolean = (word and 0xFFE0FC00.toInt()) == 0x1AC00800 ||
            (word and 0xFFE0FC00.toInt()) == 0x9AC00800.toInt()

    // svc: 0b11010100_0000_0000_0000_0000_0001_0000 (imm16 << 5)
    private fun isSvc(word: Int): Boolean = (word and 0xFFE0001F.toInt()) == 0xD4000001.toInt()

    private fun isNop(word: Int): Boolean = word == 0xD503201F.toInt()
    private fun isBti(word: Int): Boolean = (word and 0xFFFFFF9F.toInt()) == 0xD503241F.toInt() // bti c/j/jc: top bits
    private fun isPaciasp(word: Int): Boolean = word == 0xD503233F.toInt()
    private fun isIsb(word: Int): Boolean = (word and 0xFFFFFF9F.toInt()) == 0xD50330DF.toInt()
    private fun isDsb(word: Int): Boolean = (word and 0xFFFFF01F.toInt()) == 0xD503309F.toInt()
    private fun isDmb(word: Int): Boolean = (word and 0xFFFFF01F.toInt()) == 0xD50330BF.toInt() and 0xFFFFF01F.toInt()
    private fun isLdarb(word: Int): Boolean = (word and 0xFFFFF0FF.toInt()) == 0x08DFF080 // 32-bit acquire
    private fun isLdar(word: Int): Boolean = (word and 0xFFFFF0FF.toInt()) == 0x88DFF080.toInt() // 64-bit acquire
    private fun isStlr(word: Int): Boolean = (word and 0xFFFFF0FF.toInt()) == 0x889FFC80.toInt() // 64-bit release
    private fun isCas(word: Int): Boolean = (word and 0xFF20FC00.toInt()) == 0x88A07C00.toInt() // cas x

    private fun signExtend21(value: Int): Long = (value.toLong() shl 43) shr 43
    private fun signExtend26(value: Int): Long = (value.toLong() shl 38) shr 38
    private fun signExtend19(value: Int): Long = (value.toLong() shl 45) shr 45
    private fun signExtend14(value: Int): Long = (value.toLong() shl 50) shr 50
}
