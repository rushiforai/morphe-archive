package app.morphe.extension.youtube.swipecontrols.controller

import android.view.Window
import android.view.WindowManager
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider
import app.morphe.extension.youtube.swipecontrols.misc.clamp

/**
 * controller to adjust the screen brightness level
 *
 * @param window the player window whose brightness is adjusted
 */
class ScreenBrightnessController(
    private val window: Window,
    internal val config: SwipeControlsConfigurationProvider,
) {

    /**
     * the current screen brightness in percent, ranging from 0.0 to 100.0
     */
    var screenBrightness: Double
        get() = rawScreenBrightness * 100.0
        set(value) {
            rawScreenBrightness = (value.toFloat() / 100f).clamp(0f, 1f)
        }

    /**
     * restore the screen brightness to the default device brightness
     */
    fun restoreDefaultBrightness() {
        rawScreenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
    }

    // Flag that indicates whether the brightness has been restored
    private var isBrightnessRestored = false

    /**
     * save the current screen brightness into settings, to be brought back using [restore]
     */
    fun save() {
        if (isBrightnessRestored) {
            config.savedScreenBrightnessValue = rawScreenBrightness
            // Reset the flag
            isBrightnessRestored = false
        }
    }

    /**
     * restore the screen brightness from settings saved using [save]
     */
    fun restore() {
        rawScreenBrightness = config.savedScreenBrightnessValue
        // Mark that brightness has been restored
        isBrightnessRestored = true
    }

    /**
     * wrapper for the raw screen brightness in [WindowManager.LayoutParams.screenBrightness]
     */
    var rawScreenBrightness: Float
        get() = window.attributes.screenBrightness
        private set(value) {
            val attr = window.attributes
            attr.screenBrightness = value
            window.attributes = attr
        }
}
