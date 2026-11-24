package app.morphe.extension.youtube.swipecontrols.controller.gesture.core

import android.view.GestureDetector
import android.view.MotionEvent
import app.morphe.extension.youtube.patches.video.PlaybackSpeedPatch.userSelectedPlaybackSpeed
import app.morphe.extension.youtube.patches.video.PlaybackSpeedValues
import app.morphe.extension.youtube.shared.VideoInformation
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeZoneAction
import app.morphe.extension.youtube.swipecontrols.SwipeControlsHostActivity
import app.morphe.extension.youtube.swipecontrols.misc.Point
import app.morphe.extension.youtube.swipecontrols.misc.contains
import app.morphe.extension.youtube.swipecontrols.misc.toPoint
import kotlin.math.abs

/**
 * the common base of all [GestureController] classes.
 * handles most of the boilerplate code needed for gesture detection
 *
 * @param controller reference to the main swipe controller
 */
abstract class BaseGestureController(
    private val controller: SwipeControlsHostActivity,
    private val reservePortraitSwipes: Boolean = false,
) : GestureController,
    GestureDetector.SimpleOnGestureListener(),
    SwipeDetector by SwipeDetectorImpl(
        controller.config.swipeMagnitudeThreshold.toDouble(),
    ),
    VolumeAndBrightnessScroller by VolumeAndBrightnessScrollerImpl(
        controller.audio,
        controller.screen,
        controller.overlay,
        controller.config.volumeDistance,
        controller.config.brightnessDistance,
        controller.config.speedDistance,
        controller.config.seekDistance,
        controller.config.volumeSwipeSensitivity,
        adjustSpeed = { direction ->
            val newSpeed = PlaybackSpeedValues.adjustBySwipe(VideoInformation.getPlaybackSpeed(), direction)
            VideoInformation.overridePlaybackSpeed(newSpeed)
            userSelectedPlaybackSpeed(newSpeed)
            controller.overlay.onSpeedChanged(newSpeed)
        },
        seekBy = { deltaMillis ->
            VideoInformation.seekToRelative(deltaMillis.toLong())
            controller.overlay.onSeekChanged(deltaMillis)
        },
    ) {

    /**
     * the main gesture detector that powers everything
     */
    @Suppress("LeakingThis")
    protected val detector = GestureDetector(controller, this)

    /**
     * were downstream event canceled already? used in [onScroll]
     */
    private var didCancelDownstream = false

    override fun submitTouchEvent(motionEvent: MotionEvent): Boolean {
        // create a copy of the event so we can modify it
        // without causing any issues downstream
        val me = MotionEvent.obtain(motionEvent)

        // check if we should drop this motion
        val dropped = shouldDropMotion(me)
        if (dropped) {
            me.action = MotionEvent.ACTION_CANCEL
        }

        val detectorConsumed = detector.onTouchEvent(me)

        // A claimed portrait gesture stays ours after leaving its start zone. Before the claim,
        // taps, unrelated scrolls and other gestures continue through the native player.
        val consumeEvent = if (controller.config.enablePortraitSwipeControls) {
            didCancelDownstream || (reservePortraitSwipes &&
                me.actionMasked == MotionEvent.ACTION_MOVE && detectorConsumed)
        } else {
            (detectorConsumed || shouldForceInterceptEvents) && isInSwipeZone(me)
        }

        // invoke the custom onUp handler
        if (me.action == MotionEvent.ACTION_UP || me.action == MotionEvent.ACTION_CANCEL) {
            onUp(me)
        }

        // recycle the copy
        me.recycle()

        return !dropped && consumeEvent
    }

    override fun cancelTouchEvent(event: MotionEvent) {
        val cancelEvent = MotionEvent.obtain(event)
        cancelEvent.action = MotionEvent.ACTION_CANCEL
        detector.onTouchEvent(cancelEvent)
        onUp(cancelEvent)
        cancelEvent.recycle()
    }

    /**
     * custom handler for [MotionEvent.ACTION_UP] event, because GestureDetector doesn't offer that :|
     *
     * @param motionEvent the motion event
     */
    open fun onUp(motionEvent: MotionEvent) {
        didCancelDownstream = false
        resetSwipe()
        resetScroller()
    }

    override fun onScroll(
        from: MotionEvent?,
        to: MotionEvent,
        distanceX: Float,
        distanceY: Float,
    ): Boolean {
        if (from == null) {
            return false
        }

        // submit to swipe detector
        submitForSwipe(from, to, distanceX, distanceY)

        // call swipe callback if in a swipe
        return if (currentSwipe != SwipeDetector.SwipeDirection.NONE) {
            val consumed = onSwipe(
                from,
                to,
                distanceX.toDouble(),
                distanceY.toDouble(),
            )

            // if the swipe was consumed, cancel downstream events once
            if (consumed && !didCancelDownstream) {
                didCancelDownstream = true
                MotionEvent.obtain(from).let {
                    it.action = MotionEvent.ACTION_CANCEL
                    controller.dispatchDownstreamTouchEvent(it)
                    it.recycle()
                }
            }

            consumed
        } else {
            shouldHoldPortraitMove(from, to)
        }
    }

    private fun shouldHoldPortraitMove(from: MotionEvent, to: MotionEvent): Boolean {
        if (!reservePortraitSwipes || !controller.config.enablePortraitSwipeControls ||
            (!controller.config.enableSwipeControlsLockMode && controller.config.isScreenLocked)
        ) return false

        // GestureDetector reached touch slop but the configured swipe threshold is higher.
        // Give a configured axis priority over native fullscreen drag only inside its start zone.
        val direction = if (abs(to.y - from.y) > abs(to.x - from.x)) {
            SwipeDetector.SwipeDirection.VERTICAL
        } else {
            SwipeDetector.SwipeDirection.HORIZONTAL
        }
        return swipeActionAt(from.toPoint(), direction) != SwipeZoneAction.OFF
    }

    /**
     * should [submitTouchEvent] force-intercept all touch events?
     */
    abstract val shouldForceInterceptEvents: Boolean

    /**
     * Checks if the provided motion event is in an active swipe zone for its direction.
     *
     * Before a direction is detected, all four configured edge zones are accepted. Once the
     * direction is known, only the zones belonging to that axis can consume the gesture.
     *
     * @param motionEvent the event to check.
     * @return whether the event is in an active swipe zone.
     */
    fun isInSwipeZone(motionEvent: MotionEvent): Boolean {
        val point = motionEvent.toPoint()
        return when (currentSwipe) {
            SwipeDetector.SwipeDirection.HORIZONTAL ->
                (controller.config.topZoneAction != SwipeZoneAction.OFF && point in controller.zones.top) ||
                    (controller.config.bottomZoneAction != SwipeZoneAction.OFF && point in controller.zones.bottom)

            SwipeDetector.SwipeDirection.VERTICAL ->
                (controller.config.leftZoneAction != SwipeZoneAction.OFF && point in controller.zones.left) ||
                    (controller.config.rightZoneAction != SwipeZoneAction.OFF && point in controller.zones.right)

            SwipeDetector.SwipeDirection.NONE -> controller.zones.containsActiveZone(point)
        }
    }

    /**
     * Resolves the action assigned to the zone where a swipe started.
     *
     * @param origin where the swipe started.
     * @param direction the detected swipe direction.
     * @return the configured action, or [SwipeZoneAction.OFF] if the origin is not valid for the
     * direction.
     */
    protected fun swipeActionAt(origin: Point, direction: SwipeDetector.SwipeDirection): SwipeZoneAction =
        controller.zones.actionAt(origin, direction)

    /**
     * Applies the action assigned to the zone where a swipe started.
     *
     * @param from start event of the swipe.
     * @param distanceX horizontal swipe distance.
     * @param distanceY vertical swipe distance.
     * @return whether the event was consumed.
     */
    protected fun applySwipeAction(from: MotionEvent, distanceX: Double, distanceY: Double): Boolean {
        val direction = currentSwipe
        val action = swipeActionAt(from.toPoint(), direction)
        if (action == SwipeZoneAction.OFF) return false

        controller.overlay.selectGestureStyle(direction)
        applySwipe(action, direction, distanceX, distanceY)
        return true
    }

    /**
     * check if a touch event should be dropped.
     * when an event is dropped, the gesture detector received a [MotionEvent.ACTION_CANCEL] event and the event is not consumed
     *
     * @param motionEvent the event to check
     * @return should the event be dropped?
     */
    abstract fun shouldDropMotion(motionEvent: MotionEvent): Boolean

    /**
     * handler for swipe events, once a swipe is detected.
     * the direction of the swipe can be accessed in [currentSwipe]
     *
     * @param from start event of the swipe
     * @param to end event of the swipe
     * @param distanceX the horizontal distance of the swipe
     * @param distanceY the vertical distance of the swipe
     * @return was the event consumed?
     */
    abstract fun onSwipe(
        from: MotionEvent,
        to: MotionEvent,
        distanceX: Double,
        distanceY: Double,
    ): Boolean
}
