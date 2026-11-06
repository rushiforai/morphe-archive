package com.openbubbles.wear.bridge

import android.app.Application
import java.io.File
import org.junit.Assert.*
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner
import org.robolectric.RuntimeEnvironment
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(sdk = [32], application = Application::class)
class BridgeCacheIsolationTest {
    @Test fun clearingWearMediaLeavesTheNativeAppsFilesUntouched() {
        val context = RuntimeEnvironment.getApplication()
        val native = File(context.filesDir, "media_cache/native.bin").apply {
            parentFile!!.mkdirs(); writeText("native app data")
        }
        val cache = MediaCache(context)
        val wearable = File(context.filesDir, "openbubbles_wear_media_cache/owned.bin").apply { writeText("wear cache") }
        cache.clear()
        assertEquals("native app data", native.readText())
        assertFalse(wearable.exists())
    }
}
