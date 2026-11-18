package app.venus.chat

import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Path
import android.view.View

/**
 * Draws the right-side selection circle and checkmark for Bulk delete messages inside Discord's
 * native HighlightedMessageDrawer.drawHighlight(Canvas, View, int, int).
 *
 * When Bulk delete mode is active, JS encodes a selection code in gutterPaintColor's alpha byte:
 *   code = 256 - (gutterPaintColor >>> 24)
 *   code in 16..24 -> unselected circle on the right; (code & 15) is the left-bar width multiplier (0 = no left bar, 1..8 = 1x..8x)
 *   code in 32..40 -> selected circle on the right (Discord Blurple #5865F2 + white checkmark); (code & 15) is the left-bar width multiplier
 */
object BulkDeleteDrawer {
    private val fillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
    }
    private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeCap = Paint.Cap.ROUND
        strokeJoin = Paint.Join.ROUND
    }
    private val checkPath = Path()

    @JvmStatic
    fun drawCircle(canvas: Canvas, child: View, code: Int): Int {
        val selected = (code and 32) != 0
        val mult = code and 15
        val density = child.resources.displayMetrics.density
        val radius = 10.5f * density
        val rightInset = 26f * density
        val cx = child.right.toFloat() + child.translationX - rightInset
        val top = child.top.toFloat() + child.translationY
        val bottom = child.bottom.toFloat() + child.translationY
        val height = bottom - top
        if (height <= 0f || cx - radius <= child.left.toFloat()) return mult
        val preferredCy = top + 22f * density
        val maxCy = bottom - radius - 4f * density
        val cy = if (height < 44f * density) (top + bottom) * 0.5f else if (preferredCy > maxCy) maxCy else preferredCy

        if (selected) {
            // Subtle outer Blurple halo so the checkmark badge pops cleanly over both dark and light themes
            fillPaint.color = 0x265865F2
            canvas.drawCircle(cx, cy, radius + 2.5f * density, fillPaint)
            // Filled Discord Blurple circle (#5865F2)
            fillPaint.color = 0xFF5865F2.toInt()
            canvas.drawCircle(cx, cy, radius, fillPaint)
            // Crisp white checkmark
            strokePaint.color = 0xFFFFFFFF.toInt()
            strokePaint.strokeWidth = 2.1f * density
            checkPath.reset()
            checkPath.moveTo(cx - 4.4f * density, cy + 0.3f * density)
            checkPath.lineTo(cx - 1.1f * density, cy + 3.6f * density)
            checkPath.lineTo(cx + 4.8f * density, cy - 2.9f * density)
            canvas.drawPath(checkPath, strokePaint)
        } else {
            // Subtle dark translucent backing so the ring stays legible over attachments and embeds
            fillPaint.color = 0x18000000
            canvas.drawCircle(cx, cy, radius, fillPaint)
            // Crisp muted ring
            strokePaint.color = 0x99949BA4.toInt()
            strokePaint.strokeWidth = 1.8f * density
            canvas.drawCircle(cx, cy, radius - 0.9f * density, strokePaint)
        }
        return mult
    }
}
