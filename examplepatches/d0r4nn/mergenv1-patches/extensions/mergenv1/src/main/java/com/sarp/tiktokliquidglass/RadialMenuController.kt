package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Matrix
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RectF
import android.graphics.SweepGradient
import android.graphics.Typeface
import android.os.Handler
import android.os.Looper
import android.util.TypedValue
import android.view.Choreographer
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.view.animation.DecelerateInterpolator
import android.widget.FrameLayout
import java.util.WeakHashMap
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.atan2
import kotlin.math.cos
import kotlin.math.hypot
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sin

/**
 * Faz 2 — Spring-Physics Hexagonal Radial Long-Press Menu.
 *
 * Triggered cleanly via 320ms center-zone hold on feed without colliding with TikTok's
 * edge 2x speed hold. Supports both:
 *  - Continuous hold -> magnetic slide -> release selection
 *  - Center-release Tap Mode (tap node, tap center hub for full native menu, or tap scrim to close)
 */
object RadialMenuController {

    private enum class RadialActionId {
        SAVE,
        SHARE,
        AUTO_SCROLL,
        NOT_INTERESTED,
        CLEAN_SCREEN,
        SPEED_AND_MENU
    }

    private data class RadialItem(
        val id: RadialActionId,
        val label: String,
        val angleDeg: Float,
        val isActive: Boolean = false
    )

    private class RadialState(
        var overlay: FrameLayout? = null,
        var wheelView: RadialWheelView? = null,
        var sessionEpoch: Int = 0
    )

    private val states = WeakHashMap<Activity, RadialState>()
    private val mainHandler = Handler(Looper.getMainLooper())

    fun isShowing(activity: Activity): Boolean =
        states[activity]?.overlay != null

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        if (tabIndex != 0 && tabIndex != 1) {
            dismiss(activity, animate = false)
        }
    }

    fun detach(activity: Activity) {
        val state = states.remove(activity) ?: return
        state.sessionEpoch++
        removeOverlayImmediate(state)
    }

    fun dismiss(activity: Activity, animate: Boolean = true) {
        val state = states[activity] ?: return
        val overlay = state.overlay ?: return
        val wheel = state.wheelView
        state.overlay = null
        state.wheelView = null
        state.sessionEpoch++

        if (!animate || wheel == null) {
            MergenMotionBlur.clear(wheel ?: overlay)
            (overlay.parent as? ViewGroup)?.post {
                if (overlay.parent != null) (overlay.parent as ViewGroup).removeView(overlay)
            }
            return
        }

        wheel.animateImplode(selectedIdx = -1)
        MergenMotionBlur.animatePop(
            view = wheel,
            fromScale = wheel.scaleX,
            toScale = 0.88f,
            fromAlpha = wheel.alpha,
            toAlpha = 0f,
            durationMs = 170L,
            interpolator = DecelerateInterpolator(1.6f),
            maxBlurDp = 7f
        ) {
            (overlay.parent as? ViewGroup)?.removeView(overlay)
        }
        overlay.animate().alpha(0f).setDuration(160L).start()
    }

    fun openFromLongPress(activity: Activity, rawX: Float, rawY: Float) {
        if (activity.isFinishing || activity.isDestroyed) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || !MergenPrefs.isRadialMenuEnabled(activity)) return

        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val decor = activity.window?.decorView ?: content
        val state = states.getOrPut(activity) { RadialState() }
        removeOverlayImmediate(state)
        state.sessionEpoch++
        val epoch = state.sessionEpoch

        val dm = activity.resources.displayMetrics
        val screenW = dm.widthPixels.toFloat()
        val screenH = dm.heightPixels.toFloat()
        val statusTop = TikTokViewResolver.statusBarTopInset(activity, decor).toFloat()
        val navBottom = TikTokViewResolver.navBarBottomInset(decor).toFloat()

        val density = dm.density
        val padX = 142f * density
        val minY = statusTop + 142f * density
        val maxY = (screenH - navBottom - 156f * density).coerceAtLeast(minY + 10f)

        val loc = IntArray(2)
        content.getLocationOnScreen(loc)
        val originX = rawX - loc[0]
        val originY = rawY - loc[1]
        val targetCx = originX.coerceIn(padX, (screenW - padX).coerceAtLeast(padX))
        val targetCy = originY.coerceIn(minY, maxY)

        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val items = listOf(
            RadialItem(RadialActionId.SAVE, MergenStrings.t(activity, "KAYDET", "SAVE"), -90f),
            RadialItem(RadialActionId.SHARE, MergenStrings.t(activity, "PAYLAŞ", "SHARE"), -30f),
            RadialItem(
                RadialActionId.AUTO_SCROLL,
                MergenStrings.t(activity, "OTO KAYDIR", "AUTO SCROLL"),
                30f,
                isActive = MergenPrefs.isAutoScrollEnabled(activity)
            ),
            RadialItem(RadialActionId.NOT_INTERESTED, MergenStrings.t(activity, "İLGİLENMİYORUM", "NOT INTERESTED"), 90f),
            RadialItem(
                RadialActionId.CLEAN_SCREEN,
                MergenStrings.t(activity, "TEMİZ EKRAN", "CLEAN SCREEN"),
                150f,
                isActive = QuickControlSheetController.isCleanScreen(activity)
            ),
            RadialItem(RadialActionId.SPEED_AND_MENU, MergenStrings.t(activity, "HIZ · MENÜ", "SPEED · MENU"), -150f)
        )

        val overlay = FrameLayout(activity).apply {
            setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
            setBackgroundColor(if (kyant0) Color.argb(108, 6, 8, 14) else Color.argb(150, 0, 0, 0))
            alpha = 0f
            elevation = 28f * density
            isClickable = true
            isFocusable = true
        }

        val wheel = RadialWheelView(
            context = activity,
            items = items,
            originX = originX,
            originY = originY,
            targetX = targetCx,
            targetY = targetCy,
            kyant0 = kyant0,
            onActionChosen = { idx ->
                executeSelectionAndDismiss(activity, state, epoch, items, idx)
            },
            onCenterHubTapped = {
                dismissForFullMenu(activity, state, epoch)
            },
            onCancelOutside = {
                dismiss(activity, animate = true)
            }
        )

        overlay.addView(
            wheel,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        )

        state.overlay = overlay
        state.wheelView = wheel

        content.addView(
            overlay,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        )

        MergenHaptics.playSnap(activity)
        overlay.animate().alpha(1f).setDuration(180L).start()
        wheel.pivotX = targetCx
        wheel.pivotY = targetCy
        MergenMotionBlur.animatePop(
            view = wheel,
            fromScale = 0.86f,
            toScale = 1f,
            fromAlpha = 0f,
            toAlpha = 1f,
            durationMs = 220L,
            interpolator = DecelerateInterpolator(1.5f),
            maxBlurDp = 6f
        )
    }

    fun handleTrackedTouchEvent(activity: Activity, event: MotionEvent): Boolean {
        val state = states[activity] ?: return false
        val overlay = state.overlay ?: return false
        val wheel = state.wheelView ?: return false

        val loc = IntArray(2)
        overlay.getLocationOnScreen(loc)
        val lx = event.rawX - loc[0]
        val ly = event.rawY - loc[1]

        when (event.actionMasked) {
            MotionEvent.ACTION_MOVE -> {
                wheel.onTrackedMove(lx, ly)
                return true
            }
            MotionEvent.ACTION_UP -> {
                wheel.onTrackedRelease(lx, ly)
                return true
            }
            MotionEvent.ACTION_CANCEL -> {
                dismiss(activity, animate = true)
                return true
            }
        }
        return false
    }

    private fun removeOverlayImmediate(state: RadialState) {
        val ov = state.overlay ?: return
        val wheel = state.wheelView
        state.overlay = null
        state.wheelView = null
        if (wheel != null) {
            MergenMotionBlur.clear(wheel)
        }
        (ov.parent as? ViewGroup)?.removeView(ov)
    }

    private fun dismissForFullMenu(activity: Activity, state: RadialState, epoch: Int) {
        if (state.sessionEpoch != epoch) return
        val overlay = state.overlay ?: return
        val wheel = state.wheelView
        state.overlay = null
        state.wheelView = null
        state.sessionEpoch++

        MergenHaptics.playTap(activity)
        if (wheel != null) {
            wheel.animateImplode(selectedIdx = -1)
            MergenMotionBlur.animatePop(
                view = wheel,
                fromScale = wheel.scaleX,
                toScale = 0.9f,
                fromAlpha = wheel.alpha,
                toAlpha = 0f,
                durationMs = 150L,
                interpolator = DecelerateInterpolator(1.5f),
                maxBlurDp = 6f
            ) {
                (overlay.parent as? ViewGroup)?.removeView(overlay)
                openFullNativeMenu(activity)
            }
        } else {
            (overlay.parent as? ViewGroup)?.removeView(overlay)
            openFullNativeMenu(activity)
        }
        overlay.animate().alpha(0f).setDuration(140L).start()
    }

    private fun executeSelectionAndDismiss(
        activity: Activity,
        state: RadialState,
        epoch: Int,
        items: List<RadialItem>,
        idx: Int
    ) {
        if (state.sessionEpoch != epoch || idx !in items.indices) return
        val overlay = state.overlay ?: return
        val wheel = state.wheelView
        val item = items[idx]
        state.overlay = null
        state.wheelView = null
        state.sessionEpoch++

        MergenHaptics.playSnap(activity)
        if (wheel != null) {
            wheel.animateImplode(selectedIdx = idx)
            MergenMotionBlur.animatePop(
                view = wheel,
                fromScale = wheel.scaleX,
                toScale = 0.94f,
                fromAlpha = wheel.alpha,
                toAlpha = 0f,
                durationMs = 170L,
                interpolator = DecelerateInterpolator(1.6f),
                maxBlurDp = 7f
            ) {
                (overlay.parent as? ViewGroup)?.removeView(overlay)
            }
        } else {
            (overlay.parent as? ViewGroup)?.removeView(overlay)
        }
        overlay.animate().alpha(0f).setDuration(165L).start()

        mainHandler.postDelayed({
            if (!activity.isFinishing && !activity.isDestroyed) {
                performRadialAction(activity, item.id)
            }
        }, 120L)
    }

    private fun performRadialAction(activity: Activity, action: RadialActionId) {
        val decor = activity.window?.decorView ?: return
        when (action) {
            RadialActionId.SAVE -> {
                val longTarget = TikTokViewResolver.findLongPressTarget(activity, decor)
                if (longTarget != null && longTarget.performLongClick()) {
                    attemptClickMenuAction(activity, attempt = 0, tryShareFallback = true) {
                        TikTokViewResolver.findSaveVideoInAnyWindow(activity)
                    }
                } else {
                    val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
                    activeWidget?.let { TikTokViewResolver.findFeedShareButton(activity, it)?.performClick() }
                    attemptClickMenuAction(activity, attempt = 0, tryShareFallback = false) {
                        TikTokViewResolver.findSaveVideoInAnyWindow(activity)
                    }
                }
            }
            RadialActionId.SHARE -> {
                val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
                val shareBtn = activeWidget?.let { TikTokViewResolver.findFeedShareButton(activity, it) }
                if (shareBtn == null || !shareBtn.performClick()) {
                    DynamicPillController.showStatus(
                        activity,
                        MergenStrings.t(activity, "PAYLAŞ BUTONU BULUNAMADI", "SHARE BUTTON NOT FOUND")
                    )
                }
            }
            RadialActionId.AUTO_SCROLL -> {
                val next = !MergenPrefs.isAutoScrollEnabled(activity)
                MergenPrefs.setAutoScrollEnabled(activity, next)
                MergenHaptics.playToggle(activity, next)
                DynamicPillController.showStatus(
                    activity,
                    if (next) MergenStrings.t(activity, "OTO KAYDIR AÇIK", "AUTO SCROLL ON")
                    else MergenStrings.t(activity, "OTO KAYDIR KAPALI", "AUTO SCROLL OFF")
                )
            }
            RadialActionId.NOT_INTERESTED -> {
                val longTarget = TikTokViewResolver.findLongPressTarget(activity, decor)
                if (longTarget != null && longTarget.performLongClick()) {
                    attemptClickMenuAction(activity, attempt = 0, tryShareFallback = false) {
                        val btn = TikTokViewResolver.findNotInterestedInAnyWindow(activity)
                        btn
                    }
                    DynamicPillController.showStatus(
                        activity,
                        MergenStrings.t(activity, "İLGİLENMİYORUM", "NOT INTERESTED")
                    )
                } else {
                    DynamicPillController.showStatus(
                        activity,
                        MergenStrings.t(activity, "MENÜ AÇILAMADI", "COULD NOT OPEN MENU")
                    )
                }
            }
            RadialActionId.CLEAN_SCREEN -> {
                QuickControlSheetController.toggleCleanScreen(activity)
            }
            RadialActionId.SPEED_AND_MENU -> {
                val longTarget = TikTokViewResolver.findLongPressTarget(activity, decor)
                if (longTarget != null && longTarget.performLongClick()) {
                    mainHandler.postDelayed({
                        if (!activity.isFinishing && !activity.isDestroyed) {
                            TikTokViewResolver.findPlaybackSpeedInAnyWindow(activity)?.performClick()
                        }
                    }, 260L)
                } else {
                    QuickControlSheetController.show(activity, null)
                }
            }
        }
    }

    private fun openFullNativeMenu(activity: Activity) {
        val decor = activity.window?.decorView ?: return
        val longTarget = TikTokViewResolver.findLongPressTarget(activity, decor)
        if (longTarget == null || !longTarget.performLongClick()) {
            QuickControlSheetController.show(activity, null)
        }
    }

    private fun attemptClickMenuAction(
        activity: Activity,
        attempt: Int,
        tryShareFallback: Boolean,
        finder: () -> View?
    ) {
        val delays = longArrayOf(220L, 280L, 380L)
        if (attempt >= delays.size) {
            if (tryShareFallback && !activity.isFinishing && !activity.isDestroyed) {
                val decor = activity.window?.decorView ?: return
                val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
                activeWidget?.let { TikTokViewResolver.findFeedShareButton(activity, it)?.performClick() }
                mainHandler.postDelayed({
                    if (!activity.isFinishing && !activity.isDestroyed) {
                        finder()?.performClick()
                    }
                }, 260L)
            }
            return
        }
        mainHandler.postDelayed({
            if (activity.isFinishing || activity.isDestroyed) return@postDelayed
            val btn = finder()
            if (btn != null && btn.performClick()) {
                MergenHaptics.playSnap(activity)
            } else {
                attemptClickMenuAction(activity, attempt + 1, tryShareFallback, finder)
            }
        }, delays[attempt])
    }

    private class RadialWheelView(
        context: Context,
        private val items: List<RadialItem>,
        originX: Float,
        originY: Float,
        private val targetX: Float,
        private val targetY: Float,
        private val kyant0: Boolean,
        private val onActionChosen: (Int) -> Unit,
        private val onCenterHubTapped: () -> Unit,
        private val onCancelOutside: () -> Unit
    ) : View(context) {

        private fun dpF(v: Float): Float =
            TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

        private val orbitRadiusPx = dpF(104f)
        private val hoverPullPx = dpF(11f)
        private val nodeBaseRadiusPx = dpF(27f)
        private val hubRadiusPx = dpF(33f)
        private val deadzonePx = dpF(26f)
        private val cancelZonePx = dpF(20f)
        private val outerTapLimitPx = dpF(170f)

        private val cxSpring = Spring1D(originX, 0.80f, 460f).apply { target = targetX }
        private val cySpring = Spring1D(originY, 0.80f, 460f).apply { target = targetY }
        private val swirlSpring = Spring1D(-18f, 0.72f, 360f).apply { target = 0f }
        private val hubScaleSpring = Spring1D(0.1f, 0.64f, 460f).apply { target = 1f }
        private val ringRippleSpring = Spring1D(0.18f, 0.86f, 260f).apply { target = 1f }
        private val pointerActiveSpring = Spring1D(0f, 0.80f, 480f)
        private val pointerAngleSpring = Spring1D(-90f, 0.78f, 560f)
        private val hubLeanXSpring = Spring1D(0f, 0.76f, 420f)
        private val hubLeanYSpring = Spring1D(0f, 0.76f, 420f)
        private val hubLeanMaxPx = dpF(5.5f)
        private val confirmPulseSpring = Spring1D(0f, 0.82f, 340f)
        private var confirmIdx = -1

        private val nodeRadiusSprings = Array(items.size) { Spring1D(0f, 0.62f, 420f) }
        private val nodeScaleSprings = Array(items.size) { Spring1D(0.15f, 0.64f, 460f) }
        private val nodeHoverSprings = Array(items.size) { Spring1D(0f, 0.74f, 520f) }

        private val openedAtNanos = System.nanoTime()
        private var lastFrameNanos = 0L
        private var choreographerRunning = false
        private var tapMode = false
        private var hasExitedDeadzone = false
        private var imploding = false
        private var hoveredIdx = -1
        private val reducedMotion = MergenSpringEngine.isReducedMotion(context)

        private val ringPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(1f)
        }
        private val ripplePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(1.6f)
        }
        private val spokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(1f)
        }
        private val indicatorArcPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeCap = Paint.Cap.ROUND
            strokeWidth = dpF(3f)
        }
        private val nodeFillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val nodeStrokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.STROKE }
        private val iconPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeCap = Paint.Cap.ROUND
            strokeJoin = Paint.Join.ROUND
        }
        private val labelPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            textAlign = Paint.Align.CENTER
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 9.5f, resources.displayMetrics)
            typeface = Typeface.create(if (kyant0) "sans-serif-medium" else "monospace", Typeface.BOLD)
        }
        private val hubTitlePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            textAlign = Paint.Align.CENTER
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 8.8f, resources.displayMetrics)
            typeface = Typeface.create(if (kyant0) "sans-serif-medium" else "monospace", Typeface.BOLD)
        }
        private val labelBgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val arcRect = RectF()
        private val iconPath = Path()
        private val sweepColors = intArrayOf(
            Color.argb(115, 255, 255, 255),
            Color.argb(18, 255, 255, 255),
            Color.argb(72, 255, 255, 255),
            Color.argb(18, 255, 255, 255),
            Color.argb(115, 255, 255, 255)
        )
        private val cachedSweepShader = SweepGradient(0f, 0f, sweepColors, null)
        private val sweepMatrix = Matrix()

        private val frameCallback = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                val dt = if (lastFrameNanos == 0L) 1f / 60f else ((frameTimeNanos - lastFrameNanos) / 1_000_000_000f).coerceIn(0.001f, 0.045f)
                lastFrameNanos = frameTimeNanos

                val elapsedMs = (frameTimeNanos - openedAtNanos) / 1_000_000L
                val staggerMs = if (reducedMotion) 0L else 20L
                if (!imploding) {
                    for (i in items.indices) {
                        if (elapsedMs >= i * staggerMs) {
                            nodeRadiusSprings[i].target = 1f
                            if (hoveredIdx < 0) {
                                nodeScaleSprings[i].target = 1f
                            }
                        }
                    }
                }

                var moving = cxSpring.step(dt)
                moving = cySpring.step(dt) || moving
                moving = swirlSpring.step(dt) || moving
                moving = hubScaleSpring.step(dt) || moving
                moving = ringRippleSpring.step(dt) || moving
                moving = pointerActiveSpring.step(dt) || moving
                moving = pointerAngleSpring.step(dt) || moving
                moving = hubLeanXSpring.step(dt) || moving
                moving = hubLeanYSpring.step(dt) || moving
                moving = confirmPulseSpring.step(dt) || moving
                for (i in items.indices) {
                    moving = nodeRadiusSprings[i].step(dt) || moving
                    moving = nodeScaleSprings[i].step(dt) || moving
                    moving = nodeHoverSprings[i].step(dt) || moving
                }

                invalidate()
                val waitingStagger = !imploding && elapsedMs < items.size * (staggerMs + 2L)
                if (moving || waitingStagger) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    choreographerRunning = false
                    lastFrameNanos = 0L
                }
            }
        }

        init {
            setWillNotDraw(false)
            isClickable = true
            isFocusable = true
            startLoop()
        }

        override fun onDetachedFromWindow() {
            Choreographer.getInstance().removeFrameCallback(frameCallback)
            choreographerRunning = false
            super.onDetachedFromWindow()
        }

        private fun startLoop() {
            if (!choreographerRunning) {
                choreographerRunning = true
                lastFrameNanos = 0L
                Choreographer.getInstance().postFrameCallback(frameCallback)
            }
        }

        fun onTrackedMove(lx: Float, ly: Float) {
            if (imploding) return
            updateHoverFromPoint(lx, ly)
        }

        fun onTrackedRelease(lx: Float, ly: Float) {
            if (imploding) return
            updateHoverFromPoint(lx, ly)
            if (hasExitedDeadzone && hoveredIdx >= 0) {
                onActionChosen(hoveredIdx)
            } else {
                tapMode = true
                setHovered(-1)
            }
        }

        override fun onTouchEvent(event: MotionEvent): Boolean {
            if (!tapMode || imploding) return true
            val x = event.x
            val y = event.y
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN, MotionEvent.ACTION_MOVE -> {
                    val direct = hitTestNode(x, y)
                    if (direct >= 0) {
                        setHovered(direct)
                    } else {
                        val dx = x - cxSpring.value
                        val dy = y - cySpring.value
                        val d = hypot(dx, dy)
                        if (d in deadzonePx..outerTapLimitPx) {
                            setHovered(nearestSector(dx, dy))
                        } else {
                            setHovered(-1)
                        }
                    }
                    return true
                }
                MotionEvent.ACTION_UP -> {
                    val direct = hitTestNode(x, y)
                    if (direct >= 0) {
                        onActionChosen(direct)
                        return true
                    }
                    val dx = x - cxSpring.value
                    val dy = y - cySpring.value
                    val d = hypot(dx, dy)
                    when {
                        d <= hubRadiusPx + dpF(10f) -> onCenterHubTapped()
                        hoveredIdx >= 0 && d in deadzonePx..outerTapLimitPx -> onActionChosen(hoveredIdx)
                        else -> onCancelOutside()
                    }
                    return true
                }
            }
            return true
        }

        fun animateImplode(selectedIdx: Int) {
            imploding = true
            confirmIdx = selectedIdx
            if (selectedIdx in items.indices) {
                confirmPulseSpring.target = 1f
            }
            hubScaleSpring.target = 0f
            pointerActiveSpring.target = 0f
            hubLeanXSpring.target = 0f
            hubLeanYSpring.target = 0f
            for (i in items.indices) {
                if (i == selectedIdx) {
                    nodeScaleSprings[i].target = 1.34f
                    nodeHoverSprings[i].target = 1f
                } else {
                    nodeRadiusSprings[i].target = 0f
                    nodeScaleSprings[i].target = 0.15f
                    nodeHoverSprings[i].target = 0f
                }
            }
            startLoop()
        }

        private fun updateHoverFromPoint(lx: Float, ly: Float) {
            val dx = lx - cxSpring.value
            val dy = ly - cySpring.value
            val dist = hypot(dx, dy)
            if (!reducedMotion && dist > 1f) {
                val frac = (dist / orbitRadiusPx).coerceIn(0f, 1f)
                hubLeanXSpring.target = (dx / dist) * hubLeanMaxPx * frac
                hubLeanYSpring.target = (dy / dist) * hubLeanMaxPx * frac
            } else {
                hubLeanXSpring.target = 0f
                hubLeanYSpring.target = 0f
            }
            if (dist > deadzonePx) {
                hasExitedDeadzone = true
                setHovered(nearestSector(dx, dy))
            } else if (dist <= cancelZonePx) {
                setHovered(-1)
            }
            startLoop()
        }

        private fun hitTestNode(x: Float, y: Float): Int {
            val cx = cxSpring.value
            val cy = cySpring.value
            val hitR = nodeBaseRadiusPx + dpF(12f)
            for (i in items.indices) {
                val (nx, ny) = computeNodeCenter(i, cx, cy)
                if (hypot(x - nx, y - ny) <= hitR) {
                    return i
                }
            }
            return -1
        }

        private fun nearestSector(dx: Float, dy: Float): Int {
            val deg = Math.toDegrees(atan2(dy.toDouble(), dx.toDouble())).toFloat()
            var bestIdx = 0
            var bestDiff = 999f
            for (i in items.indices) {
                val diff = abs(normalizeAngleDeg(deg - items[i].angleDeg))
                if (diff < bestDiff) {
                    bestDiff = diff
                    bestIdx = i
                }
            }
            return bestIdx
        }

        private fun setHovered(idx: Int) {
            if (hoveredIdx == idx) return
            hoveredIdx = idx
            if (idx >= 0) {
                MergenHaptics.playTick(context)
                pointerActiveSpring.target = 1f
                val targetAngle = items[idx].angleDeg
                val cur = pointerAngleSpring.value
                val delta = normalizeAngleDeg(targetAngle - cur)
                pointerAngleSpring.target = cur + delta
                for (i in items.indices) {
                    val h = i == idx
                    nodeHoverSprings[i].target = if (h) 1f else 0f
                    nodeScaleSprings[i].target = if (h) 1.24f else 0.90f
                }
            } else {
                pointerActiveSpring.target = 0f
                for (i in items.indices) {
                    nodeHoverSprings[i].target = 0f
                    nodeScaleSprings[i].target = 1f
                }
            }
            startLoop()
        }

        private fun normalizeAngleDeg(deg: Float): Float {
            var a = deg % 360f
            if (a > 180f) a -= 360f
            if (a < -180f) a += 360f
            return a
        }

        private fun computeNodeCenter(i: Int, cx: Float, cy: Float): Pair<Float, Float> {
            val radFrac = nodeRadiusSprings[i].value.coerceAtLeast(0f)
            val hoverPull = nodeHoverSprings[i].value * hoverPullPx
            val r = (orbitRadiusPx * radFrac) + hoverPull * radFrac
            val rad = ((items[i].angleDeg + swirlSpring.value) * PI / 180.0)
            return (cx + r * cos(rad).toFloat()) to (cy + r * sin(rad).toFloat())
        }

        override fun onDraw(canvas: Canvas) {
            val cx = cxSpring.value
            val cy = cySpring.value

            // 1. Expanding outer pulse ripple
            val rip = ringRippleSpring.value.coerceIn(0f, 1.25f)
            if (rip < 1.05f) {
                val r = orbitRadiusPx * (0.45f + rip * 0.92f)
                val alpha = ((1f - (rip / 1.05f)).coerceIn(0f, 1f) * 140f).toInt()
                ripplePaint.color = Color.argb(alpha, 255, 255, 255)
                canvas.drawCircle(cx, cy, r, ripplePaint)
            }

            // 2. Orbit guide ring
            val guideR = orbitRadiusPx * ringRippleSpring.value.coerceIn(0.2f, 1.05f)
            ringPaint.color = if (kyant0) Color.argb(42, 255, 255, 255) else Color.argb(54, 255, 255, 255)
            ringPaint.strokeWidth = dpF(1f)
            canvas.drawCircle(cx, cy, guideR, ringPaint)

            // 3. Sector spokes & active directional indicator arc around hub
            val ptrAlpha = pointerActiveSpring.value.coerceIn(0f, 1f)
            for (i in items.indices) {
                val (nx, ny) = computeNodeCenter(i, cx, cy)
                val h = nodeHoverSprings[i].value.coerceIn(0f, 1f)
                spokePaint.color = Color.argb(
                    ((0.12f + 0.55f * h) * (1f - implodingAlphaFactor()) * 255f).toInt().coerceIn(0, 255),
                    255, 255, 255
                )
                spokePaint.strokeWidth = dpF(1f + h * 1.1f)
                canvas.drawLine(cx, cy, nx, ny, spokePaint)
            }

            if (ptrAlpha > 0.01f) {
                val arcR = hubRadiusPx + dpF(7f)
                arcRect.set(cx - arcR, cy - arcR, cx + arcR, cy + arcR)
                indicatorArcPaint.color = Color.argb((ptrAlpha * 235f).toInt().coerceIn(0, 255), 255, 255, 255)
                canvas.drawArc(arcRect, pointerAngleSpring.value - 26f, 52f, false, indicatorArcPaint)
            }

            // 4. Center Hub (subtle magnetic lean toward finger)
            val hubScale = hubScaleSpring.value.coerceAtLeast(0f)
            if (hubScale > 0.02f) {
                val hcx = cx + hubLeanXSpring.value
                val hcy = cy + hubLeanYSpring.value
                val hr = hubRadiusPx * hubScale
                nodeFillPaint.color = when {
                    kyant0 -> Color.argb(185, 20, 22, 30)
                    else -> MergenDesign.OBSIDIAN_BG
                }
                canvas.drawCircle(hcx, hcy, hr, nodeFillPaint)

                if (kyant0) {
                    sweepMatrix.setTranslate(hcx, hcy)
                    cachedSweepShader.setLocalMatrix(sweepMatrix)
                    nodeStrokePaint.shader = cachedSweepShader
                    nodeStrokePaint.strokeWidth = dpF(1.4f)
                    canvas.drawCircle(hcx, hcy, hr, nodeStrokePaint)
                    nodeStrokePaint.shader = null
                } else {
                    nodeStrokePaint.color = Color.argb(210, 255, 255, 255)
                    nodeStrokePaint.strokeWidth = dpF(1f)
                    canvas.drawCircle(hcx, hcy, hr, nodeStrokePaint)
                }

                val hubLabel = if (hoveredIdx in items.indices) {
                    items[hoveredIdx].label
                } else {
                    MergenStrings.t(context, "TÜM MENÜ", "FULL MENU")
                }
                val hubSub = if (hoveredIdx in items.indices) {
                    MergenStrings.t(context, "BIRAK", "RELEASE")
                } else if (tapMode) {
                    MergenStrings.t(context, "DOKUN", "TAP")
                } else {
                    MergenStrings.t(context, "ÇEK", "DRAG")
                }
                hubTitlePaint.color = Color.WHITE
                hubTitlePaint.textSize = TypedValue.applyDimension(
                    TypedValue.COMPLEX_UNIT_SP,
                    if (hubLabel.length > 9) 7.2f else 8.4f,
                    resources.displayMetrics
                ) * min(1.05f, hubScale)
                val fm = hubTitlePaint.fontMetrics
                canvas.drawText(
                    ellipsizeShort(hubLabel, 11),
                    hcx,
                    hcy - dpF(2f) - (fm.ascent + fm.descent) * 0.5f,
                    hubTitlePaint
                )
                hubTitlePaint.color = Color.argb(165, 255, 255, 255)
                hubTitlePaint.textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 7f, resources.displayMetrics) * min(1.05f, hubScale)
                canvas.drawText(hubSub, hcx, hcy + dpF(12f), hubTitlePaint)
            }

            // 5. Six Satellite Action Nodes
            for (i in items.indices) {
                val item = items[i]
                val s = nodeScaleSprings[i].value.coerceAtLeast(0f)
                val h = nodeHoverSprings[i].value.coerceIn(0f, 1f)
                val rFrac = nodeRadiusSprings[i].value.coerceIn(0f, 1.3f)
                if (s <= 0.05f || rFrac <= 0.02f) continue

                val (nx, ny) = computeNodeCenter(i, cx, cy)
                val discR = nodeBaseRadiusPx * s
                val nodeAlpha = ((0.78f + 0.22f * h) * min(1f, rFrac * 2f)).coerceIn(0f, 1f)

                if (i == confirmIdx && confirmPulseSpring.value > 0.01f) {
                    val pulse = confirmPulseSpring.value.coerceIn(0f, 1.2f)
                    ripplePaint.color = Color.argb(((1f - (pulse / 1.2f)).coerceIn(0f, 1f) * 210f).toInt(), 255, 255, 255)
                    canvas.drawCircle(nx, ny, discR * (1f + pulse * 0.9f), ripplePaint)
                }

                val fillAlpha = (nodeAlpha * 255f).toInt()
                val inverted = h > 0.55f
                if (inverted) {
                    nodeFillPaint.color = Color.argb(fillAlpha, 255, 255, 255)
                } else if (item.isActive) {
                    nodeFillPaint.color = if (kyant0) Color.argb((nodeAlpha * 210f).toInt(), 52, 199, 89) else Color.argb(fillAlpha, 240, 240, 240)
                } else {
                    nodeFillPaint.color = if (kyant0) Color.argb((nodeAlpha * 185f).toInt(), 22, 24, 34) else Color.argb((nodeAlpha * 244f).toInt(), 8, 8, 8)
                }
                canvas.drawCircle(nx, ny, discR, nodeFillPaint)

                if (kyant0) {
                    sweepMatrix.setTranslate(nx, ny)
                    cachedSweepShader.setLocalMatrix(sweepMatrix)
                    nodeStrokePaint.shader = cachedSweepShader
                    nodeStrokePaint.alpha = fillAlpha
                    nodeStrokePaint.strokeWidth = dpF(1.3f + h * 0.5f)
                    canvas.drawCircle(nx, ny, discR, nodeStrokePaint)
                    nodeStrokePaint.shader = null
                    nodeStrokePaint.alpha = 255
                } else {
                    nodeStrokePaint.color = Color.argb(if (inverted) 255 else (nodeAlpha * 200f).toInt(), 255, 255, 255)
                    nodeStrokePaint.strokeWidth = dpF(1.1f)
                    canvas.drawCircle(nx, ny, discR, nodeStrokePaint)
                }

                val iconInk = when {
                    inverted -> Color.BLACK
                    item.isActive && !kyant0 -> Color.BLACK
                    else -> Color.WHITE
                }
                iconPaint.color = iconInk
                iconPaint.alpha = fillAlpha
                iconPaint.strokeWidth = dpF(1.9f)
                drawVectorIcon(canvas, item.id, nx, ny, dpF(11.5f) * s)
                iconPaint.alpha = 255

                // Label pill cleanly beneath disc
                val lblAlpha = ((min(1f, rFrac * 1.4f)) * (0.85f + 0.15f * h) * 255f).toInt().coerceIn(0, 255)
                val lblY = ny + discR + dpF(13f)
                val lblW = labelPaint.measureText(item.label) + dpF(12f)
                val lblH = dpF(15f)
                arcRect.set(nx - lblW * 0.5f, lblY - lblH * 0.68f, nx + lblW * 0.5f, lblY + lblH * 0.32f)
                labelBgPaint.color = Color.argb((lblAlpha * (if (inverted) 0.92f else 0.72f)).toInt(), if (inverted) 255 else 0, if (inverted) 255 else 0, if (inverted) 255 else 0)
                val corner = if (kyant0) lblH * 0.5f else 0f
                canvas.drawRoundRect(arcRect, corner, corner, labelBgPaint)
                labelPaint.color = Color.argb(lblAlpha, if (inverted) 0 else 255, if (inverted) 0 else 255, if (inverted) 0 else 255)
                canvas.drawText(item.label, nx, lblY, labelPaint)
            }
        }

        private fun implodingAlphaFactor(): Float =
            if (!imploding) 0f else (1f - hubScaleSpring.value.coerceIn(0f, 1f))

        private fun ellipsizeShort(s: String, maxChars: Int): String =
            if (s.length <= maxChars) s else s.substring(0, maxChars - 1) + "…"

        private fun drawVectorIcon(canvas: Canvas, id: RadialActionId, cx: Float, cy: Float, r: Float) {
            iconPath.reset()
            when (id) {
                RadialActionId.SAVE -> {
                    // Down arrow into tray
                    canvas.drawLine(cx, cy - r * 0.85f, cx, cy + r * 0.35f, iconPaint)
                    iconPath.moveTo(cx - r * 0.42f, cy - r * 0.05f)
                    iconPath.lineTo(cx, cy + r * 0.40f)
                    iconPath.lineTo(cx + r * 0.42f, cy - r * 0.05f)
                    canvas.drawPath(iconPath, iconPaint)
                    iconPath.reset()
                    iconPath.moveTo(cx - r * 0.78f, cy + r * 0.48f)
                    iconPath.lineTo(cx - r * 0.78f, cy + r * 0.85f)
                    iconPath.lineTo(cx + r * 0.78f, cy + r * 0.85f)
                    iconPath.lineTo(cx + r * 0.78f, cy + r * 0.48f)
                    canvas.drawPath(iconPath, iconPaint)
                }
                RadialActionId.SHARE -> {
                    // Dynamic curved forward arrow
                    iconPath.moveTo(cx - r * 0.80f, cy + r * 0.65f)
                    iconPath.quadTo(cx - r * 0.70f, cy - r * 0.25f, cx + r * 0.25f, cy - r * 0.25f)
                    iconPath.lineTo(cx + r * 0.75f, cy - r * 0.25f)
                    canvas.drawPath(iconPath, iconPaint)
                    iconPath.reset()
                    iconPath.moveTo(cx + r * 0.30f, cy - r * 0.72f)
                    iconPath.lineTo(cx + r * 0.80f, cy - r * 0.25f)
                    iconPath.lineTo(cx + r * 0.30f, cy + r * 0.22f)
                    canvas.drawPath(iconPath, iconPaint)
                }
                RadialActionId.AUTO_SCROLL -> {
                    // Double chevron down
                    iconPath.moveTo(cx - r * 0.62f, cy - r * 0.55f)
                    iconPath.lineTo(cx, cy - r * 0.02f)
                    iconPath.lineTo(cx + r * 0.62f, cy - r * 0.55f)
                    iconPath.moveTo(cx - r * 0.62f, cy + r * 0.12f)
                    iconPath.lineTo(cx, cy + r * 0.65f)
                    iconPath.lineTo(cx + r * 0.62f, cy + r * 0.12f)
                    canvas.drawPath(iconPath, iconPaint)
                }
                RadialActionId.NOT_INTERESTED -> {
                    // Slashed circle
                    canvas.drawCircle(cx, cy, r * 0.76f, iconPaint)
                    canvas.drawLine(cx - r * 0.54f, cy + r * 0.54f, cx + r * 0.54f, cy - r * 0.54f, iconPaint)
                }
                RadialActionId.CLEAN_SCREEN -> {
                    // 4 crisp viewport corner brackets
                    val b = r * 0.78f
                    val arm = r * 0.38f
                    iconPath.moveTo(cx - b, cy - b + arm); iconPath.lineTo(cx - b, cy - b); iconPath.lineTo(cx - b + arm, cy - b)
                    iconPath.moveTo(cx + b - arm, cy - b); iconPath.lineTo(cx + b, cy - b); iconPath.lineTo(cx + b, cy - b + arm)
                    iconPath.moveTo(cx + b, cy + b - arm); iconPath.lineTo(cx + b, cy + b); iconPath.lineTo(cx + b - arm, cy + b)
                    iconPath.moveTo(cx - b + arm, cy + b); iconPath.lineTo(cx - b, cy + b); iconPath.lineTo(cx - b, cy + b - arm)
                    canvas.drawPath(iconPath, iconPaint)
                }
                RadialActionId.SPEED_AND_MENU -> {
                    // Speed dial arc + needle
                    arcRect.set(cx - r * 0.85f, cy - r * 0.65f, cx + r * 0.85f, cy + r * 1.05f)
                    canvas.drawArc(arcRect, 190f, 160f, false, iconPaint)
                    canvas.drawLine(cx, cy + r * 0.25f, cx + r * 0.52f, cy - r * 0.30f, iconPaint)
                    canvas.drawCircle(cx, cy + r * 0.25f, dpF(1.6f), iconPaint)
                }
            }
        }
    }

    private class Spring1D(
        initial: Float,
        private val dampingRatio: Float,
        private val stiffness: Float
    ) {
        var value: Float = initial
            private set
        var velocity: Float = 0f
            private set
        var target: Float = initial

        fun step(dt: Float): Boolean {
            val steps = 3
            val subDt = dt / steps
            val damping = 2f * dampingRatio * kotlin.math.sqrt(stiffness)
            for (i in 0 until steps) {
                val accel = stiffness * (target - value) - damping * velocity
                velocity += accel * subDt
                value += velocity * subDt
            }
            if (abs(target - value) < 0.001f && abs(velocity) < 0.005f) {
                value = target
                velocity = 0f
                return false
            }
            return true
        }
    }
}
