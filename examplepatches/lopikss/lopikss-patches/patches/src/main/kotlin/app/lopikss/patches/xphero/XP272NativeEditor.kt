package app.lopikss.patches.xphero

import java.security.MessageDigest

/** XP Hero 27.2.0 (82), ARM64 split from the supplied original XAPK.
 * File offsets are ELF executable VA minus 0x4000. Resolve the Assembly-CSharp
 * method pointers from v31 metadata tokens and inspect each callsite.
 * All edits are opt-in, exact-byte guarded and normalized before SHA-256.
 */
internal object XP272NativeEditor {
    private const val SIZE = 89_001_608
    private const val SHA = "0a776cdc25410216caf06dbcb690e1fe60a67982b424fc16d0fa3453e9150600"
    private const val QUANTITY = 0x27CB47C
    private const val COUNT = 0x27C90B8

    private data class Edit(val offset: Int, val original: Int, val patched: Int)
    private fun edit(offset: Int, original: Long, patched: Long) =
        Edit(offset, original.toInt(), patched.toInt())

    // CalculateRollCost(int), token 0x06000D66. The no-arg wrapper (D65)
    // tail-calls this overload; TryConsumeRollCost also calls it directly.
    private val trait = listOf(
        edit(0x2A97E80, 0xF81D0FFE, 0x52800000),
        edit(0x2A97E84, 0xA90157F6, 0xD65F03C0)
    )
    // TryConsumeCostumePiece (0x06008E03): allow zero, not negative.
    private val heroUnlock = listOf(edit(0x2B714D0, 0x54000A0D, 0x54000A0B))
    // TryGradeUpCostume(int,out ...) 0x06008D44; use existing positive
    // one-piece transaction, with a temporary one-piece credit.
    // BL target AddCostumePiece (0x06008E02) at VA 0x2B77198.
    private val star = listOf(
        edit(0x2B6607C, 0xF94012D7, 0xD2800037),
        edit(0x2B66094, 0x94001938, 0x94003441),
        edit(0x2B66098, 0x36001E60, 0xD503201F),
        edit(0x2B660A0, 0xF94012D3, 0xD2800033)
    )
    // GetChargeCost 0x06009896 and HomeReturnPortalPassController
    // OnDailyReset / ResetDailyTickets / TryUseHomeReturnPortal.
    // Keep the paid item path (7001) unmodified in field consumption;
    // reset writes to the separate free item 7002 instead.
    private val ticket = listOf(
        edit(0x2C2C484, 0x1A89C100, 0x2A0803E0),
        edit(0x27CB494, 0x52836B20, 0x52836B40),
        edit(0x27CB3E8, 0xB4000220, 0xB4000100),
        edit(0x27CB3F4, 0x360001C0, 0x360000A0),
        edit(0x27CC278, 0x36000180, 0xD503201F)
    )
    private val all = trait + heroUnlock + star + ticket
    private fun read(bytes: ByteArray, offset: Int): Int =
        (0..3).fold(0) { n, i -> n or ((bytes[offset + i].toInt() and 255) shl (i * 8)) }
    private fun write(bytes: ByteArray, offset: Int, value: Int) {
        for (i in 0..3) bytes[offset + i] = (value ushr (8 * i)).toByte()
    }
    fun matchesSize(bytes: ByteArray) = bytes.size == SIZE
    private fun verify(bytes: ByteArray) {
        require(matchesSize(bytes)) { "Unsupported 27.2.0 native library size" }
        val original = bytes.copyOf()
        for (e in all) {
            val current = read(bytes, e.offset)
            require(current == e.original || current == e.patched) {
                "Unexpected 27.2.0 native instruction at 0x" + e.offset.toString(16)
            }
            write(original, e.offset, e.original)
        }
        val quantity = read(bytes, QUANTITY)
        require(quantity == 0xB9804273.toInt() ||
            ((quantity and 0xFFE0001F.toInt()) == 0xD2800013.toInt() &&
                ((quantity ushr 5) and 65535) in 10..5000))
        write(original, QUANTITY, 0xB9804273.toInt())
        val count = read(bytes, COUNT)
        val next = read(bytes, COUNT + 4)
        require((count == 0xF81E0FFE.toInt() && next == 0xA9014FF4.toInt()) ||
            ((count and 0xFFE0001F.toInt()) == 0x52800000 &&
                ((count ushr 5) and 65535) in 10..5000 && next == 0xD65F03C0.toInt()))
        write(original, COUNT, 0xF81E0FFE.toInt())
        write(original, COUNT + 4, 0xA9014FF4.toInt())
        val hash = MessageDigest.getInstance("SHA-256").digest(original)
            .joinToString("") { "%02x".format(it) }
        require(hash == SHA) { "Unsupported 27.2.0 native library hash" }
    }
    private fun apply(bytes: ByteArray, edits: List<Edit>): ByteArray {
        verify(bytes)
        return bytes.copyOf().also { out -> edits.forEach { write(out, it.offset, it.patched) } }
    }
    fun traits(bytes: ByteArray) = apply(bytes, trait)
    fun unlock(bytes: ByteArray) = apply(bytes, heroUnlock)
    fun upgrade(bytes: ByteArray) = apply(bytes, star)
    fun tickets(bytes: ByteArray, daily: Int): ByteArray {
        require(daily in 10..5000)
        return apply(bytes, ticket).also {
            write(it, QUANTITY, 0xD2800013.toInt() or (daily shl 5))
            write(it, COUNT, 0x52800000 or (daily shl 5))
            write(it, COUNT + 4, 0xD65F03C0.toInt())
        }
    }
}
