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
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().clear().commit()
    }

    @Test
    fun `setting owns its labels and synchronous preference`() {
        assertEquals("Enable Per-Show Random Playback", RandomEpisodeSettings.TITLE)
        assertEquals(
            "Show a persistent random playback toggle on each series detail page.",
            RandomEpisodeSettings.DESCRIPTION
        )
        assertTrue(RandomEpisodeSettings.isEnabled())
        RandomEpisodeSettings.setEnabled(application, false)
        assertFalse(RandomEpisodeSettings.isEnabled())
        assertTrue(RandomEpisodeSettings.toggle())
        assertTrue(RandomEpisodeSettings.isEnabled())
    }

    @Test
    fun `fresh setting defaults on while a stored choice remains authoritative`() {
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().remove(RandomEpisodeSettings.KEY).commit()
        assertTrue(RandomEpisodeSettings.isEnabled())

        RandomEpisodeSettings.setEnabled(application, false)
        assertFalse(RandomEpisodeSettings.isEnabled())
    }

    @Test
    fun `canonical show keys normalize series aliases and reject non-series media`() {
        assertEquals("series:tt0944947", RandomEpisodeSettings.canonicalShowKey("series", "tt0944947"))
        assertEquals("series:tt0944947", RandomEpisodeSettings.canonicalShowKey("TV", "tt0944947"))
        assertEquals(null, RandomEpisodeSettings.canonicalShowKey("movie", "tt0944947"))
        assertEquals(null, RandomEpisodeSettings.canonicalShowKey("series", "  "))
    }

    @Test
    fun `per-show toggle and pool remain independent and pool survives mode off`() {
        val first = "series:first"
        val second = "series:second"
        assertFalse(RandomEpisodeSettings.isShowEnabled(first))
        assertEquals(RandomEpisodeSettings.POOL_ALL, RandomEpisodeSettings.episodePool(first))

        assertTrue(RandomEpisodeSettings.toggleShow(first))
        RandomEpisodeSettings.setEpisodePool(first, RandomEpisodeSettings.POOL_UNWATCHED)
        assertTrue(RandomEpisodeSettings.isShowEnabled(first))
        assertFalse(RandomEpisodeSettings.isShowEnabled(second))
        assertEquals(RandomEpisodeSettings.POOL_UNWATCHED, RandomEpisodeSettings.episodePool(first))
        assertEquals(RandomEpisodeSettings.POOL_ALL, RandomEpisodeSettings.episodePool(second))

        assertFalse(RandomEpisodeSettings.toggleShow(first))
        assertEquals(RandomEpisodeSettings.POOL_UNWATCHED, RandomEpisodeSettings.episodePool(first))
    }

    @Test
    fun `watched snapshots replace stale state and completion marking is additive`() {
        val show = "series:watch-state"
        RandomEpisodeSettings.replaceWatchedEpisodes(show, setOf("1:1", "1:2"))
        assertEquals(setOf("1:1", "1:2"), RandomEpisodeSettings.watchedEpisodes(show))

        RandomEpisodeSettings.replaceWatchedEpisodes(show, setOf("2:1"))
        RandomEpisodeSettings.markEpisodeWatched(show, 2, 2)
        RandomEpisodeSettings.markEpisodeWatched(show, 0, 3)
        assertEquals(setOf("2:1", "2:2"), RandomEpisodeSettings.watchedEpisodes(show))
    }
}
