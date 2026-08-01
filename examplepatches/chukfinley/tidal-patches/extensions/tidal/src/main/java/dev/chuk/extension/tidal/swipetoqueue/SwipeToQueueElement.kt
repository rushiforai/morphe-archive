/*
 * Copyright 2026 chukfinley.
 * https://github.com/chukfinley/tidal-patches
 */

package dev.chuk.extension.tidal.swipetoqueue

import android.animation.ValueAnimator
import android.content.res.Resources
import android.view.animation.DecelerateInterpolator
import androidx.compose.ui.Modifier
import androidx.compose.ui.geometry.Offset
import androidx.compose.ui.geometry.Size
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.graphics.StrokeCap
import androidx.compose.ui.graphics.drawscope.ContentDrawScope
import androidx.compose.ui.input.pointer.PointerEvent
import androidx.compose.ui.input.pointer.PointerEventPass
import androidx.compose.ui.input.pointer.PointerEventType
import androidx.compose.ui.layout.LayoutCoordinates
import androidx.compose.ui.layout.findRootCoordinates
import androidx.compose.ui.node.DrawModifierNode
import androidx.compose.ui.node.LayoutAwareModifierNode
import androidx.compose.ui.node.ModifierNodeElement
import androidx.compose.ui.node.PointerInputModifierNode
import androidx.compose.ui.node.invalidateDraw
import androidx.compose.ui.unit.IntSize
import kotlin.math.abs
import kotlin.math.min

/**
 * Modifier element the patch appends to every long clickable Compose row.
 *
 * The row itself is never moved or redrawn: as soon as the drag passes the threshold the item is
 * queued and the rest of the gesture is swallowed. Nothing to animate means nothing to stutter.
 *
 * Components that are not list rows (buttons, grid cells, chips) are filtered out at runtime by
 * [SwipeToQueueNode.isRowLike], which only accepts near full width, row height layouts.
 */
internal class SwipeToQueueElement(
    private val onLongClick: Any,
) : ModifierNodeElement<SwipeToQueueNode>() {

    override fun create() = SwipeToQueueNode(onLongClick)

    override fun update(node: SwipeToQueueNode) {
        node.onLongClick = onLongClick
    }

    override fun hashCode() = onLongClick.hashCode()

    override fun equals(other: Any?) =
        other is SwipeToQueueElement && other.onLongClick == onLongClick
}

internal class SwipeToQueueNode(
    var onLongClick: Any,
) : Modifier.Node(), PointerInputModifierNode, DrawModifierNode, LayoutAwareModifierNode {

    private val density = Resources.getSystem().displayMetrics.density
    private val touchSlop = 8f * density
    private val minRowHeight = 32f * density
    private val maxRowHeight = 132f * density
    private val iconSize = 22f * density

    /** A flick this fast counts even when the row did not travel the full distance. */
    private val flickVelocity = 125f * density
    private val minFlickOffset = 24f * density

    private var rootWidth = 0
    private var rowWidth = 0
    private var downX = 0f
    private var downY = 0f
    private var tracking = false
    private var fired = false

    /** How far the row currently sits to the right. */
    private var offset = 0f
    private var active = false
    private var lastX = 0f
    private var lastTime = 0L
    private var velocity = 0f
    private var settleAnimator: ValueAnimator? = null

    override fun onPlaced(coordinates: LayoutCoordinates) {
        rootWidth = coordinates.findRootCoordinates().size.width
        rowWidth = coordinates.size.width
    }

    /**
     * How far the row has to travel before letting go queues the item: a swipe carried across
     * roughly half the row, the same commitment a swipe to dismiss asks for.
     */
    private val commitDistance get() = rowWidth * 0.45f

    private val maxOffset get() = rowWidth * 0.6f

    override fun onDetach() {
        settleAnimator?.cancel()
        settleAnimator = null
        offset = 0f
        active = false
    }

    override fun onCancelPointerInput() {
        if (tracking) SwipeToQueue.endDrag()
        if (active) settle()
        tracking = false
        active = false
        fired = false
    }

    override fun onPointerEvent(
        pointerEvent: PointerEvent,
        pass: PointerEventPass,
        bounds: IntSize,
    ) {
        if (pass != PointerEventPass.Main) return
        val change = pointerEvent.changes.firstOrNull() ?: return

        when (pointerEvent.type) {
            PointerEventType.Press -> {
                fired = false
                active = false
                tracking = pointerEvent.changes.size == 1 && isRowLike(bounds)
                if (tracking) {
                    settleAnimator?.cancel()
                    downX = change.position.x
                    downY = change.position.y
                    lastX = change.position.x
                    lastTime = change.uptimeMillis
                    velocity = 0f
                }
            }

            PointerEventType.Move -> {
                if (!tracking) return

                val dx = change.position.x - downX
                val dy = change.position.y - downY

                if (!active) {
                    // A vertical drag belongs to the list, a left drag to whatever is behind it.
                    if (abs(dy) > touchSlop || dx < -touchSlop) {
                        tracking = false
                        return
                    }
                    if (dx < touchSlop || dx < abs(dy) * 1.5f) return

                    active = true
                    // From here on the app's own long press detector could fire. Its menu is
                    // swallowed while the finger is down, but nothing is queued by it.
                    SwipeToQueue.beginDrag()
                }

                val elapsed = change.uptimeMillis - lastTime
                if (elapsed > 0) {
                    // Smoothed, so a single jittery sample cannot decide the gesture.
                    val sample = (change.position.x - lastX) / elapsed * 1000f
                    velocity = velocity * 0.4f + sample * 0.6f
                    lastX = change.position.x
                    lastTime = change.uptimeMillis
                }

                offset = resist(dx - touchSlop)
                change.consume()
                if (isAttached) invalidateDraw()
            }

            PointerEventType.Release -> {
                if (active) {
                    change.consume()
                    // Carried across the row, or flicked hard enough that the intent is clear.
                    // Anything else glides back and queues nothing.
                    val committed = offset >= commitDistance ||
                        (velocity >= flickVelocity && offset >= minFlickOffset)
                    if (committed && !fired) {
                        fired = true
                        SwipeToQueue.triggerFromCompose(onLongClick)
                    }
                    settle()
                }
                if (tracking) SwipeToQueue.endDrag()
                tracking = false
                active = false
                fired = false
            }

            else -> Unit
        }
    }

    /**
     * The row follows the finger one to one up to the point where letting go queues the item,
     * then gives way more slowly, so that point can be felt rather than guessed.
     */
    private fun resist(raw: Float): Float {
        if (raw <= 0f) return 0f
        val commit = commitDistance
        if (raw <= commit) return raw
        return min(commit + (raw - commit) * 0.35f, maxOffset)
    }

    /** Lets the row glide back once the finger is gone. */
    private fun settle() {
        settleAnimator?.cancel()
        val from = offset
        if (from <= 0f) return

        settleAnimator = ValueAnimator.ofFloat(from, 0f).apply {
            duration = 180L
            interpolator = DecelerateInterpolator(1.5f)
            addUpdateListener {
                offset = it.animatedValue as Float
                if (isAttached) invalidateDraw()
            }
            start()
        }
    }

    override fun ContentDrawScope.draw() {
        val current = offset
        if (current <= 0f) {
            drawContent()
            return
        }

        drawRect(
            color = ACCENT,
            topLeft = Offset.Zero,
            size = Size(current, size.height),
        )
        drawQueueIcon(current, size.height)

        val canvas = drawContext.canvas
        canvas.save()
        canvas.translate(current, 0f)
        drawContent()
        canvas.restore()
    }

    /** Three list lines with a plus, drawn from primitives so the patch adds no drawable. */
    private fun ContentDrawScope.drawQueueIcon(revealed: Float, height: Float) {
        // Grows in with the drag and reaches full size exactly where letting go starts to count.
        val ratio = min(revealed / commitDistance, 1f)
        val glyph = iconSize * (0.6f + 0.4f * ratio)
        if (revealed < glyph * 1.5f) return

        val centerX = min(revealed / 2f, revealed - glyph)
        val centerY = height / 2f
        val stroke = 2f * density
        val color = Color.White.copy(alpha = min(ratio * 1.6f, 1f))

        val left = centerX - glyph / 2f
        val right = centerX + glyph / 2f
        val gap = glyph / 3.4f

        for (line in 0..2) {
            val y = centerY - gap + line * gap
            val end = if (line == 2) right - glyph * 0.42f else right
            drawLine(color, Offset(left, y), Offset(end, y), stroke, StrokeCap.Round)
        }

        val plusX = right - glyph * 0.16f
        val plusY = centerY + gap
        val arm = glyph * 0.2f
        drawLine(color, Offset(plusX - arm, plusY), Offset(plusX + arm, plusY), stroke, StrokeCap.Round)
        drawLine(color, Offset(plusX, plusY - arm), Offset(plusX, plusY + arm), stroke, StrokeCap.Round)
    }

    private fun isRowLike(bounds: IntSize): Boolean {
        if (rootWidth <= 0) return false
        if (bounds.width < rootWidth * 0.6f) return false
        return bounds.height in minRowHeight.toInt()..maxRowHeight.toInt()
    }

    private companion object {
        /** Spotify's "add to queue" green. */
        val ACCENT = Color(0xFF1DB954)

    }
}
