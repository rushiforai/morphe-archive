package io.github.liongalahad.nuviotv.extension.storage.segmented

import android.app.Application
import android.net.Uri
import android.os.HandlerThread
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertArrayEquals
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test
import org.junit.rules.TemporaryFolder
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.FileOutputStream

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [28, 30, 35])
class SegmentedMediaTest {
    @get:Rule
    val temporaryFolder = TemporaryFolder()

    private val application: Application
        get() = ApplicationProvider.getApplicationContext()

    @Test
    @Config(sdk = [35])
    fun `manifest round trips and virtual uri retains its source`() {
        val first = temporaryFolder.newFile("part-1").apply { writeBytes(byteArrayOf(1, 2, 3)) }
        val second = temporaryFolder.newFile("part-2").apply { writeBytes(byteArrayOf(4, 5)) }
        val manifestFile = temporaryFolder.newFile("Movie.mkv${SegmentedMedia.MANIFEST_SUFFIX}")
        val manifest = SegmentedMedia.Manifest(
            "bundle-1", "Movie.mkv", "video/x-matroska", "Movie Collection",
            listOf(
                SegmentedMedia.Segment(Uri.fromFile(first), first.length()),
                SegmentedMedia.Segment(Uri.fromFile(second), second.length())
            )
        )
        FileOutputStream(manifestFile).use { SegmentedMedia.write(it, manifest) }

        val restored = SegmentedMedia.read(application, Uri.fromFile(manifestFile))
        assertEquals("Movie.mkv", restored.filename)
        assertEquals("Movie Collection", restored.logicalParent)
        assertEquals(5L, restored.totalLength)
        assertTrue(SegmentedMedia.isReadable(application, restored))
        val virtual = SegmentedMedia.virtualUri(application, Uri.fromFile(manifestFile), restored.bundleId)!!
        assertEquals("bundle-1", SegmentedMedia.bundleId(virtual))
        assertEquals(Uri.fromFile(manifestFile), SegmentedMedia.manifestUri(virtual))
    }

    @Test
    fun `proxy callback reads seamlessly within and across segment boundaries`() {
        val first = temporaryFolder.newFile("first").apply { writeBytes("abcd".toByteArray()) }
        val second = temporaryFolder.newFile("second").apply { writeBytes("EFGH".toByteArray()) }
        val third = temporaryFolder.newFile("third").apply { writeBytes("123".toByteArray()) }
        val manifest = SegmentedMedia.Manifest(
            "seekable", "Seek.mkv", "video/x-matroska",
            listOf(first, second, third).map {
                SegmentedMedia.Segment(Uri.fromFile(it), it.length())
            }
        )
        val thread = HandlerThread("SegmentedMediaTest").apply { start() }
        val callback = SegmentedMediaProvider.Callback(application, manifest, thread)
        try {
            assertEquals(3, callback.openedHandleCount())
            val all = ByteArray(11)
            assertEquals(11, callback.onRead(0, all.size, all))
            assertArrayEquals("abcdEFGH123".toByteArray(), all)

            val crossing = ByteArray(6)
            assertEquals(6, callback.onRead(3, crossing.size, crossing))
            assertArrayEquals("dEFGH1".toByteArray(), crossing)

            val tail = ByteArray(8)
            assertEquals(2, callback.onRead(9, tail.size, tail))
            assertArrayEquals("23".toByteArray(), tail.copyOf(2))
            assertEquals(0, callback.onRead(11, 1, ByteArray(1)))
        } finally {
            callback.onRelease()
        }
    }

    @Test
    fun `diagnostic thresholds distinguish storage latency and player stutter`() {
        assertFalse(SegmentedPlaybackDiagnostics.isSlowRead(49_999L))
        assertTrue(SegmentedPlaybackDiagnostics.isSlowRead(50_000L))
        assertFalse(SegmentedPlaybackDiagnostics.isStutter(249L))
        assertTrue(SegmentedPlaybackDiagnostics.isStutter(250L))
        assertTrue(SegmentedPlaybackDiagnostics.SUMMARY_DELAY_MS >= 500L)
    }

    @Test
    @Config(sdk = [35])
    fun `whole bundle deletion removes every segment and manifest`() {
        val first = temporaryFolder.newFile("delete-1").apply { writeText("one") }
        val second = temporaryFolder.newFile("delete-2").apply { writeText("two") }
        val manifestFile = temporaryFolder.newFile("Delete.mp4${SegmentedMedia.MANIFEST_SUFFIX}")
        val manifest = SegmentedMedia.Manifest(
            "delete", "Delete.mp4", "video/mp4",
            listOf(first, second).map { SegmentedMedia.Segment(Uri.fromFile(it), it.length()) }
        )
        FileOutputStream(manifestFile).use { SegmentedMedia.write(it, manifest) }

        assertTrue(SegmentedMedia.delete(application, Uri.fromFile(manifestFile)))
        assertFalse(first.exists())
        assertFalse(second.exists())
        assertFalse(manifestFile.exists())
    }
}
