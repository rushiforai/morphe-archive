package com.openbubbles.wear.bridge

import android.Manifest
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.net.Uri
import android.provider.ContactsContract
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileInputStream
import java.security.MessageDigest
import kotlin.math.max
import kotlin.math.roundToInt

/** Small app-private cache of normalized contact thumbnails. */
object AvatarCache {
    private const val DIR = "openbubbles_wear_avatars"
    private const val MAX_SOURCE = 4 * 1024 * 1024
    private const val MAX_FILES = 200
    private const val MAX_BYTES = 6L * 1024 * 1024
    private val lock = Any()

    fun cache(context: Context, source: Uri?): String? {
        source ?: return null
        val app = context.applicationContext
        return runCatching {
            val bytes = when (source.scheme) {
                "file" -> {
                    val file = File(source.path ?: return null).canonicalFile
                    val roots = listOf(app.filesDir, File(app.getDir("flutter", Context.MODE_PRIVATE), "avatars"))
                    if (!file.isFile || roots.none { file.toPath().startsWith(it.canonicalFile.toPath()) }) return null
                    file.inputStream().use(::readBounded)
                }
                "content" -> {
                    if (source.authority != ContactsContract.AUTHORITY || !hasContacts(app)) return null
                    app.contentResolver.openInputStream(source)?.use(::readBounded) ?: return null
                }
                else -> return null
            }
            val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
            BitmapFactory.decodeByteArray(bytes, 0, bytes.size, bounds)
            if (bounds.outWidth <= 0 || bounds.outHeight <= 0) return null
            var sample = 1
            while (max(bounds.outWidth, bounds.outHeight) / sample > 256) sample *= 2
            val bitmap = BitmapFactory.decodeByteArray(bytes, 0, bytes.size,
                BitmapFactory.Options().apply { inSampleSize = sample }) ?: return null
            val longest = max(bitmap.width, bitmap.height)
            val scaled = if (longest > 128) {
                val ratio = 128f / longest
                Bitmap.createScaledBitmap(bitmap, (bitmap.width * ratio).roundToInt().coerceAtLeast(1),
                    (bitmap.height * ratio).roundToInt().coerceAtLeast(1), true).also { if (it !== bitmap) bitmap.recycle() }
            } else bitmap
            val prepared = try {
                val output = ByteArrayOutputStream()
                scaled.compress(Bitmap.CompressFormat.JPEG, 82, output)
                output.toByteArray()
            } finally {
                scaled.recycle()
            }
            val id = "avatar-" + MessageDigest.getInstance("SHA-256").digest(prepared).joinToString("") { "%02x".format(it) }
            val dir = directory(app)
            synchronized(lock) {
                dir.mkdirs()
                val target = File(dir, "$id.jpg")
                if (!target.isFile) {
                    val temp = File(dir, "$id.tmp")
                    temp.writeBytes(prepared)
                    if (!temp.renameTo(target)) { temp.delete(); return null }
                }
                target.setLastModified(System.currentTimeMillis())
                prune(dir, target)
            }
            id
        }.getOrNull()
    }

    fun forAddress(context: Context, address: String?): String? {
        if (!hasContacts(context)) return null
        val normalized = com.openbubbles.wear.protocol.Protocol.normalizeAddress(address) ?: return null
        val uri: Uri
        val projection = arrayOf(ContactsContract.Contacts.PHOTO_URI)
        val selection: String?
        val args: Array<String>?
        if (normalized.contains('@')) {
            uri = Uri.withAppendedPath(ContactsContract.CommonDataKinds.Email.CONTENT_LOOKUP_URI, Uri.encode(normalized))
            selection = null
            args = null
        } else {
            uri = Uri.withAppendedPath(ContactsContract.PhoneLookup.CONTENT_FILTER_URI, Uri.encode(normalized))
            selection = null
            args = null
        }
        return runCatching {
            context.contentResolver.query(uri, projection, selection, args, null)?.use {
                if (it.moveToFirst()) it.getString(0)?.let { raw -> cache(context, Uri.parse(raw)) } else null
            }
        }.getOrNull()
    }

    fun info(context: Context, avatarId: String): MediaInfo? = synchronized(lock) {
        if (!avatarId.matches(Regex("avatar-[0-9a-f]{64}"))) return@synchronized null
        val file = File(directory(context.applicationContext), "$avatarId.jpg")
        if (!file.isFile || file.length() <= 0) return@synchronized null
        val bounds = BitmapFactory.Options().apply { inJustDecodeBounds = true }
        BitmapFactory.decodeFile(file.path, bounds)
        if (bounds.outWidth !in 1..128 || bounds.outHeight !in 1..128) return@synchronized null
        file.setLastModified(System.currentTimeMillis())
        MediaInfo(avatarId, file, "image/jpeg", bounds.outWidth, bounds.outHeight, file.length(), file.lastModified())
    }

    fun ids(context: Context): Set<String> = synchronized(lock) {
        directory(context.applicationContext).listFiles()?.mapNotNull { f ->
            val id = f.name.removeSuffix(".jpg")
            id.takeIf { f.isFile && f.length() > 0 && f.name == "$id.jpg" && it.matches(Regex("avatar-[0-9a-f]{64}")) }
        }?.toSet().orEmpty()
    }

    fun clear(context: Context) = synchronized(lock) {
        directory(context.applicationContext).listFiles()?.forEach { it.delete() }
        Unit
    }

    private fun hasContacts(context: Context) = context.checkSelfPermission(Manifest.permission.READ_CONTACTS) == PackageManager.PERMISSION_GRANTED
    private fun directory(context: Context) = File(context.filesDir, DIR)
    private fun readBounded(input: java.io.InputStream): ByteArray {
        val out = ByteArrayOutputStream(); val buffer = ByteArray(8192); var total = 0
        while (true) { val n = input.read(buffer); if (n < 0) break; total += n; require(total <= MAX_SOURCE); out.write(buffer, 0, n) }
        return out.toByteArray()
    }
    private fun prune(dir: File, newest: File) {
        val files = dir.listFiles()?.filter { it.isFile && it.name.matches(Regex("avatar-[0-9a-f]{64}\\.jpg")) }
            ?.sortedWith(compareByDescending<File> { it == newest }.thenByDescending { it.lastModified() }).orEmpty()
        var bytes = 0L
        var kept = 0
        files.forEach { file ->
            if (kept < MAX_FILES && bytes + file.length() <= MAX_BYTES) {
                bytes += file.length()
                kept++
            } else file.delete()
        }
    }
}
