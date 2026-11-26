package com.sarp.tiktokliquidglass

import android.app.Activity
import android.content.Intent
import android.content.res.Configuration
import android.graphics.Color
import android.graphics.Typeface
import android.graphics.drawable.Drawable
import android.graphics.drawable.GradientDrawable
import android.os.Build
import android.util.Log
import android.util.TypedValue
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.ViewOutlineProvider
import android.view.ViewTreeObserver
import android.view.WindowInsets
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.LinearLayout
import android.widget.Toast
import android.widget.TextView
import java.util.WeakHashMap
import kotlin.math.max
import kotlin.math.roundToInt

/**
 * Pure Android View controller for MergenV1.
 * Coordinates Seçenek B auth-gating via MergenPrefs, attaches/tears down Kyant0's LiquidGlassBarView
 * via version-resilient TikTokViewResolver, and exposes TT You + MergenV1 buttons in settings.
 */
object LiquidGlassController {

    private const val TAG = "TikTokLiquidGlass"
    private const val TAG_CH_CNC = 0x53415251
    private const val TAG_CH_CH4 = 0x53415252
    private const val TAG_ZUF_ORIG_PAD = 0x53415253
    private const val TAG_SRC_LAYOUT = 0x53415254
    private const val TAG_PLAYER_LISTENER = 0x53415255
    private const val TAG_FOCUS_LISTENER = 0x53415256
    private const val TAG_GSL_LISTENER = 0x53415257
    private const val TAG_SETTINGS_ROW = 0x53415258
    private const val TAG_FULLSCREEN_GUARD = 0x53415259
    private const val TAG_ORIG_VISIBILITY = 0x53415261
    private const val TAG_SEEKBAR_ORIG_TY = 0x53415262
    private const val TAG_ZUF_GUARD = 0x53415263
    private const val TAG_TAB_BG_GUARD = 0x53415264
    private const val TAG_MASK_GUARD = 0x53415265
    private const val TAG_SRC_PREDRAW = 0x53415266

    private data class OriginalTabState(
        val width: Int,
        val height: Int,
        val leftMargin: Int,
        val topMargin: Int,
        val rightMargin: Int,
        val bottomMargin: Int,
        val frameGravity: Int,
        val padL: Int,
        val padT: Int,
        val padR: Int,
        val padB: Int,
        val background: Drawable?,
        val elevation: Float,
        val outlineProvider: ViewOutlineProvider?,
        val clipToOutline: Boolean,
        val linearGravity: Int,
        val barParentClipChildren: Boolean,
        val barParentClipPadding: Boolean,
        val hostClipChildren: Boolean,
        val hostClipPadding: Boolean,
        val hadSavedChromeState: Boolean = true
    )

    private data class OriginalChromeViewState(
        val visibility: Int,
        val alpha: Float,
        val background: Drawable?
    )

    private data class OriginalPaddingState(
        val padBottom: Int,
        val marginBottom: Int,
        val lpHeight: Int
    )

    private val attachedParents = WeakHashMap<ViewGroup, LiquidGlassBarView>()
    private val activityToGlassBar = WeakHashMap<Activity, LiquidGlassBarView>()
    private val originalTabStates = WeakHashMap<ViewGroup, OriginalTabState>()
    private val originalChromeStates = WeakHashMap<View, OriginalChromeViewState>()
    private val originalPaddingStates = WeakHashMap<View, OriginalPaddingState>()
    private val trackedActivities = WeakHashMap<Activity, Boolean>()
    private val settingsDots = WeakHashMap<Activity, View>()
    private val loggedPlayers = WeakHashMap<View, Boolean>()

    fun registerActivity(activity: Activity) {
        trackedActivities[activity] = true
    }

    fun unregisterActivity(activity: Activity) {
        trackedActivities.remove(activity)
        settingsDots.remove(activity)
        activityToGlassBar.remove(activity)
        DynamicPillController.detach(activity)
        QuickControlSheetController.detach(activity)
        PeekSheetAndProfileController.detach(activity)
        RadialMenuController.detach(activity)
        KineticMediaOverlayController.detach(activity)
        VideoTransitionController.detach(activity)
        DanmakuController.detach(activity)
    }

    fun getAttachedGlassBar(activity: Activity): LiquidGlassBarView? =
        activityToGlassBar[activity]

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        val decor = activity.window?.decorView ?: return
        val applyPass = {
            if (!activity.isFinishing && !activity.isDestroyed &&
                MergenPrefs.isModEffectivelyActive(activity) &&
                MergenPrefs.isLiquidGlassBarEnabled(activity)
            ) {
                val host = TikTokViewResolver.findFragmentTabHost(decor)
                val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
                val barParent = tabContainer?.parent as? ViewGroup
                if (host != null && tabContainer != null && barParent != null) {
                    val backdropSrc = TikTokViewResolver.findBackdropSource(activity, barParent, tabContainer)
                    tabContainer.background = null
                    suppressChromeViews(activity, decor, host, tabContainer)
                    enforceEdgeToEdgeFullHeight(activity, host, barParent, backdropSrc)
                    ensureNonFeedEdgeToEdgeAndClearance(activity, decor, barParent, tabContainer, backdropSrc, tabIndex)
                    attachedParents[barParent]?.invalidate()
                }
            }
        }
        decor.post(applyPass)
        decor.postDelayed(applyPass, 140L)
        decor.postDelayed(applyPass, 420L)
    }

    fun refreshAllTrackedActivities() {
        val snapshot = trackedActivities.keys.toList()
        for (act in snapshot) {
            if (!act.isFinishing && !act.isDestroyed) {
                act.runOnUiThread {
                    if (!act.isFinishing && !act.isDestroyed) {
                        schedulePatch(act)
                    }
                }
            }
        }
    }

    fun attachFocusListenerOnce(activity: Activity) {
        val decor = activity.window?.decorView ?: return
        if (decor.getTag(TAG_FOCUS_LISTENER) == null) {
            decor.setTag(TAG_FOCUS_LISTENER, true)
            decor.viewTreeObserver.addOnWindowFocusChangeListener { hasFocus ->
                if (hasFocus) {
                    schedulePatch(activity)
                }
            }
        }
    }

    fun schedulePatch(activity: Activity) {
        val decor = activity.window?.decorView ?: return
        decor.post { applyLiquidGlass(activity, decor) }
        decor.postDelayed({ applyLiquidGlass(activity, decor) }, 350L)
        decor.postDelayed({ applyLiquidGlass(activity, decor) }, 1200L)
    }

    fun applyLiquidGlass(activity: Activity, decor: View) {
        try {
            if (TikTokViewResolver.isSettingsActivity(activity)) {
                attachSettingsHeaderButtons(activity, decor)
                return
            }

            val host = TikTokViewResolver.findFragmentTabHost(decor) ?: return
            val tabContainer = TikTokViewResolver.findTabContainer(activity, host) ?: return
            val barParent = tabContainer.parent as? ViewGroup ?: return
            val backdropSrc = TikTokViewResolver.findBackdropSource(activity, barParent, tabContainer)

            val modActive = MergenPrefs.isModEffectivelyActive(activity)
            syncFaz1Controllers(activity, host, tabContainer, decor, backdropSrc, modActive)

            // Enforce Seçenek B + master/bar toggles
            val barShouldBeActive = modActive && MergenPrefs.isLiquidGlassBarEnabled(activity)

            if (!barShouldBeActive) {
                restoreOriginalUiIfAttached(activity, decor, host, tabContainer, barParent)
                return
            }

            val existing = attachedParents[barParent]
            if (existing != null) {
                activityToGlassBar[activity] = existing
                existing.syncSelectedTabFromHierarchy(snap = false)
                if (!MergenPrefs.isMorphingBarEnabled(activity) && existing.isMorphed()) {
                    existing.setMorphed(false)
                }
                existing.invalidate()
                existing.lensOverlay.invalidate()
                if (tabContainer.background != null) {
                    tabContainer.background = null
                }
                suppressChromeViews(activity, decor, host, tabContainer)
                enforceEdgeToEdgeFullHeight(activity, host, barParent, backdropSrc)
                applyFullScreenAndCaptionFix(activity, barParent, tabContainer, backdropSrc)
                val activeTab = TikTokViewResolver.getActiveTabIndex(host, tabContainer)
                ensureNonFeedEdgeToEdgeAndClearance(activity, decor, barParent, tabContainer, backdropSrc, activeTab)
                inspectPlayerSurface(activity, decor)
                return
            }

            val backdropSource = backdropSrc ?: return

            Log.i(
                TAG,
                "Attaching MergenV1 LiquidGlass to barParent=${barParent.javaClass.name}, tabs=${tabContainer.javaClass.name}, src=${backdropSource.javaClass.name}"
            )

            captureOriginalTabStateOnce(host, barParent, tabContainer)

            // Allow floating pill shadow & magnified jelly lens to expand outside bounds
            barParent.clipChildren = false
            barParent.clipToPadding = false
            host.clipChildren = false
            host.clipToPadding = false
            (host.parent as? ViewGroup)?.let {
                it.clipChildren = false
                it.clipToPadding = false
            }

            // Make navigation bar transparent, disable contrast scrim, and extend content edge-to-edge
            activity.window?.let { win ->
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    win.setDecorFitsSystemWindows(false)
                }
                @Suppress("DEPRECATION")
                win.navigationBarColor = Color.TRANSPARENT
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
                    win.isNavigationBarContrastEnforced = false
                }
            }

            suppressChromeViews(activity, decor, host, tabContainer)
            enforceEdgeToEdgeFullHeight(activity, host, barParent, backdropSource)
            styleTabContainerAsFloatingPill(activity, decor, tabContainer)

            val glassBar = LiquidGlassBarView(activity, backdropSource, tabContainer)
            val lensOverlay = glassBar.lensOverlay

            val tabIdx = barParent.indexOfChild(tabContainer).coerceAtLeast(0)
            barParent.addView(
                glassBar,
                tabIdx,
                FrameLayout.LayoutParams(0, 0, Gravity.TOP or Gravity.START)
            )
            barParent.addView(
                lensOverlay,
                (tabIdx + 2).coerceAtMost(barParent.childCount),
                FrameLayout.LayoutParams(0, 0, Gravity.TOP or Gravity.START)
            )

            attachedParents[barParent] = glassBar
            activityToGlassBar[activity] = glassBar

            val syncBounds = {
                if (attachedParents[barParent] === glassBar && tabContainer.width > 0 && tabContainer.height > 0) {
                    val outset = glassBar.outsetPx
                    val targetW = tabContainer.width + outset * 2
                    val targetH = tabContainer.height + outset * 2
                    val targetL = tabContainer.left - outset
                    val targetT = tabContainer.top - outset
                    updateOverlayLayout(glassBar, targetW, targetH, targetL, targetT)
                    updateOverlayLayout(lensOverlay, targetW, targetH, targetL, targetT)
                }
            }

            tabContainer.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                if (attachedParents[barParent] === glassBar) {
                    tabContainer.post(syncBounds)
                }
            }
            tabContainer.post(syncBounds)

            applyFullScreenAndCaptionFix(activity, barParent, tabContainer, backdropSource)
            ensureNonFeedEdgeToEdgeAndClearance(
                activity,
                decor,
                barParent,
                tabContainer,
                backdropSource,
                TikTokViewResolver.getActiveTabIndex(host, tabContainer)
            )
            if (backdropSource.getTag(TAG_SRC_PREDRAW) == null) {
                backdropSource.setTag(TAG_SRC_PREDRAW, true)
                var lastCancelNanos = 0L
                backdropSource.viewTreeObserver.addOnPreDrawListener(object : ViewTreeObserver.OnPreDrawListener {
                    override fun onPreDraw(): Boolean {
                        if (!activity.isFinishing && !activity.isDestroyed &&
                            MergenPrefs.isModEffectivelyActive(activity) &&
                            MergenPrefs.isLiquidGlassBarEnabled(activity)
                        ) {
                            val changed = syncMasksAndZufBeforeDraw(activity, barParent, tabContainer, backdropSource)
                            if (changed) {
                                val now = System.nanoTime()
                                if (now - lastCancelNanos > 25_000_000L) {
                                    lastCancelNanos = now
                                    return false
                                }
                            }
                        }
                        return true
                    }
                })
            }
            if (backdropSource.getTag(TAG_SRC_LAYOUT) == null) {
                backdropSource.setTag(TAG_SRC_LAYOUT, true)
                var pendingCaptionFix = false
                backdropSource.viewTreeObserver.addOnGlobalLayoutListener {
                    if (!pendingCaptionFix &&
                        MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity)
                    ) {
                        pendingCaptionFix = true
                        backdropSource.post {
                            pendingCaptionFix = false
                            if (!activity.isFinishing && !activity.isDestroyed &&
                                MergenPrefs.isModEffectivelyActive(activity) &&
                                MergenPrefs.isLiquidGlassBarEnabled(activity)
                            ) {
                                applyFullScreenAndCaptionFix(activity, barParent, tabContainer, backdropSource)
                            }
                        }
                    }
                }
            }

            inspectPlayerSurface(activity, decor)
        } catch (t: Throwable) {
            Log.e(TAG, "applyLiquidGlass error", t)
        }
    }

    private fun syncFaz1Controllers(
        activity: Activity,
        host: ViewGroup,
        tabContainer: ViewGroup,
        decor: View,
        backdropSource: View?,
        modActive: Boolean
    ) {
        if (modActive) {
            MergenWindowCallback.attachOnce(activity)
            if (MergenPrefs.isDynamicPillEnabled(activity)) {
                DynamicPillController.attach(activity, tabContainer, backdropSource)
                DynamicPillController.sync(activity, backdropSource)
            } else {
                DynamicPillController.detach(activity)
            }
            QuickControlSheetController.sync(activity, backdropSource)
            PeekSheetAndProfileController.sync(activity, host, decor, tabContainer, backdropSource)
            if (!MergenPrefs.isRadialMenuEnabled(activity)) {
                RadialMenuController.dismiss(activity, animate = false)
            }
            KineticMediaOverlayController.sync(activity, backdropSource)
            VideoTransitionController.sync(activity, decor)
            DanmakuController.sync(activity)
        } else {
            DynamicPillController.detach(activity)
            QuickControlSheetController.detach(activity)
            PeekSheetAndProfileController.detach(activity)
            RadialMenuController.detach(activity)
            KineticMediaOverlayController.detach(activity)
            VideoTransitionController.detach(activity)
            DanmakuController.detach(activity)
        }
    }

    private fun captureOriginalTabStateOnce(
        host: ViewGroup,
        barParent: ViewGroup,
        tabContainer: ViewGroup
    ) {
        if (originalTabStates.containsKey(tabContainer)) return
        val lp = tabContainer.layoutParams as? ViewGroup.MarginLayoutParams
        val flp = lp as? FrameLayout.LayoutParams
        val ll = tabContainer as? LinearLayout
        originalTabStates[tabContainer] = OriginalTabState(
            width = lp?.width ?: ViewGroup.LayoutParams.MATCH_PARENT,
            height = lp?.height ?: ViewGroup.LayoutParams.WRAP_CONTENT,
            leftMargin = lp?.leftMargin ?: 0,
            topMargin = lp?.topMargin ?: 0,
            rightMargin = lp?.rightMargin ?: 0,
            bottomMargin = lp?.bottomMargin ?: 0,
            frameGravity = flp?.gravity ?: Gravity.NO_GRAVITY,
            padL = tabContainer.paddingLeft,
            padT = tabContainer.paddingTop,
            padR = tabContainer.paddingRight,
            padB = tabContainer.paddingBottom,
            background = tabContainer.background,
            elevation = tabContainer.elevation,
            outlineProvider = tabContainer.outlineProvider,
            clipToOutline = tabContainer.clipToOutline,
            linearGravity = ll?.gravity ?: Gravity.NO_GRAVITY,
            barParentClipChildren = barParent.clipChildren,
            barParentClipPadding = barParent.clipToPadding,
            hostClipChildren = host.clipChildren,
            hostClipPadding = host.clipToPadding
        )
    }

    private fun restoreOriginalUiIfAttached(
        activity: Activity,
        decor: View,
        host: ViewGroup,
        tabContainer: ViewGroup,
        barParent: ViewGroup
    ) {
        activityToGlassBar.remove(activity)
        val glassBar = attachedParents.remove(barParent) ?: return
        Log.i(TAG, "Restoring stock TikTok UI (MergenV1 gated or disabled)")

        try {
            glassBar.detachFromTabContainer()
            barParent.removeView(glassBar.lensOverlay)
            barParent.removeView(glassBar)
        } catch (_: Throwable) {
        }

        originalTabStates.remove(tabContainer)?.let { orig ->
            (tabContainer.layoutParams as? ViewGroup.MarginLayoutParams)?.let { lp ->
                lp.width = orig.width
                lp.height = orig.height
                lp.leftMargin = orig.leftMargin
                lp.topMargin = orig.topMargin
                lp.rightMargin = orig.rightMargin
                lp.bottomMargin = orig.bottomMargin
                if (lp is FrameLayout.LayoutParams) {
                    lp.gravity = orig.frameGravity
                }
                tabContainer.layoutParams = lp
            }
            tabContainer.setPadding(orig.padL, orig.padT, orig.padR, orig.padB)
            tabContainer.background = orig.background
            tabContainer.elevation = orig.elevation
            tabContainer.outlineProvider = orig.outlineProvider ?: ViewOutlineProvider.BACKGROUND
            tabContainer.clipToOutline = orig.clipToOutline
            (tabContainer as? LinearLayout)?.gravity = orig.linearGravity
            barParent.clipChildren = orig.barParentClipChildren
            barParent.clipToPadding = orig.barParentClipPadding
            host.clipChildren = orig.hostClipChildren
            host.clipToPadding = orig.hostClipPadding
        }

        // Restore chrome views
        restoreChromeView(TikTokViewResolver.findBottomSpacer(activity, host))
        restoreChromeView(TikTokViewResolver.findBottomChromeBg(activity, host, tabContainer))
        restoreChromeView(TikTokViewResolver.findBottomDivider(activity, host))
        restoreChromeView(TikTokViewResolver.findNavBarStrip(activity, decor))
        decor.findViewById<View>(android.R.id.navigationBarBackground)?.let { navBg ->
            navBg.alpha = 1f
        }

        // Restore seek bar translationY
        TikTokViewResolver.findVideoSeekBar(activity, barParent)?.let { seekBar ->
            val origTy = seekBar.getTag(TAG_SEEKBAR_ORIG_TY) as? Float
            seekBar.translationY = origTy ?: 0f
        }

        // Restore host/barParent/backdropSource paddings & feed children
        val backdropSource = TikTokViewResolver.findBackdropSource(activity, barParent, tabContainer)
        restorePaddingView(host)
        restorePaddingView(barParent)
        restorePaddingView(backdropSource)
        var p: View? = host.parent as? View
        val contentId = android.R.id.content
        while (p != null) {
            restorePaddingView(p)
            if (p.id == contentId) break
            p = p.parent as? View
        }

        if (backdropSource != null) {
            restoreFeedTree(activity, backdropSource, barParent.height)
            TikTokViewResolver.restoreBottomClearanceFromScrollables(backdropSource)
        }

        host.requestLayout()
        barParent.requestLayout()
    }

    private fun restoreChromeView(view: View?) {
        if (view == null) return
        originalChromeStates.remove(view)?.let { orig ->
            view.visibility = orig.visibility
            view.alpha = orig.alpha
            view.background = orig.background
        }
    }

    private fun restorePaddingView(view: View?) {
        if (view == null) return
        originalPaddingStates.remove(view)?.let { orig ->
            view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, orig.padBottom)
            (view.layoutParams as? ViewGroup.MarginLayoutParams)?.let { lp ->
                lp.bottomMargin = orig.marginBottom
                lp.height = orig.lpHeight
                view.layoutParams = lp
            }
        }
    }

    private fun restoreFeedTree(activity: Activity, view: View, hostHeight: Int) {
        val res = activity.resources
        val pkg = activity.packageName
        val zufId = res.getIdentifier("zuf", "id", pkg)
        val widgetContainerId = res.getIdentifier("widget_container", "id", pkg)
        val playerViewId = res.getIdentifier("player_view", "id", pkg)
        val rohId = res.getIdentifier("roh", "id", pkg)
        val maskIds = intArrayOf(
            res.getIdentifier("dus", "id", pkg),
            res.getIdentifier("duc", "id", pkg),
            res.getIdentifier("xi8", "id", pkg),
            res.getIdentifier("xi7", "id", pkg)
        )
        walkRestoreFeedTree(
            activity = activity,
            view = view,
            zufId = zufId,
            widgetContainerId = widgetContainerId,
            playerViewId = playerViewId,
            rohId = rohId,
            maskIds = maskIds,
            hostHeight = hostHeight,
            insideInteract = false
        )
    }

    private fun walkRestoreFeedTree(
        activity: Activity,
        view: View,
        zufId: Int,
        widgetContainerId: Int,
        playerViewId: Int,
        rohId: Int,
        maskIds: IntArray,
        hostHeight: Int,
        insideInteract: Boolean
    ) {
        var nextInsideInteract = insideInteract
        if (TikTokViewResolver.isWidgetContainer(activity, view, widgetContainerId)) {
            FeedSearchPillHelper.restoreForWidgetContainer(activity, view as ViewGroup)
        }
        if (TikTokViewResolver.isFeedChromeMask(view, maskIds)) {
            val origVis = view.getTag(TAG_ORIG_VISIBILITY) as? Int
            if (origVis != null) {
                view.visibility = origVis
            }
        } else if (!insideInteract && TikTokViewResolver.isFeedInteractContainer(view, zufId, hostHeight)) {
            nextInsideInteract = true
            val origPad = view.getTag(TAG_ZUF_ORIG_PAD) as? Int
            if (origPad != null && view.paddingBottom != origPad) {
                view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, origPad)
            }
        } else if (TikTokViewResolver.isPlayerContainer(activity, view, playerViewId, rohId)) {
            if (view is ViewGroup) {
                for (i in 0 until view.childCount) {
                    val c = view.getChildAt(i)
                    if (c.scaleX != 1f || c.scaleY != 1f) {
                        c.scaleX = 1f
                        c.scaleY = 1f
                    }
                }
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                walkRestoreFeedTree(
                    activity,
                    view.getChildAt(i),
                    zufId,
                    widgetContainerId,
                    playerViewId,
                    rohId,
                    maskIds,
                    hostHeight,
                    nextInsideInteract
                )
            }
        }
    }

    private fun updateOverlayLayout(view: View, w: Int, h: Int, left: Int, top: Int) {
        val lp = view.layoutParams as? FrameLayout.LayoutParams ?: return
        if (lp.width != w || lp.height != h || lp.leftMargin != left || lp.topMargin != top) {
            lp.width = w
            lp.height = h
            lp.leftMargin = left
            lp.topMargin = top
            lp.gravity = Gravity.TOP or Gravity.START
            view.layoutParams = lp
        }
    }

    private fun attachSettingsHeaderButtons(activity: Activity, decor: View) {
        val content = activity.findViewById<ViewGroup>(android.R.id.content) ?: return
        val statusTop = TikTokViewResolver.statusBarTopInset(activity, decor)
        val desiredTop = statusTop + dp(activity, 8f).roundToInt()

        val existingRow = content.getTag(TAG_SETTINGS_ROW) as? LinearLayout
        if (existingRow != null) {
            val lp = existingRow.layoutParams as? FrameLayout.LayoutParams
            if (lp != null && lp.topMargin != desiredTop) {
                lp.topMargin = desiredTop
                existingRow.layoutParams = lp
            }
            updateSettingsDotState(activity)
            return
        }

        val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
            Configuration.UI_MODE_NIGHT_YES
        val kyant0 = MergenPrefs.isKyant0Style(activity)

        val pillFill = when {
            kyant0 && isDark -> Color.argb(215, 28, 30, 36)
            kyant0 -> Color.argb(235, 250, 250, 253)
            isDark -> MergenDesign.OBSIDIAN_BG
            else -> MergenDesign.PAPER_BG
        }
        val pillStroke = when {
            kyant0 && isDark -> Color.argb(80, 255, 255, 255)
            kyant0 -> Color.argb(56, 0, 0, 0)
            isDark -> MergenDesign.OBSIDIAN_BORDER
            else -> MergenDesign.PAPER_BORDER
        }
        val textInk = if (isDark) MergenDesign.OBSIDIAN_INK else MergenDesign.PAPER_INK

        val row = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
        }

        val hPad = dp(activity, 9f).roundToInt()
        val vPad = dp(activity, 5f).roundToInt()
        val strokePx = dp(activity, 1f).roundToInt().coerceAtLeast(1)

        fun makeHeaderBg() = if (kyant0) {
            GradientDrawable().apply {
                shape = GradientDrawable.RECTANGLE
                cornerRadius = dp(activity, 16f)
                setColor(pillFill)
                setStroke(strokePx, pillStroke)
            }
        } else {
            MergenDesign.sharpBox(pillFill, pillStroke, strokePx)
        }

        // 1. Optional compact TikTok You button
        if (TikTokViewResolver.isTikTokYouAvailable(activity)) {
            val ttBg = makeHeaderBg()
            val ttBtn = LinearLayout(activity).apply {
                orientation = LinearLayout.HORIZONTAL
                gravity = Gravity.CENTER_VERTICAL
                background = ttBg
                elevation = dp(activity, 3f)
                setPadding(hPad, vPad, hPad, vPad)
                isClickable = true
                isFocusable = true
            }

            val iconId = activity.resources.getIdentifier("ttmod_settings_icon", "drawable", activity.packageName)
            if (iconId != 0) {
                val iconSize = dp(activity, 14f).roundToInt()
                val iconView = ImageView(activity).apply {
                    setImageResource(iconId)
                    scaleType = ImageView.ScaleType.FIT_CENTER
                }
                ttBtn.addView(
                    iconView,
                    LinearLayout.LayoutParams(iconSize, iconSize).apply {
                        rightMargin = dp(activity, 5f).roundToInt()
                    }
                )
            }

            ttBtn.addView(TextView(activity).apply {
                text = "TT YOU"
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
                typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
                setTextColor(textInk)
            })

            ttBtn.setOnClickListener {
                MergenHaptics.playTap(activity)
                try {
                    val intent = Intent().setClassName(activity.packageName, "Z.sf")
                    activity.startActivity(intent)
                } catch (t: Throwable) {
                    Log.e(TAG, "Failed to open TikTok You settings (Z.sf)", t)
                    Toast.makeText(
                        activity,
                        MergenStrings.t(activity, "TikTok You ayarları açılamadı", "Failed to open TikTok You settings"),
                        Toast.LENGTH_SHORT
                    ).show()
                }
            }
            MergenSpringEngine.attachSpringPress(ttBtn, pressedScale = 0.94f)

            row.addView(
                ttBtn,
                LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.WRAP_CONTENT,
                    ViewGroup.LayoutParams.WRAP_CONTENT
                ).apply {
                    rightMargin = dp(activity, 6f).roundToInt()
                }
            )
        }

        // 2. Compact MergenV1 button
        val mvBg = makeHeaderBg()
        val mvBtn = LinearLayout(activity).apply {
            orientation = LinearLayout.HORIZONTAL
            gravity = Gravity.CENTER_VERTICAL
            background = mvBg
            elevation = dp(activity, 3f)
            setPadding(hPad, vPad, hPad, vPad)
            isClickable = true
            isFocusable = true
        }

        val reticleSize = dp(activity, 13f).roundToInt()
        mvBtn.addView(
            MergenReticleView(activity, textInk),
            LinearLayout.LayoutParams(reticleSize, reticleSize).apply {
                rightMargin = dp(activity, 5f).roundToInt()
            }
        )

        mvBtn.addView(TextView(activity).apply {
            text = "MERGENV1"
            setTextSize(TypedValue.COMPLEX_UNIT_SP, 10.5f)
            typeface = if (kyant0) Typeface.create("sans-serif-medium", Typeface.BOLD) else Typeface.create(Typeface.MONOSPACE, Typeface.BOLD)
            setTextColor(textInk)
        })

        val dotSize = dp(activity, 6f).roundToInt()
        val dotView = View(activity).apply {
            background = if (kyant0) {
                GradientDrawable().apply {
                    shape = GradientDrawable.OVAL
                    setColor(currentDotColor(activity))
                }
            } else {
                MergenDesign.sharpBox(currentDotColor(activity))
            }
        }
        settingsDots[activity] = dotView
        mvBtn.addView(
            dotView,
            LinearLayout.LayoutParams(dotSize, dotSize).apply {
                leftMargin = dp(activity, 5f).roundToInt()
            }
        )

        MergenSpringEngine.attachSpringPress(mvBtn, pressedScale = 0.94f)
        mvBtn.setOnClickListener {
            MergenHaptics.playTap(activity)
            if (!MergenPrefs.hasSeenWelcome(activity)) {
                MergenWelcomeDialog.show(
                    activity = activity,
                    onContinue = {
                        updateSettingsDotState(activity)
                        MergenSettingsDialog.show(activity)
                    },
                    onOptionalLogin = {
                        MergenCoreLoginDialog.show(activity) {
                            updateSettingsDotState(activity)
                            MergenSettingsDialog.show(activity)
                        }
                    }
                )
            } else {
                MergenSettingsDialog.show(activity)
            }
        }

        row.addView(mvBtn)

        val rowLp = FrameLayout.LayoutParams(
            ViewGroup.LayoutParams.WRAP_CONTENT,
            ViewGroup.LayoutParams.WRAP_CONTENT,
            Gravity.TOP or Gravity.END
        ).apply {
            topMargin = desiredTop
            rightMargin = dp(activity, 12f).roundToInt()
        }
        content.setTag(TAG_SETTINGS_ROW, row)
        content.addView(row, rowLp)
        Log.i(TAG, "Added compact settings header buttons to SettingContainerActivity")
    }

    private fun updateSettingsDotState(activity: Activity) {
        val dot = settingsDots[activity] ?: return
        val kyant0 = MergenPrefs.isKyant0Style(activity)
        dot.background = if (kyant0) {
            GradientDrawable().apply {
                shape = GradientDrawable.OVAL
                setColor(currentDotColor(activity))
            }
        } else {
            MergenDesign.sharpBox(currentDotColor(activity))
        }
    }

    private fun currentDotColor(activity: Activity): Int = when {
        MergenPrefs.isMasterEnabled(activity) -> {
            val isDark = (activity.resources.configuration.uiMode and Configuration.UI_MODE_NIGHT_MASK) ==
                Configuration.UI_MODE_NIGHT_YES
            if (isDark) Color.WHITE else Color.BLACK
        }
        else -> Color.parseColor("#888888")
    }

    private fun enforceEdgeToEdgeFullHeight(
        activity: Activity,
        host: ViewGroup,
        barParent: ViewGroup,
        backdropSource: View?
    ) {
        val savePadOnce = { v: View ->
            if (!originalPaddingStates.containsKey(v)) {
                val mlp = v.layoutParams as? ViewGroup.MarginLayoutParams
                originalPaddingStates[v] = OriginalPaddingState(
                    padBottom = v.paddingBottom,
                    marginBottom = mlp?.bottomMargin ?: 0,
                    lpHeight = mlp?.height ?: ViewGroup.LayoutParams.MATCH_PARENT
                )
            }
        }

        val clearBottom = {
            if (MergenPrefs.isModEffectivelyActive(activity) && MergenPrefs.isLiquidGlassBarEnabled(activity)) {
                savePadOnce(host)
                savePadOnce(barParent)
                if (host.paddingBottom != 0) {
                    host.setPadding(host.paddingLeft, host.paddingTop, host.paddingRight, 0)
                }
                if (barParent.paddingBottom != 0) {
                    barParent.setPadding(barParent.paddingLeft, barParent.paddingTop, barParent.paddingRight, 0)
                }
                (barParent.layoutParams as? ViewGroup.MarginLayoutParams)?.let { lp ->
                    if (lp.bottomMargin != 0 || lp.height != ViewGroup.LayoutParams.MATCH_PARENT) {
                        lp.bottomMargin = 0
                        lp.height = ViewGroup.LayoutParams.MATCH_PARENT
                        barParent.post { barParent.layoutParams = lp }
                    }
                }
                if (backdropSource != null) {
                    savePadOnce(backdropSource)
                    if (backdropSource.paddingBottom != 0) {
                        backdropSource.setPadding(
                            backdropSource.paddingLeft,
                            backdropSource.paddingTop,
                            backdropSource.paddingRight,
                            0
                        )
                    }
                    (backdropSource.layoutParams as? ViewGroup.MarginLayoutParams)?.let { lp ->
                        if (lp.bottomMargin != 0 || lp.height != ViewGroup.LayoutParams.MATCH_PARENT) {
                            lp.bottomMargin = 0
                            lp.height = ViewGroup.LayoutParams.MATCH_PARENT
                            backdropSource.post { backdropSource.layoutParams = lp }
                        }
                    }
                }
            }
        }

        clearBottom()

        if (host.getTag(TAG_FULLSCREEN_GUARD) == null) {
            host.setTag(TAG_FULLSCREEN_GUARD, true)
            host.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                if (MergenPrefs.isModEffectivelyActive(activity) &&
                    MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                    host.paddingBottom != 0
                ) {
                    host.setPadding(host.paddingLeft, host.paddingTop, host.paddingRight, 0)
                }
            }
        }
        if (barParent.getTag(TAG_FULLSCREEN_GUARD) == null) {
            barParent.setTag(TAG_FULLSCREEN_GUARD, true)
            barParent.addOnLayoutChangeListener { _, _, _, _, _, _, _, _, _ ->
                if (MergenPrefs.isModEffectivelyActive(activity) &&
                    MergenPrefs.isLiquidGlassBarEnabled(activity)
                ) {
                    val lp = barParent.layoutParams as? ViewGroup.MarginLayoutParams
                    if (barParent.paddingBottom != 0 || (lp != null && lp.bottomMargin != 0)) {
                        clearBottom()
                    }
                }
            }
        }

        var p: View? = host.parent as? View
        val contentId = android.R.id.content
        while (p != null) {
            savePadOnce(p)
            if (p.paddingBottom != 0) {
                p.setPadding(p.paddingLeft, p.paddingTop, p.paddingRight, 0)
            }
            if (p.id == contentId) break
            p = p.parent as? View
        }
    }

    private fun styleTabContainerAsFloatingPill(
        activity: Activity,
        decor: View,
        tabContainer: ViewGroup
    ) {
        val navInset = TikTokViewResolver.navBarBottomInset(decor)

        val lp = tabContainer.layoutParams as? ViewGroup.MarginLayoutParams
        if (lp != null) {
            val horizMargin = dp(activity, 16f).roundToInt()
            val extraBottom = dp(activity, 6f).roundToInt()
            val targetH = dp(activity, 54f).roundToInt()

            lp.width = ViewGroup.LayoutParams.MATCH_PARENT
            lp.height = targetH
            lp.leftMargin = horizMargin
            lp.rightMargin = horizMargin
            lp.bottomMargin = navInset + extraBottom
            if (lp is FrameLayout.LayoutParams) {
                lp.gravity = Gravity.BOTTOM
            }
            tabContainer.layoutParams = lp
        }

        val hPad = dp(activity, 4f).roundToInt()
        val vPad = dp(activity, 4f).roundToInt()
        tabContainer.setPadding(hPad, vPad, hPad, vPad)
        tabContainer.background = null
        tabContainer.elevation = 0f
        (tabContainer as? LinearLayout)?.gravity = Gravity.CENTER_VERTICAL
        LiquidGlassBarView.applyCapsuleOutline(tabContainer)

        if (tabContainer.getTag(TAG_TAB_BG_GUARD) == null) {
            tabContainer.setTag(TAG_TAB_BG_GUARD, true)
            tabContainer.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                if (MergenPrefs.isModEffectivelyActive(activity) &&
                    MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                    v.background != null
                ) {
                    v.background = null
                }
            }
        }
    }

    private fun suppressChromeViews(
        activity: Activity,
        decor: View,
        host: ViewGroup,
        tabContainer: ViewGroup
    ) {
        val saveChromeOnce = { v: View ->
            if (!originalChromeStates.containsKey(v)) {
                originalChromeStates[v] = OriginalChromeViewState(
                    visibility = v.visibility,
                    alpha = v.alpha,
                    background = v.background
                )
            }
        }

        TikTokViewResolver.findBottomSpacer(activity, host)?.let { cnc ->
            saveChromeOnce(cnc)
            hideGone(cnc)
            if (cnc.getTag(TAG_CH_CNC) == null) {
                cnc.setTag(TAG_CH_CNC, true)
                cnc.addOnLayoutChangeListener { v, _, top, _, bottom, _, _, _, _ ->
                    if (MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        (v.visibility != View.GONE || (bottom - top) > 0)
                    ) {
                        v.visibility = View.GONE
                    }
                }
            }
        }

        TikTokViewResolver.findBottomChromeBg(activity, host, tabContainer)?.let { ch4 ->
            saveChromeOnce(ch4)
            ch4.alpha = 0f
            ch4.visibility = View.INVISIBLE
            ch4.background = null
            if (ch4.getTag(TAG_CH_CH4) == null) {
                ch4.setTag(TAG_CH_CH4, true)
                ch4.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                    if (MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        (v.alpha != 0f || v.visibility == View.VISIBLE)
                    ) {
                        v.alpha = 0f
                        v.visibility = View.INVISIBLE
                    }
                }
            }
        }

        TikTokViewResolver.findBottomDivider(activity, host)?.let { cnj ->
            saveChromeOnce(cnj)
            hideGone(cnj)
        }

        TikTokViewResolver.findNavBarStrip(activity, decor)?.let { gsf ->
            saveChromeOnce(gsf)
            gsf.alpha = 0f
            gsf.background = null
            hideGone(gsf)
            if (gsf.getTag(TAG_GSL_LISTENER) == null) {
                gsf.setTag(TAG_GSL_LISTENER, true)
                gsf.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                    if (MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        v.visibility != View.GONE
                    ) {
                        v.visibility = View.GONE
                    }
                }
            }
        }

        decor.findViewById<View>(android.R.id.navigationBarBackground)?.let { navBg ->
            navBg.alpha = 0f
        }
    }

    private var cachedFeedIdPkg: String? = null
    private var cachedZufId: Int = 0
    private var cachedMaskIds: IntArray? = null

    private fun ensureFeedMaskIds(activity: Activity) {
        val pkg = activity.packageName
        if (cachedFeedIdPkg == pkg && cachedMaskIds != null) return
        val res = activity.resources
        cachedZufId = res.getIdentifier("zuf", "id", pkg)
        cachedMaskIds = intArrayOf(
            res.getIdentifier("dus", "id", pkg),
            res.getIdentifier("duc", "id", pkg),
            res.getIdentifier("xi8", "id", pkg),
            res.getIdentifier("xi7", "id", pkg)
        )
        cachedFeedIdPkg = pkg
    }

    private fun syncMasksAndZufBeforeDraw(
        activity: Activity,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View
    ): Boolean {
        ensureFeedMaskIds(activity)
        val maskIds = cachedMaskIds ?: return false
        return walkSyncMasksAndZufBeforeDraw(
            activity = activity,
            barParent = barParent,
            tabContainer = tabContainer,
            backdropSource = backdropSource,
            view = backdropSource,
            zufId = cachedZufId,
            maskIds = maskIds,
            hostHeight = barParent.height,
            liftCaptions = MergenPrefs.isLiftFeedCaptionsEnabled(activity),
            insideInteract = false
        )
    }

    private fun walkSyncMasksAndZufBeforeDraw(
        activity: Activity,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View,
        view: View,
        zufId: Int,
        maskIds: IntArray,
        hostHeight: Int,
        liftCaptions: Boolean,
        insideInteract: Boolean
    ): Boolean {
        if (view.getTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW) != null) return false
        var changed = false
        var nextInsideInteract = insideInteract
        if (TikTokViewResolver.isFeedChromeMask(view, maskIds)) {
            if (view.getTag(TAG_ORIG_VISIBILITY) == null) {
                view.setTag(TAG_ORIG_VISIBILITY, view.visibility)
            }
            if (view.visibility != View.GONE) {
                view.visibility = View.GONE
                changed = true
            }
        } else if (!insideInteract && TikTokViewResolver.isFeedInteractContainer(view, zufId, hostHeight)) {
            nextInsideInteract = true
            val origPad = (view.getTag(TAG_ZUF_ORIG_PAD) as? Int) ?: run {
                view.setTag(TAG_ZUF_ORIG_PAD, view.paddingBottom)
                view.paddingBottom
            }
            val clearPx = computeClearPxForZuf(activity, view, barParent, tabContainer, backdropSource)
            val targetPad = if (liftCaptions) max(origPad, clearPx) else origPad
            if (view.paddingBottom != targetPad) {
                view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, targetPad)
                changed = true
            }
        }
        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                if (walkSyncMasksAndZufBeforeDraw(
                        activity = activity,
                        barParent = barParent,
                        tabContainer = tabContainer,
                        backdropSource = backdropSource,
                        view = view.getChildAt(i),
                        zufId = zufId,
                        maskIds = maskIds,
                        hostHeight = hostHeight,
                        liftCaptions = liftCaptions,
                        insideInteract = nextInsideInteract
                    )
                ) {
                    changed = true
                }
            }
        }
        return changed
    }

    private fun applyFullScreenAndCaptionFix(
        activity: Activity,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View?
    ) {
        if (backdropSource == null) return
        val liftCaptions = MergenPrefs.isLiftFeedCaptionsEnabled(activity)

        TikTokViewResolver.findVideoSeekBar(activity, barParent)?.let { seekBar ->
            if (seekBar.getTag(TAG_SEEKBAR_ORIG_TY) == null) {
                seekBar.setTag(TAG_SEEKBAR_ORIG_TY, seekBar.translationY)
            }
            val origTy = seekBar.getTag(TAG_SEEKBAR_ORIG_TY) as? Float ?: 0f
            seekBar.translationY = if (liftCaptions) -dp(activity, 40f) else origTy
        }

        val pkg = activity.packageName
        val res = activity.resources
        val zufId = res.getIdentifier("zuf", "id", pkg)
        val widgetContainerId = res.getIdentifier("widget_container", "id", pkg)
        val playerViewId = res.getIdentifier("player_view", "id", pkg)
        val rohId = res.getIdentifier("roh", "id", pkg)
        val maskIds = intArrayOf(
            res.getIdentifier("dus", "id", pkg),
            res.getIdentifier("duc", "id", pkg),
            res.getIdentifier("xi8", "id", pkg),
            res.getIdentifier("xi7", "id", pkg)
        )

        walkFeedTree(
            activity = activity,
            barParent = barParent,
            tabContainer = tabContainer,
            backdropSource = backdropSource,
            view = backdropSource,
            zufId = zufId,
            widgetContainerId = widgetContainerId,
            playerViewId = playerViewId,
            rohId = rohId,
            maskIds = maskIds,
            hostHeight = barParent.height,
            liftCaptions = liftCaptions,
            insideInteract = false
        )
    }

    private fun computeClearPxForZuf(
        activity: Activity,
        zuf: View,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View? = null
    ): Int {
        var localTopInPage = 0
        var cur: View? = zuf
        while (cur != null) {
            val parent = cur.parent as? View ?: break
            if (cur === barParent ||
                (backdropSource != null && cur === backdropSource) ||
                cur.javaClass.simpleName.contains("VideoViewCellRoot", ignoreCase = true) ||
                parent.javaClass.simpleName.contains("VerticalViewPager", ignoreCase = true)
            ) {
                break
            }
            localTopInPage += cur.top
            cur = parent
        }
        val refH = if (barParent.height > 0) {
            barParent.height
        } else {
            activity.resources.displayMetrics.heightPixels
        }
        val pageLocalZufBottom = if (zuf.height > 0) localTopInPage + zuf.height else refH
        val tabTopInBarParent = if (tabContainer.top > 0 && tabContainer.height > 0) {
            tabContainer.top
        } else {
            val navInset = TikTokViewResolver.navBarBottomInset(barParent)
            refH - navInset - dp(activity, 6f).roundToInt() - dp(activity, 54f).roundToInt()
        }
        val targetContentBottom = tabTopInBarParent - dp(activity, 12f).roundToInt()
        val maxClear = dp(activity, 240f).roundToInt()
        return (pageLocalZufBottom - targetContentBottom).coerceIn(0, maxClear)
    }

    private fun ensureNonFeedEdgeToEdgeAndClearance(
        activity: Activity,
        decor: View,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View?,
        tabIndex: Int
    ) {
        if (backdropSource == null) return
        val onNonFeed = tabIndex >= 2 || TikTokViewResolver.findActiveWidgetContainer(activity, decor)?.isShown != true
        if (!onNonFeed) return

        val savePadOnce = { v: View ->
            if (!originalPaddingStates.containsKey(v)) {
                val mlp = v.layoutParams as? ViewGroup.MarginLayoutParams
                originalPaddingStates[v] = OriginalPaddingState(
                    padBottom = v.paddingBottom,
                    marginBottom = mlp?.bottomMargin ?: 0,
                    lpHeight = mlp?.height ?: ViewGroup.LayoutParams.MATCH_PARENT
                )
            }
        }

        // Extend non-feed tab wrapper views (y9d and visible children up to depth 2) edge-to-edge behind bar
        fun clearWrapperBottom(v: View, depth: Int) {
            if (!v.isShown || v.getTag(TikTokViewResolver.TAG_MERGEN_MANAGED_VIEW) != null) return
            if (depth > 0 && v.height >= (barParent.height * 0.6f).roundToInt()) {
                savePadOnce(v)
                if (v.paddingBottom != 0) {
                    v.setPadding(v.paddingLeft, v.paddingTop, v.paddingRight, 0)
                }
                (v.layoutParams as? ViewGroup.MarginLayoutParams)?.let { lp ->
                    if (lp.bottomMargin != 0) {
                        lp.bottomMargin = 0
                        v.post { v.layoutParams = lp }
                    }
                }
            }
            if (depth < 2 && v is ViewGroup) {
                for (i in 0 until v.childCount) {
                    clearWrapperBottom(v.getChildAt(i), depth + 1)
                }
            }
        }
        clearWrapperBottom(backdropSource, 0)

        val tabLoc = IntArray(2)
        val barLoc = IntArray(2)
        tabContainer.getLocationOnScreen(tabLoc)
        barParent.getLocationOnScreen(barLoc)
        val barBottom = barLoc[1] + barParent.height
        val barClearance = if (tabLoc[1] > 0 && barBottom > tabLoc[1]) {
            (barBottom - tabLoc[1]) + dp(activity, 12f).roundToInt()
        } else {
            TikTokViewResolver.navBarBottomInset(barParent) + dp(activity, 76f).roundToInt()
        }
        TikTokViewResolver.applyBottomClearanceToScrollables(
            backdropSource,
            barClearance.coerceIn(dp(activity, 64f).roundToInt(), dp(activity, 160f).roundToInt())
        )
    }

    private fun walkFeedTree(
        activity: Activity,
        barParent: ViewGroup,
        tabContainer: ViewGroup,
        backdropSource: View,
        view: View,
        zufId: Int,
        widgetContainerId: Int,
        playerViewId: Int,
        rohId: Int,
        maskIds: IntArray,
        hostHeight: Int,
        liftCaptions: Boolean,
        insideInteract: Boolean
    ) {
        var nextInsideInteract = insideInteract
        if (TikTokViewResolver.isWidgetContainer(activity, view, widgetContainerId)) {
            FeedSearchPillHelper.syncForWidgetContainer(activity, view as ViewGroup, active = true)
        }
        if (TikTokViewResolver.isFeedChromeMask(view, maskIds)) {
            if (view.getTag(TAG_ORIG_VISIBILITY) == null) {
                view.setTag(TAG_ORIG_VISIBILITY, view.visibility)
            }
            hideGone(view)
            if (view.getTag(TAG_MASK_GUARD) == null) {
                view.setTag(TAG_MASK_GUARD, true)
                view.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                    if (MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        v.visibility != View.GONE
                    ) {
                        if (!v.isInLayout) {
                            v.visibility = View.GONE
                        } else {
                            v.post {
                                if (v.isAttachedToWindow &&
                                    MergenPrefs.isModEffectivelyActive(activity) &&
                                    MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                                    v.visibility != View.GONE
                                ) {
                                    v.visibility = View.GONE
                                }
                            }
                        }
                    }
                }
            }
        } else if (!insideInteract && TikTokViewResolver.isFeedInteractContainer(view, zufId, hostHeight)) {
            nextInsideInteract = true
            val origPad = (view.getTag(TAG_ZUF_ORIG_PAD) as? Int) ?: run {
                view.setTag(TAG_ZUF_ORIG_PAD, view.paddingBottom)
                view.paddingBottom
            }
            val clearPx = computeClearPxForZuf(activity, view, barParent, tabContainer, backdropSource)
            val targetPad = if (liftCaptions) max(origPad, clearPx) else origPad
            if (view.paddingBottom != targetPad) {
                view.setPadding(view.paddingLeft, view.paddingTop, view.paddingRight, targetPad)
            }
            if (view.getTag(TAG_ZUF_GUARD) == null) {
                view.setTag(TAG_ZUF_GUARD, true)
                view.addOnLayoutChangeListener { v, _, _, _, _, _, _, _, _ ->
                    if (MergenPrefs.isModEffectivelyActive(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        MergenPrefs.isLiftFeedCaptionsEnabled(activity)
                    ) {
                        val savedOrig = (v.getTag(TAG_ZUF_ORIG_PAD) as? Int) ?: 0
                        val wanted = max(
                            savedOrig,
                            computeClearPxForZuf(activity, v, barParent, tabContainer, backdropSource)
                        )
                        if (v.paddingBottom != wanted) {
                            if (!v.isInLayout) {
                                v.setPadding(v.paddingLeft, v.paddingTop, v.paddingRight, wanted)
                            } else {
                                v.post {
                                    if (v.isAttachedToWindow &&
                                        MergenPrefs.isModEffectivelyActive(activity) &&
                                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                                        MergenPrefs.isLiftFeedCaptionsEnabled(activity) &&
                                        v.paddingBottom != wanted
                                    ) {
                                        v.setPadding(v.paddingLeft, v.paddingTop, v.paddingRight, wanted)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        } else if (TikTokViewResolver.isPlayerContainer(activity, view, playerViewId, rohId)) {
            if (view is ViewGroup) {
                for (i in 0 until view.childCount) {
                    val c = view.getChildAt(i)
                    if (c.scaleX != 1f || c.scaleY != 1f) {
                        c.scaleX = 1f
                        c.scaleY = 1f
                    }
                }
            }
        }

        if (view is ViewGroup) {
            for (i in 0 until view.childCount) {
                walkFeedTree(
                    activity = activity,
                    barParent = barParent,
                    tabContainer = tabContainer,
                    backdropSource = backdropSource,
                    view = view.getChildAt(i),
                    zufId = zufId,
                    widgetContainerId = widgetContainerId,
                    playerViewId = playerViewId,
                    rohId = rohId,
                    maskIds = maskIds,
                    hostHeight = hostHeight,
                    liftCaptions = liftCaptions,
                    insideInteract = nextInsideInteract
                )
            }
        }
    }

    private fun hideGone(view: View) {
        if (view.visibility != View.GONE) {
            view.visibility = View.GONE
        }
    }

    private fun inspectPlayerSurface(activity: Activity, decor: View) {
        val playerView = TikTokViewResolver.findViewByIdName(activity, decor, "player_view") as? ViewGroup ?: return
        if (loggedPlayers.containsKey(playerView)) return
        loggedPlayers[playerView] = true
        for (i in 0 until playerView.childCount) {
            val child = playerView.getChildAt(i)
            val chain = generateSequence<Class<*>>(child.javaClass) { it.superclass }
                .joinToString(" -> ") { it.name }
            Log.i(TAG, "player_view child[$i]: $chain")
        }
    }

    private fun dp(activity: Activity, value: Float): Float =
        TikTokViewResolver.dp(activity, value)
}
