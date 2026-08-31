package io.github.liongalahad.nuviotv.extension.playback.localdownloads

import android.app.Application
import android.content.pm.ProviderInfo
import android.database.Cursor
import android.database.MatrixCursor
import android.net.Uri
import android.os.CancellationSignal
import android.os.ParcelFileDescriptor
import android.provider.DocumentsContract
import android.provider.DocumentsProvider
import androidx.test.core.app.ApplicationProvider
import androidx.media3.common.MediaItem
import androidx.media3.common.MimeTypes
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import io.github.liongalahad.nuviotv.extension.storage.segmented.SegmentedMedia
import org.json.JSONArray
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.Rule
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.Robolectric
import org.robolectric.annotation.Config
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.FileOutputStream
import java.io.OutputStream
import java.nio.file.Files

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class LocalDownloadsSegmentedTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    @Test
    fun `rolling writer splits without creating an empty boundary part`() {
        val parts = mutableListOf<ByteArrayOutputStream>()
        val output = LocalDownloadsService.RollingOutputStream(4) {
            ByteArrayOutputStream().also(parts::add)
        }
        output.use { it.write("abcdefghij".toByteArray()) }

        assertEquals(listOf(4L, 4L, 2L), output.sizes())
        assertEquals(listOf("abcd", "efgh", "ij"), parts.map { it.toString("UTF-8") })

        val exactParts = mutableListOf<ByteArrayOutputStream>()
        val exact = LocalDownloadsService.RollingOutputStream(4) {
            ByteArrayOutputStream().also(exactParts::add)
        }
        exact.use { it.write("12345678".toByteArray()) }
        assertEquals(listOf(4L, 4L), exact.sizes())
        assertEquals(2, exactParts.size)
    }

    @Test
    fun `mount parser identifies FAT32 and large file systems by longest mount`() {
        val info = """
            24 1 0:1 / /storage rw - fuse fuse rw
            25 24 8:1 / /storage/1234-ABCD rw - vfat /dev/block/sda1 rw
            26 24 8:2 / /storage/EXFAT rw - exfat /dev/block/sdb1 rw
        """.trimIndent()
        assertEquals("vfat", LocalDownloadsStorageFormat.filesystemType(
            File("/storage/1234-ABCD/Movies"), info))
        assertEquals("exfat", LocalDownloadsStorageFormat.filesystemType(
            File("/storage/EXFAT/Movies"), info))
        assertTrue(LocalDownloadsStorageFormat.isFat32("vfat"))
        assertTrue(LocalDownloadsStorageFormat.isKnownLargeFileType("exfat"))
        assertFalse(LocalDownloadsStorageFormat.isKnownLargeFileType("vfat"))
    }

    @Test
    fun `segmented filenames reserve existing manifests and ordinary files`() {
        assertEquals("Movie (2).mkv", LocalDownloadsService.uniqueSegmentedFilename(
            "Movie.mkv", listOf("MOVIE.MKV${SegmentedMedia.MANIFEST_SUFFIX}")))
        assertEquals("Movie (3).mkv", LocalDownloadsService.uniqueSegmentedFilename(
            "Movie.mkv", listOf(
                "Movie.mkv",
                "Movie (2).mkv${SegmentedMedia.MANIFEST_SUFFIX}"
            )))
    }

    @Test
    fun `small known downloads never require segmentation`() {
        assertFalse(LocalDownloadsStorageFormat.shouldSegment(
            null, null, LocalDownloadsStorageFormat.SEGMENT_BYTES))
    }

    @Test
    fun `one part FAT32 target collapses to an ordinary video file`() {
        val application: Application = ApplicationProvider.getApplicationContext()
        val service = Robolectric.buildService(LocalDownloadsService::class.java).create().get()
        val selectedRoot = temporaryFolder.newFolder("hidden-output")
        val location = LocalDownloadsService.SegmentedLocation("Movie", "Movie")
        val type = Class.forName(
            "io.github.liongalahad.nuviotv.extension.playback.localdownloads." +
                "LocalDownloadsService\$SegmentedFileOutputTarget"
        )
        val constructor = type.getDeclaredConstructor(
            LocalDownloadsService::class.java, File::class.java, String::class.java,
            LocalDownloadsService.SegmentedLocation::class.java
        ).apply { isAccessible = true }
        val target = constructor.newInstance(service, selectedRoot, "Movie.mkv", location)
        val open = type.getDeclaredMethod("open").apply { isAccessible = true }
        (open.invoke(target) as OutputStream).use { it.write("video-bytes".toByteArray()) }
        val commit = type.getDeclaredMethod("commit").apply { isAccessible = true }
        val video = Uri.parse(commit.invoke(target) as String)
        val openSidecar = type.getDeclaredMethod("openSidecar", String::class.java)
            .apply { isAccessible = true }
        (openSidecar.invoke(target, "Movie.en.srt") as OutputStream)
            .use { it.write("subtitle".toByteArray()) }

        assertEquals("file", video.scheme)
        assertEquals(listOf("Movie"), selectedRoot.list()!!.sorted())
        val movie = selectedRoot.resolve("Movie")
        assertEquals(listOf("Movie.en.srt", "Movie.mkv"), movie.list()!!.sorted())
        assertEquals("video-bytes", movie.resolve("Movie.mkv").readText())
        assertFalse(movie.listFiles()!!.any { it.isDirectory })
    }

    @Test
    fun `multi part FAT32 target replaces the video with one readable bundle folder`() {
        val application: Application = ApplicationProvider.getApplicationContext()
        val service = Robolectric.buildService(LocalDownloadsService::class.java).create().get()
        val selectedRoot = temporaryFolder.newFolder("mirrored-output")
        val location = LocalDownloadsService.SegmentedLocation("Movie", "Movie")
        val type = Class.forName(
            "io.github.liongalahad.nuviotv.extension.playback.localdownloads." +
                "LocalDownloadsService\$SegmentedFileOutputTarget"
        )
        val constructor = type.getDeclaredConstructor(
            LocalDownloadsService::class.java, File::class.java, String::class.java,
            LocalDownloadsService.SegmentedLocation::class.java, java.lang.Long.TYPE
        ).apply { isAccessible = true }
        val target = constructor.newInstance(service, selectedRoot, "Movie.mkv", location, 5L)
        val open = type.getDeclaredMethod("open").apply { isAccessible = true }
        (open.invoke(target) as OutputStream).use { it.write("video-bytes".toByteArray()) }
        val commit = type.getDeclaredMethod("commit").apply { isAccessible = true }
        val virtual = Uri.parse(commit.invoke(target) as String)
        val openSidecar = type.getDeclaredMethod("openSidecar", String::class.java)
            .apply { isAccessible = true }
        (openSidecar.invoke(target, "Movie.en.srt") as OutputStream)
            .use { it.write("subtitle".toByteArray()) }

        assertEquals(SegmentedMedia.AUTHORITY_SUFFIX,
            virtual.authority!!.removePrefix(application.packageName))
        assertEquals(listOf("Movie"), selectedRoot.list()!!.sorted())
        val movie = selectedRoot.resolve("Movie")
        val bundle = movie.listFiles()!!.single()
        assertTrue(bundle.isDirectory)
        assertTrue(bundle.name.matches(Regex("Movie \\[\\p{XDigit}{8}\\]")))
        assertEquals(listOf(
            "Movie - part 0001.bin",
            "Movie - part 0002.bin",
            "Movie - part 0003.bin",
            "Movie - playback manifest.json",
            "Movie.en.srt"
        ),
            bundle.list()!!.sorted())
        val manifest = SegmentedMedia.read(
            application, Uri.fromFile(bundle.resolve("Movie - playback manifest.json")))
        assertEquals("Movie.mkv", manifest.filename)
        assertEquals("Movie", manifest.logicalParent)
        assertEquals(3, manifest.segments.size)
        assertEquals("video-bytes".length.toLong(), manifest.totalLength)
    }

    @Test
    fun `moving document provider collapses one part and saves sidecars beside it`() {
        val provider = createSegmentedProvider(true)
        val service = Robolectric.buildService(LocalDownloadsService::class.java).create().get()
        val target = newSegmentedDocumentTarget(service, 50L)
        val type = target.javaClass
        (type.getDeclaredMethod("open").apply { isAccessible = true }.invoke(target) as OutputStream)
            .use { it.write("video-bytes".toByteArray()) }
        val uri = Uri.parse(type.getDeclaredMethod("commit").apply { isAccessible = true }
            .invoke(target) as String)
        (type.getDeclaredMethod("openSidecar", String::class.java).apply { isAccessible = true }
            .invoke(target, "Movie.en.srt") as OutputStream).use { it.write("subtitle".toByteArray()) }

        assertEquals("content", uri.scheme)
        val movie = provider.root.resolve("Movie")
        assertEquals(listOf("Movie.en.srt", "Movie.mkv"), movie.list()!!.sorted())
        assertFalse(movie.listFiles()!!.any { it.isDirectory })
        assertEquals("", type.getDeclaredMethod("manifestUri").apply { isAccessible = true }
            .invoke(target))
    }

    @Test
    fun `non moving document provider safely retains a readable one part bundle`() {
        val provider = createSegmentedProvider(false)
        val service = Robolectric.buildService(LocalDownloadsService::class.java).create().get()
        val target = newSegmentedDocumentTarget(service, 50L)
        val type = target.javaClass
        (type.getDeclaredMethod("open").apply { isAccessible = true }.invoke(target) as OutputStream)
            .use { it.write("video-bytes".toByteArray()) }
        val uri = Uri.parse(type.getDeclaredMethod("commit").apply { isAccessible = true }
            .invoke(target) as String)

        assertTrue(uri.authority!!.endsWith(SegmentedMedia.AUTHORITY_SUFFIX))
        val movie = provider.root.resolve("Movie")
        val bundle = movie.listFiles()!!.single()
        assertTrue(bundle.isDirectory)
        assertEquals(listOf(
            "Movie - part 0001.bin", "Movie - playback manifest.json"
        ), bundle.list()!!.sorted())
        assertFalse(provider.root.resolve(SegmentedMedia.STORE_DIRECTORY).exists())
    }

    private fun createSegmentedProvider(allowMove: Boolean): SegmentedDownloadsDocumentsProvider {
        SegmentedDownloadsDocumentsProvider.allowMove = allowMove
        return Robolectric.buildContentProvider(SegmentedDownloadsDocumentsProvider::class.java)
            .create(ProviderInfo().apply {
                authority = SegmentedDownloadsDocumentsProvider.AUTHORITY
                exported = true
                grantUriPermissions = true
                readPermission = android.Manifest.permission.MANAGE_DOCUMENTS
                writePermission = android.Manifest.permission.MANAGE_DOCUMENTS
            }).get()
    }

    private fun newSegmentedDocumentTarget(
        service: LocalDownloadsService, segmentBytes: Long
    ): Any {
        val location = LocalDownloadsService.SegmentedLocation("Movie", "Movie")
        val type = Class.forName(
            "io.github.liongalahad.nuviotv.extension.playback.localdownloads." +
                "LocalDownloadsService\$SegmentedDocumentOutputTarget"
        )
        val constructor = type.getDeclaredConstructor(
            LocalDownloadsService::class.java, Uri::class.java, String::class.java,
            LocalDownloadsService.SegmentedLocation::class.java, java.lang.Long.TYPE
        ).apply { isAccessible = true }
        val tree = DocumentsContract.buildTreeDocumentUri(
            SegmentedDownloadsDocumentsProvider.AUTHORITY,
            SegmentedDownloadsDocumentsProvider.ROOT_ID
        )
        return constructor.newInstance(service, tree, "Movie.mkv", location, segmentBytes)
    }

    @Test
    fun `show bundles use readable show season and episode names`() {
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/video-2/series/Silo?contentName=Silo&season=1&episode=2" +
                "&episodeName=Holston%27s%20Pick"
        )!!
        val request = LocalDownloadsRuntime.DownloadRequest(
            identity, "https://example.com/video.mkv", "Source", "video.mkv",
            emptyMap(), null, null, ""
        )
        val location = LocalDownloadsService.segmentedLocation(
            request, LocalDownloadsService.downloadFolderName(request)
        )

        assertEquals("Silo - Season 1", location.logicalParent)
        assertEquals("S01E02 - Holston's Pick [12345678]",
            location.bundleFolderName("12345678-abcd-ef00-1111-222233334444"))
        assertEquals("S01E02 - Holston's Pick - playback manifest.json",
            location.manifestName())
        assertEquals("S01E02 - Holston's Pick - part 0003.bin", location.partName(3))
    }

    @Test
    fun `movie bundle replaces the ordinary filename with a same stem folder`() {
        val location = LocalDownloadsService.segmentedLocation(
            null, "Big Buck Bunny", "BigBuckBunny_320x180.mp4"
        )

        assertEquals("Big Buck Bunny", location.logicalParent)
        assertEquals("BigBuckBunny_320x180 [12345678]",
            location.bundleFolderName("12345678-abcd-ef00-1111-222233334444"))
        assertEquals("BigBuckBunny_320x180 - part 0001.bin", location.partName(1))
    }

    @Test
    fun `segmented download is indexed and deleted as one logical item`() {
        val application: Application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().clear().commit()
        val folder = temporaryFolder.newFolder("indexed-bundle")
        val store = folder.resolve(SegmentedMedia.STORE_DIRECTORY).apply { mkdirs() }
        val bundle = store.resolve("indexed").apply { mkdirs() }
        val first = bundle.resolve("part1").apply { writeText("first") }
        val second = bundle.resolve("part2").apply { writeText("second") }
        val subtitle = bundle.resolve("Movie.en.srt").apply { writeText("subtitle") }
        val manifestFile = bundle.resolve(SegmentedMedia.BUNDLE_MANIFEST)
        val manifest = SegmentedMedia.Manifest(
            "indexed", "Movie.mkv", "video/x-matroska",
            listOf(first, second).map { SegmentedMedia.Segment(Uri.fromFile(it), it.length()) }
        )
        FileOutputStream(manifestFile).use { SegmentedMedia.write(it, manifest) }
        val virtual = SegmentedMedia.virtualUri(
            application, Uri.fromFile(manifestFile), manifest.bundleId)!!.toString()
        val identity = LocalDownloadsRuntime.RouteIdentity.fromRoute(
            "stream/video1/movie/Movie?contentId=tt1&contentType=movie&contentName=Movie"
        )!!
        val entry = LocalDownloadsRuntime.DownloadedEntry(
            identity, virtual, Uri.fromFile(folder).toString(), "Movie.mkv",
            first.length() + second.length(), listOf(Uri.fromFile(subtitle).toString()),
            listOf(Uri.fromFile(first).toString(), Uri.fromFile(second).toString()),
            Uri.fromFile(manifestFile).toString()
        )
        val values = JSONArray().put(entry.toJson())
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().putString("playback.local_downloads.entries.v1", values.toString()).commit()

        assertTrue(entry.isReadable(application))
        assertEquals(1, LocalDownloadsRuntime.availableEntries().size)
        val existingSubtitle = MediaItem.SubtitleConfiguration.Builder(Uri.fromFile(subtitle))
            .setMimeType(MimeTypes.APPLICATION_SUBRIP).build()
        assertEquals(1, LocalDownloadsRuntime.attachDownloadedSubtitles(
            application, virtual, listOf(existingSubtitle)).size)
        assertTrue(LocalDownloadsRuntime.deleteEntryFiles(application, entry).complete)
        assertFalse(first.exists())
        assertFalse(second.exists())
        assertFalse(manifestFile.exists())
        assertFalse(subtitle.exists())
        assertFalse(bundle.exists())
        assertFalse(store.exists())
        assertFalse(folder.exists())
    }
}

class SegmentedDownloadsDocumentsProvider : DocumentsProvider() {
    companion object {
        const val AUTHORITY = "io.github.liongalahad.nuviotv.test.segmented.downloads"
        const val ROOT_ID = "root"
        var allowMove = true
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
            DocumentsContract.Document.COLUMN_SIZE,
            DocumentsContract.Document.COLUMN_LAST_MODIFIED
        )
    }

    lateinit var root: File

    override fun onCreate(): Boolean {
        root = Files.createTempDirectory("segmented-downloads-provider").toFile()
        return true
    }

    override fun queryRoots(projection: Array<out String>?): Cursor =
        MatrixCursor(projection ?: ROOT_PROJECTION).apply {
            val row = newRow()
            for (column in columnNames) when (column) {
                DocumentsContract.Root.COLUMN_ROOT_ID -> row.add(ROOT_ID)
                DocumentsContract.Root.COLUMN_DOCUMENT_ID -> row.add(ROOT_ID)
                DocumentsContract.Root.COLUMN_TITLE -> row.add("Segmented test storage")
                DocumentsContract.Root.COLUMN_FLAGS -> row.add(
                    DocumentsContract.Root.FLAG_SUPPORTS_CREATE
                )
            }
        }

    override fun queryDocument(documentId: String, projection: Array<out String>?): Cursor =
        MatrixCursor(projection ?: DOCUMENT_PROJECTION).also {
            includeFile(it, documentId, file(documentId))
        }

    override fun queryChildDocuments(
        parentDocumentId: String, projection: Array<out String>?, sortOrder: String?
    ): Cursor = MatrixCursor(projection ?: DOCUMENT_PROJECTION).also { cursor ->
        file(parentDocumentId).listFiles().orEmpty().forEach { includeFile(cursor, id(it), it) }
    }

    override fun createDocument(parentDocumentId: String, mimeType: String, displayName: String): String {
        val created = File(file(parentDocumentId), displayName)
        val success = if (mimeType == DocumentsContract.Document.MIME_TYPE_DIR) {
            created.mkdir()
        } else {
            created.createNewFile()
        }
        check(success)
        return id(created)
    }

    override fun renameDocument(documentId: String, displayName: String): String {
        val source = file(documentId)
        val renamed = File(source.parentFile, displayName)
        check(source.renameTo(renamed))
        return id(renamed)
    }

    override fun moveDocument(
        sourceDocumentId: String, sourceParentDocumentId: String, targetParentDocumentId: String
    ): String {
        if (!allowMove) throw UnsupportedOperationException("Move disabled for test")
        val source = file(sourceDocumentId)
        val moved = File(file(targetParentDocumentId), source.name)
        check(source.renameTo(moved))
        return id(moved)
    }

    override fun openDocument(
        documentId: String, mode: String, signal: CancellationSignal?
    ): ParcelFileDescriptor = ParcelFileDescriptor.open(file(documentId),
        ParcelFileDescriptor.parseMode(mode))

    override fun deleteDocument(documentId: String) {
        check(file(documentId).delete())
    }

    override fun isChildDocument(parentDocumentId: String, documentId: String): Boolean =
        documentId.startsWith("$parentDocumentId/")

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
                    DocumentsContract.Document.FLAG_SUPPORTS_RENAME or
                    DocumentsContract.Document.FLAG_SUPPORTS_MOVE or
                    DocumentsContract.Document.FLAG_DIR_SUPPORTS_CREATE
            )
            DocumentsContract.Document.COLUMN_SIZE -> row.add(file.length())
            DocumentsContract.Document.COLUMN_LAST_MODIFIED -> row.add(file.lastModified())
        }
    }

    private fun file(documentId: String): File = if (documentId == ROOT_ID) root else
        File(root, documentId.removePrefix("$ROOT_ID/").replace('/', File.separatorChar))

    private fun id(file: File): String = if (file == root) ROOT_ID else
        "$ROOT_ID/" + file.relativeTo(root).path.replace(File.separatorChar, '/')
}
