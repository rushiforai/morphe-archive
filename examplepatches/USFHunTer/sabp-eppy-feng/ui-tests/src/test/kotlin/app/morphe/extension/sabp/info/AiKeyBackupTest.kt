package app.morphe.extension.sabp.info

import app.cash.paparazzi.DeviceConfig
import app.cash.paparazzi.Paparazzi
import app.morphe.extension.sabp.EppySettings
import app.morphe.extension.sabp.shots.TestContext
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Rule
import org.junit.Test

/** The Gemini key never goes into a settings backup. */
class AiKeyBackupTest {
    @get:Rule
    val paparazzi = Paparazzi(deviceConfig = DeviceConfig.PIXEL_5, theme = "android:Theme.Material.Light.NoActionBar")

    @Test
    fun keyIsNotBackedUp() {
        val c = TestContext(paparazzi.context, mapOf("skin" to "material"))
        Gemini.prefs(c).edit().putString("key", "AIzaSECRET-test-key").putBoolean("on", true).apply()
        assertTrue(Gemini.ready(c))
        val backup = EppySettings.export(c)
        assertTrue(backup.contains("skin"))
        assertFalse(backup.contains("AIzaSECRET"))
    }
}
