package app.morphe.extension.pixiv.ui

import android.graphics.Canvas
import android.graphics.ColorFilter
import android.graphics.Paint
import android.graphics.Path
import android.graphics.PixelFormat
import android.graphics.Rect
import android.graphics.drawable.Drawable
import kotlin.math.abs
import kotlin.math.atan2
import kotlin.math.cos
import kotlin.math.sin
import kotlin.math.sqrt

/**
 * The icons the extension draws for itself.
 *
 * The extension carries no resources - it is a separate dex merged into Pixiv's - so an icon that
 * has to sit next to the app's own 24dp glyphs cannot come from a drawable resource. Both icons
 * below are plain SVG path data replayed into a `Path`, which keeps them sharp at any size and
 * lets the drawer's tint pass reach them through the usual colour filter.
 */
internal object Icons {

    /**
     * A jigsaw piece, the same shape Pixiv already uses for "extensions" style entries.
     *
     * Lucide's `puzzle` was the first choice, but at 24dp its four lobes merge into a blob, so this
     * is Material's `extension` glyph instead: solid, like the drawer's other icons, and readable
     * at the size the drawer actually uses.
     */
    fun patchedFeatures(): Drawable = SvgPathDrawable(
        pathData = "M20.5 11H19V7c0-1.1-.9-2-2-2h-4V3.5C13 2.12 11.88 1 10.5 1S8 2.12 8 3.5V5H4" +
            "c-1.1 0-1.99.9-1.99 2v3.8H3.5c1.49 0 2.7 1.21 2.7 2.7s-1.21 2.7-2.7 2.7H2V20" +
            "c0 1.1.9 2 2 2h3.8v-1.5c0-1.49 1.21-2.7 2.7-2.7 1.49 0 2.7 1.21 2.7 2.7V22H17" +
            "c1.1 0 2-.9 2-2v-3.8h1.5c1.49 0 2.7-1.21 2.7-2.7s-1.21-2.7-2.7-2.7z",
        filled = true
    )
}

/**
 * Draws one SVG path scaled from its 24x24 view box onto the drawable bounds.
 *
 * Only the commands the icons above use are implemented - move, line, horizontal and vertical line,
 * cubic curves (including the smooth variant that mirrors the previous control point), elliptical
 * arcs and close. Arcs are converted the way the SVG specification describes.
 */
private class SvgPathDrawable(
    private val pathData: String,
    private val filled: Boolean
) : Drawable() {

    private val path = Path()

    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        if (filled) {
            style = Paint.Style.FILL_AND_STROKE
            strokeWidth = FILL_OUTLINE
        } else {
            style = Paint.Style.STROKE
            strokeWidth = STROKE_WIDTH
        }
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
        fun flag(): Boolean = tokens[index++].toFloat() != 0f

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
                'A' -> {
                    val rx = number()
                    val ry = number()
                    val rotation = number()
                    val largeArc = flag()
                    val sweep = flag()
                    val x = number() + if (relative) currentX else 0f
                    val y = number() + if (relative) currentY else 0f
                    arcTo(currentX, currentY, rx, ry, rotation, largeArc, sweep, x, y)
                    currentX = x
                    currentY = y
                    lastWasCubic = false
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

    /** SVG 1.1 F.6.5: endpoint parameterisation to centre parameterisation, then `Path.arcTo`. */
    private fun arcTo(
        x1: Float,
        y1: Float,
        rx: Float,
        ry: Float,
        rotationDegrees: Float,
        largeArc: Boolean,
        sweep: Boolean,
        x2: Float,
        y2: Float
    ) {
        if (x1 == x2 && y1 == y2) return
        var radiusX = abs(rx)
        var radiusY = abs(ry)
        if (radiusX == 0f || radiusY == 0f) {
            path.lineTo(x2, y2)
            return
        }
        val rotation = Math.toRadians(rotationDegrees.toDouble())
        val cosRotation = cos(rotation)
        val sinRotation = sin(rotation)
        val dx = (x1 - x2) / 2.0
        val dy = (y1 - y2) / 2.0
        val x1Prime = cosRotation * dx + sinRotation * dy
        val y1Prime = -sinRotation * dx + cosRotation * dy

        val lambda = (x1Prime * x1Prime) / (radiusX * radiusX.toDouble()) +
            (y1Prime * y1Prime) / (radiusY * radiusY.toDouble())
        if (lambda > 1) {
            val scale = sqrt(lambda)
            radiusX = (radiusX * scale).toFloat()
            radiusY = (radiusY * scale).toFloat()
        }

        val rxSquared = radiusX * radiusX.toDouble()
        val rySquared = radiusY * radiusY.toDouble()
        val numerator = rxSquared * rySquared - rxSquared * y1Prime * y1Prime - rySquared * x1Prime * x1Prime
        val denominator = rxSquared * y1Prime * y1Prime + rySquared * x1Prime * x1Prime
        val factor = if (denominator == 0.0) 0.0 else sqrt((numerator / denominator).coerceAtLeast(0.0))
        val sign = if (largeArc == sweep) -1.0 else 1.0
        val cxPrime = sign * factor * radiusX * y1Prime / radiusY
        val cyPrime = -sign * factor * radiusY * x1Prime / radiusX

        val centreX = cosRotation * cxPrime - sinRotation * cyPrime + (x1 + x2) / 2.0
        val centreY = sinRotation * cxPrime + cosRotation * cyPrime + (y1 + y2) / 2.0

        val startVectorX = (x1Prime - cxPrime) / radiusX
        val startVectorY = (y1Prime - cyPrime) / radiusY
        val endVectorX = (-x1Prime - cxPrime) / radiusX
        val endVectorY = (-y1Prime - cyPrime) / radiusY

        val startAngle = atan2(startVectorY, startVectorX)
        var sweepAngle = atan2(
            endVectorX * startVectorY - endVectorY * startVectorX,
            endVectorX * startVectorX + endVectorY * startVectorY
        )
        if (!sweep && sweepAngle > 0) sweepAngle -= 2 * Math.PI
        if (sweep && sweepAngle < 0) sweepAngle += 2 * Math.PI

        measurementOval.set(
            (centreX - radiusX).toFloat(),
            (centreY - radiusY).toFloat(),
            (centreX + radiusX).toFloat(),
            (centreY + radiusY).toFloat()
        )
        path.arcTo(
            measurementOval,
            Math.toDegrees(startAngle).toFloat(),
            Math.toDegrees(sweepAngle).toFloat(),
            false
        )
    }

    private val measurementOval = android.graphics.RectF()

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
        const val STROKE_WIDTH = 2f
        const val FILL_OUTLINE = 0.6f
    }
}
