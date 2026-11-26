package com.sarp.tiktokliquidglass

import android.content.Context
import android.graphics.Color
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.graphics.drawable.LayerDrawable
import android.util.TypedValue
import kotlin.math.roundToInt

/**
 * Canonical Mergen Swiss-Kinetic design tokens and sharp 0dp drawable primitives.
 * Matches MergenCore Obsidian / Paper polarity system:
 * - Pure #000000 / #FFFFFF polarity, #0A0A0A / #121212 elevated surfaces
 * - Crisp 0dp architectural corners
 * - 1dp architectural hairline & strong monochrome borders
 * - Zero Liquid Glass / blur outside the bottom navigation bar
 */
object MergenDesign {

    // Obsidian polarity tokens
    const val OBSIDIAN_BG = 0xFF000000.toInt()
    const val OBSIDIAN_PANEL = 0xF5000000.toInt()
    const val OBSIDIAN_SURFACE = 0xFF0A0A0A.toInt()
    const val OBSIDIAN_ELEVATED = 0xFF121212.toInt()
    const val OBSIDIAN_INK = 0xFFFFFFFF.toInt()
    const val OBSIDIAN_MUTED = 0xA3FFFFFF.toInt()
    const val OBSIDIAN_HAIRLINE = 0x29FFFFFF.toInt()
    const val OBSIDIAN_BORDER = 0xE0FFFFFF.toInt()

    // Paper polarity tokens
    const val PAPER_BG = 0xFFFFFFFF.toInt()
    const val PAPER_SURFACE = 0xFFF5F5F4.toInt()
    const val PAPER_ELEVATED = 0xFFEAEAE8.toInt()
    const val PAPER_INK = 0xFF000000.toInt()
    const val PAPER_MUTED = 0x9E000000.toInt()
    const val PAPER_HAIRLINE = 0x2E000000.toInt()
    const val PAPER_BORDER = 0xE6000000.toInt()

    fun dp(context: Context, value: Float): Int =
        TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value,
            context.resources.displayMetrics
        ).roundToInt()

    fun dpF(context: Context, value: Float): Float =
        TypedValue.applyDimension(
            TypedValue.COMPLEX_UNIT_DIP,
            value,
            context.resources.displayMetrics
        )

    /**
     * Sharp 0dp architectural box with optional monochrome stroke.
     */
    fun sharpBox(
        fillColor: Int,
        strokeColor: Int = Color.TRANSPARENT,
        strokePx: Int = 0
    ): GradientDrawable = GradientDrawable().apply {
        shape = GradientDrawable.RECTANGLE
        cornerRadius = 0f
        setColor(fillColor)
        if (strokePx > 0 && strokeColor != Color.TRANSPARENT) {
            setStroke(strokePx, strokeColor)
        }
    }

    /**
     * Right-docked drawer surface: sharp 0dp corners with 1dp border on Left, Top, and Bottom,
     * flush against the right screen edge.
     */
    fun rightDockedDrawerBg(
        fillColor: Int = OBSIDIAN_PANEL,
        strokeColor: Int = OBSIDIAN_BORDER,
        strokePx: Int = 2
    ): Drawable {
        val inner = sharpBox(fillColor, strokeColor, strokePx)
        return LayerDrawable(arrayOf(inner)).apply {
            setLayerInset(0, 0, 0, -strokePx, 0)
        }
    }

    /**
     * Bottom sheet architectural backdrop with sharp 0dp corners and a crisp 1dp top border rule.
     */
    fun topRuleSheetBg(
        fillColor: Int = OBSIDIAN_SURFACE,
        strokeColor: Int = OBSIDIAN_BORDER,
        strokePx: Int = 2
    ): Drawable {
        val inner = sharpBox(fillColor, strokeColor, strokePx)
        return LayerDrawable(arrayOf(inner)).apply {
            setLayerInset(0, -strokePx, 0, -strokePx, -strokePx)
        }
    }

    /**
     * Compact tabular metric formatter (`<0` -> `"—"`, `<1000` -> exact, `K`, `M`).
     */
    fun formatCompactCount(count: Long): String {
        if (count < 0L) return "—"
        if (count < 1000L) return count.toString()
        if (count < 1_000_000L) {
            val k = count / 1000.0
            return if (k >= 100.0 || (count % 1000L) < 100L) {
                "${k.toInt()}K"
            } else {
                String.format(java.util.Locale.US, "%.1fK", k)
            }
        }
        val m = count / 1_000_000.0
        return if (m >= 100.0 || (count % 1_000_000L) < 100_000L) {
            "${m.toInt()}M"
        } else {
            String.format(java.util.Locale.US, "%.1fM", m)
        }
    }
}
