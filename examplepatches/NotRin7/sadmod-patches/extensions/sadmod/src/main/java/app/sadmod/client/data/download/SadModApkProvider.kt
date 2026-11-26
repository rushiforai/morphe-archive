package app.sadmod.client.data.download

import android.content.ContentProvider
import android.content.ContentValues
import android.content.Context
import android.database.Cursor
import android.database.MatrixCursor
import android.net.Uri
import android.os.ParcelFileDescriptor
import android.provider.OpenableColumns
import java.io.File
import java.io.FileNotFoundException

/**
 * Self-contained read-only APK ContentProvider requiring zero XML path resources in the patched host manifest.
 */
class SadModApkProvider : ContentProvider() {

    override fun onCreate(): Boolean = true

    override fun getType(uri: Uri): String = "application/vnd.android.package-archive"

    override fun query(
        uri: Uri,
        projection: Array<out String>?,
        selection: String?,
        selectionArgs: Array<out String>?,
        sortOrder: String?
    ): Cursor? {
        val ctx = context ?: return null
        val file = resolveUriToFile(ctx, uri) ?: return null
        val cols = projection ?: arrayOf(OpenableColumns.DISPLAY_NAME, OpenableColumns.SIZE)
        val cursor = MatrixCursor(cols, 1)
        val row = Array<Any?>(cols.size) { idx ->
            when (cols[idx]) {
                OpenableColumns.DISPLAY_NAME -> file.name
                OpenableColumns.SIZE -> file.length()
                else -> null
            }
        }
        cursor.addRow(row)
        return cursor
    }

    override fun openFile(uri: Uri, mode: String): ParcelFileDescriptor {
        if (mode != "r") throw SecurityException("Read-only provider")
        val ctx = context ?: throw FileNotFoundException("Missing context")
        val target = resolveUriToFile(ctx, uri)
            ?: throw FileNotFoundException("APK not accessible: $uri")
        return ParcelFileDescriptor.open(target, ParcelFileDescriptor.MODE_READ_ONLY)
    }

    override fun insert(uri: Uri, values: ContentValues?): Uri? = null
    override fun delete(uri: Uri, selection: String?, selectionArgs: Array<out String>?): Int = 0
    override fun update(uri: Uri, values: ContentValues?, selection: String?, selectionArgs: Array<out String>?): Int = 0

    companion object {
        fun authority(context: Context): String = "${context.packageName}.sadmod.apkprovider"

        private fun allowedRoots(context: Context): List<Pair<String, File>> {
            return listOfNotNull(
                "dl" to File(context.filesDir, "downloads").canonicalFile,
                "apks" to File(context.filesDir, "apks").canonicalFile,
                context.getExternalFilesDir("downloads")?.canonicalFile?.let { "ext_dl" to it },
                context.getExternalFilesDir("apks")?.canonicalFile?.let { "ext_apks" to it }
            )
        }

        fun getUriForFile(context: Context, file: File): Uri {
            val canonical = file.canonicalFile
            val match = allowedRoots(context).firstOrNull { (_, root) -> isInside(canonical, root) }
                ?: throw IllegalArgumentException("File outside SadMod APK directories: ${canonical.path}")

            val relPath = canonical.relativeTo(match.second).invariantSeparatorsPath
            return Uri.Builder()
                .scheme("content")
                .authority(authority(context))
                .appendPath(match.first)
                .apply {
                    relPath.split('/').filter { it.isNotEmpty() }.forEach { appendPath(it) }
                }
                .build()
        }

        private fun resolveUriToFile(context: Context, uri: Uri): File? {
            val segments = uri.pathSegments
            if (segments.size < 2) return null
            val rootTag = segments.first()
            val rootDir = allowedRoots(context).firstOrNull { it.first == rootTag }?.second ?: return null

            var candidate = rootDir
            for (seg in segments.drop(1)) {
                if (seg == "." || seg == ".." || seg.contains('/') || seg.contains('\\')) return null
                candidate = File(candidate, seg)
            }
            val resolved = candidate.canonicalFile
            return if (isInside(resolved, rootDir) && resolved.isFile) resolved else null
        }

        private fun isInside(child: File, parent: File): Boolean {
            val parentPath = parent.path.trimEnd(File.separatorChar) + File.separatorChar
            return child.path.startsWith(parentPath)
        }
    }
}
