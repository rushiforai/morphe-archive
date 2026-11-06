package com.openbubbles.wear.bridge

import android.app.Application
import android.graphics.Bitmap
import android.graphics.BitmapFactory
import android.graphics.ImageDecoder
import android.media.MediaDataSource
import android.media.MediaMetadataRetriever
import android.net.Uri
import com.openbubbles.wear.protocol.WireMessage
import com.openbubbles.wear.protocol.WireThread
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config
import org.robolectric.annotation.Implementation
import org.robolectric.annotation.Implements
import java.io.File

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class, shadows = [HeicSequenceTest.SequenceReader::class,
    HeicSequenceTest.RejectSequenceImage::class, HeicSequenceTest.RejectSequenceBitmap::class])
class HeicSequenceTest {
    @Test fun heifSequenceUsesBoundedFrameFallbackAndTravelsAsWebp() {
        val context = RuntimeEnvironment.getApplication()
        val source = File(context.filesDir, "sequence.heics").apply {
            writeBytes(byteArrayOf(0, 0, 0, 24) + "ftypmsf1".toByteArray() + ByteArray(12))
        }
        val cache = MediaCache(context)
        cache.clear()
        val thread = WireThread("chat", "Group", messages = listOf(
            WireMessage("sequence-message", "chat", "", 1, attachment = true)))
        val result = cache.ingest(thread, mapOf("sequence-message" to MediaSource(Uri.fromFile(source), "image/heic")))
        val id = result.messages.single().mediaId
        assertNotNull("A sequence frame must become viewable media", id)
        val info = cache.info(id!!)!!
        assertEquals("image/webp", info.mimeType)
        assertEquals(442, info.width)
        assertEquals(960, info.height)
        assertTrue(info.file.length() > 0)
    }

    @Implements(MediaMetadataRetriever::class)
    class SequenceReader {
        @Implementation fun setDataSource(source: MediaDataSource) {
            assertEquals(24L, source.size)
            val bytes = ByteArray(8)
            assertEquals(8, source.readAt(4, bytes, 0, 8))
            assertEquals("ftypmsf1", bytes.toString(Charsets.US_ASCII))
            assertEquals(-1, source.readAt(source.size, bytes, 0, 8))
            assertEquals(2, source.readAt(22, bytes, 0, 8))
            assertEquals(0, source.readAt(source.size, bytes, 0, 0))
        }
        @Implementation fun getScaledFrameAtTime(time: Long, option: Int, width: Int, height: Int): Bitmap {
            assertEquals(0L, time)
            assertEquals(MediaMetadataRetriever.OPTION_CLOSEST_SYNC, option)
            assertEquals(960, width)
            assertEquals(960, height)
            return Bitmap.createBitmap(442, 960, Bitmap.Config.ARGB_8888)
        }
    }

    @Implements(ImageDecoder::class)
    class RejectSequenceImage {
        companion object {
            @JvmStatic @Implementation fun decodeBitmap(source: ImageDecoder.Source,
                listener: ImageDecoder.OnHeaderDecodedListener): Bitmap = throw java.io.IOException("Unsupported sequence")
        }
    }

    @Implements(BitmapFactory::class)
    class RejectSequenceBitmap {
        companion object {
            @JvmStatic @Implementation fun decodeByteArray(bytes: ByteArray, offset: Int, length: Int,
                options: BitmapFactory.Options?): Bitmap? {
                options?.outWidth = -1
                options?.outHeight = -1
                return null
            }
        }
    }
}
