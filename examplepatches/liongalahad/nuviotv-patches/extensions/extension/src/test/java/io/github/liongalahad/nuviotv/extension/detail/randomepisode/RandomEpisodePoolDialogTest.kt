package io.github.liongalahad.nuviotv.extension.detail.randomepisode

import android.app.Activity
import android.view.ViewGroup
import android.widget.LinearLayout
import android.widget.TextView
import io.github.liongalahad.nuviotv.extension.settings.MorpheSettingsRuntime
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class RandomEpisodePoolDialogTest {
    private lateinit var activity: Activity

    @Before
    fun setUp() {
        activity = Robolectric.buildActivity(Activity::class.java).setup().get()
        MorpheSettingsRuntime.initialize(activity)
        activity.getSharedPreferences(MorpheSettingsRuntime.PREFERENCES_NAME, 0)
            .edit().clear().commit()
    }

    @After
    fun tearDown() {
        activity.finish()
    }

    @Test
    fun `dialog exposes All and Unwatched only in TV focus order`() {
        val dialog = RandomEpisodePoolDialog.create(activity, "series:dialog")
        val content = dialogContent(dialog.window!!.decorView as ViewGroup)

        assertEquals(
            listOf("Episodes included", "All", "Unwatched only"),
            listOf(
                (content.getChildAt(0) as TextView).text.toString(),
                optionTitle(content.getChildAt(1) as ViewGroup),
                optionTitle(content.getChildAt(2) as ViewGroup)
            )
        )
        assertTrue(content.getChildAt(1).isFocused)
        assertTrue(content.getChildAt(1).isFocusable)
        assertTrue(content.getChildAt(2).isFocusable)
        dialog.dismiss()
    }

    @Test
    fun `selecting Unwatched only persists the show pool and invalidates UI state`() {
        val showKey = "series:dialog"
        val before = RandomEpisodeRefreshState.epochForTests()
        val dialog = RandomEpisodePoolDialog.create(activity, showKey)
        val content = dialogContent(dialog.window!!.decorView as ViewGroup)

        (content.getChildAt(2) as LinearLayout).performClick()

        assertEquals(RandomEpisodeSettings.POOL_UNWATCHED,
            RandomEpisodeSettings.episodePool(showKey))
        assertTrue(RandomEpisodeSettings.isShowEnabled(showKey))
        assertTrue(RandomEpisodeRefreshState.epochForTests() > before)
        assertFalse(dialog.isShowing)
    }

    @Test
    fun `choosing the already-selected pool while disabled enables random playback`() {
        val showKey = "series:dialog"
        val dialog = RandomEpisodePoolDialog.create(activity, showKey)
        val content = dialogContent(dialog.window!!.decorView as ViewGroup)

        (content.getChildAt(1) as LinearLayout).performClick()

        assertEquals(RandomEpisodeSettings.POOL_ALL, RandomEpisodeSettings.episodePool(showKey))
        assertTrue(RandomEpisodeSettings.isShowEnabled(showKey))
    }

    @Test
    fun `Back leaves a disabled show's pool and toggle unchanged`() {
        val showKey = "series:dialog"
        RandomEpisodeSettings.setEpisodePool(showKey, RandomEpisodeSettings.POOL_UNWATCHED)
        val dialog = RandomEpisodePoolDialog.create(activity, showKey)
        dialog.show()

        dialog.onBackPressed()

        assertFalse(RandomEpisodeSettings.isShowEnabled(showKey))
        assertEquals(RandomEpisodeSettings.POOL_UNWATCHED,
            RandomEpisodeSettings.episodePool(showKey))
        assertFalse(dialog.isShowing)
    }

    private fun dialogContent(decor: ViewGroup): LinearLayout {
        val frameworkContent = decor.findViewById<ViewGroup>(android.R.id.content)
        return frameworkContent.getChildAt(0) as LinearLayout
    }

    private fun optionTitle(option: ViewGroup): String {
        val labels = option.getChildAt(0) as ViewGroup
        return (labels.getChildAt(0) as TextView).text.toString()
    }
}
