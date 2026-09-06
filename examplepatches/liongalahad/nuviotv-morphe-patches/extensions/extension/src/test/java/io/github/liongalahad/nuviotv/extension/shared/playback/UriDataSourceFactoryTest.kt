package io.github.liongalahad.nuviotv.extension.shared.playback

import android.app.Application
import android.net.Uri
import androidx.media3.datasource.DataSource
import androidx.media3.datasource.DataSpec
import androidx.media3.datasource.TransferListener
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config
import java.io.File

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class UriDataSourceFactoryTest {
    @Test fun `local file uses file transport and HTTPS preserves native upstream`() {
        val app = ApplicationProvider.getApplicationContext<Application>()
        MorpheSettingsRuntime.initialize(app)
        var networkOpens = 0
        val upstream = object : DataSource {
            override fun addTransferListener(listener: TransferListener) {}
            override fun open(spec: DataSpec): Long { networkOpens++; return 0 }
            override fun read(buffer: ByteArray, offset: Int, length: Int) = -1
            override fun getUri(): Uri? = null
            override fun close() {}
        }
        val factory = UriDataSourceFactory.wrap { upstream }
        val file = File(app.cacheDir, "uri-transport-test.mp4").apply { writeBytes(byteArrayOf(1, 2, 3, 4)) }
        val local = factory.createDataSource()
        assertEquals(4L, local.open(DataSpec(Uri.fromFile(file))))
        val bytes = ByteArray(4)
        assertEquals(4, local.read(bytes, 0, bytes.size))
        assertArrayEquals(byteArrayOf(1, 2, 3, 4), bytes)
        local.close()
        assertEquals(0, networkOpens)
        val network = factory.createDataSource()
        network.open(DataSpec(Uri.parse("https://example.invalid/video.mp4")))
        network.close()
        assertEquals(1, networkOpens)
    }
}
