package com.sarp.tiktokliquidglass

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Paint
import android.graphics.Path
import android.graphics.RectF
import android.graphics.RenderEffect
import android.graphics.RenderNode
import android.graphics.RuntimeShader
import android.graphics.Shader
import android.graphics.Typeface
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.util.TypedValue
import android.view.Choreographer
import android.view.Gravity
import android.view.MotionEvent
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.view.animation.DecelerateInterpolator
import android.view.animation.OvershootInterpolator
import android.widget.FrameLayout
import android.widget.SeekBar
import java.lang.reflect.Method
import java.util.Locale
import java.util.WeakHashMap
import kotlin.math.abs
import kotlin.math.ceil
import kotlin.math.max
import kotlin.math.min
import kotlin.math.roundToInt
import kotlin.math.sqrt

/**
 * Faz 2 — Kyant0 Liquid Glass Seekbar Slider + Top-Right Circular Progress Ring.
 *
 * Bridges directly to TikTok's active player singleton (`X.037z.LJLJJLL()`) for exact
 * `getCurrentPosition()` / `getDuration()` playback telemetry across ALL feed videos (fixing
 * stale-zero ring resets on video swipes) and invokes real `seek(percent * 100f)` when scrubbing.
 */
object KineticMediaOverlayController {

    private const val TAG_ORIG_SEEK_ALPHA = 0x5341529A

    private class MediaState(
        var backdropSource: View? = null,
        var seekBarView: KyantLiquidSliderView? = null,
        var ringView: CircularProgressRingView? = null,
        var timeBadgeView: KineticTimeBadgeView? = null,
        var trackedSeekContainer: View? = null,
        var trackedSeekBar: SeekBar? = null,
        var cleanScreen: Boolean = false,
        var activeAid: String = "",
        var currentProgress: Float = 0f,
        var currentDurationSec: Int = 0,
        var isScrubbing: Boolean = false,
        var scrubFraction: Float = 0f,
        var scrubGraceUntilMs: Long = 0L,
        var lastLiveSeekMs: Long = 0L,
        var pollRunnable: Runnable? = null
    )

    private val states = WeakHashMap<Activity, MediaState>()
    private val mainHandler = Handler(Looper.getMainLooper())

    @Volatile
    private var cachedDurationMethodClass: Class<*>? = null

    @Volatile
    private var cachedDurationMethod: Method? = null

    // Cached reflection for TikTok's active player singleton: LX/037z;.LJLJJLL() -> LX/037y;
    @Volatile
    private var playerResolveAttempted = false

    @Volatile
    private var playerSingletonMethod: Method? = null

    @Volatile
    private var cachedPlayerClass: Class<*>? = null

    @Volatile
    private var playerGetPosMethod: Method? = null

    @Volatile
    private var playerGetDurMethod: Method? = null

    @Volatile
    private var playerSeekMethod: Method? = null

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun sync(activity: Activity, backdropSource: View? = null) {
        if (activity.isFinishing || activity.isDestroyed) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || TikTokViewResolver.isSettingsActivity(activity)) {
            detach(activity)
            return
        }
        val state = states.getOrPut(activity) { MediaState() }
        if (backdropSource != null) {
            state.backdropSource = backdropSource
            state.seekBarView?.setBackdropSource(backdropSource)
        }

        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val wantSeek = MergenPrefs.isKineticSeekbarEnabled(activity)
        val wantRing = MergenPrefs.isCircularProgressEnabled(activity)

        if (!wantSeek && !wantRing) {
            restoreNativeSeekContainerAlpha(state)
            hideAllViews(state)
            stopPolling(state)
            return
        }

        content.post {
            if (activity.isFinishing || activity.isDestroyed || states[activity] !== state) return@post
            ensureViews(activity, content, state)
            updateVisibilityAndStyle(activity, state)
            startPolling(activity, state)
        }
    }

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        val state = states[activity] ?: return
        if (tabIndex != 0 && tabIndex != 1) {
            hideAllViews(state)
        } else {
            updateVisibilityAndStyle(activity, state)
        }
    }

    fun setCleanScreen(activity: Activity, clean: Boolean) {
        val state = states[activity] ?: return
        state.cleanScreen = clean
        updateVisibilityAndStyle(activity, state)
    }

    fun detach(activity: Activity) {
        val state = states.remove(activity) ?: return
        stopPolling(state)
        restoreNativeSeekContainerAlpha(state)
        removeViewSafe(state.seekBarView)
        removeViewSafe(state.ringView)
        removeViewSafe(state.timeBadgeView)
        state.seekBarView = null
        state.ringView = null
        state.timeBadgeView = null
    }

    private fun removeViewSafe(view: View?) {
        if (view == null) return
        MergenMotionBlur.clear(view)
        val p = view.parent as? ViewGroup ?: return
        p.post {
            if (view.parent === p) p.removeView(view)
        }
    }

    private fun hideAllViews(state: MediaState) {
        state.seekBarView?.visibility = View.GONE
        state.ringView?.visibility = View.GONE
        state.timeBadgeView?.visibility = View.GONE
    }

    private fun restoreNativeSeekContainerAlpha(state: MediaState) {
        val sc = state.trackedSeekContainer ?: return
        val orig = sc.getTag(TAG_ORIG_SEEK_ALPHA) as? Float
        if (orig != null && sc.alpha != orig) {
            sc.alpha = orig
        }
    }

    private fun ensureViews(activity: Activity, content: ViewGroup, state: MediaState) {
        val decor = activity.window?.decorView ?: content
        val statusTop = TikTokViewResolver.statusBarTopInset(activity, decor)
        val navInset = TikTokViewResolver.navBarBottomInset(decor)
        val kyant0 = MergenPrefs.isKyant0Style(activity)

        if (state.seekBarView == null) {
            val sbView = KyantLiquidSliderView(activity, activity, state.backdropSource) { action, frac ->
                handleScrubCallback(activity, state, action, frac)
            }.apply {
                setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                visibility = View.GONE
                elevation = dpF(activity, 14f)
            }
            state.seekBarView = sbView
            val outset = sbView.outsetPx
            content.addView(
                sbView,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT,
                    sbView.preferredHeightPx,
                    Gravity.BOTTOM
                ).apply {
                    val hm = dp(activity, 22f) - outset
                    leftMargin = hm
                    rightMargin = hm
                    bottomMargin = computeSeekBottomMargin(activity, decor, navInset, sbView.preferredHeightPx)
                }
            )
        } else {
            state.seekBarView?.let { sb ->
                sb.setBackdropSource(state.backdropSource)
                (sb.layoutParams as? FrameLayout.LayoutParams)?.let { lp ->
                    val wantedBottom = computeSeekBottomMargin(activity, decor, navInset, sb.preferredHeightPx)
                    if (lp.bottomMargin != wantedBottom) {
                        lp.bottomMargin = wantedBottom
                        sb.layoutParams = lp
                    }
                }
            }
        }
        state.seekBarView?.invalidate()

        if (state.ringView == null) {
            val ring = CircularProgressRingView(activity) {
                toggleScrubTimeBadge(activity, state, temporary = true)
            }.apply {
                setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                visibility = View.GONE
                elevation = dpF(activity, 14f)
            }
            state.ringView = ring
            val size = dp(activity, 34f)
            content.addView(
                ring,
                FrameLayout.LayoutParams(size, size, Gravity.TOP or Gravity.END).apply {
                    topMargin = statusTop + dp(activity, 56f)
                    rightMargin = dp(activity, 14f)
                }
            )
        } else {
            (state.ringView?.layoutParams as? FrameLayout.LayoutParams)?.let { lp ->
                val wantedTop = statusTop + dp(activity, 56f)
                if (lp.topMargin != wantedTop) {
                    lp.topMargin = wantedTop
                    state.ringView?.layoutParams = lp
                }
            }
        }
        state.ringView?.setTheme(kyant0)

        if (state.timeBadgeView == null) {
            val badge = KineticTimeBadgeView(activity).apply {
                setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
                visibility = View.GONE
                elevation = dpF(activity, 18f)
            }
            state.timeBadgeView = badge
            content.addView(
                badge,
                FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    Gravity.BOTTOM or Gravity.CENTER_HORIZONTAL
                ).apply {
                    val sbH = state.seekBarView?.preferredHeightPx ?: dp(activity, 48f)
                    bottomMargin = computeSeekBottomMargin(activity, decor, navInset, sbH) + sbH + dp(activity, 6f)
                }
            )
        }
        state.timeBadgeView?.setTheme(kyant0)
    }

    private fun computeSeekBottomMargin(
        activity: Activity,
        decor: View,
        navInset: Int,
        sliderViewHeightPx: Int
    ): Int {
        // Place the slider's horizontal centerline right above the floating bottom pill (or nav bar).
        val baseTopOfBottomArea = if (!MergenPrefs.isLiquidGlassBarEnabled(activity)) {
            navInset + dp(activity, 16f)
        } else {
            val bar = LiquidGlassController.getAttachedGlassBar(activity)
            if (bar != null && bar.isAttachedToWindow && bar.height > 0) {
                val pillBottom = navInset + dp(activity, 6f)
                val pillH = dp(activity, 54f)
                pillBottom + pillH + dp(activity, 13f)
            } else {
                navInset + dp(activity, 73f)
            }
        }
        return (baseTopOfBottomArea - sliderViewHeightPx / 2).coerceAtLeast(navInset)
    }

    private fun startPolling(activity: Activity, state: MediaState) {
        if (state.pollRunnable != null) return
        val r = object : Runnable {
            override fun run() {
                if (states[activity] !== state || activity.isFinishing || activity.isDestroyed) return
                pollPlayback(activity, state)
                mainHandler.postDelayed(this, 80L)
            }
        }
        state.pollRunnable = r
        mainHandler.postDelayed(r, 80L)
    }

    private fun stopPolling(state: MediaState) {
        state.pollRunnable?.let { mainHandler.removeCallbacks(it) }
        state.pollRunnable = null
    }

    private fun pollPlayback(activity: Activity, state: MediaState) {
        if (!MergenPrefs.isModEffectivelyActive(activity)) {
            restoreNativeSeekContainerAlpha(state)
            hideAllViews(state)
            return
        }
        val decor = activity.window?.decorView ?: return
        val host = TikTokViewResolver.findFragmentTabHost(decor)
        val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
        val onFeed = TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer) &&
            !TikTokViewResolver.isOwnProfileActive(activity, decor, tabContainer)

        val overlaySheetOpen = TikTokViewResolver.isFeedOverlaySheetOpen(activity, decor, host)
        if (!onFeed || overlaySheetOpen || state.cleanScreen ||
            QuickControlSheetController.isShowing(activity) ||
            RadialMenuController.isShowing(activity)
        ) {
            state.isScrubbing = false
            if (!onFeed) restoreNativeSeekContainerAlpha(state)
            hideAllViews(state)
            return
        }

        // Track active video AID so video switches snap cleanly instead of stalling
        val activeAid = TikTokCreatorExtractor.extractActiveAwemeInfo(activity, decor)?.aid.orEmpty()
        val videoChanged = activeAid.isNotEmpty() && activeAid != state.activeAid
        if (videoChanged) {
            state.activeAid = activeAid
            state.scrubGraceUntilMs = 0L
            state.currentProgress = 0f
            state.currentDurationSec = 0
            state.seekBarView?.snapToFraction(0f)
            state.ringView?.snapToFraction(0f)
        }

        val barParent = tabContainer?.parent as? ViewGroup ?: host
        val seekContainer = barParent?.let { TikTokViewResolver.findVideoSeekBar(activity, it) }
        val seekBar = seekContainer?.let { findSeekBarRecursive(it) }

        if (seekContainer != null && state.trackedSeekContainer !== seekContainer) {
            restoreNativeSeekContainerAlpha(state)
            state.trackedSeekContainer = seekContainer
        }
        state.trackedSeekBar = seekBar

        // Primary live playback source: TikTok active player singleton (works on ALL feed videos)
        val player = getActivePlayer()
        val durMs = readPlayerDurationMs(player)
        val posMs = if (durMs > 0L) readPlayerPositionMs(player) else -1L

        val seekBarMax = seekBar?.max ?: 0
        val hasSeekBarData = seekBar != null && seekBarMax > 0
        val nowMs = SystemClock.uptimeMillis()

        if (!state.isScrubbing && nowMs >= state.scrubGraceUntilMs) {
            if (durMs > 0L && posMs >= 0L) {
                val frac = (posMs.toFloat() / durMs.toFloat()).coerceIn(0f, 1f)
                val sec = ((durMs + 500L) / 1000L).toInt().coerceAtLeast(1)
                state.currentDurationSec = sec
                state.currentProgress = frac
            } else {
                val mProgress = readContainerMProgressFraction(seekContainer)
                if (mProgress != null) {
                    val durSec = if (seekBar != null) readVideoDurationSec(seekBar) else 0
                    if (durSec > 0) state.currentDurationSec = durSec
                    state.currentProgress = mProgress
                } else if (hasSeekBarData && seekBar != null) {
                    val durSec = readVideoDurationSec(seekBar)
                    if (durSec > 0) state.currentDurationSec = durSec
                    state.currentProgress = (seekBar.progress.toFloat() / seekBarMax.toFloat()).coerceIn(0f, 1f)
                }
            }
        } else if (state.currentDurationSec <= 0 && seekBar != null) {
            val d = if (durMs > 0L) ((durMs + 500L) / 1000L).toInt().coerceAtLeast(1) else readVideoDurationSec(seekBar)
            if (d > 0) state.currentDurationSec = d
        }

        val hasAnyPlayback = (durMs > 0L) || hasSeekBarData
        updateVisibilityAndStyle(activity, state, hasAnyPlayback)
    }

    private fun updateVisibilityAndStyle(
        activity: Activity,
        state: MediaState,
        hasAnyPlayback: Boolean = (state.currentDurationSec > 0 || (state.trackedSeekBar?.max ?: 0) > 0)
    ) {
        val decor = activity.window?.decorView ?: return
        val host = TikTokViewResolver.findFragmentTabHost(decor)
        val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
        val onFeed = TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer) &&
            !TikTokViewResolver.isOwnProfileActive(activity, decor, tabContainer)
        val overlaySheetOpen = onFeed && TikTokViewResolver.isFeedOverlaySheetOpen(activity, decor, host)

        val seekContainer = state.trackedSeekContainer
        val seekBar = state.trackedSeekBar
        val hasSeekBarData = seekBar != null && seekBar.max > 0
        val nativeSeekVisible = seekContainer != null && seekContainer.visibility == View.VISIBLE && hasSeekBarData

        val showKineticSeek = onFeed &&
            !overlaySheetOpen &&
            !state.cleanScreen &&
            hasAnyPlayback &&
            MergenPrefs.isKineticSeekbarEnabled(activity)

        val showRing = onFeed &&
            !overlaySheetOpen &&
            !state.cleanScreen &&
            hasAnyPlayback &&
            MergenPrefs.isCircularProgressEnabled(activity)

        if (seekContainer != null) {
            if (seekContainer.getTag(TAG_ORIG_SEEK_ALPHA) == null) {
                seekContainer.setTag(TAG_ORIG_SEEK_ALPHA, seekContainer.alpha)
            }
            if (showKineticSeek) {
                if (seekContainer.alpha != 0f) seekContainer.alpha = 0f
            } else {
                val orig = seekContainer.getTag(TAG_ORIG_SEEK_ALPHA) as? Float ?: 1f
                if (seekContainer.alpha != orig) seekContainer.alpha = orig
            }
        }

        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val sbView = state.seekBarView
        if (sbView != null) {
            sbView.setBackdropSource(state.backdropSource)
            if (showKineticSeek) {
                if (sbView.visibility != View.VISIBLE) sbView.visibility = View.VISIBLE
                if (!state.isScrubbing && SystemClock.uptimeMillis() >= state.scrubGraceUntilMs) {
                    sbView.setProgressFraction(state.currentProgress)
                }
            } else if (sbView.visibility != View.GONE) {
                sbView.visibility = View.GONE
            }
        }

        val ring = state.ringView
        if (ring != null) {
            ring.setTheme(kyant0)
            if (showRing) {
                if (ring.visibility != View.VISIBLE) ring.visibility = View.VISIBLE
                val shownFrac = if (state.isScrubbing) state.scrubFraction else state.currentProgress
                ring.setPlaybackState(shownFrac, state.currentDurationSec)
            } else if (ring.visibility != View.GONE) {
                ring.visibility = View.GONE
            }
        }
    }

    private fun handleScrubCallback(activity: Activity, state: MediaState, action: Int, frac: Float) {
        val clamped = frac.coerceIn(0f, 1f)
        state.scrubFraction = clamped
        state.currentProgress = clamped
        val now = SystemClock.uptimeMillis()

        when (action) {
            MotionEvent.ACTION_DOWN -> {
                state.isScrubbing = true
                state.lastLiveSeekMs = now
                performVideoSeek(state, clamped, isStart = true, isFinal = false)
                showScrubBadge(activity, state, clamped, popIn = true)
                state.ringView?.setPlaybackState(clamped, state.currentDurationSec)
            }
            MotionEvent.ACTION_MOVE -> {
                if (now - state.lastLiveSeekMs >= 95L) {
                    state.lastLiveSeekMs = now
                    performVideoSeek(state, clamped, isStart = false, isFinal = false)
                }
                showScrubBadge(activity, state, clamped, popIn = false)
                state.ringView?.setPlaybackState(clamped, state.currentDurationSec)
            }
            MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                performVideoSeek(state, clamped, isStart = false, isFinal = true)
                state.isScrubbing = false
                state.scrubGraceUntilMs = now + 450L
                state.currentProgress = clamped
                state.ringView?.setPlaybackState(clamped, state.currentDurationSec)
                hideScrubBadge(activity, state)
            }
        }
    }

    private fun performVideoSeek(
        state: MediaState,
        fraction: Float,
        isStart: Boolean,
        isFinal: Boolean
    ) {
        val percent = (fraction * 100f).coerceIn(0f, 100f)

        // 1. Seek directly via TikTok's active player singleton (`X.037z.LJLJJLL().seek(0..100f)`).
        val player = getActivePlayer()
        if (player != null) {
            cachePlayerMethodsIfNeeded(player)
            try {
                playerSeekMethod?.invoke(player, percent)
            } catch (_: Throwable) {
            }
        }

        // 2. Sync TikTok's native seek bar UI/state so nothing fights the new position.
        val seekContainer = state.trackedSeekContainer
        val seekBar = state.trackedSeekBar
        if (seekBar != null && seekBar.max > 0) {
            val targetProgress = (fraction * seekBar.max).roundToInt().coerceIn(0, seekBar.max)
            try {
                if (seekBar.progress != targetProgress) {
                    seekBar.progress = targetProgress
                }
            } catch (_: Throwable) {
            }
            try {
                if (seekContainer != null) {
                    val m = seekContainer.javaClass.getMethod(
                        "LIZIZ",
                        Float::class.javaPrimitiveType,
                        Boolean::class.javaPrimitiveType
                    )
                    m.invoke(seekContainer, percent, false)
                }
            } catch (_: Throwable) {
            }
            // Fallback to native OnSeekBarChangeListener only on release if playerSeekMethod wasn't found.
            if (playerSeekMethod == null && seekContainer != null && (isStart || isFinal)) {
                try {
                    val listener = seekContainer.javaClass.getMethod("getMOnSeekBarChangeListener").invoke(seekContainer)
                    if (listener != null) {
                        val lCls = listener.javaClass
                        if (isStart) {
                            lCls.getMethod("onStartTrackingTouch", SeekBar::class.java).invoke(listener, seekBar)
                        }
                        lCls.getMethod(
                            "onProgressChanged",
                            SeekBar::class.java,
                            Int::class.javaPrimitiveType,
                            Boolean::class.javaPrimitiveType
                        ).invoke(listener, seekBar, targetProgress, true)
                        if (isFinal) {
                            lCls.getMethod("onStopTrackingTouch", SeekBar::class.java).invoke(listener, seekBar)
                        }
                    }
                } catch (_: Throwable) {
                }
            }
        }
    }

    private fun getActivePlayer(): Any? {
        if (!playerResolveAttempted) {
            playerResolveAttempted = true
            try {
                val holderCls = Class.forName("X.037z")
                playerSingletonMethod = holderCls.getMethod("LJLJJLL")
            } catch (_: Throwable) {
                playerSingletonMethod = null
            }
        }
        val player = try {
            playerSingletonMethod?.invoke(null)
        } catch (_: Throwable) {
            null
        } ?: return null
        cachePlayerMethodsIfNeeded(player)
        return player
    }

    private fun cachePlayerMethodsIfNeeded(player: Any) {
        val cls = player.javaClass
        if (cachedPlayerClass === cls) return
        cachedPlayerClass = cls
        playerGetPosMethod = try { cls.getMethod("getCurrentPosition") } catch (_: Throwable) { null }
        playerGetDurMethod = try { cls.getMethod("getDuration") } catch (_: Throwable) { null }
        playerSeekMethod = try { cls.getMethod("seek", Float::class.javaPrimitiveType) } catch (_: Throwable) { null }
    }

    private fun readPlayerPositionMs(player: Any?): Long {
        if (player == null) return -1L
        return try {
            (playerGetPosMethod?.invoke(player) as? Number)?.toLong() ?: -1L
        } catch (_: Throwable) {
            -1L
        }
    }

    private fun readPlayerDurationMs(player: Any?): Long {
        if (player == null) return -1L
        return try {
            (playerGetDurMethod?.invoke(player) as? Number)?.toLong() ?: -1L
        } catch (_: Throwable) {
            -1L
        }
    }

    private fun readContainerMProgressFraction(seekContainer: View?): Float? {
        if (seekContainer == null) return null
        return try {
            val raw = seekContainer.javaClass.getMethod("getMProgress").invoke(seekContainer) as? Number
                ?: return null
            (raw.toFloat() / 100f).coerceIn(0f, 1f)
        } catch (_: Throwable) {
            null
        }
    }

    private fun showScrubBadge(activity: Activity, state: MediaState, frac: Float, popIn: Boolean) {
        val badge = state.timeBadgeView ?: return
        badge.setTheme(MergenPrefs.isKyant0Style(activity))
        val text = formatScrubText(frac, state.currentDurationSec)
        badge.setLabel(text)

        val sb = state.seekBarView
        if (sb != null) {
            val lp = badge.layoutParams as? FrameLayout.LayoutParams
            val decor = activity.window?.decorView ?: sb
            val navInset = TikTokViewResolver.navBarBottomInset(decor)
            val wantedBottom = computeSeekBottomMargin(activity, decor, navInset, sb.preferredHeightPx) +
                sb.preferredHeightPx + dp(activity, 6f)
            if (lp != null && lp.bottomMargin != wantedBottom) {
                lp.bottomMargin = wantedBottom
                badge.layoutParams = lp
            }
        }

        if (popIn || badge.visibility != View.VISIBLE) {
            badge.visibility = View.VISIBLE
            MergenMotionBlur.animatePop(
                view = badge,
                fromScale = 0.72f,
                toScale = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                durationMs = 170L,
                interpolator = OvershootInterpolator(0.75f),
                maxBlurDp = 6f
            )
        }
    }

    private fun hideScrubBadge(activity: Activity, state: MediaState) {
        val badge = state.timeBadgeView ?: return
        if (badge.visibility != View.VISIBLE) return
        MergenMotionBlur.animatePop(
            view = badge,
            fromScale = badge.scaleX,
            toScale = 0.78f,
            fromAlpha = badge.alpha,
            toAlpha = 0f,
            durationMs = 150L,
            interpolator = DecelerateInterpolator(1.6f),
            maxBlurDp = 6f
        ) {
            if (!state.isScrubbing) {
                badge.visibility = View.GONE
            }
        }
    }

    private fun toggleScrubTimeBadge(activity: Activity, state: MediaState, temporary: Boolean) {
        MergenHaptics.playTap(activity)
        showScrubBadge(activity, state, state.currentProgress, popIn = true)
        if (temporary) {
            mainHandler.postDelayed({
                if (!activity.isFinishing && !activity.isDestroyed && !state.isScrubbing) {
                    hideScrubBadge(activity, state)
                }
            }, 2200L)
        }
    }

    private fun formatScrubText(frac: Float, durationSec: Int): String {
        if (durationSec <= 0) {
            return "${(frac * 100f).roundToInt()}%"
        }
        val curSec = (frac * durationSec).roundToInt().coerceIn(0, durationSec)
        return "${formatTime(curSec)} / ${formatTime(durationSec)}"
    }

    private fun formatTime(sec: Int): String {
        val m = sec / 60
        val s = sec % 60
        return String.format(Locale.US, "%d:%02d", m, s)
    }

    private fun findSeekBarRecursive(view: View): SeekBar? {
        if (view is SeekBar) return view
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                val found = findSeekBarRecursive(view.getChildAt(i))
                if (found != null) return found
            }
        }
        return null
    }

    private fun readVideoDurationSec(seekBar: SeekBar): Int {
        val cls = seekBar.javaClass
        val method = if (cachedDurationMethodClass === cls) {
            cachedDurationMethod
        } else {
            val resolved = try {
                cls.getMethod("getVideoDuration")
            } catch (_: Throwable) {
                null
            }
            cachedDurationMethodClass = cls
            cachedDurationMethod = resolved
            resolved
        }
        val raw = try {
            (method?.invoke(seekBar) as? Number)?.toLong() ?: 0L
        } catch (_: Throwable) {
            0L
        }
        if (raw <= 0L) return 0
        // If > 6000 it is in milliseconds rather than seconds
        return if (raw > 6000L) (raw / 1000L).toInt() else raw.toInt()
    }

    /**
     * Pure View + RenderNode + AGSL port of Kyant0/AndroidLiquidGlass `LiquidSlider.kt`:
     * - Capsule track with spring-smoothed progress
     * - Floating capsule thumb (`34dp x 20dp`) scaling up with velocity squash/stretch on drag
     * - Combined backdrop + scaled track captured inside the thumb RenderNode
     * - Chromatic dispersion refraction lens while pressing (respecting `MergenPrefs.isGlassLensEnabled`)
     */
    @SuppressLint("ViewConstructor")
    private class KyantLiquidSliderView(
        context: Context,
        private val hostActivity: Activity,
        private var backdropSource: View?,
        private val onScrub: (action: Int, frac: Float) -> Unit
    ) : View(context) {

        private fun dpF(v: Float): Float =
            TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

        val outsetPx: Int = ceil(dpF(16f)).toInt()
        val preferredHeightPx: Int = ceil(dpF(48f)).toInt()

        private val baseThumbW = dpF(34f)
        private val baseThumbH = dpF(20f)
        private val baseTrackH = dpF(5.5f)
        private val activeTrackH = dpF(7f)

        private var targetProgress = 0f
        private val progressSpring = Spring1D(0f, 0.90f, 340f)
        private val pressSpring = Spring1D(0f, 1.0f, 1000f)
        private val scaleXSpring = Spring1D(1f, 0.6f, 250f)
        private val scaleYSpring = Spring1D(1f, 0.7f, 250f)
        private val velocitySpring = Spring1D(0f, 0.5f, 300f)

        private var isDragging = false
        private var isTouchActive = false
        private var isCapturing = false
        private var lastTickStep = -1
        private var lastFrameNanos = 0L
        private var loopRunning = false

        private val thumbNode = RenderNode("KyantSliderThumb")
        private val thumbDispersionShader = RuntimeShader(KyantShaders.ROUNDED_RECT_REFRACTION_DISPERSION_SHADER)
        private val thumbHighlightShader = RuntimeShader(KyantShaders.DEFAULT_HIGHLIGHT_SHADER)

        private val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val fillPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val thumbShadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.FILL
            color = Color.TRANSPARENT
        }
        private val thumbTintPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val thumbInnerShadowPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
        }
        private val thumbHighlightPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            blendMode = KyantShaders.plusBlendMode
        }
        private val thumbClipPath = Path()
        private val rect = RectF()
        private val thumbRect = RectF()
        private val srcLoc = IntArray(2)
        private val selfLoc = IntArray(2)
        private val touchSlop = ViewConfiguration.get(context).scaledTouchSlop.toFloat()
        private var downX = 0f
        private var downY = 0f
        private var scrubLocked = false
        private var verticalRejected = false
        private var tapCandidate = false

        private val frameCallback = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                val dt = if (lastFrameNanos == 0L) 1f / 120f else ((frameTimeNanos - lastFrameNanos) / 1_000_000_000f).coerceIn(0.001f, 0.032f)
                lastFrameNanos = frameTimeNanos
                applyAnimationProfileTuning()

                val prevPos = progressSpring.value
                val m1 = progressSpring.step(dt)
                val rawVel = (progressSpring.value - prevPos) / dt
                velocitySpring.target = if (isDragging || m1) rawVel * 1.4f else 0f
                val m2 = velocitySpring.step(dt)
                val m3 = pressSpring.step(dt)
                val m4 = scaleXSpring.step(dt)
                val m5 = scaleYSpring.step(dt)
                invalidate()

                if (m1 || m2 || m3 || m4 || m5 || isTouchActive) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    loopRunning = false
                    lastFrameNanos = 0L
                }
            }
        }

        private fun applyAnimationProfileTuning() {
            when (MergenPrefs.getAnimationProfile(context)) {
                1 -> {
                    progressSpring.updateTuning(0.94f, 520f)
                    pressSpring.updateTuning(1.0f, 1250f)
                    scaleXSpring.updateTuning(0.78f, 420f)
                    scaleYSpring.updateTuning(0.84f, 420f)
                    velocitySpring.updateTuning(0.72f, 460f)
                }
                2 -> {
                    progressSpring.updateTuning(0.98f, 950f)
                    pressSpring.updateTuning(1.0f, 1600f)
                    scaleXSpring.updateTuning(0.98f, 900f)
                    scaleYSpring.updateTuning(0.98f, 900f)
                    velocitySpring.updateTuning(0.98f, 900f)
                }
                else -> {
                    progressSpring.updateTuning(0.90f, 340f)
                    pressSpring.updateTuning(1.0f, 1000f)
                    scaleXSpring.updateTuning(0.60f, 250f)
                    scaleYSpring.updateTuning(0.70f, 250f)
                    velocitySpring.updateTuning(0.50f, 300f)
                }
            }
        }

        init {
            setWillNotDraw(false)
            isClickable = true
            isFocusable = true
            setLayerType(LAYER_TYPE_HARDWARE, null)
        }

        fun setBackdropSource(source: View?) {
            backdropSource = source
        }

        override fun onDetachedFromWindow() {
            Choreographer.getInstance().removeFrameCallback(frameCallback)
            loopRunning = false
            thumbNode.discardDisplayList()
            super.onDetachedFromWindow()
        }

        fun snapToFraction(frac: Float) {
            val clamped = frac.coerceIn(0f, 1f)
            targetProgress = clamped
            progressSpring.snapTo(clamped)
            velocitySpring.snapTo(0f)
            invalidate()
        }

        fun setProgressFraction(frac: Float) {
            val clamped = frac.coerceIn(0f, 1f)
            if (abs(clamped - targetProgress) < 0.0015f) return
            if (targetProgress - clamped > 0.45f) {
                progressSpring.snapTo(clamped)
            } else {
                progressSpring.target = clamped
            }
            targetProgress = clamped
            ensureLoop()
        }

        private fun ensureLoop() {
            if (!loopRunning) {
                loopRunning = true
                lastFrameNanos = 0L
                Choreographer.getInstance().postFrameCallback(frameCallback)
            }
        }

        private fun fractionForLocalX(x: Float): Float {
            val trackW = max(1f, width - outsetPx * 2f)
            return ((x - outsetPx) / trackW).coerceIn(0f, 1f)
        }

        override fun onTouchEvent(event: MotionEvent): Boolean {
            if (width <= outsetPx * 2) return false
            when (event.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    val bar = LiquidGlassController.getAttachedGlassBar(hostActivity)
                    if (bar != null) {
                        if (bar.isTouchInteracting()) return false
                        val barTop = bar.getBarTopOnScreen()
                        if (barTop > 0 && event.rawY >= barTop - dpF(2f)) return false
                    }
                    val centerY = height * 0.5f
                    if (abs(event.y - centerY) > dpF(10f) ||
                        event.x < outsetPx - dpF(6f) ||
                        event.x > width - outsetPx + dpF(6f)
                    ) {
                        return false
                    }
                    downX = event.x
                    downY = event.y
                    scrubLocked = false
                    verticalRejected = false
                    tapCandidate = true
                    return true
                }
                MotionEvent.ACTION_MOVE -> {
                    if (verticalRejected) return false
                    val dx = event.x - downX
                    val dy = event.y - downY
                    if (!scrubLocked) {
                        if (abs(dy) > touchSlop && abs(dy) > abs(dx) * 1.15f) {
                            verticalRejected = true
                            tapCandidate = false
                            return false
                        }
                        if (abs(dx) > touchSlop * 0.45f && abs(dx) >= abs(dy) * 1.1f) {
                            scrubLocked = true
                            tapCandidate = false
                            parent?.requestDisallowInterceptTouchEvent(true)
                            isTouchActive = true
                            isDragging = true
                            pressSpring.target = 1f
                            scaleXSpring.target = 1.45f
                            scaleYSpring.target = 1.45f
                            val f = fractionForLocalX(event.x)
                            progressSpring.snapTo(f)
                            targetProgress = f
                            lastTickStep = (f * 20f).roundToInt()
                            MergenHaptics.playTick(context)
                            onScrub(MotionEvent.ACTION_DOWN, f)
                            onScrub(MotionEvent.ACTION_MOVE, f)
                            ensureLoop()
                            return true
                        }
                        return true
                    }
                    val f = fractionForLocalX(event.x)
                    progressSpring.target = f
                    targetProgress = f
                    val step = (f * 20f).roundToInt()
                    if (step != lastTickStep && abs(dx) > touchSlop * 0.5f) {
                        lastTickStep = step
                        MergenHaptics.playTick(context)
                    }
                    onScrub(MotionEvent.ACTION_MOVE, f)
                    ensureLoop()
                    return true
                }
                MotionEvent.ACTION_UP -> {
                    parent?.requestDisallowInterceptTouchEvent(false)
                    if (scrubLocked) {
                        scrubLocked = false
                        isDragging = false
                        isTouchActive = false
                        pressSpring.target = 0f
                        scaleXSpring.target = 1f
                        scaleYSpring.target = 1f
                        val f = fractionForLocalX(event.x)
                        progressSpring.target = f
                        targetProgress = f
                        MergenHaptics.playTap(context)
                        onScrub(MotionEvent.ACTION_UP, f)
                        ensureLoop()
                        return true
                    }
                    val wasTap = tapCandidate && !verticalRejected &&
                        abs(event.x - downX) < touchSlop && abs(event.y - downY) < touchSlop
                    tapCandidate = false
                    verticalRejected = false
                    if (wasTap) {
                        val f = fractionForLocalX(event.x)
                        progressSpring.target = f
                        targetProgress = f
                        MergenHaptics.playTap(context)
                        onScrub(MotionEvent.ACTION_DOWN, f)
                        onScrub(MotionEvent.ACTION_UP, f)
                        ensureLoop()
                        return true
                    }
                    return false
                }
                MotionEvent.ACTION_CANCEL -> {
                    parent?.requestDisallowInterceptTouchEvent(false)
                    val wasScrub = scrubLocked
                    scrubLocked = false
                    verticalRejected = false
                    tapCandidate = false
                    if (wasScrub) {
                        isDragging = false
                        isTouchActive = false
                        pressSpring.target = 0f
                        scaleXSpring.target = 1f
                        scaleYSpring.target = 1f
                        onScrub(MotionEvent.ACTION_CANCEL, progressSpring.target)
                        ensureLoop()
                    }
                    return false
                }
            }
            return false
        }

        override fun draw(canvas: Canvas) {
            if (KyantShaders.isRecordingBackdrop) return
            super.draw(canvas)
        }

        override fun onDraw(canvas: Canvas) {
            if (isCapturing || KyantShaders.isRecordingBackdrop) return
            val w = width.toFloat()
            val h = height.toFloat()
            val trackW = w - outsetPx * 2f
            if (trackW <= 4f || h <= 4f) return

            val press = pressSpring.value.coerceIn(0f, 1f)
            val p = progressSpring.value.coerceIn(0f, 1f)
            val trackLeft = outsetPx.toFloat()
            val trackCy = h * 0.5f
            val trackH = lerp(baseTrackH, activeTrackH, press)
            val trackTop = trackCy - trackH * 0.5f
            val trackR = trackH * 0.5f

            // 1. Base capsule track & active capsule fill
            trackPaint.color = Color.argb(66, 255, 255, 255)
            rect.set(trackLeft, trackTop, trackLeft + trackW, trackTop + trackH)
            canvas.drawRoundRect(rect, trackR, trackR, trackPaint)

            val fillW = (trackW * p).coerceIn(if (p > 0.002f) trackH else 0f, trackW)
            fillPaint.color = Color.argb((215 + 40 * press).roundToInt().coerceIn(0, 255), 255, 255, 255)
            if (fillW > 0.5f) {
                rect.set(trackLeft, trackTop, trackLeft + fillW, trackTop + trackH)
                canvas.drawRoundRect(rect, trackR, trackR, fillPaint)
            }

            // 2. Thumb geometry matching Kyant0 LiquidSlider.kt
            val vel = (velocitySpring.value / 10f).coerceIn(-0.6f, 0.6f)
            val sx = scaleXSpring.value / (1f - (vel * 0.75f).coerceIn(-0.2f, 0.2f))
            val sy = scaleYSpring.value * (1f - (vel * 0.25f).coerceIn(-0.2f, 0.2f))

            val thumbW = baseThumbW * sx
            val thumbH = baseThumbH * sy
            val thumbR = thumbH * 0.5f

            val rawCenterX = trackLeft + trackW * p
            val minCenter = trackLeft + baseThumbW * 0.25f
            val maxCenter = (trackLeft + trackW - baseThumbW * 0.25f).coerceAtLeast(minCenter)
            val thumbCx = rawCenterX.coerceIn(minCenter, maxCenter)
            val thumbLeft = thumbCx - thumbW * 0.5f
            val thumbTop = trackCy - thumbH * 0.5f

            val nodeW = ceil(thumbW).toInt().coerceAtLeast(2)
            val nodeH = ceil(thumbH).toInt().coerceAtLeast(2)
            val lensOn = MergenPrefs.isGlassLensEnabled(context)

            thumbNode.setPosition(0, 0, nodeW, nodeH)
            thumbNode.setClipToBounds(true)

            val src = backdropSource
            if (src != null && src.isAttachedToWindow && src.width > 0 && src.height > 0 && src !== this) {
                src.getLocationOnScreen(srcLoc)
                getLocationOnScreen(selfLoc)
                val thumbLeftInSrc = (selfLoc[0] + thumbLeft) - srcLoc[0]
                val thumbTopInSrc = (selfLoc[1] + thumbTop) - srcLoc[1]

                isCapturing = true
                KyantShaders.isRecordingBackdrop = true
                val rec = thumbNode.beginRecording(nodeW, nodeH)
                try {
                    rec.drawColor(Color.rgb(18, 20, 26))
                    rec.save()
                    rec.translate(-thumbLeftInSrc, -thumbTopInSrc)
                    src.draw(rec)
                    rec.restore()

                    // Combined track backdrop scaled into the glass thumb just like Kyant0 LiquidSlider.kt
                    val scaleTrackX = lerp(2f / 3f, 1f, press)
                    val scaleTrackY = lerp(0f, 1f, press)
                    if (scaleTrackY > 0.01f) {
                        rec.save()
                        rec.translate(-thumbLeft, -thumbTop)
                        rec.scale(scaleTrackX, scaleTrackY, thumbCx, trackCy)
                        trackPaint.color = Color.argb(90, 255, 255, 255)
                        rect.set(trackLeft, trackTop, trackLeft + trackW, trackTop + trackH)
                        rec.drawRoundRect(rect, trackR, trackR, trackPaint)
                        if (fillW > 0.5f) {
                            fillPaint.color = Color.argb(245, 255, 255, 255)
                            rect.set(trackLeft, trackTop, trackLeft + fillW, trackTop + trackH)
                            rec.drawRoundRect(rect, trackR, trackR, fillPaint)
                        }
                        rec.restore()
                    }
                } catch (_: Throwable) {
                } finally {
                    thumbNode.endRecording()
                    KyantShaders.isRecordingBackdrop = false
                    isCapturing = false
                }

                val blurPx = dpF(5f) * (1f - press)
                val blurFx = if (blurPx > 0.5f) {
                    RenderEffect.createBlurEffect(blurPx, blurPx, Shader.TileMode.CLAMP)
                } else {
                    null
                }
                val dispFx = if (lensOn && press > 0.01f) {
                    KyantShaders.createActiveLensRenderEffect(
                        width = thumbW,
                        height = thumbH,
                        offsetX = 0f,
                        offsetY = 0f,
                        refractionHeightPx = dpF(8f) * press,
                        refractionAmountPx = dpF(12f) * press,
                        dispersionShader = thumbDispersionShader
                    )
                } else {
                    null
                }
                val finalFx = when {
                    dispFx != null && blurFx != null -> RenderEffect.createChainEffect(dispFx, blurFx)
                    dispFx != null -> dispFx
                    else -> blurFx
                }
                thumbNode.setRenderEffect(finalFx)
            } else {
                thumbNode.setRenderEffect(null)
            }

            // 3. Draw shadow + refracted glass thumb + white frosted tint + specular highlight rim
            canvas.save()
            canvas.translate(thumbLeft, thumbTop)

            thumbRect.set(0f, 0f, thumbW, thumbH)
            thumbShadowPaint.setShadowLayer(
                dpF(6f + 6f * press),
                0f,
                dpF(2f + 2f * press),
                Color.argb((42 + (55 * press).roundToInt()).coerceIn(0, 255), 0, 0, 0)
            )
            canvas.drawRoundRect(thumbRect, thumbR, thumbR, thumbShadowPaint)

            thumbClipPath.reset()
            thumbClipPath.addRoundRect(thumbRect, thumbR, thumbR, Path.Direction.CW)
            canvas.save()
            canvas.clipPath(thumbClipPath)

            if (src != null && src.isAttachedToWindow) {
                canvas.drawRenderNode(thumbNode)
            }

            // Frosted white capsule at rest -> clear prismatic glass lens when dragging
            val frostAlpha = ((1f - press * 0.90f) * 238f).roundToInt().coerceIn(0, 255)
            thumbTintPaint.color = Color.argb(frostAlpha, 255, 255, 255)
            canvas.drawRect(thumbRect, thumbTintPaint)

            if (press > 0.02f) {
                thumbInnerShadowPaint.strokeWidth = dpF(3.5f) * press
                thumbInnerShadowPaint.color = Color.argb((0.12f * press * 255f).roundToInt(), 0, 0, 0)
                canvas.drawRoundRect(thumbRect, thumbR, thumbR, thumbInnerShadowPaint)
            }

            val strokeHalf = ceil(dpF(1.1f))
            KyantShaders.configureHighlightShader(
                shader = thumbHighlightShader,
                width = thumbW,
                height = thumbH,
                colorArgb = Color.WHITE,
                angleDegrees = 45f,
                falloff = 1f
            )
            thumbHighlightPaint.strokeWidth = strokeHalf * 2f
            thumbHighlightPaint.shader = thumbHighlightShader
            thumbHighlightPaint.alpha = (140 + (90 * press).roundToInt()).coerceIn(0, 255)
            canvas.drawRoundRect(thumbRect, thumbR, thumbR, thumbHighlightPaint)

            canvas.restore()
            canvas.restore()
        }

        private fun lerp(a: Float, b: Float, t: Float): Float = a + (b - a) * t
    }

    private class CircularProgressRingView(
        context: Context,
        onTap: () -> Unit
    ) : View(context) {

        private fun dpF(v: Float): Float =
            TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

        private var kyant0 = false
        private var targetProgress = 0f
        private var durationSec = 0
        private val progressSpring = Spring1D(0f, 0.88f, 300f)
        private var lastFrameNanos = 0L
        private var loopRunning = false

        private val discPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val trackPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(2.4f)
        }
        private val arcPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeCap = Paint.Cap.ROUND
            strokeWidth = dpF(2.4f)
            color = Color.WHITE
        }
        private val borderPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(0.9f)
        }
        private val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            textAlign = Paint.Align.CENTER
            color = Color.WHITE
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 8.5f, resources.displayMetrics)
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
        }
        private val arcRect = RectF()

        private val frameCallback = object : Choreographer.FrameCallback {
            override fun doFrame(frameTimeNanos: Long) {
                val dt = if (lastFrameNanos == 0L) 1f / 120f else ((frameTimeNanos - lastFrameNanos) / 1_000_000_000f).coerceIn(0.001f, 0.032f)
                lastFrameNanos = frameTimeNanos
                when (MergenPrefs.getAnimationProfile(context)) {
                    1 -> progressSpring.updateTuning(0.94f, 460f)
                    2 -> progressSpring.updateTuning(0.98f, 920f)
                    else -> progressSpring.updateTuning(0.88f, 300f)
                }
                val moving = progressSpring.step(dt)
                invalidate()
                if (moving) {
                    Choreographer.getInstance().postFrameCallback(this)
                } else {
                    loopRunning = false
                    lastFrameNanos = 0L
                }
            }
        }

        init {
            setWillNotDraw(false)
            isClickable = true
            isFocusable = true
            setOnClickListener { onTap() }
        }

        override fun onDetachedFromWindow() {
            Choreographer.getInstance().removeFrameCallback(frameCallback)
            loopRunning = false
            super.onDetachedFromWindow()
        }

        fun setTheme(isKyant0: Boolean) {
            if (kyant0 != isKyant0) {
                kyant0 = isKyant0
                invalidate()
            }
        }

        fun snapToFraction(frac: Float) {
            val clamped = frac.coerceIn(0f, 1f)
            targetProgress = clamped
            progressSpring.snapTo(clamped)
            invalidate()
        }

        fun setPlaybackState(frac: Float, durSec: Int) {
            val clamped = frac.coerceIn(0f, 1f)
            val durChanged = durationSec != durSec
            durationSec = durSec
            if (abs(clamped - targetProgress) >= 0.0015f) {
                if (targetProgress - clamped > 0.45f) {
                    progressSpring.snapTo(clamped)
                } else {
                    progressSpring.target = clamped
                }
                targetProgress = clamped
                ensureLoop()
            } else if (durChanged) {
                invalidate()
            }
        }

        private fun ensureLoop() {
            if (!loopRunning) {
                loopRunning = true
                lastFrameNanos = 0L
                Choreographer.getInstance().postFrameCallback(frameCallback)
            }
        }

        override fun onDraw(canvas: Canvas) {
            val w = width.toFloat()
            val h = height.toFloat()
            if (w <= 4f || h <= 4f) return

            val cx = w * 0.5f
            val cy = h * 0.5f
            val outerR = minOf(w, h) * 0.5f - dpF(1f)

            discPaint.color = if (kyant0) Color.argb(132, 22, 24, 32) else Color.argb(190, 0, 0, 0)
            canvas.drawCircle(cx, cy, outerR, discPaint)

            borderPaint.color = if (kyant0) Color.argb(72, 255, 255, 255) else Color.argb(95, 255, 255, 255)
            canvas.drawCircle(cx, cy, outerR, borderPaint)

            val pad = dpF(4f)
            arcRect.set(pad, pad, w - pad, h - pad)
            trackPaint.color = Color.argb(56, 255, 255, 255)
            canvas.drawArc(arcRect, 0f, 360f, false, trackPaint)

            val sweep = (progressSpring.value.coerceIn(0f, 1f) * 360f)
            if (sweep > 0.5f) {
                canvas.drawArc(arcRect, -90f, sweep, false, arcPaint)
            }

            val label = if (durationSec > 0) {
                val rem = (durationSec - (targetProgress * durationSec).roundToInt()).coerceAtLeast(0)
                if (rem >= 60) "${rem / 60}m" else "${rem}s"
            } else {
                "${(targetProgress * 100f).roundToInt()}"
            }
            val fm = textPaint.fontMetrics
            canvas.drawText(label, cx, cy - (fm.ascent + fm.descent) * 0.5f, textPaint)
        }
    }

    private class KineticTimeBadgeView(context: Context) : View(context) {

        private fun dpF(v: Float): Float =
            TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, v, resources.displayMetrics)

        private var kyant0 = false
        private var label = "0:00 / 0:00"
        private val bgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply { style = Paint.Style.FILL }
        private val strokePaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            style = Paint.Style.STROKE
            strokeWidth = dpF(1f)
        }
        private val textPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
            color = Color.WHITE
            textAlign = Paint.Align.CENTER
            textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 12f, resources.displayMetrics)
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
        }
        private val rect = RectF()

        fun setTheme(isKyant0: Boolean) {
            if (kyant0 != isKyant0) {
                kyant0 = isKyant0
                invalidate()
            }
        }

        fun setLabel(value: String) {
            if (label != value) {
                label = value
                requestLayout()
                invalidate()
            }
        }

        override fun onMeasure(widthMeasureSpec: Int, heightMeasureSpec: Int) {
            val w = (textPaint.measureText(label) + dpF(26f)).roundToInt()
            val h = dpF(32f).roundToInt()
            setMeasuredDimension(w, h)
        }

        override fun onDraw(canvas: Canvas) {
            val w = width.toFloat()
            val h = height.toFloat()
            val r = if (kyant0) h * 0.5f else 0f
            rect.set(0.5f, 0.5f, w - 0.5f, h - 0.5f)
            bgPaint.color = if (kyant0) Color.argb(200, 22, 24, 34) else Color.argb(238, 0, 0, 0)
            strokePaint.color = if (kyant0) Color.argb(115, 255, 255, 255) else Color.argb(220, 255, 255, 255)
            canvas.drawRoundRect(rect, r, r, bgPaint)
            canvas.drawRoundRect(rect, r, r, strokePaint)
            val fm = textPaint.fontMetrics
            canvas.drawText(label, w * 0.5f, h * 0.5f - (fm.ascent + fm.descent) * 0.5f, textPaint)
        }
    }

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

        fun updateTuning(dampingRatio: Float, stiffness: Float) {
            this.dampingRatio = dampingRatio
            this.stiffness = stiffness
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
}
