package app.venus.extension

import java.io.InputStream
import java.io.EOFException
import java.nio.ByteBuffer
import java.nio.ByteOrder

/**
 * Bounded streaming PCM container reader for WAV/RIFX/RF64/BW64 and AIFF/AIFF-C. Plain PCM, IEEE
 * float and G.711 A-law/mu-law are decoded here; any other codec makes [open] return null so the
 * caller falls back to Android's MediaExtractor (ADPCM, GSM, MP3-in-WAV, ima4, ...).
 */
class PcmFileInput private constructor(
    private val input: InputStream, val rate: Int, val channels: Int,
    private val bits: Int, private val floating: Boolean, private val little: Boolean,
    private val unsigned8: Boolean, private var remaining: Long, private val law: Int
) {
    init {
        require(rate in 8000..192000 && channels in 1..8) { "Unsupported PCM layout" }
        require(bits == 8 || bits == 16 || bits == 24 || bits == 32 || floating && bits == 64) { "Unsupported PCM bit depth" }
        require(!floating || bits == 32 || bits == 64) { "Unsupported floating PCM" }
        require(law == LAW_NONE || bits == 8 && !floating) { "Invalid G.711 layout" }
        // Damaged/cut recordings: drop a trailing partial frame instead of rejecting the file.
        if (remaining > 0) remaining -= remaining % (channels * (bits / 8))
        require(remaining != 0L) { "Empty PCM data" }
        require(remaining < 0 || remaining / (channels * (bits / 8)) <= rate.toLong() * 1200) { "Audio exceeds 20 minutes" }
    }

    /** Next block as little-endian float samples, or null at the end. remaining < 0 streams to EOF. */
    fun readFrames(): ByteBuffer? {
        if (remaining == 0L) return null
        val frameBytes = channels * (bits / 8)
        // Sized data reads exactly its chunk; unsized (streamed/RF64) data reads to EOF. A file cut
        // short (interrupted recorder/download) keeps every complete frame instead of failing.
        val want = if (remaining > 0) Math.min(remaining, frameBytes * 1024L).toInt() else frameBytes * 1024
        val bytes = ByteArray(want)
        var size = 0
        while (size < want) {
            val n = input.read(bytes, size, want - size)
            if (n < 0) break
            if (n == 0) { val one = input.read(); if (one < 0) break; bytes[size++] = one.toByte() } else size += n
        }
        val complete = size == want
        size -= size % frameBytes
        if (remaining > 0) remaining -= want
        if (!complete) remaining = 0L
        if (size == 0) { remaining = 0L; return null }
        val source = ByteBuffer.wrap(bytes, 0, size).order(if (little) ByteOrder.LITTLE_ENDIAN else ByteOrder.BIG_ENDIAN)
        val result = ByteBuffer.allocate(size / (bits / 8) * 4).order(ByteOrder.LITTLE_ENDIAN)
        while (source.hasRemaining()) {
            val value = if (law == LAW_MU) mulaw(source.get().toInt() and 255) / 32768.0
            else if (law == LAW_A) alaw(source.get().toInt() and 255) / 32768.0
            else if (floating) {
                if (bits == 64) source.double else source.float.toDouble()
            } else when (bits) {
                8 -> if (unsigned8) ((source.get().toInt() and 255) - 128) / 128.0 else source.get().toInt() / 128.0
                16 -> source.short.toDouble() / 32768.0
                24 -> {
                    val a = source.get().toInt() and 255
                    val b = source.get().toInt() and 255
                    val c = source.get().toInt() and 255
                    val raw = if (little) a or (b shl 8) or (c shl 16) else c or (b shl 8) or (a shl 16)
                    ((raw shl 8) shr 8) / 8388608.0
                }
                else -> source.int.toDouble() / 2147483648.0
            }
            require(java.lang.Double.isFinite(value)) { "Non-finite PCM sample" }
            result.putFloat(Math.max(-1.0, Math.min(1.0, value)).toFloat())
        }
        result.flip()
        return result
    }

    companion object {
        private const val LAW_NONE = 0
        private const val LAW_A = 1
        private const val LAW_MU = 2

        /** ITU-T G.711 mu-law to linear PCM16. */
        @JvmStatic
        fun mulaw(code: Int): Int {
            val u = code.inv() and 255
            val magnitude = ((((u and 15) shl 3) + 0x84) shl ((u shr 4) and 7)) - 0x84
            return if (u and 128 != 0) -magnitude else magnitude
        }
        /** ITU-T G.711 A-law to linear PCM16. */
        @JvmStatic
        fun alaw(code: Int): Int {
            val a = code xor 0x55
            val segment = (a shr 4) and 7
            var magnitude = (a and 15) shl 4
            magnitude = if (segment == 0) magnitude + 8 else (magnitude + 0x108) shl (segment - 1)
            return if (a and 128 != 0) magnitude else -magnitude
        }

        private fun read(input: InputStream, count: Int): ByteArray {
            val result = ByteArray(count)
            var offset = 0
            while (offset < count) {
                val size = input.read(result, offset, count - offset)
                if (size < 0) throw EOFException("Truncated audio container")
                if (size == 0) {
                    val value = input.read()
                    if (value < 0) throw EOFException("Truncated audio container")
                    result[offset++] = value.toByte()
                } else offset += size
            }
            return result
        }
        private fun skip(input: InputStream, count: Long) {
            var remaining = count
            val buffer = ByteArray(8192)
            while (remaining > 0) {
                val size = input.read(buffer, 0, Math.min(remaining, buffer.size.toLong()).toInt())
                if (size < 0) throw EOFException("Truncated audio metadata")
                if (size == 0) {
                    if (input.read() < 0) throw EOFException("Truncated audio metadata")
                    remaining--
                } else remaining -= size
            }
        }
        private fun tag(bytes: ByteArray, offset: Int): String = String(bytes, offset, 4, java.nio.charset.StandardCharsets.US_ASCII)

        /** Returns null for other containers; caller closes/reopens its stream for MediaExtractor. */
        fun open(input: InputStream): PcmFileInput? {
            val header = try { read(input, 12) } catch (_: EOFException) { return null }
            val kind = tag(header, 0)
            val wave = (kind == "RIFF" || kind == "RIFX" || kind == "RF64" || kind == "BW64") && tag(header, 8) == "WAVE"
            val aiff = kind == "FORM" && (tag(header, 8) == "AIFF" || tag(header, 8) == "AIFC")
            if (!wave && !aiff) return null
            var little = wave && kind != "RIFX"
            val order = if (little) ByteOrder.LITTLE_ENDIAN else ByteOrder.BIG_ENDIAN
            val declared = ByteBuffer.wrap(header).order(order).getInt(4).toLong() and 0xffffffffL
            // RF64/BW64 or streaming writers (0 / 0xFFFFFFFF): sizes are unreliable, stream the data chunk.
            val unsized = wave && (kind == "RF64" || kind == "BW64" || declared == 0L || declared == 0xffffffffL)
            var budget = if (unsized) Long.MAX_VALUE / 4 else declared - 4
            var law = LAW_NONE
            var channels = 0
            var rate = 0
            var bits = 0
            var floating = false
            var metadata = 0L
            var declaredFrames = -1L
            while (budget >= 8) {
                val chunk = read(input, 8)
                val name = tag(chunk, 0)
                val size = ByteBuffer.wrap(chunk).order(order).getInt(4).toLong() and 0xffffffffL
                budget -= 8
                val streamData = wave && name == "data" && (unsized || size == 0L || size == 0xffffffffL || size > budget)
                if (!streamData) require(size <= budget) { "Audio chunk exceeds container bounds" }
                if (wave && name == "data" || aiff && name == "SSND") {
                    require(channels > 0 && rate > 0) { "Audio data precedes format metadata" }
                    var dataSize = if (streamData) -1L else size
                    if (aiff) {
                        require(size >= 8) { "Invalid AIFF sound chunk" }
                        val sound = ByteBuffer.wrap(read(input, 8)).order(ByteOrder.BIG_ENDIAN)
                        val offset = sound.int.toLong() and 0xffffffffL
                        require(offset <= size - 8) { "Invalid AIFF data offset" }
                        skip(input, offset)
                        dataSize = size - 8 - offset
                        require(declaredFrames >= 0) { "AIFF frame count missing" }
                        // Trust the smaller of COMM frames and SSND bytes (some writers pad or truncate).
                        dataSize = Math.min(dataSize, declaredFrames * channels * (bits / 8))
                    }
                    return PcmFileInput(input, rate, channels, bits, floating, little, wave && law == LAW_NONE, dataSize, law)
                }
                metadata += size + 8
                require(metadata <= 16 * 1024 * 1024) { "Audio metadata exceeds safety limit" }
                if (wave && name == "fmt ") {
                    require(size in 16..1024) { "Invalid WAV format chunk" }
                    val bytes = read(input, size.toInt())
                    val fmt = ByteBuffer.wrap(bytes).order(order)
                    var codec = fmt.short.toInt() and 65535
                    channels = fmt.short.toInt() and 65535
                    rate = fmt.int
                    fmt.int
                    val alignment = fmt.short.toInt() and 65535
                    bits = fmt.short.toInt() and 65535
                    if (codec == 65534) {
                        require(size >= 40 && (fmt.getShort(16).toInt() and 65535) >= 22) { "Invalid extensible WAV" }
                        val validBits = fmt.getShort(18).toInt() and 65535
                        require(validBits in 1..bits) { "Invalid WAV valid bit count" }
                        codec = fmt.getInt(24)
                        val guid = byteArrayOf(0, 0, 16, 0, -128, 0, 0, -86, 0, 56, -101, 113)
                        for (i in guid.indices) if (bytes[28 + i] != guid[i]) return null // vendor subtype: Android decoder
                    }
                    // Other codecs (ADPCM, GSM, MPEG, ...): let Android's extractor/decoder handle them.
                    if (codec != 1 && codec != 3 && codec != 6 && codec != 7) return null
                    floating = codec == 3
                    law = if (codec == 6) LAW_A else if (codec == 7) LAW_MU else LAW_NONE
                    if (law != LAW_NONE) require(bits == 8) { "Invalid G.711 WAV bit depth" }
                    require(bits > 0 && bits % 8 == 0 && alignment == channels * (bits / 8)) { "Invalid WAV block alignment" }
                } else if (aiff && name == "COMM") {
                    require(size in 18..1024) { "Invalid AIFF format chunk" }
                    val bytes = read(input, size.toInt())
                    val fmt = ByteBuffer.wrap(bytes).order(ByteOrder.BIG_ENDIAN)
                    channels = fmt.short.toInt() and 65535
                    declaredFrames = fmt.int.toLong() and 0xffffffffL
                    bits = fmt.short.toInt() and 65535
                    val exponent = fmt.short.toInt() and 65535
                    require(exponent in 1..32766) { "Invalid AIFF sample rate" }
                    val high = fmt.int.toLong() and 0xffffffffL
                    val low = fmt.int.toLong() and 0xffffffffL
                    val exactRate = Math.scalb(high.toDouble() * 4294967296.0 + low, exponent - 16383 - 63)
                    require(java.lang.Double.isFinite(exactRate) && exactRate >= 8000 && exactRate <= 192000 && Math.abs(exactRate - Math.rint(exactRate)) < 0.001) { "Unsupported AIFF sample rate" }
                    rate = Math.rint(exactRate).toInt()
                    if (tag(header, 8) == "AIFC") {
                        require(size >= 22) { "Missing AIFF-C codec" }
                        val codec = tag(bytes, 18)
                        val lawCodec = codec == "ulaw" || codec == "ULAW" || codec == "alaw" || codec == "ALAW"
                        if (!lawCodec && codec != "NONE" && codec != "twos" && codec != "sowt" && codec != "fl32" && codec != "FL32" && codec != "fl64" && codec != "FL64") return null
                        little = codec == "sowt"
                        floating = codec == "fl32" || codec == "FL32" || codec == "fl64" || codec == "FL64"
                        if (lawCodec) {
                            law = if (codec == "ulaw" || codec == "ULAW") LAW_MU else LAW_A
                            bits = 8 // COMM reports 16 for decoded G.711 in many writers
                        }
                        require(!floating || bits == if (codec == "fl64" || codec == "FL64") 64 else 32) { "AIFF-C float bit depth mismatch" }
                    }
                } else skip(input, size)
                if (size and 1L != 0L) { require(budget > size) { "Missing audio chunk padding" }; skip(input, 1) }
                budget -= size + (size and 1L)
            }
            throw IllegalArgumentException("Missing PCM audio data")
        }
    }
}
