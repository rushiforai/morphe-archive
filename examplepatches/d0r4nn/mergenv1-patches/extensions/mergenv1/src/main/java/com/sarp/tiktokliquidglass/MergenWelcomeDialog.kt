package com.sarp.tiktokliquidglass

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.res.Configuration
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.LinearGradient
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RadialGradient
import android.graphics.Shader
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.util.TypedValue
import android.view.Choreographer
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import kotlin.math.abs
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sin

/**
 * 120Hz Choreographer-driven Hero Emblem for the MergenV1 first-time Welcome experience:
 * - Soft radial aura behind the reticle (pre-allocated Shader in onSizeChanged)
 * - Dual counter-rotating hairline orbital rings with cardinal ticks
 * - Spring-loaded expanding/settling Mergen Reticle brackets & chevron + breathing focus dot
 * - Subtle diagonal glass light sweep
 */
private class MergenWelcomeHeroView(
    context: Context,
    private val isDarkTheme: Boolean,
    private val isKyant0: Boolean
) : View(context) {

    private fun dpF(v: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

    private val reduced = MergenSpringEngine.isReducedMotion(context)
    private val bracketSpring = MergenSpringEngine.Spring1D(
        initial = if (reduced) 0f else 1f,
        dampingRatio = 0.72f,
        stiffness = MergenSpringEngine.stiffnessForResponse(0.42f)
    ).apply { target = 0f }

    private val chevronSpring = MergenSpringEngine.Spring1D(
        initial = if (reduced) 0f else 1f,
        dampingRatio = 0.68f,
        stiffness = MergenSpringEngine.stiffnessForResponse(0.46f)
    ).apply { target = 0f }

    private var ringAngleA = 0f
    private var ringAngleB = 0f
    private var pulsePhase = 0f
    private var sheenPhase = 0f
    private var lastFrameNs = 0L
    private var animRunning = false

    private val inkColor = if (isDarkTheme) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK
    private val glowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
    private val outerRingPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeWidth = dpF(0.9f).coerceAtLeast(1f)
        color = Color.argb(if (isKyant0) 86 else 72, Color.red(inkColor), Color.green(inkColor), Color.blue(inkColor))
    }
    private val innerRingPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeWidth = dpF(0.8f).coerceAtLeast(1f)
        color = Color.argb(if (isKyant0) 56 else 48, Color.red(inkColor), Color.green(inkColor), Color.blue(inkColor))
    }
    private val sheenPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
    }
    private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeCap = if (isKyant0) Paint.Cap.ROUND else Paint.Cap.SQUARE
        strokeJoin = if (isKyant0) Paint.Join.ROUND else Paint.Join.MITER
        color = inkColor
    }
    private val dotPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = inkColor
    }
    private val bracketPath = Path()
    private val chevronPath = Path()
    private var sheenShader: LinearGradient? = null

    private val frameCallback = object : Choreographer.FrameCallback {
        override fun doFrame(frameTimeNanos: Long) {
            if (!animRunning) return
            val dt = if (lastFrameNs == 0L) {
                1f / 120f
            } else {
                ((frameTimeNanos - lastFrameNs).toFloat() / 1_000_000_000f).coerceIn(0.001f, 0.032f)
            }
            lastFrameNs = frameTimeNanos

            bracketSpring.step(dt, valueEpsilon = 0.0015f, velEpsilon = 0.006f)
            chevronSpring.step(dt, valueEpsilon = 0.0015f, velEpsilon = 0.006f)

            ringAngleA = (ringAngleA + 14f * dt) % 360f
            ringAngleB = (ringAngleB - 9.5f * dt) % 360f
            pulsePhase = (pulsePhase + 2.2f * dt) % (Math.PI * 2.0).toFloat()
            sheenPhase = (sheenPhase + 0.42f * dt) % 1.4f

            invalidate()
            Choreographer.getInstance().postFrameCallback(this)
        }
    }

    override fun onSizeChanged(w: Int, h: Int, oldw: Int, oldh: Int) {
        super.onSizeChanged(w, h, oldw, oldh)
        if (w <= 0 || h <= 0) return
        val cx = w * 0.5f
        val cy = h * 0.5f
        val radius = (minOf(w, h) * 0.52f).coerceAtLeast(16f)

        glowPaint.shader = if (isKyant0) {
            RadialGradient(
                cx, cy, radius,
                intArrayOf(
                    Color.argb(66, 225, 245, 255),
                    Color.argb(26, 170, 225, 255),
                    Color.TRANSPARENT
                ),
                floatArrayOf(0f, 0.46f, 1f),
                Shader.TileMode.CLAMP
            )
        } else {
            val baseAlpha = if (isDarkTheme) 44 else 28
            RadialGradient(
                cx, cy, radius,
                intArrayOf(
                    Color.argb(baseAlpha, Color.red(inkColor), Color.green(inkColor), Color.blue(inkColor)),
                    Color.argb((baseAlpha * 0.35f).roundToInt(), Color.red(inkColor), Color.green(inkColor), Color.blue(inkColor)),
                    Color.TRANSPARENT
                ),
                floatArrayOf(0f, 0.48f, 1f),
                Shader.TileMode.CLAMP
            )
        }

        val band = dpF(38f)
        sheenShader = LinearGradient(
            -band, 0f, band, band,
            intArrayOf(
                Color.TRANSPARENT,
                Color.argb(if (isKyant0) 40 else 22, Color.red(inkColor), Color.green(inkColor), Color.blue(inkColor)),
                Color.TRANSPARENT
            ),
            floatArrayOf(0f, 0.5f, 1f),
            Shader.TileMode.CLAMP
        )
        sheenPaint.shader = sheenShader
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        if (!reduced && !animRunning) {
            animRunning = true
            lastFrameNs = 0L
            Choreographer.getInstance().postFrameCallback(frameCallback)
        }
    }

    override fun onDetachedFromWindow() {
        animRunning = false
        lastFrameNs = 0L
        try {
            Choreographer.getInstance().removeFrameCallback(frameCallback)
        } catch (_: Throwable) {
        }
        super.onDetachedFromWindow()
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val cx = w * 0.5f
        val cy = h * 0.5f
        val breath = if (reduced) 1f else 0.94f + 0.08f * sin(pulsePhase.toDouble()).toFloat()

        // 1. Atmospheric Radial Aura
        canvas.save()
        canvas.scale(breath, breath, cx, cy)
        canvas.drawCircle(cx, cy, minOf(w, h) * 0.52f, glowPaint)
        canvas.restore()

        // 2. Counter-Rotating Orbital Hairline Rings + Cardinal Ticks
        val rOuter = minOf(w, h) * 0.43f
        val rInner = minOf(w, h) * 0.31f
        val tickLen = dpF(4.5f)

        canvas.save()
        canvas.rotate(ringAngleA, cx, cy)
        canvas.drawCircle(cx, cy, rOuter, outerRingPaint)
        canvas.drawLine(cx - rOuter - tickLen * 0.5f, cy, cx - rOuter + tickLen * 0.5f, cy, outerRingPaint)
        canvas.drawLine(cx + rOuter - tickLen * 0.5f, cy, cx + rOuter + tickLen * 0.5f, cy, outerRingPaint)
        canvas.drawLine(cx, cy - rOuter - tickLen * 0.5f, cx, cy - rOuter + tickLen * 0.5f, outerRingPaint)
        canvas.drawLine(cx, cy + rOuter - tickLen * 0.5f, cx, cy + rOuter + tickLen * 0.5f, outerRingPaint)
        canvas.restore()

        canvas.save()
        canvas.rotate(ringAngleB, cx, cy)
        canvas.drawCircle(cx, cy, rInner, innerRingPaint)
        canvas.drawLine(cx - rInner, cy, cx - rInner + tickLen, cy, innerRingPaint)
        canvas.drawLine(cx + rInner - tickLen, cy, cx + rInner, cy, innerRingPaint)
        canvas.restore()

        // 3. Soft Diagonal Glint Sweep
        if (!reduced && sheenPhase <= 1.05f) {
            val sweepX = cx - rOuter + (rOuter * 2f) * (sheenPhase / 1.05f)
            canvas.save()
            val clipPath = chevronPath
            clipPath.reset()
            clipPath.addCircle(cx, cy, rOuter * 0.96f, Path.Direction.CW)
            canvas.clipPath(clipPath)
            canvas.translate(sweepX - cx, 0f)
            canvas.drawRect(cx - rOuter, cy - rOuter, cx + rOuter, cy + rOuter, sheenPaint)
            canvas.restore()
        }

        // 4. Spring-Animated Mergen Reticle
        val size = dpF(58f)
        val rx = cx - size * 0.5f
        val ry = cy - size * 0.5f
        val sWidth = (size / 14f).coerceAtLeast(2.2f)
        strokePaint.strokeWidth = sWidth
        val bExpand = bracketSpring.value * dpF(20f)
        val m = size * 0.11f - bExpand
        val c = size * 0.30f - bExpand * 0.5f

        bracketPath.reset()
        bracketPath.moveTo(rx + m, ry + c); bracketPath.lineTo(rx + m, ry + m); bracketPath.lineTo(rx + c, ry + m)
        bracketPath.moveTo(rx + size - c, ry + m); bracketPath.lineTo(rx + size - m, ry + m); bracketPath.lineTo(rx + size - m, ry + c)
        bracketPath.moveTo(rx + size - m, ry + size - c); bracketPath.lineTo(rx + size - m, ry + size - m); bracketPath.lineTo(rx + size - c, ry + size - m)
        bracketPath.moveTo(rx + c, ry + size - m); bracketPath.lineTo(rx + m, ry + size - m); bracketPath.lineTo(rx + m, ry + size - c)
        canvas.drawPath(bracketPath, strokePaint)

        val chevY = chevronSpring.value * dpF(16f)
        chevronPath.reset()
        chevronPath.moveTo(cx, ry + size * 0.22f + chevY)
        chevronPath.lineTo(rx + size * 0.72f, ry + size * 0.66f + chevY)
        chevronPath.lineTo(cx, ry + size * 0.55f + chevY)
        chevronPath.lineTo(rx + size * 0.28f, ry + size * 0.66f + chevY)
        chevronPath.close()
        canvas.drawPath(chevronPath, strokePaint)

        val dotPulse = if (reduced) 1f else 0.85f + 0.25f * sin((pulsePhase + 0.6f).toDouble()).toFloat()
        val dotRadius = (size * 0.058f * dotPulse).coerceAtLeast(1.8f)
        dotPaint.alpha = if (reduced) 255 else (185 + (70 * abs(sin(pulsePhase.toDouble())))).roundToInt().coerceIn(0, 255)
        canvas.drawCircle(cx, ry + size * 0.77f + chevY * 0.5f, dotRadius, dotPaint)
    }
}

/**
 * Premium animated Welcome screen shown on first tap of the MERGENV1 settings pill.
 * Highlights key features and makes MergenCore account sign-in optional.
 */
object MergenWelcomeDialog {

    private var activeDialog: Dialog? = null
    private val mainHandler = Handler(Looper.getMainLooper())

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun show(
        activity: Activity,
        onContinue: () -> Unit = { MergenSettingsDialog.show(activity) },
        onOptionalLogin: () -> Unit = {
            MergenCoreLoginDialog.show(activity) {
                MergenSettingsDialog.show(activity)
            }
        }
    ) {
        if (activity.isFinishing || activity.isDestroyed) return

        try {
            activeDialog?.dismiss()
        } catch (_: Throwable) {
        }

        val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        val kyant0 = MergenPrefs.isKyant0Style(activity)

        val bg = if (isDark) MergenDesign.OBSIDIAN_BG else MergenDesign.PAPER_BG
        val cardFill = when {
            kyant0 && isDark -> Color.argb(32, 255, 255, 255)
            kyant0 -> Color.argb(215, 255, 255, 255)
            isDark -> MergenDesign.OBSIDIAN_SURFACE
            else -> MergenDesign.PAPER_SURFACE
        }
        val chipFill = when {
            kyant0 && isDark -> Color.argb(46, 255, 255, 255)
            kyant0 -> Color.argb(24, 20, 22, 34)
            isDark -> MergenDesign.OBSIDIAN_ELEVATED
            else -> MergenDesign.PAPER_ELEVATED
        }
        val ink = if (isDark) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK
        val muted = if (isDark) MergenDesign.OBSIDIAN_MUTED else MergenDesign.PAPER_MUTED
        val hairline = if (isDark) MergenDesign.OBSIDIAN_HAIRLINE else MergenDesign.PAPER_HAIRLINE
        val borderStrong = if (isDark) MergenDesign.OBSIDIAN_BORDER else MergenDesign.PAPER_BORDER
        val strokePx = dp(activity, 1f).coerceAtLeast(1)

        val baseScrimAlpha = if (kyant0) 128 else 198
        var dismissing = false
        var dialogEpoch = 1
        lateinit var sheetHolder: ViewGroup
        lateinit var rootFrame: FrameLayout
        lateinit var dialog: Dialog

        val dismissAnimated: ((() -> Unit)?) -> Unit = { onDone ->
            if (!dismissing) {
                dismissing = true
                dialogEpoch++
                MergenPrefs.setWelcomeSeen(activity, true)
                if (MergenSpringEngine.isReducedMotion(activity)) {
                    MergenSpringEngine.springPop(
                        view = sheetHolder,
                        fromScaleX = sheetHolder.scaleX,
                        fromScaleY = sheetHolder.scaleY,
                        toScaleX = 1f,
                        toScaleY = 1f,
                        fromAlpha = sheetHolder.alpha,
                        toAlpha = 0f,
                        maxBlurDp = 0f,
                        onEnd = {
                            try {
                                dialog.dismiss()
                            } catch (_: Throwable) {
                            }
                            onDone?.invoke()
                        }
                    )
                } else {
                    MergenSpringEngine.springPop(
                        view = sheetHolder,
                        fromScaleX = sheetHolder.scaleX,
                        fromScaleY = sheetHolder.scaleY,
                        toScaleX = 0.94f,
                        toScaleY = 0.94f,
                        fromAlpha = sheetHolder.alpha,
                        toAlpha = 0f,
                        dampingRatioX = 0.96f,
                        responseX = 0.19f,
                        dampingRatioY = 0.96f,
                        responseY = 0.19f,
                        maxBlurDp = 7f
                    )
                    val exitY = dpF(activity, 30f).coerceAtLeast(1f)
                    MergenSpringEngine.springTranslationY(
                        view = sheetHolder,
                        targetY = exitY,
                        dampingRatio = 0.96f,
                        responseSec = 0.19f,
                        maxBlurDp = 9f,
                        onUpdate = { curY ->
                            val frac = (1f - (curY.coerceAtLeast(0f) / exitY)).coerceIn(0f, 1f)
                            rootFrame.setBackgroundColor(Color.argb((baseScrimAlpha * frac).roundToInt(), 0, 0, 0))
                        },
                        onEnd = {
                            try {
                                dialog.dismiss()
                            } catch (_: Throwable) {
                            }
                            onDone?.invoke()
                        }
                    )
                }
            }
        }

        dialog = object : Dialog(activity, android.R.style.Theme_Translucent_NoTitleBar) {
            override fun cancel() {
                dismissAnimated(null)
            }
        }
        dialog.requestWindowFeature(Window.FEATURE_NO_TITLE)
        dialog.setCanceledOnTouchOutside(true)
        dialog.window?.apply {
            setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
            setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        }

        val screenW = activity.resources.displayMetrics.widthPixels
        val cardW = min(screenW - dp(activity, 26f), dp(activity, 412f))

        rootFrame = FrameLayout(activity).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
            setBackgroundColor(Color.argb(0, 0, 0, 0))
            val padH = dp(activity, 13f)
            val padV = dp(activity, 24f)
            setPadding(padH, padV, padH, padV)
            setOnClickListener { dismissAnimated(null) }
        }

        val activityBackdrop = activity.findViewById<ViewGroup>(android.R.id.content)?.let { c ->
            if (c.childCount > 0) c.getChildAt(0) else c
        }

        sheetHolder = if (kyant0) {
            KyantGlassSurfaceView(
                context = activity,
                backdropSource = activityBackdrop,
                cornerRadiusDp = 28f,
                blurRadiusDp = 14f,
                refractionHeightDp = 26f,
                refractionAmountDp = 26f
            )
        } else {
            FrameLayout(activity).apply {
                background = MergenDesign.sharpBox(bg, borderStrong, strokePx)
            }
        }
        sheetHolder.apply {
            elevation = dpF(activity, 18f)
            isClickable = true
            isFocusable = true
        }

        fun makeAdaptiveBox(fillColor: Int, strokeColor: Int, sPx: Int, radiusDp: Float) =
            if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, radiusDp)
                    setColor(fillColor)
                    if (sPx > 0 && strokeColor != Color.TRANSPARENT) {
                        setStroke(sPx, strokeColor)
                    }
                }
            } else {
                MergenDesign.sharpBox(fillColor, strokeColor, sPx)
            }

        val maxScrollH = (activity.resources.displayMetrics.heightPixels * 0.84f).roundToInt()
        val scroll = object : ScrollView(activity) {
            override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
                val specSize = MeasureSpec.getSize(heightMeasureSpec)
                val targetMax = if (MeasureSpec.getMode(heightMeasureSpec) == MeasureSpec.UNSPECIFIED) {
                    maxScrollH
                } else {
                    min(specSize, maxScrollH)
                }
                super.onMeasure(
                    widthMeasureSpec,
                    MeasureSpec.makeMeasureSpec(targetMax, MeasureSpec.AT_MOST)
                )
            }
        }.apply {
            overScrollMode = View.OVER_SCROLL_IF_CONTENT_SCROLLS
            isVerticalScrollBarEnabled = false
        }

        val col = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            val pad = dp(activity, 20f)
            setPadding(pad, dp(activity, 16f), pad, dp(activity, 20f))
        }

        // 1. Top Eyebrow & Dismiss Row
        val topRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }
        topRow.addView(TextView(activity).apply {
            text = if (kyant0) "MERGENV1 // LIQUID GLASS" else "MERGENV1 // SWISS-KINETIC"
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            setTextColor(ink)
            letterSpacing = 0.08f
            background = makeAdaptiveBox(chipFill, hairline, strokePx, 10f)
            setPadding(dp(activity, 9f), dp(activity, 4f), dp(activity, 9f), dp(activity, 4f))
        })
        topRow.addView(View(activity), LinearLayout.LayoutParams(0, 1, 1f))
        val closeBtn = TextView(activity).apply {
            text = if (kyant0) "×" else "[×]"
            gravity = Gravity.CENTER
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, if (kyant0) 17f else 13.5f)
            setTextColor(ink)
            background = makeAdaptiveBox(cardFill, hairline, strokePx, 14f)
            setPadding(dp(activity, 9f), dp(activity, 3f), dp(activity, 9f), dp(activity, 3f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.90f)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissAnimated(null)
            }
        }
        topRow.addView(closeBtn)
        col.addView(topRow)

        // 2. Animated 120Hz Hero Emblem
        val heroView = MergenWelcomeHeroView(activity, isDark, kyant0)
        col.addView(
            heroView,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 148f)).apply {
                topMargin = dp(activity, 6f)
                bottomMargin = dp(activity, 4f)
            }
        )

        // 3. Headline & Subheadline
        val headlineTv = TextView(activity).apply {
            text = MergenStrings.t(activity, "TikTok'a Yeni Bir Boyut", "A New Dimension for TikTok")
            gravity = Gravity.CENTER
            typeface = Typeface.create("sans-serif-medium", Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 22f)
            setTextColor(ink)
        }
        col.addView(
            headlineTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val subheadTv = TextView(activity).apply {
            text = MergenStrings.t(
                activity,
                "120Hz akışkan cam arayüz, fiziksel yay motoru ve jest kontrolleri — hesap zorunluluğu olmadan hemen hazır.",
                "120Hz liquid glass UI, spring physics & fluid gestures — ready instantly with no sign-in required."
            )
            gravity = Gravity.CENTER
            typeface = Typeface.SANS_SERIF
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f)
            setTextColor(muted)
            setLineSpacing(dpF(activity, 2f), 1f)
        }
        col.addView(
            subheadTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 6f)
                bottomMargin = dp(activity, 16f)
            }
        )

        // 4. Three Staggered Feature Cards
        fun makeFeatureCard(num: String, title: String, desc: String): LinearLayout {
            val row = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                background = makeAdaptiveBox(cardFill, hairline, strokePx, 16f)
                setPadding(dp(activity, 12f), dp(activity, 11f), dp(activity, 12f), dp(activity, 11f))
                isClickable = true
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.97f)
                setOnClickListener { MergenHaptics.playTick(activity) }
            }

            val badge = TextView(activity).apply {
                text = num
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
                setTextColor(bg)
                background = makeAdaptiveBox(ink, Color.TRANSPARENT, 0, 10f)
                setPadding(dp(activity, 8f), dp(activity, 6f), dp(activity, 8f), dp(activity, 6f))
            }
            row.addView(
                badge,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    rightMargin = dp(activity, 11f)
                }
            )

            val textCol = LinearLayout(activity).apply { orientation = LinearLayout.VERTICAL }
            textCol.addView(TextView(activity).apply {
                text = title
                typeface = Typeface.create("sans-serif-medium", Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 13.5f)
                setTextColor(ink)
            })
            textCol.addView(
                TextView(activity).apply {
                    text = desc
                    typeface = Typeface.SANS_SERIF
                    setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
                    setTextColor(muted)
                },
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    topMargin = dp(activity, 2f)
                }
            )
            row.addView(textCol, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
            return row
        }

        val card1 = makeFeatureCard(
            "01",
            MergenStrings.t(activity, "Liquid Glass & 120Hz Motor", "Liquid Glass & 120Hz Engine"),
            MergenStrings.t(
                activity,
                "Gerçek zamanlı kırılmalı alt bar, hareket bulanıklığı ve 3 animasyon profili.",
                "Real-time refracting bar, velocity motion blur & 3 animation profiles."
            )
        )
        val card2 = makeFeatureCard(
            "02",
            MergenStrings.t(activity, "Jestler & Radyal Menü", "Gestures & Radial Menu"),
            MergenStrings.t(
                activity,
                "Basılı tutarak radyal eylemler, profil çekmecesi ve yukarı kaydır hızlı kontrol.",
                "Hold-to-open radial actions, profile peek drawer & swipe-up quick controls."
            )
        )
        val card3 = makeFeatureCard(
            "03",
            MergenStrings.t(activity, "Akan Yorumlar & Dinamik Uyarı", "Danmaku & Dynamic Alerts"),
            MergenStrings.t(
                activity,
                "1:1 parmak takipli Danmaku ve kamera deliğinden açılan canlı bildirimler.",
                "1:1 finger-scrubbed floating comments & camera-notch live alerts."
            )
        )

        val cardLp = LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
            bottomMargin = dp(activity, 9f)
        }
        col.addView(card1, LinearLayout.LayoutParams(cardLp))
        col.addView(card2, LinearLayout.LayoutParams(cardLp))
        col.addView(card3, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
            bottomMargin = dp(activity, 16f)
        })

        // 5. Action Buttons
        val primaryCta = TextView(activity).apply {
            text = MergenStrings.t(activity, "BAŞLA & AYARLARI AÇ →", "GET STARTED →")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f)
            letterSpacing = 0.05f
            setTextColor(bg)
            background = makeAdaptiveBox(ink, Color.TRANSPARENT, 0, 15f)
            minHeight = dp(activity, 46f)
            setPadding(dp(activity, 14f), dp(activity, 13f), dp(activity, 14f), dp(activity, 13f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.95f)
            setOnClickListener {
                MergenHaptics.playSuccess(activity)
                dismissAnimated {
                    onContinue()
                }
            }
        }
        col.addView(
            primaryCta,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val existingSession = MergenCoreAuth.getCachedSession(activity)
        val secondaryView: TextView = if (existingSession == null) {
            TextView(activity).apply {
                text = MergenStrings.t(
                    activity,
                    "İsteğe Bağlı · MergenCore ile Giriş Yap",
                    "Optional · Sign in with MergenCore"
                )
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(ink)
                background = makeAdaptiveBox(chipFill, hairline, strokePx, 13f)
                minHeight = dp(activity, 40f)
                setPadding(dp(activity, 12f), dp(activity, 10f), dp(activity, 12f), dp(activity, 10f))
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.95f)
                setOnClickListener {
                    MergenHaptics.playTap(activity)
                    dismissAnimated {
                        onOptionalLogin()
                    }
                }
            }
        } else {
            val handleLabel = if (existingSession.username.isNotBlank()) "@${existingSession.username}" else existingSession.email
            TextView(activity).apply {
                text = "MERGENCORE · $handleLabel ✓"
                gravity = Gravity.CENTER
                typeface = Typeface.MONOSPACE
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(muted)
                setPadding(dp(activity, 8f), dp(activity, 10f), dp(activity, 8f), dp(activity, 4f))
            }
        }
        col.addView(
            secondaryView,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 9f)
            }
        )

        scroll.addView(col)
        sheetHolder.addView(
            scroll,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val enterY = dpF(activity, 36f).coerceAtLeast(1f)
        val reduced = MergenSpringEngine.isReducedMotion(activity)
        sheetHolder.translationY = if (reduced) 0f else enterY
        sheetHolder.scaleX = if (reduced) 1f else 0.93f
        sheetHolder.scaleY = if (reduced) 1f else 0.93f
        sheetHolder.alpha = 0f

        val staggerItems = arrayOf<View>(headlineTv, subheadTv, card1, card2, card3, primaryCta, secondaryView)
        if (!reduced) {
            val shiftPx = dpF(activity, 18f)
            for (item in staggerItems) {
                item.translationY = shiftPx
                item.alpha = 0f
            }
        }

        rootFrame.addView(
            sheetHolder,
            FrameLayout.LayoutParams(cardW, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER)
        )

        dialog.setContentView(rootFrame)
        dialog.setOnDismissListener {
            dialogEpoch++
            if (activeDialog === dialog) activeDialog = null
        }
        activeDialog = dialog
        dialog.show()

        if (reduced) {
            rootFrame.setBackgroundColor(Color.argb(baseScrimAlpha, 0, 0, 0))
            MergenSpringEngine.springPop(
                view = sheetHolder,
                fromScaleX = 1f,
                fromScaleY = 1f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                maxBlurDp = 0f
            )
        } else {
            MergenSpringEngine.springPop(
                view = sheetHolder,
                fromScaleX = 0.93f,
                fromScaleY = 0.93f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                dampingRatioX = 0.85f,
                responseX = 0.30f,
                dampingRatioY = 0.85f,
                responseY = 0.30f,
                maxBlurDp = 7f
            )
            MergenSpringEngine.springTranslationY(
                view = sheetHolder,
                targetY = 0f,
                dampingRatio = 0.87f,
                responseSec = 0.32f,
                maxBlurDp = 9f,
                onUpdate = { curY ->
                    val frac = (1f - (curY.coerceAtLeast(0f) / enterY)).coerceIn(0f, 1f)
                    rootFrame.setBackgroundColor(Color.argb((baseScrimAlpha * frac).roundToInt(), 0, 0, 0))
                }
            )
            val capturedEpoch = dialogEpoch
            for (idx in staggerItems.indices) {
                val item = staggerItems[idx]
                mainHandler.postDelayed({
                    if (!dismissing && dialogEpoch == capturedEpoch && activeDialog === dialog) {
                        MergenSpringEngine.springPop(
                            view = item,
                            fromScaleX = 0.97f,
                            fromScaleY = 0.97f,
                            toScaleX = 1f,
                            toScaleY = 1f,
                            fromAlpha = 0f,
                            toAlpha = 1f,
                            dampingRatioX = 0.88f,
                            responseX = 0.25f,
                            dampingRatioY = 0.88f,
                            responseY = 0.25f,
                            maxBlurDp = 0f
                        )
                        MergenSpringEngine.springTranslationY(
                            view = item,
                            targetY = 0f,
                            dampingRatio = 0.88f,
                            responseSec = 0.26f,
                            maxBlurDp = 0f
                        )
                    }
                }, 70L + idx * 48L)
            }
        }
    }
}
