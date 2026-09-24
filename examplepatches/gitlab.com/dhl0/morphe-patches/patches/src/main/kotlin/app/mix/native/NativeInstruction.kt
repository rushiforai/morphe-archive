package app.mix.native

/** A single decoded native instruction. */
data class NativeInstruction(
    /** Virtual address of the instruction. */
    val address: Long,
    /** Raw 32-bit instruction word. */
    val word: Int,
    /** Decoded mnemonic, e.g. "adr", "bl", "ret", "movz". */
    val mnemonic: String,
    /** Encoded instruction size in bytes. */
    val size: Int = Int.SIZE_BYTES,
    /** Destination register (bits 4:0), where applicable. */
    val rd: Int = -1,
    /** Source register (bits 9:5), where applicable. */
    val rn: Int = -1,
    /** Load/store target register. */
    val rt: Int = -1,
    /** Load/store second register. */
    val rt2: Int = -1,
    /** PC-relative target for adr/adrp/b/bl/cbz/tbz - null for non-branch instructions. */
    val branchTarget: Long? = null,
    /** The 16-bit field shifted to its final position for movz/movk/movn. */
    val immediate: Long = 0,
    /** Shift position (0/16/32/48) for move-wide instructions. */
    val shift: Int = 0,
    /** Signed immediate offset for add/sub/ldr/str. */
    val immediateOffset: Long? = null,
) {
    init {
        require(size > 0) { "Instruction size must be positive" }
    }

    /** True when this instruction reads or writes a given register (simplified). */
    @Suppress("unused")
    fun usesRegister(register: Int): Boolean = rd == register || rn == register || rt == register || rt2 == register

    /** True when this is a branch with a resolvable target. */
    @Suppress("unused")
    val isBranch: Boolean get() = branchTarget != null
}
