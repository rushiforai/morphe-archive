package app.venus.extension

import android.content.Context
import android.media.AudioFormat
import android.media.MediaCodec
import android.media.MediaExtractor
import android.media.MediaFormat
import android.media.MediaCodecList
import android.media.MediaMuxer
import android.net.Uri
import android.os.Build
import com.facebook.react.bridge.Promise
import org.json.JSONObject
import java.io.File
import java.io.InputStream
import java.io.BufferedInputStream
import java.util.concurrent.ArrayBlockingQueue
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.RejectedExecutionException
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean
import java.util.ArrayList
import java.util.Collections
import java.util.Comparator
import java.util.regex.Pattern

/** Dispatch on the existing Promise-bearing file bridge, leaving ordinary getSize calls unchanged. */
object VoiceProcessor {
    private const val PREFIX = "venus-voice-v1:"
    private val jobId = Pattern.compile("[A-Za-z0-9_-]{1,80}")
    private val jobs = ConcurrentHashMap<String, AtomicBoolean>()
    private val worker = ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS, ArrayBlockingQueue<Runnable>(4),
        { task -> Thread(task, "Venus-Audio").apply { isDaemon = true } }, ThreadPoolExecutor.AbortPolicy())
        .apply { allowCoreThreadTimeOut(true) }

    @JvmStatic
    fun dispatch(request: String, promise: Promise, context: Context): Boolean {
        // Kotlin startsWith emits StringsKt.startsWith$default, absent in the obfuscated host.
        if (request.length < PREFIX.length || request.substring(0, PREFIX.length) != PREFIX) return false
        try {
            val command = JSONObject(request.substring(PREFIX.length))
            val id = command.optString("id")
            require(jobId.matcher(id).matches()) { "Invalid audio job ID" }
            when (command.getString("action")) {
                "cancel" -> { jobs[id]?.set(true); promise.resolve("cancelled") }
                "release" -> {
                    val file = File(File(context.cacheDir, "venus-voice"), "$id.ogg")
                    file.delete()
                    promise.resolve("released")
                }
                "prepare" -> {
                    if (Build.VERSION.SDK_INT < 29) {
                        promise.reject("VENUS_UNSUPPORTED", "Real Ogg/Opus conversion requires Android 10 or newer")
                        return true
                    }
                    val uri = Uri.parse(command.getString("uri"))
                    require(uri.scheme == "content" || uri.scheme == "file") { "Only local audio URIs are accepted" }
                    val cancelled = AtomicBoolean(false)
                    check(jobs.putIfAbsent(id, cancelled) == null) { "Audio job already exists" }
                    try {
                        worker.execute {
                            try { promise.resolve(convert(context.applicationContext, uri, id, cancelled).toString()) }
                            catch (error: Exception) {
                                promise.reject("VENUS_AUDIO", error.message ?: "Audio conversion failed")
                            } finally { jobs.remove(id, cancelled) }
                        }
                    } catch (_: RejectedExecutionException) {
                        jobs.remove(id, cancelled)
                        promise.reject("VENUS_BUSY", "Audio conversion queue is full; try again shortly")
                    }
                }
                else -> throw IllegalArgumentException("Unknown audio action")
            }
        } catch (error: Exception) {
            promise.reject("VENUS_AUDIO", error.message ?: "Invalid audio request")
        }
        return true
    }

    private fun convert(context: Context, uri: Uri, id: String, cancelled: AtomicBoolean): JSONObject {
        check(!cancelled.get()) { "Audio conversion cancelled" }
        val directory = File(context.cacheDir, "venus-voice")
        check(directory.isDirectory || directory.mkdirs()) { "Audio cache directory unavailable" }
        // Bound abandoned outputs; conversion retries reuse the same upload's in-flight Promise in JS.
        // Do not call Kotlin collection/text helpers: their ABIs are obfuscated in Discord.
        val old = ArrayList<File>()
        val cached = directory.listFiles()
        if (cached != null) for (file in cached) {
            val name = file.name
            if (name.length < 4 || name.substring(name.length - 4) != ".ogg") continue
            if (System.currentTimeMillis() - file.lastModified() > 6 * 3600000L) file.delete()
            if (file.exists()) old.add(file)
        }
        Collections.sort(old, Comparator { left, right -> java.lang.Long.compare(left.lastModified(), right.lastModified()) })
        var prune = 0
        while (prune < old.size - 31) old[prune++].delete()
        val output = File(directory, "$id.ogg")
        val extractor = MediaExtractor()
        var decoder: MediaCodec? = null
        var encoder: MediaCodec? = null
        var muxer: MediaMuxer? = null
        var success = false
        var muxerStarted = false
        var decoderStarted = false
        var encoderStarted = false
        var pcmStream: InputStream? = null
        var pcmSource: PcmFileInput? = null
        val deadline = System.nanoTime() + TimeUnit.MINUTES.toNanos(10)
        fun checkActive() {
            check(!cancelled.get()) { "Audio conversion cancelled" }
            check(System.nanoTime() < deadline) { "Audio conversion timed out" }
        }
        try {
            checkActive()
            pcmStream = BufferedInputStream(checkNotNull(context.contentResolver.openInputStream(uri)) { "Audio source is inaccessible" })
            // A damaged or exotic WAV/AIFF header is retried with Android's extractor instead of failing.
            pcmSource = try { PcmFileInput.open(pcmStream) } catch (_: IllegalArgumentException) { null }
                catch (_: java.io.EOFException) { null }
            if (pcmSource == null) {
                pcmStream.close()
                pcmStream = null
                extractor.setDataSource(context, uri, null)
                var track = -1
                val codecs = MediaCodecList(MediaCodecList.REGULAR_CODECS)
                var candidate = 0
                while (candidate < extractor.trackCount) {
                    val candidateMime = extractor.getTrackFormat(candidate).getString(MediaFormat.KEY_MIME)
                    if (candidateMime != null && candidateMime.length >= 6 && candidateMime.substring(0, 6) == "audio/" &&
                        codecs.findDecoderForFormat(extractor.getTrackFormat(candidate)) != null) {
                        track = candidate
                        break
                    }
                    candidate++
                }
                require(track >= 0) { "No decodable audio track found" }
                extractor.selectTrack(track)
                val inputFormat = extractor.getTrackFormat(track)
                val mime = inputFormat.getString(MediaFormat.KEY_MIME)!!
                if (inputFormat.containsKey(MediaFormat.KEY_DURATION))
                    require(inputFormat.getLong(MediaFormat.KEY_DURATION) <= 1200000000L) { "Audio exceeds 20 minutes" }
                require(extractor.drmInitData == null) { "DRM-protected audio is not supported" }
                inputFormat.setInteger(MediaFormat.KEY_PCM_ENCODING, AudioFormat.ENCODING_PCM_16BIT)
                decoder = MediaCodec.createDecoderByType(mime)
                decoder.configure(inputFormat, null, null, 0)
                decoder.start()
                decoderStarted = true
            }
            val encodedFormat = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_OPUS, 48000, 1).apply {
                setInteger(MediaFormat.KEY_BIT_RATE, 64000)
                setInteger(MediaFormat.KEY_PCM_ENCODING, AudioFormat.ENCODING_PCM_16BIT)
                setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 3840)
            }
            encoder = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_OPUS)
            encoder.configure(encodedFormat, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
            encoder.start()
            encoderStarted = true
            muxer = MediaMuxer(output.absolutePath, MediaMuxer.OutputFormat.MUXER_OUTPUT_OGG)
            var outputTrack = -1
            var encoderDone = false
            var queuedFrames = 0L
            val encodedInfo = MediaCodec.BufferInfo()
            fun drainEncoder(wait: Boolean) {
                while (!encoderDone) {
                    checkActive()
                    val index = encoder.dequeueOutputBuffer(encodedInfo, if (wait) 10000 else 0)
                    when {
                        index == MediaCodec.INFO_TRY_AGAIN_LATER -> return
                        index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED -> {
                            check(!muxerStarted) { "Encoder format changed twice" }
                            outputTrack = muxer.addTrack(encoder.outputFormat)
                            muxer.start()
                            muxerStarted = true
                        }
                        index >= 0 -> {
                            try {
                                if (encodedInfo.size > 0 && encodedInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG == 0) {
                                    check(muxerStarted) { "Encoder output missing format" }
                                    val buffer = encoder.getOutputBuffer(index)!!
                                    buffer.position(encodedInfo.offset)
                                    buffer.limit(encodedInfo.offset + encodedInfo.size)
                                    encodedInfo.presentationTimeUs = maxOf(0, encodedInfo.presentationTimeUs)
                                    muxer.writeSampleData(outputTrack, buffer, encodedInfo)
                                }
                                if (encodedInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) encoderDone = true
                            } finally { encoder.releaseOutputBuffer(index, false) }
                        }
                    }
                }
            }
            fun queuePcm(bytes: ByteArray, eos: Boolean = false) {
                var position = 0
                var eosSubmitted = false
                while (position < bytes.size || (eos && !eosSubmitted)) {
                    checkActive()
                    drainEncoder(false)
                    val index = encoder.dequeueInputBuffer(10000)
                    if (index < 0) { drainEncoder(true); continue }
                    val buffer = encoder.getInputBuffer(index)!!
                    buffer.clear()
                    val size = minOf(buffer.remaining(), bytes.size - position) and -2
                    if (bytes.isNotEmpty()) check(size > 0) { "Encoder input buffer too small" }
                    buffer.put(bytes, position, size)
                    encoder.queueInputBuffer(index, 0, size, queuedFrames * 1000000 / 48000,
                        if (eos && position + size == bytes.size) MediaCodec.BUFFER_FLAG_END_OF_STREAM else 0)
                    if (eos && position + size == bytes.size) eosSubmitted = true
                    position += size
                    queuedFrames += size / 2
                    drainEncoder(false)
                }
            }
            var inputDone = false
            var decodedDone = false
            var resampler: PcmResampler? = if (pcmSource != null) PcmResampler(pcmSource.rate, pcmSource.channels, true) else null
            val decodedInfo = MediaCodec.BufferInfo()
            if (pcmSource != null) {
                while (true) {
                    checkActive()
                    val frames = pcmSource.readFrames() ?: break
                    val converted = checkNotNull(resampler).convert(frames)
                    if (converted.isNotEmpty()) queuePcm(converted)
                }
                decodedDone = true
            }
            while (!decodedDone) {
                checkActive()
                val activeDecoder = checkNotNull(decoder) { "Audio decoder unavailable" }
                if (!inputDone) {
                    val index = activeDecoder.dequeueInputBuffer(10000)
                    if (index >= 0) {
                        val buffer = activeDecoder.getInputBuffer(index)!!
                        buffer.clear()
                        val size = extractor.readSampleData(buffer, 0)
                        if (size < 0) {
                            activeDecoder.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            inputDone = true
                        } else {
                            activeDecoder.queueInputBuffer(index, 0, size, maxOf(0, extractor.sampleTime), 0)
                            extractor.advance()
                            // Match the assignment-only EOS branch instead of returning advance()'s
                            // boolean: mixed Unit/Boolean branches generate the renamed Unit.INSTANCE.
                            inputDone = false
                        }
                    }
                }
                val index = activeDecoder.dequeueOutputBuffer(decodedInfo, 10000)
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    // HE-AAC/SBR, some Opus/Vorbis and vendor decoders announce a provisional layout and
                    // then the real one. Continue on the same 48 kHz output clock instead of failing.
                    val format = activeDecoder.outputFormat
                    val pcm = if (format.containsKey(MediaFormat.KEY_PCM_ENCODING))
                        format.getInteger(MediaFormat.KEY_PCM_ENCODING) else AudioFormat.ENCODING_PCM_16BIT
                    require(pcm == AudioFormat.ENCODING_PCM_16BIT || pcm == AudioFormat.ENCODING_PCM_FLOAT) { "Unsupported PCM encoding" }
                    val rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE)
                    val count = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT)
                    val floatPcm = pcm == AudioFormat.ENCODING_PCM_FLOAT
                    val current = resampler
                    if (current == null) resampler = PcmResampler(rate, count, floatPcm)
                    else if (!current.matches(rate, count, floatPcm)) {
                        val flushed = current.reconfigure(rate, count, floatPcm)
                        if (flushed.isNotEmpty()) queuePcm(flushed)
                    }
                } else if (index >= 0) {
                    var pcmBytes: ByteArray? = null
                    try {
                        if (decodedInfo.size > 0 && decodedInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG == 0) {
                            val buffer = activeDecoder.getOutputBuffer(index)!!.duplicate()
                            buffer.position(decodedInfo.offset)
                            buffer.limit(decodedInfo.offset + decodedInfo.size)
                            if (resampler == null) {
                                // Some decoders deliver the first buffer before INFO_OUTPUT_FORMAT_CHANGED.
                                val format = activeDecoder.outputFormat
                                val pcm = if (format.containsKey(MediaFormat.KEY_PCM_ENCODING))
                                    format.getInteger(MediaFormat.KEY_PCM_ENCODING) else AudioFormat.ENCODING_PCM_16BIT
                                require(pcm == AudioFormat.ENCODING_PCM_16BIT || pcm == AudioFormat.ENCODING_PCM_FLOAT) { "Unsupported PCM encoding" }
                                resampler = PcmResampler(format.getInteger(MediaFormat.KEY_SAMPLE_RATE),
                                    format.getInteger(MediaFormat.KEY_CHANNEL_COUNT), pcm == AudioFormat.ENCODING_PCM_FLOAT)
                            }
                            pcmBytes = checkNotNull(resampler) { "Decoder output missing format" }.convert(buffer.slice())
                        }
                        decodedDone = decodedInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0
                    } finally { activeDecoder.releaseOutputBuffer(index, false) }
                    if (pcmBytes != null && pcmBytes.isNotEmpty()) queuePcm(pcmBytes)
                }
                drainEncoder(false)
            }
            val samples = checkNotNull(resampler) { "Empty audio stream" }
            val tail = samples.finish()
            if (tail.isNotEmpty()) queuePcm(tail)
            require(samples.outputFrames > 0) { "Empty audio stream" }
            queuePcm(ByteArray(0), true)
            while (!encoderDone) drainEncoder(true)
            checkActive()
            muxer.stop()
            muxerStarted = false
            require(output.length() > 0) { "Ogg encoder produced an empty file" }
            val result = JSONObject().put("uri", Uri.fromFile(output).toString()).put("filename", "voice-message.ogg")
                .put("mimeType", "audio/ogg").put("size", output.length())
                .put("durationSecs", samples.outputFrames.toDouble() / 48000)
                .put("waveform", samples.waveform.base64())
            success = true
            return result
        } finally {
            // Explicit try/catch avoids dependencies on the host's obfuscated kotlin.Result ABI.
            // Explicit null guards keep cleanup entirely on Java/Android void APIs.
            if (decoder != null) {
                if (decoderStarted) try { decoder.stop() } catch (_: Exception) { }
                try { decoder.release() } catch (_: Exception) { }
            }
            if (encoder != null) {
                if (encoderStarted) try { encoder.stop() } catch (_: Exception) { }
                try { encoder.release() } catch (_: Exception) { }
            }
            if (muxer != null) {
                if (muxerStarted) try { muxer.stop() } catch (_: Exception) { }
                try { muxer.release() } catch (_: Exception) { }
            }
            if (pcmStream != null) try { pcmStream.close() } catch (_: Exception) { }
            try { extractor.release() } catch (_: Exception) { }
            if (!success) output.delete()
        }
    }
}
