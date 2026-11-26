package com.sarp.tiktokliquidglass

import android.app.Activity
import android.view.View
import android.view.ViewGroup
import android.view.ViewTreeObserver
import java.lang.ref.WeakReference
import java.util.WeakHashMap
import kotlin.math.PI
import kotlin.math.abs
import kotlin.math.sin

/**
 * Faz 2 (Consolidated) — SurfaceView-safe GPU vertical feed transitions.
 * Attaches to TikTok's VerticalViewPager scroll listener and applies Depth, Stack, or
 * Cinematic transforms + overlay-only directional blur while strictly resetting settled pages.
 */
object VideoTransitionController {

    private class TransitionState(
        var pagerRef: WeakReference<ViewGroup>? = null,
        var settledPageRef: WeakReference<View>? = null,
        var scrollListener: ViewTreeObserver.OnScrollChangedListener? = null,
        var activeTab: Int = 0,
        var lastScrollY: Int = Int.MIN_VALUE
    )

    private val states = WeakHashMap<Activity, TransitionState>()
    @Volatile private var cachedWidgetPkg: String? = null
    @Volatile private var cachedWidgetId: Int = 0

    private fun resolveWidgetContainerId(activity: Activity): Int {
        val pkg = activity.packageName
        if (cachedWidgetPkg == pkg && cachedWidgetId != 0) return cachedWidgetId
        val id = activity.resources.getIdentifier("widget_container", "id", pkg)
        cachedWidgetPkg = pkg
        cachedWidgetId = id
        return id
    }

    fun sync(activity: Activity, decor: View? = activity.window?.decorView) {
        if (activity.isFinishing || activity.isDestroyed || decor == null) return
        if (!MergenPrefs.isModEffectivelyActive(activity) || TikTokViewResolver.isSettingsActivity(activity)) {
            detach(activity)
            return
        }

        val state = states.getOrPut(activity) { TransitionState() }
        val pager = TikTokViewResolver.findVerticalViewPager(decor) ?: return

        val prevPager = state.pagerRef?.get()
        if (prevPager !== pager) {
            removeListener(prevPager, state.scrollListener)
            val listener = ViewTreeObserver.OnScrollChangedListener {
                if (!activity.isFinishing && !activity.isDestroyed) {
                    applyTransforms(activity, pager, state)
                }
            }
            pager.viewTreeObserver.addOnScrollChangedListener(listener)
            state.pagerRef = WeakReference(pager)
            state.scrollListener = listener
        }

        applyTransforms(activity, pager, state)
    }

    fun onTabChanged(activity: Activity, tabIndex: Int) {
        val state = states[activity] ?: return
        state.activeTab = tabIndex
        val pager = state.pagerRef?.get() ?: return
        if (tabIndex != 0 && tabIndex != 1) {
            state.settledPageRef = null
            resetPagerChildren(activity, pager)
        } else {
            applyTransforms(activity, pager, state)
        }
    }

    fun detach(activity: Activity) {
        val state = states.remove(activity) ?: return
        state.settledPageRef = null
        val pager = state.pagerRef?.get()
        removeListener(pager, state.scrollListener)
        if (pager != null) {
            resetPagerChildren(activity, pager)
        }
    }

    private fun removeListener(pager: ViewGroup?, listener: ViewTreeObserver.OnScrollChangedListener?) {
        if (pager != null && listener != null) {
            try {
                if (pager.viewTreeObserver.isAlive) {
                    pager.viewTreeObserver.removeOnScrollChangedListener(listener)
                }
            } catch (_: Throwable) {
            }
        }
    }

    private fun applyTransforms(activity: Activity, pager: ViewGroup, state: TransitionState) {
        if (!MergenPrefs.isModEffectivelyActive(activity) || (state.activeTab != 0 && state.activeTab != 1)) {
            state.lastScrollY = Int.MIN_VALUE
            state.settledPageRef = null
            resetPagerChildren(activity, pager)
            return
        }

        val pagerH = pager.height.toFloat()
        if (pagerH <= 1f) return
        val scrollY = pager.scrollY.toFloat()

        val curScrollInt = pager.scrollY
        val deltaY = if (state.lastScrollY == Int.MIN_VALUE) 0 else curScrollInt - state.lastScrollY
        state.lastScrollY = curScrollInt

        var settledChild: View? = null
        var closestChild: View? = null
        var bestDist = Float.MAX_VALUE
        for (i in 0 until pager.childCount) {
            val c = pager.getChildAt(i)
            val d = abs(c.top - scrollY)
            if (d < bestDist) {
                bestDist = d
                closestChild = c
            }
            if (d <= pagerH * 0.008f) {
                settledChild = c
            }
        }

        val prevSettled = state.settledPageRef?.get()
        if (settledChild != null) {
            if (prevSettled != null && prevSettled !== settledChild) {
                val dirY = if (settledChild.top >= prevSettled.top) -1f else 1f
                DanmakuController.onFeedPageChanged(activity, dirY)
            }
            state.settledPageRef = WeakReference(settledChild)
            DanmakuController.onFeedScroll(activity, deltaY = deltaY, scrollProgress = 0f)
        } else {
            val anchor = if (prevSettled != null && prevSettled.parent === pager) prevSettled else closestChild
            val progress = if (anchor != null) {
                ((scrollY - anchor.top) / pagerH).coerceIn(-1f, 1f)
            } else {
                0f
            }
            DanmakuController.onFeedScroll(activity, deltaY = deltaY, scrollProgress = progress)
        }

        val style = MergenPrefs.getTransitionStyle(activity)
        if (style == "none") {
            resetPagerChildren(activity, pager)
            return
        }

        val reduced = MergenSpringEngine.isReducedMotion(activity)
        val widgetId = resolveWidgetContainerId(activity)
        val stackZ = MergenDesign.dpF(activity, 12f)
        val blurRefSpeed = MergenDesign.dpF(activity, 1100f)

        for (i in 0 until pager.childCount) {
            val child = pager.getChildAt(i)
            val pos = ((child.top - scrollY) / pagerH).coerceIn(-1.5f, 1.5f)
            val absPos = abs(pos).coerceIn(0f, 1f)
            val widget = if (widgetId != 0) child.findViewById<View>(widgetId) else null

            if (absPos < 0.005f) {
                resetChild(child, widget)
                continue
            }

            if (reduced) {
                child.scaleX = 1f
                child.scaleY = 1f
                child.alpha = (1f - 0.55f * absPos).coerceIn(0f, 1f)
                child.translationY = 0f
                child.translationZ = 0f
                if (widget != null) MergenMotionBlur.clear(widget)
                continue
            }

            when (style) {
                "depth" -> {
                    val s = 1f - 0.10f * absPos
                    child.scaleX = s
                    child.scaleY = s
                    child.alpha = (1f - 0.45f * absPos).coerceIn(0f, 1f)
                    child.translationY = -pos * pagerH * 0.12f
                    child.translationZ = 0f
                    if (widget != null) MergenMotionBlur.clear(widget)
                }
                "stack" -> {
                    if (pos < 0f) {
                        val outT = (-pos).coerceIn(0f, 1f)
                        val s = 1f - 0.12f * outT
                        child.scaleX = s
                        child.scaleY = s
                        child.alpha = (1f - 0.55f * outT).coerceIn(0f, 1f)
                        child.translationY = -pos * pagerH * 0.35f
                        child.translationZ = 0f
                    } else {
                        child.scaleX = 1f
                        child.scaleY = 1f
                        child.alpha = 1f
                        child.translationY = 0f
                        child.translationZ = stackZ
                    }
                    if (widget != null) MergenMotionBlur.clear(widget)
                }
                "cinematic" -> {
                    val s = 1f - 0.06f * absPos
                    child.scaleX = s
                    child.scaleY = s
                    child.alpha = (1f - 0.65f * absPos).coerceIn(0f, 1f)
                    child.translationY = 0f
                    child.translationZ = 0f
                    if (widget != null) {
                        val midWeight = sin(absPos * PI).toFloat().coerceIn(0f, 1f)
                        if (midWeight > 0.04f) {
                            MergenMotionBlur.applyDragVelocityBlur(
                                view = widget,
                                vxPxPerSec = 0f,
                                vyPxPerSec = midWeight * blurRefSpeed,
                                maxBlurDp = 7f
                            )
                        } else {
                            MergenMotionBlur.clear(widget)
                        }
                    }
                }
            }
        }
    }

    private fun resetPagerChildren(activity: Activity, pager: ViewGroup) {
        val widgetId = resolveWidgetContainerId(activity)
        for (i in 0 until pager.childCount) {
            val child = pager.getChildAt(i)
            val widget = if (widgetId != 0) child.findViewById<View>(widgetId) else null
            resetChild(child, widget)
        }
    }

    private fun resetChild(child: View, widget: View?) {
        if (child.scaleX != 1f) child.scaleX = 1f
        if (child.scaleY != 1f) child.scaleY = 1f
        if (child.alpha != 1f) child.alpha = 1f
        if (child.translationY != 0f) child.translationY = 0f
        if (child.translationZ != 0f) child.translationZ = 0f
        if (widget != null) {
            MergenMotionBlur.clear(widget)
        }
    }
}
