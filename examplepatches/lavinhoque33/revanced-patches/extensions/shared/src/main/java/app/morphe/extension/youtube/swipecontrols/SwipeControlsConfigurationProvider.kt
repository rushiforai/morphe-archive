package app.morphe.extension.youtube.swipecontrols

import android.graphics.Color
import app.morphe.extension.shared.settings.Setting
import app.morphe.extension.shared.settings.preference.SeekBarPreference
import app.morphe.extension.shared.utils.Utils.validateColor
import app.morphe.extension.shared.utils.Utils.validateValue
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.shared.LockModeState
import app.morphe.extension.youtube.shared.PlayerType
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection

/**
 * Provides configuration settings for edge-assigned swipe controls in the YouTube player.
 * Manages action assignments, enabling/disabling gestures, overlay appearance, and behavior
 * preferences.
 */
class SwipeControlsConfigurationProvider {

    /** Action assigned to one of the four swipe zones. */
    enum class SwipeZoneAction {
        OFF,
        VOLUME,
        BRIGHTNESS,
        SPEED,
        SEEK,
    }

    /** Makes a setting available when at least one edge has an assigned action. */
    class AnySwipeZoneAvailability : Setting.Availability {
        override fun isAvailable() =
            Settings.SWIPE_LEFT_ZONE.get() != SwipeZoneAction.OFF ||
                Settings.SWIPE_RIGHT_ZONE.get() != SwipeZoneAction.OFF ||
                Settings.SWIPE_TOP_ZONE.get() != SwipeZoneAction.OFF ||
                Settings.SWIPE_BOTTOM_ZONE.get() != SwipeZoneAction.OFF

        override fun getParentSettings(): List<Setting<*>> =
            listOf(
                Settings.SWIPE_LEFT_ZONE,
                Settings.SWIPE_RIGHT_ZONE,
                Settings.SWIPE_TOP_ZONE,
                Settings.SWIPE_BOTTOM_ZONE,
            )
    }

    /** Makes a setting available when a side zone has an assigned action. */
    class SideSwipeZonesAvailability : Setting.Availability {
        override fun isAvailable() =
            Settings.SWIPE_LEFT_ZONE.get() != SwipeZoneAction.OFF ||
                Settings.SWIPE_RIGHT_ZONE.get() != SwipeZoneAction.OFF

        override fun getParentSettings(): List<Setting<*>> =
            listOf(Settings.SWIPE_LEFT_ZONE, Settings.SWIPE_RIGHT_ZONE)
    }

    /** Makes a setting available when a top or bottom zone has an assigned action. */
    class HorizontalSwipeZonesAvailability : Setting.Availability {
        override fun isAvailable() =
            Settings.SWIPE_TOP_ZONE.get() != SwipeZoneAction.OFF ||
                Settings.SWIPE_BOTTOM_ZONE.get() != SwipeZoneAction.OFF

        override fun getParentSettings(): List<Setting<*>> =
            listOf(Settings.SWIPE_TOP_ZONE, Settings.SWIPE_BOTTOM_ZONE)
    }

    /** Makes a setting available when any edge is assigned the requested action. */
    class SwipeActionAvailability(private val action: SwipeZoneAction) : Setting.Availability {
        override fun isAvailable() =
            Settings.SWIPE_LEFT_ZONE.get() == action ||
                Settings.SWIPE_RIGHT_ZONE.get() == action ||
                Settings.SWIPE_TOP_ZONE.get() == action ||
                Settings.SWIPE_BOTTOM_ZONE.get() == action

        override fun getParentSettings(): List<Setting<*>> =
            listOf(
                Settings.SWIPE_LEFT_ZONE,
                Settings.SWIPE_RIGHT_ZONE,
                Settings.SWIPE_TOP_ZONE,
                Settings.SWIPE_BOTTOM_ZONE,
            )
    }

    // region swipe enable

    /** Whether any assigned edge can handle swipes in the current player mode. */
    val enableSwipeControls: Boolean
        get() = hasAssignedZones() && (isFullscreenVideo || enablePortraitSwipeControls)

    internal fun hasAssignedZones(): Boolean =
        leftZoneAction != SwipeZoneAction.OFF || rightZoneAction != SwipeZoneAction.OFF ||
            topZoneAction != SwipeZoneAction.OFF || bottomZoneAction != SwipeZoneAction.OFF

    internal val portraitSwipeEnabled: Boolean
        get() = Settings.SWIPE_PORTRAIT.get()

    /** Orientation and the visible player bounds are checked by the host before accepting a touch. */
    val enablePortraitSwipeControls: Boolean
        get() = portraitSwipeEnabled && PlayerType.current == PlayerType.WATCH_WHILE_MAXIMIZED

    /**
     * The action assigned to the left swipe zone.
     */
    val leftZoneAction: SwipeZoneAction
        get() = Settings.SWIPE_LEFT_ZONE.get()

    /**
     * The action assigned to the right swipe zone.
     */
    val rightZoneAction: SwipeZoneAction
        get() = Settings.SWIPE_RIGHT_ZONE.get()

    /**
     * The action assigned to the top swipe zone.
     */
    val topZoneAction: SwipeZoneAction
        get() = Settings.SWIPE_TOP_ZONE.get()

    /**
     * The action assigned to the bottom swipe zone.
     */
    val bottomZoneAction: SwipeZoneAction
        get() = Settings.SWIPE_BOTTOM_ZONE.get()

    /**
     * Indicates whether swipe controls for adjusting volume are enabled.
     */
    val enableVolumeControls: Boolean
        get() = isActionAssigned(SwipeZoneAction.VOLUME)

    /**
     * Indicates whether swipe controls for adjusting brightness are enabled.
     */
    val enableBrightnessControl: Boolean
        get() = isActionAssigned(SwipeZoneAction.BRIGHTNESS)

    /**
     * Indicates whether swipe controls for adjusting playback speed are enabled.
     */
    val enableSpeedControl: Boolean
        get() = isActionAssigned(SwipeZoneAction.SPEED)

    /**
     * Indicates whether swipe controls for seeking are enabled.
     */
    val enableSeekControl: Boolean
        get() = isActionAssigned(SwipeZoneAction.SEEK)

    private fun isActionAssigned(action: SwipeZoneAction) =
        leftZoneAction == action ||
            rightZoneAction == action ||
            topZoneAction == action ||
            bottomZoneAction == action

    /**
     * Fix https://github.com/inotia00/ReVanced_Extended/issues/3052.
     */
    val fixTapAndHoldSpeed = Settings.FIX_SWIPE_TAP_AND_HOLD_SPEED.get()

    /**
     * Checks if the video player is currently in fullscreen mode.
     */
    private val isFullscreenVideo: Boolean
        get() = if (fixTapAndHoldSpeed)
            PlayerType.current.isFullScreenOrSlidingFullScreen()
        else
            PlayerType.current == PlayerType.WATCH_WHILE_FULLSCREEN

    /**
     * is the video player currently in lock mode?
     */
    val isScreenLocked: Boolean
        get() = LockModeState.current.isLocked()

    val enableSwipeControlsLockMode: Boolean
        get() = Settings.SWIPE_LOCK_MODE.get()

    // endregion

    // region keys enable

    /**
     * Indicates whether volume key controls should be overridden by swipe controls.
     * Returns true if volume controls are enabled and the video is in fullscreen mode.
     */
    val overwriteVolumeKeyControls: Boolean
        get() = enableVolumeControls && isFullscreenVideo

    // endregion

    // region gesture adjustments

    /**
     * Indicates whether press-to-swipe mode is enabled, requiring a press before swiping to activate controls.
     */
    val shouldEnablePressToSwipe = Settings.SWIPE_PRESS_TO_ENGAGE.get()

    /**
     * The threshold for detecting swipe gestures, in pixels.
     * Loaded once to ensure consistent behavior during rapid scroll events.
     */
    val swipeMagnitudeThreshold = Settings.SWIPE_MAGNITUDE_THRESHOLD.get()

    /**
     * The sensitivity of volume swipe gestures, determining how much volume changes per swipe.
     * Resets to default if set to 0, as it would disable swiping.
     */
    val volumeSwipeSensitivity: Int by lazy {
        validateValue(
            Settings.SWIPE_VOLUMES_SENSITIVITY,
            1,
            1000,
            "revanced_swipe_volume_sensitivity_invalid_toast"
        )
    }

    /**
     * The distance of volume swipe gestures.
     */
    val volumeDistance: Float by lazy {
        validateValue(
            Settings.SWIPE_VOLUME_DISTANCE,
            1,
            1000,
            "revanced_swipe_distance_invalid"
        ).toFloat() / 100 * 10 // 10f
    }

    /**
     * The distance of brightness swipe gestures.
     */
    val brightnessDistance: Float by lazy {
        validateValue(
            Settings.SWIPE_BRIGHTNESS_DISTANCE,
            1,
            1000,
            "revanced_swipe_distance_invalid"
        ).toFloat() / 100 // 1f
    }

    /**
     * The distance of speed swipe gestures.
     */
    val speedDistance: Float by lazy {
        validateValue(
            Settings.SWIPE_SPEED_DISTANCE,
            1,
            1000,
            "revanced_swipe_distance_invalid"
        ).toFloat() / 100 * 10 // 10f
    }

    /**
     * The distance of seek swipe gestures.
     */
    val seekDistance: Float by lazy {
        validateValue(
            Settings.SWIPE_SEEK_DISTANCE,
            1,
            1000,
            "revanced_swipe_distance_invalid"
        ).toFloat() / 100 * 10 // 10f
    }

    // endregion

    // region overlay adjustments

    /**
     * Indicates whether haptic feedback should be enabled for swipe control interactions.
     */
    val shouldEnableHapticFeedback = Settings.SWIPE_HAPTIC_FEEDBACK.get()

    /**
     * The duration in milliseconds that the overlay should remain visible after a change.
     */
    val overlayShowTimeoutMillis = Settings.SWIPE_OVERLAY_TIMEOUT.get()

    /** The color picker controls RGB; the existing opacity slider is the only source of alpha. */
    val overlayBackgroundColor: Int by lazy {
        val opacity = SeekBarPreference.clampToRange(Settings.SWIPE_OVERLAY_OPACITY) * 255 / 100
        val color = validateColor(Settings.SWIPE_OVERLAY_BACKGROUND_COLOR)
        Color.argb(opacity, Color.red(color), Color.green(color), Color.blue(color))
    }

    /**
     * The color of the progress bar in the overlay for brightness.
     * Resets to default and shows a toast if the color string is invalid or empty.
     */
    val overlayBrightnessProgressColor: Int by lazy {
        // Use lazy to avoid repeat parsing. Changing color requires app restart.
        validateColor(Settings.SWIPE_OVERLAY_BRIGHTNESS_COLOR)
    }

    /**
     * The color of the progress bar in the overlay for volume.
     * Resets to default and shows a toast if the color string is invalid or empty.
     */
    val overlayVolumeProgressColor: Int by lazy {
        validateColor(Settings.SWIPE_OVERLAY_VOLUME_COLOR)
    }

    /**
     * The color of the progress bar in the overlay for speed.
     * Resets to default and shows a toast if the color string is invalid or empty.
     */
    val overlaySpeedProgressColor: Int by lazy {
        validateColor(Settings.SWIPE_OVERLAY_SPEED_COLOR)
    }

    /**
     * The color of the progress bar in the overlay for seeking.
     * Resets to default and shows a toast if the color string is invalid or empty.
     */
    val overlaySeekProgressColor: Int by lazy {
        validateColor(Settings.SWIPE_OVERLAY_SEEK_COLOR)
    }

    /**
     * The background color used for the filled portion of the progress bar in the overlay.
     */
    val overlayFillBackgroundPaint = 0x80D3D3D3.toInt()

    /**
     * The color used for text and icons in the overlay.
     */
    internal val overlayForegroundColor: Int by lazy {
        validateColor(Settings.SWIPE_OVERLAY_FOREGROUND_COLOR) or Color.BLACK
    }

    /**
     * The text size in the overlay, in scale-independent pixels (sp).
     */
    val overlayTextSize: Int
        get() = SeekBarPreference.clampToRange(Settings.SWIPE_OVERLAY_TEXT_SIZE)

    /**
     * Percentage of the effective player width reserved at both sides for vertical swipes.
     */
    val verticalSwipeZoneSize: Int by lazy {
        validateValue(
            Settings.SWIPE_VERTICAL_ZONE,
            0,
            50,
            "revanced_swipe_overlay_rect_size_invalid_toast"
        )
    }

    /**
     * Percentage of the effective player height reserved at the top and bottom for horizontal swipes.
     */
    val horizontalSwipeZoneSize: Int by lazy {
        validateValue(
            Settings.SWIPE_HORIZONTAL_ZONE,
            0,
            50,
            "revanced_swipe_overlay_rect_size_invalid_toast"
        )
    }

    /**
     * Defines the style of the swipe controls overlay, determining its layout and appearance.
     *
     * @property isMinimal Indicates whether the style is minimalistic, omitting detailed progress indicators.
     * @property isHorizontalCenter Indicates whether the horizontal bar is centered vertically.
     * @property isCircular Indicates whether the style uses a circular progress bar.
     * @property isVertical Indicates whether the style uses a vertical progress bar.
     */
    @Suppress("unused")
    enum class SwipeOverlayStyle(
        val isLegacy: Boolean = false,
        val isMinimal: Boolean = false,
        val isHorizontalCenter: Boolean = false,
        val isCircular: Boolean = false,
        val isVertical: Boolean = false
    ) {
        /**
         * Legacy style used until 2024.
         */
        LEGACY(isLegacy = true),

        /**
         * A full horizontal progress bar with detailed indicators.
         */
        HORIZONTAL,

        HORIZONTAL_CENTER(isHorizontalCenter = true),

        /**
         * A minimal horizontal progress bar positioned at the top.
         */
        HORIZONTAL_MINIMAL_TOP(isMinimal = true),

        /**
         * A minimal horizontal progress bar centered vertically.
         */
        HORIZONTAL_MINIMAL_CENTER(isMinimal = true, isHorizontalCenter = true),

        /**
         * A full circular progress bar with detailed indicators.
         */
        CIRCULAR(isCircular = true),

        /**
         * A minimal circular progress bar.
         */
        CIRCULAR_MINIMAL(isMinimal = true, isCircular = true),

        /**
         * A full vertical progress bar with detailed indicators.
         */
        VERTICAL(isVertical = true),

        /**
         * A minimal vertical progress bar.
         */
        VERTICAL_MINIMAL(isMinimal = true, isVertical = true),

        FOLLOW_DEFAULT,
    }

    fun overlayStyle(direction: SwipeDirection): SwipeOverlayStyle {
        val style = when (direction) {
            SwipeDirection.VERTICAL -> Settings.SWIPE_SIDE_OVERLAY_STYLE.get()
            SwipeDirection.HORIZONTAL -> Settings.SWIPE_TOP_BOTTOM_OVERLAY_STYLE.get()
            SwipeDirection.NONE -> SwipeOverlayStyle.FOLLOW_DEFAULT
        }
        if (style != SwipeOverlayStyle.FOLLOW_DEFAULT) return style

        return Settings.SWIPE_OVERLAY_STYLE.get().let {
            if (it == SwipeOverlayStyle.FOLLOW_DEFAULT) SwipeOverlayStyle.HORIZONTAL else it
        }
    }

    // endregion

    // region behaviour

    /**
     * Indicates whether the brightness level should be saved and restored when entering or exiting fullscreen mode.
     */
    val shouldSaveAndRestoreBrightness = Settings.SWIPE_SAVE_AND_RESTORE_BRIGHTNESS.get()

    /**
     * Indicates whether auto-brightness should be enabled when the brightness gesture reaches its lowest value.
     */
    val shouldLowestValueEnableAutoBrightness =
        Settings.SWIPE_LOWEST_VALUE_ENABLE_AUTO_BRIGHTNESS.get()

    /**
     * The saved brightness value for the swipe gesture, used to restore brightness in fullscreen mode.
     */
    var savedScreenBrightnessValue: Float
        get() = Settings.SWIPE_BRIGHTNESS_VALUE.get()
        set(value) = Settings.SWIPE_BRIGHTNESS_VALUE.save(value)

    // endregion

}
