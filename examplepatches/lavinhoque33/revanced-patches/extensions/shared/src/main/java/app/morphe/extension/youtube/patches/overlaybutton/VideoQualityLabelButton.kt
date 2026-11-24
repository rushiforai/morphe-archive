/*
 * Copyright (C) 2026 lavinhoque33
 * Licensed under the GNU General Public License v3.0 or later.
 * Written by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.youtube.patches.overlaybutton

import android.content.Context
import android.content.res.Resources
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.util.AttributeSet
import android.util.TypedValue
import android.widget.ImageButton
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils
import app.morphe.extension.shared.utils.StringRef.str

/** Keeps native button accessibility, click handling, and the overlay's existing slot and animations. */
class VideoQualityLabelButton @JvmOverloads constructor(context: Context, attrs: AttributeSet? = null) :
    ImageButton(context, attrs) {
    private val labelPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.WHITE
        textAlign = Paint.Align.CENTER
        typeface = resolveTypeface(context)
        val density = resources.displayMetrics.density
        setShadowLayer(2 * density, 0f, density, Color.BLACK)
    }
    private var label = "—"
    private var lastResolution = Int.MIN_VALUE
    private var lastExact = false

    internal fun updateQuality(resolution: Int, exact: Boolean) {
        if (resolution == lastResolution && exact == lastExact) return
        lastResolution = resolution
        lastExact = exact

        label = when {
            resolution <= 0 -> "—"
            exact -> resolution.toString()
            else -> when (resolution) {
                in 144..240 -> "LQ"
                in 360..480 -> "SD"
                720 -> "HD"
                1080 -> "FHD"
                1440 -> "2K"
                2160 -> "4K"
                else -> resolution.toString()
            }
        }
        contentDescription = if (resolution > 0) {
            str("revanced_overlay_button_video_quality_current", resolution)
        } else {
            str("revanced_overlay_button_video_quality_label")
        }
        updateTextSize()
        invalidate()
    }

    override fun onSizeChanged(width: Int, height: Int, oldWidth: Int, oldHeight: Int) {
        super.onSizeChanged(width, height, oldWidth, oldHeight)
        updateTextSize()
    }

    private fun updateTextSize() {
        val metrics = resources.displayMetrics
        labelPaint.textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 16f, metrics)
        val availableWidth = width - paddingLeft - paddingRight - 8 * metrics.density
        val textWidth = labelPaint.measureText(label)
        if (availableWidth > 0 && textWidth > availableWidth) {
            labelPaint.textSize *= availableWidth / textWidth
        }
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)
        val centerX = (width + paddingLeft - paddingRight) / 2f
        val centerY = (height + paddingTop - paddingBottom) / 2f
        val baseline = centerY - (labelPaint.ascent() + labelPaint.descent()) / 2f
        canvas.drawText(label, centerX, baseline, labelPaint)
    }
}

private fun resolveTypeface(context: Context): Typeface {
    // Honor a Calibri Bold font supplied by the app, or a system-registered Calibri family.
    // Carlito is metrically compatible; use Android's condensed bold sans-serif if neither is present.
    // No proprietary font is bundled by the patch.
    val providedFont = ResourceUtils.getIdentifier("calibri_bold", ResourceType.FONT, context)
    if (providedFont != 0) {
        try {
            return Typeface.create(context.resources.getFont(providedFont), Typeface.BOLD)
        } catch (_: Resources.NotFoundException) {
            // A device may not have the optional resource for its configuration.
        }
    }

    val defaultBold = Typeface.create(null as String?, Typeface.BOLD)
    val calibri = Typeface.create("calibri", Typeface.BOLD)
    if (calibri != defaultBold) return calibri

    val carlito = Typeface.create("carlito", Typeface.BOLD)
    return if (carlito != defaultBold) carlito else Typeface.create("sans-serif-condensed", Typeface.BOLD)
}
