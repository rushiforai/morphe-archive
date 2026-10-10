package app.noam.patches.blockblast.shared

import java.io.ByteArrayOutputStream
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * The game's "HEK:" script envelope (algorithm 1): a big-endian length header and a Brotli stream,
 * XXTEA-encrypted. There is no Brotli compressor on the phone, so the stream only stores the bytes in
 * uncompressed meta-blocks, which every Brotli decoder reads.
 */
internal object Hek {
    private val KEY = "65485d8a-8161-4c".toByteArray()
    private const val DELTA = 0x9E3779B9.toInt()

    fun encode(data: ByteArray): ByteArray {
        val body = ByteArrayOutputStream()
        body.write(0xAF)
        body.write(0xFA)
        body.write(ByteBuffer.allocate(4).putInt(data.size).array())
        body.write(storedBrotli(data))
        return "HEK:".toByteArray() + byteArrayOf(1, 0, 1, 2) + encrypt(body.toByteArray())
    }

    private fun storedBrotli(data: ByteArray): ByteArray {
        val out = ByteArrayOutputStream()
        var acc = 0L
        var bits = 0
        fun write(value: Long, count: Int) {
            acc = acc or (value shl bits)
            bits += count
            while (bits >= 8) {
                out.write((acc and 0xFF).toInt())
                acc = acc ushr 8
                bits -= 8
            }
        }
        fun align() {
            if (bits > 0) out.write((acc and 0xFF).toInt())
            acc = 0
            bits = 0
        }
        write(0b1111, 4) // WBITS = 24
        var offset = 0
        while (offset < data.size) {
            val length = minOf(65536, data.size - offset)
            write(0, 1) // ISLAST
            write(0, 2) // MNIBBLES = 4
            write((length - 1).toLong(), 16)
            write(1, 1) // ISUNCOMPRESSED
            align()
            out.write(data, offset, length)
            offset += length
        }
        write(0b11, 2) // ISLAST, ISLASTEMPTY
        align()
        return out.toByteArray()
    }

    /** XXTEA over little-endian words, with the plaintext length appended as the last word. */
    private fun encrypt(data: ByteArray): ByteArray {
        val padded = data.copyOf((data.size + 3) / 4 * 4)
        val v = IntArray(padded.size / 4 + 1)
        ByteBuffer.wrap(padded).order(ByteOrder.LITTLE_ENDIAN).asIntBuffer().get(v, 0, padded.size / 4)
        v[v.size - 1] = data.size
        val k = IntArray(4)
        ByteBuffer.wrap(KEY).order(ByteOrder.LITTLE_ENDIAN).asIntBuffer().get(k)
        val n = v.size - 1
        var z = v[n]
        var sum = 0
        repeat(6 + 52 / (n + 1)) {
            sum += DELTA
            val e = (sum ushr 2) and 3
            for (p in 0..n) {
                val y = v[if (p < n) p + 1 else 0]
                val mx = ((z ushr 5) xor (y shl 2)) + ((y ushr 3) xor (z shl 4)) xor ((sum xor y) + (k[(p and 3) xor e] xor z))
                v[p] += mx
                z = v[p]
            }
        }
        val out = ByteBuffer.allocate(v.size * 4).order(ByteOrder.LITTLE_ENDIAN)
        out.asIntBuffer().put(v)
        return out.array()
    }
}
