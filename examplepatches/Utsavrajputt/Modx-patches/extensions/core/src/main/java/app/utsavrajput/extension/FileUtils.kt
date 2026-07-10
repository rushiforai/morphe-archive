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
            input.copyTo(out)
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            values.clear()
            values.put(MediaStore.MediaColumns.IS_PENDING, 0)
            resolver.update(uri, values, null, null)
        }

        return uri
    }
}
