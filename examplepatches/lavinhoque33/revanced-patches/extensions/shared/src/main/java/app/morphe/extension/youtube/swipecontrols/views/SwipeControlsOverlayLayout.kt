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
import android.content.res.Resources
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect
import android.graphics.RectF
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.AttributeSet
import android.util.TypedValue
import android.view.HapticFeedbackConstants
import android.view.View
import android.widget.RelativeLayout
import android.widget.TextView
import app.morphe.extension.shared.utils.ResourceType
import app.morphe.extension.shared.utils.ResourceUtils.getIdentifier
import app.morphe.extension.shared.utils.StringRef.str
import app.morphe.extension.shared.utils.Utils.dipToPixels
import app.morphe.extension.shared.utils.Utils.getTimeStamp
import app.morphe.extension.youtube.patches.SoundBoostPatch
import app.morphe.extension.youtube.shared.VideoInformation
import app.morphe.extension.youtube.swipecontrols.SwipeControlsConfigurationProvider
import app.morphe.extension.youtube.swipecontrols.controller.gesture.core.SwipeDetector.SwipeDirection
import app.morphe.extension.youtube.swipecontrols.misc.SwipeControlsOverlay
import app.morphe.extension.youtube.videoplayer.PlayerIcons
import java.util.Locale
import kotlin.math.max
import kotlin.math.min
import kotlin.math.round

private const val VOLUME_BOOST_PERCENT_PER_STEP = 25
private const val VOLUME_BOOST_PROGRESS_COLOR = 0xBFFF7043.toInt()

/**
 * Convert dp to pixels based on system display density.
 */
fun Float.toDisplayPixels(): Float {
    return this * Resources.getSystem().displayMetrics.density
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
        ).apply {
            setTint(config.overlayTextColor)
        }

    private var direction = SwipeDirection.NONE
    private var style = config.overlayStyle(direction)

    internal fun selectGestureStyle(newDirection: SwipeDirection) {
        if (direction == newDirection) return

        direction = newDirection
        style = config.overlayStyle(newDirection)
    }

    private val circularProgressView by lazy {
        val size = dipToPixels(100f)
        CircularProgressView(
            context,
            config.overlayBackgroundColor,
            config.overlayFillBackgroundPaint,
            config.overlayTextColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(size, size).apply { addRule(CENTER_IN_PARENT) }
            visibility = GONE
            addView(this)
        }
    }

    private val horizontalTopMargin = dipToPixels(20f)
    private val horizontalProgressView by lazy {
        HorizontalProgressView(
            context,
            config.overlayBackgroundColor,
            config.overlayFillBackgroundPaint,
            config.overlayTextColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(LayoutParams.WRAP_CONTENT, dipToPixels(32f)).apply {
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
            config.overlayTextColor,
            config.overlayTextSize,
        ).apply {
            layoutParams = LayoutParams(dipToPixels(40f), dipToPixels(150f)).apply {
                val margin = dipToPixels(40f)
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
        val verticalPadding = dipToPixels(5f)
        val horizontalPadding = dipToPixels(12f)
        TextView(context).apply {
            layoutParams = LayoutParams(
                LayoutParams.WRAP_CONTENT,
                LayoutParams.WRAP_CONTENT,
            ).apply {
                addRule(CENTER_IN_PARENT)
            }
            setPadding(horizontalPadding, verticalPadding, horizontalPadding, verticalPadding)
            background = GradientDrawable().apply {
                cornerRadius = 30f
                setColor(config.overlayBackgroundColor)
            }
            setTextColor(config.overlayTextColor)
            setTextSize(
                TypedValue.COMPLEX_UNIT_SP,
                config.overlayTextSize.toFloat()
            )
            compoundDrawablePadding = dipToPixels(4f)
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
     * Show the feedback view for a given time.
     * Used only in legacy styles.
     *
     * @param message the message to show.
     * @param icon the icon to use.
     */
    private fun showLegacyFeedbackView(message: String, icon: Drawable) {
        feedbackTextView.apply {
            val iconSize = round(lineHeight * .8).toInt()
            icon.setBounds(0, 0, iconSize, iconSize)
            text = message
            setCompoundDrawablesRelative(icon, null, null, null)
        }
        showForTimeout(feedbackTextView)
    }

    /**
     * Displays the progress bar with the appropriate value, icon, and type (brightness, volume, speed, or seek).
     */
    private fun showFeedbackView(
        value: String,
        progress: Int,
        max: Int,
        icon: Drawable,
        type: FeedbackType,
        isBoosted: Boolean = false,
    ) {
        if (style.isLegacy) {
            showLegacyFeedbackView(value, icon)
            return
        }

        val isBrightness = type == FeedbackType.BRIGHTNESS
        val isSeek = type == FeedbackType.SEEK
        val viewToShow = when {
            style.isCircular -> circularProgressView
            style.isVertical && isBrightness -> verticalBrightnessProgressView
            style.isVertical && type == FeedbackType.VOLUME -> verticalVolumeProgressView
            else -> positionedHorizontalProgressView() // Vertical styles use horizontal for speed and seek.
        }
        viewToShow.apply {
            isMinimalStyle = style.isMinimal
            // Set the appropriate progress color
            setProgressColor(
                when (type) {
                    FeedbackType.BRIGHTNESS -> config.overlayBrightnessProgressColor
                    FeedbackType.VOLUME ->
                        if (isBoosted) VOLUME_BOOST_PROGRESS_COLOR else config.overlayVolumeProgressColor
                    FeedbackType.SPEED -> config.overlaySpeedProgressColor
                    FeedbackType.SEEK -> config.overlaySeekProgressColor
                }
            )
            setProgress(progress, max, value, isBrightness, isSeek)
            this.icon = icon
        }
        showForTimeout(viewToShow)
    }

    // Handle volume change.
    override fun onVolumeChanged(newVolume: Int, maximumVolume: Int, boostStep: Int) {
        val isBoosted = boostStep > 0
        val volumePercentage = (newVolume.toFloat() / maximumVolume) * 100
        // Levels above 100% only exist when volume boost is allowed, so it is the only case
        // where the level is shown as a percentage, and it fills the bar.
        val text = when {
            isBoosted -> "${100 + boostStep * VOLUME_BOOST_PERCENT_PER_STEP}%"
            SoundBoostPatch.isBoostAllowed() -> "${round(volumePercentage).toInt()}%"
            else -> "$newVolume"
        }

        if (style.isLegacy) {
            showLegacyFeedbackView(
                text,
                if (newVolume > 0) normalVolumeIcon else mutedVolumeIcon,
            )
        } else {
            val icon = when {
                newVolume == 0 -> mutedVolumeIcon
                volumePercentage < 25 -> lowVolumeIcon
                volumePercentage < 50 -> normalVolumeIcon
                else -> fullVolumeIcon
            }
            showFeedbackView(text, newVolume, maximumVolume, icon, FeedbackType.VOLUME, isBoosted)
        }
    }

    // Handle brightness change.
    override fun onBrightnessChanged(brightness: Double) {
        if (config.shouldLowestValueEnableAutoBrightness && brightness <= 0) {
            val displayText = if (style.isVertical) "A"
            else str("revanced_swipe_lowest_value_enable_auto_brightness_overlay_text")

            showFeedbackView(displayText, 0, 100, autoBrightnessIcon, FeedbackType.BRIGHTNESS)
        } else {
            val brightnessValue = round(brightness).toInt()
            if (style.isLegacy) {
                showLegacyFeedbackView(
                    "$brightnessValue%",
                    manualBrightnessIcon
                )
            } else {
                val clampedProgress = max(0, brightnessValue)
                val icon = when {
                    clampedProgress < 25 -> lowBrightnessIcon
                    clampedProgress < 50 -> mediumBrightnessIcon
                    clampedProgress < 75 -> highBrightnessIcon
                    else -> fullBrightnessIcon
                }
                val displayText =
                    if (style.isVertical) "$clampedProgress" else "$clampedProgress%"

                showFeedbackView(
                    displayText,
                    clampedProgress,
                    100,
                    icon,
                    FeedbackType.BRIGHTNESS
                )
            }
        }
    }

    override fun onSpeedChanged(speed: Float) {
        val displaySpeed = String.format(Locale.US, "%.2fx", speed)
        showFeedbackView(
            displaySpeed,
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

        val text = "${getTimeStamp(newTime)} / ${getTimeStamp(totalTime)}"
        val progress = if (totalTime > 0) ((newTime.toFloat() / totalTime) * 100).toInt() else 0

        showFeedbackView(text, progress, 100, seekIcon, FeedbackType.SEEK)
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

/**
 * Abstract base class for progress views.
 */
abstract class AbstractProgressView(
    context: Context,
    overlayBackgroundColor: Int,
    overlayFillBackgroundPaint: Int,
    overlayTextColor: Int,
    protected val overlayTextSize: Int,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : View(context, attrs, defStyleAttr) {
    internal var isMinimalStyle = false

    // Combined paint creation function for both fill and stroke styles.
    private fun createPaint(
        color: Int,
        style: Paint.Style = Paint.Style.FILL,
        strokeCap: Paint.Cap = Paint.Cap.BUTT,
        strokeWidth: Float = 0f
    ) = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        this.style = style
        this.color = color
        this.strokeCap = strokeCap
        this.strokeWidth = strokeWidth
    }

    // Initialize paints.
    val backgroundPaint = createPaint(
        overlayBackgroundColor,
        style = Paint.Style.FILL
    )
    val progressPaint = createPaint(
        0,
        style = Paint.Style.STROKE,
        strokeCap = Paint.Cap.ROUND,
        strokeWidth = 6f.toDisplayPixels()
    )
    val fillBackgroundPaint = createPaint(
        overlayFillBackgroundPaint,
        style = Paint.Style.FILL
    )
    val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = overlayTextColor
        textAlign = Paint.Align.CENTER
        textSize = overlayTextSize.toFloat().toDisplayPixels()
    }

    // Rect for text measurement.
    protected val textBounds = Rect()

    protected var progress = 0
    protected var maxProgress = 100
    protected var displayText: String = "0"
    protected var isBrightness = true
    protected var isSeek = false
    var icon: Drawable? = null

    open fun setProgress(value: Int, max: Int, text: String, isBrightnessMode: Boolean, isSeekMode: Boolean = false) {
        progress = value
        maxProgress = max
        displayText = text
        isBrightness = isBrightnessMode
        isSeek = isSeekMode
        invalidate()
    }

    fun setProgressColor(color: Int) {
        progressPaint.color = color
        invalidate()
    }

    protected fun measureTextWidth(text: String, paint: Paint): Int {
        paint.getTextBounds(text, 0, text.length, textBounds)
        return textBounds.width()
    }

    override fun onDraw(canvas: Canvas) {
        // Base class implementation can be empty.
    }
}

/**
 * Custom view for rendering a circular progress indicator with icons and text.
 */
@SuppressLint("ViewConstructor")
class CircularProgressView(
    context: Context,
    overlayBackgroundColor: Int,
    overlayFillBackgroundPaint: Int,
    overlayTextColor: Int,
    overlayTextSize: Int,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AbstractProgressView(
    context,
    overlayBackgroundColor,
    overlayFillBackgroundPaint,
    overlayTextColor,
    overlayTextSize,
    attrs,
    defStyleAttr
) {
    private val rectF = RectF()
    private val tempTextPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = overlayTextColor
        textAlign = Paint.Align.CENTER
    }

    // Circle size parameters for dynamic measuring
    private var circleSize = 100f.toDisplayPixels()
    private val minCircleSize = 100f.toDisplayPixels()
    private val maxCircleSize = 133f.toDisplayPixels()

    private val durationFontSize = 10f.toDisplayPixels()
    private val maxTextWidth = 60f.toDisplayPixels()
    private val iconTextSpacing = 13f.toDisplayPixels()

    init {
        progressPaint.strokeWidth = 6f.toDisplayPixels()
        fillBackgroundPaint.strokeWidth = 6f.toDisplayPixels()
        progressPaint.strokeCap = Paint.Cap.ROUND
        fillBackgroundPaint.strokeCap = Paint.Cap.BUTT
        progressPaint.style = Paint.Style.STROKE
        fillBackgroundPaint.style = Paint.Style.STROKE
    }

    /**
     * Override onMeasure to handle dynamic sizing for long durations.
     */
    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        if (isSeek && !isMinimalStyle) {
            // Start with base size and adjust based on text length.
            circleSize = minCircleSize
            if (displayText.length > 10) {
                // Increase circle size proportionally if the duration text is long.
                val textFactor = min((displayText.length - 10) * 3.3f.toDisplayPixels(), 33f.toDisplayPixels())
                circleSize = min(minCircleSize + textFactor, maxCircleSize)
            }
            setMeasuredDimension(circleSize.toInt(), circleSize.toInt())
        } else {
            // Use a fixed size for non-seek modes.
            circleSize = minCircleSize
            setMeasuredDimension(minCircleSize.toInt(), minCircleSize.toInt())
        }
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        val size = min(width, height).toFloat()
        val margin = 6f.toDisplayPixels()
        rectF.set(margin, margin, size - margin, size - margin)

        canvas.drawOval(rectF, fillBackgroundPaint)
        canvas.drawCircle(
            width / 2f,
            height / 2f,
            size / 3,
            backgroundPaint
        )

        val sweepAngle = (progress.toFloat() / maxProgress) * 360
        canvas.drawArc(rectF, -90f, sweepAngle, false, progressPaint)

        if (isMinimalStyle) {
            icon?.let {
                val iconSize = 36f.toDisplayPixels().toInt()
                val iconX = (width - iconSize) / 2f
                val iconY = (height - iconSize) / 2f
                it.setBounds(iconX.toInt(), iconY.toInt(), (iconX + iconSize).toInt(), (iconY + iconSize).toInt())
                it.draw(canvas)
            }
        } else {
            val centerX = width / 2f
            val centerY = height / 2f

            icon?.let {
                val iconSize = 27f.toDisplayPixels().toInt()
                val iconHalfSize = iconSize / 2f
                val iconX = centerX - iconHalfSize
                val iconY = centerY - iconTextSpacing
                it.setBounds(
                    iconX.toInt(),
                    (iconY - iconHalfSize).toInt(),
                    (iconX + iconSize).toInt(),
                    (iconY + iconHalfSize).toInt()
                )
                it.draw(canvas)
            }

            if (isSeek) {
                tempTextPaint.textSize = durationFontSize
                var textSize = durationFontSize
                while (measureTextWidth(displayText, tempTextPaint) > maxTextWidth && textSize > 5f.toDisplayPixels()) {
                    textSize -= 0.67f.toDisplayPixels()
                    tempTextPaint.textSize = textSize
                }
                canvas.drawText(
                    displayText,
                    centerX,
                    centerY + iconTextSpacing + tempTextPaint.textSize / 3,
                    tempTextPaint
                )
            } else {
                var textSize = 13f.toDisplayPixels()
                tempTextPaint.textSize = textSize
                while (measureTextWidth(displayText, tempTextPaint) > maxTextWidth && textSize > 6f.toDisplayPixels()) {
                    textSize -= 0.67f.toDisplayPixels()
                    tempTextPaint.textSize = textSize
                }
                canvas.drawText(
                    displayText,
                    centerX,
                    centerY + iconTextSpacing + tempTextPaint.textSize / 3,
                    tempTextPaint
                )
            }
        }
    }

    override fun setProgress(value: Int, max: Int, text: String, isBrightnessMode: Boolean, isSeekMode: Boolean) {
        super.setProgress(value, max, text, isBrightnessMode, isSeekMode)
        requestLayout()
    }
}

/**
 * Custom view for rendering a rectangular progress bar with icons and text.
 */
@SuppressLint("ViewConstructor")
class HorizontalProgressView(
    context: Context,
    overlayBackgroundColor: Int,
    overlayFillBackgroundPaint: Int,
    overlayTextColor: Int,
    overlayTextSize: Int,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AbstractProgressView(
    context,
    overlayBackgroundColor,
    overlayFillBackgroundPaint,
    overlayTextColor,
    overlayTextSize,
    attrs,
    defStyleAttr
) {

    private val iconSize = 20f.toDisplayPixels()
    private val padding = 12f.toDisplayPixels()
    private var textWidth = 0f
    private val progressBarHeight = 3f.toDisplayPixels()
    private val progressBarWidth: Float = resources.displayMetrics.widthPixels / 4f

    init {
        progressPaint.strokeWidth = 0f
        progressPaint.strokeCap = Paint.Cap.BUTT
        progressPaint.style = Paint.Style.FILL
        fillBackgroundPaint.style = Paint.Style.FILL
    }

    /**
     * Calculate required width based on content.
     * @return Required width to display all elements.
     */
    private fun calculateRequiredWidth(): Float {
        textWidth = measureTextWidth(displayText, textPaint).toFloat()

        return if (!isMinimalStyle) {
            padding + iconSize + padding + progressBarWidth + padding + textWidth + padding
        } else {
            padding + iconSize + padding + textWidth + padding
        }
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)

        val suggestedWidth = MeasureSpec.getSize(widthMeasureSpec)
        val suggestedHeight = MeasureSpec.getSize(heightMeasureSpec)

        val height = suggestedHeight
        val requiredWidth = calculateRequiredWidth().toInt()
        val width = min(max(100, requiredWidth), suggestedWidth * 4 / 5)

        setMeasuredDimension(width, height)
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        val viewWidth = width.toFloat()
        val viewHeight = height.toFloat()
        val viewHeightHalf = viewHeight / 2

        textWidth = measureTextWidth(displayText, textPaint).toFloat()

        val cornerRadius = viewHeightHalf
        val startX = padding
        val iconEndX = startX + iconSize
        val textStartX = (viewWidth - 1.5f * padding - textWidth)

        canvas.drawRoundRect(
            0f, 0f, viewWidth, viewHeight,
            cornerRadius, cornerRadius, backgroundPaint
        )

        icon?.let {
            val iconY = viewHeightHalf - iconSize / 2
            it.setBounds(
                startX.toInt(),
                iconY.toInt(),
                (startX + iconSize).toInt(),
                (iconY + iconSize).toInt()
            )
            it.draw(canvas)
        }

        textPaint.textAlign = Paint.Align.LEFT
        canvas.drawText(displayText, textStartX, viewHeightHalf + textPaint.textSize / 3, textPaint)

        if (!isMinimalStyle) {
            val progressStartX = iconEndX + padding
            val progressEndX = textStartX - padding
            val progressWidth = progressEndX - progressStartX

            if (progressWidth > 50) {
                val progressBarHeightHalf = progressBarHeight / 2.0f
                val viewHeightHalfMinusProgressBarHeightHalf =
                    viewHeightHalf - progressBarHeightHalf
                val viewHeightHalfPlusProgressBarHeightHalf = viewHeightHalf + progressBarHeightHalf

                canvas.drawRoundRect(
                    progressStartX,
                    viewHeightHalfMinusProgressBarHeightHalf,
                    progressEndX,
                    viewHeightHalfPlusProgressBarHeightHalf,
                    progressBarHeightHalf,
                    progressBarHeightHalf,
                    fillBackgroundPaint
                )

                val progressValue = (progress.toFloat() / maxProgress) * progressWidth
                canvas.drawRoundRect(
                    progressStartX,
                    viewHeightHalfMinusProgressBarHeightHalf,
                    progressStartX + progressValue,
                    viewHeightHalfPlusProgressBarHeightHalf,
                    progressBarHeightHalf,
                    progressBarHeightHalf,
                    progressPaint
                )
            }
        }
    }

    override fun setProgress(value: Int, max: Int, text: String, isBrightnessMode: Boolean, isSeekMode: Boolean) {
        super.setProgress(value, max, text, isBrightnessMode, isSeekMode)
        requestLayout()
    }
}

/**
 * Custom view for rendering a vertical progress bar with icons and text.
 */
@SuppressLint("ViewConstructor")
class VerticalProgressView(
    context: Context,
    overlayBackgroundColor: Int,
    overlayFillBackgroundPaint: Int,
    overlayTextColor: Int,
    overlayTextSize: Int,
    attrs: AttributeSet? = null,
    defStyleAttr: Int = 0
) : AbstractProgressView(
    context,
    overlayBackgroundColor,
    overlayFillBackgroundPaint,
    overlayTextColor,
    overlayTextSize,
    attrs,
    defStyleAttr
) {

    private val iconSize = 20f.toDisplayPixels()
    private val padding = 12f.toDisplayPixels()
    private val progressBarWidth = 3f.toDisplayPixels()
    private val progressBarHeight: Float = resources.displayMetrics.widthPixels / 3f

    init {
        progressPaint.strokeWidth = 0f
        progressPaint.strokeCap = Paint.Cap.BUTT
        progressPaint.style = Paint.Style.FILL
        fillBackgroundPaint.style = Paint.Style.FILL
    }

    /**
     * Calculate required height based on content.
     * @return Required height to display all elements.
     */
    private fun calculateRequiredHeight(): Float {
        return if (!isMinimalStyle) {
            padding + iconSize + padding + progressBarHeight + padding + textPaint.textSize + padding
        } else {
            padding + iconSize + padding + textPaint.textSize + padding
        }
    }

    override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
        super.onMeasure(widthMeasureSpec, heightMeasureSpec)

        val suggestedWidth = MeasureSpec.getSize(widthMeasureSpec)
        val suggestedHeight = MeasureSpec.getSize(heightMeasureSpec)

        val requiredHeight = calculateRequiredHeight().toInt()
        val height = min(max(100, requiredHeight), suggestedHeight)

        setMeasuredDimension(suggestedWidth, height)
    }

    override fun onDraw(canvas: Canvas) {
        super.onDraw(canvas)

        val viewWidth = width.toFloat()
        val viewHeight = height.toFloat()
        val viewWidthHalf = viewWidth / 2
        val cornerRadius = viewWidthHalf

        val startY = padding
        val iconEndY = startY + iconSize

        val textStartY = viewHeight - padding - textPaint.textSize / 2

        canvas.drawRoundRect(
            0f, 0f, viewWidth, viewHeight,
            cornerRadius, cornerRadius, backgroundPaint
        )

        icon?.let {
            val iconX = viewWidthHalf - iconSize / 2
            it.setBounds(
                iconX.toInt(),
                startY.toInt(),
                (iconX + iconSize).toInt(),
                (startY + iconSize).toInt()
            )
            it.draw(canvas)
        }

        val textX = viewWidthHalf
        textPaint.textAlign = Paint.Align.CENTER
        canvas.drawText(displayText, textX, textStartY, textPaint)

        if (!isMinimalStyle) {
            val progressStartY = (iconEndY + padding)
            val progressEndY = textStartY - textPaint.textSize - padding
            val progressHeight = progressEndY - progressStartY

            if (progressHeight > 50) {
                val progressBarWidthHalf = progressBarWidth / 2
                val viewWidthHalfMinusProgressBarWidthHalf = viewWidthHalf - progressBarWidthHalf
                val viewWidthHalfPlusProgressBarWidthHalf = viewWidthHalf + progressBarWidthHalf

                canvas.drawRoundRect(
                    viewWidthHalfMinusProgressBarWidthHalf,
                    progressStartY,
                    viewWidthHalfPlusProgressBarWidthHalf,
                    progressEndY,
                    progressBarWidthHalf,
                    progressBarWidthHalf,
                    fillBackgroundPaint
                )

                val progressValue = (progress.toFloat() / maxProgress) * progressHeight
                canvas.drawRoundRect(
                    viewWidthHalfMinusProgressBarWidthHalf,
                    progressEndY - progressValue,
                    viewWidthHalfPlusProgressBarWidthHalf,
                    progressEndY,
                    progressBarWidthHalf,
                    progressBarWidthHalf,
                    progressPaint
                )
            }
        }
    }

    override fun setProgress(value: Int, max: Int, text: String, isBrightnessMode: Boolean, isSeekMode: Boolean) {
        super.setProgress(value, max, text, isBrightnessMode, isSeekMode)
        requestLayout()
    }
}
