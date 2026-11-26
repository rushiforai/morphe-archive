package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.RectF
import android.graphics.Typeface
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.util.TypedValue
import android.view.Choreographer
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.ViewGroup
import android.view.animation.DecelerateInterpolator
import android.widget.FrameLayout
import java.util.WeakHashMap
import java.util.concurrent.Executors
import kotlin.math.abs
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt

/**
 * Faz 2 (Consolidated) — Floating Non-Touchable Comment Danmaku Overlay.
 *
 * Fetches real comments on 1-second video dwell via TikTok's native signed
 * BarrageCommentAndLikeApi.LIZIZ.fetchCommentList(...).LIZLLL(), caches up to 2 aids,
 * and scrolls bubbles smoothly across 3 top lanes with staggered directional swipe-exit
 * animations + motion blur when switching videos.
 */
object DanmakuController {

    private const val TAG = "TikTokLiquidGlass"

    private data class DanmakuComment(
        val author: String,
        val text: String
    )

    private class DanmakuState(
        var overlayView: DanmakuOverlayView? = null,
        var cleanScreen: Boolean = false,
        var activeTab: Int = 0,
        var currentAid: String = "",
        var lastSwipeDir: Float = -1f,
        var dwellRunnable: Runnable? = null,
        var pollRunnable: Runnable? = null
    )

    private val states = WeakHashMap<Activity, DanmakuState>()
    private val mainHandler = Handler(Looper.getMainLooper())
    private val fetchExecutor = Executors.newSingleThreadExecutor()

    private val cacheLock = Any()
    private val commentCache = object : LinkedHashMap<String, List<DanmakuComment>>(4, 0.75f, true) {
        override fun removeEldestEntry(eldest: MutableMap.MutableEntry<String, List<DanmakuComment>>?): Boolean =
            size > 2
    }

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)

    fun sync(activity: Activity) {
        if (activity.isFinishing || activity.isDestroyed) return
        if (!MergenPrefs.isModEffectivelyActive(activity) ||
            !MergenPrefs.isDanmakuEnabled(activity) ||
            TikTokViewResolver.isSettingsActivity(activity)
        ) {
            hideAndStop(activity)
            return
        }

        val state = states.getOrPut(activity) { DanmakuState() }
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        content.post {
            if (activity.isFinishing || activity.isDestroyed || states[activity] !== state) return@post
            ensureOverlay(activity, content, state)
            updateOverlayVisibility(activity, state)
            startWatcher(activity, state)
        }
    }

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        val state = states[activity] ?: return
        state.activeTab = tabIndex
        updateOverlayVisibility(activity, state)
    }

    fun setCleanScreen(activity: Activity, clean: Boolean) {
        val state = states[activity] ?: return
        state.cleanScreen = clean
        updateOverlayVisibility(activity, state)
    }

    /**
     * Continuous 1:1 vertical scroll progress from VideoTransitionController (`-1f..+1f`,
     * positive when swiping up toward the next video, negative when pulling down toward previous).
     * Active bubbles scrub smoothly upward/downward and fade proportionally, reversing seamlessly
     * if the user releases back to the current video.
     */
    fun onFeedScroll(activity: Activity, deltaY: Int, scrollProgress: Float) {
        val state = states[activity] ?: return
        if (deltaY != 0) {
            state.lastSwipeDir = if (deltaY > 0) -1f else 1f
        } else if (abs(scrollProgress) > 0.02f) {
            state.lastSwipeDir = if (scrollProgress > 0f) -1f else 1f
        }
        state.overlayView?.setScrollProgress(scrollProgress, deltaY)
    }

    fun onFeedPageChanged(activity: Activity, directionY: Float) {
        val state = states[activity] ?: return
        state.lastSwipeDir = directionY
        state.overlayView?.onPageCommitted(directionY)
    }

    fun detach(activity: Activity) {
        val state = states.remove(activity) ?: return
        stopWatcher(state)
        state.overlayView?.let { ov ->
            MergenMotionBlur.clear(ov)
            ov.clearAllImmediate()
            val p = ov.parent as? ViewGroup
            p?.post {
                if (ov.parent === p) p.removeView(ov)
            }
        }
        state.overlayView = null
    }

    private fun hideAndStop(activity: Activity) {
        val state = states[activity] ?: return
        stopWatcher(state)
        state.currentAid = ""
        state.overlayView?.let { ov ->
            ov.clearAllImmediate()
            if (ov.visibility == View.VISIBLE) {
                MergenMotionBlur.animatePop(
                    view = ov,
                    fromScale = ov.scaleX,
                    toScale = 0.96f,
                    fromAlpha = ov.alpha,
                    toAlpha = 0f,
                    durationMs = 150L,
                    interpolator = DecelerateInterpolator(),
                    maxBlurDp = 5f
                ) {
                    ov.visibility = View.GONE
                    ov.scaleX = 1f
                    ov.scaleY = 1f
                    ov.alpha = 1f
                }
            }
        }
    }

    private fun ensureOverlay(activity: Activity, content: ViewGroup, state: DanmakuState) {
        val decor = activity.window?.decorView ?: content
        val statusTop = TikTokViewResolver.statusBarTopInset(activity, decor)
        val kyant0 = MergenPrefs.isKyant0Style(activity)

        val wantedH = statusTop + dp(activity, 210f)
        val wantedBaseTop = statusTop + MergenDesign.dpF(activity, 52f) + MergenDesign.dpF(activity, 16f)

        if (state.overlayView == null) {
            val view = DanmakuOverlayView(activity).apply {
                setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                visibility = View.GONE
                elevation = MergenDesign.dpF(activity, 8f)
                setBaseTopPx(wantedBaseTop)
            }
            state.overlayView = view
            content.addView(
                view,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    wantedH,
                    Gravity.TOP or Gravity.START
                ).apply {
                    topMargin = 0
                }
            )
        } else {
            state.overlayView?.setBaseTopPx(wantedBaseTop)
            (state.overlayView?.layoutParams as? FrameLayout.LayoutParams)?.let { lp ->
                if (lp.topMargin != 0 || lp.height != wantedH) {
                    lp.topMargin = 0
                    lp.height = wantedH
                    state.overlayView?.layoutParams = lp
                }
            }
        }
        state.overlayView?.setTheme(kyant0)
        state.overlayView?.setDensity(MergenPrefs.getDanmakuDensity(activity))
    }

    private fun updateOverlayVisibility(activity: Activity, state: DanmakuState) {
        val ov = state.overlayView ?: return
        val decor = activity.window?.decorView ?: return
        val host = TikTokViewResolver.findFragmentTabHost(decor)
        val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
        val onFeed = (state.activeTab == 0 || state.activeTab == 1) &&
            TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer) &&
            !TikTokViewResolver.isOwnProfileActive(activity, decor, tabContainer) &&
            !TikTokViewResolver.isFeedOverlaySheetOpen(activity, decor, host)

        val shouldShow = onFeed &&
            !state.cleanScreen &&
            MergenPrefs.isModEffectivelyActive(activity) &&
            MergenPrefs.isDanmakuEnabled(activity)

        if (shouldShow) {
            ov.setTheme(MergenPrefs.isKyant0Style(activity))
            ov.setDensity(MergenPrefs.getDanmakuDensity(activity))
            if (ov.visibility != View.VISIBLE) {
                ov.visibility = View.VISIBLE
                MergenMotionBlur.animatePop(
                    view = ov,
                    fromScale = 0.96f,
                    toScale = 1f,
                    fromAlpha = 0f,
                    toAlpha = 1f,
                    durationMs = 190L,
                    interpolator = DecelerateInterpolator(1.6f),
                    maxBlurDp = 5f
                )
            }
        } else {
            state.currentAid = ""
            ov.clearAllImmediate()
            if (ov.visibility != View.GONE) {
                ov.visibility = View.GONE
            }
        }
    }

    private fun startWatcher(activity: Activity, state: DanmakuState) {
        if (state.pollRunnable != null) return
        val r = object : Runnable {
            override fun run() {
                if (states[activity] !== state || activity.isFinishing || activity.isDestroyed) return
                if (MergenPrefs.isModEffectivelyActive(activity) && MergenPrefs.isDanmakuEnabled(activity)) {
                    pollActiveVideoComments(activity, state)
                    mainHandler.postDelayed(this, 180L)
                } else {
                    stopWatcher(state)
                }
            }
        }
        state.pollRunnable = r
        mainHandler.postDelayed(r, 200L)
    }

    private fun stopWatcher(state: DanmakuState) {
        state.pollRunnable?.let { mainHandler.removeCallbacks(it) }
        state.pollRunnable = null
        state.dwellRunnable?.let { mainHandler.removeCallbacks(it) }
        state.dwellRunnable = null
    }

    private fun pollActiveVideoComments(activity: Activity, state: DanmakuState) {
        val decor = activity.window?.decorView ?: return
        val ov = state.overlayView ?: return
        if (state.cleanScreen ||
            !TikTokViewResolver.isOnFeedTab(activity, decor, null) ||
            TikTokViewResolver.isOwnProfileActive(activity, decor, null) ||
            TikTokViewResolver.isFeedOverlaySheetOpen(activity, decor, null)
        ) {
            updateOverlayVisibility(activity, state)
            return
        }
        if (ov.visibility != View.VISIBLE) {
            updateOverlayVisibility(activity, state)
        }

        val info = TikTokCreatorExtractor.extractActiveAwemeInfo(activity, decor) ?: return
        if (info.aid == state.currentAid) return

        state.currentAid = info.aid
        // Retire remaining active bubbles only if onPageCommitted hasn't already cleared/swept them
        if (ov.hasActiveContent()) {
            ov.sweepExitCurrentComments(state.lastSwipeDir)
        }
        state.dwellRunnable?.let { mainHandler.removeCallbacks(it) }

        val cached = synchronized(cacheLock) { commentCache[info.aid] }
        if (cached != null) {
            ov.setComments(cached)
            return
        }

        val capturedAid = info.aid
        val capturedCount = info.commentCount
        val dwell = Runnable {
            if (states[activity] !== state ||
                state.currentAid != capturedAid ||
                activity.isFinishing ||
                activity.isDestroyed ||
                !MergenPrefs.isModEffectivelyActive(activity) ||
                !MergenPrefs.isDanmakuEnabled(activity)
            ) {
                return@Runnable
            }
            fetchCommentsAsync(activity, state, capturedAid, capturedCount)
        }
        state.dwellRunnable = dwell
        mainHandler.postDelayed(dwell, 1000L)
    }

    private fun fetchCommentsAsync(
        activity: Activity,
        state: DanmakuState,
        aid: String,
        commentCount: Long
    ) {
        fetchExecutor.execute {
            val fetched = try {
                val apiCls = Class.forName("com.ss.android.ugc.aweme.comment.bubble.BarrageCommentAndLikeApi")
                val inst = apiCls.getField("LIZIZ").get(null)
                val fetchMethod = apiCls.getMethod(
                    "fetchCommentList",
                    String::class.java,
                    Long::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    String::class.java,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    Int::class.javaPrimitiveType,
                    Boolean::class.javaPrimitiveType,
                    Long::class.javaPrimitiveType,
                    Integer::class.java,
                    String::class.java
                )
                val observable = fetchMethod.invoke(
                    inst,
                    aid,
                    0L,
                    0,
                    30,
                    null,
                    1,
                    2,
                    1,
                    false,
                    commentCount,
                    null,
                    "homepage_hot"
                ) ?: return@execute
                val blockingFirst = observable.javaClass.getMethod("LIZLLL")
                val resp = blockingFirst.invoke(observable) ?: return@execute
                parseComments(resp)
            } catch (t: Throwable) {
                Log.d(TAG, "Danmaku fetch skipped for aid=$aid: ${t.javaClass.simpleName}: ${t.message}")
                emptyList()
            }

            if (fetched.isEmpty()) return@execute
            synchronized(cacheLock) {
                commentCache[aid] = fetched
            }
            mainHandler.post {
                if (states[activity] === state &&
                    state.currentAid == aid &&
                    !activity.isFinishing &&
                    !activity.isDestroyed &&
                    MergenPrefs.isModEffectivelyActive(activity) &&
                    MergenPrefs.isDanmakuEnabled(activity)
                ) {
                    state.overlayView?.setComments(fetched)
                }
            }
        }
    }

    private fun parseComments(resp: Any): List<DanmakuComment> {
        val rawItems = (readProp(resp, "getItems", "items") as? List<*>) ?: return emptyList()
        val result = ArrayList<DanmakuComment>(min(30, rawItems.size))
        for (c in rawItems) {
            if (c == null) continue
            val rawText = (readProp(c, "getText", "text") as? String)
                ?.replace('\n', ' ')
                ?.replace('\r', ' ')
                ?.trim()
                .orEmpty()
            if (rawText.isEmpty()) continue
            val cleanText = if (rawText.length <= 68) rawText else rawText.substring(0, 67) + "…"
            val user = readProp(c, "getUser", "user")
            val rawAuthor = (user?.let {
                (readProp(it, "getNickname", "nickname") as? String)?.trim()?.takeIf { n -> n.isNotEmpty() }
                    ?: (readProp(it, "getUniqueId", "uniqueId") as? String)?.trim()
            }).orEmpty()
            val cleanAuthor = if (rawAuthor.length <= 14) rawAuthor else rawAuthor.substring(0, 13) + "…"
            result.add(DanmakuComment(author = cleanAuthor, text = cleanText))
            if (result.size >= 30) break
        }
        return result
    }

    private fun readProp(obj: Any, method: String, field: String?): Any? {
        try {
            return obj.javaClass.getMethod(method).invoke(obj)
        } catch (_: Throwable) {
        }
        if (field != null) {
            var c: Class<*>? = obj.javaClass
            while (c != null) {
                try {
                    val f = c.getDeclaredField(field).apply { isAccessible = true }
                    return f.get(obj)
                } catch (_: Throwable) {
                    c = c.superclass
                }
            }
        }
        return null
    }

    private class DanmakuOverlayView(context: Context) : View(context) {

        private fun dpF(v: Float): Float =
            TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

        private data class ActiveBubble(
            val label: String,
            val lane: Int,
            var x: Float,
            val width: Float,
            val speedPxPerSec: Float,
            var enterProgress: Float = 0f
        )

        private data class ExitingBubble(
            val label: String,
            var x: Float,
            var y: Float,
            val width: Float,
            val baseSpeedX: Float,
            val exitDirY: Float,
            var elapsedSec: Float = 0f,
            val staggerDelaySec: Float = 0f,
            val durationSec: Float = 0.34f,
            val startScale: Float = 1f,
            val startAlpha: Float = 1f
        )

        private var kyant0 = false
        private var densityLevel = 1
        private var spawnIntervalNanos = 1_300_000_000L
        private var maxActiveBubbles = 6
        private var activeLaneCount = 3
        private var minLaneGapPx = dpF(26f)
        private var comments: List<DanmakuComment> = emptyList()
        private var nextSpawnIdx = 0
        private var lastSpawnNanos = 0L
        private var lastFrameNanos = 0L
        private var loopRunning = false
        private val activeBubbles = ArrayList<ActiveBubble>(16)
        private val exitingBubbles = ArrayList<ExitingBubble>(16)

        private var scrollProgress = 0f
        private var hasExitMotionBlur = false
        private var hasScrubMotionBlur = false
        private var lastScrubMotionNanos = 0L
        private var scrubSpeedPxPerSec = 0f

        private val bubbleH = dpF(26f)
        private val laneStride = dpF(34f)
        private var laneTopOffset = dpF(68f)
        private val edgeFadePx = dpF(24f)
        private val blurSpeedRef = dpF(900f)

        private val bgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(0.95f)
        }
        private val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 11.5f, resources.displayMetrics)
            typeface = Typeface.create("sans-serif-medium", Typeface.NORMAL)
        }
        private val rect = RectF()

        private val frameCallback = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                val dt = if (lastFrameNanos == 0L) 1f / 120f else ((frameTimeNanos - lastFrameNanos) / 1_000_000_000f).coerceIn(0.001f, 0.05f)
                lastFrameNanos = frameTimeNanos

                val w = width.toFloat()
                if (w > 0f && comments.isNotEmpty() &&
                    abs(scrollProgress) <= 0.12f &&
                    activeBubbles.size < maxActiveBubbles &&
                    (frameTimeNanos - lastSpawnNanos) >= spawnIntervalNanos
                ) {
                    trySpawnNextBubble(w, frameTimeNanos)
                }

                // Update active comments (smooth scroll + gentle 240ms entrance)
                val it = activeBubbles.iterator()
                while (it.hasNext()) {
                    val b = it.next()
                    b.x -= b.speedPxPerSec * dt
                    if (b.enterProgress < 1f) {
                        b.enterProgress = (b.enterProgress + dt / 0.24f).coerceAtMost(1f)
                    }
                    if (b.x + b.width < -dpF(16f)) {
                        it.remove()
                    }
                }

                // Update exiting comments from previous video with staggered directional sweep
                var maxExitVelY = 0f
                val exitIt = exitingBubbles.iterator()
                while (exitIt.hasNext()) {
                    val eb = exitIt.next()
                    eb.elapsedSec += dt
                    val activeTime = eb.elapsedSec - eb.staggerDelaySec
                    if (activeTime >= eb.durationSec) {
                        exitIt.remove()
                        continue
                    }
                    if (activeTime > 0f) {
                        val t = (activeTime / eb.durationSec).coerceIn(0f, 1f)
                        val accel = 0.55f + 1.45f * t
                        val vy = eb.exitDirY * dpF(210f) * accel
                        eb.y += vy * dt
                        eb.x -= (eb.baseSpeedX + dpF(110f) * t) * dt
                        maxExitVelY = max(maxExitVelY, abs(vy))
                    } else {
                        eb.x -= eb.baseSpeedX * dt
                    }
                }

                if (exitingBubbles.isNotEmpty() && maxExitVelY > dpF(35f)) {
                    hasExitMotionBlur = true
                    hasScrubMotionBlur = false
                    MergenMotionBlur.applyDragVelocityBlur(
                        view = this@DanmakuOverlayView,
                        vxPxPerSec = 0f,
                        vyPxPerSec = maxExitVelY.coerceAtMost(blurSpeedRef),
                        maxBlurDp = 5.5f
                    )
                } else {
                    if (hasExitMotionBlur) {
                        hasExitMotionBlur = false
                    }
                    val sinceScrubMs = (frameTimeNanos - lastScrubMotionNanos) / 1_000_000L
                    if (abs(scrollProgress) > 0.02f &&
                        sinceScrubMs < 90L &&
                        scrubSpeedPxPerSec > dpF(60f) &&
                        !MergenSpringEngine.isReducedMotion(context)
                    ) {
                        hasScrubMotionBlur = true
                        MergenMotionBlur.applyDragVelocityBlur(
                            view = this@DanmakuOverlayView,
                            vxPxPerSec = 0f,
                            vyPxPerSec = scrubSpeedPxPerSec.coerceAtMost(blurSpeedRef),
                            maxBlurDp = 4.5f
                        )
                    } else if (hasScrubMotionBlur || !hasExitMotionBlur) {
                        if (hasScrubMotionBlur) {
                            hasScrubMotionBlur = false
                            MergenMotionBlur.clear(this@DanmakuOverlayView)
                        } else if (!hasExitMotionBlur) {
                            MergenMotionBlur.clear(this@DanmakuOverlayView)
                        }
                    }
                }

                invalidate()
                if (comments.isNotEmpty() || activeBubbles.isNotEmpty() || exitingBubbles.isNotEmpty()) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    loopRunning = false
                    lastFrameNanos = 0L
                }
            }
        }

        init {
            setWillNotDraw(false)
            isClickable = false
            isFocusable = false
            importantForAccessibility = IMPORTANT_FOR_ACCESSIBILITY_NO
        }

        override fun onTouchEvent(event: MotionEvent?): Boolean = false

        override fun onDetachedFromWindow() {
            Choreographer.getInstance().removeFrameCallback(frameCallback)
            loopRunning = false
            if (hasExitMotionBlur) {
                hasExitMotionBlur = false
                MergenMotionBlur.clear(this)
            }
            super.onDetachedFromWindow()
        }

        fun setTheme(isKyant0: Boolean) {
            if (kyant0 != isKyant0) {
                kyant0 = isKyant0
                textPaint.typeface = if (isKyant0) {
                    Typeface.create("sans-serif-medium", Typeface.NORMAL)
                } else {
                    Typeface.create(Typeface.MONOSPACE, Typeface.NORMAL)
                }
                invalidate()
            }
        }

        fun setDensity(level: Int) {
            val clamped = level.coerceIn(0, 2)
            if (densityLevel == clamped) return
            densityLevel = clamped
            when (clamped) {
                0 -> {
                    spawnIntervalNanos = 2_450_000_000L
                    maxActiveBubbles = 3
                    activeLaneCount = 2
                    minLaneGapPx = dpF(44f)
                }
                2 -> {
                    spawnIntervalNanos = 560_000_000L
                    maxActiveBubbles = 12
                    activeLaneCount = 3
                    minLaneGapPx = dpF(14f)
                }
                else -> {
                    spawnIntervalNanos = 1_300_000_000L
                    maxActiveBubbles = 6
                    activeLaneCount = 3
                    minLaneGapPx = dpF(26f)
                }
            }
        }

        fun setBaseTopPx(topPx: Float) {
            if (abs(laneTopOffset - topPx) >= 0.5f) {
                laneTopOffset = topPx
                invalidate()
            }
        }

        fun hasActiveContent(): Boolean = activeBubbles.isNotEmpty() || comments.isNotEmpty()

        fun setScrollProgress(progress: Float, deltaY: Int) {
            val clamped = progress.coerceIn(-1f, 1f)
            val nowNs = System.nanoTime()
            if (deltaY != 0) {
                val dtSec = if (lastScrubMotionNanos == 0L) {
                    1f / 120f
                } else {
                    ((nowNs - lastScrubMotionNanos) / 1_000_000_000f).coerceIn(0.004f, 0.06f)
                }
                scrubSpeedPxPerSec = (abs(deltaY).toFloat() / dtSec)
                lastScrubMotionNanos = nowNs
            }
            if (abs(clamped - scrollProgress) >= 0.003f) {
                scrollProgress = clamped
                if (abs(clamped) <= 0.01f && hasScrubMotionBlur && !hasExitMotionBlur) {
                    hasScrubMotionBlur = false
                    scrubSpeedPxPerSec = 0f
                    MergenMotionBlur.clear(this)
                }
                invalidate()
            }
        }

        fun onPageCommitted(directionY: Float) {
            if (abs(scrollProgress) >= 0.80f) {
                comments = emptyList()
                activeBubbles.clear()
                nextSpawnIdx = 0
                scrollProgress = 0f
                scrubSpeedPxPerSec = 0f
                if (hasScrubMotionBlur && exitingBubbles.isEmpty()) {
                    hasScrubMotionBlur = false
                    MergenMotionBlur.clear(this)
                }
                invalidate()
            } else {
                sweepExitCurrentComments(directionY)
            }
        }

        fun clearAllImmediate() {
            comments = emptyList()
            activeBubbles.clear()
            exitingBubbles.clear()
            nextSpawnIdx = 0
            scrollProgress = 0f
            scrubSpeedPxPerSec = 0f
            if (hasExitMotionBlur || hasScrubMotionBlur) {
                hasExitMotionBlur = false
                hasScrubMotionBlur = false
                MergenMotionBlur.clear(this)
            }
            invalidate()
        }

        fun sweepExitCurrentComments(directionY: Float) {
            val p = abs(scrollProgress).coerceIn(0f, 1f)
            val scrubDir = if (scrollProgress >= 0f) -1f else 1f
            val invP = (1f - p).coerceIn(0f, 1f)
            val dragAlpha = (invP * (0.65f + 0.35f * invP)).coerceIn(0f, 1f)
            val dragScale = 1f - 0.14f * p
            val dir = if (directionY >= 0f) 1f else -1f

            if (activeBubbles.isNotEmpty() && dragAlpha > 0.03f) {
                for (b in activeBubbles) {
                    val laneLead = (if (scrubDir < 0f) (2 - b.lane) else b.lane) * dpF(14f)
                    val dragOffsetY = scrubDir * p * (dpF(138f) + laneLead)
                    val startTop = laneTopOffset + b.lane * laneStride + dragOffsetY
                    val stagger = (if (dir < 0f) b.lane else (2 - b.lane)) * 0.036f
                    exitingBubbles.add(
                        ExitingBubble(
                            label = b.label,
                            x = b.x,
                            y = startTop,
                            width = b.width,
                            baseSpeedX = b.speedPxPerSec,
                            exitDirY = dir,
                            staggerDelaySec = stagger,
                            durationSec = (0.34f * (1f - p * 0.45f)).coerceAtLeast(0.14f),
                            startScale = dragScale,
                            startAlpha = dragAlpha * b.enterProgress.coerceIn(0.2f, 1f)
                        )
                    )
                }
            }
            activeBubbles.clear()
            comments = emptyList()
            nextSpawnIdx = 0
            scrollProgress = 0f
            scrubSpeedPxPerSec = 0f
            ensureLoopRunning()
        }

        fun setComments(list: List<DanmakuComment>) {
            comments = list
            activeBubbles.clear()
            nextSpawnIdx = 0
            lastSpawnNanos = 0L
            scrollProgress = 0f
            scrubSpeedPxPerSec = 0f
            if (list.isNotEmpty() && width > 0) {
                val now = System.nanoTime()
                trySpawnNextBubble(width.toFloat(), now)
                if (densityLevel == 2 && list.size > 1 && activeBubbles.size < maxActiveBubbles) {
                    trySpawnNextBubble(width.toFloat(), now)
                }
            }
            if (list.isNotEmpty()) {
                ensureLoopRunning()
            }
        }

        private fun ensureLoopRunning() {
            if (!loopRunning) {
                loopRunning = true
                lastFrameNanos = 0L
                Choreographer.getInstance().postFrameCallback(frameCallback)
            }
        }

        private fun trySpawnNextBubble(viewW: Float, nowNanos: Long) {
            if (comments.isEmpty() || activeBubbles.size >= maxActiveBubbles) return
            val freeLane = findFreeLane(viewW) ?: return
            val c = comments[nextSpawnIdx % comments.size]
            nextSpawnIdx++
            val label = if (c.author.isNotEmpty()) "${c.author}: ${c.text}" else c.text
            val w = textPaint.measureText(label) + dpF(22f)
            val baseSpeed = dpF(66f + ((freeLane * 11 + (nextSpawnIdx % 3) * 8).toFloat()))
            activeBubbles.add(
                ActiveBubble(
                    label = label,
                    lane = freeLane,
                    x = viewW + dpF(8f),
                    width = w,
                    speedPxPerSec = baseSpeed,
                    enterProgress = 0f
                )
            )
            lastSpawnNanos = nowNanos
        }

        private fun findFreeLane(viewW: Float): Int? {
            val lanes = activeLaneCount.coerceIn(1, 3)
            val laneOffset = nextSpawnIdx % lanes
            for (k in 0 until lanes) {
                val lane = (laneOffset + k) % lanes
                var maxRight = -1f
                for (b in activeBubbles) {
                    if (b.lane == lane && b.x + b.width > maxRight) {
                        maxRight = b.x + b.width
                    }
                }
                if (maxRight < viewW - minLaneGapPx) {
                    return lane
                }
            }
            return null
        }

        override fun onDraw(canvas: Canvas) {
            if (activeBubbles.isEmpty() && exitingBubbles.isEmpty()) return
            val w = width.toFloat()
            if (w <= 0f) return
            val fm = textPaint.fontMetrics
            val corner = if (kyant0) bubbleH * 0.5f else 0f

            // 1. Draw exiting bubbles from previous video first (gliding away smoothly)
            for (eb in exitingBubbles) {
                val activeTime = (eb.elapsedSec - eb.staggerDelaySec).coerceAtLeast(0f)
                val t = (activeTime / eb.durationSec).coerceIn(0f, 1f)
                val invT = 1f - t
                val fadeT = invT * invT * invT
                val rightVis = ((w - eb.x) / edgeFadePx).coerceIn(0f, 1f)
                val leftVis = ((eb.x + eb.width) / edgeFadePx).coerceIn(0f, 1f)
                val alphaFactor = min(rightVis, leftVis) * eb.startAlpha * fadeT
                if (alphaFactor <= 0.02f) continue

                val scale = eb.startScale * (1f - 0.16f * t)
                drawBubble(canvas, eb.label, eb.x, eb.y, eb.width, corner, scale, alphaFactor, fm)
            }

            // 2. Draw active bubbles with 1:1 continuous reversible finger scrubbing & crisp 240ms entrance
            val p = abs(scrollProgress).coerceIn(0f, 1f)
            val scrubDir = if (scrollProgress >= 0f) -1f else 1f
            val invP = (1f - p).coerceIn(0f, 1f)
            val dragAlpha = (invP * (0.65f + 0.35f * invP)).coerceIn(0f, 1f)
            val dragScale = 1f - 0.14f * p

            if (dragAlpha > 0.02f) {
                for (b in activeBubbles) {
                    val enter = b.enterProgress.coerceIn(0f, 1f)
                    val invE = 1f - enter
                    val easeEnter = 1f - invE * invE * invE
                    val enterShiftY = (1f - easeEnter) * dpF(8f)
                    val laneLead = (if (scrubDir < 0f) (2 - b.lane) else b.lane) * dpF(14f)
                    val scrubShiftY = scrubDir * p * (dpF(138f) + laneLead)
                    val top = laneTopOffset + b.lane * laneStride + scrubShiftY + enterShiftY

                    val rightVis = ((w - b.x) / edgeFadePx).coerceIn(0f, 1f)
                    val leftVis = ((b.x + b.width) / edgeFadePx).coerceIn(0f, 1f)
                    val alphaFactor = min(rightVis, leftVis) * dragAlpha * easeEnter
                    if (alphaFactor <= 0.02f) continue

                    val scale = dragScale * (0.90f + 0.10f * easeEnter)
                    drawBubble(canvas, b.label, b.x, top, b.width, corner, scale, alphaFactor, fm)
                }
            }
        }

        private fun drawBubble(
            canvas: Canvas,
            label: String,
            left: Float,
            top: Float,
            bubbleW: Float,
            corner: Float,
            scale: Float,
            alphaFactor: Float,
            fm: Paint.FontMetrics
        ) {
            val needScale = abs(scale - 1f) > 0.005f
            if (needScale) {
                canvas.save()
                canvas.scale(scale, scale, left + bubbleW * 0.5f, top + bubbleH * 0.5f)
            }

            rect.set(left, top, left + bubbleW, top + bubbleH)
            bgPaint.color = if (kyant0) {
                Color.argb((alphaFactor * 145f).roundToInt(), 18, 20, 28)
            } else {
                Color.argb((alphaFactor * 204f).roundToInt(), 0, 0, 0)
            }
            strokePaint.color = if (kyant0) {
                Color.argb((alphaFactor * 115f).roundToInt(), 255, 255, 255)
            } else {
                Color.argb((alphaFactor * 130f).roundToInt(), 255, 255, 255)
            }
            canvas.drawRoundRect(rect, corner, corner, bgPaint)
            canvas.drawRoundRect(rect, corner, corner, strokePaint)

            textPaint.color = Color.argb((alphaFactor * 242f).roundToInt(), 255, 255, 255)
            val baseline = top + bubbleH * 0.5f - (fm.ascent + fm.descent) * 0.5f
            canvas.drawText(label, left + dpF(11f), baseline, textPaint)

            if (needScale) {
                canvas.restore()
            }
        }
    }
}
