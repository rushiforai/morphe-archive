package io.github.liongalahad.nuviotv.extension.playback.sourceselectionrestore

import android.app.Application
import android.content.Context
import android.os.Looper
import androidx.test.core.app.ApplicationProvider
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.Shadows
import org.robolectric.annotation.Config
import java.util.concurrent.TimeUnit

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class SourceSelectionRestoreRuntimeTest {
    private lateinit var application: Application

    @Before
    fun setUp() {
        application = ApplicationProvider.getApplicationContext()
        MorpheSettingsRuntime.initialize(application)
        SourceSelectionRestoreSettings.setEnabled(application, false)
        SourceSelectionRestoreRuntime.resetForTesting()
    }

    @Test
    fun `setting owns labels category order and synchronous preference`() {
        assertEquals("playback.restore_source_selection", SourceSelectionRestoreSettings.KEY)
        assertEquals("Restore source selection", SourceSelectionRestoreSettings.TITLE)
        assertEquals(
            "Return focus and scroll to the source you played after leaving the player.",
            SourceSelectionRestoreSettings.DESCRIPTION
        )
        val category = SourceSelectionRestoreSettingsCategory()
        assertEquals("playback", category.id())
        assertEquals(200, category.order())
        assertEquals(80, category.contentOrder())

        assertFalse(SourceSelectionRestoreSettings.isEnabled())
        assertTrue(SourceSelectionRestoreSettings.toggle())
        assertTrue(SourceSelectionRestoreSettings.isEnabled())
    }

    @Test
    fun `disabled callback preserves native behavior and never arms restore`() {
        var received: Any? = null
        val delegate: (Any?) -> Any? = { value ->
            received = value
            "delegated"
        }
        @Suppress("UNCHECKED_CAST")
        val wrapped = SourceSelectionRestoreRuntime.wrapSelectionCallback(delegate)
            as (Any?) -> Any?

        assertEquals("delegated", wrapped.invoke("source"))
        assertEquals("source", received)
        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 12))
        assertTrue(SourceSelectionRestoreRuntime.shouldRestoreSelection(true, 12))
    }

    @Test
    fun `enabled callback restores a non-first selection after player entry exactly once`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val delegate: (Any?) -> Any? = { "result" }
        @Suppress("UNCHECKED_CAST")
        val wrapped = SourceSelectionRestoreRuntime.wrapSelectionCallback(delegate)
            as (Any?) -> Any?

        assertEquals("result", wrapped.invoke("playback-info"))
        assertTrue(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
        assertFalse(SourceSelectionRestoreRuntime.isPlayerEnteredForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 27))
        assertTrue(SourceSelectionRestoreRuntime.isRestorePendingForTesting())

        val backDelegate: (Any?, Any?, Any?, Any?, Any?) -> Any? = { _, _, _, _, _ -> "back" }
        @Suppress("UNCHECKED_CAST")
        val wrappedBack = SourceSelectionRestoreRuntime.wrapPlayerBackCallback(backDelegate)
            as (Any?, Any?, Any?, Any?, Any?) -> Any?
        assertTrue(SourceSelectionRestoreRuntime.isPlayerEnteredForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 27))
        assertEquals("back", wrappedBack.invoke(null, null, null, false, false))
        assertTrue(SourceSelectionRestoreRuntime.isPlayerReturningForTesting())
        assertTrue(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 27))
        assertTrue(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 27))

        var handled = false
        val handledDelegate: () -> Any? = { handled = true; null }
        SourceSelectionRestoreRuntime.wrapRestoreHandledCallback(handledDelegate).invoke()
        assertTrue(handled)
        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 27))
    }

    @Test
    fun `first item and invalid indexes consume pending request without stale carryover`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val delegate: (Any?) -> Any? = { null }
        @Suppress("UNCHECKED_CAST")
        val wrapped = SourceSelectionRestoreRuntime.wrapSelectionCallback(delegate)
            as (Any?) -> Any?

        assertNull(wrapped.invoke("first"))
        val errorBack: () -> Any? = { null }
        val wrappedErrorBack = SourceSelectionRestoreRuntime.wrapPlayerErrorBackCallback(errorBack)
        wrappedErrorBack.invoke()
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 0))
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 5))

        wrapped.invoke("invalid")
        SourceSelectionRestoreRuntime.wrapPlayerErrorBackCallback(errorBack).invoke()
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, -1))
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 5))
    }

    @Test
    fun `native external-player restoration remains authoritative and clears marker`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val delegate: (Any?) -> Any? = { null }
        @Suppress("UNCHECKED_CAST")
        val wrapped = SourceSelectionRestoreRuntime.wrapSelectionCallback(delegate)
            as (Any?) -> Any?
        wrapped.invoke("source")

        assertTrue(SourceSelectionRestoreRuntime.shouldRestoreSelection(true, 4))
        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 4))
    }

    @Test
    fun `malformed preference falls back off and clears pending state`() {
        val preferences = application.getSharedPreferences(
            MorpheSettingsRuntime.PREFERENCES_NAME,
            Context.MODE_PRIVATE
        )
        preferences.edit()
            .putString(SourceSelectionRestoreSettings.KEY, "true")
            .commit()

        assertFalse(SourceSelectionRestoreSettings.isEnabled())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 9))
    }

    @Test
    fun `null and already wrapped callbacks are not nested`() {
        assertNull(SourceSelectionRestoreRuntime.wrapSelectionCallback(null))
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val delegate: (Any?) -> Any? = { it }
        val wrapped = SourceSelectionRestoreRuntime.wrapSelectionCallback(delegate)
        assertTrue(wrapped === SourceSelectionRestoreRuntime.wrapSelectionCallback(wrapped))

        val back: (Any?, Any?, Any?, Any?, Any?) -> Any? = { _, _, _, _, _ -> null }
        val wrappedBack = SourceSelectionRestoreRuntime.wrapPlayerBackCallback(back)
        assertTrue(wrappedBack === SourceSelectionRestoreRuntime.wrapPlayerBackCallback(wrappedBack))

        val errorBack: () -> Any? = { null }
        val wrappedErrorBack = SourceSelectionRestoreRuntime.wrapPlayerErrorBackCallback(errorBack)
        assertTrue(
            wrappedErrorBack === SourceSelectionRestoreRuntime.wrapPlayerErrorBackCallback(wrappedErrorBack)
        )

        val handled: () -> Any? = { null }
        val wrappedHandled = SourceSelectionRestoreRuntime.wrapRestoreHandledCallback(handled)
        assertTrue(
            wrappedHandled === SourceSelectionRestoreRuntime.wrapRestoreHandledCallback(wrappedHandled)
        )
    }

    @Test
    fun `player activity without a manual source selection never creates a restore`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)

        val back: (Any?, Any?, Any?, Any?, Any?) -> Any? = { _, _, _, _, _ -> null }
        @Suppress("UNCHECKED_CAST")
        val wrappedBack = SourceSelectionRestoreRuntime.wrapPlayerBackCallback(back)
            as (Any?, Any?, Any?, Any?, Any?) -> Any?
        wrappedBack.invoke(null, null, null, false, false)

        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
        assertFalse(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 8))
    }

    @Test
    fun `failed navigation callback cannot leak an armed selection`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val failure = IllegalStateException("navigation failed")
        val selection: (Any?) -> Any? = { throw failure }

        val thrown = runCatching {
            SourceSelectionRestoreRuntime.wrapSelectionCallback(selection).invoke("source")
        }.exceptionOrNull()

        assertTrue(thrown === failure)
        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
    }

    @Test
    fun `return schedules selected viewport before focus and completion clears state`() {
        SourceSelectionRestoreSettings.setEnabled(application, true)
        val selection: (Any?) -> Any? = { null }
        SourceSelectionRestoreRuntime.wrapSelectionCallback(selection).invoke("source")
        val back: (Any?, Any?, Any?, Any?, Any?) -> Any? = { _, _, _, _, _ -> null }
        SourceSelectionRestoreRuntime.wrapPlayerBackCallback(back)
            .invoke(null, null, null, false, false)
        assertTrue(SourceSelectionRestoreRuntime.shouldRestoreSelection(false, 31))

        val state = FakeLazyListState()
        SourceSelectionRestoreRuntime.scheduleViewportRestore(state)
        Shadows.shadowOf(Looper.getMainLooper()).idleFor(20, TimeUnit.MILLISECONDS)

        assertEquals(31, state.index)
        assertEquals(0, state.offset)
        assertTrue(state.calls >= 1)
        val handled: () -> Any? = { null }
        SourceSelectionRestoreRuntime.wrapRestoreHandledCallback(handled).invoke()
        assertFalse(SourceSelectionRestoreRuntime.isRestorePendingForTesting())
    }

    private class FakeLazyListState {
        var index = -1
        var offset = -1
        var calls = 0

        @Suppress("unused")
        fun requestScroll(index: Int, offset: Int) {
            this.index = index
            this.offset = offset
            calls++
        }
    }
}
