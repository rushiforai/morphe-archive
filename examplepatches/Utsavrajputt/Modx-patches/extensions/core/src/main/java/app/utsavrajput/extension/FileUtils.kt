package app.utsavrajput.extension

import android.content.ContentValues
import android.content.Context
import android.content.Intent
import android.net.Uri
import android.os.Build
import android.provider.MediaStore
import androidx.core.content.FileProvider
import java.io.File
import java.io.InputStream
import java.io.OutputStream

/**
 * Shared helpers used by the Tools screens. Keeping file I/O / sharing
 * logic in one place instead of duplicating it per-tool.
 */
object FileUtils {

    private const val PROVIDER_AUTHORITY = "app.utsavrajput.extension.fileprovider"

    /**
     * Plain java.io buffer copy - deliberately NOT Kotlin's InputStream.copyTo()
     * (kotlin.io.ByteStreamsKt), for the same reason UiUtils avoids kotlin.Pair
     * and ToolsActivity avoids listOf(vararg): MX Player's own base.apk already
     * contains an R8-stripped copy of several kotlin-stdlib classes with only
     * the methods MX Player itself calls kept. Any kotlin-stdlib method this
     * module calls that MX Player doesn't also call can be missing at runtime
     * (NoSuchMethodError) even though it compiles fine. Pure java.io calls
     * side-step this category of crash entirely.
     */
    /** Plain java.lang.String logic - deliberately NOT Kotlin's File.extension (kotlin.io.FilesKt), same reasoning as copyStream() above. */
    fun fileExtension(name: String): String {
        val dot = name.lastIndexOf('.')
        return if (dot >= 0 && dot < name.length - 1) name.substring(dot + 1) else ""
    }

    fun copyStream(input: InputStream, output: OutputStream) {
        val buffer = ByteArray(8192)
        while (true) {
            val read = input.read(buffer)
            if (read == -1) break
            output.write(buffer, 0, read)
        }
    }

    /** Share a file already on disk (app-private files) via the system share sheet. */
    fun shareFile(context: Context, file: File, mimeType: String) {
        val uri: Uri = FileProvider.getUriForFile(context, PROVIDER_AUTHORITY, file)
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = mimeType
            putExtra(Intent.EXTRA_STREAM, uri)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(Intent.createChooser(intent, null).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }

    /** Share an arbitrary content:// Uri (e.g. from a SAF DocumentFile) directly. */
    fun shareUri(context: Context, uri: Uri, mimeType: String) {
        val intent = Intent(Intent.ACTION_SEND).apply {
            type = mimeType
            putExtra(Intent.EXTRA_STREAM, uri)
            addFlags(Intent.FLAG_GRANT_READ_URI_PERMISSION)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK)
        }
        context.startActivity(Intent.createChooser(intent, null).addFlags(Intent.FLAG_ACTIVITY_NEW_TASK))
    }

    /**
     * Copy an input stream into the public gallery via MediaStore (Android 10+
     * scoped-storage safe - no broad storage permission needed). Used by the
     * WhatsApp Status Saver "Save" action.
     */
    fun saveToGallery(context: Context, input: InputStream, displayName: String, mimeType: String): Uri? {
        val isVideo = mimeType.startsWith("video")
        val collection = if (isVideo) {
            MediaStore.Video.Media.EXTERNAL_CONTENT_URI
        } else {
            MediaStore.Images.Media.EXTERNAL_CONTENT_URI
        }
        val relativeDir = if (isVideo) "Movies/Modx" else "Pictures/Modx"

        val values = ContentValues().apply {
            put(MediaStore.MediaColumns.DISPLAY_NAME, displayName)
            put(MediaStore.MediaColumns.MIME_TYPE, mimeType)
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                put(MediaStore.MediaColumns.RELATIVE_PATH, relativeDir)
                put(MediaStore.MediaColumns.IS_PENDING, 1)
            }
        }

        val resolver = context.contentResolver
        val uri = resolver.insert(collection, values) ?: return null

        resolver.openOutputStream(uri)?.use { out: OutputStream ->
            copyStream(input, out)
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.MediaColumns.IS_PENDING, 0)
            resolver.update(uri, values, null, null)
        }

        return uri
    }
}
