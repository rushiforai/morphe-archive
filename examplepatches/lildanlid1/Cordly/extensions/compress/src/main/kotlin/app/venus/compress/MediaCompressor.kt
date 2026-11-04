package app.venus.compress

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.Matrix
import android.media.AudioFormat
import android.media.ExifInterface
import android.media.MediaCodec
import android.media.MediaCodecInfo
import android.media.MediaCodecList
import android.media.MediaExtractor
import android.media.MediaFormat
import android.media.MediaMuxer
import android.net.Uri
import android.os.Build
import com.facebook.react.bridge.Promise
import org.json.JSONObject
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.InputStream
import java.util.ArrayList
import java.util.Collections
import java.util.Comparator
import java.util.concurrent.LinkedBlockingQueue
import java.util.concurrent.ConcurrentHashMap
import java.util.concurrent.RejectedExecutionException
import java.util.concurrent.ThreadPoolExecutor
import java.util.concurrent.TimeUnit
import java.util.concurrent.atomic.AtomicBoolean
import java.util.regex.Pattern

/**
 * Shrinks a photo or an audio file that is over Discord's upload limit so it fits, keeping as much quality as the size allows.
 * Reached through the same Promise-bearing file bridge the voice messages use (a private URI prefix), so Discord's own
 * calls on that method are unchanged. Videos are not handled here: Discord's own transcoder does them, told what to aim for.
 * Java APIs only: the host's Kotlin helper classes are obfuscated.
 */
object MediaCompressor {
    private const val PREFIX = "venus-compress-v1:"
    private val jobId = Pattern.compile("[A-Za-z0-9_-]{1,80}")
    private val jobs = ConcurrentHashMap<String, AtomicBoolean>()
    // One at a time (each job can hold a big picture in memory), but a whole album sent at once still queues: 4 places
    // refused the sixth file.
    private val worker = ThreadPoolExecutor(1, 1, 30, TimeUnit.SECONDS, LinkedBlockingQueue<Runnable>(64),
        { task -> Thread(task, "Conduit-Compress").apply { isDaemon = true } }, ThreadPoolExecutor.AbortPolicy())
        .apply { allowCoreThreadTimeOut(true) }

    @JvmStatic
    fun dispatch(request: String, promise: Promise, context: Context): Boolean {
        if (request.length < PREFIX.length || request.substring(0, PREFIX.length) != PREFIX) return false
        try {
            val command = JSONObject(request.substring(PREFIX.length))
            val id = command.optString("id")
            require(jobId.matcher(id).matches()) { "Invalid compression job ID" }
            when (command.getString("action")) {
                "cancel" -> { jobs[id]?.set(true); promise.resolve("cancelled") }
                "release" -> {
                    val directory = File(context.cacheDir, "venus-compress")
                    val found = directory.listFiles()
                    if (found != null) for (file in found) {
                        val name = file.name
                        // Kotlin startsWith emits the host's obfuscated text helper.
                        if (name.length > id.length && name.substring(0, id.length + 1) == id + ".") file.delete()
                    }
                    promise.resolve("released")
                }
                "prepare" -> {
                    val uri = Uri.parse(command.getString("uri"))
                    require(uri.scheme == "content" || uri.scheme == "file") { "Only local files are accepted" }
                    val kind = command.getString("kind")
                    require(kind == "image" || kind == "audio") { "Unknown media kind" }
                    val limit = command.getLong("limit")
                    val budget = command.getLong("budget")
                    require(limit > 0 && budget in 1..limit) { "Invalid size limits" }
                    val cancelled = AtomicBoolean(false)
                    check(jobs.putIfAbsent(id, cancelled) == null) { "Compression job already exists" }
                    try {
                        worker.execute {
                            try {
                                val app = context.applicationContext
                                val result = if (kind == "image") compressImage(app, uri, limit, budget, id, cancelled)
                                    else compressAudio(app, uri, limit, budget, id, cancelled)
                                promise.resolve(result.toString())
                            } catch (error: Throwable) {
                                // OutOfMemoryError too: left unanswered, the upload waited forever.
                                promise.reject("VENUS_COMPRESS", error.message ?: "Compression failed")
                            } finally { jobs.remove(id, cancelled) }
                        }
                    } catch (_: RejectedExecutionException) {
                        jobs.remove(id, cancelled)
                        promise.reject("VENUS_BUSY", "Compression queue is full; try again shortly")
                    }
                }
                else -> throw IllegalArgumentException("Unknown compression action")
            }
        } catch (error: Exception) {
            promise.reject("VENUS_COMPRESS", error.message ?: "Invalid compression request")
        }
        return true
    }

    private fun unchanged(size: Long): JSONObject = JSONObject().put("changed", false).put("size", size)

    private fun outputDirectory(context: Context): File {
        val directory = File(context.cacheDir, "venus-compress")
        check(directory.isDirectory || directory.mkdirs()) { "Compression cache directory unavailable" }
        // Files are removed when their upload ends ("release"); this only sweeps what a crash left behind. A file from the last
        // half hour may still be waiting to upload (an album sends many at once), so it is never swept by count.
        val now = System.currentTimeMillis()
        val old = ArrayList<File>()
        val cached = directory.listFiles()
        if (cached != null) for (file in cached) {
            val age = now - file.lastModified()
            if (age > 6 * 3600000L) file.delete() else if (age > 30 * 60000L) old.add(file)
        }
        Collections.sort(old, Comparator { left, right -> java.lang.Long.compare(left.lastModified(), right.lastModified()) })
        var prune = 0
        while (prune < old.size - 15) old[prune++].delete()
        return directory
    }

    private fun sourceSize(context: Context, uri: Uri): Long {
        if (uri.scheme == "file") return File(uri.path ?: return -1L).length()
        var size = -1L
        try {
            val descriptor = context.contentResolver.openAssetFileDescriptor(uri, "r")
            if (descriptor != null) {
                try { size = descriptor.length } finally { try { descriptor.close() } catch (_: Exception) { } }
            }
        } catch (_: Exception) { }
        if (size >= 0) return size
        // Providers that cannot say: count the bytes.
        val stream = context.contentResolver.openInputStream(uri) ?: return -1L
        try {
            val buffer = ByteArray(65536)
            var total = 0L
            while (true) {
                val read = stream.read(buffer)
                if (read < 0) break
                total += read
            }
            return total
        } finally { try { stream.close() } catch (_: Exception) { } }
    }

    private fun open(context: Context, uri: Uri): InputStream =
        checkNotNull(context.contentResolver.openInputStream(uri)) { "File is inaccessible" }

    // ---------------------------------------------------------------- photos

    private fun orientation(context: Context, uri: Uri): Int {
        val stream = open(context, uri)
        try {
            return ExifInterface(stream).getAttributeInt(ExifInterface.TAG_ORIENTATION, ExifInterface.ORIENTATION_NORMAL)
        } catch (_: Exception) {
            return ExifInterface.ORIENTATION_NORMAL
        } finally { try { stream.close() } catch (_: Exception) { } }
    }

    private fun upright(bitmap: Bitmap, exif: Int): Bitmap {
        val matrix = Matrix()
        when (exif) {
            ExifInterface.ORIENTATION_ROTATE_90 -> matrix.postRotate(90f)
            ExifInterface.ORIENTATION_ROTATE_180 -> matrix.postRotate(180f)
            ExifInterface.ORIENTATION_ROTATE_270 -> matrix.postRotate(270f)
            ExifInterface.ORIENTATION_FLIP_HORIZONTAL -> matrix.postScale(-1f, 1f)
            ExifInterface.ORIENTATION_FLIP_VERTICAL -> matrix.postScale(1f, -1f)
            ExifInterface.ORIENTATION_TRANSPOSE -> { matrix.postRotate(90f); matrix.postScale(-1f, 1f) }
            ExifInterface.ORIENTATION_TRANSVERSE -> { matrix.postRotate(270f); matrix.postScale(-1f, 1f) }
            else -> return bitmap
        }
        val turned = Bitmap.createBitmap(bitmap, 0, 0, bitmap.width, bitmap.height, matrix, true)
        if (turned !== bitmap) bitmap.recycle()
        return turned
    }

    private fun encode(bitmap: Bitmap, format: Bitmap.CompressFormat, quality: Int): ByteArray {
        val out = ByteArrayOutputStream(1 shl 20)
        check(bitmap.compress(format, quality, out)) { "Image encoder failed" }
        return out.toByteArray()
    }

    /** The best encode that fits (or null), and how big the lowest allowed quality came out, to size the next try from. */
    private class Fit(val bytes: ByteArray?, val floorSize: Long)

    /**
     * The highest quality from [ceiling] down to [floor] whose result fits, found by bisection (size only ever falls with
     * quality). [floor] is tried first: when even it is too big, its size says how much smaller the picture must get.
     */
    private fun bestQuality(bitmap: Bitmap, format: Bitmap.CompressFormat, ceiling: Int, floor: Int, budget: Long,
                            cancelled: AtomicBoolean): Fit {
        check(!cancelled.get()) { "Compression cancelled" }
        val atFloor = encode(bitmap, format, floor)
        if (atFloor.size > budget) return Fit(null, atFloor.size.toLong())
        var best = atFloor
        var low = floor + 1
        var high = ceiling
        while (low <= high) {
            check(!cancelled.get()) { "Compression cancelled" }
            val middle = (low + high) / 2
            val bytes = encode(bitmap, format, middle)
            if (bytes.size <= budget) { best = bytes; low = middle + 1 } else high = middle - 1
        }
        return Fit(best, atFloor.size.toLong())
    }

    private fun compressImage(context: Context, uri: Uri, limit: Long, budget: Long, id: String, cancelled: AtomicBoolean): JSONObject {
        check(!cancelled.get()) { "Compression cancelled" }
        val size = sourceSize(context, uri)
        if (size in 0..limit) return unchanged(size)
        val bounds = BitmapFactory.Options()
        bounds.inJustDecodeBounds = true
        val boundsStream = open(context, uri)
        try { BitmapFactory.decodeStream(boundsStream, null, bounds) } finally { try { boundsStream.close() } catch (_: Exception) { } }
        val mime = bounds.outMimeType ?: ""
        // Animated GIFs cannot be re-encoded without losing the animation; leave them for Discord to refuse.
        if (bounds.outWidth <= 0 || bounds.outHeight <= 0 || mime == "image/gif") return unchanged(size)
        // At most ~24 MP in memory (96 MB as ARGB): 48 MP ran phones out of memory, and nothing over the limit needs more.
        var sample = 1
        while ((bounds.outWidth / sample).toLong() * (bounds.outHeight / sample).toLong() > 24000000L) sample *= 2
        val decode = BitmapFactory.Options()
        decode.inSampleSize = sample
        val stream = open(context, uri)
        var bitmap: Bitmap?
        try { bitmap = BitmapFactory.decodeStream(stream, null, decode) } finally { try { stream.close() } catch (_: Exception) { } }
        var current = checkNotNull(bitmap) { "Could not read the picture" }
        current = upright(current, orientation(context, uri))
        check(!cancelled.get()) { "Compression cancelled" }

        val transparent = current.hasAlpha() && (mime == "image/png" || mime == "image/webp")
        val directory = outputDirectory(context)
        var bytes: ByteArray? = null
        var outWidth = 0
        var outHeight = 0
        var extension = "jpg"
        var outMime = "image/jpeg"
        try {
            if (transparent || mime == "image/png") {
                // Pixel-exact first: lossless WebP often fits a screenshot or drawing that PNG made too big.
                if (Build.VERSION.SDK_INT >= 30) {
                    val lossless = encode(current, Bitmap.CompressFormat.WEBP_LOSSLESS, 100)
                    if (lossless.size <= budget) { bytes = lossless; extension = "webp"; outMime = "image/webp" }
                }
            }
            val lossy = if (transparent) {
                extension = "webp"; outMime = "image/webp"
                if (Build.VERSION.SDK_INT >= 30) Bitmap.CompressFormat.WEBP_LOSSY else Bitmap.CompressFormat.WEBP
            } else Bitmap.CompressFormat.JPEG
            if (bytes == null) {
                // Keep the picture whole while quality 88 or better fits. Otherwise shrink it straight to the size that should
                // fit (file size follows the pixel count), always from the full picture so it is resampled once, not blurred a
                // step at a time: usually one more round instead of up to ten.
                var fit = bestQuality(current, lossy, 98, 88, budget, cancelled)
                bytes = fit.bytes
                val source = current
                var scale = 1.0
                var tries = 0
                while (bytes == null && tries < 6) {
                    val step = Math.sqrt(budget.toDouble() / Math.max(1L, fit.floorSize)) * 0.96
                    scale *= Math.max(0.5, Math.min(0.95, step))
                    if (scale < 0.2) break
                    val smaller = Bitmap.createScaledBitmap(source, Math.max(1, Math.round(source.width * scale).toInt()),
                        Math.max(1, Math.round(source.height * scale).toInt()), true)
                    if (current !== source && current !== smaller) current.recycle()
                    current = smaller
                    fit = bestQuality(current, lossy, 94, 88, budget, cancelled)
                    bytes = fit.bytes
                    tries++
                }
                if (current !== source) source.recycle()
            }
            outWidth = current.width
            outHeight = current.height
        } finally { current.recycle() }
        val result = bytes ?: return unchanged(size)
        val output = File(directory, "$id.$extension")
        val file = FileOutputStream(output)
        try { file.write(result) } finally { file.close() }
        return JSONObject().put("changed", true).put("uri", Uri.fromFile(output).toString()).put("mimeType", outMime)
            .put("extension", extension).put("size", output.length())
            .put("width", outWidth).put("height", outHeight)
    }

    // ----------------------------------------------------------------- audio

    private val AAC_RATES = intArrayOf(48000, 44100, 32000, 24000, 22050, 16000, 12000, 11025, 8000)

    /** The sample rate to encode at and how many input frames make one, or 0 when the rate has no good way down. */
    private fun decimation(rate: Int): Int {
        for (supported in AAC_RATES) if (supported == rate) return 1
        var factor = 2
        while (factor <= 8) {
            if (rate % factor == 0) for (supported in AAC_RATES) if (supported == rate / factor) return factor
            factor++
        }
        return 0
    }

    private fun compressAudio(context: Context, uri: Uri, limit: Long, budget: Long, id: String, cancelled: AtomicBoolean): JSONObject {
        check(!cancelled.get()) { "Compression cancelled" }
        val size = sourceSize(context, uri)
        if (size in 0..limit) return unchanged(size)
        val directory = outputDirectory(context)
        val output = File(directory, "$id.m4a")
        val extractor = MediaExtractor()
        var decoder: MediaCodec? = null
        var encoder: MediaCodec? = null
        var muxer: MediaMuxer? = null
        var decoderStarted = false
        var encoderStarted = false
        var muxerStarted = false
        var success = false
        val deadline = System.nanoTime() + TimeUnit.MINUTES.toNanos(15)
        fun checkActive() {
            check(!cancelled.get()) { "Compression cancelled" }
            check(System.nanoTime() < deadline) { "Compression timed out" }
        }
        try {
            extractor.setDataSource(context, uri, null)
            require(extractor.drmInitData == null) { "Protected audio is not supported" }
            val codecs = MediaCodecList(MediaCodecList.REGULAR_CODECS)
            var track = -1
            var candidate = 0
            while (candidate < extractor.trackCount) {
                val format = extractor.getTrackFormat(candidate)
                val mime = format.getString(MediaFormat.KEY_MIME)
                if (mime != null && mime.length >= 6 && mime.substring(0, 6) == "audio/" && codecs.findDecoderForFormat(format) != null) {
                    track = candidate
                    break
                }
                candidate++
            }
            require(track >= 0) { "No decodable audio track found" }
            extractor.selectTrack(track)
            val inputFormat = extractor.getTrackFormat(track)
            require(inputFormat.containsKey(MediaFormat.KEY_DURATION)) { "Audio length unknown" }
            val seconds = inputFormat.getLong(MediaFormat.KEY_DURATION) / 1000000.0
            require(seconds > 0.5) { "Audio too short" }
            // Bits for the sound itself: the budget less the container's own overhead (about 3%).
            val available = (budget * 8.0 / seconds * 0.97).toInt()
            val sourceChannels = if (inputFormat.containsKey(MediaFormat.KEY_CHANNEL_COUNT)) inputFormat.getInteger(MediaFormat.KEY_CHANNEL_COUNT) else 2
            require(sourceChannels in 1..2) { "More than two channels is not supported" }
            // Stereo while it can have 80 kbps or more (below that two channels sound worse than one good one), else mono.
            val channels = if (sourceChannels == 2 && available >= 80000) 2 else 1
            val bitrate = Math.min(available, if (channels == 2) 256000 else 160000)
            require(bitrate >= 24000) { "Too long to fit" }
            val mime = inputFormat.getString(MediaFormat.KEY_MIME)!!
            inputFormat.setInteger(MediaFormat.KEY_PCM_ENCODING, AudioFormat.ENCODING_PCM_16BIT)
            decoder = MediaCodec.createDecoderByType(mime)
            decoder.configure(inputFormat, null, null, 0)
            decoder.start()
            decoderStarted = true

            var outRate = 0
            var factor = 1
            var inChannels = sourceChannels
            var outputTrack = -1
            var encoderDone = false
            var queuedFrames = 0L
            val encodedInfo = MediaCodec.BufferInfo()
            // Frames waiting for a whole group of `factor` input frames, mono or stereo, as 16-bit samples.
            var carry = IntArray(0)
            var carryFrames = 0

            fun startEncoder(rate: Int) {
                val format = MediaFormat.createAudioFormat(MediaFormat.MIMETYPE_AUDIO_AAC, rate, channels)
                format.setInteger(MediaFormat.KEY_AAC_PROFILE, MediaCodecInfo.CodecProfileLevel.AACObjectLC)
                format.setInteger(MediaFormat.KEY_BIT_RATE, bitrate)
                format.setInteger(MediaFormat.KEY_MAX_INPUT_SIZE, 32768)
                val made = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_AUDIO_AAC)
                encoder = made
                made.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
                made.start()
                encoderStarted = true
                muxer = MediaMuxer(output.absolutePath, MediaMuxer.OutputFormat.MUXER_OUTPUT_MPEG_4)
            }
            fun drainEncoder(wait: Boolean) {
                val active = encoder ?: return
                val out = checkNotNull(muxer)
                while (!encoderDone) {
                    checkActive()
                    val index = active.dequeueOutputBuffer(encodedInfo, if (wait) 10000 else 0)
                    when {
                        index == MediaCodec.INFO_TRY_AGAIN_LATER -> return
                        index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED -> {
                            check(!muxerStarted) { "Encoder format changed twice" }
                            outputTrack = out.addTrack(active.outputFormat)
                            out.start()
                            muxerStarted = true
                        }
                        index >= 0 -> {
                            try {
                                if (encodedInfo.size > 0 && encodedInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG == 0) {
                                    check(muxerStarted) { "Encoder output missing format" }
                                    val buffer = active.getOutputBuffer(index)!!
                                    buffer.position(encodedInfo.offset)
                                    buffer.limit(encodedInfo.offset + encodedInfo.size)
                                    encodedInfo.presentationTimeUs = Math.max(0L, encodedInfo.presentationTimeUs)
                                    out.writeSampleData(outputTrack, buffer, encodedInfo)
                                }
                                if (encodedInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0) encoderDone = true
                            } finally { active.releaseOutputBuffer(index, false) }
                        }
                    }
                }
            }
            fun queuePcm(bytes: ByteArray, length: Int, eos: Boolean) {
                val active = checkNotNull(encoder)
                var position = 0
                var eosSubmitted = false
                while (position < length || (eos && !eosSubmitted)) {
                    checkActive()
                    drainEncoder(false)
                    val index = active.dequeueInputBuffer(10000)
                    if (index < 0) { drainEncoder(true); continue }
                    val buffer = active.getInputBuffer(index)!!
                    buffer.clear()
                    val bytesPerFrame = 2 * channels
                    val take = (Math.min(buffer.remaining(), length - position) / bytesPerFrame) * bytesPerFrame
                    if (length > 0 && !eos) check(take > 0) { "Encoder input buffer too small" }
                    buffer.put(bytes, position, take)
                    val last = eos && position + take >= length
                    active.queueInputBuffer(index, 0, take, queuedFrames * 1000000L / outRate,
                        if (last) MediaCodec.BUFFER_FLAG_END_OF_STREAM else 0)
                    if (last) eosSubmitted = true
                    position += take
                    queuedFrames += (take / bytesPerFrame).toLong()
                    drainEncoder(false)
                }
            }
            /** Turn decoder output (16-bit, 1 or 2 channels) into encoder input: average groups of frames down to a supported rate, fold to mono if needed. */
            fun convert(data: ByteArray, length: Int): ByteArray {
                val frames = length / (2 * inChannels)
                val total = carryFrames + frames
                val groups = total / factor
                val out = ByteArray(groups * channels * 2)
                var written = 0
                var group = 0
                while (group < groups) {
                    var left = 0L
                    var right = 0L
                    var member = 0
                    while (member < factor) {
                        val frame = group * factor + member
                        var l: Int
                        var r: Int
                        if (frame < carryFrames) {
                            l = carry[frame * inChannels]
                            r = if (inChannels == 2) carry[frame * 2 + 1] else l
                        } else {
                            val at = (frame - carryFrames) * inChannels * 2
                            l = (data[at].toInt() and 0xFF) or (data[at + 1].toInt() shl 8)
                            r = if (inChannels == 2) (data[at + 2].toInt() and 0xFF) or (data[at + 3].toInt() shl 8) else l
                        }
                        left += l.toLong()
                        right += r.toLong()
                        member++
                    }
                    var a = (left / factor).toInt()
                    if (channels == 1) {
                        if (inChannels == 2) a = ((left + right) / (2 * factor)).toInt()
                        out[written++] = a.toByte(); out[written++] = (a shr 8).toByte()
                    } else {
                        val b = (right / factor).toInt()
                        out[written++] = a.toByte(); out[written++] = (a shr 8).toByte()
                        out[written++] = b.toByte(); out[written++] = (b shr 8).toByte()
                    }
                    group++
                }
                // Keep the frames that did not make a whole group for the next buffer.
                val rest = total - groups * factor
                val next = IntArray(rest * inChannels)
                var k = 0
                while (k < rest) {
                    val frame = groups * factor + k
                    var c = 0
                    while (c < inChannels) {
                        next[k * inChannels + c] = if (frame < carryFrames) carry[frame * inChannels + c] else {
                            val at = ((frame - carryFrames) * inChannels + c) * 2
                            (data[at].toInt() and 0xFF) or (data[at + 1].toInt() shl 8)
                        }
                        c++
                    }
                    k++
                }
                carry = next
                carryFrames = rest
                return out
            }

            var inputDone = false
            var decodedDone = false
            val decodedInfo = MediaCodec.BufferInfo()
            while (!decodedDone) {
                checkActive()
                val activeDecoder = checkNotNull(decoder)
                var fed = false
                if (!inputDone) {
                    val index = activeDecoder.dequeueInputBuffer(0)
                    if (index >= 0) {
                        val buffer = activeDecoder.getInputBuffer(index)!!
                        buffer.clear()
                        val read = extractor.readSampleData(buffer, 0)
                        if (read < 0) {
                            activeDecoder.queueInputBuffer(index, 0, 0, 0, MediaCodec.BUFFER_FLAG_END_OF_STREAM)
                            inputDone = true
                        } else {
                            activeDecoder.queueInputBuffer(index, 0, read, Math.max(0L, extractor.sampleTime), 0)
                            extractor.advance()
                            inputDone = false
                        }
                        fed = true
                    }
                }
                val index = activeDecoder.dequeueOutputBuffer(decodedInfo, if (fed) 0 else 10000)
                if (index == MediaCodec.INFO_OUTPUT_FORMAT_CHANGED) {
                    val format = activeDecoder.outputFormat
                    val pcm = if (format.containsKey(MediaFormat.KEY_PCM_ENCODING)) format.getInteger(MediaFormat.KEY_PCM_ENCODING)
                        else AudioFormat.ENCODING_PCM_16BIT
                    require(pcm == AudioFormat.ENCODING_PCM_16BIT) { "Unsupported sample format" }
                    val rate = format.getInteger(MediaFormat.KEY_SAMPLE_RATE)
                    val count = format.getInteger(MediaFormat.KEY_CHANNEL_COUNT)
                    require(count in 1..2) { "More than two channels is not supported" }
                    factor = decimation(rate)
                    require(factor > 0) { "Unsupported sample rate" }
                    // The encoder is set up once, from the first real layout; a later change is not followed.
                    if (outRate == 0) { outRate = rate / factor; inChannels = count; startEncoder(outRate) }
                    else require(rate / factor == outRate && count == inChannels) { "Audio layout changed" }
                } else if (index >= 0) {
                    var pcmBytes: ByteArray? = null
                    var pcmLength = 0
                    try {
                        if (decodedInfo.size > 0 && decodedInfo.flags and MediaCodec.BUFFER_FLAG_CODEC_CONFIG == 0) {
                            check(outRate > 0) { "Decoder output missing format" }
                            val buffer = activeDecoder.getOutputBuffer(index)!!.duplicate()
                            buffer.position(decodedInfo.offset)
                            buffer.limit(decodedInfo.offset + decodedInfo.size)
                            val raw = ByteArray(decodedInfo.size)
                            buffer.get(raw)
                            pcmBytes = convert(raw, raw.size)
                            pcmLength = pcmBytes.size
                        }
                        decodedDone = decodedInfo.flags and MediaCodec.BUFFER_FLAG_END_OF_STREAM != 0
                    } finally { activeDecoder.releaseOutputBuffer(index, false) }
                    if (pcmBytes != null && pcmLength > 0) queuePcm(pcmBytes, pcmLength, false)
                }
                drainEncoder(false)
            }
            check(outRate > 0 && queuedFrames > 0) { "Empty audio stream" }
            queuePcm(ByteArray(0), 0, true)
            while (!encoderDone) drainEncoder(true)
            checkActive()
            checkNotNull(muxer).stop()
            muxerStarted = false
            val length = output.length()
            require(length > 0) { "Encoder produced an empty file" }
            // Never hand back something that is no smaller than what we were given.
            if (length >= size && size >= 0) return unchanged(size)
            success = true
            return JSONObject().put("changed", true).put("uri", Uri.fromFile(output).toString()).put("mimeType", "audio/mp4")
                .put("extension", "m4a").put("size", length)
        } finally {
            if (decoder != null) {
                if (decoderStarted) try { decoder.stop() } catch (_: Exception) { }
                try { decoder.release() } catch (_: Exception) { }
            }
            val made = encoder
            if (made != null) {
                if (encoderStarted) try { made.stop() } catch (_: Exception) { }
                try { made.release() } catch (_: Exception) { }
            }
            val out = muxer
            if (out != null) {
                if (muxerStarted) try { out.stop() } catch (_: Exception) { }
                try { out.release() } catch (_: Exception) { }
            }
            try { extractor.release() } catch (_: Exception) { }
            if (!success) output.delete()
        }
    }
}
