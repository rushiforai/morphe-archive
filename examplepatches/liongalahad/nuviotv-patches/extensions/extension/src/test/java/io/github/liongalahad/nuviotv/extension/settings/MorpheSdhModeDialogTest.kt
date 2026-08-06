package io.github.liongalahad.nuviotv.extension.settings

import android.app.Activity
import android.view.Gravity
import android.view.ViewGroup
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.Robolectric
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class MorpheSdhModeDialogTest {
    private val activity: Activity = Robolectric.buildActivity(Activity::class.java).setup().get()

    @After
    fun tearDown() {
        activity.finish()
    }

    @Test
    fun `dialog has final centered geometry before first frame for every mode`() {
        val expectedWidth = Math.round(440 * activity.resources.displayMetrics.density)

        for (mode in MorpheSettingsRuntime.SDH_MODE_OFF..MorpheSettingsRuntime.SDH_MODE_REMOVE_LYRICS) {
            MorpheSettingsRuntime.setSdhCleanupMode(activity, mode)

            val dialog = MorpheSdhModeDialog.create(activity)
            val attributes = requireNotNull(dialog.window).attributes

            assertFalse(dialog.isShowing)
            assertEquals(expectedWidth, attributes.width)
            assertEquals(ViewGroup.LayoutParams.WRAP_CONTENT, attributes.height)
            assertEquals(Gravity.CENTER, attributes.gravity)

            dialog.dismiss()
        }
    }
}
