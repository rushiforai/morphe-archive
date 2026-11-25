/*
 * Portions of this file are ported from Morphe:
 * Copyright 2026 Morphe.
 * https://github.com/MorpheApp/morphe-patches/pull/3412
 *
 * See the included NOTICE file for GPLv3 Section 7 terms that apply to this code.
 * Modified by lavinhoque33, 2026-11-24.
 * Modified by lavinhoque33, 2026-11-23.
 */

package app.morphe.extension.youtube.swipecontrols.views

import android.annotation.SuppressLint
import android.content.Context
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.RectF
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.TypedValue
import android.view.Gravity
import android.view.HapticFeedbackConstants
import android.view.View
import android.widget.RelativeLayout
import android.widget.TextView
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils.getIdentifier
import app.morphe.extension.shared.utils.StringRef.str
import app.morphe.extension.shared.utils.Utils.getTimeStamp
import app.morphe.extension.youtube.patches.SoundBoostPatch
import app.morphe.extension.youtube.shared.VideoInformation
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection
import app.morphe.extension.youtube.swipecontrols.misc.SwipeControlsOverlay
import app.morphe.extension.youtube.videoplayer.PlayerIcons
import java.text.NumberFormat
import kotlin.math.ceil
import kotlin.math.max
import kotlin.math.min
import kotlin.math.round

private const val VOLUME_BOOST_PERCENT_PER_STEP = 25
private const val VOLUME_BOOST_PROGRESS_COLOR = 0xBFFF7043.toInt()

private fun Context.dp(value: Float): Float = value * resources.displayMetrics.density

/** A label reservation shared by every value in a gesture, measured with each style's own font. */
internal class SwipeOverlayLabelSlot(private val numericSample: String, private val alternate: String? = null) {
    fun width(paint: Paint): Float {
        // Keep the locale's separators, percent affixes and number of places, but allow for wide digits.
        val alternateWidth = alternate?.let { paint.measureText(it) } ?: 0f
        val firstDigit = numericSample.firstOrNull(Char::isDigit)
            ?: return max(paint.measureText(numericSample), alternateWidth)
        val zero = firstDigit - Character.digit(firstDigit, 10)
        var widestDigit = zero
        var widestWidth = 0f
        for (digit in 0..9) {
            val character = zero + digit
            val width = paint.measureText(character.toString())
            if (width > widestWidth) {
                widestWidth = width
                widestDigit = character
            }
        }

        val wideSample = buildString(numericSample.length) {
            for (character in numericSample) append(if (character.isDigit()) widestDigit else character)
        }
        return max(paint.measureText(wideSample), alternateWidth)
    }
}

/**
 * Main overlay layout for displaying volume, brightness, speed, and seek with circular, horizontal, and vertical progress bars.
 */
class SwipeControlsOverlayLayout(
    context: Context,
    private val config: SwipeControlsConfigurationProvider,
) : RelativeLayout(context), SwipeControlsOverlay {

    constructor(context: Context) : this(context, SwipeControlsConfigurationProvider())

    private val autoBrightnessIcon by lazy { getDrawable("revanced_ic_sc_brightness_auto") }
    private val lowBrightnessIcon by lazy { getDrawable("revanced_ic_sc_brightness_low") }
    private val mediumBrightnessIcon by lazy { getDrawable("revanced_ic_sc_brightness_medium") }
    private val highBrightnessIcon by lazy { getDrawable("revanced_ic_sc_brightness_high") }
    private val fullBrightnessIcon by lazy { getDrawable("revanced_ic_sc_brightness_full") }
    private val manualBrightnessIcon by lazy {
        val manual = "revanced_ic_sc_brightness_manual"
        val styledManual = PlayerIcons.name(manual)
        val high = "revanced_ic_sc_brightness_high"
        val styledHigh = PlayerIcons.name(high)
        loadDrawable(if (styledManual == manual && styledHigh != high) styledHigh else styledManual)
    }
    private val mutedVolumeIcon by lazy { getDrawable("revanced_ic_sc_volume_mute") }
    private val lowVolumeIcon by lazy { getDrawable("revanced_ic_sc_volume_low") }
    private val normalVolumeIcon by lazy { getDrawable("revanced_ic_sc_volume_normal") }
    private val fullVolumeIcon by lazy { getDrawable("revanced_ic_sc_volume_high") }
    private val speedIcon by lazy { getDrawable("revanced_ic_sc_speed") }
    private val seekIcon by lazy { getDrawable("revanced_ic_sc_seek") }

    private fun getDrawable(baseName: String): Drawable = loadDrawable(PlayerIcons.name(baseName))

    private fun loadDrawable(name: String): Drawable =
        resources.getDrawable(
            getIdentifier(name, ResourceType.DRAWABLE, context),
            context.theme,
        ).mutate().apply {
            // Tint the glyph, not its alpha mask; the Phosphor duotone paths retain their shading.
            setTint(config.overlayForegroundColor)
        }

    private var direction = SwipeDirection.NONE
    private var style = config.overlayStyle(direction)

    internal fun selectGestureStyle(newDirection: SwipeDirection) {
        if (direction == newDirection) return

        direction = newDirection
        style = config.overlayStyle(newDirection)
    }

    private val locale get() = resources.configuration.locales[0]
    private val integerFormat by lazy {
        NumberFormat.getIntegerInstance(locale).apply { isGroupingUsed = false }
    }
    private val percentFormat by lazy {
        NumberFormat.getPercentInstance(locale).apply { isGroupingUsed = false }
    }
    private val speedFormat by lazy {
        NumberFormat.getNumberInstance(locale).apply {
            minimumFractionDigits = 2
            maximumFractionDigits = 2
        }
    }
    private fun formatPercent(value: Int): String = percentFormat.format(value / 100.0)
    private fun formatSpeed(value: Float): String = "${speedFormat.format(value.toDouble())}x"

    private val autoBrightnessText by lazy { str("revanced_swipe_lowest_value_enable_auto_brightness_overlay_text") }
    private val brightnessPercentSlot by lazy {
        val autoLabel = if (config.shouldLowestValueEnableAutoBrightness) autoBrightnessText else null
        SwipeOverlayLabelSlot(formatPercent(100), autoLabel)
    }
    private val brightnessVerticalSlot by lazy {
        SwipeOverlayLabelSlot(integerFormat.format(100), "A".takeIf { config.shouldLowestValueEnableAutoBrightness })
    }
    private val boostedVolumeSlot by lazy {
        SwipeOverlayLabelSlot(formatPercent(100 + SoundBoostPatch.MAX_BOOST_STEPS * VOLUME_BOOST_PERCENT_PER_STEP))
    }
    private var volumeLimit = -1
    private lateinit var volumeSlot: SwipeOverlayLabelSlot
    private val speedSlot by lazy { SwipeOverlayLabelSlot(formatSpeed(8f)) }
    private var seekDuration = -1L
    private lateinit var durationText: String
    private lateinit var seekSlot: SwipeOverlayLabelSlot

    private val circularProgressView by lazy {
        val size = LayoutParams.WRAP_CONTENT
        CircularProgressView(
            context,
            config.overlayBackgroundColor,
            config.overlayFillBackgroundPaint,
            config.overlayForegroundColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(size, size).apply { addRule(CENTER_IN_PARENT) }
            visibility = GONE
            addView(this)
        }
    }

    private val horizontalTopMargin = context.dp(20f).toInt()
    private val horizontalProgressView by lazy {
        HorizontalProgressView(
            context,
            config.overlayBackgroundColor,
            config.overlayFillBackgroundPaint,
            config.overlayForegroundColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply {
                addRule(CENTER_HORIZONTAL)
                topMargin = horizontalTopMargin
            }
            visibility = GONE
            addView(this)
        }
    }

    private fun positionedHorizontalProgressView(): HorizontalProgressView =
        horizontalProgressView.apply {
            val params = layoutParams as LayoutParams
            val topMargin = if (style.isHorizontalCenter) 0 else horizontalTopMargin
            if (params.topMargin != topMargin) {
                params.topMargin = topMargin
                params.addRule(CENTER_VERTICAL, if (style.isHorizontalCenter) TRUE else 0)
                layoutParams = params
            }
        }

    private val verticalBrightnessProgressView by lazy { verticalProgressView(rightSide = true) }
    private val verticalVolumeProgressView by lazy { verticalProgressView(rightSide = false) }

    private fun verticalProgressView(rightSide: Boolean) =
        VerticalProgressView(
            context,
            config.overlayBackgroundColor,
            config.overlayFillBackgroundPaint,
            config.overlayForegroundColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(LayoutParams.WRAP_CONTENT, LayoutParams.WRAP_CONTENT).apply {
                val margin = context.dp(40f).toInt()
                if (rightSide) {
                    addRule(ALIGN_PARENT_RIGHT)
                    rightMargin = margin
                } else {
                    addRule(ALIGN_PARENT_LEFT)
                    leftMargin = margin
                }
                addRule(CENTER_VERTICAL)
            }
            visibility = GONE
            addView(this)
        }

    private val feedbackTextView by lazy {
        LegacyFeedbackView(
            context,
            config.overlayBackgroundColor,
            config.overlayForegroundColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(
                LayoutParams.WRAP_CONTENT,
                LayoutParams.WRAP_CONTENT,
            ).apply {
                addRule(CENTER_IN_PARENT)
            }
            visibility = GONE
            addView(this)
        }
    }

    private var visibleFeedback: View? = null
    private val feedbackHideHandler = Handler(Looper.getMainLooper())
    private val feedbackHideCallback = Runnable {
        visibleFeedback?.visibility = GONE
        visibleFeedback = null
    }

    internal fun hideFeedback() {
        feedbackHideHandler.removeCallbacks(feedbackHideCallback)
        feedbackHideCallback.run()
    }

    internal fun keepFeedbackVisible() {
        visibleFeedback?.let(::showForTimeout)
    }

    private fun showForTimeout(view: View) {
        if (visibleFeedback !== view) {
            visibleFeedback?.visibility = GONE
            visibleFeedback = view
            view.visibility = VISIBLE
        }

        feedbackHideHandler.removeCallbacks(feedbackHideCallback)
        feedbackHideHandler.postDelayed(feedbackHideCallback, config.overlayShowTimeoutMillis)
    }

    // Enum to represent the type of feedback
    private enum class FeedbackType {
        BRIGHTNESS, VOLUME, SPEED, SEEK
    }

    /**
     * Displays the progress bar with the appropriate value, icon, and type (brightness, volume, speed, or seek).
     */
    private fun showFeedbackView(
        value: String,
        labelSlot: SwipeOverlayLabelSlot,
        progress: Int,
        max: Int,
        icon: Drawable,
        type: FeedbackType,
        isBoosted: Boolean = false,
    ) {
        if (style.isLegacy) {
            feedbackTextView.setFeedback(value, labelSlot, icon)
            showForTimeout(feedbackTextView)
            return
        }

        val isBrightness = type == FeedbackType.BRIGHTNESS
        val viewToShow = when {
            style.isCircular -> circularProgressView
            style.isVertical && isBrightness -> verticalBrightnessProgressView
            style.isVertical && type == FeedbackType.VOLUME -> verticalVolumeProgressView
            else -> positionedHorizontalProgressView() // Vertical styles use horizontal for speed and seek.
        }
        val progressColor = when (type) {
            FeedbackType.BRIGHTNESS -> config.overlayBrightnessProgressColor
            FeedbackType.VOLUME ->
                if (isBoosted) VOLUME_BOOST_PROGRESS_COLOR else config.overlayVolumeProgressColor
            FeedbackType.SPEED -> config.overlaySpeedProgressColor
            FeedbackType.SEEK -> config.overlaySeekProgressColor
        }
        viewToShow.setFeedback(progress, max, value, labelSlot, icon, progressColor, style.isMinimal)
        showForTimeout(viewToShow)
    }

    // Handle volume change.
    override fun onVolumeChanged(newVolume: Int, maximumVolume: Int, boostStep: Int) {
        val isBoosted = boostStep > 0
        val volumePercentage = (newVolume.toFloat() / maximumVolume) * 100
        val usePercent = isBoosted || SoundBoostPatch.isBoostAllowed()
        val text = when {
            isBoosted -> formatPercent(100 + boostStep * VOLUME_BOOST_PERCENT_PER_STEP)
            usePercent -> formatPercent(round(volumePercentage).toInt())
            else -> integerFormat.format(newVolume)
        }
        val labelSlot = if (usePercent) {
            boostedVolumeSlot
        } else {
            if (volumeLimit != maximumVolume) {
                volumeLimit = maximumVolume
                volumeSlot = SwipeOverlayLabelSlot(integerFormat.format(maximumVolume))
            }
            volumeSlot
        }
        val icon = when {
            newVolume == 0 -> mutedVolumeIcon
            style.isLegacy -> normalVolumeIcon
            volumePercentage < 25 -> lowVolumeIcon
            volumePercentage < 50 -> normalVolumeIcon
            else -> fullVolumeIcon
        }
        showFeedbackView(text, labelSlot, newVolume, maximumVolume, icon, FeedbackType.VOLUME, isBoosted)
    }

    // Handle brightness change.
    override fun onBrightnessChanged(brightness: Double) {
        val labelSlot = if (style.isVertical) brightnessVerticalSlot else brightnessPercentSlot
        if (config.shouldLowestValueEnableAutoBrightness && brightness <= 0) {
            val text = if (style.isVertical) "A" else autoBrightnessText
            showFeedbackView(text, labelSlot, 0, 100, autoBrightnessIcon, FeedbackType.BRIGHTNESS)
            return
        }

        val progress = max(0, round(brightness).toInt())
        val text = if (style.isVertical) integerFormat.format(progress) else formatPercent(progress)
        val icon = when {
            style.isLegacy -> manualBrightnessIcon
            progress < 25 -> lowBrightnessIcon
            progress < 50 -> mediumBrightnessIcon
            progress < 75 -> highBrightnessIcon
            else -> fullBrightnessIcon
        }
        showFeedbackView(text, labelSlot, progress, 100, icon, FeedbackType.BRIGHTNESS)
    }

    override fun onSpeedChanged(speed: Float) {
        showFeedbackView(
            formatSpeed(speed),
            speedSlot,
            (speed * 100).toInt(),
            800,
            speedIcon,
            FeedbackType.SPEED
        )
    }

    override fun onSeekChanged(seekAmount: Int) {
        val currentTime = VideoInformation.getVideoTime()
        val totalTime = VideoInformation.getVideoLength()
        onSeekPositionChanged((currentTime + seekAmount).coerceIn(0, totalTime), totalTime)
    }

    internal fun onSeekPositionChanged(newTime: Long, totalTime: Long) {
        if (seekDuration != totalTime) {
            seekDuration = totalTime
            durationText = getTimeStamp(totalTime)
            // The current position can cross an hour boundary while the total stays the same.
            seekSlot = SwipeOverlayLabelSlot("$durationText / $durationText")
        }
        val text = "${getTimeStamp(newTime)} / $durationText"
        val progress = if (totalTime > 0) ((newTime.toFloat() / totalTime) * 100).toInt() else 0

        showFeedbackView(text, seekSlot, progress, 100, seekIcon, FeedbackType.SEEK)
    }

    // Begin swipe session.
    override fun onEnterSwipeSession() {
        if (config.shouldEnableHapticFeedback) {
            @Suppress("DEPRECATION")
            performHapticFeedback(
                HapticFeedbackConstants.LONG_PRESS,
                HapticFeedbackConstants.FLAG_IGNORE_GLOBAL_SETTING,
            )
        }
    }
}

@SuppressLint("ViewConstructor")
internal class LegacyFeedbackView(
    context: Context,
    backgroundColor: Int,
    foregroundColor: Int,
    textSizeSp: Int,
) : TextView(context) {
    private var labelSlot: SwipeOverlayLabelSlot? = null
    private var labelWidth = 0f
    private var currentIcon: Drawable? = null
    private val iconSize: Int
    private val rowHeight: Int

    init {
        val verticalPadding = context.dp(5f).toInt()
        val horizontalPadding = context.dp(12f).toInt()
        setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding)
        background = GradientDrawable().apply {
            cornerRadius = 30f
            setColor(backgroundColor)
        }
        setTextColor(foregroundColor)
        setTextSize(TypedValue.COMPLEX_UNIT_SP, textSizeSp.toFloat())
        maxLines = 1
        gravity = Gravity.CENTER
        compoundDrawablePadding = context.dp(4f).toInt()

        iconSize = round(lineHeight * .8f).toInt()
        val metrics = paint.fontMetricsInt
        rowHeight = max(iconSize, metrics.bottom - metrics.top) + verticalPadding * 2
    }

    fun setFeedback(value: String, slot: SwipeOverlayLabelSlot, icon: Drawable) {
        if (slot !== labelSlot) {
            labelSlot = slot
            val previousScale = paint.textScaleX
            paint.textScaleX = 1f
            labelWidth = ceil(slot.width(paint)) + 1f
            paint.textScaleX = previousScale
            requestLayout()
        }
        // Both edge styles can draw this glyph, with different bounds.
        icon.setBounds(0, 0, iconSize, iconSize)
        if (icon !== currentIcon) {
            currentIcon = icon
            setCompoundDrawablesRelative(icon, null, null, null)
        }
        if (!value.contentEquals(text)) text = value
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val insets = compoundPaddingLeft + compoundPaddingRight
        val width = resolveSize(labelWidth.toInt() + insets, widthMeasureSpec)
        val height = resolveSize(rowHeight, heightMeasureSpec)
        if (labelWidth > 0f) {
            val scale = ((width - insets) / labelWidth).coerceIn(.01f, 1f)
            if (textScaleX != scale) textScaleX = scale
        }
        super.onMeasure(
            MeasureSpec.makeMeasureSpec(width, MeasureSpec.EXACTLY),
            MeasureSpec.makeMeasureSpec(height, MeasureSpec.EXACTLY),
        )
    }
}

internal abstract class AbstractProgressView(
    context: Context,
    backgroundColor: Int,
    trackColor: Int,
    foregroundColor: Int,
    textSizeSp: Int,
) : View(context) {
    protected val backgroundPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = backgroundColor }
    protected val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { color = trackColor }
    protected val progressPaint = Paint(Paint.ANTI_ALIAS_FLAG)

    private val preferredTextSize = TypedValue.applyDimension(
        TypedValue.COMPLEX_UNIT_SP, textSizeSp.toFloat(), resources.displayMetrics,
    )
    private val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = foregroundColor
        textAlign = Paint.Align.CENTER
        textSize = preferredTextSize
        textLocale = resources.configuration.locales[0]
    }
    private val textMetrics = textPaint.fontMetrics
    protected val preferredLabelHeight = textMetrics.bottom - textMetrics.top
    protected var preferredLabelWidth = 0f
        private set
    protected var labelWidth = 0f
        private set
    protected var labelHeight = 0f
        private set

    private var labelSlot: SwipeOverlayLabelSlot? = null
    private var label = ""
    private var icon: Drawable? = null
    protected var isMinimalStyle = false
        private set
    protected var progressFraction = 0f
        private set

    fun setFeedback(
        value: Int,
        max: Int,
        text: String,
        slot: SwipeOverlayLabelSlot,
        icon: Drawable,
        progressColor: Int,
        minimal: Boolean,
    ) {
        val slotChanged = slot !== labelSlot
        if (slotChanged) {
            labelSlot = slot
            textPaint.textSize = preferredTextSize
            preferredLabelWidth = ceil(slot.width(textPaint)) + 1f
        }
        if (slotChanged || isMinimalStyle != minimal) requestLayout()

        isMinimalStyle = minimal
        label = text
        this.icon = icon
        progressFraction = if (max > 0) (value.toFloat() / max).coerceIn(0f, 1f) else 0f
        progressPaint.color = progressColor
        invalidate()
    }

    protected fun fitLabel(maxWidth: Float, maxHeight: Float) {
        if (preferredLabelWidth <= 0f) return

        // Fit the whole reserved slot, never the current label. Even at a large font scale,
        // all values use the same text size, baseline and bar endpoints within this player.
        val scale = min(maxWidth / preferredLabelWidth, maxHeight / preferredLabelHeight).coerceIn(0f, 1f)
        labelWidth = preferredLabelWidth * scale
        textPaint.textSize = preferredTextSize * scale
        textPaint.getFontMetrics(textMetrics)
        labelHeight = textMetrics.bottom - textMetrics.top
    }

    protected fun drawLabel(canvas: Canvas, centerX: Float, centerY: Float) {
        if (labelWidth > 0f) {
            val baseline = centerY - (textMetrics.top + textMetrics.bottom) / 2f
            canvas.drawText(label, centerX, baseline, textPaint)
        }
    }

    protected fun drawIcon(canvas: Canvas, centerX: Float, centerY: Float, size: Float) {
        val drawable = icon ?: return
        val side = size.toInt()
        val left = (centerX - size / 2f).toInt()
        val top = (centerY - size / 2f).toInt()
        drawable.setBounds(left, top, left + side, top + side)
        drawable.draw(canvas)
    }
}

@SuppressLint("ViewConstructor")
internal class CircularProgressView(
    context: Context,
    backgroundColor: Int,
    trackColor: Int,
    foregroundColor: Int,
    textSizeSp: Int,
) : AbstractProgressView(context, backgroundColor, trackColor, foregroundColor, textSizeSp) {
    private val ring = RectF()
    private val margin = context.dp(6f)

    init {
        trackPaint.strokeWidth = margin
        trackPaint.style = Paint.Style.STROKE
        progressPaint.strokeWidth = margin
        progressPaint.style = Paint.Style.STROKE
        progressPaint.strokeCap = Paint.Cap.ROUND
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val desired = if (isMinimalStyle) context.dp(100f) else {
            (preferredLabelWidth / .6f).coerceIn(context.dp(100f), context.dp(133f))
        }
        val width = resolveSize(ceil(desired).toInt(), widthMeasureSpec)
        val height = resolveSize(ceil(desired).toInt(), heightMeasureSpec)
        val size = min(width, height).toFloat()
        fitLabel(size * .6f, size * .24f)
        setMeasuredDimension(width, height)
    }

    override fun onDraw(canvas: Canvas) {
        val centerX = width / 2f
        val centerY = height / 2f
        val size = min(width, height).toFloat()
        val radius = (size / 2f - margin).coerceAtLeast(0f)
        ring.set(centerX - radius, centerY - radius, centerX + radius, centerY + radius)

        canvas.drawOval(ring, trackPaint)
        canvas.drawCircle(centerX, centerY, size / 3f, backgroundPaint)
        canvas.drawArc(ring, -90f, progressFraction * 360f, false, progressPaint)

        if (isMinimalStyle) {
            drawIcon(canvas, centerX, centerY, size * .36f)
        } else {
            drawIcon(canvas, centerX, centerY - size * .13f, size * .27f)
            drawLabel(canvas, centerX, centerY + size * .15f)
        }
    }
}

@SuppressLint("ViewConstructor")
internal class HorizontalProgressView(
    context: Context,
    backgroundColor: Int,
    trackColor: Int,
    foregroundColor: Int,
    textSizeSp: Int,
) : AbstractProgressView(context, backgroundColor, trackColor, foregroundColor, textSizeSp) {
    private val iconSize = context.dp(20f)
    private val padding = context.dp(12f)
    private val barRadius = context.dp(1.5f)

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val availableWidth = if (MeasureSpec.getMode(widthMeasureSpec) == MeasureSpec.UNSPECIFIED) {
            resources.displayMetrics.widthPixels
        } else {
            MeasureSpec.getSize(widthMeasureSpec)
        }
        val barWidth = if (isMinimalStyle) 0f else availableWidth / 4f + padding
        val desiredWidth = iconSize + padding * 3f + preferredLabelWidth + barWidth
        val width = resolveSize(min(ceil(desiredWidth).toInt(), availableWidth * 4 / 5), widthMeasureSpec)
        val desiredHeight = max(context.dp(32f), preferredLabelHeight + context.dp(8f))
        val height = resolveSize(ceil(desiredHeight).toInt(), heightMeasureSpec)

        val availableForLabelAndBar = width - iconSize - padding * 3f
        val barAllowance = if (isMinimalStyle) 0f else min(availableForLabelAndBar / 3f, context.dp(36f))
        fitLabel(availableForLabelAndBar - barAllowance, height - context.dp(8f))
        setMeasuredDimension(width, height)
    }

    override fun onDraw(canvas: Canvas) {
        val centerY = height / 2f
        canvas.drawRoundRect(0f, 0f, width.toFloat(), height.toFloat(), centerY, centerY, backgroundPaint)
        drawIcon(canvas, padding + iconSize / 2f, centerY, iconSize)

        val labelLeft = width - padding - labelWidth
        drawLabel(canvas, labelLeft + labelWidth / 2f, centerY)

        if (!isMinimalStyle) {
            val start = padding * 2f + iconSize
            val end = labelLeft - padding
            if (end > start) {
                val top = centerY - barRadius
                val bottom = centerY + barRadius
                canvas.drawRoundRect(start, top, end, bottom, barRadius, barRadius, trackPaint)
                val progressEnd = start + (end - start) * progressFraction
                canvas.drawRoundRect(start, top, progressEnd, bottom, barRadius, barRadius, progressPaint)
            }
        }
    }
}

@SuppressLint("ViewConstructor")
internal class VerticalProgressView(
    context: Context,
    backgroundColor: Int,
    trackColor: Int,
    foregroundColor: Int,
    textSizeSp: Int,
) : AbstractProgressView(context, backgroundColor, trackColor, foregroundColor, textSizeSp) {
    private val iconSize = context.dp(20f)
    private val padding = context.dp(12f)
    private val sideInset = context.dp(6f)
    private val barRadius = context.dp(1.5f)

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        val desiredWidth = max(context.dp(40f), preferredLabelWidth + sideInset * 2f)
        val width = resolveSize(ceil(desiredWidth).toInt(), widthMeasureSpec)
        val desiredHeight = if (isMinimalStyle) {
            padding * 3f + iconSize + preferredLabelHeight
        } else {
            max(context.dp(150f), padding * 4f + iconSize + preferredLabelHeight)
        }
        val height = resolveSize(ceil(desiredHeight).toInt(), heightMeasureSpec)

        val availableForLabelAndBar = height - padding * 3f - iconSize
        val barAllowance = if (isMinimalStyle) 0f else min(availableForLabelAndBar / 3f, context.dp(36f))
        fitLabel(width - sideInset * 2f, availableForLabelAndBar - barAllowance)
        setMeasuredDimension(width, height)
    }

    override fun onDraw(canvas: Canvas) {
        val centerX = width / 2f
        canvas.drawRoundRect(0f, 0f, width.toFloat(), height.toFloat(), centerX, centerX, backgroundPaint)
        drawIcon(canvas, centerX, padding + iconSize / 2f, iconSize)

        val labelTop = height - padding - labelHeight
        drawLabel(canvas, centerX, labelTop + labelHeight / 2f)

        if (!isMinimalStyle) {
            val start = padding * 2f + iconSize
            val end = labelTop - padding
            if (end > start) {
                val left = centerX - barRadius
                val right = centerX + barRadius
                canvas.drawRoundRect(left, start, right, end, barRadius, barRadius, trackPaint)
                val progressStart = end - (end - start) * progressFraction
                canvas.drawRoundRect(left, progressStart, right, end, barRadius, barRadius, progressPaint)
            }
        }
    }
}
