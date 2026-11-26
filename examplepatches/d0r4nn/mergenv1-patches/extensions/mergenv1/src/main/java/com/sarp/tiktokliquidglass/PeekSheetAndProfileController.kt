package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.ClipData
import android.content.ClipboardManager
import android.content.Context
import android.content.res.Configuration
import android.graphics.Canvas
import android.graphics.Color
import android.graphics.Outline
import android.graphics.Paint
import android.graphics.Path
import android.graphics.Typeface
import android.graphics.drawable.ColorDrawable
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Handler
import android.os.Looper
import android.text.TextUtils
import android.util.TypedValue
import android.view.Gravity
import android.view.MotionEvent
import android.view.VelocityTracker
import android.view.View
import android.view.ViewConfiguration
import android.view.ViewGroup
import android.view.ViewOutlineProvider
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.ScrollView
import android.widget.TextView
import java.util.WeakHashMap
import kotlin.math.abs
import kotlin.math.roundToInt

/**
 * Monochrome silhouette avatar fallback rendered cleanly when a creator avatar
 * drawable/URL is temporarily unavailable.
 */
class MergenDefaultAvatarView(context: Context) : View(context) {

    private val bgPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.BLACK
        style = Paint.Style.FILL
    }
    private val inkPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.WHITE
        style = Paint.Style.FILL
    }
    private val ringPaint = Paint(Paint.ANTI_ALIAS_FLAG).apply {
        color = Color.WHITE
        style = Paint.Style.STROKE
        strokeWidth = MergenDesign.dpF(context, 1.5f)
    }
    private val clipCircle = Path()

    override fun onDraw(canvas: Canvas) {
        val w = width.toFloat()
        val h = height.toFloat()
        if (w <= 0f || h <= 0f) return
        val r = minOf(w, h) * 0.5f
        val cx = w * 0.5f
        val cy = h * 0.5f

        clipCircle.reset()
        clipCircle.addCircle(cx, cy, r - ringPaint.strokeWidth * 0.5f, Path.Direction.CW)
        canvas.save()
        canvas.clipPath(clipCircle)
        canvas.drawCircle(cx, cy, r, bgPaint)
        canvas.drawCircle(cx, cy - h * 0.12f, minOf(w, h) * 0.17f, inkPaint)
        canvas.drawCircle(cx, cy + h * 0.36f, minOf(w, h) * 0.31f, inkPaint)
        canvas.restore()

        canvas.drawCircle(cx, cy, r - ringPaint.strokeWidth * 0.5f, ringPaint)
    }
}

/**
 * MergenV1 Profile Peek & Sheet Controller (Dual Mergen / Kyant0 Liquid Glass Theme):
 * - Left swipe ONLY from the creator's circular avatar on the feed opens the right-docked
 *   Account Drawer (never conflicting with carousel posts or user's own profile).
 * - Displays circular avatar, display name, @handle, Takip/Takipçi, Beğeni/Video, Biyografi,
 *   2x2 Hızlı İşlemler grid (Takip Et, Paylaş, Ses Kanalı, @Kopyala), plus Hesaba Git &
 *   Bu Hesabı Önerme / İlgilenmiyorum; asynchronously enriches missing stats via IProfileService.
 * - Right swipe opens Sound / Creator channel.
 * - Comments & Share bottom sheets support both Mergen 0dp framing and Kyant0 Liquid Glass.
 */
object PeekSheetAndProfileController {

    private const val TAG_OVERLAY_DISMISSING = 0x5341529F

    private class ActivityPeekState(
        var outerPager: ViewGroup? = null,
        var tabContainer: ViewGroup? = null,
        var backdropSource: View? = null,
        var overlayRoot: ViewGroup? = null,
        var drawerGroup: ViewGroup? = null,
        var drawerTotalW: Float = 0f,
        var sheetScanScheduled: Boolean = false,
        var overlayEpoch: Int = 0,
        var currentVideoKey: String = "",
        var currentVideoSeq: Int = 0,
        var lastPrefetchedKey: String = "",
        var prefetchRunnable: Runnable? = null,
        var videoPollRunnable: Runnable? = null
    )

    private const val TAG_SHEET_ORIG_BG = 0x53415281
    private const val TAG_SHEET_ORIG_OUTLINE = 0x53415282
    private const val TAG_SHEET_ORIG_CLIP = 0x53415283
    private const val TAG_SHEET_CHILD_ORIG_BG = 0x53415284
    private const val TAG_SHEET_STYLED = 0x53415285
    private const val TAG_SHEET_OBSERVER = 0x53415286
    private const val TAG_SHEET_GLASS_LAYER = 0x53415287

    private val peekStates = WeakHashMap<Activity, ActivityPeekState>()
    private val mainHandler = Handler(Looper.getMainLooper())

    private fun dp(context: Context, value: Float): Int = MergenDesign.dp(context, value)
    private fun dpF(context: Context, value: Float): Float = MergenDesign.dpF(context, value)

    fun sync(
        activity: Activity,
        host: ViewGroup,
        decor: View,
        tabContainer: ViewGroup? = null,
        backdropSource: View? = null
    ) {
        val state = peekStates.getOrPut(activity) { ActivityPeekState() }
        if (tabContainer != null) state.tabContainer = tabContainer
        if (backdropSource != null) state.backdropSource = backdropSource
        state.outerPager = TikTokViewResolver.findOuterHorizontalPager(host)

        val modActive = MergenPrefs.isModEffectivelyActive(activity)
        val ownProfile = TikTokViewResolver.isOwnProfileActive(activity, decor, state.tabContainer)

        if (!modActive || !MergenPrefs.isProfilePeekEnabled(activity) || ownProfile) {
            closePeekToFeed(activity, animate = false)
        }

        if (modActive && MergenPrefs.isProfilePeekEnabled(activity)) {
            ensureVideoPrefetchLoop(activity, state)
        } else {
            cancelVideoPrefetchLoop(state)
        }

        if (modActive && MergenPrefs.isPeekSheetsEnabled(activity) && !ownProfile) {
            attachDecorHierarchyObserverOnce(activity, decor, host, state)
            scheduleScanSheets(activity, decor, host, state)
        } else {
            scheduleRestoreAllSheets(decor)
        }
    }

    fun detach(activity: Activity) {
        val state = peekStates.remove(activity)
        if (state != null) {
            cancelVideoPrefetchLoop(state)
            state.overlayEpoch++
            removeOverlayDeferred(state)
        }
        if (peekStates.isEmpty()) {
            TikTokCreatorExtractor.clearCache()
        }
        activity.window?.decorView?.let { scheduleRestoreAllSheets(it) }
    }

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        if (tabIndex != 0 && tabIndex != 1) {
            peekStates[activity]?.let { st ->
                st.prefetchRunnable?.let { mainHandler.removeCallbacks(it) }
                st.prefetchRunnable = null
                st.currentVideoKey = ""
            }
            closePeekToFeed(activity, animate = false)
            if (tabIndex >= 4) {
                activity.window?.decorView?.let { scheduleRestoreAllSheets(it) }
            }
        }
    }

    private fun cancelVideoPrefetchLoop(state: ActivityPeekState) {
        state.videoPollRunnable?.let { mainHandler.removeCallbacks(it) }
        state.videoPollRunnable = null
        state.prefetchRunnable?.let { mainHandler.removeCallbacks(it) }
        state.prefetchRunnable = null
    }

    private fun ensureVideoPrefetchLoop(activity: Activity, state: ActivityPeekState) {
        if (state.videoPollRunnable != null) return
        val poll = object : Runnable {
            override fun run() {
                if (peekStates[activity] !== state ||
                    activity.isFinishing ||
                    activity.isDestroyed ||
                    !MergenPrefs.isModEffectivelyActive(activity) ||
                    !MergenPrefs.isProfilePeekEnabled(activity)
                ) {
                    cancelVideoPrefetchLoop(state)
                    return
                }
                pollActiveFeedVideo(activity, state)
                mainHandler.postDelayed(this, 500L)
            }
        }
        state.videoPollRunnable = poll
        mainHandler.postDelayed(poll, 500L)
    }

    private fun pollActiveFeedVideo(activity: Activity, state: ActivityPeekState) {
        val decor = activity.window?.decorView ?: return
        if (isInPeekState(activity) ||
            !TikTokViewResolver.isOnFeedTab(activity, decor, state.tabContainer) ||
            TikTokViewResolver.isOwnProfileActive(activity, decor, state.tabContainer)
        ) {
            return
        }
        val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor) ?: return
        val visibleTitle = (TikTokViewResolver.findAuthorTitleView(activity, activeWidget) as? TextView)
            ?.text?.toString()?.trim().orEmpty()
        if (visibleTitle.isEmpty()) return

        val pagerItem = findAncestorVerticalPagerItem(activeWidget)
        val videoKey = "${System.identityHashCode(activeWidget)}|$pagerItem|$visibleTitle"
        if (videoKey != state.currentVideoKey) {
            state.currentVideoKey = videoKey
            state.currentVideoSeq++
            val targetSeq = state.currentVideoSeq
            TikTokCreatorExtractor.onVideoSequenceChanged(targetSeq)

            state.prefetchRunnable?.let { mainHandler.removeCallbacks(it) }
            val prefetchTask = Runnable {
                if (peekStates[activity] !== state ||
                    state.currentVideoKey != videoKey ||
                    activity.isFinishing ||
                    activity.isDestroyed ||
                    !MergenPrefs.isModEffectivelyActive(activity) ||
                    !MergenPrefs.isProfilePeekEnabled(activity) ||
                    isInPeekState(activity)
                ) {
                    return@Runnable
                }
                val curDecor = activity.window?.decorView ?: return@Runnable
                if (!TikTokViewResolver.isOnFeedTab(activity, curDecor, state.tabContainer) ||
                    TikTokViewResolver.isOwnProfileActive(activity, curDecor, state.tabContainer)
                ) {
                    return@Runnable
                }
                state.lastPrefetchedKey = videoKey
                TikTokCreatorExtractor.prefetchCurrentCreator(activity, curDecor, targetSeq)
            }
            state.prefetchRunnable = prefetchTask
            mainHandler.postDelayed(prefetchTask, 3000L)
        }
    }

    private fun findAncestorVerticalPagerItem(view: View): Int {
        var cur: View? = view.parent as? View
        var depth = 0
        while (cur != null && depth < 5) {
            val simple = cur.javaClass.simpleName
            if (simple.contains("VerticalViewPager", ignoreCase = true) ||
                simple.contains("ViewPager", ignoreCase = true)
            ) {
                return try {
                    (cur.javaClass.getMethod("getCurrentItem").invoke(cur) as? Int) ?: -1
                } catch (_: Throwable) {
                    -1
                }
            }
            cur = cur.parent as? View
            depth++
        }
        return -1
    }

    fun isInPeekState(activity: Activity): Boolean =
        peekStates[activity]?.overlayRoot != null

    fun isPointOnCreatorAvatar(activity: Activity, rawX: Float, rawY: Float): Boolean {
        val decor = activity.window?.decorView ?: return false
        val rect = TikTokViewResolver.findCreatorAvatarBounds(activity, decor, padDp = 18f) ?: return false
        return rect.contains(rawX.roundToInt(), rawY.roundToInt())
    }

    fun canOpenProfileDrawer(activity: Activity): Boolean {
        if (!MergenPrefs.isModEffectivelyActive(activity) || !MergenPrefs.isProfilePeekEnabled(activity)) {
            return false
        }
        if (QuickControlSheetController.isShowing(activity)) return false
        if (isInPeekState(activity)) return false

        val decor = activity.window?.decorView ?: return false
        val state = peekStates[activity]
        if (TikTokViewResolver.isOwnProfileActive(activity, decor, state?.tabContainer)) {
            return false
        }
        if (!TikTokViewResolver.isOnFeedTab(activity, decor, state?.tabContainer)) {
            return false
        }
        val pager = state?.outerPager
        if (pager != null && pager.scrollX > dp(activity, 28f)) {
            return false
        }
        return true
    }

    fun openProfileDrawer(activity: Activity) {
        if (!canOpenProfileDrawer(activity)) return
        val decor = activity.window?.decorView ?: return
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return

        val state = peekStates.getOrPut(activity) { ActivityPeekState() }
        snapOuterPagerToFeed(state.outerPager)

        val creator = TikTokCreatorExtractor.extractCurrentCreator(activity, decor)
        if (creator.isOwnAccount) {
            return
        }

        state.overlayEpoch++
        val epoch = state.overlayEpoch

        content.post {
            if (activity.isFinishing || activity.isDestroyed || state.overlayEpoch != epoch) return@post
            presentProfileDrawer(activity, content, decor, state, creator, epoch)
        }
        MergenHaptics.playSnap(activity)
    }

    fun expandToFullProfile(activity: Activity) {
        val state = peekStates[activity]
        val pager = state?.outerPager
        closePeekToFeed(activity, animate = false)

        MergenHaptics.playSnap(activity)
        val decor = activity.window?.decorView

        if (pager != null && trySmoothScrollToFullProfile(pager)) {
            return
        }
        if (decor != null) {
            val activeWidget = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
            val target = activeWidget?.let {
                TikTokViewResolver.findAuthorTitleView(activity, it)
                    ?: TikTokViewResolver.findCreatorAvatarView(activity, it)
            }
            target?.performClick()
        }
    }

    fun closePeekToFeed(activity: Activity, animate: Boolean = true) {
        closePeekToFeedWithVelocity(activity, animate, initialVelocityPxPerSec = null)
    }

    private fun closePeekToFeedWithVelocity(
        activity: Activity,
        animate: Boolean = true,
        initialVelocityPxPerSec: Float? = null
    ) {
        val state = peekStates[activity] ?: return
        snapOuterPagerToFeed(state.outerPager)
        val overlay = state.overlayRoot ?: return
        val drawer = state.drawerGroup
        state.overlayEpoch++

        if (!animate || drawer == null) {
            state.overlayRoot = null
            state.drawerGroup = null
            removeViewDeferred(overlay)
            return
        }

        state.overlayRoot = null
        state.drawerGroup = null
        overlay.setTag(TAG_OVERLAY_DISMISSING, true)
        overlay.isClickable = false
        overlay.setOnClickListener(null)

        var finished = false
        lateinit var finishRemove: Runnable
        finishRemove = Runnable {
            if (finished) return@Runnable
            finished = true
            mainHandler.removeCallbacks(finishRemove)
            MergenSpringEngine.cancelViewSprings(drawer)
            MergenMotionBlur.clear(drawer)
            (overlay.parent as? ViewGroup)?.removeView(overlay)
        }
        mainHandler.postDelayed(finishRemove, 450L)

        MergenSpringEngine.cancelViewSprings(drawer)
        val exitX = state.drawerTotalW.coerceAtLeast(dpF(activity, 240f))
        if (MergenSpringEngine.isReducedMotion(activity)) {
            overlay.setBackgroundColor(Color.argb(0, 0, 0, 0))
            MergenSpringEngine.springPop(
                view = drawer,
                fromScaleX = drawer.scaleX,
                fromScaleY = drawer.scaleY,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = drawer.alpha,
                toAlpha = 0f,
                maxBlurDp = 0f,
                onEnd = { finishRemove.run() }
            )
            return
        }
        val dist = exitX.coerceAtLeast(1f)
        MergenSpringEngine.springTranslationX(
            view = drawer,
            targetX = exitX,
            initialVelocityPxPerSec = initialVelocityPxPerSec,
            dampingRatio = 0.98f,
            responseSec = 0.21f,
            maxBlurDp = 12f,
            onUpdate = { curX ->
                val dimFrac = (1f - (curX.coerceAtLeast(0f) / dist)).coerceIn(0f, 1f)
                overlay.setBackgroundColor(Color.argb((48 * dimFrac).roundToInt(), 0, 0, 0))
            },
            onEnd = { finishRemove.run() }
        )
    }

    fun openSoundChannel(activity: Activity, decor: View): Boolean {
        if (TikTokViewResolver.isOwnProfileActive(activity, decor, peekStates[activity]?.tabContainer)) {
            return false
        }
        val musicBtn = TikTokViewResolver.findMusicButton(activity, decor) ?: return false
        MergenHaptics.playSnap(activity)
        DynamicPillController.showStatus(
            activity,
            MergenStrings.t(activity, "SES KANALI AÇILIYOR", "OPENING SOUND CHANNEL")
        )
        return musicBtn.performClick()
    }

    private fun snapOuterPagerToFeed(pager: ViewGroup?) {
        if (pager == null) return
        if (pager.scrollX != 0) {
            try {
                pager.javaClass.getMethod(
                    "setCurrentItem",
                    Int::class.javaPrimitiveType,
                    Boolean::class.javaPrimitiveType
                ).invoke(pager, 0, false)
            } catch (_: Throwable) {
            }
            pager.scrollTo(0, 0)
            pager.post {
                if (pager.scrollX != 0) {
                    pager.scrollTo(0, 0)
                }
            }
        }
    }

    private fun triggerNotInterested(activity: Activity) {
        closePeekToFeed(activity, animate = true)
        val decor = activity.window?.decorView ?: return
        mainHandler.postDelayed({
            if (activity.isFinishing || activity.isDestroyed) return@postDelayed
            val longTarget = TikTokViewResolver.findLongPressTarget(activity, decor)
            if (longTarget == null || !longTarget.performLongClick()) {
                DynamicPillController.showStatus(
                    activity,
                    MergenStrings.t(activity, "MENÜ AÇILAMADI", "FAILED TO OPEN MENU")
                )
                return@postDelayed
            }
            attemptClickNotInterested(activity, attempt = 0)
        }, 180L)
    }

    private fun attemptClickNotInterested(activity: Activity, attempt: Int) {
        val delays = longArrayOf(280L, 320L, 400L)
        if (attempt >= delays.size) return
        mainHandler.postDelayed({
            if (activity.isFinishing || activity.isDestroyed) return@postDelayed
            val btn = TikTokViewResolver.findNotInterestedInAnyWindow(activity)
            if (btn != null && btn.performClick()) {
                MergenHaptics.playSnap(activity)
                DynamicPillController.showStatus(
                    activity,
                    MergenStrings.t(activity, "İLGİLENMİYORUM SEÇİLDİ", "MARKED NOT INTERESTED")
                )
            } else {
                attemptClickNotInterested(activity, attempt + 1)
            }
        }, delays[attempt])
    }

    private fun presentProfileDrawer(
        activity: Activity,
        content: ViewGroup,
        decor: View,
        state: ActivityPeekState,
        initialCreator: TikTokCreatorExtractor.CreatorPreviewData,
        epoch: Int
    ) {
        if (state.overlayEpoch != epoch) return
        removeOverlaySync(state)

        var currentCreator = initialCreator
        val kyant0 = MergenPrefs.isKyant0Style(activity)
        val dm = activity.resources.displayMetrics
        val screenW = dm.widthPixels
        val screenH = dm.heightPixels
        val statusTop = TikTokViewResolver.statusBarTopInset(activity, decor)
        val navInset = TikTokViewResolver.navBarBottomInset(decor)
        val strokePx = dp(activity, 1f).coerceAtLeast(1)

        val drawerTop = statusTop + dp(activity, 52f)
        val bottomClearance = navInset + dp(activity, 76f)
        val drawerH = (screenH - drawerTop - bottomClearance).coerceAtLeast(dp(activity, 360f))
        val panelW = (screenW * 0.48f).roundToInt().coerceIn(dp(activity, 184f), dp(activity, 232f))
        val handleBarW = dp(activity, 4f)
        val handleGap = dp(activity, 10f)
        val totalGroupW = panelW + handleBarW + handleGap

        val overlay: FrameLayout = object : FrameLayout(activity) {
            override fun dispatchTouchEvent(ev: MotionEvent): Boolean {
                if (getTag(TAG_OVERLAY_DISMISSING) == true) return false
                return super.dispatchTouchEvent(ev)
            }
        }.apply {
            setTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW, true)
            setBackgroundColor(Color.argb(0, 0, 0, 0))
            alpha = 1f
            setOnClickListener {
                MergenHaptics.playTap(activity)
                closePeekToFeed(activity, animate = true)
            }
        }

        val drawerGroup = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }

        // Exterior Drag Handle
        val handleHitArea = FrameLayout(activity).apply {
            isClickable = true
            isFocusable = true
        }
        val handleVisual = View(activity).apply {
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.RECTANGLE
                    cornerRadius = dpF(activity, 2f)
                    setColor(Color.argb(200, 255, 255, 255))
                }
            } else {
                MergenDesign.sharpBox(MergenDesign.OBSIDIAN_INK)
            }
        }
        handleHitArea.addView(
            handleVisual,
            FrameLayout.LayoutParams(handleBarW, dp(activity, 54f), Gravity.CENTER)
        )
        drawerGroup.addView(
            handleHitArea,
            LinearLayout.LayoutParams(dp(activity, 18f), ViewGroup.LayoutParams.MATCH_PARENT)
        )

        val touchSlop = ViewConfiguration.get(activity).scaledTouchSlop.toFloat()
        var panelDownX = 0f
        var panelDownY = 0f
        var panelDragging = false
        var panelVelocity: VelocityTracker? = null

        val panelFrame: FrameLayout = if (kyant0) {
            object : KyantGlassSurfaceView(
                context = activity,
                backdropSource = state.backdropSource,
                cornerRadiusDp = 26f,
                leftCornersOnly = true,
                blurRadiusDp = 12f,
                refractionHeightDp = 20f,
                refractionAmountDp = 22f,
                forceDarkGlass = true
            ) {
                override fun onInterceptTouchEvent(ev: MotionEvent): Boolean {
                    when (ev.actionMasked) {
                        MotionEvent.ACTION_DOWN -> {
                            panelDownX = ev.rawX
                            panelDownY = ev.rawY
                            panelDragging = false
                            MergenSpringEngine.cancelTranslationX(drawerGroup)
                            panelVelocity?.recycle()
                            panelVelocity = VelocityTracker.obtain().apply { addMovement(ev) }
                        }
                        MotionEvent.ACTION_MOVE -> {
                            panelVelocity?.addMovement(ev)
                            val dx = ev.rawX - panelDownX
                            val dy = ev.rawY - panelDownY
                            if (abs(dx) > touchSlop && abs(dx) > abs(dy) * 1.25f) {
                                panelDragging = true
                                parent?.requestDisallowInterceptTouchEvent(true)
                                return true
                            }
                        }
                        MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                            panelDragging = false
                            panelVelocity?.recycle()
                            panelVelocity = null
                        }
                    }
                    return super.onInterceptTouchEvent(ev)
                }

                override fun onTouchEvent(ev: MotionEvent): Boolean {
                    return handlePanelDragEvent(
                        activity, ev, overlay, drawerGroup, panelW.toFloat(), totalGroupW.toFloat(), touchSlop,
                        getDown = { panelDownX to panelDownY },
                        setDragging = { panelDragging = it },
                        isDragging = { panelDragging },
                        trackerProvider = { panelVelocity },
                        clearTracker = { panelVelocity?.recycle(); panelVelocity = null }
                    )
                }
            }
        } else {
            object : FrameLayout(activity) {
                override fun onInterceptTouchEvent(ev: MotionEvent): Boolean {
                    when (ev.actionMasked) {
                        MotionEvent.ACTION_DOWN -> {
                            panelDownX = ev.rawX
                            panelDownY = ev.rawY
                            panelDragging = false
                            MergenSpringEngine.cancelTranslationX(drawerGroup)
                            panelVelocity?.recycle()
                            panelVelocity = VelocityTracker.obtain().apply { addMovement(ev) }
                        }
                        MotionEvent.ACTION_MOVE -> {
                            panelVelocity?.addMovement(ev)
                            val dx = ev.rawX - panelDownX
                            val dy = ev.rawY - panelDownY
                            if (abs(dx) > touchSlop && abs(dx) > abs(dy) * 1.25f) {
                                panelDragging = true
                                parent?.requestDisallowInterceptTouchEvent(true)
                                return true
                            }
                        }
                        MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                            panelDragging = false
                            panelVelocity?.recycle()
                            panelVelocity = null
                        }
                    }
                    return super.onInterceptTouchEvent(ev)
                }

                override fun onTouchEvent(ev: MotionEvent): Boolean {
                    return handlePanelDragEvent(
                        activity, ev, overlay, drawerGroup, panelW.toFloat(), totalGroupW.toFloat(), touchSlop,
                        getDown = { panelDownX to panelDownY },
                        setDragging = { panelDragging = it },
                        isDragging = { panelDragging },
                        trackerProvider = { panelVelocity },
                        clearTracker = { panelVelocity?.recycle(); panelVelocity = null }
                    )
                }
            }.apply {
                background = MergenDesign.rightDockedDrawerBg(
                    fillColor = MergenDesign.OBSIDIAN_PANEL,
                    strokeColor = MergenDesign.OBSIDIAN_BORDER,
                    strokePx = strokePx
                )
            }
        }
        panelFrame.apply {
            elevation = dpF(activity, 16f)
            isClickable = true
            isFocusable = true
        }

        val scroll = ScrollView(activity).apply {
            isFillViewport = true
            overScrollMode = View.OVER_SCROLL_NEVER
            isVerticalScrollBarEnabled = false
        }

        val col = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            setPadding(dp(activity, 11f), dp(activity, 16f), dp(activity, 11f), dp(activity, 12f))
        }

        // 1. Circular Profile Avatar (76dp, crisp ring)
        val avatarOuterSize = dp(activity, 76f)
        val avatarContainer = FrameLayout(activity).apply {
            val ringW = dp(activity, 1.5f).coerceAtLeast(1)
            background = GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(MergenDesign.OBSIDIAN_SURFACE)
                setStroke(ringW, Color.argb(if (kyant0) 160 else 255, 255, 255, 255))
            }
            setPadding(ringW, ringW, ringW, ringW)
        }

        val avatarIv = ImageView(activity).apply {
            scaleType = ImageView.ScaleType.CENTER_CROP
        }
        if (currentCreator.avatarDrawable != null) {
            avatarIv.setImageDrawable(currentCreator.avatarDrawable)
            avatarContainer.addView(
                avatarIv,
                FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            )
            if (!currentCreator.avatarUrl.isNullOrBlank()) {
                TikTokCreatorExtractor.loadAvatarBitmapAsync(currentCreator.avatarUrl, avatarIv)
            }
        } else {
            avatarContainer.addView(
                MergenDefaultAvatarView(activity),
                FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
            )
            if (!currentCreator.avatarUrl.isNullOrBlank()) {
                avatarContainer.addView(
                    avatarIv,
                    FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                )
                TikTokCreatorExtractor.loadAvatarBitmapAsync(currentCreator.avatarUrl, avatarIv)
            }
        }

        col.addView(
            avatarContainer,
            LinearLayout.LayoutParams(avatarOuterSize, avatarOuterSize).apply {
                bottomMargin = dp(activity, 9f)
            }
        )

        // 2. Display Name & @handle
        val nameTv = TextView(activity).apply {
            text = currentCreator.displayName
            gravity = Gravity.CENTER
            typeface = Typeface.create(if (kyant0) "sans-serif-medium" else "sans-serif", Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 14f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            maxLines = 2
            ellipsize = TextUtils.TruncateAt.END
        }
        col.addView(
            nameTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val handleTv = TextView(activity).apply {
            text = currentCreator.handle
            gravity = Gravity.CENTER
            typeface = Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10f)
            setTextColor(MergenDesign.OBSIDIAN_MUTED)
            maxLines = 1
            isSingleLine = true
            ellipsize = TextUtils.TruncateAt.END
        }
        col.addView(
            handleTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 2f)
                bottomMargin = dp(activity, 10f)
            }
        )

        col.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, strokePx)
        )

        // 3. Primary Stats Row (TAKİP | TAKİPÇİ)
        val followingPair = buildStatColumn(
            activity,
            MergenStrings.t(activity, "TAKİP", "FOLLOWING"),
            MergenDesign.formatCompactCount(currentCreator.followingCount)
        )
        val followerPair = buildStatColumn(
            activity,
            MergenStrings.t(activity, "TAKİPÇİ", "FOLLOWERS"),
            MergenDesign.formatCompactCount(currentCreator.followerCount)
        )
        val followingValTv = followingPair.second
        val followerValTv = followerPair.second

        val statsRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(0, dp(activity, 9f), 0, dp(activity, 9f))
        }
        statsRow.addView(followingPair.first, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
        statsRow.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(strokePx, dp(activity, 30f))
        )
        statsRow.addView(followerPair.first, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
        col.addView(statsRow, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT))

        // 4. Compact Secondary Stats Row (BEĞENİ | VİDEO)
        val likesPair = buildCompactStatColumn(
            activity,
            MergenStrings.t(activity, "BEĞENİ", "LIKES"),
            MergenDesign.formatCompactCount(currentCreator.totalLikes)
        )
        val videosPair = buildCompactStatColumn(
            activity,
            MergenStrings.t(activity, "VİDEO", "VIDEOS"),
            MergenDesign.formatCompactCount(currentCreator.videoCount)
        )
        val likesValTv = likesPair.second
        val videosValTv = videosPair.second

        val secondaryStatsWrap = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            visibility = if (currentCreator.totalLikes >= 0L || currentCreator.videoCount >= 0L) View.VISIBLE else View.GONE
        }
        secondaryStatsWrap.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, strokePx)
        )
        val secRow = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            setPadding(0, dp(activity, 7f), 0, dp(activity, 7f))
        }
        secRow.addView(likesPair.first, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
        secRow.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(strokePx, dp(activity, 22f))
        )
        secRow.addView(videosPair.first, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f))
        secondaryStatsWrap.addView(secRow)
        col.addView(
            secondaryStatsWrap,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        col.addView(
            View(activity).apply { setBackgroundColor(MergenDesign.OBSIDIAN_HAIRLINE) },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, strokePx).apply {
                bottomMargin = dp(activity, 9f)
            }
        )

        // 5. Biyografi Block
        col.addView(
            TextView(activity).apply {
                text = MergenStrings.t(activity, "BİYOGRAFİ", "BIO")
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 8.5f)
                setTextColor(MergenDesign.OBSIDIAN_MUTED)
                letterSpacing = 0.08f
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )
        val bioTv = TextView(activity).apply {
            text = if (currentCreator.bio.isNotBlank()) currentCreator.bio else MergenStrings.t(activity, "Biyografi yok", "No bio")
            gravity = Gravity.CENTER
            typeface = if (currentCreator.bio.isNotBlank()) Typeface.SANS_SERIF else Typeface.MONOSPACE
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            setTextColor(if (currentCreator.bio.isNotBlank()) MergenDesign.OBSIDIAN_INK else MergenDesign.OBSIDIAN_MUTED)
            maxLines = 4
            ellipsize = TextUtils.TruncateAt.END
        }
        col.addView(
            bioTv,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 4f)
            }
        )

        // Helper for styling drawer buttons in dual theme
        fun makeActionBg(inverted: Boolean) = if (kyant0) {
            GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                cornerRadius = dpF(activity, 12f)
                setColor(if (inverted) Color.WHITE else Color.argb(42, 255, 255, 255))
                if (!inverted) {
                    setStroke(strokePx, Color.argb(85, 255, 255, 255))
                }
            }
        } else {
            MergenDesign.sharpBox(
                fillColor = if (inverted) MergenDesign.OBSIDIAN_INK else MergenDesign.OBSIDIAN_ELEVATED,
                strokeColor = if (inverted) Color.TRANSPARENT else Color.argb(110, 255, 255, 255),
                strokePx = if (inverted) 0 else strokePx
            )
        }

        // 6. Hızlı İşlemler 2x2 Grid directly below Biyografi
        col.addView(
            TextView(activity).apply {
                text = MergenStrings.t(activity, "HIZLI İŞLEMLER", "QUICK ACTIONS")
                gravity = Gravity.CENTER
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 8.5f)
                setTextColor(MergenDesign.OBSIDIAN_MUTED)
                letterSpacing = 0.08f
            },
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 12f)
                bottomMargin = dp(activity, 6f)
            }
        )

        var isFollowingLocal = currentCreator.followStatus > 0
        val followingLabel = MergenStrings.t(activity, "TAKİPTE", "FOLLOWING")
        val followLabel = MergenStrings.t(activity, "TAKİP ET", "FOLLOW")
        lateinit var followChip: TextView
        followChip = TextView(activity).apply {
            text = if (isFollowingLocal) followingLabel else followLabel
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            setTextColor(if (isFollowingLocal) MergenDesign.OBSIDIAN_BG else MergenDesign.OBSIDIAN_INK)
            background = makeActionBg(inverted = isFollowingLocal)
            setPadding(dp(activity, 4f), dp(activity, 8f), dp(activity, 4f), dp(activity, 8f))
            attachPressScale(this)
            setOnClickListener {
                val activeW = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
                val followView = activeW?.let { TikTokViewResolver.findFeedFollowButton(activity, it) }
                if (followView != null && followView.performClick()) {
                    isFollowingLocal = !isFollowingLocal
                    followChip.text = if (isFollowingLocal) followingLabel else followLabel
                    followChip.setTextColor(if (isFollowingLocal) MergenDesign.OBSIDIAN_BG else MergenDesign.OBSIDIAN_INK)
                    followChip.background = makeActionBg(inverted = isFollowingLocal)
                    MergenHaptics.playSnap(activity)
                    DynamicPillController.showStatus(
                        activity,
                        if (isFollowingLocal) {
                            MergenStrings.t(activity, "${currentCreator.handle} TAKİP EDİLDİ", "FOLLOWED ${currentCreator.handle}")
                        } else {
                            MergenStrings.t(activity, "TAKİP GÜNCELLENDİ", "FOLLOW UPDATED")
                        }
                    )
                } else {
                    MergenHaptics.playTap(activity)
                    expandToFullProfile(activity)
                }
            }
        }

        val shareChip = TextView(activity).apply {
            text = MergenStrings.t(activity, "PAYLAŞ", "SHARE")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = makeActionBg(inverted = false)
            setPadding(dp(activity, 4f), dp(activity, 8f), dp(activity, 4f), dp(activity, 8f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                closePeekToFeed(activity, animate = true)
                mainHandler.postDelayed({
                    val activeW = TikTokViewResolver.findActiveWidgetContainer(activity, decor)
                    activeW?.let { TikTokViewResolver.findFeedShareButton(activity, it)?.performClick() }
                }, 170L)
            }
        }

        val quickRow1 = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        quickRow1.addView(followChip, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 4f) })
        quickRow1.addView(shareChip, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 4f) })
        col.addView(quickRow1, LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT))

        val soundChip = TextView(activity).apply {
            text = MergenStrings.t(activity, "SES KANALI", "SOUND")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = makeActionBg(inverted = false)
            setPadding(dp(activity, 4f), dp(activity, 8f), dp(activity, 4f), dp(activity, 8f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                closePeekToFeed(activity, animate = true)
                mainHandler.postDelayed({
                    openSoundChannel(activity, decor)
                }, 170L)
            }
        }

        val copyChip = TextView(activity).apply {
            text = MergenStrings.t(activity, "@KOPYALA", "@COPY")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = makeActionBg(inverted = false)
            setPadding(dp(activity, 4f), dp(activity, 8f), dp(activity, 4f), dp(activity, 8f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playSnap(activity)
                val cm = activity.getSystemService(Context.CLIPBOARD_SERVICE) as? ClipboardManager
                cm?.setPrimaryClip(ClipData.newPlainText("handle", currentCreator.handle))
                DynamicPillController.showStatus(
                    activity,
                    MergenStrings.t(activity, "${currentCreator.handle} KOPYALANDI", "COPIED ${currentCreator.handle}")
                )
            }
        }

        val quickRow2 = LinearLayout(activity).apply { orientation = LinearLayout.HORIZONTAL }
        quickRow2.addView(soundChip, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { rightMargin = dp(activity, 4f) })
        quickRow2.addView(copyChip, LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f).apply { leftMargin = dp(activity, 4f) })
        col.addView(
            quickRow2,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 6f)
            }
        )

        // Spacer pushing bottom CTA stack cleanly
        col.addView(
            View(activity),
            LinearLayout.LayoutParams(1, 0, 1f).apply {
                topMargin = dp(activity, 10f)
            }
        )

        // 7. Stacked Primary CTA Buttons
        val goProfileBtn = TextView(activity).apply {
            text = MergenStrings.t(activity, "HESABA GİT →", "OPEN PROFILE →")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 11f)
            setTextColor(MergenDesign.OBSIDIAN_BG)
            background = makeActionBg(inverted = true)
            minHeight = dp(activity, 42f)
            setPadding(dp(activity, 8f), dp(activity, 10f), dp(activity, 8f), dp(activity, 10f))
            attachPressScale(this)
            setOnClickListener { expandToFullProfile(activity) }
        }
        col.addView(
            goProfileBtn,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        )

        val notInterestedBtn = TextView(activity).apply {
            text = MergenStrings.t(activity, "BU HESABI ÖNERME\n/ İLGİLENMİYORUM", "DON'T RECOMMEND\n/ NOT INTERESTED")
            gravity = Gravity.CENTER
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 9f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
            background = makeActionBg(inverted = false)
            minHeight = dp(activity, 44f)
            setPadding(dp(activity, 6f), dp(activity, 8f), dp(activity, 6f), dp(activity, 8f))
            attachPressScale(this)
            setOnClickListener {
                MergenHaptics.playTap(activity)
                triggerNotInterested(activity)
            }
        }
        col.addView(
            notInterestedBtn,
            LinearLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                topMargin = dp(activity, 7f)
            }
        )

        scroll.addView(col)
        panelFrame.addView(
            scroll,
            FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        )
        drawerGroup.addView(
            panelFrame,
            LinearLayout.LayoutParams(panelW, ViewGroup.LayoutParams.MATCH_PARENT)
        )

        attachHandleDragGestures(activity, overlay, drawerGroup, handleHitArea, panelW.toFloat(), totalGroupW.toFloat())

        state.drawerTotalW = totalGroupW.toFloat()
        state.drawerGroup = drawerGroup
        state.overlayRoot = overlay

        val reduced = MergenSpringEngine.isReducedMotion(activity)
        drawerGroup.translationX = if (reduced) 0f else state.drawerTotalW
        drawerGroup.alpha = if (reduced) 0f else 1f
        overlay.addView(
            drawerGroup,
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.WRAP_CONTENT,
                drawerH,
                Gravity.TOP or Gravity.END
            ).apply {
                topMargin = drawerTop
            }
        )

        content.addView(
            overlay,
            FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT
            )
        )

        if (reduced) {
            overlay.setBackgroundColor(Color.argb(48, 0, 0, 0))
            MergenSpringEngine.springPop(
                view = drawerGroup,
                fromScaleX = 1f,
                fromScaleY = 1f,
                toScaleX = 1f,
                toScaleY = 1f,
                fromAlpha = 0f,
                toAlpha = 1f,
                maxBlurDp = 0f
            )
        } else {
            val enterDist = state.drawerTotalW.coerceAtLeast(1f)
            MergenSpringEngine.springTranslationX(
                view = drawerGroup,
                targetX = 0f,
                dampingRatio = 0.86f,
                responseSec = 0.28f,
                maxBlurDp = 12f,
                onUpdate = { curX ->
                    val frac = (1f - (curX.coerceAtLeast(0f) / enterDist)).coerceIn(0f, 1f)
                    overlay.setBackgroundColor(Color.argb((48 * frac).roundToInt(), 0, 0, 0))
                }
            )
            val staggerGroups = arrayOf<View>(statsRow, quickRow1, quickRow2, goProfileBtn, notInterestedBtn)
            val shiftPx = dpF(activity, 14f)
            for (idx in staggerGroups.indices) {
                val item = staggerGroups[idx]
                item.translationX = shiftPx
                mainHandler.postDelayed({
                    if (state.overlayEpoch == epoch && state.overlayRoot === overlay) {
                        MergenSpringEngine.springTranslationX(
                            view = item,
                            targetX = 0f,
                            dampingRatio = 0.88f,
                            responseSec = 0.24f,
                            maxBlurDp = 0f
                        )
                    }
                }, idx * 18L)
            }
        }

        // Async live stat/bio/HD-avatar enrichment when feed Aweme lacks counts
        TikTokCreatorExtractor.enrichCreatorAsync(activity, initialCreator, state.currentVideoSeq) { enriched ->
            if (state.overlayEpoch != epoch || state.overlayRoot !== overlay) return@enrichCreatorAsync
            currentCreator = enriched
            nameTv.text = enriched.displayName
            handleTv.text = enriched.handle
            followingValTv.text = MergenDesign.formatCompactCount(enriched.followingCount)
            followerValTv.text = MergenDesign.formatCompactCount(enriched.followerCount)
            if (enriched.totalLikes >= 0L || enriched.videoCount >= 0L) {
                likesValTv.text = MergenDesign.formatCompactCount(enriched.totalLikes)
                videosValTv.text = MergenDesign.formatCompactCount(enriched.videoCount)
                secondaryStatsWrap.visibility = View.VISIBLE
            }
            if (enriched.bio.isNotBlank()) {
                bioTv.text = enriched.bio
                bioTv.typeface = Typeface.SANS_SERIF
                bioTv.setTextColor(MergenDesign.OBSIDIAN_INK)
            }
            if (enriched.followStatus > 0 && !isFollowingLocal) {
                isFollowingLocal = true
                followChip.text = followingLabel
                followChip.setTextColor(MergenDesign.OBSIDIAN_BG)
                followChip.background = makeActionBg(inverted = true)
            }
            if (enriched.avatarDrawable != null && avatarIv.drawable == null) {
                if (avatarIv.parent == null) {
                    avatarContainer.addView(
                        avatarIv,
                        FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                    )
                }
                avatarIv.setImageDrawable(enriched.avatarDrawable)
            } else if (enriched.avatarUrl != null && enriched.avatarUrl != initialCreator.avatarUrl) {
                if (avatarIv.parent == null) {
                    avatarContainer.addView(
                        avatarIv,
                        FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                    )
                }
                TikTokCreatorExtractor.loadAvatarBitmapAsync(enriched.avatarUrl, avatarIv)
            }
        }
    }

    private fun handlePanelDragEvent(
        activity: Activity,
        ev: MotionEvent,
        overlay: FrameLayout,
        drawerGroup: ViewGroup,
        panelW: Float,
        totalGroupW: Float,
        touchSlop: Float,
        getDown: () -> Pair<Float, Float>,
        setDragging: (Boolean) -> Unit,
        isDragging: () -> Boolean,
        trackerProvider: () -> VelocityTracker?,
        clearTracker: () -> Unit
    ): Boolean {
        val (downX, downY) = getDown()
        val dragging = isDragging()
        val dimDist = totalGroupW.coerceAtLeast(1f)
        when (ev.actionMasked) {
            MotionEvent.ACTION_MOVE -> {
                val tracker = trackerProvider()
                tracker?.addMovement(ev)
                val dx = ev.rawX - downX
                val dy = ev.rawY - downY
                if (!dragging && abs(dx) > touchSlop && abs(dx) > abs(dy) * 1.25f) {
                    setDragging(true)
                    drawerGroup.parent?.requestDisallowInterceptTouchEvent(true)
                }
                if (dragging || abs(dx) > touchSlop) {
                    val tx = if (dx >= 0f) {
                        dx.coerceAtMost(totalGroupW)
                    } else {
                        -MergenSpringEngine.rubberband(-dx, dpF(activity, 52f), 0.45f)
                    }
                    drawerGroup.translationX = tx
                    val dimFrac = (1f - (tx.coerceAtLeast(0f) / dimDist)).coerceIn(0f, 1f)
                    overlay.setBackgroundColor(Color.argb((48 * dimFrac).roundToInt(), 0, 0, 0))
                    tracker?.computeCurrentVelocity(1000)
                    MergenMotionBlur.applyDragVelocityBlur(
                        drawerGroup,
                        tracker?.xVelocity ?: 0f,
                        0f,
                        maxBlurDp = 9f
                    )
                    return true
                }
            }
            MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                drawerGroup.parent?.requestDisallowInterceptTouchEvent(false)
                val tracker = trackerProvider()
                tracker?.computeCurrentVelocity(1000)
                val vx = tracker?.xVelocity ?: 0f
                clearTracker()
                MergenMotionBlur.clear(drawerGroup)
                if (!dragging) return false
                setDragging(false)
                val dx = ev.rawX - downX
                val scale = MergenPrefs.getGestureThresholdScale(activity)
                val projectedX = MergenSpringEngine.projectMomentum(drawerGroup.translationX, vx)
                when {
                    vx > 700f || dx > dpF(activity, 44f) * scale || projectedX > panelW * 0.42f ->
                        closePeekToFeedWithVelocity(activity, animate = true, initialVelocityPxPerSec = vx)
                    vx < -700f || dx < -dpF(activity, 50f) * scale || projectedX < -dpF(activity, 70f) ->
                        expandToFullProfile(activity)
                    else -> MergenSpringEngine.springTranslationX(
                        view = drawerGroup,
                        targetX = 0f,
                        initialVelocityPxPerSec = vx,
                        dampingRatio = 0.86f,
                        responseSec = 0.26f,
                        maxBlurDp = 10f,
                        onUpdate = { curX ->
                            val dimFrac = (1f - (curX.coerceAtLeast(0f) / dimDist)).coerceIn(0f, 1f)
                            overlay.setBackgroundColor(Color.argb((48 * dimFrac).roundToInt(), 0, 0, 0))
                        }
                    )
                }
                return true
            }
        }
        return true
    }

    private fun buildStatColumn(activity: Activity, label: String, valueText: String): Pair<LinearLayout, TextView> {
        val valueTv = TextView(activity).apply {
            text = valueText
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 16.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
        }
        val col = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            addView(TextView(activity).apply {
                text = label
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 8.5f)
                setTextColor(MergenDesign.OBSIDIAN_MUTED)
                letterSpacing = 0.06f
            })
            addView(
                valueTv,
                LinearLayout.LayoutParams(ViewGroup.LayoutParams.WRAP_CONTENT, ViewGroup.LayoutParams.WRAP_CONTENT).apply {
                    topMargin = dp(activity, 2f)
                }
            )
        }
        return col to valueTv
    }

    private fun buildCompactStatColumn(activity: Activity, label: String, valueText: String): Pair<LinearLayout, TextView> {
        val valueTv = TextView(activity).apply {
            text = valueText
            typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 12.5f)
            setTextColor(MergenDesign.OBSIDIAN_INK)
        }
        val col = LinearLayout(activity).apply {
            orientation = LinearLayout.VERTICAL
            gravity = Gravity.CENTER_HORIZONTAL
            addView(TextView(activity).apply {
                text = label
                typeface = Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 8f)
                setTextColor(MergenDesign.OBSIDIAN_MUTED)
                letterSpacing = 0.05f
            })
            addView(valueTv)
        }
        return col to valueTv
    }

    private fun attachPressScale(view: View) {
        MergenSpringEngine.attachSpringPress(view, pressedScale = 0.94f)
    }

    private fun attachHandleDragGestures(
        activity: Activity,
        overlay: FrameLayout,
        drawerGroup: ViewGroup,
        handleHitArea: View,
        panelW: Float,
        totalGroupW: Float
    ) {
        val touchSlop = ViewConfiguration.get(activity).scaledTouchSlop.toFloat()
        val dimDist = totalGroupW.coerceAtLeast(1f)
        var downX = 0f
        var downY = 0f
        var dragging = false
        var tracker: VelocityTracker? = null

        handleHitArea.setOnTouchListener { v, ev ->
            when (ev.actionMasked) {
                MotionEvent.ACTION_DOWN -> {
                    downX = ev.rawX
                    downY = ev.rawY
                    dragging = false
                    MergenSpringEngine.cancelTranslationX(drawerGroup)
                    tracker?.recycle()
                    tracker = VelocityTracker.obtain().apply { addMovement(ev) }
                    true
                }
                MotionEvent.ACTION_MOVE -> {
                    tracker?.addMovement(ev)
                    val dx = ev.rawX - downX
                    val dy = ev.rawY - downY
                    if (!dragging && abs(dx) > touchSlop && abs(dx) > abs(dy) * 1.15f) {
                        dragging = true
                        v.parent?.requestDisallowInterceptTouchEvent(true)
                    }
                    if (dragging) {
                        val tx = if (dx >= 0f) {
                            dx.coerceAtMost(totalGroupW)
                        } else {
                            -MergenSpringEngine.rubberband(-dx, dpF(activity, 52f), 0.45f)
                        }
                        drawerGroup.translationX = tx
                        val dimFrac = (1f - (tx.coerceAtLeast(0f) / dimDist)).coerceIn(0f, 1f)
                        overlay.setBackgroundColor(Color.argb((48 * dimFrac).roundToInt(), 0, 0, 0))
                        tracker?.computeCurrentVelocity(1000)
                        MergenMotionBlur.applyDragVelocityBlur(
                            drawerGroup,
                            tracker?.xVelocity ?: 0f,
                            0f,
                            maxBlurDp = 9f
                        )
                    }
                    true
                }
                MotionEvent.ACTION_UP, MotionEvent.ACTION_CANCEL -> {
                    v.parent?.requestDisallowInterceptTouchEvent(false)
                    tracker?.computeCurrentVelocity(1000)
                    val vx = tracker?.xVelocity ?: 0f
                    tracker?.recycle()
                    tracker = null
                    MergenMotionBlur.clear(drawerGroup)
                    val dx = ev.rawX - downX
                    val scale = MergenPrefs.getGestureThresholdScale(activity)
                    val projectedX = MergenSpringEngine.projectMomentum(drawerGroup.translationX, vx)
                    if (dragging) {
                        dragging = false
                        when {
                            vx > 700f || dx > dpF(activity, 40f) * scale || projectedX > panelW * 0.42f ->
                                closePeekToFeedWithVelocity(activity, animate = true, initialVelocityPxPerSec = vx)
                            vx < -700f || dx < -dpF(activity, 48f) * scale || projectedX < -dpF(activity, 70f) ->
                                expandToFullProfile(activity)
                            else -> MergenSpringEngine.springTranslationX(
                                view = drawerGroup,
                                targetX = 0f,
                                initialVelocityPxPerSec = vx,
                                dampingRatio = 0.86f,
                                responseSec = 0.26f,
                                maxBlurDp = 10f,
                                onUpdate = { curX ->
                                    val dimFrac = (1f - (curX.coerceAtLeast(0f) / dimDist)).coerceIn(0f, 1f)
                                    overlay.setBackgroundColor(Color.argb((48 * dimFrac).roundToInt(), 0, 0, 0))
                                }
                            )
                        }
                    } else if (ev.actionMasked == MotionEvent.ACTION_UP) {
                        closePeekToFeed(activity, animate = true)
                    }
                    true
                }
                else -> false
            }
        }
    }

    private fun removeOverlayDeferred(state: ActivityPeekState) {
        val overlay = state.overlayRoot ?: return
        state.overlayRoot = null
        state.drawerGroup = null
        removeViewDeferred(overlay)
    }

    private fun removeViewDeferred(view: View) {
        val parent = view.parent as? ViewGroup ?: return
        parent.post {
            if (view.parent === parent) {
                parent.removeView(view)
            }
        }
    }

    private fun removeOverlaySync(state: ActivityPeekState) {
        val overlay = state.overlayRoot ?: return
        state.overlayRoot = null
        state.drawerGroup = null
        (overlay.parent as? ViewGroup)?.removeView(overlay)
    }

    private fun trySmoothScrollToFullProfile(pager: ViewGroup): Boolean {
        return try {
            val m = pager.javaClass.getMethod(
                "setCurrentItem",
                Int::class.javaPrimitiveType,
                Boolean::class.javaPrimitiveType
            )
            m.invoke(pager, 1, true)
            true
        } catch (_: Throwable) {
            try {
                val m = pager.javaClass.getMethod("setCurrentItem", Int::class.javaPrimitiveType)
                m.invoke(pager, 1)
                true
            } catch (_: Throwable) {
                false
            }
        }
    }

    // ---- 1.3A Comments & Share Bottom Sheets (Dual Mergen / Kyant0 Theme) ----

    private fun attachDecorHierarchyObserverOnce(
        activity: Activity,
        decor: View,
        host: ViewGroup,
        state: ActivityPeekState
    ) {
        if (decor.getTag(TAG_SHEET_OBSERVER) != null) return
        decor.setTag(TAG_SHEET_OBSERVER, true)
        decor.viewTreeObserver.addOnGlobalLayoutListener {
            if (!activity.isFinishing && !activity.isDestroyed &&
                MergenPrefs.isModEffectivelyActive(activity) &&
                MergenPrefs.isPeekSheetsEnabled(activity) &&
                !TikTokViewResolver.isOwnProfileActive(activity, decor, state.tabContainer)
            ) {
                scheduleScanSheets(activity, decor, host, state)
            }
        }
    }

    private fun scheduleScanSheets(
        activity: Activity,
        decor: View,
        host: ViewGroup,
        state: ActivityPeekState
    ) {
        if (state.sheetScanScheduled) return
        state.sheetScanScheduled = true
        decor.post {
            state.sheetScanScheduled = false
            if (!activity.isFinishing && !activity.isDestroyed &&
                MergenPrefs.isModEffectivelyActive(activity) &&
                MergenPrefs.isPeekSheetsEnabled(activity) &&
                !TikTokViewResolver.isOwnProfileActive(activity, decor, state.tabContainer)
            ) {
                val screenH = activity.resources.displayMetrics.heightPixels
                val designSheetId = activity.resources.getIdentifier("design_bottom_sheet", "id", activity.packageName)
                scanForSheets(activity, decor, host, designSheetId, screenH, state.backdropSource, isRoot = true)
            }
        }
    }

    private fun scanForSheets(
        activity: Activity,
        view: View,
        host: ViewGroup,
        designSheetId: Int,
        screenH: Int,
        backdropSource: View?,
        isRoot: Boolean
    ) {
        if (view === host || view.getTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW) != null) return
        if (view !is ViewGroup || !view.isShown) return

        val isDesignSheet = designSheetId != 0 && view.id == designSheetId
        val isCoordinatorBottomSheet = !isRoot &&
            view.parent?.javaClass?.name?.contains("CoordinatorLayout", ignoreCase = true) == true &&
            view.height in (screenH * 0.25f).roundToInt()..(screenH * 0.94f).roundToInt() &&
            view.top > screenH * 0.12f
        val isDrawerContainer = !isRoot &&
            view.width >= activity.resources.displayMetrics.widthPixels * 0.9f &&
            view.top > screenH * 0.14f &&
            view.bottom >= screenH - dp(activity, 24f) &&
            view.height < screenH * 0.94f &&
            (view.javaClass.name.contains("Sheet", ignoreCase = true) ||
                view.javaClass.name.contains("Comment", ignoreCase = true) ||
                view.javaClass.name.contains("Share", ignoreCase = true))

        if (isDesignSheet || isCoordinatorBottomSheet || isDrawerContainer) {
            styleSheetDeferred(activity, view, backdropSource)
            return
        }

        for (i in 0 until view.childCount) {
            scanForSheets(activity, view.getChildAt(i), host, designSheetId, screenH, backdropSource, isRoot = false)
        }
    }

    private fun styleSheetDeferred(activity: Activity, sheet: ViewGroup, backdropSource: View?) {
        val wantedStyle = if (MergenPrefs.isKyant0Style(activity)) "kyant0" else "mergen"
        if (sheet.getTag(TAG_SHEET_STYLED) == wantedStyle) return
        sheet.setTag(TAG_SHEET_STYLED, wantedStyle)
        sheet.post {
            if (!sheet.isAttachedToWindow || activity.isFinishing || activity.isDestroyed) return@post
            val decor = activity.window?.decorView
            val state = peekStates[activity]
            if (!MergenPrefs.isModEffectivelyActive(activity) ||
                !MergenPrefs.isPeekSheetsEnabled(activity) ||
                (decor != null && TikTokViewResolver.isOwnProfileActive(activity, decor, state?.tabContainer))
            ) {
                return@post
            }

            if (sheet.getTag(TAG_SHEET_ORIG_BG) == null) {
                sheet.setTag(TAG_SHEET_ORIG_BG, sheet.background)
                sheet.setTag(TAG_SHEET_ORIG_OUTLINE, sheet.outlineProvider)
                sheet.setTag(TAG_SHEET_ORIG_CLIP, sheet.clipToOutline)
            }

            findSheetGlassLayer(sheet)?.let { old -> sheet.removeView(old) }

            val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
                Configuration.UI_MODE_NIGHT_YES
            val strokePx = dp(activity, 1f).coerceAtLeast(1)

            if (wantedStyle == "kyant0") {
                val r = dpF(activity, 26f)
                sheet.outlineProvider = object : ViewOutlineProvider() {
                    override fun getOutline(v: View, outline: Outline) {
                        outline.setRoundRect(0, 0, v.width, v.height + r.roundToInt(), r)
                    }
                }
                sheet.clipToOutline = true
                if (sheet is FrameLayout) {
                    val glassBackdrop = KyantGlassSurfaceView(
                        context = activity,
                        backdropSource = backdropSource,
                        cornerRadiusDp = 26f,
                        topCornersOnly = true,
                        blurRadiusDp = 10f,
                        refractionHeightDp = 20f,
                        refractionAmountDp = 20f
                    ).apply {
                        setTag(TAG_SHEET_GLASS_LAYER, true)
                        isClickable = false
                        isFocusable = false
                    }
                    sheet.background = ColorDrawable(Color.TRANSPARENT)
                    sheet.addView(
                        glassBackdrop,
                        0,
                        FrameLayout.LayoutParams(
                            ViewGroup.LayoutParams.MATCH_PARENT,
                            ViewGroup.LayoutParams.MATCH_PARENT
                        )
                    )
                } else {
                    val fill = if (isDark) Color.argb(200, 18, 20, 26) else Color.argb(218, 248, 249, 252)
                    sheet.background = GradientDrawable().apply {
                        shape = GradientDrawable.RECTANGLE
                        cornerRadii = floatArrayOf(r, r, r, r, 0f, 0f, 0f, 0f)
                        setColor(fill)
                        setStroke(strokePx, Color.argb(72, 255, 255, 255))
                    }
                }
            } else {
                val fill = if (isDark) Color.argb(246, 10, 10, 10) else Color.argb(246, 255, 255, 255)
                val border = if (isDark) MergenDesign.OBSIDIAN_BORDER else MergenDesign.PAPER_BORDER
                sheet.outlineProvider = ViewOutlineProvider.BACKGROUND
                sheet.clipToOutline = true
                sheet.background = MergenDesign.topRuleSheetBg(fill, border, strokePx)
            }

            for (i in 0 until sheet.childCount) {
                val child = sheet.getChildAt(i)
                if (child.getTag(TAG_SHEET_GLASS_LAYER) == true) continue
                if (child.background is ColorDrawable && child.getTag(TAG_SHEET_CHILD_ORIG_BG) == null) {
                    child.setTag(TAG_SHEET_CHILD_ORIG_BG, child.background)
                    child.setBackgroundColor(Color.TRANSPARENT)
                }
            }
        }
    }

    private fun findSheetGlassLayer(sheet: ViewGroup): View? {
        for (i in 0 until sheet.childCount) {
            val c = sheet.getChildAt(i)
            if (c.getTag(TAG_SHEET_GLASS_LAYER) == true) return c
        }
        return null
    }

    private fun scheduleRestoreAllSheets(decor: View) {
        decor.post {
            restoreAllSheets(decor)
        }
    }

    private fun restoreAllSheets(view: View) {
        if (view.getTag(TAG_SHEET_STYLED) != null) {
            view.setTag(TAG_SHEET_STYLED, null)
            view.background = view.getTag(TAG_SHEET_ORIG_BG) as? Drawable
            view.setTag(TAG_SHEET_ORIG_BG, null)
            view.outlineProvider = (view.getTag(TAG_SHEET_ORIG_OUTLINE) as? ViewOutlineProvider)
                ?: ViewOutlineProvider.BACKGROUND
            view.setTag(TAG_SHEET_ORIG_OUTLINE, null)
            view.clipToOutline = (view.getTag(TAG_SHEET_ORIG_CLIP) as? Boolean) ?: false
            view.setTag(TAG_SHEET_ORIG_CLIP, null)
            if (view is ViewGroup) {
                findSheetGlassLayer(view)?.let { glass ->
                    view.removeView(glass)
                }
                for (i in 0 until view.childCount) {
                    val child = view.getChildAt(i)
                    val childOrig = child.getTag(TAG_SHEET_CHILD_ORIG_BG) as? Drawable
                    if (childOrig != null) {
                        child.background = childOrig
                        child.setTag(TAG_SHEET_CHILD_ORIG_BG, null)
                    }
                }
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                restoreAllSheets(view.getChildAt(i))
            }
        }
    }
}
