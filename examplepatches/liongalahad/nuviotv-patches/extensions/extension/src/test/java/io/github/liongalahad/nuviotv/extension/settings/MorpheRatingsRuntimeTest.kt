package io.github.liongalahad.nuviotv.extension.settings

import android.app.Application
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class MorpheRatingsRuntimeTest {
    class TestWatchProgress(
        private val completedAtDefaultThreshold: Boolean,
        private val completedAtSimklThreshold: Boolean,
        private val source: String
    ) {
        fun getSource(): String = source
        fun isCompleted(threshold: Float): Boolean =
            if (threshold == 0.80f) completedAtSimklThreshold else completedAtDefaultThreshold
    }

    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        MorpheSettingsRuntime.setOverallRatingsShown(true)
        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_SHOW)
    }

    @Test
    fun `overall ratings default policy preserves value and hide removes it`() {
        val rating = 8.4f
        assertEquals(rating, MorpheSettingsRuntime.filterOverallRating(rating))
        assertFalse(MorpheSettingsRuntime.shouldHideOverallRating(false))
        assertEquals("Standard and TMDB ratings are shown.", MorpheSettingsRuntime.overallRatingsDescription())

        MorpheSettingsRuntime.setOverallRatingsShown(false)
        assertNull(MorpheSettingsRuntime.filterOverallRating(rating))
        assertTrue(MorpheSettingsRuntime.shouldHideOverallRating(false))
        assertTrue(MorpheSettingsRuntime.shouldHideOverallRating(true))
        assertEquals("Hide", MorpheSettingsRuntime.currentOverallRatingsTitle())
        assertEquals(
            "Standard and TMDB ratings are Hidden. MDBList provider settings take priority on detail pages.",
            MorpheSettingsRuntime.overallRatingsDescription()
        )
    }

    @Test
    fun `episode modes implement show hide and hide unwatched`() {
        val rating = 9.1
        assertEquals(rating, MorpheSettingsRuntime.filterEpisodeRating(rating, false)!!, 0.0)
        assertTrue(MorpheSettingsRuntime.shouldShowEpisodeRatingsSection())

        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_HIDE)
        assertNull(MorpheSettingsRuntime.filterEpisodeRating(rating, true))
        assertFalse(MorpheSettingsRuntime.shouldShowEpisodeRatingsSection())
        assertEquals("Hide", MorpheSettingsRuntime.currentEpisodeRatingsTitle())

        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_HIDE_UNWATCHED)
        assertNull(MorpheSettingsRuntime.filterEpisodeRating(rating, false))
        assertEquals(rating, MorpheSettingsRuntime.filterEpisodeRating(rating, true)!!, 0.0)
        assertTrue(MorpheSettingsRuntime.shouldShowEpisodeRatingsSection())
        assertEquals("Hide Unwatched", MorpheSettingsRuntime.currentEpisodeRatingsTitle())
    }

    @Test
    fun `hide unwatched treats completed progress and manual marks as watched`() {
        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_HIDE_UNWATCHED)
        val rating = 8.7
        val localComplete = TestWatchProgress(true, true, "local")
        val localIncomplete = TestWatchProgress(false, false, "local")
        val simklComplete = TestWatchProgress(false, true, "simkl_playback")

        assertEquals(rating, MorpheSettingsRuntime.filterEpisodeRating(localComplete, rating, false)!!, 0.0)
        assertNull(MorpheSettingsRuntime.filterEpisodeRating(localIncomplete, rating, false))
        assertEquals(rating, MorpheSettingsRuntime.filterEpisodeRating(simklComplete, rating, false)!!, 0.0)
        assertEquals(rating, MorpheSettingsRuntime.filterEpisodeRating(null, rating, true)!!, 0.0)
    }

    @Test
    fun `ratings tab map follows show hide and watched policies`() {
        val watchedKey = 1 to 1
        val completedKey = 1 to 2
        val unwatchedKey = 1 to 3
        val ratings = linkedMapOf(watchedKey to 8.1, completedKey to 8.2, unwatchedKey to 8.3)
        val progress = mapOf(
            completedKey to TestWatchProgress(true, true, "local"),
            unwatchedKey to TestWatchProgress(false, false, "local")
        )

        assertEquals(ratings, MorpheSettingsRuntime.filterEpisodeRatingsMap(ratings, progress, setOf(watchedKey)))
        assertTrue(MorpheSettingsRuntime.shouldShowEpisodeRatingsTab(true))

        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_HIDE)
        assertTrue(MorpheSettingsRuntime.filterEpisodeRatingsMap(ratings, progress, setOf(watchedKey)).isEmpty())
        assertFalse(MorpheSettingsRuntime.shouldShowEpisodeRatingsTab(true))

        MorpheSettingsRuntime.setEpisodeRatingsMode(MorpheSettingsRuntime.EPISODE_RATINGS_HIDE_UNWATCHED)
        assertEquals(
            linkedMapOf(watchedKey to 8.1, completedKey to 8.2),
            MorpheSettingsRuntime.filterEpisodeRatingsMap(ratings, progress, setOf(watchedKey))
        )
        assertTrue(MorpheSettingsRuntime.shouldShowEpisodeRatingsTab(true))
        assertFalse(MorpheSettingsRuntime.shouldShowEpisodeRatingsTab(false))
    }

    @Test
    fun `invalid episode mode normalizes to show and values commit synchronously`() {
        MorpheSettingsRuntime.setEpisodeRatingsMode(99)
        assertEquals(MorpheSettingsRuntime.EPISODE_RATINGS_SHOW,
            MorpheSettingsRuntime.episodeRatingsModeOrdinal())
        val field = MorpheSettingsRuntime::class.java.getDeclaredField("preferences")
        field.isAccessible = true
        val prefs = field.get(null) as android.content.SharedPreferences
        assertEquals("SHOW", prefs.getString(MorpheSettingsRuntime.EPISODE_RATINGS_KEY, null))

        MorpheSettingsRuntime.setOverallRatingsShown(false)
        assertFalse(prefs.getBoolean(MorpheSettingsRuntime.OVERALL_RATINGS_KEY, true))
    }
}
