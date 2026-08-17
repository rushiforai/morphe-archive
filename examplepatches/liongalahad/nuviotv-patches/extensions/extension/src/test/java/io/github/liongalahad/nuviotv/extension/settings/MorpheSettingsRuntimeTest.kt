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
import kotlin.jvm.functions.Function0

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
    fun `category list leaves native medium spacing arrangement explicit`() {
        assertEquals(494, MorpheSettingsRows.categoryListDefaultMaskForTesting())
        assertEquals(0, MorpheSettingsRows.categoryListDefaultMaskForTesting() and 16)
    }

    @Test
    fun `native switch bridge accepts wrapper and full 0_8_4 row shapes`() {
        assertTrue(
            MorpheSettingsRows.matchesNativeSwitchParametersForTesting(
                arrayOf(
                    String::class.java,
                    String::class.java,
                    Boolean::class.javaPrimitiveType!!,
                    Function0::class.java,
                    Function0::class.java,
                    Any::class.java,
                    Int::class.javaPrimitiveType!!
                )
            )
        )
        assertTrue(
            MorpheSettingsRows.matchesNativeSwitchParametersForTesting(
                arrayOf(
                    String::class.java,
                    String::class.java,
                    Boolean::class.javaPrimitiveType!!,
                    Function0::class.java,
                    Any::class.java,
                    Function0::class.java,
                    Boolean::class.javaPrimitiveType!!,
                    Any::class.java,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!
                )
            )
        )
        assertFalse(
            MorpheSettingsRows.matchesNativeSwitchParametersForTesting(
                arrayOf(String::class.java, String::class.java, Boolean::class.javaPrimitiveType!!)
            )
        )
    }

    @Test
    fun `native selector bridge accepts the 0_8_4 card shape`() {
        assertTrue(
            MorpheSettingsRows.matchesNativeSelectorParametersForTesting(
                arrayOf(
                    String::class.java,
                    String::class.java,
                    String::class.java,
                    Function0::class.java,
                    Any::class.java,
                    Function0::class.java,
                    Boolean::class.javaPrimitiveType!!,
                    Any::class.java,
                    Any::class.java,
                    Long::class.javaPrimitiveType!!,
                    Any::class.java,
                    Integer::class.java,
                    Float::class.javaPrimitiveType!!,
                    Long::class.javaPrimitiveType!!,
                    Any::class.java,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!,
                    Int::class.javaPrimitiveType!!
                )
            )
        )
    }

    @Test
    fun `four modes commit synchronously and expose exact labels`() {
        assertEquals("Off", MorpheSettingsRuntime.sdhModeTitle(0))
        assertEquals("Remove SDH, keep lyrics", MorpheSettingsRuntime.sdhModeTitle(1))
        assertEquals("Full cleanup", MorpheSettingsRuntime.sdhModeTitle(2))
        assertEquals("Normalize music symbols only", MorpheSettingsRuntime.sdhModeTitle(3))
        assertEquals("SDH subtitle processing", MorpheSettingsRuntime.sdhDialogTitle())
        assertEquals("Do not alter subtitle text.", MorpheSettingsRuntime.sdhModeDescription(0))
        assertEquals(
            "Replace repeated or misdecoded lyric markers with music-note symbols without removing text.",
            MorpheSettingsRuntime.sdhModeDescription(3)
        )
        assertEquals(
            "Remove annotations, sound descriptions and speaker labels while preserving and normalizing likely song lyrics.",
            MorpheSettingsRuntime.sdhModeDescription(1)
        )
        assertEquals(
            "Also remove all text enclosed by normal, inferred or misdecoded music-note markers.",
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

        MorpheSettingsRuntime.setSdhCleanupMode(
            application,
            MorpheSettingsRuntime.SDH_MODE_NORMALIZE_MUSIC_SYMBOLS
        )
        assertEquals(3, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertEquals("Normalize music symbols only", MorpheSettingsRuntime.currentSdhModeTitle())
        assertFalse(MorpheSettingsRuntime.isRemoveSdhEnabled())

        MorpheSettingsRuntime.setSdhCleanupMode(application, 99)
        assertEquals(0, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertFalse(MorpheSettingsRuntime.isRemoveSdhEnabled())
    }

    @Test
    fun `fresh SDH preference defaults to music-symbol normalization`() {
        val preferences = application.getSharedPreferences("fresh-sdh-default", 0)
        preferences.edit().clear().commit()
        val reader = MorpheSettingsRuntime::class.java.getDeclaredMethod(
            "readSdhCleanupMode",
            android.content.SharedPreferences::class.java
        )
        reader.isAccessible = true
        assertEquals(
            MorpheSettingsRuntime.SDH_MODE_NORMALIZE_MUSIC_SYMBOLS,
            reader.invoke(null, preferences)
        )
        preferences.edit()
            .putString(MorpheSettingsRuntime.SDH_CLEANUP_MODE_KEY, "OFF")
            .commit()
        assertEquals(MorpheSettingsRuntime.SDH_MODE_OFF, reader.invoke(null, preferences))
    }

    @Test
    fun `sdh marking defaults on and persists independently`() {
        val application = ApplicationProvider.getApplicationContext<android.app.Application>()
        application.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().remove(MorpheSettingsRuntime.SDH_MARKING_KEY).commit()
        assertTrue(MorpheSettingsRuntime.isSdhMarkingEnabled())

        MorpheSettingsRuntime.setSdhMarkingEnabled(application, false)
        assertFalse(MorpheSettingsRuntime.isSdhMarkingEnabled())

        assertTrue(MorpheSettingsRuntime.toggleSdhMarkingEnabled())
        assertTrue(MorpheSettingsRuntime.isSdhMarkingEnabled())
        assertEquals("Mark SDH subtitles", MorpheSettingsRuntime.sdhMarkingTitle())

        MorpheSettingsRuntime.setSdhMarkingEnabled(application, false)
    }
}
