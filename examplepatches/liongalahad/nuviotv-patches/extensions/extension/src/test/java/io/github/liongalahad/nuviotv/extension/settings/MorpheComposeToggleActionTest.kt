package io.github.liongalahad.nuviotv.extension.settings

import android.app.Application
import androidx.test.core.app.ApplicationProvider
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
class MorpheComposeToggleActionTest {
    private lateinit var application: Application

    private class FakeComposeState {
        private var value: Any = false
        val writes = mutableListOf<Boolean>()

        fun getValue(): Any = value

        fun setValue(next: Any) {
            value = next
            writes += next as Boolean
        }
    }

    private class CapturedAction(
        @Suppress("unused") private val state: FakeComposeState
    ) : () -> Unit {
        override fun invoke() = Unit
    }

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        MorpheSettingsRuntime.setRemoveSdhEnabled(application, false)
        if (MorpheSettingsRuntime.isSubtitlesExpanded()) {
            MorpheSettingsRuntime.toggleSubtitlesExpanded()
        }
    }

    @Test
    fun `native mode action selects exact mode and pulses captured compose state`() {
        val state = FakeComposeState()
        MorpheSubtitlesExpandAction.wrap(CapturedAction(state))
        val action = MorpheComposeModeAction.forMode(MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS)

        action.invoke()

        assertEquals(MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())
        assertEquals(listOf(true, false), state.writes)
        assertFalse(state.getValue() as Boolean)
    }

    @Test
    fun `submenu action expands in place and pulses captured compose state`() {
        val state = FakeComposeState()
        val action = MorpheSubtitlesExpandAction.wrap(CapturedAction(state))

        action.invoke()

        assertTrue(MorpheSettingsRuntime.isSubtitlesExpanded())
        assertEquals("Open", MorpheSettingsRuntime.subtitlesExpansionStatus())
        assertEquals(listOf(true, false), state.writes)
    }

    @Test
    fun `mode action reaches compose state captured by submenu wrapper`() {
        val state = FakeComposeState()
        MorpheSubtitlesExpandAction.wrap(CapturedAction(state))

        MorpheComposeModeAction.forMode(MorpheSettingsRuntime.SDH_MODE_KEEP_LYRICS).invoke()

        assertEquals(MorpheSettingsRuntime.SDH_MODE_KEEP_LYRICS, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())
        assertEquals(listOf(true, false), state.writes)
    }
}
