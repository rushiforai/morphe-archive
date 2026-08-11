package io.github.liongalahad.nuviotv.extension.playback.localmedia

import android.content.pm.ActivityInfo
import android.content.pm.ResolveInfo
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [35])
class LocalMediaFolderPickerActivityTest {
    @Test
    fun `installed tree picker activity is accepted`() {
        val picker = ResolveInfo().apply {
            activityInfo = ActivityInfo().apply {
                packageName = "dev.dworks.apps.anexplorer"
                name = "dev.dworks.apps.anexplorer.DocumentsActivity"
            }
        }

        assertTrue(LocalMediaFolderPickerActivity.isUsableTreePicker(picker))
    }

    @Test
    fun `android tv non-picker stub is rejected`() {
        val stub = ResolveInfo().apply {
            activityInfo = ActivityInfo().apply {
                packageName = "com.android.tv.frameworkpackagestubs"
                name = "com.android.tv.frameworkpackagestubs.StubActivity"
            }
        }

        assertFalse(LocalMediaFolderPickerActivity.isUsableTreePicker(stub))
        assertFalse(LocalMediaFolderPickerActivity.isUsableTreePicker(null))
    }
}
