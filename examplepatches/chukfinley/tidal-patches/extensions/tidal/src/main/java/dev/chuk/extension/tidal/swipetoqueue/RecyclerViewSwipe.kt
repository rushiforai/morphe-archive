/*
 * Copyright 2026 chukfinley.
 * https://github.com/chukfinley/tidal-patches
 */

package dev.chuk.extension.tidal.swipetoqueue

import android.animation.Animator
import android.animation.AnimatorListenerAdapter
import android.animation.ValueAnimator
import android.content.res.Resources
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.PixelFormat
import android.graphics.drawable.Drawable
import android.util.Log
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.animation.DecelerateInterpolator
import androidx.recyclerview.widget.RecyclerView
import kotlin.math.abs
import kotlin.math.min

/**
 * The same gesture as [SwipeToQueueElement] for the screens that still use RecyclerView rows,
 * for example the favourite tracks list.
 *
 * The patch calls [attach] from `RecyclerView.setAdapter`, so every list in the app is covered
 * without knowing anything about its adapter.
 */
object RecyclerViewSwipe {

    private const val LOG_TAG = "morphe-swipe-to-queue"
    private const val TAG_KEY = 0x4d535751 // "MSWQ"


    @JvmStatic
    fun attach(recyclerView: RecyclerView?) {
        if (recyclerView == null) return
        try {
            if (recyclerView.getTag(TAG_KEY) != null) return
            recyclerView.setTag(TAG_KEY, true)
            recyclerView.addOnItemTouchListener(SwipeInterceptor())
        } catch (ex: Throwable) {
            Log.e(LOG_TAG, "Could not attach list swipe", ex)
        }
    }

    private class SwipeInterceptor : RecyclerView.OnItemTouchListener {

        private val density = Resources.getSystem().displayMetrics.density
        private val touchSlop = 8f * density
        private val maxRowHeight = 132f * density

        /**
         * How far the row has to travel before letting go queues the item: a swipe carried across
         * roughly half the row.
         */
        private var commitDistance = 0f
        private var maxOffset = 0f

        /** A flick this fast counts even when the row did not travel the full distance. */
        private val flickVelocity = 125f * density
        private val minFlickOffset = 24f * density
        private var velocityTracker: VelocityTracker? = null

        private var downX = 0f
        private var downY = 0f
        private var tracking = false
        private var active = false
        private var fired = false
        private var row: View? = null
        private var indicator: QueueIndicator? = null

        override fun onInterceptTouchEvent(recyclerView: RecyclerView, event: MotionEvent): Boolean {
            handle(recyclerView, event)
            return active
        }

        /** Once the swipe is recognised the list hands the rest of the gesture over here. */
        override fun onTouchEvent(recyclerView: RecyclerView, event: MotionEvent) {
            handle(recyclerView, event)
        }

        private fun handle(recyclerView: RecyclerView, event: MotionEvent) {
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    downX = event.x
                    downY = event.y
                    active = false
                    fired = false
                    tracking = true
                    velocityTracker?.recycle()
                    velocityTracker = VelocityTracker.obtain().also { it.addMovement(event) }
                }

                MotionEvent.ACTION_MOVE -> {
                    if (!tracking) return
                    velocityTracker?.addMovement(event)
                    val dx = event.x - downX
                    val dy = event.y - downY

                    if (!active) {
                        // A vertical drag belongs to the list, a left drag to what is behind it.
                        if (abs(dy) > touchSlop || dx < -touchSlop) {
                            tracking = false
                            return
                        }
                        if (dx < touchSlop || dx < abs(dy) * 1.5f) return

                        val candidate = recyclerView.findChildViewUnder(downX, downY) ?: return
                        if (candidate.height > maxRowHeight || !candidate.isLongClickable) {
                            tracking = false
                            return
                        }

                        row = candidate
                        commitDistance = candidate.width * 0.45f
                        maxOffset = candidate.width * 0.6f
                        indicator = QueueIndicator(candidate, density, commitDistance).also {
                            recyclerView.overlay.add(it)
                        }
                        active = true
                        // From here on the app's own long press could fire. Its menu is swallowed
                        // while the finger is down, but nothing is queued by it.
                        SwipeToQueue.beginDrag()
                    }

                    val offset = resist(dx - touchSlop)
                    row?.translationX = offset
                    indicator?.update(offset)
                }

                MotionEvent.ACTION_UP -> {
                    // Carried across the row, or flicked hard enough that the intent is clear.
                    val offset = row?.translationX ?: 0f
                    val velocity = velocityTracker?.let {
                        it.addMovement(event)
                        it.computeCurrentVelocity(1000)
                        it.xVelocity
                    } ?: 0f
                    val committed = offset >= commitDistance ||
                        (velocity >= flickVelocity && offset >= minFlickOffset)
                    if (active && committed && !fired && !SwipeToQueue.isHandled()) {
                        fired = true
                        SwipeToQueue.commit()
                        try {
                            row?.performLongClick()
                        } catch (ex: Throwable) {
                            Log.e(LOG_TAG, "Could not fire long click", ex)
                        }
                    }
                    if (active) settle(recyclerView)
                    if (tracking) SwipeToQueue.endDrag()
                    velocityTracker?.recycle()
                    velocityTracker = null
                    tracking = false
                    active = false
                    fired = false
                }

                MotionEvent.ACTION_CANCEL -> {
                    if (active) settle(recyclerView)
                    if (tracking) SwipeToQueue.endDrag()
                    velocityTracker?.recycle()
                    velocityTracker = null
                    tracking = false
                    active = false
                    fired = false
                }
            }
        }

        /**
         * The row follows the finger one to one up to the point where the item is queued, then
         * gives way more slowly, so the gesture has an end that can be felt.
         */
        private fun resist(raw: Float): Float {
            if (raw <= 0f) return 0f
            if (raw <= commitDistance) return raw
            return min(commitDistance + (raw - commitDistance) * 0.35f, maxOffset)
        }

        /** Lets the row glide back once the finger is gone. */
        private fun settle(recyclerView: RecyclerView) {
            val target = row ?: return
            val overlay = indicator
            row = null
            indicator = null

            ValueAnimator.ofFloat(target.translationX, 0f).apply {
                duration = 180L
                interpolator = DecelerateInterpolator(1.5f)
                addUpdateListener {
                    val value = it.animatedValue as Float
                    target.translationX = value
                    overlay?.update(value)
                }
                addListener(object : AnimatorListenerAdapter() {
                    override fun onAnimationEnd(animation: Animator) {
                        target.translationX = 0f
                        overlay?.let { recyclerView.overlay.remove(it) }
                    }
                })
                start()
            }
        }

        override fun onRequestDisallowInterceptTouchEvent(disallow: Boolean) = Unit

    }

    /** Green strip with the queue glyph, drawn in the area the row uncovers. */
    private class QueueIndicator(
        private val row: View,
        private val density: Float,
        private val commitDistance: Float,
    ) : Drawable() {

        private val paint = Paint(Paint.ANTI_ALIAS_FLAG)
        private var offset = 0f

        fun update(offset: Float) {
            this.offset = offset
            invalidateSelf()
        }

        override fun draw(canvas: Canvas) {
            if (offset <= 0.5f) return
            val top = row.top.toFloat()
            val bottom = row.bottom.toFloat()
            val left = row.left.toFloat()

            paint.style = Paint.Style.FILL
            paint.color = ACCENT
            canvas.drawRect(left, top, left + offset, bottom, paint)

            val ratio = if (commitDistance <= 0f) 1f else min(offset / commitDistance, 1f)
            val glyph = 22f * density * (0.6f + 0.4f * ratio)
            if (offset < glyph * 1.5f) return
            val centerX = left + min(offset / 2f, offset - glyph)
            val centerY = (top + bottom) / 2f

            paint.style = Paint.Style.STROKE
            paint.strokeWidth = 2f * density
            paint.strokeCap = Paint.Cap.ROUND
            paint.color = Color.argb((255 * min(ratio * 1.6f, 1f)).toInt(), 255, 255, 255)

            val glyphLeft = centerX - glyph / 2f
            val glyphRight = centerX + glyph / 2f
            val gap = glyph / 3.4f
            for (line in 0..2) {
                val y = centerY - gap + line * gap
                val end = if (line == 2) glyphRight - glyph * 0.42f else glyphRight
                canvas.drawLine(glyphLeft, y, end, y, paint)
            }
            val plusX = glyphRight - glyph * 0.16f
            val plusY = centerY + gap
            val arm = glyph * 0.2f
            canvas.drawLine(plusX - arm, plusY, plusX + arm, plusY, paint)
            canvas.drawLine(plusX, plusY - arm, plusX, plusY + arm, paint)
        }

        override fun setAlpha(alpha: Int) = Unit

        override fun setColorFilter(colorFilter: ColorFilter?) = Unit

        @Deprecated("Deprecated in Drawable")
        override fun getOpacity() = PixelFormat.TRANSLUCENT

        private companion object {
            /** Spotify's "add to queue" green. */
            val ACCENT = Color.rgb(29, 185, 84)
        }
    }
}
