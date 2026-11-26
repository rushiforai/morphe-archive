package com.sarp.tiktokliquidglass

import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Configuration
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Outline
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RectF
import android.graphics.RenderNode
import android.graphics.RuntimeShader
import android.util.TypedValue
import android.view.View
import android.view.ViewOutlineProvider
import android.view.ViewTreeObserver
import android.widget.FrameLayout
import kotlin.math.ceil
import kotlin.math.min

/**
 * Hardware-accelerated Kyant0 AGSL Liquid Glass surface container.
 * Uses RenderNode + ROUNDED_RECT_REFRACTION_SHADER + DEFAULT_HIGHLIGHT_SHADER (plusBlendMode),
 * screen coordinates via getLocationOnScreen (works both in-window and cross-window Dialogs),
 * and re-entrancy guards via KyantShaders.isRecordingBackdrop.
 */
@SuppressLint("ViewConstructor")
open class KyantGlassSurfaceView(
    context: Context,
    private var backdropSource: View? = null,
    private var cornerRadiusDp: Float = 24f,
    private var isCapsule: Boolean = false,
    private val topCornersOnly: Boolean = false,
    private val leftCornersOnly: Boolean = false,
    private val blurRadiusDp: Float = 10f,
    private val refractionHeightDp: Float = 18f,
    private val refractionAmountDp: Float = 20f,
    private val forceDarkGlass: Boolean = false
) : FrameLayout(context) {

    private fun dpF(v: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

    private val blurPadPx: Float = ceil(dpF(blurRadiusDp.coerceAtLeast(4f) * 1.4f))
    private val refractionShader = RuntimeShader(KyantShaders.ROUNDED_RECT_REFRACTION_SHADER)
    private val highlightShader = RuntimeShader(KyantShaders.DEFAULT_HIGHLIGHT_SHADER)
    private val backdropNode = RenderNode("KyantGlassSurface")

    private val rectF = RectF()
    private val clipPath = Path()
    private val tintPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
    private val ambientStrokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeWidth = dpF(0.9f).coerceAtLeast(1f)
    }
    private val specularStrokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        blendMode = KyantShaders.plusBlendMode
    }

    private val srcLoc = IntArray(2)
    private val selfLoc = IntArray(2)
    private val radiiBuf = FloatArray(8)

    private var isCapturing = false
    private var ignoreNextOnDraw = false
    private var lastInvalidationNanos = 0L
    private var lastCaptureNanos = 0L
    private var lastCapturedLeft = Int.MIN_VALUE
    private var lastCapturedTop = Int.MIN_VALUE
    private var lastCapturedW = 0
    private var lastCapturedH = 0
    private val settleRefreshRunnable = Runnable {
        if (isAttachedToWindow && isShown && !isCapturing) {
            lastCaptureNanos = 0L
            invalidate()
        }
    }

    private val backdropDrawListener = ViewTreeObserver.OnDrawListener {
        if (ignoreNextOnDraw || isCapturing || KyantShaders.isRecordingBackdrop) return@OnDrawListener
        if (!isAttachedToWindow || !isShown) return@OnDrawListener
        val now = System.nanoTime()
        if (now - lastInvalidationNanos >= 28_000_000L) {
            lastInvalidationNanos = now
            postOnAnimation {
                if (isAttachedToWindow && isShown && !isCapturing) {
                    ignoreNextOnDraw = true
                    invalidate()
                }
            }
        }
    }

    init {
        setWillNotDraw(false)
        setLayerType(LAYER_TYPE_HARDWARE, null)
        outlineProvider = object : ViewOutlineProvider() {
            override fun getOutline(view: View, outline: Outline) {
                val w = view.width
                val h = view.height
                if (w <= 0 || h <= 0) return
                val radii = resolveCornerRadii(w.toFloat(), h.toFloat())
                val r = radii[0]
                when {
                    topCornersOnly -> outline.setRoundRect(0, 0, w, h + r.toInt(), r)
                    leftCornersOnly -> outline.setRoundRect(0, 0, w + r.toInt(), h, r)
                    else -> outline.setRoundRect(0, 0, w, h, r)
                }
            }
        }
        clipToOutline = !topCornersOnly && !leftCornersOnly
    }

    fun setBackdropSource(source: View?) {
        if (backdropSource === source) return
        if (isAttachedToWindow) {
            try {
                backdropSource?.viewTreeObserver?.removeOnDrawListener(backdropDrawListener)
            } catch (_: Throwable) {
            }
        }
        backdropSource = source
        if (isAttachedToWindow && source != null) {
            try {
                source.viewTreeObserver.addOnDrawListener(backdropDrawListener)
            } catch (_: Throwable) {
            }
        }
        invalidate()
    }

    fun setCornerMode(capsule: Boolean, radiusDp: Float = cornerRadiusDp) {
        if (isCapsule != capsule || cornerRadiusDp != radiusDp) {
            isCapsule = capsule
            cornerRadiusDp = radiusDp
            invalidateOutline()
            invalidate()
        }
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        try {
            backdropSource?.viewTreeObserver?.addOnDrawListener(backdropDrawListener)
        } catch (_: Throwable) {
        }
    }

    override fun onDetachedFromWindow() {
        removeCallbacks(settleRefreshRunnable)
        try {
            backdropSource?.viewTreeObserver?.removeOnDrawListener(backdropDrawListener)
        } catch (_: Throwable) {
        }
        backdropNode.discardDisplayList()
        lastCaptureNanos = 0L
        super.onDetachedFromWindow()
    }

    override fun draw(canvas: Canvas) {
        if (KyantShaders.isRecordingBackdrop) return
        super.draw(canvas)
    }

    override fun dispatchDraw(canvas: Canvas) {
        if (KyantShaders.isRecordingBackdrop) return
        super.dispatchDraw(canvas)
    }

    private fun resolveCornerRadii(w: Float, h: Float): FloatArray {
        val base = if (isCapsule) {
            min(w, h) * 0.5f
        } else {
            dpF(cornerRadiusDp).coerceAtMost(min(w, h) * 0.5f)
        }
        return when {
            topCornersOnly -> floatArrayOf(base, base, 0f, 0f)
            leftCornersOnly -> floatArrayOf(base, 0f, 0f, base)
            else -> floatArrayOf(base, base, base, base)
        }
    }

    private fun isLightSurface(): Boolean {
        if (forceDarkGlass) return false
        val nightMask = resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK
        return nightMask != Configuration.UI_MODE_NIGHT_YES
    }

    override fun onDraw(canvas: Canvas) {
        if (isCapturing || KyantShaders.isRecordingBackdrop) return
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 4f || h <= 4f) return

        val c = resolveCornerRadii(w, h) // [TL, TR, BR, BL]
        val rTL = c[0]
        val rTR = c[1]
        val rBR = c[2]
        val rBL = c[3]
        radiiBuf[0] = rTL; radiiBuf[1] = rTL
        radiiBuf[2] = rTR; radiiBuf[3] = rTR
        radiiBuf[4] = rBR; radiiBuf[5] = rBR
        radiiBuf[6] = rBL; radiiBuf[7] = rBL

        val light = isLightSurface()
        val src = backdropSource

        rectF.set(0f, 0f, w, h)
        clipPath.reset()
        clipPath.addRoundRect(rectF, radiiBuf, Path.Direction.CW)

        canvas.save()
        canvas.clipPath(clipPath)

        if (src != null && src.isAttachedToWindow && src.width > 0 && src.height > 0 && src !== this) {
            captureBackdrop(src, w, h, rTL, rTR, rBR, rBL, light)
            canvas.save()
            canvas.translate(-blurPadPx, -blurPadPx)
            canvas.drawRenderNode(backdropNode)
            canvas.restore()
        } else {
            tintPaint.color = if (light) Color.argb(235, 245, 246, 250) else Color.argb(228, 18, 20, 26)
            canvas.drawRect(rectF, tintPaint)
        }

        // Translucent Kyant0 surface tint
        tintPaint.color = if (light) {
            Color.argb(120, 248, 249, 253)
        } else {
            Color.argb(118, 22, 24, 30)
        }
        canvas.drawRect(rectF, tintPaint)

        // Subtle ambient inner edge
        ambientStrokePaint.color = if (light) Color.argb(38, 0, 0, 0) else Color.argb(54, 255, 255, 255)
        canvas.drawPath(clipPath, ambientStrokePaint)

        // Kyant0 AGSL directional specular highlight rim
        val strokeHalf = ceil(dpF(1.1f))
        KyantShaders.configureHighlightShader(
            shader = highlightShader,
            width = w,
            height = h,
            rTL = rTL,
            rTR = rTR,
            rBR = rBR,
            rBL = rBL,
            colorArgb = Color.WHITE,
            angleDegrees = 45f,
            falloff = 1f
        )
        specularStrokePaint.strokeWidth = strokeHalf * 2f
        specularStrokePaint.shader = highlightShader
        specularStrokePaint.alpha = if (light) 225 else 200
        canvas.drawPath(clipPath, specularStrokePaint)

        canvas.restore()
    }

    private fun captureBackdrop(
        src: View,
        w: Float,
        h: Float,
        rTL: Float,
        rTR: Float,
        rBR: Float,
        rBL: Float,
        light: Boolean
    ) {
        val nodeW = ceil(w + blurPadPx * 2f).toInt().coerceAtLeast(2)
        val nodeH = ceil(h + blurPadPx * 2f).toInt().coerceAtLeast(2)
        src.getLocationOnScreen(srcLoc)
        getLocationOnScreen(selfLoc)

        val now = System.nanoTime()
        val moved = kotlin.math.abs(selfLoc[0] - lastCapturedLeft) + kotlin.math.abs(selfLoc[1] - lastCapturedTop)
        val sameSize = lastCapturedW == nodeW && lastCapturedH == nodeH
        if (moved > 2 && sameSize && backdropNode.hasDisplayList() && (now - lastCaptureNanos) < 42_000_000L) {
            removeCallbacks(settleRefreshRunnable)
            postDelayed(settleRefreshRunnable, 55L)
            return
        }
        lastCaptureNanos = now
        lastCapturedLeft = selfLoc[0]
        lastCapturedTop = selfLoc[1]
        lastCapturedW = nodeW
        lastCapturedH = nodeH

        val leftInSrc = (selfLoc[0] - srcLoc[0]).toFloat()
        val topInSrc = (selfLoc[1] - srcLoc[1]).toFloat()

        backdropNode.setPosition(0, 0, nodeW, nodeH)
        backdropNode.setClipToBounds(true)

        isCapturing = true
        KyantShaders.isRecordingBackdrop = true
        val rec = backdropNode.beginRecording(nodeW, nodeH)
        try {
            // Paint base surface behind drawn tree so transparent/empty voids never turn pitch black
            rec.drawColor(if (light) Color.rgb(245, 245, 248) else Color.rgb(20, 20, 26))
            rec.translate(blurPadPx - leftInSrc, blurPadPx - topInSrc)
            src.draw(rec)
        } catch (_: Throwable) {
        } finally {
            backdropNode.endRecording()
            KyantShaders.isRecordingBackdrop = false
            isCapturing = false
        }

        val lensOn = MergenPrefs.isGlassLensEnabled(context)
        val effect = KyantShaders.createGlassRenderEffect(
            width = w,
            height = h,
            offsetX = -blurPadPx,
            offsetY = -blurPadPx,
            rTL = rTL,
            rTR = rTR,
            rBR = rBR,
            rBL = rBL,
            blurRadiusPx = dpF(blurRadiusDp),
            refractionHeightPx = if (lensOn) min(dpF(refractionHeightDp), min(w, h) * 0.45f) else 0f,
            refractionAmountPx = if (lensOn) dpF(refractionAmountDp) else 0f,
            refractionShader = refractionShader
        )
        backdropNode.setRenderEffect(effect)
    }
}
