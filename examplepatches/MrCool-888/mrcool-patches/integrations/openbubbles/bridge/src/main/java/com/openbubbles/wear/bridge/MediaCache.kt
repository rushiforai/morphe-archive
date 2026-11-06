package com.openbubbles.wear.bridge

import android.content.Context
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.ImageDecoder
import android.net.Uri
import android.media.MediaDataSource
import android.media.MediaMetadataRetriever
import android.util.Log
import com.openbubbles.wear.protocol.Protocol
import com.openbubbles.wear.protocol.WireMessage
import com.openbubbles.wear.protocol.WireThread
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.io.InputStream
import java.nio.ByteBuffer
import kotlin.math.max
import kotlin.math.roundToInt

/** An image URI carried by a notification, before it is copied into the cache. */
data class MediaSource(
    val uri: Uri,
    val mimeType: String?
)

data class MediaInfo(
    val id: String,
    val file: File,
    val mimeType: String,
    val width: Int,
    val height: Int,
    val size: Long,
    val createdAt: Long
)

/**
 * Copies notification image attachments into app-private storage while the
 * notification listener still holds the URI grant. Static images are
 * downscaled for the watch; GIFs and animated WebPs are preserved when they
 * fit the transfer budget, otherwise their first frame is used.
 */
class MediaCache(context: Context) {
    private val appContext = context.applicationContext
    private val directory = File(appContext.filesDir, DIRECTORY_NAME)
    private val prefs = appContext.getSharedPreferences(PREFS_NAME, Context.MODE_PRIVATE)
    private val lock = Any()
    private val records = loadRecords()

    init {
        directory.mkdirs()
    }

    fun ingest(
        thread: WireThread,
        sources: Map<String, MediaSource>,
        previous: WireThread? = null
    ): WireThread {
        val priorById = previous?.messages?.associateBy { it.id }.orEmpty()
        val messages = thread.messages.map { message ->
            val info = when (val source = sources[message.id]) {
                null -> message.mediaId?.let(::info)
                    ?: priorById[message.id]?.mediaId?.let(::info)
                else -> ingestOne(message.id, source)
                    ?: priorById[message.id]?.mediaId?.let(::info)
            }
            val enriched = if (info != null) message.withMedia(info) else message
            priorById[message.id]?.let(enriched::mergeMediaFrom) ?: enriched
        }
        return thread.copy(messages = messages)
    }

    fun info(mediaId: String): MediaInfo? = synchronized(lock) {
        val record = records[mediaId] ?: return@synchronized null
        if (!record.file.exists() || record.file.length() <= 0L) {
            records.remove(mediaId)
            prefs.edit().remove(KEY_PREFIX + mediaId).apply()
            return@synchronized null
        }
        record
    }

    fun count(): Int = synchronized(lock) {
        records.keys.count { records[it]?.file?.exists() == true }
    }

    /**
     * Drops unreferenced media and enforces a small LRU cap. Called after a
     * sync so the cache does not grow without bound.
     */
    fun prune(keepIds: Set<String>) {
        synchronized(lock) {
            val referenced = records.values
                .filter { it.id in keepIds && it.file.exists() }
                .sortedBy { it.createdAt }
            val kept = mutableSetOf<String>()
            var total = 0L
            for (record in referenced.asReversed()) {
                if (kept.size >= MAX_CACHE_FILES) break
                if (kept.isNotEmpty() && total + record.size > MAX_CACHE_BYTES) break
                kept += record.id
                total += record.size
            }
            val stale = records.values.filter { it.id !in kept }
            stale.forEach { record ->
                records.remove(record.id)
                record.file.delete()
                prefs.edit().remove(KEY_PREFIX + record.id).apply()
            }
            // Remove orphaned files and interrupted temp writes.
            val keptFiles = records.values.map { it.file.name }.toSet()
            directory.listFiles()
                ?.filter { file -> file.isFile && file.name !in keptFiles }
                ?.forEach { it.delete() }
        }
    }

    fun clear() {
        synchronized(lock) {
            records.clear()
            prefs.edit().clear().apply()
            directory.listFiles()?.forEach { it.delete() }
        }
    }

    private fun ingestOne(messageId: String, source: MediaSource): MediaInfo? {
        val declared = Protocol.normalizeMimeType(source.mimeType)
        if (declared != null) {
            if (Protocol.isImageMimeType(declared)) {
                info(Protocol.mediaId(messageId, declared))?.let { return it }
            } else if (declared != "application/octet-stream") {
                // Video, audio, and document attachments are not viewable on
                // the watch; avoid copying their bytes into the image cache.
                return null
            }
        }
        val bytes = readBytes(source.uri) ?: return null
        val mime = detectMime(bytes, source.mimeType)
        if (!Protocol.isImageMimeType(mime)) return null
        val stableMime = Protocol.normalizeMimeType(source.mimeType)
            ?.takeIf(Protocol::isImageMimeType)
            ?: mime
        val mediaId = Protocol.mediaId(messageId, stableMime)
        info(mediaId)?.let { return it }

        val prepared = prepare(bytes, mime) ?: return null
        val fileName = mediaId + "." + extensionFor(prepared.mimeType)
        val target = File(directory, fileName)
        val temp = File(directory, "$fileName.tmp")
        return runCatching {
            temp.outputStream().use { out -> out.write(prepared.bytes) }
            if (target.exists()) target.delete()
            if (!temp.renameTo(target)) {
                temp.copyTo(target, overwrite = true)
                temp.delete()
            }
            val info = MediaInfo(
                id = mediaId,
                file = target,
                mimeType = prepared.mimeType,
                width = prepared.width,
                height = prepared.height,
                size = target.length(),
                createdAt = System.currentTimeMillis()
            )
            synchronized(lock) {
                records[mediaId] = info
                prefs.edit().putString(KEY_PREFIX + mediaId, encodeRecord(info)).apply()
            }
            info
        }.onFailure {
            Log.w(TAG, "Unable to cache media for $messageId", it)
            temp.delete()
        }.getOrNull()
    }

    private fun readBytes(uri: Uri): ByteArray? = runCatching {
        val stream: InputStream? = when (uri.scheme) {
            "file" -> uri.path?.let { FileInputStream(it) }
            else -> appContext.contentResolver.openInputStream(uri)
        }
        stream?.use { input ->
            val output = ByteArrayOutputStream()
            val buffer = ByteArray(DEFAULT_BUFFER_SIZE)
            var total = 0
            while (true) {
                val read = input.read(buffer)
                if (read < 0) break
                total += read
                if (total > MAX_SOURCE_BYTES) {
                    throw IllegalArgumentException("Attachment is larger than the media limit")
                }
                output.write(buffer, 0, read)
            }
            output.toByteArray()
        }
    }.onFailure {
        Log.w(TAG, "Unable to read attachment $uri", it)
    }.getOrNull()

    private fun prepare(bytes: ByteArray, mimeType: String): Prepared? {
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeByteArray(bytes, 0, bytes.size, bounds)
        val sourceWidth = bounds.outWidth
        val sourceHeight = bounds.outHeight

        if ((mimeType == "image/gif" || mimeType == "image/webp") &&
            bytes.size <= MAX_ANIMATED_BYTES
        ) {
            if (sourceWidth > 0 && sourceHeight > 0) {
                return Prepared(bytes, mimeType, sourceWidth, sourceHeight)
            }
        }

        val bitmap = decodeStatic(bytes, mimeType) ?: return null
        val scaled = scaleForWatch(bitmap)
        val compressed = compressForTravel(scaled)
        val width = scaled.width
        val height = scaled.height
        if (scaled !== bitmap) bitmap.recycle()
        scaled.recycle()
        if (compressed == null) return null
        return Prepared(
            bytes = compressed,
            mimeType = "image/webp",
            width = width,
            height = height
        )
    }

    private fun decodeStatic(bytes: ByteArray, mimeType: String): Bitmap? {
        runCatching {
            val source = ImageDecoder.createSource(ByteBuffer.wrap(bytes))
            return ImageDecoder.decodeBitmap(source) { decoder, info, _ ->
                decoder.allocator = ImageDecoder.ALLOCATOR_SOFTWARE
                decoder.isMutableRequired = false
                val width = info.size.width
                val height = info.size.height
                val longest = max(width, height)
                if (longest > MAX_DIMENSION) {
                    val scale = MAX_DIMENSION.toFloat() / longest
                    decoder.setTargetSize(
                        (width * scale).roundToInt().coerceAtLeast(1),
                        (height * scale).roundToInt().coerceAtLeast(1)
                    )
                }
            }
        }.onFailure {
            Log.d(TAG, "ImageDecoder failed; trying BitmapFactory", it)
        }

        val bitmap = runCatching {
            val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
            BitmapFactory.decodeByteArray(bytes, 0, bytes.size, bounds)
            var sample = 1
            while (max(bounds.outWidth, bounds.outHeight) / sample > MAX_DIMENSION * 2) {
                sample *= 2
            }
            val options = BitmapFactory.Options().apply { inSampleSize = sample }
            BitmapFactory.decodeByteArray(bytes, 0, bytes.size, options)
        }.onFailure {
            Log.w(TAG, "Unable to decode attachment", it)
        }.getOrNull()
        if (bitmap != null) return bitmap
        if (mimeType != "image/heic" && mimeType != "image/heif") return null
        // HEIF sequences can expose a valid video frame even when ImageDecoder rejects them.
        return runCatching {
            MediaMetadataRetriever().use { reader ->
                reader.setDataSource(object : MediaDataSource() {
                    override fun getSize() = bytes.size.toLong()
                    override fun close() = Unit
                    override fun readAt(position: Long, buffer: ByteArray, offset: Int, size: Int): Int {
                        if (size == 0) return 0
                        if (position < 0 || position >= bytes.size) return -1
                        val count = minOf(size, bytes.size - position.toInt())
                        bytes.copyInto(buffer, offset, position.toInt(), position.toInt() + count)
                        return count
                    }
                })
                reader.getScaledFrameAtTime(0, MediaMetadataRetriever.OPTION_CLOSEST_SYNC, MAX_DIMENSION, MAX_DIMENSION)
            }
        }.onFailure { Log.d(TAG, "HEIF sequence frame unavailable", it) }.getOrNull()
    }

    private fun scaleForWatch(bitmap: Bitmap): Bitmap {
        val longest = max(bitmap.width, bitmap.height)
        if (longest <= MAX_DIMENSION) return bitmap
        val scale = MAX_DIMENSION.toFloat() / longest
        return Bitmap.createScaledBitmap(
            bitmap,
            (bitmap.width * scale).roundToInt().coerceAtLeast(1),
            (bitmap.height * scale).roundToInt().coerceAtLeast(1),
            true
        )
    }

    private fun compressForTravel(bitmap: Bitmap): ByteArray? {
        var candidate = bitmap
        var ownsCandidate = false
        val attempts = listOf(
            MAX_DIMENSION to QUALITY,
            720 to 76,
            560 to 70
        )
        attempts.forEach { (dimension, quality) ->
            if (max(candidate.width, candidate.height) > dimension) {
                val scale = dimension.toFloat() / max(candidate.width, candidate.height)
                val next = Bitmap.createScaledBitmap(
                    candidate,
                    (candidate.width * scale).roundToInt().coerceAtLeast(1),
                    (candidate.height * scale).roundToInt().coerceAtLeast(1),
                    true
                )
                if (ownsCandidate) candidate.recycle()
                candidate = next
                ownsCandidate = true
            }
            val output = ByteArrayOutputStream()
            candidate.compress(Bitmap.CompressFormat.WEBP_LOSSY, quality, output)
            val bytes = output.toByteArray()
            if (bytes.size <= MAX_STATIC_BYTES || dimension == 560) {
                if (ownsCandidate) candidate.recycle()
                return bytes
            }
        }
        if (ownsCandidate) candidate.recycle()
        return null
    }

    private fun WireMessage.withMedia(info: MediaInfo): WireMessage = copy(
        attachment = true,
        mediaId = info.id,
        mediaMime = info.mimeType,
        mediaWidth = info.width,
        mediaHeight = info.height,
        mediaSize = info.size
    )

    private fun loadRecords(): MutableMap<String, MediaInfo> {
        val loaded = mutableMapOf<String, MediaInfo>()
        prefs.all.forEach { (key, value) ->
            if (!key.startsWith(KEY_PREFIX) || value !is String) return@forEach
            val record = decodeRecord(key.removePrefix(KEY_PREFIX), value) ?: return@forEach
            if (record.file.exists()) loaded[record.id] = record
        }
        return loaded
    }

    private fun encodeRecord(info: MediaInfo): String = listOf(
        info.mimeType,
        info.width.toString(),
        info.height.toString(),
        info.size.toString(),
        info.createdAt.toString(),
        info.file.name
    ).joinToString("\t")

    private fun decodeRecord(id: String, raw: String): MediaInfo? {
        val parts = raw.split('\t')
        if (parts.size != 6) return null
        return runCatching {
            MediaInfo(
                id = id,
                file = File(directory, parts[5]),
                mimeType = parts[0],
                width = parts[1].toInt(),
                height = parts[2].toInt(),
                size = parts[3].toLong(),
                createdAt = parts[4].toLong()
            )
        }.getOrNull()
    }

    private fun detectMime(bytes: ByteArray, declared: String?): String {
        magicMime(bytes)?.let { return it }
        return Protocol.normalizeMimeType(declared) ?: "application/octet-stream"
    }

    private fun magicMime(bytes: ByteArray): String? {
        if (bytes.size >= 6) {
            val header = String(bytes, 0, 6, Charsets.US_ASCII)
            if (header.startsWith("GIF87a") || header.startsWith("GIF89a")) return "image/gif"
        }
        if (bytes.size >= 3 &&
            bytes[0] == 0xFF.toByte() &&
            bytes[1] == 0xD8.toByte() &&
            bytes[2] == 0xFF.toByte()
        ) {
            return "image/jpeg"
        }
        if (bytes.size >= 8 &&
            bytes[0] == 0x89.toByte() &&
            bytes[1] == 0x50.toByte() &&
            bytes[2] == 0x4E.toByte() &&
            bytes[3] == 0x47.toByte()
        ) {
            return "image/png"
        }
        if (bytes.size >= 12 &&
            String(bytes, 0, 4, Charsets.US_ASCII) == "RIFF" &&
            String(bytes, 8, 4, Charsets.US_ASCII) == "WEBP"
        ) {
            return "image/webp"
        }
        if (bytes.size >= 12 && String(bytes, 4, 4, Charsets.US_ASCII) == "ftyp") {
            return when (String(bytes, 8, 4, Charsets.US_ASCII)) {
                "heic", "heix", "hevc", "hevx", "mif1", "msf1" -> "image/heic"
                "avif", "avis" -> "image/avif"
                else -> null
            }
        }
        if (bytes.size >= 2 && bytes[0] == 'B'.code.toByte() && bytes[1] == 'M'.code.toByte()) {
            return "image/bmp"
        }
        return null
    }

    private fun extensionFor(mimeType: String): String = when (mimeType) {
        "image/gif" -> "gif"
        "image/png" -> "png"
        "image/webp" -> "webp"
        "image/jpeg" -> "jpg"
        "image/heic" -> "heic"
        "image/avif" -> "avif"
        else -> "img"
    }

    private data class Prepared(
        val bytes: ByteArray,
        val mimeType: String,
        val width: Int,
        val height: Int
    )

    private companion object {
        const val TAG = "OBWearMedia"
        const val PREFS_NAME = "openbubbles_wear_media"
        const val KEY_PREFIX = "media:"
        const val DIRECTORY_NAME = "openbubbles_wear_media_cache"
        const val MAX_DIMENSION = 960
        const val QUALITY = 82
        const val MAX_STATIC_BYTES = 600_000
        const val MAX_ANIMATED_BYTES = 6 * 1024 * 1024
        const val MAX_SOURCE_BYTES = 12 * 1024 * 1024
        const val MAX_CACHE_FILES = 80
        const val MAX_CACHE_BYTES = 80L * 1024 * 1024
    }
}
