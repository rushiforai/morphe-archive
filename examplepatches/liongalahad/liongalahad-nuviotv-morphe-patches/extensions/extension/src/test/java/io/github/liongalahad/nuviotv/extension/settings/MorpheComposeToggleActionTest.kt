package io.github.liongalahad.nuviotv.extension.settings

import android.app.Application
import androidx.test.core.app.ApplicationProvider
import org.junit.Assert.assertEquals
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

    private class RefreshAction(
        private val state: FakeComposeState
    ) : () -> Unit {
        override fun invoke() {
            state.setValue(!(state.getValue() as Boolean))
        }
    }

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        MorpheSettingsRuntime.setRemoveSdhEnabled(application, false)
    }

    @Test
    fun `native mode action selects exact mode and invalidates shared compose state`() {
        val state = FakeComposeState()
        MorpheComposeModeAction.captureRefreshAction(RefreshAction(state))
        val action = MorpheComposeModeAction.forMode(MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS)

        action.invoke()

        assertEquals(MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())
        assertEquals(listOf(true), state.writes)
        assertTrue(state.getValue() as Boolean)
    }

    @Test
    fun `mode action reaches the shared settings refresh state`() {
        val state = FakeComposeState()
        MorpheComposeModeAction.captureRefreshAction(RefreshAction(state))

        MorpheComposeModeAction.forMode(MorpheSettingsRuntime.SDH_MODE_KEEP_LYRICS).invoke()

        assertEquals(MorpheSettingsRuntime.SDH_MODE_KEEP_LYRICS, MorpheSettingsRuntime.sdhCleanupModeOrdinal())
        assertTrue(MorpheSettingsRuntime.isRemoveSdhEnabled())
        assertEquals(listOf(true), state.writes)
    }
}
