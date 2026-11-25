/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Modified by lavinhoque33, 2026-11-24.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline

import android.app.Activity
import android.provider.Settings.System
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.widget.FrameLayout
import app.morphe.extension.shared.utils.Logger
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils.getIdentifier
import app.morphe.extension.youtube.patches.video.PlaybackSpeedValues
import app.morphe.extension.youtube.settings.Settings
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeZoneAction
import app.morphe.extension.youtube.swipecontrols.controller.AudioVolumeController
import app.morphe.extension.youtube.swipecontrols.controller.ScreenBrightnessController
import app.morphe.extension.youtube.swipecontrols.controller.SwipeZonesController
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetectorImpl
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.VolumeAndBrightnessScrollerImpl
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.applySwipe
import app.morphe.extension.youtube.swipecontrols.misc.Point
import app.morphe.extension.youtube.swipecontrols.misc.Rectangle
import app.morphe.extension.youtube.swipecontrols.misc.SwipeControlsOverlay
import app.morphe.extension.youtube.swipecontrols.misc.contains
import app.morphe.extension.youtube.swipecontrols.misc.toPoint
import app.morphe.extension.youtube.swipecontrols.views.SwipeControlsOverlayLayout

/** Receives only touches that missed the offline player's interactive child views. */
internal class OfflineSwipeControls private constructor(activity: Activity, root: FrameLayout) {
    companion object {
        @JvmStatic
        fun create(activity: Activity, root: FrameLayout): OfflineSwipeControls? {
            // Only the optional Swipe controls patch installs the HUD drawables.
            if (getIdentifier("revanced_ic_sc_brightness_auto", ResourceType.DRAWABLE, activity) == 0) return null
            return OfflineSwipeControls(activity, root)
        }
    }

    private val config = SwipeControlsConfigurationProvider()
    private val brightness = if (config.enableBrightnessControl) {
        ScreenBrightnessController(activity.window, config)
    } else null
    private val volume = if (config.enableVolumeControls) AudioVolumeController(activity, allowBoost = false) else null
    private val overlay = SwipeControlsOverlayLayout(activity, config)
    private val zones = SwipeZonesController(config, activity) { Rectangle(0, 0, root.width, root.height) }
    private val detector = SwipeDetectorImpl(
        maxOf(config.swipeMagnitudeThreshold, ViewConfiguration.get(activity).scaledTouchSlop).toDouble(),
    )
    private var speedSteps = 0
    private var seekDelta = 0L
    private var brightnessFeedback = Double.NaN
    private var volumeFeedback = -1
    private var maxVolume = 0
    private val feedback = object : SwipeControlsOverlay by overlay {
        override fun onBrightnessChanged(brightness: Double) {
            brightnessFeedback = brightness
            overlay.onBrightnessChanged(brightness)
        }

        override fun onVolumeChanged(newVolume: Int, maximumVolume: Int, boostStep: Int) {
            volumeFeedback = newVolume
            maxVolume = maximumVolume
            overlay.onVolumeChanged(newVolume, maximumVolume, boostStep)
        }
    }

    private val scroller = VolumeAndBrightnessScrollerImpl(
        volume, brightness, feedback, config.volumeDistance, config.brightnessDistance,
        config.speedDistance, config.seekDistance, config.volumeSwipeSensitivity,
        adjustSpeed = { speedSteps += it }, seekBy = { seekDelta += it },
        initialBrightness = {
            // Android's negative window value means “follow the system”, not a brightness of -100%.
            System.getInt(activity.contentResolver, System.SCREEN_BRIGHTNESS, 128).coerceIn(0, 255) * 100.0 / 255
        },
    )
    private val delay = Settings.SWIPE_DELAY.get().coerceAtLeast(0)

    private var origin: Point? = null
    private var touchView: View? = null
    private var item: OfflineVideo? = null
    private var action = SwipeZoneAction.OFF
    private var pressEngaged = false
    private var lastX = 0f
    private var lastY = 0f
    private var pendingX = 0.0
    private var pendingY = 0.0
    private var seekTarget = 0L
    private var initialSpeed = 1f
    private var ready = false
    private val activate = Runnable {
        ready = true
        applyPendingMove()
    }

    init {
        if (config.hasAssignedZones()) root.addView(overlay, FrameLayout.LayoutParams(-1, -1))
    }

    /** @return Whether the origin is reserved for a vertical action, even before a long press. */
    fun begin(view: View, event: MotionEvent, fullscreen: Boolean, viewport: Rectangle): Boolean {
        finish(false)
        val current = OfflinePlayer.getCurrent() ?: return false
        if ((!fullscreen && !config.portraitSwipeEnabled) || !config.hasAssignedZones()) return false
        zones.setOfflineViewport(viewport)

        val point = event.toPoint()
        val verticalReserved = zones.actionAt(point, SwipeDirection.VERTICAL) != SwipeZoneAction.OFF
        if (!verticalReserved && !zones.containsActiveZone(point)) return false

        origin = point
        touchView = view
        item = current
        lastX = event.x
        lastY = event.y
        return verticalReserved
    }

    fun onLongPress() {
        if (origin != null && config.shouldEnablePressToSwipe) {
            pressEngaged = true
            overlay.onEnterSwipeSession()
        }
    }

    /** @return True from the first move that claims the gesture until it ends. */
    fun move(event: MotionEvent): Boolean {
        val start = origin ?: return false
        if (item !== OfflinePlayer.getCurrent()) return action != SwipeZoneAction.OFF
        if (config.shouldEnablePressToSwipe && !pressEngaged) return false

        if (action == SwipeZoneAction.OFF) {
            detector.submitDisplacement(event.x - start.x, event.y - start.y)
            val direction = detector.currentSwipe
            if (direction == SwipeDirection.NONE) return false

            action = zones.actionAt(start, direction)
            if (action == SwipeZoneAction.OFF) return false

            Logger.printDebug {
                val zone = when (direction) {
                    SwipeDirection.VERTICAL -> if (start in zones.left) "left" else "right"
                    else -> if (start in zones.top) "top" else "bottom"
                }
                "Swipe claimed: zone=$zone action=$action x=${start.x} y=${start.y} " +
                    "hudAttached=${overlay.isAttachedToWindow} hudShown=${overlay.isShown}"
            }

            overlay.selectGestureStyle(direction)
            seekTarget = OfflinePlayer.getPosition()
            initialSpeed = OfflinePlayer.getSpeed()
            if (config.shouldEnablePressToSwipe || delay == 0L) ready = true
            else touchView?.postDelayed(activate, delay)
        }

        pendingX += lastX - event.x
        pendingY += lastY - event.y
        lastX = event.x
        lastY = event.y
        if (ready) applyPendingMove()
        return true
    }

    private fun applyPendingMove() {
        if (item !== OfflinePlayer.getCurrent()) return
        scroller.applySwipe(action, detector.currentSwipe, pendingX, pendingY)
        pendingX = 0.0
        pendingY = 0.0

        if (speedSteps != 0) {
            val rate = PlaybackSpeedValues.adjustBySwipe(OfflinePlayer.getSpeed(), speedSteps)
            if (OfflinePlayer.setSpeed(rate)) overlay.onSpeedChanged(OfflinePlayer.getSpeed())
            speedSteps = 0
        }
        if (seekDelta != 0L) {
            val duration = OfflinePlayer.getDuration().coerceAtLeast(0)
            seekTarget = (seekTarget + seekDelta).coerceIn(0, duration)
            OfflinePlayer.seekTo(seekTarget)
            overlay.onSeekPositionChanged(seekTarget, duration)
            seekDelta = 0
        }
    }

    fun finish(commit: Boolean) {
        if (commit) {
            if (!brightnessFeedback.isNaN()) {
                Logger.printDebug {
                    "Brightness applied: percent=$brightnessFeedback windowOverride=${brightness?.rawScreenBrightness}"
                }
            }
            if (volumeFeedback >= 0) Logger.printDebug { "Volume applied: index=$volumeFeedback/$maxVolume" }
            if (!brightnessFeedback.isNaN() || volumeFeedback >= 0) overlay.keepFeedbackVisible()
        }

        if (commit && item === OfflinePlayer.getCurrent() && action == SwipeZoneAction.SPEED &&
            OfflinePlayer.getSpeed() != initialSpeed
        ) OfflinePlayer.rememberSpeed()

        touchView?.removeCallbacks(activate)
        touchView = null
        origin = null
        item = null
        action = SwipeZoneAction.OFF
        ready = false
        pressEngaged = false
        brightnessFeedback = Double.NaN
        volumeFeedback = -1
        pendingX = 0.0
        pendingY = 0.0
        detector.resetSwipe()
        scroller.resetScroller()
    }

    fun restoreBrightness(fullscreen: Boolean) {
        if (fullscreen && config.shouldSaveAndRestoreBrightness) brightness?.restore()
    }

    fun saveBrightness() {
        if (config.shouldSaveAndRestoreBrightness) brightness?.save()
        brightness?.restoreDefaultBrightness()
        overlay.hideFeedback()
    }
}
