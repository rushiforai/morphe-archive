package app.morphe.extension.youtube.swipecontrols.controller.gesture.core

import app.morphe.extension.shared.utils.Utils.dipToPixels
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeZoneAction
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection
import app.morphe.extension.youtube.swipecontrols.controller.AudioVolumeController
import app.morphe.extension.youtube.swipecontrols.controller.ScreenBrightnessController
import app.morphe.extension.youtube.swipecontrols.misc.ScrollDistanceHelper
import app.morphe.extension.youtube.swipecontrols.misc.SwipeControlsOverlay

/**
 * describes a class that controls volume and brightness based on scrolling events
 */
interface VolumeAndBrightnessScroller {
    /**
     * submit a scroll for volume adjustment
     *
     * @param distance the scroll distance
     */
    fun scrollVolume(distance: Double)

    /**
     * submit a scroll for brightness adjustment
     *
     * @param distance the scroll distance
     */
    fun scrollBrightness(distance: Double)

    /**
     * submit a scroll for speed adjustment
     *
     * @param distance the scroll distance
     */
    fun scrollSpeed(distance: Double)

    /**
     * submit a scroll for seek adjustment
     *
     * @param distance the scroll distance
     */
    fun scrollSeek(distance: Double)

    /**
     * reset all scroll distances to zero
     */
    fun resetScroller()
}

internal fun VolumeAndBrightnessScroller.applySwipe(
    action: SwipeZoneAction,
    direction: SwipeDirection,
    distanceX: Double,
    distanceY: Double,
) {
    // Upward and rightward swipes increase volume, brightness, speed and seek position.
    val distance = if (direction == SwipeDirection.HORIZONTAL) -distanceX else distanceY
    when (action) {
        SwipeZoneAction.VOLUME -> scrollVolume(distance)
        SwipeZoneAction.BRIGHTNESS -> scrollBrightness(distance)
        SwipeZoneAction.SPEED -> scrollSpeed(distance)
        SwipeZoneAction.SEEK -> scrollSeek(distance)
        SwipeZoneAction.OFF -> Unit
    }
}

/**
 * handles scrolling of volume and brightness, adjusts them using the provided controllers and updates the overlay
 *
 * @param volumeController volume controller instance. if null, volume control is disabled
 * @param screenController screen brightness controller instance. if null, brightness control is disabled
 * @param overlayController overlay controller instance
 * @param volumeDistance unit distance for volume scrolling, in dp
 * @param brightnessDistance unit distance for brightness scrolling, in dp
 * @param volumeSwipeSensitivity how much volume will change by single swipe
 */
class VolumeAndBrightnessScrollerImpl(
    private val volumeController: AudioVolumeController?,
    private val screenController: ScreenBrightnessController?,
    private val overlayController: SwipeControlsOverlay,
    volumeDistance: Float,
    brightnessDistance: Float,
    speedDistance: Float,
    seekDistance: Float,
    private val volumeSwipeSensitivity: Int,
    adjustSpeed: (Int) -> Unit,
    seekBy: (Int) -> Unit,
    private val initialBrightness: (() -> Double)? = null,
) : VolumeAndBrightnessScroller {

    // region volume
    private val volumeScroller =
        ScrollDistanceHelper(
            dipToPixels(volumeDistance),
        ) { _, _, direction ->
            volumeController?.takeIf { it.isAvailable && it.maxVolume > 0 }?.run {
                adjustVolumeBySteps(direction * volumeSwipeSensitivity)
                overlayController.onVolumeChanged(volume, maxVolume, boostStep)
            }
        }

    override fun scrollVolume(distance: Double) = volumeScroller.add(distance)

    // endregion

    // region brightness

    private val brightnessScroller =
        ScrollDistanceHelper(
            dipToPixels(brightnessDistance),
        ) { _, _, direction ->
            screenController?.run {
                val shouldAdjustBrightness =
                    if (config.shouldLowestValueEnableAutoBrightness) {
                        screenBrightness > 0 || direction > 0
                    } else {
                        screenBrightness >= 0 || direction >= 0
                    }

                if (shouldAdjustBrightness) {
                    val current = screenBrightness
                    val start = if (current < 0 && direction > 0) initialBrightness?.invoke() ?: current else current
                    screenBrightness = start + direction
                } else {
                    restoreDefaultBrightness()
                }
                overlayController.onBrightnessChanged(screenBrightness)
            }
        }

    override fun scrollBrightness(distance: Double) = brightnessScroller.add(distance)
    // endregion

    // region speed
    private val speedScroller = ScrollDistanceHelper(
        dipToPixels(speedDistance),
    ) { _, _, direction ->
        adjustSpeed(direction)
    }

    override fun scrollSpeed(distance: Double) = speedScroller.add(distance)
    // endregion

    // region seek
    private val seekScroller = ScrollDistanceHelper(
        dipToPixels(seekDistance),
    ) { _, _, direction ->
        seekBy(direction * 500)
    }

    override fun scrollSeek(distance: Double) = seekScroller.add(distance)
    // endregion

    override fun resetScroller() {
        volumeScroller.reset()
        brightnessScroller.reset()
        speedScroller.reset()
        seekScroller.reset()
    }
}
