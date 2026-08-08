package io.github.liongalahad.nuviotv.extension.detail.randomepisode

import android.app.Application
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class RandomEpisodeSettingsTest {
    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        RandomEpisodeSettings.setEnabled(application, false)
    }

    @Test
    fun `setting owns its labels and synchronous preference`() {
        assertEquals("Show Random Episode Button", RandomEpisodeSettings.TITLE)
        assertEquals(
            "Show a shuffle button on series detail pages.",
            RandomEpisodeSettings.DESCRIPTION
        )
        assertFalse(RandomEpisodeSettings.isEnabled())
        assertTrue(RandomEpisodeSettings.toggle())
        assertTrue(RandomEpisodeSettings.isEnabled())
    }
}
