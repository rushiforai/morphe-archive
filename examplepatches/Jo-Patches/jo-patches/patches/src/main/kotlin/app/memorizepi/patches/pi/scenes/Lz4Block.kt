package app.memorizepi.patches.pi.scenes

/**
 * Minimal LZ4 block-format codec.
 *
 * UnityFS stores each data block as a raw LZ4 block (no frame header), the
 * same format as `lz4.block.compress`/`decompress` in Python and UnityPy.
 * Only the subset Unity uses is implemented: little-endian, single block,
 * no dictionary and no checksum.
 *
 * The compressor is a greedy hash-table matcher. It is not as good as
 * Unity's LZ4HC, but it produces valid blocks and a bundle of roughly the
 * same size.
 */
internal object Lz4Block {
    private const val MIN_MATCH = 4
    private const val LAST_LITERALS = 5
    private const val MATCH_FIND_LIMIT = 12
    private const val HASH_LOG = 16
    private const val HASH_SIZE = 1 shl HASH_LOG
    private const val MAX_OFFSET = 0xFFFF

    /**
     * Decompresses [srcLength] bytes of [src] starting at [srcOffset] into
     * exactly [destLength] bytes of [dest] starting at [destOffset].
     */
    fun decompress(
        src: ByteArray,
        srcOffset: Int,
        srcLength: Int,
        dest: ByteArray,
        destOffset: Int,
        destLength: Int,
    ) {
        require(srcLength >= 0)
        require(destLength >= 0)
        require(srcOffset >= 0 && srcOffset + srcLength <= src.size)
        require(destOffset >= 0 && destOffset + destLength <= dest.size)

        var ip = srcOffset
        val iend = srcOffset + srcLength
        var op = destOffset
        val oend = destOffset + destLength

        while (ip < iend) {
            val token = src[ip++].toInt() and 0xFF

            var literalLength = token ushr 4
            if (literalLength == 15) {
                while (true) {
                    if (ip >= iend) fail("Truncated LZ4 literal length")
                    val value = src[ip++].toInt() and 0xFF
                    literalLength += value
                    if (value != 255) break
                }
            }
            if (literalLength > 0) {
                if (ip > iend - literalLength) fail("Truncated LZ4 literals")
                if (op > oend - literalLength) fail("LZ4 output overrun")
                System.arraycopy(src, ip, dest, op, literalLength)
                ip += literalLength
                op += literalLength
            }

            // The last sequence of a block is literals only.
            if (ip == iend) break
            if (ip > iend - 2) fail("Truncated LZ4 match offset")

            val offset = (src[ip].toInt() and 0xFF) or ((src[ip + 1].toInt() and 0xFF) shl 8)
            ip += 2
            if (offset == 0 || offset > op - destOffset) fail("Invalid LZ4 match offset $offset")

            var matchLength = token and 0x0F
            if (matchLength == 15) {
                while (true) {
                    if (ip >= iend) fail("Truncated LZ4 match length")
                    val value = src[ip++].toInt() and 0xFF
                    matchLength += value
                    if (value != 255) break
                }
            }
            matchLength += MIN_MATCH
            if (op > oend - matchLength) fail("LZ4 output overrun")

            // Byte-wise copy: source and destination may overlap.
            var match = op - offset
            repeat(matchLength) {
                dest[op++] = dest[match++]
            }
        }

        if (op != oend) fail("LZ4 block decompressed to ${op - destOffset} bytes, expected $destLength")
    }

    /** Compresses [length] bytes of [src] starting at [offset] into a new LZ4 block. */
    fun compress(src: ByteArray, offset: Int, length: Int): ByteArray {
        require(offset >= 0 && length >= 0 && offset + length <= src.size)
        if (length == 0) return ByteArray(0)

        // Worst case for LZ4 is n + n / 255 + 16 bytes.
        val dest = ByteArray(length + length / 255 + 16)
        val table = IntArray(HASH_SIZE) { -1 }
        val end = offset + length
        val matchFindLimit = end - MATCH_FIND_LIMIT
        val matchLimit = end - LAST_LITERALS
        var anchor = offset
        var ip = offset
        var op = 0

        while (ip < matchFindLimit) {
            val sequence = readInt(src, ip)
            val slot = hash(sequence)
            val candidate = table[slot]
            table[slot] = ip

            if (candidate >= offset && ip - candidate <= MAX_OFFSET &&
                readInt(src, candidate) == sequence
            ) {
                var matchLength = MIN_MATCH
                while (ip + matchLength < matchLimit &&
                    src[candidate + matchLength] == src[ip + matchLength]
                ) {
                    matchLength++
                }

                val literalLength = ip - anchor
                val matchCode = matchLength - MIN_MATCH
                dest[op++] = (((literalLength.coerceAtMost(15)) shl 4) or
                    matchCode.coerceAtMost(15)).toByte()
                if (literalLength >= 15) op = writeLength(dest, op, literalLength - 15)
                System.arraycopy(src, anchor, dest, op, literalLength)
                op += literalLength

                val matchOffset = ip - candidate
                dest[op++] = (matchOffset and 0xFF).toByte()
                dest[op++] = ((matchOffset ushr 8) and 0xFF).toByte()
                if (matchCode >= 15) op = writeLength(dest, op, matchCode - 15)

                ip += matchLength
                anchor = ip
            } else {
                ip++
            }
        }

        val literalLength = end - anchor
        if (literalLength > 0) {
            dest[op++] = (if (literalLength >= 15) 15 shl 4 else literalLength shl 4).toByte()
            if (literalLength >= 15) op = writeLength(dest, op, literalLength - 15)
            System.arraycopy(src, anchor, dest, op, literalLength)
            op += literalLength
        }

        return dest.copyOf(op)
    }

    private fun readInt(src: ByteArray, pos: Int): Int =
        (src[pos].toInt() and 0xFF) or
            ((src[pos + 1].toInt() and 0xFF) shl 8) or
            ((src[pos + 2].toInt() and 0xFF) shl 16) or
            ((src[pos + 3].toInt() and 0xFF) shl 24)

    private fun hash(value: Int): Int = (value * -1640531535) ushr (32 - HASH_LOG)

    private fun writeLength(dest: ByteArray, start: Int, value: Int): Int {
        var op = start
        var remaining = value
        while (remaining >= 255) {
            dest[op++] = 255.toByte()
            remaining -= 255
        }
        dest[op++] = remaining.toByte()
        return op
    }

    private fun fail(message: String): Nothing = throw IllegalArgumentException(message)
}
