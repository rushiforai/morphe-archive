package io.github.liongalahad.nuviotv.extension.playback.bingenextepisode

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
class BingeNextEpisodeRuntimeTest {
    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        BingeGroupManualFallbackSettings.setEnabled(application, false)
    }

    @Test
    fun `off preserves Nuvio fallback decision`() {
        assertFalse(Extension.forceBingeGroupOnly(false))
        assertTrue(Extension.forceBingeGroupOnly(true))
    }

    @Test
    fun `on forces manual fallback when Nuvio did not already require it`() {
        BingeGroupManualFallbackSettings.setEnabled(application, true)

        assertTrue(Extension.forceBingeGroupOnly(false))
        assertTrue(Extension.forceBingeGroupOnly(true))
    }

    @Test
    fun `setting owns its labels and synchronous preference`() {
        assertEquals("Binge Group Manual Fallback", BingeGroupManualFallbackSettings.TITLE)
        assertEquals(
            "When Prefer Binge Group is enabled and no matching next-episode source is found, " +
                "open the source picker instead of selecting another source.",
            BingeGroupManualFallbackSettings.DESCRIPTION
        )
        assertFalse(BingeGroupManualFallbackSettings.isEnabled())
        assertTrue(BingeGroupManualFallbackSettings.toggle())
        assertTrue(BingeGroupManualFallbackSettings.isEnabled())
    }
}
