package app.morphe.extension.pixiv.ui

import android.graphics.Canvas
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PixelFormat
import android.graphics.Rect
import android.graphics.drawable.Drawable

/**
 * The icon the extension draws for itself.
 *
 * The extension carries no resources - it is a separate dex merged into Pixiv's - so an icon that
 * has to sit next to the app's own 24dp glyphs cannot come from a drawable resource. The icon below
 * is plain SVG path data replayed into a `Path`, which keeps it sharp at any size and lets the
 * drawer's tint pass reach it through the usual colour filter.
 */
internal object Icons {

    fun patchedFeatures(): Drawable = SvgPathDrawable(
        pathData = "M20.5 11H19V7c0-1.1-.9-2-2-2h-4V3.5C13 2.12 11.88 1 10.5 1S8 2.12 8 3.5V5H4" +
            "c-1.1 0-1.99.9-1.99 2v3.8H3.5c1.49 0 2.7 1.21 2.7 2.7s-1.21 2.7-2.7 2.7H2V20" +
            "c0 1.1.9 2 2 2h3.8v-1.5c0-1.49 1.21-2.7 2.7-2.7 1.49 0 2.7 1.21 2.7 2.7V22H17" +
            "c1.1 0 2-.9 2-2v-3.8h1.5c1.49 0 2.7-1.21 2.7-2.7s-1.21-2.7-2.7-2.7z"
    )
}

/**
 * Draws one SVG path scaled from its 24x24 view box onto the drawable bounds.
 *
 * Only the commands the icon above uses are implemented - move, line, horizontal and vertical line,
 * cubic curves (including the smooth variant that mirrors the previous control point) and close.
 */
private class SvgPathDrawable(
    private val pathData: String
) : Drawable() {

    private val path = Path()

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL_AND_STROKE
        strokeWidth = FILL_OUTLINE
        strokeCap = Paint.Cap.ROUND
        strokeJoin = Paint.Join.ROUND
        color = 0xFFFFFFFF.toInt()
    }

    override fun draw(canvas: Canvas) {
        val bounds = bounds
        if (bounds.isEmpty) return
        val scale = minOf(bounds.width(), bounds.height()) / VIEW_BOX
        canvas.save()
        canvas.translate(
            bounds.left + (bounds.width() - VIEW_BOX * scale) / 2f,
            bounds.top + (bounds.height() - VIEW_BOX * scale) / 2f
        )
        canvas.scale(scale, scale)
        canvas.drawPath(path, paint)
        canvas.restore()
    }

    override fun setAlpha(alpha: Int) {
        paint.alpha = alpha
    }

    override fun setColorFilter(colorFilter: ColorFilter?) {
        paint.colorFilter = colorFilter
    }

    @Deprecated("Deprecated in Drawable, required by the platform")
    override fun getOpacity(): Int = PixelFormat.TRANSLUCENT

    override fun onBoundsChange(bounds: Rect) {
        super.onBoundsChange(bounds)
        if (path.isEmpty) build()
    }

    private fun build() {
        val tokens = tokenize(pathData)
        var index = 0
        var currentX = 0f
        var currentY = 0f
        var startX = 0f
        var startY = 0f
        var lastControlX = 0f
        var lastControlY = 0f
        var lastWasCubic = false
        var command = ' '

        fun number(): Float = tokens[index++].toFloat()

        while (index < tokens.size) {
            val token = tokens[index]
            if (token[0].isLetter()) {
                command = token[0]
                index++
            }
            val relative = command.isLowerCase()
            when (command.uppercaseChar()) {
                'M' -> {
                    val x = number() + if (relative) currentX else 0f
                    val y = number() + if (relative) currentY else 0f
                    path.moveTo(x, y)
                    currentX = x
                    currentY = y
                    startX = x
                    startY = y
                    command = if (relative) 'l' else 'L'
                    lastWasCubic = false
                }
                'L' -> {
                    val x = number() + if (relative) currentX else 0f
                    val y = number() + if (relative) currentY else 0f
                    path.lineTo(x, y)
                    currentX = x
                    currentY = y
                    lastWasCubic = false
                }
                'H' -> {
                    val x = number() + if (relative) currentX else 0f
                    path.lineTo(x, currentY)
                    currentX = x
                    lastWasCubic = false
                }
                'V' -> {
                    val y = number() + if (relative) currentY else 0f
                    path.lineTo(currentX, y)
                    currentY = y
                    lastWasCubic = false
                }
                'C' -> {
                    val x1 = number() + if (relative) currentX else 0f
                    val y1 = number() + if (relative) currentY else 0f
                    val x2 = number() + if (relative) currentX else 0f
                    val y2 = number() + if (relative) currentY else 0f
                    val x = number() + if (relative) currentX else 0f
                    val y = number() + if (relative) currentY else 0f
                    path.cubicTo(x1, y1, x2, y2, x, y)
                    currentX = x
                    currentY = y
                    lastControlX = x2
                    lastControlY = y2
                    lastWasCubic = true
                }
                'S' -> {
                    val reflectedX = if (lastWasCubic) 2 * currentX - lastControlX else currentX
                    val reflectedY = if (lastWasCubic) 2 * currentY - lastControlY else currentY
                    val x2 = number() + if (relative) currentX else 0f
                    val y2 = number() + if (relative) currentY else 0f
                    val x = number() + if (relative) currentX else 0f
                    val y = number() + if (relative) currentY else 0f
                    path.cubicTo(reflectedX, reflectedY, x2, y2, x, y)
                    currentX = x
                    currentY = y
                    lastControlX = x2
                    lastControlY = y2
                    lastWasCubic = true
                }
                'Z' -> {
                    path.close()
                    currentX = startX
                    currentY = startY
                    lastWasCubic = false
                }
                else -> index++
            }
        }
    }

    private fun tokenize(data: String): List<String> {
        val tokens = ArrayList<String>(64)
        val builder = StringBuilder()
        var index = 0
        while (index < data.length) {
            val char = data[index]
            when {
                char.isLetter() -> {
                    if (builder.isNotEmpty()) {
                        tokens.add(builder.toString())
                        builder.clear()
                    }
                    tokens.add(char.toString())
                    index++
                }
                char == '-' && builder.isNotEmpty() && builder.last() != 'e' && builder.last() != 'E' -> {
                    tokens.add(builder.toString())
                    builder.clear()
                    builder.append(char)
                    index++
                }
                char == '.' && builder.contains('.') -> {
                    tokens.add(builder.toString())
                    builder.clear()
                    builder.append(char)
                    index++
                }
                char == ' ' || char == ',' || char == '\n' -> {
                    if (builder.isNotEmpty()) {
                        tokens.add(builder.toString())
                        builder.clear()
                    }
                    index++
                }
                else -> {
                    builder.append(char)
                    index++
                }
            }
        }
        if (builder.isNotEmpty()) tokens.add(builder.toString())
        return tokens
    }

    private companion object {
        const val VIEW_BOX = 24f
        const val FILL_OUTLINE = 0.6f
    }
}
