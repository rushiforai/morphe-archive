package com.sarp.tiktokliquidglass

import android.app.Activity
import android.app.Dialog
import android.content.Context
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.GradientDrawable
import android.net.Uri
import android.util.TypedValue
import android.view.Choreographer
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import android.widget.Toast
import kotlin.math.abs
import kotlin.math.ceil
import kotlin.math.floor
import kotlin.math.min
import kotlin.math.roundToInt

/**
 * Dual-theme spring-driven toggle switch (sharp 0dp Swiss-Kinetic in Mergen, rounded pill in Kyant0).
 */
class MergenToggleView(
    context: Context,
    initialChecked: Boolean,
    private val isDarkTheme: Boolean,
    private val isKyant0: Boolean = false
) : View(context) {

    var isChecked: Boolean = initialChecked
        private set

    private val progressSpring = MergenSpringEngine.Spring1D(
        initial = if (initialChecked) 1f else 0f,
        dampingRatio = 0.80f,
        stiffness = MergenSpringEngine.stiffnessForResponse(0.22f)
    )
    private val thumbSqueezeSpring = MergenSpringEngine.Spring1D(
        initial = 1f,
        dampingRatio = 0.72f,
        stiffness = MergenSpringEngine.stiffnessForResponse(0.18f)
    )
    private var progress: Float = if (initialChecked) 1f else 0f
    private var animRunning = false
    private var lastFrameNs = 0L

    private val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
    private val borderPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.STROKE }
    private val thumbPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }

    var onCheckedChanged: ((Boolean) -> Unit)? = null

    private fun dpF(v: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

    private val frameCallback = object : Choreographer.FrameCallback {
        override fun doFrame(frameTimeNanos: Long) {
            if (!animRunning) return
            val dt = if (lastFrameNs == 0L) {
                1f / 120f
            } else {
                ((frameTimeNanos - lastFrameNs).toFloat() / 1_000_000_000f).coerceIn(0.001f, 0.032f)
            }
            lastFrameNs = frameTimeNanos

            val pMoving = progressSpring.step(dt, valueEpsilon = 0.002f, velEpsilon = 0.008f)
            val sMoving = thumbSqueezeSpring.step(dt, valueEpsilon = 0.002f, velEpsilon = 0.008f)
            progress = progressSpring.value.coerceIn(-0.08f, 1.08f)
            invalidate()

            if (pMoving || sMoving) {
                Choreographer.getInstance().postFrameCallback(this)
            } else {
                progress = progressSpring.value.coerceIn(0f, 1f)
                animRunning = false
                lastFrameNs = 0L
                invalidate()
            }
        }
    }

    init {
        if (isKyant0) {
            setLayerType(LAYER_TYPE_SOFTWARE, null)
            thumbPaint.setShadowLayer(dpF(2f), 0f, dpF(1f), Color.argb(65, 0, 0, 0))
        }
        val w = dpF(46f).roundToInt()
        val h = dpF(if (isKyant0) 26f else 24f).roundToInt()
        layoutParams = LinearLayout.LayoutParams(w, h)
        isClickable = true
        isFocusable = true
        setOnTouchListener { _, ev ->
            when (ev.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    if (!MergenSpringEngine.isReducedMotion(context)) {
                        applyProfileTuning()
                        thumbSqueezeSpring.retarget(0.92f)
                        ensureAnimating()
                    }
                }
                MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                    if (!MergenSpringEngine.isReducedMotion(context)) {
                        applyProfileTuning()
                        thumbSqueezeSpring.retarget(1f)
                        ensureAnimating()
                    }
                }
            }
            false
        }
        setOnClickListener {
            setChecked(!isChecked, animate = true)
            onCheckedChanged?.invoke(isChecked)
        }
    }

    private fun applyProfileTuning() {
        val profile = MergenPrefs.getAnimationProfile(context)
        if (profile == 1) {
            progressSpring.dampingRatio = 0.90f
            progressSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.16f)
            thumbSqueezeSpring.dampingRatio = 0.85f
            thumbSqueezeSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.13f)
        } else {
            progressSpring.dampingRatio = 0.80f
            progressSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.22f)
            thumbSqueezeSpring.dampingRatio = 0.72f
            thumbSqueezeSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.18f)
        }
    }

    private fun ensureAnimating() {
        if (!animRunning) {
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

    fun setChecked(checked: Boolean, animate: Boolean = true) {
        if (isChecked == checked) return
        isChecked = checked
        val target = if (checked) 1f else 0f
        if (!animate || MergenSpringEngine.isReducedMotion(context)) {
            animRunning = false
            progressSpring.snapTo(target)
            thumbSqueezeSpring.snapTo(1f)
            progress = target
            invalidate()
            return
        }
        applyProfileTuning()
        progressSpring.retarget(target)
        ensureAnimating()
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val strokeW = dpF(if (isKyant0) 0.8f else 1f).coerceAtLeast(1f)
        val hs = strokeW * 0.5f
        val colorT = progress.coerceIn(0f, 1f)
        val squeeze = thumbSqueezeSpring.value.coerceIn(0.84f, 1.12f)

        if (isKyant0) {
            val r = h * 0.5f
            val offTrack = if (isDarkTheme) Color.argb(58, 255, 255, 255) else Color.argb(45, 20, 22, 34)
            val onTrack = Color.parseColor("#34C759")
            trackPaint.color = lerpColor(offTrack, onTrack, colorT)
            canvas.drawRoundRect(0f, 0f, w, h, r, r, trackPaint)

            borderPaint.strokeWidth = strokeW
            borderPaint.color = if (isDarkTheme) Color.argb(48, 255, 255, 255) else Color.argb(28, 0, 0, 0)
            canvas.drawRoundRect(hs, hs, w - hs, h - hs, r, r, borderPaint)

            val pad = dpF(3f)
            val thumbR = (h - pad * 2f) * 0.5f * squeeze
            val cx = (pad + thumbR) + ((w - pad - thumbR) - (pad + thumbR)) * progress
            thumbPaint.color = Color.WHITE
            canvas.drawCircle(cx, h * 0.5f, thumbR, thumbPaint)
        } else {
            val offTrack = if (isDarkTheme) MergenDesign.OBSIDIAN_SURFACE else MergenDesign.PAPER_SURFACE
            val onTrack = if (isDarkTheme) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK
            val offBorder = if (isDarkTheme) Color.argb(95, 255, 255, 255) else Color.argb(95, 0, 0, 0)

            trackPaint.color = lerpColor(offTrack, onTrack, colorT)
            canvas.drawRect(0f, 0f, w, h, trackPaint)

            borderPaint.strokeWidth = strokeW
            borderPaint.color = lerpColor(offBorder, onTrack, colorT)
            canvas.drawRect(hs, hs, w - hs, h - hs, borderPaint)

            val pad = dpF(3.5f)
            val baseSize = (h - pad * 2f).coerceAtLeast(8f)
            val thumbSize = (baseSize * squeeze).coerceAtLeast(6f)
            val top = (h - thumbSize) * 0.5f
            val minLeft = pad
            val maxLeft = (w - pad - thumbSize).coerceAtLeast(pad)
            val left = minLeft + (maxLeft - minLeft) * progress

            val offThumb = if (isDarkTheme) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK
            val onThumb = if (isDarkTheme) MergenDesign.OBSIDIAN_BG else MergenDesign.PAPER_BG
            thumbPaint.color = lerpColor(offThumb, onThumb, colorT)
            canvas.drawRect(left, top, left + thumbSize, top + thumbSize, thumbPaint)
        }
    }

    private fun lerpColor(a: Int, b: Int, t: Float): Int {
        val ta = Color.alpha(a) + ((Color.alpha(b) - Color.alpha(a)) * t).roundToInt()
        val tr = Color.red(a) + ((Color.red(b) - Color.red(a)) * t).roundToInt()
        val tg = Color.green(a) + ((Color.green(b) - Color.green(a)) * t).roundToInt()
        val tb = Color.blue(a) + ((Color.blue(b) - Color.blue(a)) * t).roundToInt()
        return Color.argb(ta, tr, tg, tb)
    }
}

/**
 * Spring-animated sliding active indicator segmented pill control.
 */
private class MergenSegmentedControlView(
    context: Context,
    private val kyant0: Boolean,
    options: List<String>,
    selectedIdx: Int,
    private val textPrimary: Int,
    chipFill: Int,
    strokeColor: Int,
    private val strokePx: Int,
    private val activeTextColor: Int,
    private val activePillColor: Int,
    onSelected: (Int) -> Unit
) : FrameLayout(context) {

    private var current = selectedIdx.coerceIn(0, (options.size - 1).coerceAtLeast(0))
    private val buttons = ArrayList<TextView>(options.size)
    private val row = LinearLayout(context).apply {
        orientation = LinearLayout.HORIZONTAL
    }
    private val indicatorSpring = MergenSpringEngine.Spring1D(
        initial = current.toFloat(),
        dampingRatio = 0.84f,
        stiffness = MergenSpringEngine.stiffnessForResponse(0.24f)
    )
    private val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = chipFill
    }
    private val trackBorderPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeWidth = strokePx.toFloat().coerceAtLeast(1f)
        color = strokeColor
    }
    private val indicatorPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = activePillColor
    }
    private var animRunning = false
    private var lastFrameNs = 0L

    private fun dp(v: Float): Int = MergenDesign.dp(context, v)
    private fun dpF(v: Float): Float = MergenDesign.dpF(context, v)

    private val frameCallback = object : Choreographer.FrameCallback {
        override fun doFrame(frameTimeNanos: Long) {
            if (!animRunning) return
            val dt = if (lastFrameNs == 0L) {
                1f / 120f
            } else {
                ((frameTimeNanos - lastFrameNs).toFloat() / 1_000_000_000f).coerceIn(0.001f, 0.032f)
            }
            lastFrameNs = frameTimeNanos
            val moving = indicatorSpring.step(dt, valueEpsilon = 0.004f, velEpsilon = 0.015f)
            syncButtonColors()
            invalidate()
            if (moving) {
                Choreographer.getInstance().postFrameCallback(this)
            } else {
                animRunning = false
                lastFrameNs = 0L
                syncButtonColors()
                invalidate()
            }
        }
    }

    init {
        setWillNotDraw(false)
        setPadding(dp(2f), dp(2f), dp(2f), dp(2f))

        for (i in options.indices) {
            val btn = TextView(context).apply {
                text = options[i]
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, if (options.size >= 4) 9.5f else 10.5f)
                maxLines = 1
                isSingleLine = true
                setPadding(dp(4f), dp(8f), dp(4f), dp(8f))
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.95f)
                setOnClickListener {
                    selectIndex(i)
                    onSelected(i)
                }
            }
            buttons.add(btn)
            row.addView(
                btn,
                LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
            )
        }
        addView(row, LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT))
        syncButtonColors()
    }

    private fun selectIndex(index: Int) {
        current = index
        if (MergenSpringEngine.isReducedMotion(context)) {
            animRunning = false
            indicatorSpring.snapTo(index.toFloat())
            syncButtonColors()
            invalidate()
            return
        }
        val profile = MergenPrefs.getAnimationProfile(context)
        if (profile == 1) {
            indicatorSpring.dampingRatio = 0.90f
            indicatorSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.17f)
        } else {
            indicatorSpring.dampingRatio = 0.84f
            indicatorSpring.stiffness = MergenSpringEngine.stiffnessForResponse(0.24f)
        }
        indicatorSpring.retarget(index.toFloat())
        if (!animRunning) {
            animRunning = true
            lastFrameNs = 0L
            Choreographer.getInstance().postFrameCallback(frameCallback)
        }
    }

    private fun syncButtonColors() {
        val pos = indicatorSpring.value
        for (i in buttons.indices) {
            val dist = abs(pos - i.toFloat()).coerceIn(0f, 1f)
            val activeFrac = 1f - dist
            buttons[i].setTextColor(lerpColor(textPrimary, activeTextColor, activeFrac))
        }
    }

    override fun dispatchDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w > 0f && h > 0f) {
            val outerR = if (kyant0) dpF(10f) else 0f
            val hs = trackBorderPaint.strokeWidth * 0.5f
            if (outerR > 0f) {
                canvas.drawRoundRect(0f, 0f, w, h, outerR, outerR, trackPaint)
                canvas.drawRoundRect(hs, hs, w - hs, h - hs, outerR, outerR, trackBorderPaint)
            } else {
                canvas.drawRect(0f, 0f, w, h, trackPaint)
                canvas.drawRect(hs, hs, w - hs, h - hs, trackBorderPaint)
            }

            if (buttons.isNotEmpty()) {
                val maxIdx = buttons.size - 1
                val pos = indicatorSpring.value.coerceIn(0f, maxIdx.toFloat())
                val lo = floor(pos.toDouble()).toInt().coerceIn(0, maxIdx)
                val hi = ceil(pos.toDouble()).toInt().coerceIn(0, maxIdx)
                val frac = pos - lo.toFloat()

                val bLo = buttons[lo]
                val bHi = buttons[hi]
                val pad = dpF(2f)
                val pillLeft = (bLo.left + (bHi.left - bLo.left) * frac) + pad
                val pillRight = (bLo.right + (bHi.right - bLo.right) * frac) + pad
                val pillTop = pad
                val pillBottom = (h - pad).coerceAtLeast(pillTop + 1f)
                val innerR = if (kyant0) dpF(8f) else 0f
                if (innerR > 0f) {
                    canvas.drawRoundRect(pillLeft, pillTop, pillRight, pillBottom, innerR, innerR, indicatorPaint)
                } else {
                    canvas.drawRect(pillLeft, pillTop, pillRight, pillBottom, indicatorPaint)
                }
            }
        }
        super.dispatchDraw(canvas)
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

    private fun lerpColor(a: Int, b: Int, t: Float): Int {
        val ta = Color.alpha(a) + ((Color.alpha(b) - Color.alpha(a)) * t).roundToInt()
        val tr = Color.red(a) + ((Color.red(b) - Color.red(a)) * t).roundToInt()
        val tg = Color.green(a) + ((Color.green(b) - Color.green(a)) * t).roundToInt()
        val tb = Color.blue(a) + ((Color.blue(b) - Color.blue(a)) * t).roundToInt()
        return Color.argb(ta, tr, tg, tb)
    }
}

/**
 * Dual-Theme Settings Panel for MergenV1 (unlocked only after MergenCore auth):
 * - Supports BOTH Mergen (0dp Swiss-Kinetic B&W) and Kyant0 Liquid Glass outer surfaces.
 * - Inner MergenCore account strip ALWAYS remains strictly 0dp B&W Swiss-Kinetic.
 */
object MergenSettingsDialog {

    private var activeDialog: Dialog? = null

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun show(activity: Activity) {
        if (activity.isFinishing || activity.isDestroyed) return

        val session = MergenCoreAuth.getCachedSession(activity)

        try {
            activeDialog?.dismiss()
        } catch (_: Throwable) {
        }

        val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        val kyant0 = MergenPrefs.isKyant0Style(activity)

        val bg = if (isDark) MergenDesign.OBSIDIAN_BG else MergenDesign.PAPER_BG
        val surface = when {
            kyant0 && isDark -> Color.argb(30, 255, 255, 255)
            kyant0 -> Color.argb(215, 255, 255, 255)
            isDark -> MergenDesign.OBSIDIAN_SURFACE
            else -> MergenDesign.PAPER_SURFACE
        }
        val elevated = when {
            kyant0 && isDark -> Color.argb(44, 255, 255, 255)
            kyant0 -> Color.argb(24, 20, 22, 34)
            isDark -> MergenDesign.OBSIDIAN_ELEVATED
            else -> MergenDesign.PAPER_ELEVATED
        }
        val ink = if (isDark) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK
        val muted = if (isDark) MergenDesign.OBSIDIAN_MUTED else MergenDesign.PAPER_MUTED
        val hairline = if (isDark) MergenDesign.OBSIDIAN_HAIRLINE else MergenDesign.PAPER_HAIRLINE
        val borderStrong = if (isDark) MergenDesign.OBSIDIAN_BORDER else MergenDesign.PAPER_BORDER
        val strokePx = dp(activity, 1f).coerceAtLeast(1)

        val baseScrimAlpha = if (kyant0) 115 else 188
        var dismissing = false
        lateinit var sheetHolder: ViewGroup
        lateinit var rootFrame: FrameLayout
        lateinit var dialog: Dialog

        val dismissAnimated: ((() -> Unit)?) -> Unit = { onDone ->
            if (!dismissing) {
                dismissing = true
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
                    val exitY = dpF(activity, 28f).coerceAtLeast(1f)
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
        val cardW = min(screenW - dp(activity, 24f), dp(activity, 420f))

        rootFrame = FrameLayout(activity).apply {
            layoutParams = ViewGroup.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
            setBackgroundColor(Color.argb(0, 0, 0, 0))
            val padH = dp(activity, 12f)
            val padV = dp(activity, 28f)
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
                cornerRadiusDp = 26f,
                blurRadiusDp = 12f,
                refractionHeightDp = 24f,
                refractionAmountDp = 24f
            )
        } else {
            FrameLayout(activity).apply {
                background = MergenDesign.sharpBox(bg, borderStrong, strokePx)
            }
        }
        sheetHolder.apply {
            elevation = dpF(activity, 16f)
            isClickable = true
            isFocusable = true
        }

        val sheetCol = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
        }

        // Fixed Top Header Bar
        val header = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(activity, 18f), dp(activity, 16f), dp(activity, 14f), dp(activity, 14f))
        }

        val rSize = dp(activity, 20f)
        header.addView(
            MergenReticleView(activity, ink),
            LinearLayout.LayoutParams(rSize, rSize).apply {
                rightMargin = dp(activity, 10f)
            }
        )

        val titleWrap = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }

        titleWrap.addView(TextView(activity).apply {
            text = if (kyant0) "MergenV1" else MergenStrings.t(activity, "MERGENV1 // AYARLAR", "MERGENV1 // SETTINGS")
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, if (kyant0) 19f else 13.5f)
            setTextColor(ink)
            if (!kyant0) letterSpacing = 0.05f
        })

        titleWrap.addView(
            TextView(activity).apply {
                text = MergenStrings.t(activity, "FAZ 2", "PHASE 2")
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
                setTextColor(bg)
                background = makeAdaptiveBox(activity, kyant0, ink, strokeColor = Color.TRANSPARENT, strokePx = 0, radiusDp = 9f)
                setPadding(dp(activity, 6f), dp(activity, 2f), dp(activity, 6f), dp(activity, 2f))
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                leftMargin = dp(activity, 8f)
            }
        )

        header.addView(titleWrap, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))

        val closeBtn = TextView(activity).apply {
            text = if (kyant0) "×" else "[×]"
            gravity = Gravity.CENTER
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, if (kyant0) 18f else 14f)
            setTextColor(ink)
            background = makeAdaptiveBox(activity, kyant0, surface, hairline, strokePx, 15f)
            setPadding(dp(activity, 9f), dp(activity, 4f), dp(activity, 9f), dp(activity, 4f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.90f)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissAnimated(null)
            }
        }
        header.addView(closeBtn)
        sheetCol.addView(header)

        sheetCol.addView(
            View(activity).apply { setBackgroundColor(hairline) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, strokePx)
        )

        val maxScrollH = (activity.resources.displayMetrics.heightPixels * 0.72f).roundToInt()
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

        val body = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            val pad = dp(activity, 16f)
            setPadding(pad, dp(activity, 14f), pad, dp(activity, 18f))
        }

        // 1. Strictly Black & White Swiss-Kinetic MergenCore Account Strip (NEVER Liquid Glass!)
        val accountStrip = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            background = MergenDesign.sharpBox(Color.BLACK, Color.WHITE, strokePx)
            setPadding(dp(activity, 14f), dp(activity, 12f), dp(activity, 12f), dp(activity, 12f))
        }
        accountStrip.addView(
            MergenReticleView(activity, Color.WHITE),
            LinearLayout.LayoutParams(rSize, rSize).apply { rightMargin = dp(activity, 12f) }
        )

        val acctInfo = LinearLayout(activity).apply { orientation = LinearLayout.VERTICAL }
        if (session != null) {
            val displayHandle = if (session.username.isNotBlank()) "@${session.username}" else session.email
            val displayLine = if (session.displayName.isNotBlank() && session.username.isNotBlank()) {
                "${session.displayName}  •  @${session.username}"
            } else {
                displayHandle
            }
            acctInfo.addView(TextView(activity).apply {
                text = displayLine
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f)
                setTextColor(Color.WHITE)
                maxLines = 1
            })
            acctInfo.addView(TextView(activity).apply {
                text = MergenStrings.t(
                    activity,
                    "OTURUM AKTİF · MAX ${MergenCoreAuth.MAX_DEVICES} CİHAZ",
                    "SESSION ACTIVE · MAX ${MergenCoreAuth.MAX_DEVICES} DEVICES"
                )
                typeface = Typeface.MONOSPACE
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
                setTextColor(Color.argb(170, 255, 255, 255))
            })
            accountStrip.addView(acctInfo, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))

            val logoutBtn = TextView(activity).apply {
                text = MergenStrings.t(activity, "ÇIKIŞ", "LOG OUT")
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(Color.WHITE)
                background = MergenDesign.sharpBox(MergenDesign.OBSIDIAN_SURFACE, Color.WHITE, strokePx)
                setPadding(dp(activity, 10f), dp(activity, 7f), dp(activity, 10f), dp(activity, 7f))
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.94f)
                setOnClickListener {
                    MergenHaptics.playToggle(activity, enabled = false, bypassGate = true)
                    MergenCoreAuth.logout(activity)
                    dismissAnimated {
                        Toast.makeText(
                            activity,
                            MergenStrings.t(activity, "MergenCore oturumu kapatıldı", "Signed out of MergenCore"),
                            Toast.LENGTH_SHORT
                        ).show()
                    }
                }
            }
            accountStrip.addView(
                logoutBtn,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    leftMargin = dp(activity, 10f)
                }
            )
        } else {
            acctInfo.addView(TextView(activity).apply {
                text = "MERGENCORE"
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f)
                setTextColor(Color.WHITE)
                letterSpacing = 0.06f
                maxLines = 1
            })
            acctInfo.addView(TextView(activity).apply {
                text = MergenStrings.t(
                    activity,
                    "İsteğe bağlı · MergenV2 bulut senkron",
                    "Optional · MergenV2 cloud sync"
                )
                typeface = Typeface.MONOSPACE
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
                setTextColor(Color.argb(170, 255, 255, 255))
            })
            accountStrip.addView(acctInfo, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))

            val loginBtn = TextView(activity).apply {
                text = MergenStrings.t(activity, "GİRİŞ YAP", "SIGN IN")
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(Color.BLACK)
                background = MergenDesign.sharpBox(Color.WHITE, Color.WHITE, strokePx)
                setPadding(dp(activity, 11f), dp(activity, 7f), dp(activity, 11f), dp(activity, 7f))
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.94f)
                setOnClickListener {
                    MergenHaptics.playTap(activity)
                    dismissAnimated {
                        MergenCoreLoginDialog.show(activity) {
                            show(activity)
                        }
                    }
                }
            }
            accountStrip.addView(
                loginBtn,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    leftMargin = dp(activity, 10f)
                }
            )
        }
        body.addView(
            accountStrip,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 14f)
            }
        )

        val subControlsContainer = LinearLayout(activity).apply { orientation = LinearLayout.VERTICAL }
        val syncSubControlsEnabled = { masterOn: Boolean ->
            subControlsContainer.alpha = if (masterOn) 1f else 0.42f
            setGroupInteractable(subControlsContainer, masterOn)
        }

        // 2. Master Switch Card
        val masterCard = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        masterCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "MergenV1 Aktif", "MergenV1 Enabled"),
                MergenStrings.t(activity, "Tüm mod özelliklerini tek dokunuşla aç veya kapat", "Toggle all mod features on or off with one tap"),
                MergenPrefs.isMasterEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setMasterEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
                syncSubControlsEnabled(enabled)
            }
        )
        body.addView(
            masterCard,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category A: Arayüz Teması (Theme Switcher)
        subControlsContainer.addView(
            createCategoryLabel(activity, MergenStrings.t(activity, "ARAYÜZ TEMASI", "INTERFACE THEME"), muted)
        )
        val themeCard = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        themeCard.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Panel & Bileşen Stili", "Panel & Surface Style"),
                subtitle = MergenStrings.t(
                    activity,
                    "Alt bar daima Kyant0 Liquid Glass kalır; diğer paneller anında değişir",
                    "Bottom bar stays Kyant0 Liquid Glass; sheets & dialogs update live"
                ),
                options = listOf("MERGEN", "KYANT0 GLASS"),
                selectedIdx = if (kyant0) 1 else 0,
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                val wantKyant0 = chosen == 1
                if (wantKyant0 != MergenPrefs.isKyant0Style(activity)) {
                    MergenPrefs.setKyant0Style(activity, wantKyant0)
                    MergenHaptics.playToggle(activity, wantKyant0, bypassGate = true)
                    dialog.dismiss()
                    show(activity)
                }
            }
        )
        themeCard.addView(createRowDivider(activity, hairline))
        themeCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Liquid Glass Mercek Efekti", "Liquid Glass Lens Refraction"),
                MergenStrings.t(
                    activity,
                    "Cam yüzeyler, butonlar, alt bar ve slider'da kenar kırılma merceği",
                    "Specular edge refraction lens on glass surfaces, bar & slider"
                ),
                MergenPrefs.isGlassLensEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setGlassLensEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        themeCard.addView(createRowDivider(activity, hairline))
        themeCard.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Animasyon Profili", "Animation Profile"),
                subtitle = MergenStrings.t(
                    activity,
                    "120Hz yay hızı, hareket bulanıklığı ve erişilebilirlik modu",
                    "120Hz spring response speed, motion blur & reduced motion"
                ),
                options = listOf(
                    MergenStrings.t(activity, "AKICI", "FLUID"),
                    MergenStrings.t(activity, "KESKİN", "SNAPPY"),
                    MergenStrings.t(activity, "AZALTILMIŞ", "REDUCED")
                ),
                selectedIdx = MergenPrefs.getAnimationProfile(activity),
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                MergenPrefs.setAnimationProfile(activity, chosen)
                MergenHaptics.playTick(activity)
            }
        )
        themeCard.addView(createRowDivider(activity, hairline))
        themeCard.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Arayüz Dili", "Interface Language"),
                subtitle = MergenStrings.t(
                    activity,
                    "Otomatik: Türkiye'de Türkçe, diğer bölgelerde İngilizce",
                    "Auto: Turkish in Turkey, English everywhere else"
                ),
                options = listOf(MergenStrings.t(activity, "OTO", "AUTO"), "EN", "TR"),
                selectedIdx = MergenPrefs.getLanguageOverride(activity),
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                if (chosen != MergenPrefs.getLanguageOverride(activity)) {
                    MergenPrefs.setLanguageOverride(activity, chosen)
                    MergenHaptics.playTick(activity)
                    dialog.dismiss()
                    show(activity)
                }
            }
        )
        subControlsContainer.addView(
            themeCard,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category B: Alt Bar & Video Görünümü
        subControlsContainer.addView(
            createCategoryLabel(activity, MergenStrings.t(activity, "ALT BAR & VİDEO GÖRÜNÜMÜ", "BOTTOM BAR & FEED LAYOUT"), muted)
        )
        val visualCard = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        visualCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Liquid Glass Alt Bar", "Liquid Glass Bottom Bar"),
                MergenStrings.t(activity, "Tüm sayfalarda kompakt 54dp Kyant0 Liquid Glass bar", "Compact 54dp Kyant0 Liquid Glass bar across all pages"),
                MergenPrefs.isLiquidGlassBarEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setLiquidGlassBarEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        visualCard.addView(createRowDivider(activity, hairline))
        visualCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Alt Yazıları Barın Üstüne Taşı", "Lift Captions Above Bar"),
                MergenStrings.t(activity, "Yazar, açıklama ve müzik diskini barın üzerine al", "Raise author, caption & audio disc cleanly above the bar"),
                MergenPrefs.isLiftFeedCaptionsEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setLiftFeedCaptionsEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        subControlsContainer.addView(
            visualCard,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category C: Dinamik Bildirimler (Kamera Noktası)
        subControlsContainer.addView(
            createCategoryLabel(
                activity,
                MergenStrings.t(activity, "DİNAMİK BİLDİRİMLER (KAMERA NOKTASI)", "DYNAMIC ALERTS (CAMERA NOTCH)"),
                muted
            )
        )
        val notifCard = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        notifCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Dinamik Bildirimler", "Dynamic Notifications"),
                MergenStrings.t(
                    activity,
                    "Normalde gizlenir; yeni mesaj ve dürtme olunca kameradan açılır",
                    "Hidden by default; blooms from camera punch-hole on events"
                ),
                MergenPrefs.isDynamicPillEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setDynamicPillEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        notifCard.addView(createRowDivider(activity, hairline))
        notifCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Dürtme Hatırlatıcısı", "Break Nudge Reminder"),
                MergenStrings.t(activity, "20 dakikada bir nazik mola hatırlatması gösterir", "Shows a gentle break reminder every 20 minutes"),
                MergenPrefs.isNudgeReminderEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setNudgeReminderEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        notifCard.addView(createRowDivider(activity, hairline))
        notifCard.addView(
            createCameraActionsRow(
                activity, kyant0, elevated, ink, muted, hairline, strokePx,
                onCalibrate = {
                    dismissAnimated {
                        DynamicPillController.showCameraCalibrator(activity)
                    }
                },
                onTest = {
                    dismissAnimated {
                        DynamicPillController.showTestNotification(activity)
                    }
                }
            )
        )
        subControlsContainer.addView(
            notifCard,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category D: Gesture & Hareket Kontrolleri (Faz 1)
        subControlsContainer.addView(
            createCategoryLabel(
                activity,
                MergenStrings.t(activity, "GESTURE & HAREKET KONTROLLERİ (FAZ 1)", "GESTURES & MOTION CONTROLS (PHASE 1)"),
                muted
            )
        )
        val faz1Card = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        faz1Card.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Kaydırma Hassasiyeti", "Swipe Sensitivity"),
                subtitle = MergenStrings.t(
                    activity,
                    "Profil çekmecesi ve çekme-bırakma hareket eşiği",
                    "Profile drawer & pull-to-dismiss gesture threshold"
                ),
                options = listOf(
                    MergenStrings.t(activity, "DÜŞÜK", "LOW"),
                    MergenStrings.t(activity, "ORTA", "MEDIUM"),
                    MergenStrings.t(activity, "YÜKSEK", "HIGH")
                ),
                selectedIdx = MergenPrefs.getGestureSensitivity(activity),
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                MergenPrefs.setGestureSensitivity(activity, chosen)
                MergenHaptics.playTick(activity)
            }
        )
        faz1Card.addView(createRowDivider(activity, hairline))
        faz1Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Morfing Alt Bar", "Morphing Bottom Bar"),
                MergenStrings.t(activity, "Aşağı kaydırınca yazılar gizlenir, bar kompakt boyuta küçülür", "Hides labels and shrinks bar on scroll down"),
                MergenPrefs.isMorphingBarEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setMorphingBarEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz1Card.addView(createRowDivider(activity, hairline))
        faz1Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Paneller (Yorum & Paylaş)", "Themed Sheets (Comments & Share)"),
                MergenStrings.t(activity, "Yorum ve paylaşım çekmecelerini aktif temaya (Mergen / Kyant0) alır", "Applies active theme to comment & share sheets"),
                MergenPrefs.isPeekSheetsEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setPeekSheetsEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz1Card.addView(createRowDivider(activity, hairline))
        faz1Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Profil Fotoğrafından Hesap Çekmecesi", "Avatar Swipe Profile Drawer"),
                MergenStrings.t(activity, "Sağdaki profil fotoğrafını sola çekince hesap çekmecesi açılır", "Swipe left from creator avatar to open profile drawer"),
                MergenPrefs.isProfilePeekEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setProfilePeekEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz1Card.addView(createRowDivider(activity, hairline))
        faz1Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Hızlı Kontrol Menüsü", "Quick Control Sheet"),
                MergenStrings.t(activity, "Alt Liquid Glass barı yukarı kaydırınca açılır", "Swipe up from bottom Liquid Glass bar to open"),
                MergenPrefs.isEdgeControlPanelEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setEdgeControlPanelEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        subControlsContainer.addView(
            faz1Card,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category E: Haptik Dil
        subControlsContainer.addView(
            createCategoryLabel(activity, MergenStrings.t(activity, "HAPTİK DİL", "HAPTIC FEEDBACK"), muted)
        )
        val hapticsCard = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        hapticsCard.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Haptik Geri Bildirim", "Haptic Feedback"),
                MergenStrings.t(activity, "Sekme dokunuşu, sürükleme ve geçişlerde ince titreşim", "Subtle tactile haptics on taps, drags & transitions"),
                MergenPrefs.isHapticsEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setHapticsEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = enabled)
            }
        )
        subControlsContainer.addView(
            hapticsCard,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        // Category F: Faz 2 — Kinetik Etkileşim & Medya (Birleşik Final)
        subControlsContainer.addView(
            createCategoryLabel(
                activity,
                MergenStrings.t(activity, "FAZ 2 // KİNETİK ETKİLEŞİM & MEDYA", "PHASE 2 // KINETIC INTERACTION & MEDIA"),
                muted
            )
        )
        val faz2Card = createSectionCard(activity, kyant0, surface, hairline, strokePx)
        faz2Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Radyal Basılı Tutma Menüsü", "Radial Hold Action Menu"),
                MergenStrings.t(activity, "Videoya ortadan basılı tutunca dairesel eylem menüsü açılır", "Press & hold center of video to open radial menu"),
                MergenPrefs.isRadialMenuEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setRadialMenuEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz2Card.addView(createRowDivider(activity, hairline))
        faz2Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Kinetik Zaman Çubuğu", "Kinetic Seekbar Slider"),
                MergenStrings.t(activity, "Alt barın üstünde hassas, elastik sarma çubuğu", "Elastic precision Liquid Glass scrub slider above bar"),
                MergenPrefs.isKineticSeekbarEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setKineticSeekbarEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz2Card.addView(createRowDivider(activity, hairline))
        faz2Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Dairesel İlerleme Halkası", "Circular Progress Ring"),
                MergenStrings.t(activity, "Sağ üstte kompakt video ilerleme göstergesi", "Compact top-right video playback ring"),
                MergenPrefs.isCircularProgressEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setCircularProgressEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz2Card.addView(createRowDivider(activity, hairline))
        val transitionKeys = listOf("none", "depth", "stack", "cinematic")
        val curTransitionIdx = transitionKeys.indexOf(MergenPrefs.getTransitionStyle(activity)).let { if (it >= 0) it else 1 }
        faz2Card.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Video Geçiş Efekti", "Feed Swipe Transition"),
                subtitle = MergenStrings.t(activity, "Dikey akış kaydırma animasyon stili", "Vertical video feed scroll transition style"),
                options = listOf(
                    MergenStrings.t(activity, "KAPALI", "OFF"),
                    MergenStrings.t(activity, "DERİN", "DEPTH"),
                    MergenStrings.t(activity, "YIĞIN", "STACK"),
                    MergenStrings.t(activity, "SİNEMATİK", "CINEMA")
                ),
                selectedIdx = curTransitionIdx,
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                MergenPrefs.setTransitionStyle(activity, transitionKeys[chosen.coerceIn(0, 3)])
                MergenHaptics.playTick(activity)
            }
        )
        faz2Card.addView(createRowDivider(activity, hairline))
        faz2Card.addView(
            createSwitchRow(
                activity, kyant0,
                MergenStrings.t(activity, "Danmaku (Akan Yorumlar)", "Danmaku (Floating Comments)"),
                MergenStrings.t(activity, "Video yorumlarını ekranın üstünde kayan şerit olarak gösterir", "Scrolls live video comments cleanly near the top edge"),
                MergenPrefs.isDanmakuEnabled(activity), isDark, ink, muted
            ) { enabled ->
                MergenPrefs.setDanmakuEnabled(activity, enabled)
                MergenHaptics.playToggle(activity, enabled, bypassGate = true)
            }
        )
        faz2Card.addView(createRowDivider(activity, hairline))
        faz2Card.addView(
            createSegmentedRow(
                activity = activity,
                kyant0 = kyant0,
                title = MergenStrings.t(activity, "Akan Yorum Sıklığı", "Danmaku Density"),
                subtitle = MergenStrings.t(activity, "Ekranda aynı anda akan yorum yoğunluğu", "Simultaneous floating comment frequency"),
                options = listOf(
                    MergenStrings.t(activity, "AZ", "LOW"),
                    MergenStrings.t(activity, "ORTA", "MID"),
                    MergenStrings.t(activity, "YOĞUN", "HIGH")
                ),
                selectedIdx = MergenPrefs.getDanmakuDensity(activity),
                textPrimary = ink,
                textSecondary = muted,
                chipFill = elevated,
                strokeColor = hairline,
                strokePx = strokePx,
                bg = bg,
                ink = ink
            ) { chosen ->
                MergenPrefs.setDanmakuDensity(activity, chosen)
                MergenHaptics.playTick(activity)
            }
        )
        subControlsContainer.addView(
            faz2Card,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                bottomMargin = dp(activity, 16f)
            }
        )

        syncSubControlsEnabled(MergenPrefs.isMasterEnabled(activity))
        body.addView(subControlsContainer)

        body.addView(TextView(activity).apply {
            text = MergenStrings.t(activity, "Cihazları Yönet · mergen-core.web.app ↗", "Manage Devices · mergen-core.web.app ↗")
            gravity = Gravity.CENTER
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
            setTextColor(muted)
            setPadding(dp(activity, 8f), dp(activity, 8f), dp(activity, 8f), dp(activity, 4f))
            setOnClickListener {
                MergenHaptics.playTap(activity)
                try {
                    activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(MergenCoreAuth.PORTAL_URL)))
                } catch (_: Throwable) {
                }
            }
        })

        body.addView(TextView(activity).apply {
            text = MergenStrings.t(activity, "Hoş Geldin Ekranını Tekrar Göster", "Replay Welcome Screen")
            gravity = Gravity.CENTER
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            setTextColor(muted)
            setPadding(dp(activity, 8f), dp(activity, 4f), dp(activity, 8f), dp(activity, 6f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.95f)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissAnimated {
                    MergenWelcomeDialog.show(activity)
                }
            }
        })

        scroll.addView(body)
        sheetCol.addView(
            scroll,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        sheetHolder.addView(
            sheetCol,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val enterY = dpF(activity, 32f).coerceAtLeast(1f)
        val reduced = MergenSpringEngine.isReducedMotion(activity)
        sheetHolder.translationY = if (reduced) 0f else enterY
        sheetHolder.scaleX = if (reduced) 1f else 0.95f
        sheetHolder.scaleY = if (reduced) 1f else 0.95f
        sheetHolder.alpha = 0f

        rootFrame.addView(
            sheetHolder,
            FrameLayout.LayoutParams(cardW, ViewGroup.LayoutParams.WRAP_CONTENT, Gravity.CENTER)
        )

        dialog.setContentView(rootFrame)
        dialog.setOnDismissListener {
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
                fromScaleX = 0.95f,
                fromScaleY = 0.95f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                dampingRatioX = 0.86f,
                responseX = 0.28f,
                dampingRatioY = 0.86f,
                responseY = 0.28f,
                maxBlurDp = 7f
            )
            MergenSpringEngine.springTranslationY(
                view = sheetHolder,
                targetY = 0f,
                dampingRatio = 0.88f,
                responseSec = 0.30f,
                maxBlurDp = 9f,
                onUpdate = { curY ->
                    val frac = (1f - (curY.coerceAtLeast(0f) / enterY)).coerceIn(0f, 1f)
                    rootFrame.setBackgroundColor(Color.argb((baseScrimAlpha * frac).roundToInt(), 0, 0, 0))
                }
            )
        }
    }

    private fun makeAdaptiveBox(
        context: Context,
        kyant0: Boolean,
        fillColor: Int,
        strokeColor: Int,
        strokePx: Int,
        radiusDp: Float
    ) = if (kyant0) {
        GradientDrawable().apply {
            shape = GradientDrawable.RECTANGLE
            cornerRadius = dpF(context, radiusDp)
            setColor(fillColor)
            if (strokePx > 0 && strokeColor != Color.TRANSPARENT) {
                setStroke(strokePx, strokeColor)
            }
        }
    } else {
        MergenDesign.sharpBox(fillColor, strokeColor, strokePx)
    }

    private fun createCategoryLabel(activity: Activity, title: String, color: Int): TextView =
        TextView(activity).apply {
            text = title
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(color)
            letterSpacing = 0.08f
            setPadding(dp(activity, 4f), 0, dp(activity, 4f), dp(activity, 6f))
        }

    private fun createSectionCard(
        activity: Activity,
        kyant0: Boolean,
        fillColor: Int,
        strokeColor: Int,
        strokePx: Int
    ): LinearLayout = LinearLayout(activity).apply {
        orientation = LinearLayout.VERTICAL
        background = makeAdaptiveBox(activity, kyant0, fillColor, strokeColor, strokePx, 18f)
    }

    private fun createRowDivider(activity: Activity, color: Int): View =
        View(activity).apply {
            setBackgroundColor(color)
            layoutParams = LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                dp(activity, 0.75f).coerceAtLeast(1)
            ).apply {
                leftMargin = dp(activity, 14f)
                rightMargin = dp(activity, 14f)
            }
        }

    private fun createSwitchRow(
        activity: Activity,
        kyant0: Boolean,
        title: String,
        subtitle: String,
        initial: Boolean,
        isDark: Boolean,
        textPrimary: Int,
        textSecondary: Int,
        onToggle: (Boolean) -> Unit
    ): LinearLayout {
        val row = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(activity, 14f), dp(activity, 13f), dp(activity, 14f), dp(activity, 13f))
            isClickable = true
            isFocusable = true
        }

        val labels = LinearLayout(activity).apply { orientation = LinearLayout.VERTICAL }
        labels.addView(TextView(activity).apply {
            text = title
            typeface = Typeface.create("sans-serif-medium", Typeface.NORMAL)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            setTextColor(textPrimary)
        })
        labels.addView(
            TextView(activity).apply {
                text = subtitle
                typeface = Typeface.SANS_SERIF
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f)
                setTextColor(textSecondary)
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 2f)
            }
        )

        val toggle = MergenToggleView(activity, initial, isDark, kyant0).apply {
            onCheckedChanged = { checked -> onToggle(checked) }
        }

        row.setOnClickListener { toggle.performClick() }
        row.addView(labels, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
        row.addView(
            toggle,
            (toggle.layoutParams as LinearLayout.LayoutParams).apply { leftMargin = dp(activity, 12f) }
        )
        return row
    }

    private fun createSegmentedRow(
        activity: Activity,
        kyant0: Boolean,
        title: String,
        subtitle: String,
        options: List<String>,
        selectedIdx: Int,
        textPrimary: Int,
        textSecondary: Int,
        chipFill: Int,
        strokeColor: Int,
        strokePx: Int,
        bg: Int,
        ink: Int,
        onSelected: (Int) -> Unit
    ): LinearLayout {
        val wrapper = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(activity, 14f), dp(activity, 12f), dp(activity, 14f), dp(activity, 12f))
        }
        wrapper.addView(TextView(activity).apply {
            text = title
            typeface = Typeface.create("sans-serif-medium", Typeface.NORMAL)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            setTextColor(textPrimary)
        })
        wrapper.addView(
            TextView(activity).apply {
                text = subtitle
                typeface = Typeface.SANS_SERIF
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
                setTextColor(textSecondary)
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 2f)
                bottomMargin = dp(activity, 10f)
            }
        )

        val segRow = MergenSegmentedControlView(
            context = activity,
            kyant0 = kyant0,
            options = options,
            selectedIdx = selectedIdx,
            textPrimary = textPrimary,
            chipFill = chipFill,
            strokeColor = strokeColor,
            strokePx = strokePx,
            activeTextColor = bg,
            activePillColor = ink,
            onSelected = onSelected
        )
        wrapper.addView(segRow)
        return wrapper
    }

    private fun createCameraActionsRow(
        activity: Activity,
        kyant0: Boolean,
        chipFill: Int,
        textPrimary: Int,
        textSecondary: Int,
        strokeColor: Int,
        strokePx: Int,
        onCalibrate: () -> Unit,
        onTest: () -> Unit
    ): LinearLayout {
        val wrapper = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(dp(activity, 14f), dp(activity, 12f), dp(activity, 14f), dp(activity, 12f))
        }
        wrapper.addView(TextView(activity).apply {
            text = MergenStrings.t(activity, "Kamera Konumu & Önizleme", "Camera Position & Preview")
            typeface = Typeface.create("sans-serif-medium", Typeface.NORMAL)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            setTextColor(textPrimary)
        })
        wrapper.addView(
            TextView(activity).apply {
                val xPct = (MergenPrefs.getCameraXFraction(activity) * 100f).roundToInt()
                val yDp = MergenPrefs.getCameraYDp(activity).roundToInt()
                val calibrated = if (MergenPrefs.isCameraCalibrated(activity)) {
                    MergenStrings.t(activity, "KALİBRE", "CALIBRATED")
                } else {
                    MergenStrings.t(activity, "OTOMATİK", "AUTO")
                }
                val savedPrefix = MergenStrings.t(activity, "Kayıtlı nokta", "Saved notch")
                text = "$savedPrefix: X $xPct% · Y ${yDp}dp ($calibrated)"
                typeface = Typeface.MONOSPACE
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(textSecondary)
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 2f)
                bottomMargin = dp(activity, 10f)
            }
        )

        val btnRow = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        fun makeActionChip(label: String, action: () -> Unit) = TextView(activity).apply {
            text = label
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            setTextColor(textPrimary)
            background = makeAdaptiveBox(activity, kyant0, chipFill, strokeColor, strokePx, 10f)
            setPadding(dp(activity, 8f), dp(activity, 9f), dp(activity, 8f), dp(activity, 9f))
            MergenSpringEngine.attachSpringPress(this, pressedScale = 0.94f)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                action()
            }
        }
        btnRow.addView(
            makeActionChip(MergenStrings.t(activity, "KAMERA KONUMU", "CAMERA NOTCH"), onCalibrate),
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 6f) }
        )
        btnRow.addView(
            makeActionChip(MergenStrings.t(activity, "TEST BİLDİRİMİ", "TEST ALERT"), onTest),
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 6f) }
        )
        wrapper.addView(btnRow)
        return wrapper
    }

    private fun setGroupInteractable(group: ViewGroup, enabled: Boolean) {
        for (i in 0 until group.childCount) {
            val child = group.getChildAt(i)
            child.isEnabled = enabled
            if (child is ViewGroup) {
                setGroupInteractable(child, enabled)
            }
        }
    }
}
