package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.media.AudioManager
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.TypedValue
import android.view.Gravity
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.SeekBar
import android.widget.TextView
import java.util.WeakHashMap
import kotlin.math.abs
import kotlin.math.roundToInt

/**
 * Dual-theme touch-draggable slider (0dp architectural in Mergen, rounded pill in Kyant0).
 */
class MergenSliderView(
    context: Context,
    initialProgress: Float = 0.5f,
    private val isKyant0: Boolean = false
) : View(context) {

    var progress: Float = initialProgress.coerceIn(0f, 1f)
        set(value) {
            field = value.coerceIn(0f, 1f)
            invalidate()
        }

    var onProgressChanged: ((Float, Boolean) -> Unit)? = null

    private val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = if (isKyant0) Color.argb(48, 255, 255, 255) else Color.parseColor("#141414")
        style = Paint.Style.FILL
    }
    private val fillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = if (isKyant0) Color.argb(235, 255, 255, 255) else Color.WHITE
        style = Paint.Style.FILL
    }
    private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.argb(62, 255, 255, 255)
        style = Paint.Style.STROKE
        strokeWidth = MergenDesign.dpF(context, if (isKyant0) 0.8f else 1f).coerceAtLeast(1f)
    }

    override fun onTouchEvent(event: MotionEvent): Boolean {
        when (event.actionMasked) {
            MotionEvent.ACTION_DOWN -> {
                parent?.requestDisallowInterceptTouchEvent(true)
                updateFromX(event.x, fromUser = true)
                MergenHaptics.playTick(context)
                return true
            }
            MotionEvent.ACTION_MOVE -> {
                updateFromX(event.x, fromUser = true)
                return true
            }
            MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                parent?.requestDisallowInterceptTouchEvent(false)
                updateFromX(event.x, fromUser = true)
                MergenHaptics.playTap(context)
                return true
            }
        }
        return super.onTouchEvent(event)
    }

    private fun updateFromX(x: Float, fromUser: Boolean) {
        if (width <= 0) return
        val p = (x / width.toFloat()).coerceIn(0f, 1f)
        if (abs(p - progress) >= 0.005f) {
            progress = p
            onProgressChanged?.invoke(p, fromUser)
        }
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val barH = (h * 0.54f).coerceAtLeast(10f)
        val top = (h - barH) * 0.5f
        val r = if (isKyant0) barH * 0.5f else 0f

        if (r > 0f) {
            canvas.drawRoundRect(0f, top, w, top + barH, r, r, trackPaint)
            val fillW = (w * progress).coerceAtLeast(barH * 0.55f).coerceAtMost(w)
            if (progress > 0.005f) {
                canvas.drawRoundRect(0f, top, fillW, top + barH, r, r, fillPaint)
            }
            val hs = strokePaint.strokeWidth * 0.5f
            canvas.drawRoundRect(hs, top + hs, w - hs, top + barH - hs, r, r, strokePaint)
        } else {
            canvas.drawRect(0f, top, w, top + barH, trackPaint)
            val fillW = (w * progress).coerceIn(0f, w)
            if (fillW > 1f) {
                canvas.drawRect(0f, top, fillW, top + barH, fillPaint)
            }
            val hs = strokePaint.strokeWidth * 0.5f
            canvas.drawRect(hs, top + hs, w - hs, top + barH - hs, strokePaint)
        }
    }
}

/**
 * Feature 1.4 (Dual Mergen / Kyant0 Theme):
 * Swipe-up Quick Control Sheet launched from the bottom Liquid Glass bar.
 */
object QuickControlSheetController {

    private const val TAG_SHEET_DISMISSING = 0x5341529E

    private class QuickState(
        var backdropSource: View? = null,
        var scrimOverlay: FrameLayout? = null,
        var dismissingScrim: FrameLayout? = null,
        var cleanRestorePill: View? = null,
        var cleanScreen: Boolean = false,
        var lastAutoScrollAtMs: Long = 0L
    )

    private val states = WeakHashMap<Activity, QuickState>()
    private val mainHandler = Handler(Looper.getMainLooper())
    private val autoScrollRunnables = WeakHashMap<Activity, Runnable>()

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun sync(activity: Activity, backdropSource: View? = null) {
        val modActive = MergenPrefs.isModEffectivelyActive(activity)
        val enabled = MergenPrefs.isEdgeControlPanelEnabled(activity)
        if (!modActive) {
            detach(activity)
            return
        }

        val state = states.getOrPut(activity) { QuickState(backdropSource = backdropSource) }
        if (backdropSource != null) {
            state.backdropSource = backdropSource
            (state.cleanRestorePill as? KyantGlassSurfaceView)?.setBackdropSource(backdropSource)
        }
        if (!enabled) {
            dismissSheet(activity, state, animate = false)
        }
        ensureAutoScrollLoop(activity, state)
    }

    fun isShowing(activity: Activity): Boolean =
        states[activity]?.scrimOverlay != null

    fun isCleanScreen(activity: Activity): Boolean =
        states[activity]?.cleanScreen == true

    fun dismiss(activity: Activity, animate: Boolean = true) {
        val state = states[activity] ?: return
        dismissSheet(activity, state, animate)
    }

    fun show(activity: Activity, backdropSource: View? = null) {
        if (activity.isFinishing || activity.isDestroyed) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || !MergenPrefs.isEdgeControlPanelEnabled(activity)) return

        val state = states.getOrPut(activity) { QuickState() }
        val resolvedSrc = backdropSource ?: state.backdropSource ?: findFallbackBackdrop(activity)
        state.backdropSource = resolvedSrc
        ensureAutoScrollLoop(activity, state)

        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        content.post {
            if (activity.isFinishing || activity.isDestroyed) return@post
            presentSheetOnMain(activity, content, state, resolvedSrc)
        }
    }

    fun toggleCleanScreen(activity: Activity) {
        val state = states.getOrPut(activity) { QuickState() }
        val next = !state.cleanScreen
        state.cleanScreen = next
        applyCleanScreenAlpha(activity, next)
        KineticMediaOverlayController.setCleanScreen(activity, next)
        DanmakuController.setCleanScreen(activity, next)
        if (next) {
            showCleanRestorePill(activity, state)
        } else {
            removeCleanRestorePill(activity, state)
        }
        MergenHaptics.playToggle(activity, next)
        DynamicPillController.showStatus(
            activity,
            if (next) {
                MergenStrings.t(activity, "TEMİZ EKRAN AÇIK", "CLEAN SCREEN ON")
            } else {
                MergenStrings.t(activity, "TEMİZ EKRAN KAPALI", "CLEAN SCREEN OFF")
            }
        )
    }

    fun detach(activity: Activity) {
        autoScrollRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val state = states.remove(activity) ?: return
        if (state.cleanScreen) {
            state.cleanScreen = false
            applyCleanScreenAlpha(activity, enableClean = false)
            KineticMediaOverlayController.setCleanScreen(activity, false)
            DanmakuController.setCleanScreen(activity, false)
        }
        removeCleanRestorePill(activity, state)
        dismissSheet(activity, state, animate = false)
    }

    private fun presentSheetOnMain(
        activity: Activity,
        content: ViewGroup,
        state: QuickState,
        backdropSource: View?
    ) {
        dismissSheetImmediate(state)

        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val decor = activity.window?.decorView ?: content
        val navInset = TikTokViewResolver.navBarBottomInset(decor)
        val strokePx = dp(activity, 1f).coerceAtLeast(1)
        val baseScrimAlpha = if (kyant0) 80 else 148
        val sheetDragSlop = ViewConfiguration.get(activity).scaledTouchSlop.toFloat()

        val sheetCard: ViewGroup = if (kyant0) {
            KyantGlassSurfaceView(
                context = activity,
                backdropSource = backdropSource,
                cornerRadiusDp = 26f,
                blurRadiusDp = 12f,
                refractionHeightDp = 22f,
                refractionAmountDp = 22f,
                forceDarkGlass = true
            )
        } else {
            FrameLayout(activity).apply {
                background = MergenDesign.sharpBox(
                    fillColor = MergenDesign.OBSIDIAN_BG,
                    strokeColor = MergenDesign.OBSIDIAN_BORDER,
                    strokePx = strokePx
                )
            }
        }

        var sheetDragDownX = 0f
        var sheetDragDownY = 0f
        var sheetDragging = false
        var sheetDisallowIntercept = false
        var downInsideCard = false
        var sheetTracker: VelocityTracker? = null

        val scrim: FrameLayout = object : FrameLayout(activity) {
            override fun dispatchTouchEvent(ev: MotionEvent): Boolean {
                if (getTag(TAG_SHEET_DISMISSING) == true) return false
                return super.dispatchTouchEvent(ev)
            }

            override fun requestDisallowInterceptTouchEvent(disallowIntercept: Boolean) {
                sheetDisallowIntercept = disallowIntercept
                super.requestDisallowInterceptTouchEvent(disallowIntercept)
            }

            override fun onInterceptTouchEvent(ev: MotionEvent): Boolean {
                if (getTag(TAG_SHEET_DISMISSING) == true) return false
                when (ev.actionMasked) {
                    MotionEvent.ACTION_DOWN -> {
                        sheetDisallowIntercept = false
                        sheetDragDownX = ev.rawX
                        sheetDragDownY = ev.rawY
                        sheetDragging = false
                        downInsideCard = ev.x >= sheetCard.left.toFloat() &&
                            ev.x <= sheetCard.right.toFloat() &&
                            ev.y >= sheetCard.top.toFloat() + sheetCard.translationY &&
                            ev.y <= sheetCard.bottom.toFloat() + sheetCard.translationY
                        sheetTracker?.recycle()
                        sheetTracker = if (downInsideCard) {
                            VelocityTracker.obtain().apply { addMovement(ev) }
                        } else {
                            null
                        }
                        if (downInsideCard) {
                            MergenSpringEngine.cancelTranslationY(sheetCard)
                        }
                    }
                    MotionEvent.ACTION_MOVE -> {
                        if (!downInsideCard || sheetDisallowIntercept) return false
                        sheetTracker?.addMovement(ev)
                        val dx = ev.rawX - sheetDragDownX
                        val dy = ev.rawY - sheetDragDownY
                        if (abs(dy) > sheetDragSlop && abs(dy) > abs(dx) * 1.25f) {
                            sheetDragging = true
                            return true
                        }
                    }
                    MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                        sheetTracker?.recycle()
                        sheetTracker = null
                        sheetDisallowIntercept = false
                        downInsideCard = false
                    }
                }
                return super.onInterceptTouchEvent(ev)
            }

            override fun onTouchEvent(ev: MotionEvent): Boolean {
                if (getTag(TAG_SHEET_DISMISSING) == true) return false
                if (!downInsideCard) {
                    return super.onTouchEvent(ev)
                }
                when (ev.actionMasked) {
                    MotionEvent.ACTION_MOVE -> {
                        val dy = ev.rawY - sheetDragDownY
                        if (!sheetDragging) {
                            if (abs(dy) <= sheetDragSlop) return true
                            sheetDragging = true
                        }
                        sheetTracker?.addMovement(ev)
                        val maxPullY = dpF(activity, 110f)
                        val appliedY = if (dy >= 0f) dy else -MergenSpringEngine.rubberband(-dy, maxPullY, 0.42f)
                        sheetCard.translationY = appliedY
                        val dismissRange = sheetCard.height.toFloat().coerceAtLeast(dpF(activity, 240f))
                        val dimFrac = (1f - (appliedY.coerceAtLeast(0f) / dismissRange)).coerceIn(0f, 1f)
                        setBackgroundColor(Color.argb((baseScrimAlpha * dimFrac).roundToInt(), 0, 0, 0))
                        sheetTracker?.computeCurrentVelocity(1000)
                        MergenMotionBlur.applyDragVelocityBlur(
                            sheetCard,
                            0f,
                            sheetTracker?.yVelocity ?: 0f,
                            maxBlurDp = 9f
                        )
                        return true
                    }
                    MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                        sheetTracker?.computeCurrentVelocity(1000)
                        val vy = sheetTracker?.yVelocity ?: 0f
                        sheetTracker?.recycle()
                        sheetTracker = null
                        MergenMotionBlur.clear(sheetCard)
                        val dy = ev.rawY - sheetDragDownY
                        val scale = MergenPrefs.getGestureThresholdScale(activity)
                        val projectedY = MergenSpringEngine.projectMomentum(sheetCard.translationY, vy)
                        val thresholdPx = dpF(activity, 52f) * scale
                        val wasDragging = sheetDragging
                        sheetDragging = false
                        downInsideCard = false
                        if (wasDragging && (vy > 680f || dy > thresholdPx || projectedY > thresholdPx * 1.3f)) {
                            MergenHaptics.playTap(activity)
                            dismissSheet(activity, state, animate = true, initialVelocityPxPerSec = vy)
                        } else if (wasDragging || abs(sheetCard.translationY) > 0.5f) {
                            val dimRange = sheetCard.height.toFloat().coerceAtLeast(dpF(activity, 240f))
                            MergenSpringEngine.springTranslationY(
                                view = sheetCard,
                                targetY = 0f,
                                initialVelocityPxPerSec = vy,
                                dampingRatio = 0.88f,
                                responseSec = 0.28f,
                                maxBlurDp = 9f,
                                onUpdate = { curY ->
                                    if (getTag(TAG_SHEET_DISMISSING) == true) return@springTranslationY
                                    val dimFrac = (1f - (curY.coerceAtLeast(0f) / dimRange)).coerceIn(0f, 1f)
                                    setBackgroundColor(Color.argb((baseScrimAlpha * dimFrac).roundToInt(), 0, 0, 0))
                                }
                            )
                        }
                        return true
                    }
                }
                return super.onTouchEvent(ev)
            }
        }.apply {
            setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
            setBackgroundColor(Color.argb(0, 0, 0, 0))
            alpha = 1f
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissSheet(activity, state, animate = true)
            }
        }
        sheetCard.apply {
            elevation = dpF(activity, 18f)
            isClickable = true
            isFocusable = true
        }

        val innerCol = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            val hPad = dp(activity, 18f)
            setPadding(hPad, dp(activity, 10f), hPad, dp(activity, 18f))
        }

        // Top Grab Handle
        val handleArea = FrameLayout(activity).apply {
            setPadding(0, dp(activity, 2f), 0, dp(activity, 12f))
        }
        handleArea.addView(
            View(activity).apply {
                background = if (kyant0) {
                    GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        cornerRadius = dpF(activity, 2f)
                        setColor(Color.argb(145, 255, 255, 255))
                    }
                } else {
                    MergenDesign.sharpBox(MergenDesign.OBSIDIAN_INK)
                }
            },
            FrameLayout.LayoutParams(dp(activity, 36f), dp(activity, 3.5f), Gravity.CENTER_HORIZONTAL)
        )
        innerCol.addView(handleArea)

        // Header Row
        val header = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }
        val reticleSize = dp(activity, 17f)
        header.addView(
            MergenReticleView(activity, MergenDesign.OBSIDIAN_INK),
            LinearLayout.LayoutParams(reticleSize, reticleSize).apply {
                rightMargin = dp(activity, 10f)
            }
        )
        header.addView(
            TextView(activity).apply {
                text = if (kyant0) {
                    MergenStrings.t(activity, "Hızlı Kontrol", "Quick Controls")
                } else {
                    MergenStrings.t(activity, "MERGENV1 // HIZLI KONTROL", "MERGENV1 // QUICK CONTROLS")
                }
                typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, if (kyant0) 16f else 12.5f)
                setTextColor(MergenDesign.OBSIDIAN_INK)
                if (!kyant0) letterSpacing = 0.06f
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        )
        val closeBtn = TextView(activity).apply {
            text = if (kyant0) "×" else "[×]"
            gravity = Gravity.CENTER
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, if (kyant0) 17f else 13.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, 14f)
                    setColor(Color.argb(42, 255, 255, 255))
                    setStroke(strokePx, Color.argb(72, 255, 255, 255))
                }
            } else {
                MergenDesign.sharpBox(MergenDesign.OBSIDIAN_SURFACE, MergenDesign.OBSIDIAN_HAIRLINE, strokePx)
            }
            setPadding(dp(activity, 9f), dp(activity, 4f), dp(activity, 9f), dp(activity, 4f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissSheet(activity, state, animate = true)
            }
        }
        header.addView(closeBtn)
        innerCol.addView(header)

        innerCol.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, strokePx).apply {
                topMargin = dp(activity, 12f)
            }
        )

        // 1. Volume & Brightness Sliders
        val audio = activity.getSystemService(Context.AUDIO_SERVICE) as? AudioManager
        val maxVol = (audio?.getStreamMaxVolume(AudioManager.STREAM_MUSIC) ?: 15).coerceAtLeast(1)
        val curVol = audio?.getStreamVolume(AudioManager.STREAM_MUSIC) ?: 0
        val initVolNorm = (curVol.toFloat() / maxVol.toFloat()).coerceIn(0f, 1f)

        val volValueTv = TextView(activity).apply {
            text = "${(initVolNorm * 100).roundToInt()}%"
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
        }
        val volSlider = MergenSliderView(activity, initVolNorm, kyant0).apply {
            onProgressChanged = { p, _ ->
                val targetVol = (p * maxVol).roundToInt().coerceIn(0, maxVol)
                try {
                    audio?.setStreamVolume(AudioManager.STREAM_MUSIC, targetVol, 0)
                } catch (_: Throwable) {
                }
                volValueTv.text = "${(p * 100).roundToInt()}%"
            }
        }

        val win = activity.window
        val rawBright = win?.attributes?.screenBrightness ?: WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
        val isAutoBright = rawBright < 0f
        val initBright = if (isAutoBright) 0.55f else rawBright.coerceIn(0.05f, 1f)

        val brightValueTv = TextView(activity).apply {
            text = if (isAutoBright) MergenStrings.t(activity, "OTO", "AUTO") else "${(initBright * 100).roundToInt()}%"
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
        }
        val brightSlider = MergenSliderView(activity, initBright, kyant0).apply {
            onProgressChanged = { p, _ ->
                val b = p.coerceIn(0.04f, 1f)
                win?.let { w ->
                    w.attributes = w.attributes.apply { screenBrightness = b }
                }
                brightValueTv.text = "${(b * 100).roundToInt()}%"
            }
        }

        val slidersRow = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        slidersRow.addView(
            buildSliderBlock(
                activity,
                kyant0,
                MergenStrings.t(activity, "SES", "VOLUME"),
                volValueTv,
                volSlider,
                MergenStrings.t(activity, "[SESSİZ]", "[MUTE]"),
                strokePx
            ) {
                MergenHaptics.playTap(activity)
                try {
                    audio?.setStreamVolume(AudioManager.STREAM_MUSIC, 0, 0)
                } catch (_: Throwable) {
                }
                volSlider.progress = 0f
                volValueTv.text = "0%"
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 5f) }
        )
        slidersRow.addView(
            buildSliderBlock(
                activity,
                kyant0,
                MergenStrings.t(activity, "PARLAKLIK", "BRIGHTNESS"),
                brightValueTv,
                brightSlider,
                MergenStrings.t(activity, "[OTO]", "[AUTO]"),
                strokePx
            ) {
                MergenHaptics.playTap(activity)
                win?.let { w ->
                    w.attributes = w.attributes.apply {
                        screenBrightness = WindowManager.LayoutParams.BRIGHTNESS_OVERRIDE_NONE
                    }
                }
                brightSlider.progress = 0.55f
                brightValueTv.text = MergenStrings.t(activity, "OTO", "AUTO")
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 5f) }
        )
        innerCol.addView(
            slidersRow,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 14f)
                bottomMargin = dp(activity, 12f)
            }
        )

        // 2. 2x2 Quick Action Tiles (4th tile = instant Theme toggle!)
        val row1 = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        row1.addView(
            buildQuickTile(activity, kyant0, MergenStrings.t(activity, "HIZ / ALTYAZI", "SPEED / CAPTIONS"), active = false, strokePx = strokePx) {
                MergenHaptics.playTap(activity)
                dismissSheet(activity, state, animate = true)
                activity.window?.decorView?.let { d ->
                    TikTokViewResolver.findLongPressTarget(activity, d)?.performLongClick()
                }
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 5f) }
        )
        row1.addView(
            buildQuickTile(activity, kyant0, MergenStrings.t(activity, "TEMİZ EKRAN", "CLEAN SCREEN"), active = state.cleanScreen, strokePx = strokePx) {
                dismissSheet(activity, state, animate = true)
                toggleCleanScreen(activity)
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 5f) }
        )
        innerCol.addView(row1)

        val row2 = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        lateinit var autoTile: TextView
        autoTile = buildQuickTile(activity, kyant0, MergenStrings.t(activity, "OTO KAYDIR", "AUTO SCROLL"), active = MergenPrefs.isAutoScrollEnabled(activity), strokePx = strokePx) {
            val next = !MergenPrefs.isAutoScrollEnabled(activity)
            MergenPrefs.setAutoScrollEnabled(activity, next)
            MergenHaptics.playToggle(activity, next)
            styleQuickTileState(activity, autoTile, next, kyant0, strokePx)
            DynamicPillController.showStatus(
                activity,
                if (next) {
                    MergenStrings.t(activity, "OTO KAYDIR AÇIK", "AUTO SCROLL ON")
                } else {
                    MergenStrings.t(activity, "OTO KAYDIR KAPALI", "AUTO SCROLL OFF")
                }
            )
        }
        val themeLabel = if (kyant0) {
            MergenStrings.t(activity, "TEMA: KYANT0", "THEME: KYANT0")
        } else {
            MergenStrings.t(activity, "TEMA: MERGEN", "THEME: MERGEN")
        }
        val themeTile = buildQuickTile(activity, kyant0, themeLabel, active = kyant0, strokePx = strokePx) {
            val nextKyant = !MergenPrefs.isKyant0Style(activity)
            MergenPrefs.setKyant0Style(activity, nextKyant)
            MergenHaptics.playToggle(activity, nextKyant)
            dismissSheet(activity, state, animate = false)
            show(activity, state.backdropSource)
        }
        row2.addView(
            autoTile,
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 5f) }
        )
        row2.addView(
            themeTile,
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 5f) }
        )
        innerCol.addView(
            row2,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 8f)
            }
        )

        // 3. Settings CTA Button
        val settingsBtn = TextView(activity).apply {
            text = MergenStrings.t(activity, "MERGENV1 AYARLARI →", "MERGENV1 SETTINGS →")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12f)
            letterSpacing = 0.05f
            setTextColor(MergenDesign.OBSIDIAN_BG)
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, 15f)
                    setColor(Color.WHITE)
                }
            } else {
                MergenDesign.sharpBox(MergenDesign.OBSIDIAN_INK)
            }
            setPadding(dp(activity, 12f), dp(activity, 13f), dp(activity, 12f), dp(activity, 13f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                dismissSheet(activity, state, animate = false)
                MergenSettingsDialog.show(activity)
            }
        }
        innerCol.addView(
            settingsBtn,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 12f)
            }
        )

        sheetCard.addView(
            innerCol,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val enterStartY = if (MergenSpringEngine.isReducedMotion(activity)) 0f else dpF(activity, 120f)
        sheetCard.translationY = enterStartY
        sheetCard.alpha = if (MergenSpringEngine.isReducedMotion(activity)) 0f else 1f

        scrim.addView(
            sheetCard,
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT,
                Gravity.BOTTOM
            ).apply {
                val hMargin = dp(activity, 12f)
                leftMargin = hMargin
                rightMargin = hMargin
                bottomMargin = navInset + dp(activity, 10f)
            }
        )

        state.scrimOverlay = scrim
        content.addView(
            scrim,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        )

        if (MergenSpringEngine.isReducedMotion(activity)) {
            scrim.setBackgroundColor(Color.argb(baseScrimAlpha, 0, 0, 0))
            MergenSpringEngine.springPop(
                view = sheetCard,
                fromScaleX = 1f,
                fromScaleY = 1f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                maxBlurDp = 0f
            )
        } else {
            val enterDist = enterStartY.coerceAtLeast(1f)
            MergenSpringEngine.springTranslationY(
                view = sheetCard,
                targetY = 0f,
                dampingRatio = 0.86f,
                responseSec = 0.30f,
                maxBlurDp = 11f,
                onUpdate = { curY ->
                    val frac = (1f - (curY.coerceAtLeast(0f) / enterDist)).coerceIn(0f, 1f)
                    scrim.setBackgroundColor(Color.argb((baseScrimAlpha * frac).roundToInt(), 0, 0, 0))
                }
            )
        }
    }

    private fun removeScrimNow(scrim: FrameLayout?, state: QuickState?) {
        if (scrim == null) return
        if (scrim.childCount > 0) {
            val child = scrim.getChildAt(0)
            MergenSpringEngine.cancelViewSprings(child)
            MergenMotionBlur.clear(child)
        }
        if (state != null) {
            if (state.scrimOverlay === scrim) state.scrimOverlay = null
            if (state.dismissingScrim === scrim) state.dismissingScrim = null
        }
        (scrim.parent as? ViewGroup)?.removeView(scrim)
    }

    private fun dismissSheet(
        activity: Activity,
        state: QuickState,
        animate: Boolean,
        initialVelocityPxPerSec: Float? = null
    ) {
        val scrim = state.scrimOverlay ?: return
        if (!animate) {
            dismissSheetImmediate(state)
            return
        }
        scrim.setTag(TAG_SHEET_DISMISSING, true)
        scrim.isClickable = false
        scrim.setOnClickListener(null)

        val sheet = if (scrim.childCount > 0) scrim.getChildAt(0) else null
        state.scrimOverlay = null

        val prevDismissing = state.dismissingScrim
        if (prevDismissing != null && prevDismissing !== scrim) {
            removeScrimNow(prevDismissing, state)
        }
        state.dismissingScrim = scrim

        if (sheet == null) {
            removeScrimNow(scrim, state)
            return
        }

        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val baseScrimAlpha = if (kyant0) 80 else 148
        var finished = false
        lateinit var finishRemove: Runnable
        finishRemove = Runnable {
            if (finished) return@Runnable
            finished = true
            mainHandler.removeCallbacks(finishRemove)
            removeScrimNow(scrim, state)
        }
        mainHandler.postDelayed(finishRemove, 450L)

        MergenSpringEngine.cancelViewSprings(sheet)

        if (MergenSpringEngine.isReducedMotion(activity)) {
            scrim.setBackgroundColor(Color.argb(0, 0, 0, 0))
            MergenSpringEngine.springPop(
                view = sheet,
                fromScaleX = sheet.scaleX,
                fromScaleY = sheet.scaleY,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = sheet.alpha,
                toAlpha = 0f,
                maxBlurDp = 0f,
                onEnd = { finishRemove.run() }
            )
            return
        }

        val targetExitY = (sheet.height.toFloat() + dpF(activity, 48f)).coerceAtLeast(dpF(activity, 260f))
        val startY = sheet.translationY.coerceAtLeast(0f)
        val totalSpan = (targetExitY - startY).coerceAtLeast(1f)
        MergenSpringEngine.springTranslationY(
            view = sheet,
            targetY = targetExitY,
            initialVelocityPxPerSec = initialVelocityPxPerSec,
            dampingRatio = 0.98f,
            responseSec = 0.20f,
            maxBlurDp = 10f,
            onUpdate = { curY ->
                val frac = ((targetExitY - curY) / totalSpan).coerceIn(0f, 1f)
                scrim.setBackgroundColor(Color.argb((baseScrimAlpha * frac).roundToInt(), 0, 0, 0))
                sheet.alpha = frac
            },
            onEnd = { finishRemove.run() }
        )
    }

    private fun dismissSheetImmediate(state: QuickState) {
        val current = state.scrimOverlay
        val closing = state.dismissingScrim
        state.scrimOverlay = null
        state.dismissingScrim = null
        removeScrimNow(current, state)
        if (closing !== current) {
            removeScrimNow(closing, state)
        }
    }

    private fun showCleanRestorePill(activity: Activity, state: QuickState) {
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val decor = activity.window?.decorView ?: content
        val navInset = TikTokViewResolver.navBarBottomInset(decor)
        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val strokePx = dp(activity, 1f).coerceAtLeast(1)

        content.post {
            if (activity.isFinishing || activity.isDestroyed || !state.cleanScreen) return@post
            state.cleanRestorePill?.let { existing ->
                (existing.parent as? ViewGroup)?.removeView(existing)
            }

            val row = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                setPadding(dp(activity, 14f), dp(activity, 8f), dp(activity, 14f), dp(activity, 8f))
            }
            val rSize = dp(activity, 14f)
            row.addView(
                MergenReticleView(activity, MergenDesign.OBSIDIAN_INK),
                LinearLayout.LayoutParams(rSize, rSize).apply { rightMargin = dp(activity, 8f) }
            )
            row.addView(TextView(activity).apply {
                text = MergenStrings.t(activity, "TEMİZ EKRAN [×]", "CLEAN SCREEN [×]")
                typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f)
                setTextColor(MergenDesign.OBSIDIAN_INK)
            })

            val pill: ViewGroup = if (kyant0) {
                KyantGlassSurfaceView(
                    context = activity,
                    backdropSource = state.backdropSource ?: findFallbackBackdrop(activity),
                    isCapsule = true,
                    blurRadiusDp = 8f,
                    refractionHeightDp = 14f,
                    refractionAmountDp = 14f,
                    forceDarkGlass = true
                )
            } else {
                FrameLayout(activity).apply {
                    background = MergenDesign.sharpBox(MergenDesign.OBSIDIAN_BG, MergenDesign.OBSIDIAN_BORDER, strokePx)
                }
            }
            pill.setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
            pill.elevation = dpF(activity, 10f)
            pill.isClickable = true
            pill.isFocusable = true
            pill.addView(row)
            attachPressScale(pill)
            pill.setOnClickListener { toggleCleanScreen(activity) }

            state.cleanRestorePill = pill
            content.addView(
                pill,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.BOTTOM or Gravity.CENTER_HORIZONTAL
                ).apply {
                    bottomMargin = navInset + dp(activity, 16f)
                }
            )
            MergenSpringEngine.springPop(
                view = pill,
                fromScaleX = 0.72f,
                fromScaleY = 0.72f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                dampingRatioX = 0.78f,
                responseX = 0.25f,
                dampingRatioY = 0.78f,
                responseY = 0.25f,
                maxBlurDp = 6f
            )
        }
    }

    private fun removeCleanRestorePill(activity: Activity, state: QuickState) {
        val pill = state.cleanRestorePill ?: return
        state.cleanRestorePill = null
        val parent = pill.parent as? ViewGroup ?: return
        parent.post {
            if (!activity.isDestroyed && pill.parent === parent) {
                parent.removeView(pill)
            }
        }
    }

    private fun findFallbackBackdrop(activity: Activity): View? {
        val decor = activity.window?.decorView ?: return null
        val host = TikTokViewResolver.findFragmentTabHost(decor) ?: return null
        val tabContainer = TikTokViewResolver.findTabContainer(activity, host) ?: return null
        val barParent = tabContainer.parent as? ViewGroup ?: return null
        return TikTokViewResolver.findBackdropSource(activity, barParent, tabContainer)
    }

    private fun buildSliderBlock(
        activity: Activity,
        kyant0: Boolean,
        label: String,
        valueTv: TextView,
        slider: MergenSliderView,
        actionLabel: String,
        strokePx: Int,
        onAction: () -> Unit
    ): LinearLayout {
        val col = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, 15f)
                    setColor(Color.argb(30, 255, 255, 255))
                    setStroke(strokePx, Color.argb(56, 255, 255, 255))
                }
            } else {
                MergenDesign.sharpBox(MergenDesign.OBSIDIAN_SURFACE, MergenDesign.OBSIDIAN_HAIRLINE, strokePx)
            }
            setPadding(dp(activity, 11f), dp(activity, 10f), dp(activity, 11f), dp(activity, 10f))
        }

        val topRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }
        topRow.addView(
            TextView(activity).apply {
                text = label
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(MergenDesign.OBSIDIAN_MUTED)
                letterSpacing = 0.05f
            },
            LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        )
        topRow.addView(
            valueTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                rightMargin = dp(activity, 6f)
            }
        )
        topRow.addView(TextView(activity).apply {
            text = actionLabel
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, 8f)
                    setColor(Color.argb(44, 255, 255, 255))
                }
            } else {
                MergenDesign.sharpBox(MergenDesign.OBSIDIAN_ELEVATED, MergenDesign.OBSIDIAN_HAIRLINE, strokePx)
            }
            setPadding(dp(activity, 5f), dp(activity, 2f), dp(activity, 5f), dp(activity, 2f))
            setOnClickListener { onAction() }
        })
        col.addView(topRow)

        col.addView(
            slider,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, dp(activity, 24f)).apply {
                topMargin = dp(activity, 6f)
            }
        )
        return col
    }

    private fun buildQuickTile(
        activity: Activity,
        kyant0: Boolean,
        label: String,
        active: Boolean,
        strokePx: Int,
        onClick: () -> Unit
    ): TextView = TextView(activity).apply {
        text = label
        gravity = Gravity.CENTER
        typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
        setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
        styleQuickTileState(activity, this, active, kyant0, strokePx)
        setPadding(dp(activity, 8f), dp(activity, 12f), dp(activity, 8f), dp(activity, 12f))
        attachPressScale(this)
        setOnClickListener { onClick() }
    }

    private fun styleQuickTileState(
        activity: Activity,
        view: TextView,
        active: Boolean,
        kyant0: Boolean,
        strokePx: Int
    ) {
        if (kyant0) {
            view.background = GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                cornerRadius = dpF(activity, 14f)
                setColor(if (active) Color.argb(150, 52, 199, 89) else Color.argb(38, 255, 255, 255))
                setStroke(strokePx, if (active) Color.argb(200, 120, 235, 148) else Color.argb(65, 255, 255, 255))
            }
            view.setTextColor(Color.WHITE)
        } else {
            if (active) {
                view.background = MergenDesign.sharpBox(MergenDesign.OBSIDIAN_INK, MergenDesign.OBSIDIAN_INK, strokePx)
                view.setTextColor(MergenDesign.OBSIDIAN_BG)
            } else {
                view.background = MergenDesign.sharpBox(
                    MergenDesign.OBSIDIAN_SURFACE,
                    Color.argb(64, 255, 255, 255),
                    strokePx
                )
                view.setTextColor(MergenDesign.OBSIDIAN_INK)
            }
        }
    }

    private fun attachPressScale(view: View) {
        MergenSpringEngine.attachSpringPress(view, pressedScale = 0.94f)
    }

    private fun applyCleanScreenAlpha(activity: Activity, enableClean: Boolean) {
        val decor = activity.window?.decorView ?: return
        val targetAlpha = if (enableClean) 0f else 1f

        TikTokViewResolver.findTopTabsHeader(activity, decor)?.let { topTabs ->
            topTabs.animate().alpha(targetAlpha).setDuration(200L).start()
        }
        val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
        val zuf = activeWidget?.let { TikTokViewResolver.findViewByIdName(activity, it, "zuf") }
        zuf?.animate()?.alpha(targetAlpha)?.setDuration(200L)?.start()

        val host = TikTokViewResolver.findFragmentTabHost(decor) ?: return
        val tabContainer = TikTokViewResolver.findTabContainer(activity, host) ?: return
        val barParent = tabContainer.parent as? ViewGroup ?: return
        tabContainer.animate().alpha(targetAlpha).setDuration(200L).start()
        for (i in 0 until barParent.childCount) {
            val c = barParent.getChildAt(i)
            if (c.getTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW) == true) {
                c.animate().alpha(targetAlpha).setDuration(200L).start()
            }
        }
    }

    private fun ensureAutoScrollLoop(activity: Activity, state: QuickState) {
        autoScrollRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val r = object : Runnable {
            override fun run() {
                if (states[activity] !== state || activity.isFinishing || activity.isDestroyed) return
                if (MergenPrefs.isModEffectivelyActive(activity) && MergenPrefs.isAutoScrollEnabled(activity)) {
                    checkAndAutoScroll(activity, state)
                }
                mainHandler.postDelayed(this, 450L)
            }
        }
        autoScrollRunnables[activity] = r
        mainHandler.postDelayed(r, 600L)
    }

    private fun checkAndAutoScroll(activity: Activity, state: QuickState) {
        if (state.scrimOverlay != null || PeekSheetAndProfileController.isInPeekState(activity)) return
        val now = System.currentTimeMillis()
        if (now - state.lastAutoScrollAtMs < 3500L) return
        val decor = activity.window?.decorView ?: return
        val host = TikTokViewResolver.findFragmentTabHost(decor) ?: return
        val tabContainer = TikTokViewResolver.findTabContainer(activity, host) ?: return
        if (!TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer)) return
        val barParent = tabContainer.parent as? ViewGroup ?: return
        val seekContainer = TikTokViewResolver.findVideoSeekBar(activity, barParent) ?: return
        val seekBar = findSeekBarRecursive(seekContainer) ?: return
        if (seekBar.max > 0 && seekBar.progress >= (seekBar.max * 0.97f).roundToInt()) {
            state.lastAutoScrollAtMs = now
            MergenHaptics.playSnap(activity)
            DynamicPillController.showStatus(
                activity,
                MergenStrings.t(activity, "SONRAKİ VİDEO", "NEXT VIDEO"),
                1200L
            )
            dispatchVerticalNextVideoSwipe(decor)
        }
    }

    private fun findSeekBarRecursive(view: View): SeekBar? {
        if (view is SeekBar && view.max > 0) return view
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findSeekBarRecursive(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    private fun dispatchVerticalNextVideoSwipe(decor: View) {
        val w = decor.width.toFloat()
        val h = decor.height.toFloat()
        if (w <= 0f || h <= 0f) return
        val x = w * 0.5f
        val startY = h * 0.72f
        val endY = h * 0.22f
        val downTime = SystemClock.uptimeMillis()

        val down = MotionEvent.obtain(downTime, downTime, MotionEvent.ACTION_DOWN, x, startY, 0)
        decor.dispatchTouchEvent(down)
        down.recycle()

        val steps = 8
        for (i in 1..steps) {
            val t = i.toFloat() / steps.toFloat()
            val curY = startY + (endY - startY) * t
            val ev = MotionEvent.obtain(downTime, downTime + i * 16L, MotionEvent.ACTION_MOVE, x, curY, 0)
            decor.dispatchTouchEvent(ev)
            ev.recycle()
        }

        val up = MotionEvent.obtain(downTime, downTime + (steps + 1) * 16L, MotionEvent.ACTION_UP, x, endY, 0)
        decor.dispatchTouchEvent(up)
        up.recycle()
    }
}
