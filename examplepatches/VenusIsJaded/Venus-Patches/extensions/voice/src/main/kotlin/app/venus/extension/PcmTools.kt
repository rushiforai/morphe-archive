package app.venus.extension

import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Base64
// Use Java math/arrays: Discord obfuscates the corresponding Kotlin stdlib helpers.

/**
 * Discord's own voice-message waveform, reproduced from the 347.12 bundle (unchanged in 348.10)
 * (modules/voice_messages VoiceMessageUtils, VoiceMessageConstants, downsampleWaveform):
 *  - one level per 100 ms (Discord throttles VoiceActivity to 100 ms);
 *  - level = WAVEFORM_WAVE_MAX_VALUE * (dB - VOICE_RECORDING_MIN_DB) / (MAX_DB - MIN_DB)
 *    with MIN_DB = -100, MAX_DB = 0 and WAVE_MAX_VALUE = 255 (absolute dBFS, no per-file normalising);
 *  - more than WAVEFORM_MAX_SAMPLES (256) levels are bucket-averaged with Math.round boundaries;
 *  - Math.min(255, v) then Uint8Array truncation.
 * The 100 ms level is the window RMS in dBFS of the 48 kHz mono signal that is actually encoded.
 */
class Waveform {
    private val levels = DoubleArray(12001)
    private var count = 0
    private var frames = 0
    private var energy = 0.0

    fun add(sample: Int) {
        energy += sample.toDouble() * sample
        if (++frames == WINDOW) flush()
    }
    private fun flush() {
        check(count < levels.size) { "Audio exceeds the 20-minute safety limit" }
        levels[count++] = level(Math.sqrt(energy / frames) / 32768.0)
        energy = 0.0
        frames = 0
    }
    /** Discord byte array, 1..256 entries. */
    fun bytes(): ByteArray {
        if (frames > 0) flush()
        if (count == 0) return ByteArray(1)
        val values = downsample(levels, count, MAX_SAMPLES)
        val result = ByteArray(values.size)
        for (i in values.indices) result[i] = (Math.min(MAX_VALUE, values[i]).toInt() and 255).toByte()
        return result
    }
    fun base64(): String = Base64.getEncoder().encodeToString(bytes())

    companion object {
        const val WINDOW = 4800 // 100 ms at 48 kHz
        const val MAX_SAMPLES = 256
        const val MAX_VALUE = 255.0
        const val MIN_DB = -100.0
        const val MAX_DB = 0.0

        /** Linear RMS amplitude (1.0 = full scale) to Discord's 0..255 level. */
        @JvmStatic
        fun level(rms: Double): Double {
            if (!(rms > 0.0)) return 0.0
            val db = 20.0 * Math.log10(rms)
            return Math.max(0.0, Math.min(MAX_VALUE, MAX_VALUE * (db - MIN_DB) / (MAX_DB - MIN_DB)))
        }

        /** Exact port of Discord's downsampleWaveform(waveform, samples). */
        @JvmStatic
        fun downsample(source: DoubleArray, length: Int, samples: Int): DoubleArray {
            if (length <= samples) return java.util.Arrays.copyOf(source, length)
            val ratio = length.toDouble() / samples
            val out = DoubleArray(samples)
            var start = 0
            for (index in 0 until samples) {
                val end = Math.round((index + 1) * ratio).toInt()
                var sum = 0.0
                var n = 0
                var i = start
                while (i < end && i < length) { sum += source[i]; n++; i++ }
                out[index] = if (n == 0) 0.0 else sum / n
                start = end
            }
            return out
        }
    }
}

/** Streaming downmix/resample to 48 kHz mono PCM16; no whole-file PCM buffering. */
class PcmResampler(private var rate: Int, private var channels: Int, private var floating: Boolean) {
    init {
        require(rate in 8000..192000 && channels in 1..8) { "Unsupported PCM layout" }
    }
    val waveform = Waveform()
    var outputFrames = 0L
        private set
    private var inputFrames = 0L
    private var nextPosition = 0.0
    private var previous = 0.0
    private var step = rate.toDouble() / 48000.0

    fun matches(rate: Int, channels: Int, floating: Boolean) =
        this.rate == rate && this.channels == channels && this.floating == floating

    /**
     * Mid-stream decoder format change (for example HE-AAC/SBR switching 22.05 -> 44.1 kHz, or a
     * decoder announcing its real layout after a provisional one). Flushes held samples, keeps the
     * output clock and waveform continuous, and returns the PCM still to be encoded.
     */
    fun reconfigure(rate: Int, channels: Int, floating: Boolean): ByteArray {
        require(rate in 8000..192000 && channels in 1..8) { "Unsupported PCM layout" }
        val tail = finish()
        this.rate = rate
        this.channels = channels
        this.floating = floating
        step = rate.toDouble() / 48000.0
        inputFrames = 0L
        nextPosition = 0.0
        previous = 0.0
        return tail
    }

    private fun write(value: Double, out: ByteArray, offset: Int) {
        check(outputFrames < 48000L * 1200) { "Audio exceeds the 20-minute safety limit" }
        val sample = Math.max(-32768L, Math.min(32767L, Math.round(value))).toInt()
        out[offset] = sample.toByte()
        out[offset + 1] = (sample shr 8).toByte()
        waveform.add(sample)
        outputFrames++
    }
    fun convert(buffer: ByteBuffer): ByteArray {
        buffer.order(ByteOrder.LITTLE_ENDIAN)
        val bytesPerFrame = channels * if (floating) 4 else 2
        require(buffer.remaining() % bytesPerFrame == 0) { "Incomplete PCM frame" }
        val frames = buffer.remaining() / bytesPerFrame
        if (frames == 0) return ByteArray(0)
        // Common decoder output: one bulk copy, no interpolation, growth or final copy.
        if (rate == 48000 && channels == 1 && !floating) {
            check(outputFrames + frames <= 48000L * 1200) { "Audio exceeds the 20-minute safety limit" }
            val out = ByteArray(buffer.remaining())
            buffer.get(out)
            var offset = 0
            while (offset < out.size) {
                waveform.add(((out[offset].toInt() and 255) or (out[offset + 1].toInt() shl 8)).toShort().toInt())
                offset += 2
            }
            outputFrames += frames
            inputFrames += frames
            nextPosition = inputFrames.toDouble()
            return out
        }
        // At most two guard samples for fractional positions across decoder chunks.
        val capacity = Math.min(Math.ceil(frames.toDouble() / step).toLong() + 2, 48000L * 1200 + 1).toInt()
        val out = ByteArray(capacity * 2)
        var offset = 0
        while (buffer.remaining() >= bytesPerFrame) {
            var sum = 0.0
            for (c in 0 until channels) sum += if (floating) buffer.float.toDouble() * 32767 else buffer.short.toDouble()
            val current = sum / channels
            if (floating) require(java.lang.Double.isFinite(current)) { "Invalid non-finite PCM sample" }
            if (inputFrames == 0L) previous = current
            while (nextPosition <= inputFrames.toDouble()) {
                val fraction = if (inputFrames == 0L) 1.0 else nextPosition - (inputFrames - 1)
                write(previous + (current - previous) * Math.max(0.0, Math.min(1.0, fraction)), out, offset)
                offset += 2
                nextPosition += step
            }
            previous = current
            inputFrames++
        }
        return if (offset == out.size) out else java.util.Arrays.copyOf(out, offset)
    }
    fun finish(): ByteArray {
        val capacity = Math.max(0, Math.ceil((inputFrames.toDouble() - nextPosition) / step).toInt()) + 1
        val out = ByteArray(capacity * 2)
        var offset = 0
        while (nextPosition < inputFrames.toDouble()) {
            write(previous, out, offset)
            offset += 2
            nextPosition += step
        }
        return if (offset == out.size) out else java.util.Arrays.copyOf(out, offset)
    }
}
