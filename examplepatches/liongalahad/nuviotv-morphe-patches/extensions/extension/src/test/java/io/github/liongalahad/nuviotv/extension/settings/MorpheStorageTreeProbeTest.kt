package io.github.liongalahad.nuviotv.extension.settings

import android.database.Cursor
import android.database.MatrixCursor
import android.content.pm.ProviderInfo
import android.os.CancellationSignal
import android.os.ParcelFileDescriptor
import android.provider.DocumentsContract
import android.provider.DocumentsProvider
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.File
import java.nio.file.Files

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28])
class MorpheStorageTreeProbeTest {
    @Test fun `document-tree probe creates writes reads and removes its test file`() {
        val provider = Robolectric.buildContentProvider(StorageProbeDocumentsProvider::class.java)
            .create(ProviderInfo().apply {
                authority = StorageProbeDocumentsProvider.AUTHORITY
                exported = true
                grantUriPermissions = true
                readPermission = android.Manifest.permission.MANAGE_DOCUMENTS
                writePermission = android.Manifest.permission.MANAGE_DOCUMENTS
            })
            .get()
        val tree = DocumentsContract.buildTreeDocumentUri(
            StorageProbeDocumentsProvider.AUTHORITY,
            StorageProbeDocumentsProvider.ROOT_ID
        )

        val result = MorpheStoragePath.probeTreeReadWrite(
            ApplicationProvider.getApplicationContext(),
            tree
        )

        assertTrue(result.visibleMessage(), result.success)
        assertTrue(provider.root.listFiles().orEmpty().isEmpty())
    }
}

class StorageProbeDocumentsProvider : DocumentsProvider() {
    companion object {
        const val AUTHORITY = "io.github.liongalahad.nuviotv.test.storage"
        const val ROOT_ID = "root"

        val ROOT_PROJECTION = arrayOf(
            DocumentsContract.Root.COLUMN_ROOT_ID,
            DocumentsContract.Root.COLUMN_DOCUMENT_ID,
            DocumentsContract.Root.COLUMN_TITLE,
            DocumentsContract.Root.COLUMN_FLAGS
        )
        val DOCUMENT_PROJECTION = arrayOf(
            DocumentsContract.Document.COLUMN_DOCUMENT_ID,
            DocumentsContract.Document.COLUMN_DISPLAY_NAME,
            DocumentsContract.Document.COLUMN_MIME_TYPE,
            DocumentsContract.Document.COLUMN_FLAGS,
            DocumentsContract.Document.COLUMN_SIZE
        )
    }

    lateinit var root: File

    override fun onCreate(): Boolean {
        root = Files.createTempDirectory("morphe-tree-probe").toFile()
        return true
    }

    override fun queryRoots(projection: Array<out String>?): Cursor =
        MatrixCursor(projection ?: ROOT_PROJECTION).apply {
            val row = newRow()
            for (column in columnNames) when (column) {
                DocumentsContract.Root.COLUMN_ROOT_ID -> row.add(ROOT_ID)
                DocumentsContract.Root.COLUMN_DOCUMENT_ID -> row.add(ROOT_ID)
                DocumentsContract.Root.COLUMN_TITLE -> row.add("Test storage")
                DocumentsContract.Root.COLUMN_FLAGS -> row.add(
                    DocumentsContract.Root.FLAG_SUPPORTS_CREATE
                )
            }
        }

    override fun queryDocument(documentId: String, projection: Array<out String>?): Cursor =
        documentCursor(documentId, projection)

    override fun queryChildDocuments(
        parentDocumentId: String,
        projection: Array<out String>?,
        sortOrder: String?
    ): Cursor = MatrixCursor(projection ?: DOCUMENT_PROJECTION).also { cursor ->
        root.listFiles().orEmpty().forEach { file -> includeFile(cursor, ROOT_ID + "/" + file.name, file) }
    }

    override fun createDocument(parentDocumentId: String, mimeType: String, displayName: String): String {
        check(parentDocumentId == ROOT_ID)
        val file = File(root, displayName)
        check(file.createNewFile())
        return ROOT_ID + "/" + file.name
    }

    override fun isChildDocument(parentDocumentId: String, documentId: String): Boolean =
        parentDocumentId == ROOT_ID && documentId.startsWith(ROOT_ID + "/")

    override fun openDocument(
        documentId: String,
        mode: String,
        signal: CancellationSignal?
    ): ParcelFileDescriptor = ParcelFileDescriptor.open(file(documentId),
        ParcelFileDescriptor.parseMode(mode))

    override fun deleteDocument(documentId: String) {
        check(file(documentId).delete())
    }

    private fun documentCursor(documentId: String, projection: Array<out String>?): Cursor =
        MatrixCursor(projection ?: DOCUMENT_PROJECTION).also { cursor ->
            includeFile(cursor, documentId, file(documentId))
        }

    private fun includeFile(cursor: MatrixCursor, documentId: String, file: File) {
        val row = cursor.newRow()
        for (column in cursor.columnNames) when (column) {
            DocumentsContract.Document.COLUMN_DOCUMENT_ID -> row.add(documentId)
            DocumentsContract.Document.COLUMN_DISPLAY_NAME -> row.add(file.name)
            DocumentsContract.Document.COLUMN_MIME_TYPE -> row.add(
                if (file.isDirectory) DocumentsContract.Document.MIME_TYPE_DIR
                else "application/octet-stream"
            )
            DocumentsContract.Document.COLUMN_FLAGS -> row.add(
                DocumentsContract.Document.FLAG_SUPPORTS_WRITE or
                    DocumentsContract.Document.FLAG_SUPPORTS_DELETE or
                    DocumentsContract.Document.FLAG_DIR_SUPPORTS_CREATE
            )
            DocumentsContract.Document.COLUMN_SIZE -> row.add(file.length())
        }
    }

    private fun file(documentId: String): File =
        if (documentId == ROOT_ID) root else File(root, documentId.substringAfter(ROOT_ID + "/"))
}
