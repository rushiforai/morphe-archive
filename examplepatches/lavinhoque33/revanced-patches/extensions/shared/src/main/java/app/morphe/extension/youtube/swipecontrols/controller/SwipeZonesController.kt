package app.morphe.extension.youtube.swipecontrols.controller

import android.app.Activity
import android.graphics.Rect
import android.view.MotionEvent
import android.view.View
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils.getIdentifier
import app.morphe.extension.shared.utils.Utils.dipToPixels
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider.SwipeZoneAction
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection
import app.morphe.extension.youtube.swipecontrols.misc.Point
import app.morphe.extension.youtube.swipecontrols.misc.Rectangle
import app.morphe.extension.youtube.swipecontrols.misc.contains
import kotlin.math.max
import kotlin.math.min

/**
 * Y- Axis:
 * -------- 0
 *        ^
 * dead   | 40dp
 *        v
 * -------- yDeadTop
 *        ^
 * swipe  |
 *        v
 * -------- yDeadBtm
 *        ^
 * dead   | 80dp
 *        v
 * -------- screenHeight
 *
 * X- Axis:
 *  0    xLeftStart    xLeftEnd    xRightStart    xRightEnd   screenWidth
 *  |          |            |          |            |          |
 *  |   20dp   |  zoneWidth |  center  |  zoneWidth |   20dp   |
 *  | <------> |  <------>  | <------> |  <------>  | <------> |
 *  |   dead   | left zone  |  stock   | right zone |   dead   |
 *             | <--------------------------------> |
 *                              1/1
 *
 * Horizontal swipes use the top and bottom edges of the effective rectangle. The percentage
 * setting controls the height of each edge zone, leaving the center as the default/stock area.
 */
@Suppress("PrivatePropertyName")
class SwipeZonesController(
    private val config: SwipeControlsConfigurationProvider,
    private val host: Activity,
    private val fallbackScreenRect: () -> Rectangle,
) {
    /**
     * 20dp, in pixels
     */
    private val _20dp = dipToPixels(20f)
    private val portraitTopInset = dipToPixels(16f)
    private val portraitBottomInset = dipToPixels(24f)

    /**
     * 40dp, in pixels
     */
    private val _40dp = dipToPixels(40f)

    /**
     * 80dp, in pixels
     */
    private val _80dp = dipToPixels(80f)

    /**
     * id for R.id.inset_controls_overlay_wrapper
     */
    private val sizeAdjustableOverlayId = getIdentifier("inset_controls_overlay_wrapper", ResourceType.ID, host)

    private val portraitBounds = Rect()
    private val locationInWindow = IntArray(2)
    private var portraitSwipeRect: Rectangle? = null

    /**
     * Snapshot the visible watch player's bounds at DOWN. In portrait a missing or clipped player
     * must never fall back to the activity bounds, which include the watch feed.
     */
    internal fun preparePortraitTouch(watchControls: View, event: MotionEvent): Rectangle? {
        portraitSwipeRect = null
        val player = watchControls.findViewById<View>(sizeAdjustableOverlayId) ?: return null
        if (!player.isShown || !player.getLocalVisibleRect(portraitBounds)) return null

        player.getLocationInWindow(locationInWindow)
        portraitBounds.offset(locationInWindow[0], locationInWindow[1])
        val safeBounds = Rectangle(
            portraitBounds.left + _20dp,
            portraitBounds.top + portraitTopInset,
            portraitBounds.width() - _20dp * 2,
            portraitBounds.height() - portraitTopInset - portraitBottomInset,
        )
        val origin = Point(event.x.toInt(), event.y.toInt())
        if (safeBounds.width <= 0 || safeBounds.height <= 0 || origin !in safeBounds) return null

        portraitSwipeRect = safeBounds
        if (!containsActiveZone(origin)) return null

        return Rectangle(
            portraitBounds.left, portraitBounds.top, portraitBounds.width(), portraitBounds.height()
        )
    }

    /**
     * current bounding rectangle of the player
     */
    private var playerRect: Rectangle? = null
    private var offlineSwipeRect: Rectangle? = null

    /** Offline touches are local to the unobstructed player viewport, not the stock watch UI. */
    internal fun setOfflineViewport(viewport: Rectangle) {
        offlineSwipeRect = viewport
    }

    /**
     * rectangle of the area that is effectively usable for swipe controls
     */
    private val effectiveSwipeRect: Rectangle
        get() {
            offlineSwipeRect?.let { return it }

            if (config.enablePortraitSwipeControls) {
                return portraitSwipeRect ?: EMPTY_RECT
            }

            maybeAttachPlayerBoundsListener()
            val p = if (playerRect != null) playerRect!! else fallbackScreenRect()
            return Rectangle(
                p.x + _20dp,
                p.y + _40dp,
                p.width - _20dp,
                p.height - _20dp - _80dp,
            )
        }

    /** The rectangle of the left control zone. */
    val left: Rectangle
        get() {
            val eRect = effectiveSwipeRect
            val zoneWidth = max(0, eRect.width * config.verticalSwipeZoneSize / 100)
            return Rectangle(
                eRect.left,
                eRect.top,
                zoneWidth,
                eRect.height,
            )
        }

    /** The rectangle of the right control zone. */
    val right: Rectangle
        get() {
            val eRect = effectiveSwipeRect
            val zoneWidth = max(0, eRect.width * config.verticalSwipeZoneSize / 100)
            return Rectangle(
                eRect.right - zoneWidth,
                eRect.top,
                zoneWidth,
                eRect.height,
            )
        }

    /**
     * Additional dead zone applied *inside* the `effectiveSwipeRect` for horizontal swipes
     * to avoid conflicting with system back gestures.
     */
    private val horizontalInnerDeadZone = _40dp

    private fun horizontalZone(fromTop: Boolean): Rectangle {
        val rect = effectiveSwipeRect
        val height = max(0, rect.height * config.horizontalSwipeZoneSize / 100)

        return Rectangle(
            rect.left + horizontalInnerDeadZone,
            if (fromTop) rect.top else rect.bottom - height,
            max(0, rect.width - horizontalInnerDeadZone * 2),
            height,
        )
    }

    /** The rectangle of the top control zone. */
    val top: Rectangle get() = horizontalZone(fromTop = true)

    /** The rectangle of the bottom control zone. */
    val bottom: Rectangle get() = horizontalZone(fromTop = false)

    internal fun containsActiveZone(point: Point): Boolean =
        (config.leftZoneAction != SwipeZoneAction.OFF && point in left) ||
            (config.rightZoneAction != SwipeZoneAction.OFF && point in right) ||
            (config.topZoneAction != SwipeZoneAction.OFF && point in top) ||
            (config.bottomZoneAction != SwipeZoneAction.OFF && point in bottom)

    internal fun actionAt(origin: Point, direction: SwipeDirection): SwipeZoneAction =
        when (direction) {
            SwipeDirection.HORIZONTAL -> when (origin) {
                in top -> config.topZoneAction
                in bottom -> config.bottomZoneAction
                else -> SwipeZoneAction.OFF
            }

            SwipeDirection.VERTICAL -> when (origin) {
                in left -> config.leftZoneAction
                in right -> config.rightZoneAction
                else -> SwipeZoneAction.OFF
            }

            SwipeDirection.NONE -> SwipeZoneAction.OFF
        }

    /**
     * try to attach a listener to the size adjustable player overlay and update the player rectangle.
     * once a listener is attached, this function does nothing
     */
    private fun maybeAttachPlayerBoundsListener() {
        if (playerRect != null) return
        host.findViewById<View>(sizeAdjustableOverlayId)?.let {
            onPlayerViewLayout(it)
            it.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                onPlayerViewLayout(it)
            }
        }
    }

    /**
     * update the player rectangle on size adjustable player overlay layout
     *
     * @param sizeAdjustableOverlay the player overlay
     */
    private fun onPlayerViewLayout(sizeAdjustableOverlay: View) {
        // The overlay shrinks with the visible player surface and excludes engagement panels.
        val playerWidthWithPadding = sizeAdjustableOverlay.width + (sizeAdjustableOverlay.x.toInt() * 2)
        playerRect = Rectangle(
            sizeAdjustableOverlay.x.toInt(),
            sizeAdjustableOverlay.y.toInt(),
            min(sizeAdjustableOverlay.width, playerWidthWithPadding),
            sizeAdjustableOverlay.height,
        )
    }

    private companion object {
        val EMPTY_RECT = Rectangle(0, 0, 0, 0)
    }
}
