package io.github.liongalahad.nuviotv.extension.settings

import android.app.Application
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertFalse
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class MorpheSettingsRuntimeTest {
    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        MorpheSettingsRuntime.setRemoveSdhEnabled(application, false)
    }

    @Test
    fun `visibility remap exposes only the hidden experience slot`() {
        assertTrue(MorpheSettingsRuntime.mapVisibilityOrdinal(0) == 4)
        assertTrue(MorpheSettingsRuntime.mapVisibilityOrdinal(3) == 3)
    }

    @Test
    fun `category and control descriptions remain available`() {
        assertEquals("Ratings", MorpheSettingsRuntime.ratingsCategoryTitle())
        assertEquals("Subtitles", MorpheSettingsRuntime.subtitlesCategoryTitle())
        assertEquals("Configure rating visibility", MorpheSettingsRuntime.ratingsCategoryDescription())
        assertEquals("Configure subtitle patch settings", MorpheSettingsRuntime.subtitlesCategoryDescription())
        assertEquals("Standard and TMDB ratings are shown.", MorpheSettingsRuntime.overallRatingsDescription())
        assertEquals(
            "Add SDH to English subtitle titles using metadata and repeated annotation patterns.",
            MorpheSettingsRuntime.sdhMarkingDescription()
        )
    }

    @Test
    fun `three modes commit synchronously and expose exact labels`() {
        assertEquals("Off", MorpheSettingsRuntime.sdhModeTitle(0))
        assertEquals("Remove SDH, keep lyrics", MorpheSettingsRuntime.sdhModeTitle(1))
        assertEquals("Full cleanup", MorpheSettingsRuntime.sdhModeTitle(2))
        assertEquals("Remove SDH annotations", MorpheSettingsRuntime.sdhDialogTitle())
        assertEquals("Do not remove any subtitle text.", MorpheSettingsRuntime.sdhModeDescription(0))
        assertEquals(
            "Remove annotations, sound descriptions and speaker labels while preserving likely song lyrics.",
            MorpheSettingsRuntime.sdhModeDescription(1)
        )
        assertEquals(
            "Also remove all text enclosed by normal or misdecoded music-note markers.",
            MorpheSettingsRuntime.sdhModeDescription(2)
        )

        MorpheSettingsRuntime.setSdhCleanupMode(application, 1)
        assertEquals(1, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertTrue(MorpheSettingsRuntime.isSdhModeSelected(1))
        assertFalse(MorpheSettingsRuntime.isSdhModeSelected(2))

        MorpheSettingsRuntime.setSdhCleanupMode(application, 2)
        assertEquals(2, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertEquals("Full cleanup", MorpheSettingsRuntime.currentSdhModeTitle())
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())

        MorpheSettingsRuntime.setSdhCleanupMode(application, 99)
        assertEquals(0, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertFalse(MorpheSettingsRuntime.isRemoveSdhEnabled())
    }

    @Test
    fun `sdh marking defaults off and persists independently`() {
        val application = ApplicationProvider.getApplicationContext<android.app.Application>()
        MorpheSettingsRuntime.setSdhMarkingEnabled(application, false)
        assertFalse(MorpheSettingsRuntime.isSdhMarkingEnabled())

        assertTrue(MorpheSettingsRuntime.toggleSdhMarkingEnabled())
        assertTrue(MorpheSettingsRuntime.isSdhMarkingEnabled())
        assertEquals("Mark SDH subtitles", MorpheSettingsRuntime.sdhMarkingTitle())

        MorpheSettingsRuntime.setSdhMarkingEnabled(application, false)
    }
}
