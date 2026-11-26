package com.sarp.tiktokliquidglass

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.ContextWrapper
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Outline
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RecordingCanvas
import android.graphics.RectF
import android.graphics.RenderEffect
import android.graphics.RenderNode
import android.graphics.RuntimeShader
import android.graphics.Shader
import android.util.TypedValue
import android.view.Choreographer
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.view.ViewOutlineProvider
import android.view.ViewTreeObserver
import android.widget.TextView
import kotlin.math.abs
import kotlin.math.ceil
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sign
import kotlin.math.sqrt

/**
 * Pure Android View + RenderNode + AGSL Shader port of Kyant0's LiquidBottomTabs.
 * Renders:
 *  - Behind [tabContainer]: outer capsule glass pill (Vibrancy + Blur + Refraction + InteractiveHighlight)
 *    plus the resting selected-tab capsule.
 *  - Above [tabContainer] via [lensOverlay]: draggable magnified jelly lens with chromatic dispersion,
 *    velocity squash/stretch, drop shadow, inner shadow, and specular rim highlight.
 */
@SuppressLint("ViewConstructor")
class LiquidGlassBarView(
    context: Context,
    private val backdropSource: View,
    private val tabContainer: ViewGroup
) : View(context) {

    private val density = resources.displayMetrics.density
    private fun dp(value: Float): Float =
        TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, value, resources.displayMetrics)

    val outsetPx: Int = ceil(dp(24f)).toInt()
    private val blurPadPx: Float = ceil(dp(12f))
    private val blurRadiusPx: Float = dp(9f)
    private val outerRefractionHeightPx: Float = dp(18f)
    private val outerRefractionAmountPx: Float = dp(22f)
    private val innerPaddingPx: Float = dp(4f)
    private val indicatorHeightPx: Float = dp(46f)
    private val maxPanelOffsetPx: Float = dp(4f)
    private val outerPressExpandPx: Float = dp(14f)
    private val pillShadowRadiusPx: Float = dp(12f)
    private val touchSlop: Float = ViewConfiguration.get(context).scaledTouchSlop.toFloat()

    // Kyant0 AGSL shaders
    private val outerRefractionShader = RuntimeShader(KyantShaders.ROUNDED_RECT_REFRACTION_SHADER)
    private val lensDispersionShader = RuntimeShader(KyantShaders.ROUNDED_RECT_REFRACTION_DISPERSION_SHADER)
    private val outerHighlightShader = RuntimeShader(KyantShaders.DEFAULT_HIGHLIGHT_SHADER)
    private val lensHighlightShader = RuntimeShader(KyantShaders.DEFAULT_HIGHLIGHT_SHADER)
    private val touchGlowShader = RuntimeShader(KyantShaders.INTERACTIVE_HIGHLIGHT_SHADER)

    // Hardware RenderNodes
    private val backdropNode = RenderNode("LiquidGlassBackdrop")
    private val lensNode = RenderNode("LiquidLensIndicator")

    // Paints & paths
    private val clipPath = Path()
    private val lensClipPath = Path()
    private val rectF = RectF()
    private val lensRectF = RectF()

    private val outerShadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = Color.argb(64, 0, 0, 0)
        setShadowLayer(dp(14f), 0f, dp(4f), Color.argb(95, 0, 0, 0))
    }
    private val tintPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
    }
    private val glowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        blendMode = KyantShaders.plusBlendMode
    }
    private val highlightPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        blendMode = KyantShaders.plusBlendMode
    }
    private val restingPillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
    }
    private val lensShadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.FILL
        color = Color.TRANSPARENT
    }
    private val lensInnerShadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
    }
    private val ambientEdgePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        style = Paint.Style.STROKE
        strokeWidth = dp(0.75f)
    }

    // Damped springs matching Kyant0 DampedDragAnimation.kt
    private val tabPosSpring = Spring1D(initial = 0f, dampingRatio = 1f, stiffness = 1000f)
    private val pressSpring = Spring1D(initial = 0f, dampingRatio = 1f, stiffness = 1000f)
    private val scaleXSpring = Spring1D(initial = 1f, dampingRatio = 0.6f, stiffness = 250f)
    private val scaleYSpring = Spring1D(initial = 1f, dampingRatio = 0.7f, stiffness = 250f)
    private val velocitySpring = Spring1D(initial = 0f, dampingRatio = 0.5f, stiffness = 300f)
    private val panelOffsetSpring = Spring1D(initial = 0f, dampingRatio = 1f, stiffness = 300f)
    private val morphSpring = Spring1D(initial = 0f, dampingRatio = 0.82f, stiffness = 320f)

    private var activeTabIndex = 0
    private var tabCount = 5
    private var morphed = false
    private var lastAppliedAnimProfile = -1
    private var isDragging = false
    private var isTouchActive = false
    private var releasePendingAfterSnap = false
    private var dragAccumulatedX = 0f
    private var dragTouchX = 0f
    private var dragTouchY = 0f
    private var lastFrameNanos = 0L
    private var lastDragHapticIdx = -1
    private var choreographerRunning = false
    private var isCapturing = false
    private var isLightTheme = false
    private var ignoreNextOnDraw = false
    private var lastBackdropInvalidationNanos = 0L

    private val srcLoc = IntArray(2)
    private val selfLoc = IntArray(2)

    val lensOverlay: View = LiquidGlassLensOverlay(context)

    private val frameCallback = object : Choreographer.FrameCallback {
        override fun doFrame(frameTimeNanos: Long) {
            val dt = if (lastFrameNanos == 0L) 1f / 60f else ((frameTimeNanos - lastFrameNanos) / 1_000_000_000f).coerceIn(0.001f, 0.05f)
            lastFrameNanos = frameTimeNanos

            val prevPos = tabPosSpring.value
            val moving = stepSprings(dt, prevPos)
            syncTabContainerTransform()

            ignoreNextOnDraw = true
            invalidate()
            lensOverlay.invalidate()

            if (moving || isTouchActive) {
                Choreographer.getInstance().postFrameCallback(this)
            } else {
                choreographerRunning = false
                lastFrameNanos = 0L
            }
        }
    }

    private val backdropDrawListener = ViewTreeObserver.OnDrawListener {
        if (ignoreNextOnDraw) {
            ignoreNextOnDraw = false
            return@OnDrawListener
        }
        val now = System.nanoTime()
        val minIntervalNs = if (isTouchActive || isDragging || choreographerRunning) 8_000_000L else 32_000_000L
        if (now - lastBackdropInvalidationNanos >= minIntervalNs && !isCapturing && isAttachedToWindow) {
            lastBackdropInvalidationNanos = now
            postOnAnimation {
                if (isAttachedToWindow && !isCapturing) {
                    ignoreNextOnDraw = true
                    invalidate()
                    if (pressSpring.value > 0.005f) {
                        lensOverlay.invalidate()
                    }
                }
            }
        }
    }

    init {
        setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
        lensOverlay.setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
        setWillNotDraw(false)
        isClickable = false
        isFocusable = false
        importantForAccessibility = IMPORTANT_FOR_ACCESSIBILITY_NO
        setLayerType(LAYER_TYPE_HARDWARE, null)
        attachTouchListeners()
        tabContainer.setOnHierarchyChangeListener(object : ViewGroup.OnHierarchyChangeListener {
            override fun onChildViewAdded(parent: View?, child: View?) {
                attachTouchListeners()
            }

            override fun onChildViewRemoved(parent: View?, child: View?) {
                syncSelectedTabFromHierarchy(snap = false)
            }
        })
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        backdropSource.viewTreeObserver.addOnDrawListener(backdropDrawListener)
        syncSelectedTabFromHierarchy(snap = true)
    }

    override fun onDetachedFromWindow() {
        backdropSource.viewTreeObserver.removeOnDrawListener(backdropDrawListener)
        Choreographer.getInstance().removeFrameCallback(frameCallback)
        choreographerRunning = false
        backdropNode.discardDisplayList()
        lensNode.discardDisplayList()
        super.onDetachedFromWindow()
    }

    private fun applyAnimationProfileTuning() {
        val p = MergenPrefs.getAnimationProfile(context)
        if (lastAppliedAnimProfile == p) return
        lastAppliedAnimProfile = p
        when (p) {
            1 -> { // Snappy
                tabPosSpring.updateTuning(1.0f, 1450f)
                pressSpring.updateTuning(1.0f, 1450f)
                scaleXSpring.updateTuning(0.84f, 460f)
                scaleYSpring.updateTuning(0.86f, 460f)
                morphSpring.updateTuning(0.92f, 520f)
            }
            2 -> { // Reduced
                tabPosSpring.updateTuning(1.0f, 1800f)
                pressSpring.updateTuning(1.0f, 1800f)
                scaleXSpring.updateTuning(1.0f, 680f)
                scaleYSpring.updateTuning(1.0f, 680f)
                morphSpring.updateTuning(1.0f, 640f)
            }
            else -> { // Fluid
                tabPosSpring.updateTuning(1.0f, 1000f)
                pressSpring.updateTuning(1.0f, 1000f)
                scaleXSpring.updateTuning(0.6f, 250f)
                scaleYSpring.updateTuning(0.7f, 250f)
                morphSpring.updateTuning(0.82f, 320f)
            }
        }
    }

    private fun startAnimationLoop() {
        applyAnimationProfileTuning()
        if (!choreographerRunning) {
            choreographerRunning = true
            lastFrameNanos = 0L
            Choreographer.getInstance().postFrameCallback(frameCallback)
        }
    }

    private fun stepSprings(dt: Float, prevPos: Float): Boolean {
        val m1 = tabPosSpring.step(dt)
        val rawVel = ((tabPosSpring.value - prevPos) / dt) / max(1, tabCount - 1)
        velocitySpring.target = if (isDragging || m1) rawVel else 0f
        val m2 = velocitySpring.step(dt)

        if (releasePendingAfterSnap) {
            val threshold = max(1, tabCount - 1) * 0.025f
            if (abs(tabPosSpring.value - tabPosSpring.target) < threshold) {
                releasePendingAfterSnap = false
                pressSpring.target = 0f
                scaleXSpring.target = 1f
                scaleYSpring.target = 1f
            }
        }

        val m3 = pressSpring.step(dt)
        val m4 = scaleXSpring.step(dt)
        val m5 = scaleYSpring.step(dt)
        val m6 = panelOffsetSpring.step(dt)
        val m7 = morphSpring.step(dt)
        return m1 || m2 || m3 || m4 || m5 || m6 || m7 || releasePendingAfterSnap
    }

    fun getActiveTabIndex(): Int = activeTabIndex

    fun isTouchInteracting(): Boolean = isTouchActive || isDragging

    fun getBarTopOnScreen(): Int {
        if (!tabContainer.isAttachedToWindow || tabContainer.height <= 0) return 0
        tabContainer.getLocationOnScreen(selfLoc)
        return selfLoc[1]
    }

    fun isMorphed(): Boolean = morphed

    fun setMorphed(collapse: Boolean) {
        if (morphed == collapse) return
        morphed = collapse
        morphSpring.target = if (collapse) 1f else 0f
        if (collapse) {
            MergenHaptics.playTick(context)
        }
        startAnimationLoop()
    }

    private fun currentPanelOffsetPx(): Float {
        val pillW = max(1f, width - outsetPx * 2f)
        val fraction = (panelOffsetSpring.value / pillW).coerceIn(-1f, 1f)
        val eased = 1f - (1f - abs(fraction)) * (1f - abs(fraction)) * (1f - abs(fraction))
        return maxPanelOffsetPx * sign(fraction) * eased
    }

    private fun syncTabContainerTransform() {
        val fullW = max(1f, width - outsetPx * 2f)
        val fullH = max(1f, height - outsetPx * 2f)
        val m = morphSpring.value.coerceIn(0f, 1f)
        val compactW = max(fullW * 0.84f, fullW - dp(24f))
        val compactH = min(fullH, dp(42f))
        val curW = lerp(fullW, compactW, m)
        val curH = lerp(fullH, compactH, m)
        val morphInsetX = (fullW - curW) * 0.5f
        val morphTopInset = fullH - curH

        val progress = pressSpring.value.coerceIn(0f, 1f)
        val scale = lerp(1f, 1f + outerPressExpandPx / max(1f, curW), progress)
        val tx = currentPanelOffsetPx()
        tabContainer.translationX = tx
        tabContainer.scaleX = scale
        tabContainer.scaleY = scale

        val count = tabContainer.childCount
        val createIdx = TikTokViewResolver.findCreateTabIndex(tabContainer)
        val fullTabW = max(1f, (fullW - innerPaddingPx * 2f) / max(1, count))
        val curTabW = max(1f, (curW - innerPaddingPx * 2f) / max(1, count))

        for (i in 0 until count) {
            val child = tabContainer.getChildAt(i)
            if (child.alpha != 1f) child.alpha = 1f
            if (child.scaleX != 1f || child.scaleY != 1f) {
                child.scaleX = 1f
                child.scaleY = 1f
            }
            if (child.translationY != 0f) child.translationY = 0f

            if (m <= 0.002f) {
                if (child.translationX != 0f) child.translationX = 0f
                resetMorphSubviews(child)
            } else {
                val fullSlotCx = innerPaddingPx + (i + 0.5f) * fullTabW
                val curSlotCx = morphInsetX + innerPaddingPx + (i + 0.5f) * curTabW
                child.translationX = curSlotCx - fullSlotCx
                applyMorphToTabContent(child, m, morphTopInset, isCreateTab = (i == createIdx))
            }
        }
    }

    private fun resetMorphSubviews(view: View) {
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val c = view.getChildAt(i)
                if (c.alpha != 1f) c.alpha = 1f
                if (c.scaleX != 1f || c.scaleY != 1f) {
                    c.scaleX = 1f
                    c.scaleY = 1f
                }
                if (c.translationY != 0f) c.translationY = 0f
                if (c is ViewGroup) resetMorphSubviews(c)
            }
        }
    }

    private fun isNumericBadgeText(cs: CharSequence?): Boolean {
        val t = cs?.toString()?.trim().orEmpty()
        return t.isNotEmpty() && t.length <= 5 && t[0].isDigit()
    }

    private fun applyMorphToTabContent(tabChild: View, m: Float, morphTopInset: Float, isCreateTab: Boolean) {
        if (tabChild !is ViewGroup) return
        val iconShiftY = if (isCreateTab) morphTopInset * 0.40f else morphTopInset * 0.50f + dp(5.2f)
        val iconScale = lerp(1f, 0.90f, m)
        val hRef = max(1f, tabChild.height.toFloat())
        for (i in 0 until tabChild.childCount) {
            val c = tabChild.getChildAt(i)
            val isBottomLabel = c is TextView &&
                !isNumericBadgeText(c.text) &&
                c.top >= hRef * 0.42f
            if (isBottomLabel) {
                c.alpha = (1f - m * 1.65f).coerceIn(0f, 1f)
                val ts = lerp(1f, 0.72f, m)
                c.scaleX = ts
                c.scaleY = ts
                c.translationY = lerp(0f, dp(4f), m)
            } else {
                if (c.alpha != 1f) c.alpha = 1f
                c.scaleX = iconScale
                c.scaleY = iconScale
                c.translationY = lerp(0f, iconShiftY, m)
            }
        }
    }

    fun syncSelectedTabFromHierarchy(snap: Boolean = false) {
        val count = tabContainer.childCount
        if (count > 0) {
            tabCount = count
            val createIdx = TikTokViewResolver.findCreateTabIndex(tabContainer)
            val host = TikTokViewResolver.findAncestorTabHost(tabContainer)
            val resolved = TikTokViewResolver.getActiveTabIndex(host, tabContainer)
            val foundSelected = if (resolved in 0 until count && resolved != createIdx) resolved else -1
            if (foundSelected >= 0 && foundSelected != activeTabIndex) {
                activeTabIndex = foundSelected
                findHostActivity(context)?.let { act ->
                    DynamicPillController.onTabChanged(act, foundSelected)
                    PeekSheetAndProfileController.onTabChanged(act, foundSelected)
                    RadialMenuController.onTabChanged(act, foundSelected)
                    KineticMediaOverlayController.onTabChanged(act, foundSelected)
                    VideoTransitionController.onTabChanged(act, foundSelected)
                    DanmakuController.onTabChanged(act, foundSelected)
                    LiquidGlassController.onTabChanged(act, foundSelected)
                }
                if (activeTabIndex != 0 && morphed) {
                    setMorphed(false)
                }
                if (snap) {
                    tabPosSpring.snapTo(foundSelected.toFloat())
                } else if (!isDragging) {
                    tabPosSpring.target = foundSelected.toFloat()
                    startAnimationLoop()
                }
            } else if (snap) {
                tabPosSpring.snapTo(activeTabIndex.toFloat())
            } else if (foundSelected >= 0 && !isDragging && !isTouchActive &&
                abs(tabPosSpring.target - foundSelected.toFloat()) > 0.01f
            ) {
                tabPosSpring.target = foundSelected.toFloat()
                startAnimationLoop()
            }
            isLightTheme = detectLightTheme()
        }
    }

    private fun detectLightTheme(): Boolean {
        for (i in 0 until tabContainer.childCount) {
            val tv = findFirstTextView(tabContainer.getChildAt(i))
            if (tv != null) {
                val c = tv.currentTextColor
                val lum = (0.2126f * Color.red(c) + 0.7152f * Color.green(c) + 0.0722f * Color.blue(c)) / 255f
                return lum < 0.45f
            }
        }
        return false
    }

    private fun findFirstTextView(v: View): TextView? {
        if (v is TextView && v.visibility == VISIBLE && v.text.isNotEmpty()) return v
        if (v is ViewGroup) {
            for (i in 0 until v.childCount) {
                val found = findFirstTextView(v.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    fun attachTouchListeners() {
        val count = tabContainer.childCount
        for (i in 0 until count) {
            val child = tabContainer.getChildAt(i)
            child.setOnTouchListener(TabChildTouchListener(i))
        }
        tabContainer.setOnTouchListener(ContainerTouchListener())
    }

    fun detachFromTabContainer() {
        morphed = false
        morphSpring.snapTo(0f)
        val count = tabContainer.childCount
        for (i in 0 until count) {
            val child = tabContainer.getChildAt(i)
            child.setOnTouchListener(null)
            child.alpha = 1f
            child.scaleX = 1f
            child.scaleY = 1f
            child.translationX = 0f
            child.translationY = 0f
            resetMorphSubviews(child)
        }
        tabContainer.setOnTouchListener(null)
        tabContainer.setOnHierarchyChangeListener(null)
        tabContainer.translationX = 0f
        tabContainer.scaleX = 1f
        tabContainer.scaleY = 1f
    }

    private fun beginPress(tabIndex: Int, rawX: Float, rawY: Float) {
        syncSelectedTabFromHierarchy(snap = false)
        isTouchActive = true
        isDragging = false
        releasePendingAfterSnap = false
        dragAccumulatedX = 0f
        lastDragHapticIdx = activeTabIndex
        updateTouchPointFromRaw(rawX, rawY)

        val createIdx = TikTokViewResolver.findCreateTabIndex(tabContainer)
        val pressedScale = 78f / 56f
        pressSpring.target = 1f
        scaleXSpring.target = pressedScale
        scaleYSpring.target = pressedScale
        if (tabIndex != createIdx) {
            tabPosSpring.target = tabIndex.toFloat()
        }
        startAnimationLoop()
    }

    private fun currentMorphWidth(): Float {
        val fullW = max(1f, width - outsetPx * 2f)
        val compactW = max(fullW * 0.84f, fullW - dp(24f))
        return lerp(fullW, compactW, morphSpring.value.coerceIn(0f, 1f))
    }

    private fun updateDrag(dx: Float, rawX: Float, rawY: Float) {
        isDragging = true
        updateTouchPointFromRaw(rawX, rawY)
        val pillW = currentMorphWidth()
        val tabW = max(1f, (pillW - innerPaddingPx * 2f) / max(1, tabCount))
        val isLtr = layoutDirection == LAYOUT_DIRECTION_LTR
        val deltaTab = (dx / tabW) * (if (isLtr) 1f else -1f)
        tabPosSpring.target = (tabPosSpring.target + deltaTab).coerceIn(0f, (tabCount - 1).toFloat())
        val hoverIdx = tabPosSpring.target.roundToInt().coerceIn(0, max(0, tabCount - 1))
        if (hoverIdx != lastDragHapticIdx) {
            lastDragHapticIdx = hoverIdx
            MergenHaptics.playTick(context)
        }
        dragAccumulatedX += dx
        panelOffsetSpring.snapTo(dragAccumulatedX)
        startAnimationLoop()
    }

    private fun finishTouch(wasDragging: Boolean, tappedIndex: Int) {
        isTouchActive = false
        panelOffsetSpring.target = 0f
        val createIdx = TikTokViewResolver.findCreateTabIndex(tabContainer)
        if (wasDragging) {
            val targetIdx = tabPosSpring.target.roundToInt().coerceIn(0, tabCount - 1)
            val isCreate = targetIdx == createIdx
            tabPosSpring.target = if (isCreate) activeTabIndex.toFloat() else targetIdx.toFloat()
            releasePendingAfterSnap = true
            isDragging = false
            startAnimationLoop()

            // Trigger TikTok tab click for selected tab
            if (targetIdx != activeTabIndex || isCreate) {
                MergenHaptics.playSnap(context)
                post {
                    if (targetIdx < tabContainer.childCount) {
                        tabContainer.getChildAt(targetIdx).performClick()
                    }
                    postDelayed({ syncSelectedTabFromHierarchy(snap = false) }, 60L)
                }
            }
        } else {
            val isCreate = tappedIndex == createIdx
            val switchedOrAction = tappedIndex in 0 until tabCount && (tappedIndex != activeTabIndex || isCreate)
            if (switchedOrAction) {
                MergenHaptics.playTap(context)
            }
            if (tappedIndex in 0 until tabCount && !isCreate) {
                activeTabIndex = tappedIndex
                tabPosSpring.target = tappedIndex.toFloat()
                releasePendingAfterSnap = true
            } else {
                // '+' button or outside: spring back smoothly
                tabPosSpring.target = activeTabIndex.toFloat()
                pressSpring.target = 0f
                scaleXSpring.target = 1f
                scaleYSpring.target = 1f
            }
            startAnimationLoop()
            postDelayed({ syncSelectedTabFromHierarchy(snap = false) }, 60L)
        }
    }

    private fun cancelTouch() {
        isTouchActive = false
        isDragging = false
        panelOffsetSpring.target = 0f
        tabPosSpring.target = activeTabIndex.toFloat()
        pressSpring.target = 0f
        scaleXSpring.target = 1f
        scaleYSpring.target = 1f
        startAnimationLoop()
    }

    private fun updateTouchPointFromRaw(rawX: Float, rawY: Float) {
        getLocationOnScreen(selfLoc)
        dragTouchX = rawX - selfLoc[0] - outsetPx
        dragTouchY = rawY - selfLoc[1] - outsetPx
    }

    private fun findHostActivity(ctx: Context): Activity? {
        var c: Context? = ctx
        while (c is ContextWrapper) {
            if (c is Activity) return c
            c = c.baseContext
        }
        return c as? Activity
    }

    private fun handleSwipeUpIfTriggered(downRawX: Float, downRawY: Float, event: MotionEvent): Boolean {
        if (!MergenPrefs.isModEffectivelyActive(context) || !MergenPrefs.isEdgeControlPanelEnabled(context)) {
            return false
        }
        val dy = event.rawY - downRawY
        val dx = event.rawX - downRawX
        val minUp = dp(34f) * MergenPrefs.getGestureThresholdScale(context)
        if (dy < -minUp && abs(dy) > abs(dx) * 1.35f) {
            cancelTouch()
            MergenHaptics.playSnap(context)
            findHostActivity(context)?.let { act ->
                QuickControlSheetController.show(act, backdropSource)
            }
            return true
        }
        return false
    }

    private inner class TabChildTouchListener(private val index: Int) : OnTouchListener {
        private var downRawX = 0f
        private var downRawY = 0f
        private var lastRawX = 0f
        private var dragging = false
        private var handledMorphedTap = false
        private var openedQuickSheet = false

        override fun onTouch(v: View, event: MotionEvent): Boolean {
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    handledMorphedTap = false
                    openedQuickSheet = false
                    downRawX = event.rawX
                    downRawY = event.rawY
                    lastRawX = downRawX
                    dragging = false
                    beginPress(index, downRawX, downRawY)
                    return false
                }

                MotionEvent.ACTION_MOVE -> {
                    if (openedQuickSheet) {
                        v.isPressed = false
                        return true
                    }
                    val totalDx = event.rawX - downRawX
                    val totalDy = event.rawY - downRawY
                    if (!dragging && totalDy < -touchSlop && abs(totalDy) > abs(totalDx) * 1.15f) {
                        v.parent?.requestDisallowInterceptTouchEvent(true)
                        if (handleSwipeUpIfTriggered(downRawX, downRawY, event)) {
                            openedQuickSheet = true
                            v.isPressed = false
                            return true
                        }
                    }
                    if (!dragging && abs(totalDx) > touchSlop && abs(totalDx) > abs(totalDy) * 0.7f) {
                        dragging = true
                        v.parent?.requestDisallowInterceptTouchEvent(true)
                        v.isPressed = false
                    }
                    if (dragging) {
                        val stepDx = event.rawX - lastRawX
                        lastRawX = event.rawX
                        updateDrag(stepDx, event.rawX, event.rawY)
                        v.isPressed = false
                        return true
                    }
                    lastRawX = event.rawX
                    return false
                }

                MotionEvent.ACTION_UP -> {
                    val wasDragging = dragging
                    val wasSheet = openedQuickSheet
                    dragging = false
                    openedQuickSheet = false
                    v.parent?.requestDisallowInterceptTouchEvent(false)
                    if (wasSheet) {
                        v.isPressed = false
                        return true
                    }
                    finishTouch(wasDragging, index)
                    if (wasDragging) {
                        v.isPressed = false
                        return true
                    }
                    return false
                }

                MotionEvent.ACTION_CANCEL -> {
                    dragging = false
                    openedQuickSheet = false
                    v.parent?.requestDisallowInterceptTouchEvent(false)
                    cancelTouch()
                    return false
                }
            }
            return false
        }
    }

    private inner class ContainerTouchListener : OnTouchListener {
        private var downRawX = 0f
        private var downRawY = 0f
        private var lastRawX = 0f
        private var dragging = false
        private var handledMorphedTap = false
        private var openedQuickSheet = false

        override fun onTouch(v: View, event: MotionEvent): Boolean {
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    handledMorphedTap = false
                    openedQuickSheet = false
                    downRawX = event.rawX
                    downRawY = event.rawY
                    lastRawX = downRawX
                    dragging = false
                    val curW = currentMorphWidth()
                    val fullW = max(1f, width - outsetPx * 2f)
                    val morphInsetX = (fullW - curW) * 0.5f
                    val idx = (((event.x - morphInsetX - innerPaddingPx) / max(1f, curW - innerPaddingPx * 2f)) * tabCount)
                        .toInt().coerceIn(0, tabCount - 1)
                    beginPress(idx, downRawX, downRawY)
                    return true
                }

                MotionEvent.ACTION_MOVE -> {
                    if (openedQuickSheet) return true
                    if (!dragging && event.rawY - downRawY < -touchSlop &&
                        abs(event.rawY - downRawY) > abs(event.rawX - downRawX) * 1.15f
                    ) {
                        v.parent?.requestDisallowInterceptTouchEvent(true)
                        if (handleSwipeUpIfTriggered(downRawX, downRawY, event)) {
                            openedQuickSheet = true
                            return true
                        }
                    }
                    val dx = event.rawX - lastRawX
                    lastRawX = event.rawX
                    if (!dragging && abs(event.rawX - downRawX) > touchSlop) {
                        dragging = true
                        v.parent?.requestDisallowInterceptTouchEvent(true)
                    }
                    if (dragging) {
                        updateDrag(dx, event.rawX, event.rawY)
                    }
                    return true
                }

                MotionEvent.ACTION_UP -> {
                    val wasDragging = dragging
                    val wasSheet = openedQuickSheet
                    dragging = false
                    openedQuickSheet = false
                    v.parent?.requestDisallowInterceptTouchEvent(false)
                    if (wasSheet) return true
                    val curW = currentMorphWidth()
                    val fullW = max(1f, width - outsetPx * 2f)
                    val morphInsetX = (fullW - curW) * 0.5f
                    val idx = (((event.x - morphInsetX - innerPaddingPx) / max(1f, curW - innerPaddingPx * 2f)) * tabCount)
                        .toInt().coerceIn(0, tabCount - 1)
                    finishTouch(wasDragging, idx)
                    if (!wasDragging && idx < tabContainer.childCount) {
                        tabContainer.getChildAt(idx).performClick()
                    }
                    return true
                }

                MotionEvent.ACTION_CANCEL -> {
                    dragging = false
                    openedQuickSheet = false
                    v.parent?.requestDisallowInterceptTouchEvent(false)
                    cancelTouch()
                    return true
                }
            }
            return false
        }
    }

    override fun draw(canvas: Canvas) {
        if (KyantShaders.isRecordingBackdrop) return
        super.draw(canvas)
    }

    override fun onDraw(canvas: Canvas) {
        if (isCapturing || KyantShaders.isRecordingBackdrop) return
        if (tabContainer.background != null) {
            tabContainer.background = null
        }
        val fullW = (width - outsetPx * 2).toFloat()
        val fullH = (height - outsetPx * 2).toFloat()
        if (fullW <= 4f || fullH <= 4f) return

        syncSelectedTabFromHierarchy(snap = false)
        isLightTheme = detectLightTheme()

        val m = morphSpring.value.coerceIn(0f, 1f)
        val compactW = max(fullW * 0.84f, fullW - dp(24f))
        val compactH = min(fullH, dp(42f))
        val curW = lerp(fullW, compactW, m)
        val curH = lerp(fullH, compactH, m)
        val morphInsetX = (fullW - curW) * 0.5f
        val morphTopInset = fullH - curH

        val progress = pressSpring.value.coerceIn(0f, 1f)
        val outerScale = lerp(1f, 1f + outerPressExpandPx / max(1f, curW), progress)
        val panelTx = currentPanelOffsetPx()
        val pillRadius = curH * 0.5f

        // 1. Capture live backdrop behind the animated/morphed pill
        captureOuterBackdrop(morphInsetX, morphTopInset, curW, curH)

        val cx = outsetPx + morphInsetX + curW * 0.5f + panelTx
        val cy = outsetPx + morphTopInset + curH * 0.5f

        canvas.save()
        canvas.translate(cx, cy)
        canvas.scale(outerScale, outerScale)
        canvas.translate(-curW * 0.5f, -curH * 0.5f)

        // 2. Soft drop shadow under capsule
        rectF.set(0f, 0f, curW, curH)
        canvas.drawRoundRect(rectF, pillRadius, pillRadius, outerShadowPaint)

        // 3. Clip to capsule and draw refracted/blurred live backdrop
        clipPath.reset()
        clipPath.addRoundRect(rectF, pillRadius, pillRadius, Path.Direction.CW)
        canvas.save()
        canvas.clipPath(clipPath)

        canvas.save()
        canvas.translate(-blurPadPx, -blurPadPx)
        canvas.drawRenderNode(backdropNode)
        canvas.restore()

        // 4. Adaptive Liquid Glass surface tint
        tintPaint.color = if (isLightTheme) {
            Color.argb(115, 250, 250, 252)
        } else {
            Color.argb(88, 32, 32, 40)
        }
        canvas.drawRect(rectF, tintPaint)

        // 5. Kyant0 InteractiveHighlight glow on touch
        if (progress > 0.005f) {
            val tabW = (curW - innerPaddingPx * 2f) / max(1, tabCount)
            val isLtr = layoutDirection == LAYOUT_DIRECTION_LTR
            val indicatorCx = if (isLtr) {
                innerPaddingPx + (tabPosSpring.value + 0.5f) * tabW
            } else {
                curW - innerPaddingPx - (tabPosSpring.value + 0.5f) * tabW
            }
            glowPaint.shader = null
            glowPaint.color = Color.argb((0.08f * progress * 255f).toInt(), 255, 255, 255)
            canvas.drawRect(rectF, glowPaint)

            KyantShaders.configureInteractiveHighlightShader(
                touchGlowShader,
                curW,
                curH,
                indicatorCx,
                curH * 0.5f,
                0.15f * progress
            )
            glowPaint.shader = touchGlowShader
            canvas.drawRect(rectF, glowPaint)
        }

        // 6. Resting selected-tab capsule (stays visible and scales cleanly in morphed mode)
        if (progress < 0.99f) {
            val tabW = (curW - innerPaddingPx * 2f) / max(1, tabCount)
            val isLtr = layoutDirection == LAYOUT_DIRECTION_LTR
            val left = if (isLtr) {
                innerPaddingPx + tabPosSpring.value * tabW
            } else {
                curW - innerPaddingPx - (tabPosSpring.value + 1f) * tabW
            }
            val indH = min(indicatorHeightPx, curH - dp(6f))
            val top = (curH - indH) * 0.5f
            val r = indH * 0.5f
            val restAlpha = ((1f - progress) * if (isLightTheme) 0.11f else 0.17f)
            restingPillPaint.color = if (isLightTheme) {
                Color.argb((restAlpha * 255f).toInt(), 0, 0, 0)
            } else {
                Color.argb((restAlpha * 255f).toInt(), 255, 255, 255)
            }
            rectF.set(left, top, left + tabW, top + indH)
            canvas.drawRoundRect(rectF, r, r, restingPillPaint)
        }

        // 7. Ambient capsule edge + Kyant0 DefaultHighlightShader specular rim
        rectF.set(0f, 0f, curW, curH)
        ambientEdgePaint.color = if (isLightTheme) Color.argb(26, 0, 0, 0) else Color.argb(46, 255, 255, 255)
        canvas.drawRoundRect(rectF, pillRadius, pillRadius, ambientEdgePaint)

        val strokeHalf = ceil(dp(1.25f))
        KyantShaders.configureHighlightShader(
            outerHighlightShader,
            curW,
            curH,
            colorArgb = Color.WHITE,
            angleDegrees = 45f,
            falloff = 1f
        )
        highlightPaint.strokeWidth = strokeHalf * 2f
        highlightPaint.shader = outerHighlightShader
        highlightPaint.alpha = if (isLightTheme) 230 else 210
        canvas.drawRoundRect(rectF, pillRadius, pillRadius, highlightPaint)

        canvas.restore() // unclip
        canvas.restore() // untranslate/scale
    }

    private fun captureOuterBackdrop(
        morphInsetX: Float,
        morphTopInset: Float,
        pillW: Float,
        pillH: Float
    ) {
        val nodeW = ceil(pillW + blurPadPx * 2f).toInt()
        val nodeH = ceil(pillH + blurPadPx * 2f).toInt()
        if (nodeW <= 0 || nodeH <= 0) return

        backdropSource.getLocationInWindow(srcLoc)
        getLocationInWindow(selfLoc)
        val pillLeftInSrc = (selfLoc[0] + outsetPx + morphInsetX) - srcLoc[0]
        val pillTopInSrc = (selfLoc[1] + outsetPx + morphTopInset) - srcLoc[1]

        backdropNode.setPosition(0, 0, nodeW, nodeH)
        backdropNode.setClipToBounds(true)

        isCapturing = true
        KyantShaders.isRecordingBackdrop = true
        val recCanvas: RecordingCanvas = backdropNode.beginRecording(nodeW, nodeH)
        try {
            recCanvas.drawColor(if (isLightTheme) Color.rgb(247, 247, 250) else Color.rgb(20, 20, 26))
            recCanvas.translate(blurPadPx - pillLeftInSrc, blurPadPx - pillTopInSrc)
            backdropSource.draw(recCanvas)
        } catch (_: Throwable) {
            // Keep UI alive if any child throws during offscreen recording
        } finally {
            backdropNode.endRecording()
            KyantShaders.isRecordingBackdrop = false
            isCapturing = false
        }

        val lensOn = MergenPrefs.isGlassLensEnabled(context)
        val effect: RenderEffect = KyantShaders.createOuterPillRenderEffect(
            width = pillW,
            height = pillH,
            offsetX = -blurPadPx,
            offsetY = -blurPadPx,
            blurRadiusPx = blurRadiusPx,
            refractionHeightPx = if (lensOn) min(outerRefractionHeightPx, pillH * 0.48f) else 0f,
            refractionAmountPx = if (lensOn) outerRefractionAmountPx else 0f,
            refractionShader = outerRefractionShader
        )
        backdropNode.setRenderEffect(effect)
    }

    /**
     * Sits directly above [tabContainer] inside FragmentTabHost; draws ONLY while the user
     * presses/drags the jelly capsule (pressProgress > 0.005f), refracting & prismatically
     * dispersing BOTH the live video/feed backdrop AND the TikTok tab icons beneath it.
     */
    private inner class LiquidGlassLensOverlay(context: Context) : View(context) {
        init {
            setWillNotDraw(false)
            isClickable = false
            isFocusable = false
            importantForAccessibility = IMPORTANT_FOR_ACCESSIBILITY_NO
            setLayerType(LAYER_TYPE_HARDWARE, null)
        }

        override fun draw(canvas: Canvas) {
            if (KyantShaders.isRecordingBackdrop) return
            super.draw(canvas)
        }

        override fun onDraw(canvas: Canvas) {
            val m = morphSpring.value.coerceIn(0f, 1f)
            val progress = pressSpring.value.coerceIn(0f, 1f)
            if (progress <= 0.005f || isCapturing || KyantShaders.isRecordingBackdrop) return

            val fullW = (width - outsetPx * 2).toFloat()
            val fullH = (height - outsetPx * 2).toFloat()
            if (fullW <= 4f || fullH <= 4f) return

            val compactW = max(fullW * 0.84f, fullW - dp(24f))
            val compactH = min(fullH, dp(42f))
            val curW = lerp(fullW, compactW, m)
            val curH = lerp(fullH, compactH, m)
            val morphInsetX = (fullW - curW) * 0.5f
            val morphTopInset = fullH - curH

            val tabW = (curW - innerPaddingPx * 2f) / max(1, tabCount)
            val panelTx = currentPanelOffsetPx()
            val isLtr = layoutDirection == LAYOUT_DIRECTION_LTR

            val indicatorLeft = if (isLtr) {
                outsetPx + morphInsetX + innerPaddingPx + tabPosSpring.value * tabW + panelTx
            } else {
                outsetPx + morphInsetX + curW - innerPaddingPx - (tabPosSpring.value + 1f) * tabW + panelTx
            }
            val indicatorCenterX = indicatorLeft + tabW * 0.5f
            val indicatorCenterY = outsetPx + morphTopInset + curH * 0.5f

            val vel = velocitySpring.value / 10f
            val sx = scaleXSpring.value / (1f - (vel * 0.75f).coerceIn(-0.2f, 0.2f))
            val sy = scaleYSpring.value * (1f - (vel * 0.25f).coerceIn(-0.2f, 0.2f))

            val baseIndH = min(indicatorHeightPx, curH - dp(4f))
            val lensW = tabW * sx
            val lensH = baseIndH * sy
            val lensRadius = lensH * 0.5f

            // Capture combined backdropSource + tabContainer behind the lens
            val nodeW = ceil(lensW).toInt().coerceAtLeast(2)
            val nodeH = ceil(lensH).toInt().coerceAtLeast(2)

            backdropSource.getLocationInWindow(srcLoc)
            getLocationInWindow(selfLoc)
            val lensLeftInOverlay = indicatorCenterX - lensW * 0.5f
            val lensTopInOverlay = indicatorCenterY - lensH * 0.5f
            val lensLeftInSrc = (selfLoc[0] + lensLeftInOverlay) - srcLoc[0]
            val lensTopInSrc = (selfLoc[1] + lensTopInOverlay) - srcLoc[1]

            lensNode.setPosition(0, 0, nodeW, nodeH)
            lensNode.setClipToBounds(true)

            isCapturing = true
            KyantShaders.isRecordingBackdrop = true
            val recCanvas = lensNode.beginRecording(nodeW, nodeH)
            try {
                recCanvas.save()
                recCanvas.translate(-lensLeftInSrc, -lensTopInSrc)
                backdropSource.draw(recCanvas)
                recCanvas.restore()

                recCanvas.save()
                recCanvas.translate(
                    outsetPx - lensLeftInOverlay + tabContainer.translationX,
                    outsetPx - lensTopInOverlay + tabContainer.translationY
                )
                recCanvas.scale(tabContainer.scaleX, tabContainer.scaleY, tabContainer.pivotX, tabContainer.pivotY)
                tabContainer.draw(recCanvas)
                recCanvas.restore()
            } catch (_: Throwable) {
                // Safe guard
            } finally {
                lensNode.endRecording()
                KyantShaders.isRecordingBackdrop = false
                isCapturing = false
            }

            val lensOn = MergenPrefs.isGlassLensEnabled(context)
            val lensEffect = if (lensOn) {
                KyantShaders.createActiveLensRenderEffect(
                    width = lensW,
                    height = lensH,
                    offsetX = 0f,
                    offsetY = 0f,
                    refractionHeightPx = dp(10f) * progress,
                    refractionAmountPx = dp(14f) * progress,
                    dispersionShader = lensDispersionShader
                )
            } else {
                null
            }
            lensNode.setRenderEffect(lensEffect)

            canvas.save()
            canvas.translate(lensLeftInOverlay, lensTopInOverlay)

            // Drop shadow under jelly lens
            lensRectF.set(0f, 0f, lensW, lensH)
            lensShadowPaint.setShadowLayer(
                dp(16f) * progress,
                0f,
                dp(4f) * progress,
                Color.argb((0.28f * progress * 255f).toInt(), 0, 0, 0)
            )
            canvas.drawRoundRect(lensRectF, lensRadius, lensRadius, lensShadowPaint)

            // Clip and draw dispersed refracted lens
            lensClipPath.reset()
            lensClipPath.addRoundRect(lensRectF, lensRadius, lensRadius, Path.Direction.CW)
            canvas.save()
            canvas.clipPath(lensClipPath)

            canvas.drawRenderNode(lensNode)

            // Subtle lens glass tint (frost slightly more when refraction lens effect is turned off)
            tintPaint.color = if (lensOn) {
                Color.argb((0.04f * progress * 255f).toInt(), 0, 0, 0)
            } else {
                Color.argb((0.14f * progress * 255f).toInt(), 255, 255, 255)
            }
            canvas.drawRect(lensRectF, tintPaint)

            // Inner shadow ring (Kyant0: InnerShadow(radius = 8.dp * progress, alpha = progress))
            lensInnerShadowPaint.strokeWidth = dp(4f) * progress
            lensInnerShadowPaint.color = Color.argb((0.10f * progress * 255f).toInt(), 0, 0, 0)
            canvas.drawRoundRect(lensRectF, lensRadius, lensRadius, lensInnerShadowPaint)

            // Specular highlight rim
            val strokeHalf = ceil(dp(1.25f))
            KyantShaders.configureHighlightShader(
                lensHighlightShader,
                lensW,
                lensH,
                colorArgb = Color.WHITE,
                angleDegrees = 45f,
                falloff = 1f
            )
            highlightPaint.strokeWidth = strokeHalf * 2f
            highlightPaint.shader = lensHighlightShader
            highlightPaint.alpha = (progress * 210f).toInt().coerceIn(0, 255)
            canvas.drawRoundRect(lensRectF, lensRadius, lensRadius, highlightPaint)

            canvas.restore() // unclip
            canvas.restore() // untranslate
        }
    }

    /**
     * Exact semi-implicit Euler damped harmonic oscillator matching Compose spring(dampingRatio, stiffness).
     */
    private class Spring1D(
        initial: Float,
        private var dampingRatio: Float,
        private var stiffness: Float
    ) {
        var value: Float = initial
            private set
        var velocity: Float = 0f
            private set
        var target: Float = initial

        fun updateTuning(damping: Float, stiff: Float) {
            dampingRatio = damping
            stiffness = stiff
        }

        fun snapTo(newVal: Float) {
            value = newVal
            target = newVal
            velocity = 0f
        }

        fun step(dt: Float): Boolean {
            val steps = 4
            val subDt = dt / steps
            val damping = 2f * dampingRatio * sqrt(stiffness)
            for (i in 0 until steps) {
                val accel = stiffness * (target - value) - damping * velocity
                velocity += accel * subDt
                value += velocity * subDt
            }
            if (abs(target - value) < 0.0005f && abs(velocity) < 0.002f) {
                value = target
                velocity = 0f
                return false
            }
            return true
        }
    }

    companion object {
        fun applyCapsuleOutline(view: View) {
            view.outlineProvider = object : ViewOutlineProvider() {
                override fun getOutline(v: View, outline: Outline) {
                    val r = v.height * 0.5f
                    outline.setRoundRect(0, 0, v.width, v.height, r)
                }
            }
            view.clipToOutline = true
        }

        private fun lerp(a: Float, b: Float, t: Float): Float = a + (b - a) * t
    }
}
