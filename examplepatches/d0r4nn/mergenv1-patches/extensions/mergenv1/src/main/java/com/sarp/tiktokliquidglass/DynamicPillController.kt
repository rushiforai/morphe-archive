package com.sarp.tiktokliquidglass

import android.animation.ValueAnimator
import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Typeface
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.text.TextUtils
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import java.util.WeakHashMap
import kotlin.math.abs
import kotlin.math.roundToInt

/**
 * Animated 3-bar audio/activity equalizer pulse inside Dynamic Notifications.
 */
class AudioPulseView(context: Context) : View(context) {

    private var phase = 0f
    private var animator: ValueAnimator? = null
    private val paint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.WHITE
        style = Paint.Style.FILL
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        startAnim()
    }

    override fun onDetachedFromWindow() {
        animator?.cancel()
        animator = null
        super.onDetachedFromWindow()
    }

    private fun startAnim() {
        if (animator != null) return
        animator = ValueAnimator.ofFloat(0f, (Math.PI * 2.0).toFloat()).apply {
            duration = 1400L
            repeatCount = ValueAnimator.INFINITE
            addUpdateListener {
                phase = it.animatedValue as Float
                invalidate()
            }
            start()
        }
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return

        val barW = (w / 5f).coerceAtLeast(2f)
        val gap = (w - barW * 3f) / 2f

        val h0 = h * (0.35f + 0.50f * abs(kotlin.math.sin(phase.toDouble())).toFloat())
        val h1 = h * (0.45f + 0.52f * abs(kotlin.math.sin((phase + 1.1f).toDouble())).toFloat())
        val h2 = h * (0.32f + 0.50f * abs(kotlin.math.sin((phase + 2.2f).toDouble())).toFloat())

        val heights = floatArrayOf(h0, h1, h2)
        for (i in 0..2) {
            val left = i * (barW + gap)
            val bh = heights[i]
            val top = (h - bh) * 0.5f
            canvas.drawRect(left, top, left + barW, top + bh, paint)
        }
    }
}

/**
 * Draggable monochrome punch-hole camera reticle used in the Camera Position Calibrator.
 */
private class CameraTargetView(context: Context) : View(context) {
    private val fillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.argb(180, 0, 0, 0)
        style = Paint.Style.FILL
    }
    private val ringPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.WHITE
        style = Paint.Style.STROKE
        strokeWidth = MergenDesign.dpF(context, 2f).coerceAtLeast(2f)
    }
    private val crossPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.argb(200, 255, 255, 255)
        style = Paint.Style.STROKE
        strokeWidth = MergenDesign.dpF(context, 1f).coerceAtLeast(1f)
    }

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return
        val cx = w * 0.5f
        val cy = h * 0.5f
        val r = (minOf(w, h) * 0.5f) - ringPaint.strokeWidth
        canvas.drawCircle(cx, cy, r, fillPaint)
        canvas.drawCircle(cx, cy, r, ringPaint)
        canvas.drawLine(cx - r * 0.55f, cy, cx + r * 0.55f, cy, crossPaint)
        canvas.drawLine(cx, cy - r * 0.55f, cx, cy + r * 0.55f, crossPaint)
    }
}

/**
 * Event-Driven Dynamic Notifications + First-Run Camera Position Calibrator.
 * - Occupies ZERO screen space (View.GONE) during normal browsing.
 * - Expands directly from the user's calibrated front-camera punch-hole on real events:
 *   new inbox messages/notifications, 20-minute nudge reminders, action feedback, or test ping.
 * - Supports both Mergen Swiss-Kinetic Obsidian and Kyant0 Liquid Glass styles.
 */
object DynamicPillController {

    private const val TAG = "TikTokLiquidGlass"
    private const val NUDGE_INTERVAL_MS = 20L * 60_000L

    private class NotifState(
        val hostRoot: FrameLayout,
        var tabContainer: ViewGroup,
        var backdropSource: View?,
        var cardView: ViewGroup? = null,
        var cardThemeKyant0: Boolean? = null,
        var titleTv: TextView? = null,
        var subTv: TextView? = null,
        var onTapAction: (() -> Unit)? = null,
        var showing: Boolean = false,
        var notifEpoch: Int = 0,
        var lastUnreadCount: Int = -1,
        var lastNudgeAtMs: Long = System.currentTimeMillis(),
        var calibratorOverlay: FrameLayout? = null,
        var calibratorPromptedThisSession: Boolean = false
    )

    private val states = WeakHashMap<Activity, NotifState>()
    private val mainHandler = Handler(Looper.getMainLooper())
    private val pollRunnables = WeakHashMap<Activity, Runnable>()
    private val autoHideRunnables = WeakHashMap<Activity, Runnable>()

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun attach(activity: Activity, tabContainer: ViewGroup, backdropSource: View? = null) {
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val existing = states[activity]
        if (existing != null) {
            existing.tabContainer = tabContainer
            if (backdropSource != null) {
                existing.backdropSource = backdropSource
                (existing.cardView as? KyantGlassSurfaceView)?.setBackdropSource(backdropSource)
            }
            if (existing.hostRoot.parent !== content) {
                content.post {
                    if (activity.isFinishing || activity.isDestroyed || states[activity] !== existing) return@post
                    (existing.hostRoot.parent as? ViewGroup)?.removeView(existing.hostRoot)
                    content.addView(
                        existing.hostRoot,
                        FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            ViewGroup.LayoutParams.WRAP_CONTENT,
                            Gravity.TOP or Gravity.START
                        )
                    )
                }
            }
            scheduleFirstRunCalibrationCheck(activity, existing)
            return
        }

        val hostRoot = FrameLayout(activity).apply {
            setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
            visibility = View.GONE
            elevation = dpF(activity, 20f)
        }
        val state = NotifState(
            hostRoot = hostRoot,
            tabContainer = tabContainer,
            backdropSource = backdropSource
        )
        states[activity] = state

        content.post {
            if (activity.isFinishing || activity.isDestroyed || states[activity] !== state) return@post
            if (state.hostRoot.parent == null) {
                content.addView(
                    state.hostRoot,
                    FrameLayout.LayoutParams(
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        ViewGroup.LayoutParams.WRAP_CONTENT,
                        Gravity.TOP or Gravity.START
                    )
                )
            }
            startPolling(activity, state)
            scheduleFirstRunCalibrationCheck(activity, state)
        }
    }

    fun sync(activity: Activity, backdropSource: View? = null) {
        val state = states[activity] ?: return
        if (backdropSource != null) {
            state.backdropSource = backdropSource
            (state.cardView as? KyantGlassSurfaceView)?.setBackdropSource(backdropSource)
        }
        if (state.showing && state.cardThemeKyant0 != MergenPrefs.isKyant0Style(activity)) {
            val title = state.titleTv?.text?.toString().orEmpty()
            val sub = state.subTv?.text?.toString()?.takeIf { state.subTv?.visibility == View.VISIBLE }
            if (title.isNotEmpty()) {
                showNotification(activity, title, sub, 2500L, state.onTapAction)
            }
        }
    }

    @Suppress("UNUSED_PARAMETER")
    fun onTabChanged(activity: Activity, tabIndex: Int) {
        // Dynamic Notifications work across all tabs independent of TikTok's top bars
    }

    fun detach(activity: Activity) {
        pollRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        autoHideRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val state = states.remove(activity) ?: return
        state.calibratorOverlay?.let { ov ->
            (ov.parent as? ViewGroup)?.post {
                if (ov.parent != null) (ov.parent as ViewGroup).removeView(ov)
            }
        }
        val parent = state.hostRoot.parent as? ViewGroup ?: return
        parent.post {
            if (state.hostRoot.parent === parent) {
                parent.removeView(state.hostRoot)
            }
        }
    }

    fun isCalibrating(activity: Activity): Boolean =
        states[activity]?.calibratorOverlay != null

    fun dismissCalibrator(activity: Activity) {
        val state = states[activity] ?: return
        val ov = state.calibratorOverlay ?: return
        state.calibratorOverlay = null
        for (i in 0 until ov.childCount) {
            MergenMotionBlur.clear(ov.getChildAt(i))
        }
        (ov.parent as? ViewGroup)?.post {
            if (ov.parent != null) (ov.parent as ViewGroup).removeView(ov)
        }
    }

    fun showStatus(activity: Activity, message: String, durationMs: Long = 2400L) {
        showNotification(activity, message, null, durationMs, null)
    }

    fun showTestNotification(activity: Activity) {
        showNotification(
            activity = activity,
            title = MergenStrings.t(activity, "MERGEN DİNAMİK BİLDİRİM", "MERGEN DYNAMIC PILL"),
            subtitle = MergenStrings.t(
                activity,
                "Kamera noktasından bildirim önizlemesi aktif",
                "Camera notch notification preview active"
            ),
            durationMs = 3600L,
            onTap = null
        )
    }

    fun showNotification(
        activity: Activity,
        title: String,
        subtitle: String? = null,
        durationMs: Long = 3600L,
        onTap: (() -> Unit)? = null
    ) {
        if (activity.isFinishing || activity.isDestroyed) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || !MergenPrefs.isDynamicPillEnabled(activity)) return

        val state = states[activity] ?: return
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return

        content.post {
            if (activity.isFinishing || activity.isDestroyed || states[activity] !== state) return@post
            presentNotificationOnMain(activity, state, title, subtitle, durationMs, onTap)
        }
    }

    private fun presentNotificationOnMain(
        activity: Activity,
        state: NotifState,
        title: String,
        subtitle: String?,
        durationMs: Long,
        onTap: (() -> Unit)?
    ) {
        val kyant0 = MergenPrefs.isKyant0Style(activity)
        if (state.cardView == null || state.cardThemeKyant0 != kyant0) {
            buildNotificationCard(activity, state, kyant0)
        }

        state.titleTv?.text = title
        val subTv = state.subTv
        if (subTv != null) {
            if (!subtitle.isNullOrBlank()) {
                subTv.text = subtitle
                subTv.visibility = View.VISIBLE
            } else {
                subTv.visibility = View.GONE
            }
        }
        state.onTapAction = onTap

        val screenW = activity.resources.displayMetrics.widthPixels
        val camCenterX = screenW * MergenPrefs.getCameraXFraction(activity)
        val camCenterY = dpF(activity, MergenPrefs.getCameraYDp(activity)) +
            dpF(activity, MergenPrefs.getCameraSizeDp(activity)) * 0.5f

        val maxBoxW = (screenW - dp(activity, 24f)).coerceAtLeast(dp(activity, 200f))
        state.hostRoot.measure(
            View.MeasureSpec.makeMeasureSpec(maxBoxW, View.MeasureSpec.AT_MOST),
            View.MeasureSpec.makeMeasureSpec(0, View.MeasureSpec.UNSPECIFIED)
        )
        val boxW = state.hostRoot.measuredWidth.coerceAtLeast(dp(activity, 140f))
        val desiredLeft = (camCenterX - boxW * 0.5f).roundToInt()
            .coerceIn(dp(activity, 12f), (screenW - boxW - dp(activity, 12f)).coerceAtLeast(dp(activity, 12f)))
        val desiredTop = dp(activity, MergenPrefs.getCameraYDp(activity) + MergenPrefs.getCameraSizeDp(activity) + 8f)

        val lp = (state.hostRoot.layoutParams as? FrameLayout.LayoutParams) ?: FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.TOP or Gravity.START
        )
        lp.gravity = Gravity.TOP or Gravity.START
        lp.leftMargin = desiredLeft
        lp.topMargin = desiredTop
        state.hostRoot.layoutParams = lp

        state.notifEpoch++
        val epoch = state.notifEpoch
        state.showing = true
        state.hostRoot.animate().cancel()
        MergenSpringEngine.cancelViewSprings(state.hostRoot)
        MergenMotionBlur.clear(state.hostRoot)
        state.hostRoot.visibility = View.VISIBLE
        state.hostRoot.pivotX = (camCenterX - desiredLeft).coerceIn(0f, boxW.toFloat())
        state.hostRoot.pivotY = (camCenterY - desiredTop).coerceIn(-dpF(activity, 24f), 20f)
        state.hostRoot.translationY = 0f

        Log.i(TAG, "DynamicNotif show: '$title' kyant0=$kyant0 at ($desiredLeft, $desiredTop)")

        if (MergenSpringEngine.isReducedMotion(activity)) {
            MergenSpringEngine.springPop(
                view = state.hostRoot,
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
                view = state.hostRoot,
                fromScaleX = 0.30f,
                fromScaleY = 0.18f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                dampingRatioX = 0.78f,
                responseX = 0.25f,
                dampingRatioY = 0.84f,
                responseY = 0.34f,
                maxBlurDp = 7f
            )
        }

        autoHideRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val hideTask = Runnable {
            if (state.notifEpoch == epoch && state.showing) {
                hideNotification(activity, state, swipeUp = false)
            }
        }
        autoHideRunnables[activity] = hideTask
        mainHandler.postDelayed(hideTask, durationMs)
    }

    private fun hideNotification(
        activity: Activity,
        state: NotifState,
        swipeUp: Boolean,
        initialVelocityPxPerSec: Float? = null
    ) {
        if (!state.showing) return
        state.showing = false
        autoHideRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val epoch = state.notifEpoch

        state.hostRoot.animate().cancel()
        val finishCleanup = {
            if (state.notifEpoch == epoch && !state.showing) {
                state.hostRoot.visibility = View.GONE
                state.hostRoot.translationY = 0f
                state.hostRoot.scaleX = 1f
                state.hostRoot.scaleY = 1f
                state.hostRoot.alpha = 1f
            }
        }
        if (MergenSpringEngine.isReducedMotion(activity)) {
            MergenSpringEngine.springPop(
                view = state.hostRoot,
                fromScaleX = state.hostRoot.scaleX,
                fromScaleY = state.hostRoot.scaleY,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = state.hostRoot.alpha,
                toAlpha = 0f,
                maxBlurDp = 0f,
                onEnd = finishCleanup
            )
            return
        }
        if (swipeUp) {
            val exitDist = dpF(activity, 52f).coerceAtLeast(1f)
            MergenSpringEngine.springTranslationY(
                view = state.hostRoot,
                targetY = -exitDist,
                initialVelocityPxPerSec = initialVelocityPxPerSec,
                dampingRatio = 0.96f,
                responseSec = 0.20f,
                maxBlurDp = 9f,
                onUpdate = { curY ->
                    state.hostRoot.alpha = (1f - ((-curY).coerceAtLeast(0f) / exitDist)).coerceIn(0f, 1f)
                },
                onEnd = finishCleanup
            )
        } else {
            MergenSpringEngine.springPop(
                view = state.hostRoot,
                fromScaleX = state.hostRoot.scaleX,
                fromScaleY = state.hostRoot.scaleY,
                toScaleX = 0.30f,
                toScaleY = 0.20f,
                fromAlpha = state.hostRoot.alpha,
                toAlpha = 0f,
                dampingRatioX = 0.96f,
                responseX = 0.18f,
                dampingRatioY = 0.96f,
                responseY = 0.18f,
                maxBlurDp = 6f,
                onEnd = finishCleanup
            )
        }
    }

    private fun buildNotificationCard(activity: Activity, state: NotifState, kyant0: Boolean) {
        state.hostRoot.removeAllViews()
        val strokePx = dp(activity, 1f).coerceAtLeast(1)

        val surface: ViewGroup = if (kyant0) {
            KyantGlassSurfaceView(
                context = activity,
                backdropSource = state.backdropSource,
                cornerRadiusDp = 24f,
                isCapsule = false,
                blurRadiusDp = 10f,
                refractionHeightDp = 16f,
                refractionAmountDp = 18f,
                forceDarkGlass = true
            )
        } else {
            FrameLayout(activity).apply {
                background = MergenDesign.sharpBox(
                    fillColor = Color.argb(242, 0, 0, 0),
                    strokeColor = MergenDesign.OBSIDIAN_BORDER,
                    strokePx = strokePx
                )
            }
        }

        val row = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(dp(activity, 12f), dp(activity, 9f), dp(activity, 14f), dp(activity, 9f))
        }

        if (kyant0) {
            row.addView(
                AudioPulseView(activity),
                LinearLayout.LayoutParams(dp(activity, 14f), dp(activity, 14f)).apply {
                    rightMargin = dp(activity, 9f)
                }
            )
        } else {
            row.addView(
                MergenReticleView(activity, Color.WHITE),
                LinearLayout.LayoutParams(dp(activity, 16f), dp(activity, 16f)).apply {
                    rightMargin = dp(activity, 9f)
                }
            )
        }

        val textCol = LinearLayout(activity).apply { orientation = LinearLayout.VERTICAL }
        val titleTv = TextView(activity).apply {
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11.5f)
            setTextColor(Color.WHITE)
            maxLines = 1
            isSingleLine = true
            ellipsize = TextUtils.TruncateAt.END
            maxWidth = dp(activity, 240f)
        }
        val subTv = TextView(activity).apply {
            typeface = if (kyant0) Typeface.SANS_SERIF else Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(Color.argb(190, 255, 255, 255))
            maxLines = 1
            isSingleLine = true
            ellipsize = TextUtils.TruncateAt.END
            maxWidth = dp(activity, 240f)
            visibility = View.GONE
        }
        textCol.addView(titleTv)
        textCol.addView(subTv)
        row.addView(textCol)

        surface.addView(
            row,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        // Swipe-up flick dismiss + tap action
        val touchSlop = ViewConfiguration.get(activity).scaledTouchSlop.toFloat()
        var downY = 0f
        var downX = 0f
        var draggingUp = false
        var tracker: VelocityTracker? = null

        surface.setOnTouchListener { _, ev ->
            when (ev.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    downX = ev.rawX
                    downY = ev.rawY
                    draggingUp = false
                    MergenSpringEngine.cancelTranslationY(state.hostRoot)
                    tracker?.recycle()
                    tracker = VelocityTracker.obtain().apply { addMovement(ev) }
                    true
                }
                MotionEvent.ACTION_MOVE -> {
                    tracker?.addMovement(ev)
                    val dy = ev.rawY - downY
                    if (!draggingUp && abs(dy) > touchSlop && abs(dy) > abs(ev.rawX - downX)) {
                        draggingUp = true
                    }
                    if (draggingUp) {
                        val appliedY = if (dy < 0f) {
                            dy * 0.85f
                        } else {
                            MergenSpringEngine.rubberband(dy, dpF(activity, 48f), 0.45f)
                        }
                        state.hostRoot.translationY = appliedY
                        tracker?.computeCurrentVelocity(1000)
                        MergenMotionBlur.applyDragVelocityBlur(
                            state.hostRoot,
                            0f,
                            tracker?.yVelocity ?: 0f,
                            maxBlurDp = 7f
                        )
                    }
                    true
                }
                MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                    tracker?.computeCurrentVelocity(1000)
                    val vy = tracker?.yVelocity ?: 0f
                    tracker?.recycle()
                    tracker = null
                    MergenMotionBlur.clear(state.hostRoot)
                    val dy = ev.rawY - downY
                    val dx = ev.rawX - downX
                    val projected = MergenSpringEngine.projectMomentum(state.hostRoot.translationY, vy)
                    if (draggingUp && (vy < -600f || dy < -dpF(activity, 24f) || projected < -dpF(activity, 34f))) {
                        MergenHaptics.playTick(activity)
                        hideNotification(activity, state, swipeUp = true, initialVelocityPxPerSec = vy)
                    } else if (draggingUp) {
                        MergenSpringEngine.springTranslationY(
                            view = state.hostRoot,
                            targetY = 0f,
                            initialVelocityPxPerSec = vy,
                            dampingRatio = 0.84f,
                            responseSec = 0.24f,
                            maxBlurDp = 7f
                        )
                    } else if (ev.actionMasked == MotionEvent.ACTION_UP &&
                        abs(dx) <= touchSlop && abs(dy) <= touchSlop
                    ) {
                        MergenHaptics.playTap(activity)
                        val action = state.onTapAction
                        hideNotification(activity, state, swipeUp = false)
                        action?.invoke()
                    }
                    draggingUp = false
                    true
                }
                else -> false
            }
        }

        state.cardView = surface
        state.cardThemeKyant0 = kyant0
        state.titleTv = titleTv
        state.subTv = subTv
        state.hostRoot.addView(
            surface,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )
    }

    private fun scheduleFirstRunCalibrationCheck(activity: Activity, state: NotifState) {
        if (state.calibratorPromptedThisSession) return
        if (MergenPrefs.isCameraCalibrated(activity)) return
        if (TikTokViewResolver.isSettingsActivity(activity)) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || !MergenPrefs.isDynamicPillEnabled(activity)) return

        state.calibratorPromptedThisSession = true
        mainHandler.postDelayed({
            if (!activity.isFinishing && !activity.isDestroyed &&
                MergenPrefs.isModEffectivelyActive(activity) &&
                MergenPrefs.isDynamicPillEnabled(activity) &&
                !MergenPrefs.isCameraCalibrated(activity) &&
                states[activity] === state
            ) {
                showCameraCalibrator(activity)
            }
        }, 1200L)
    }

    fun showCameraCalibrator(activity: Activity) {
        if (activity.isFinishing || activity.isDestroyed) return
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val state = states.getOrPut(activity) {
            val decor = activity.window?.decorView
            val host = decor?.let { TikTokViewResolver.findFragmentTabHost(it) }
            val tc = host?.let { TikTokViewResolver.findTabContainer(activity, it) } ?: FrameLayout(activity)
            NotifState(
                hostRoot = FrameLayout(activity).apply {
                    setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                    visibility = View.GONE
                },
                tabContainer = tc,
                backdropSource = null
            )
        }

        content.post {
            if (activity.isFinishing || activity.isDestroyed) return@post
            dismissCalibrator(activity)

            val kyant0 = MergenPrefs.isKyant0Style(activity)
            val dm = activity.resources.displayMetrics
            val screenW = dm.widthPixels
            val decor = activity.window?.decorView ?: content
            val navInset = TikTokViewResolver.navBarBottomInset(decor)
            val strokePx = dp(activity, 1f).coerceAtLeast(1)

            var curXFrac = MergenPrefs.getCameraXFraction(activity)
            var curYDp = MergenPrefs.getCameraYDp(activity)
            var curSizeDp = MergenPrefs.getCameraSizeDp(activity)

            val overlay = FrameLayout(activity).apply {
                setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                setBackgroundColor(Color.argb(115, 0, 0, 0))
                isClickable = true
                isFocusable = true
                elevation = dpF(activity, 24f)
            }

            val targetRing = CameraTargetView(activity)
            val infoTv = TextView(activity).apply {
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(Color.WHITE)
                gravity = Gravity.CENTER
            }

            val updateTargetGeometry = {
                val sizePx = dp(activity, curSizeDp)
                val cx = (curXFrac * screenW).roundToInt()
                val topPx = dp(activity, curYDp)
                val lp = FrameLayout.LayoutParams(sizePx, sizePx, Gravity.TOP or Gravity.START).apply {
                    leftMargin = (cx - sizePx / 2).coerceIn(0, (screenW - sizePx).coerceAtLeast(0))
                    topMargin = topPx.coerceIn(0, dp(activity, 120f))
                }
                targetRing.layoutParams = lp
                val diaLabel = MergenStrings.t(activity, "ÇAP", "DIA")
                infoTv.text = "X: ${(curXFrac * 100f).roundToInt()}%  •  Y: ${curYDp.roundToInt()}dp  •  $diaLabel: ${curSizeDp.roundToInt()}dp"
            }
            overlay.addView(targetRing)
            updateTargetGeometry()

            // Allow dragging target ring OR dragging anywhere in upper half of calibrator
            var dragStartRawX = 0f
            var dragStartRawY = 0f
            var startXFrac = curXFrac
            var startYDp = curYDp
            overlay.setOnTouchListener { _, ev ->
                when (ev.actionMasked) {
                    MotionEvent.ACTION_DOWN -> {
                        dragStartRawX = ev.rawX
                        dragStartRawY = ev.rawY
                        startXFrac = curXFrac
                        startYDp = curYDp
                        true
                    }
                    MotionEvent.ACTION_MOVE -> {
                        val dx = ev.rawX - dragStartRawX
                        val dy = ev.rawY - dragStartRawY
                        curXFrac = (startXFrac + dx / screenW.toFloat()).coerceIn(0.06f, 0.94f)
                        curYDp = (startYDp + dy / dm.density).coerceIn(0f, 90f)
                        updateTargetGeometry()
                        true
                    }
                    else -> false
                }
            }

            // Bottom Calibration Toolbar
            val toolbarHolder: ViewGroup = if (kyant0) {
                KyantGlassSurfaceView(
                    context = activity,
                    backdropSource = state.backdropSource,
                    cornerRadiusDp = 24f,
                    blurRadiusDp = 10f,
                    refractionHeightDp = 18f,
                    refractionAmountDp = 18f,
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

            val col = LinearLayout(activity).apply {
                orientation = LinearLayout.VERTICAL
                setPadding(dp(activity, 16f), dp(activity, 14f), dp(activity, 16f), dp(activity, 14f))
            }
            col.addView(TextView(activity).apply {
                text = MergenStrings.t(activity, "KAMERA KONUMUNU AYARLA", "CALIBRATE CAMERA NOTCH")
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f)
                setTextColor(Color.WHITE)
            })
            col.addView(
                TextView(activity).apply {
                    text = MergenStrings.t(
                        activity,
                        "Hedef halkayı parmağınla sürükleyip ön kamera deliğinin tam üzerine getir. Normal zamanda ekranda durmaz; yalnızca bildirim gelince buradan açılır.",
                        "Drag the target reticle directly over your front camera punch-hole. It stays hidden while browsing and only expands here on live alerts."
                    )
                    gravity = Gravity.CENTER
                    typeface = Typeface.SANS_SERIF
                    setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
                    setTextColor(Color.argb(190, 255, 255, 255))
                },
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    topMargin = dp(activity, 4f)
                    bottomMargin = dp(activity, 8f)
                }
            )
            col.addView(
                infoTv,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    bottomMargin = dp(activity, 10f)
                }
            )

            fun makeBtn(label: String, primary: Boolean, onClick: () -> Unit) = TextView(activity).apply {
                text = label
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                setTextColor(if (primary) Color.BLACK else Color.WHITE)
                background = if (kyant0) {
                    GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        cornerRadius = dpF(activity, 12f)
                        setColor(if (primary) Color.WHITE else Color.argb(42, 255, 255, 255))
                        if (!primary) setStroke(strokePx, Color.argb(85, 255, 255, 255))
                    }
                } else {
                    MergenDesign.sharpBox(
                        fillColor = if (primary) Color.WHITE else MergenDesign.OBSIDIAN_SURFACE,
                        strokeColor = if (primary) Color.TRANSPARENT else Color.argb(110, 255, 255, 255),
                        strokePx = if (primary) 0 else strokePx
                    )
                }
                setPadding(dp(activity, 8f), dp(activity, 9f), dp(activity, 8f), dp(activity, 9f))
                MergenSpringEngine.attachSpringPress(this, pressedScale = 0.94f)
                setOnClickListener {
                    MergenHaptics.playTap(activity)
                    onClick()
                }
            }

            val ctrlRow = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
            ctrlRow.addView(makeBtn(MergenStrings.t(activity, "ÇAP -", "SIZE -"), false) {
                curSizeDp = (curSizeDp - 2f).coerceIn(14f, 44f)
                updateTargetGeometry()
            }, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 5f) })
            ctrlRow.addView(makeBtn(MergenStrings.t(activity, "ÇAP +", "SIZE +"), false) {
                curSizeDp = (curSizeDp + 2f).coerceIn(14f, 44f)
                updateTargetGeometry()
            }, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 5f) })
            ctrlRow.addView(makeBtn(MergenStrings.t(activity, "ORTALA", "CENTER"), false) {
                curXFrac = 0.5f
                curYDp = 12f
                curSizeDp = 24f
                updateTargetGeometry()
            }, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
            col.addView(ctrlRow, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT))

            val actionRow = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
            actionRow.addView(makeBtn(MergenStrings.t(activity, "ATLA", "SKIP"), false) {
                MergenPrefs.setCameraCalibrated(activity, true)
                dismissCalibrator(activity)
            }, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 6f) })
            actionRow.addView(makeBtn(MergenStrings.t(activity, "KAYDET →", "SAVE →"), true) {
                MergenPrefs.setCameraGeometry(activity, curXFrac, curYDp, curSizeDp)
                dismissCalibrator(activity)
                MergenHaptics.playSuccess(activity)
                showNotification(
                    activity = activity,
                    title = MergenStrings.t(activity, "KAMERA KONUMU KAYDEDİLDİ", "CAMERA POSITION SAVED"),
                    subtitle = MergenStrings.t(activity, "Bildirimler bu noktadan açılacak", "Dynamic alerts will expand from here"),
                    durationMs = 3600L
                )
            }, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1.4f))
            col.addView(
                actionRow,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    topMargin = dp(activity, 8f)
                }
            )

            toolbarHolder.addView(
                col,
                FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
            )
            overlay.addView(
                toolbarHolder,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.BOTTOM
                ).apply {
                    val m = dp(activity, 14f)
                    leftMargin = m
                    rightMargin = m
                    bottomMargin = navInset + dp(activity, 18f)
                }
            )

            state.calibratorOverlay = overlay
            content.addView(
                overlay,
                FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            )
            if (MergenSpringEngine.isReducedMotion(activity)) {
                MergenSpringEngine.springPop(
                    view = toolbarHolder,
                    fromScaleX = 1f,
                    fromScaleY = 1f,
                    toScaleX = 1f,
                    toScaleY = 1f,
                    fromAlpha = 0f,
                    toAlpha = 1f,
                    maxBlurDp = 0f
                )
            } else {
                toolbarHolder.translationY = dpF(activity, 80f)
                MergenSpringEngine.springTranslationY(
                    view = toolbarHolder,
                    targetY = 0f,
                    dampingRatio = 0.86f,
                    responseSec = 0.28f,
                    maxBlurDp = 10f
                )
            }
        }
    }

    private fun startPolling(activity: Activity, state: NotifState) {
        pollRunnables.remove(activity)?.let { mainHandler.removeCallbacks(it) }
        val r = object : Runnable {
            override fun run() {
                if (states[activity] !== state || activity.isFinishing || activity.isDestroyed) return
                if (MergenPrefs.isModEffectivelyActive(activity) && MergenPrefs.isDynamicPillEnabled(activity)) {
                    pollEvents(activity, state)
                }
                mainHandler.postDelayed(this, 1800L)
            }
        }
        pollRunnables[activity] = r
        mainHandler.postDelayed(r, 900L)
    }

    private fun pollEvents(activity: Activity, state: NotifState) {
        val now = System.currentTimeMillis()

        // 1. New Messages / Notifications via Inbox badge increase
        val unread = TikTokViewResolver.findInboxUnreadBadge(activity, state.tabContainer)
        if (unread != null) {
            if (state.lastUnreadCount >= 0 && unread > state.lastUnreadCount) {
                val delta = unread - state.lastUnreadCount
                MergenHaptics.playTap(activity)
                showNotification(
                    activity = activity,
                    title = MergenStrings.t(
                        activity,
                        "YENİ MESAJ / BİLDİRİM (+$delta)",
                        "NEW MESSAGE / ALERT (+$delta)"
                    ),
                    subtitle = MergenStrings.t(
                        activity,
                        "Gelen kutusunda $unread okunmamış — açmak için dokun",
                        "$unread unread in inbox — tap to open"
                    ),
                    durationMs = 3800L,
                    onTap = {
                        val inboxTab = TikTokViewResolver.findViewByIdName(activity, state.tabContainer, "oni")
                            ?: (if (state.tabContainer.childCount >= 4) state.tabContainer.getChildAt(3) else null)
                        inboxTab?.performClick()
                    }
                )
            }
            state.lastUnreadCount = unread
        }

        // 2. Periodic Nudge / Break Reminder (every 20 minutes)
        if (MergenPrefs.isNudgeReminderEnabled(activity) && now - state.lastNudgeAtMs >= NUDGE_INTERVAL_MS) {
            state.lastNudgeAtMs = now
            MergenHaptics.playTick(activity)
            showNotification(
                activity = activity,
                title = MergenStrings.t(activity, "MOLA DÜRTMESİ", "BREAK REMINDER"),
                subtitle = MergenStrings.t(
                    activity,
                    "20 dk oldu · Gözlerini dinlendir veya su iç",
                    "20 min passed · Rest your eyes or hydrate"
                ),
                durationMs = 4200L
            )
        }
    }
}
