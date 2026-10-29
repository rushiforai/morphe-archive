package io.github.pengusto.patches.finamp

import app.morphe.patcher.patch.PatchException
import java.io.InputStream
import java.security.MessageDigest
import java.util.zip.Inflater

/** PFD1 uses ordinary signed little-endian controls, not BSDIFF's sign-magnitude integers. */
internal object FinampDelta {
    const val MAX_LIBRARY_BYTES = 64 * 1024 * 1024
    private const val MAX_TOTAL_BYTES = 128 * 1024 * 1024
    private const val HEADER_BYTES = 108

    fun apply(original: ByteArray, delta: InputStream): ByteArray = try {
        decode(original, delta)
    } catch (exception: PatchException) {
        throw exception
    } catch (exception: Exception) {
        throw PatchException("Finamp PFD1: ${exception.message ?: exception.javaClass.simpleName}", exception)
    }

    private fun decode(original: ByteArray, delta: InputStream): ByteArray {
        expect(original.size <= MAX_LIBRARY_BYTES, "original library exceeds 64 MiB")
        val header = ByteArray(HEADER_BYTES)
        readFully(delta, header)
        expect(header[0] == 80.toByte() && header[1] == 70.toByte() &&
            header[2] == 68.toByte() && header[3] == 49.toByte(), "unsupported delta magic (expected PFD1)")

        val oldLength = unsignedLength(header, 4, MAX_LIBRARY_BYTES.toLong(), "old length")
        val newLength = unsignedLength(header, 12, MAX_LIBRARY_BYTES.toLong(), "new length")
        expect(oldLength == original.size.toLong(), "original library length does not match delta")
        expect(MessageDigest.isEqual(digest(original), header.copyOfRange(20, 52)),
            "original library SHA-256 does not match delta")

        val controlLength = unsignedLength(header, 84, MAX_LIBRARY_BYTES.toLong(), "control length")
        val diffLength = unsignedLength(header, 92, MAX_LIBRARY_BYTES.toLong(), "diff length")
        val extraLength = unsignedLength(header, 100, MAX_LIBRARY_BYTES.toLong(), "extra length")
        expect(controlLength % 24L == 0L, "control length must be a multiple of 24")
        expect(diffLength + extraLength == newLength, "diff and extra lengths do not sum to new length")
        val totalLength = controlLength + diffLength + extraLength
        expect(totalLength <= MAX_TOTAL_BYTES, "expanded delta exceeds 128 MiB")

        val payload = inflateExactly(delta, totalLength.toInt())
        val output = ByteArray(newLength.toInt())
        val diffStart = controlLength.toInt()
        val extraStart = (controlLength + diffLength).toInt()
        var diffPosition = diffStart
        var extraPosition = extraStart
        var newPosition = 0
        var oldPosition = 0L

        for (control in 0 until diffStart step 24) {
            val x = signedLong(payload, control)
            val y = signedLong(payload, control + 8)
            val z = signedLong(payload, control + 16)
            expect(x >= 0L && y >= 0L, "negative diff or extra count")
            expect(x <= output.size.toLong() - newPosition &&
                y <= output.size.toLong() - newPosition - x, "control exceeds output length")
            expect(x <= extraStart.toLong() - diffPosition, "control exceeds diff stream")
            expect(y <= payload.size.toLong() - extraPosition, "control exceeds extra stream")

            // Match the producer's mathematical oldPosition + x + z, checking the final sum.
            // With negative z, x + z is safe and may cancel an overflowing oldPosition + x.
            val nextOld = if (z < 0L) checkedAdd(oldPosition, x + z)
                else checkedAdd(checkedAdd(oldPosition, x), z)
            val count = x.toInt()
            for (i in 0 until count) {
                // Compare before adding: mathematical indices outside Long are also outside the file.
                val oldByte = if (oldPosition >= -i.toLong() && oldPosition < original.size.toLong() - i) {
                    original[(oldPosition + i).toInt()].toInt() and 0xff
                } else {
                    0
                }
                output[newPosition + i] = (oldByte + (payload[diffPosition + i].toInt() and 0xff)).toByte()
            }
            diffPosition += count
            newPosition += count
            val extraCount = y.toInt()
            System.arraycopy(payload, extraPosition, output, newPosition, extraCount)
            extraPosition += extraCount
            newPosition += extraCount
            oldPosition = nextOld
        }

        expect(newPosition == output.size, "controls do not reconstruct the complete output")
        expect(diffPosition == extraStart && extraPosition == payload.size, "unused diff or extra bytes")
        expect(MessageDigest.isEqual(digest(output), header.copyOfRange(52, 84)),
            "reconstructed library SHA-256 does not match delta")
        return output
    }

    /** InflaterInputStream alone cannot reject bytes buffered beyond the end of the zlib stream. */
    private fun inflateExactly(input: InputStream, length: Int): ByteArray {
        val inflater = Inflater()
        try {
            val output = ByteArray(length)
            val compressed = ByteArray(8192)
            val overflow = ByteArray(1)
            var position = 0
            while (!inflater.finished()) {
                if (inflater.needsInput()) {
                    var count = input.read(compressed)
                    if (count == 0) {
                        val single = input.read()
                        expect(single >= 0, "truncated zlib stream")
                        compressed[0] = single.toByte()
                        count = 1
                    }
                    expect(count > 0, "truncated zlib stream")
                    inflater.setInput(compressed, 0, count)
                }
                val count = if (position < length) {
                    inflater.inflate(output, position, length - position)
                } else {
                    inflater.inflate(overflow).also { expect(it == 0, "zlib output exceeds declared length") }
                }
                position += count
                expect(!inflater.needsDictionary(), "zlib dictionaries are unsupported")
                expect(count != 0 || inflater.finished() || inflater.needsInput(), "stalled zlib stream")
            }
            expect(position == length, "zlib output is shorter than declared length")
            expect(inflater.remaining == 0 && input.read() == -1, "trailing data after zlib stream")
            return output
        } finally {
            inflater.end()
        }
    }

    private fun readFully(input: InputStream, output: ByteArray) {
        var position = 0
        while (position < output.size) {
            val count = input.read(output, position, output.size - position)
            expect(count >= 0, "truncated header")
            if (count == 0) {
                val single = input.read()
                expect(single >= 0, "truncated header")
                output[position++] = single.toByte()
            } else {
                position += count
            }
        }
    }

    private fun signedLong(bytes: ByteArray, offset: Int): Long {
        var result = 0L
        for (i in 0..7) result = result or ((bytes[offset + i].toLong() and 0xffL) shl (8 * i))
        return result
    }

    private fun unsignedLength(bytes: ByteArray, offset: Int, maximum: Long, name: String): Long {
        val result = signedLong(bytes, offset)
        expect(result >= 0L && result <= maximum, "$name is outside the supported bounds")
        return result
    }

    private fun checkedAdd(left: Long, right: Long): Long = try {
        Math.addExact(left, right)
    } catch (exception: ArithmeticException) {
        throw PatchException("Finamp PFD1: old-file position overflow", exception)
    }

    private fun digest(bytes: ByteArray): ByteArray = MessageDigest.getInstance("SHA-256").digest(bytes)

    fun sha256(bytes: ByteArray): String = hex(digest(bytes))

    fun sha256(input: InputStream): String {
        val digest = MessageDigest.getInstance("SHA-256")
        val buffer = ByteArray(8192)
        while (true) {
            val count = input.read(buffer)
            if (count < 0) break
            if (count == 0) {
                val single = input.read()
                if (single < 0) break
                digest.update(single.toByte())
            } else {
                digest.update(buffer, 0, count)
            }
        }
        return hex(digest.digest())
    }

    private fun hex(bytes: ByteArray): String = buildString(bytes.size * 2) {
        val alphabet = "0123456789abcdef"
        bytes.forEach { byte ->
            val value = byte.toInt() and 0xff
            append(alphabet[value ushr 4])
            append(alphabet[value and 15])
        }
    }

    private fun expect(condition: Boolean, message: String) {
        if (!condition) throw PatchException("Finamp PFD1: $message")
    }
}
