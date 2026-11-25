/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0.
 * Written by lavinhoque33, 2026-11-24.
 */
package app.morphe.extension.youtube.patches.general.offline

import android.content.Context
import android.os.Build
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.WindowInsets
import app.morphe.extension.youtube.patches.swipe.SwipeControlsPatch
import app.morphe.extension.youtube.swipecontrols.misc.Rectangle
import kotlin.math.abs

/** Stock-style vertical swipe fallback for player touches unassigned to RVX vertical controls. */
internal class OfflineFullscreenSwipe(context: Context) {
    private val touchSlop = ViewConfiguration.get(context).scaledTouchSlop
    private val minimumDistance = maxOf(touchSlop * 2f, 48f * context.resources.displayMetrics.density)
    private val windowLocation = IntArray(2)
    private var originX = 0f
    private var originY = 0f
    private var direction = 0 // Up to enter; down to exit. Zero means this touch cannot toggle.
    private var claimed = false

    fun begin(event: MotionEvent, viewport: Rectangle, fullscreen: Boolean, reserved: Boolean) {
        cancel()
        if (reserved || event.x < viewport.left || event.x >= viewport.right ||
            event.y < viewport.top || event.y >= viewport.bottom
        ) return

        val enabled = if (fullscreen) {
            SwipeControlsPatch.disableSwipeToExitFullscreenMode(true)
        } else {
            SwipeControlsPatch.disableSwipeToEnterFullscreenModeInThePlayer(true)
        }
        if (!enabled) return

        originX = event.x
        originY = event.y
        direction = if (fullscreen) 1 else -1
    }

    fun move(event: MotionEvent): Boolean {
        if (direction == 0) return false
        val vertical = (event.y - originY) * direction
        val horizontal = abs(event.x - originX)
        if (maxOf(abs(vertical), horizontal) <= touchSlop) return false

        if (vertical <= horizontal) cancel()
        else claimed = isDeliberateSwipe(vertical, horizontal)
        return claimed
    }

    fun finish(event: MotionEvent): Boolean {
        val commit = event.actionMasked == MotionEvent.ACTION_UP && claimed &&
            isDeliberateSwipe((event.y - originY) * direction, abs(event.x - originX))
        cancel()
        return commit
    }

    fun cancel() {
        direction = 0
        claimed = false
    }

    private fun isDeliberateSwipe(vertical: Float, horizontal: Float): Boolean =
        vertical >= minimumDistance && vertical > horizontal * 1.5f

    @Suppress("DEPRECATION")
    fun viewport(view: View): Rectangle {
        val width = view.width
        val height = view.height
        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.Q) return Rectangle(0, 0, width, height)
        val insets = view.rootWindowInsets ?: return Rectangle(0, 0, width, height)
        val gestures = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            insets.getInsets(WindowInsets.Type.systemGestures())
        } else insets.systemGestureInsets

        // The player may already be inset by the decor. Intersect the window's
        // safe area with the player bounds instead of insetting the player twice.
        val decor = view.rootView
        view.getLocationInWindow(windowLocation)
        val viewX = windowLocation[0]
        val viewY = windowLocation[1]
        decor.getLocationInWindow(windowLocation)
        val offsetX = viewX - windowLocation[0]
        val offsetY = viewY - windowLocation[1]
        val left = (gestures.left - offsetX).coerceIn(0, width)
        val top = (gestures.top - offsetY).coerceIn(0, height)
        val right = (decor.width - gestures.right - offsetX).coerceIn(left, width)
        val bottom = (decor.height - gestures.bottom - offsetY).coerceIn(top, height)
        return Rectangle(left, top, right - left, bottom - top)
    }
}
