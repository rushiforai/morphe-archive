package com.sarp.tiktokliquidglass

import android.app.Activity
import android.os.Handler
import android.os.Looper
import android.os.SystemClock
import android.view.KeyEvent
import android.view.MotionEvent
import android.view.ViewConfiguration
import android.view.Window
import kotlin.math.abs

/**
 * Window.Callback delegate observing gestures & BACK navigation for:
 * - KEYCODE_BACK priority dismissal for Camera Calibrator, Quick Control Sheet, and Account Drawer
 * - Avatar-only left-swipe to open right-docked Account Drawer (avoids carousel & outerPager conflicts)
 * - Right-swipe on feed -> Sound / Creator channel (optional toggle + sensitivity scale)
 * - Vertical swipes on feed -> Morphing Bottom Bar
 */
class MergenWindowCallback private constructor(
    private val activity: Activity,
    private val original: Window.Callback
) : Window.Callback by original {

    private val mainHandler = Handler(Looper.getMainLooper())
    private val touchSlop = ViewConfiguration.get(activity).scaledTouchSlop.toFloat()

    private var downX = 0f
    private var downY = 0f
    private var downLocalX = 0f
    private var downLocalY = 0f
    private var downTimeMs = 0L
    private var pointerDown = false
    private var downOnCreatorAvatar = false
    private var drawerSwipeConsumed = false
    private var peekSwipeConsumed = false
    private var radialGestureActive = false
    private var longPressRunnable: Runnable? = null

    private fun dp(value: Float): Float =
        TikTokViewResolver.dp(activity, value)

    override fun dispatchKeyEvent(event: KeyEvent?): Boolean {
        if (event != null &&
            event.keyCode == KeyEvent.KEYCODE_BACK &&
            event.action == KeyEvent.ACTION_UP &&
            MergenPrefs.isModEffectivelyActive(activity)
        ) {
            if (RadialMenuController.isShowing(activity)) {
                RadialMenuController.dismiss(activity, animate = true)
                return true
            }
            if (DynamicPillController.isCalibrating(activity)) {
                DynamicPillController.dismissCalibrator(activity)
                return true
            }
            if (QuickControlSheetController.isShowing(activity)) {
                QuickControlSheetController.dismiss(activity, animate = true)
                return true
            }
            if (PeekSheetAndProfileController.isInPeekState(activity)) {
                PeekSheetAndProfileController.closePeekToFeed(activity, animate = true)
                return true
            }
        }
        return original.dispatchKeyEvent(event)
    }

    override fun dispatchTouchEvent(event: MotionEvent?): Boolean {
        if (event == null || !MergenPrefs.isModEffectivelyActive(activity)) {
            cancelPendingLongPress()
            radialGestureActive = false
            return original.dispatchTouchEvent(event)
        }

        val decor = activity.window?.decorView
        val screenW = activity.resources.displayMetrics.widthPixels.toFloat()
        val screenH = activity.resources.displayMetrics.heightPixels.toFloat()
        val sensScale = MergenPrefs.getGestureThresholdScale(activity)

        when (event.actionMasked) {
            MotionEvent.ACTION_DOWN -> {
                cancelPendingLongPress()
                radialGestureActive = false
                downX = event.rawX
                downY = event.rawY
                downLocalX = event.x
                downLocalY = event.y
                downTimeMs = event.downTime
                pointerDown = true
                drawerSwipeConsumed = false
                peekSwipeConsumed = false
                downOnCreatorAvatar = !PeekSheetAndProfileController.isInPeekState(activity) &&
                    !RadialMenuController.isShowing(activity) &&
                    PeekSheetAndProfileController.isPointOnCreatorAvatar(activity, downX, downY)

                if (!downOnCreatorAvatar &&
                    MergenPrefs.isRadialMenuEnabled(activity) &&
                    !RadialMenuController.isShowing(activity) &&
                    !QuickControlSheetController.isShowing(activity) &&
                    !PeekSheetAndProfileController.isInPeekState(activity) &&
                    !DynamicPillController.isCalibrating(activity) &&
                    downX in (screenW * 0.18f)..(screenW * 0.82f) &&
                    downY in (screenH * 0.16f)..(screenH * 0.82f) &&
                    decor != null
                ) {
                    val host = TikTokViewResolver.findFragmentTabHost(decor)
                    val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
                    val outerPager = host?.let { TikTokViewResolver.findOuterHorizontalPager(it) }
                    val onFeedRoot = outerPager == null || outerPager.scrollX <= dp(8f)
                    val onFeedTab = TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer) &&
                        !TikTokViewResolver.isOwnProfileActive(activity, decor, tabContainer)
                    if (onFeedRoot && onFeedTab) {
                        val armedX = downX
                        val armedY = downY
                        val armedLocalX = downLocalX
                        val armedLocalY = downLocalY
                        val armedDownTime = downTimeMs
                        val r = Runnable {
                            longPressRunnable = null
                            if (!pointerDown ||
                                activity.isFinishing ||
                                activity.isDestroyed ||
                                !MergenPrefs.isModEffectivelyActive(activity) ||
                                !MergenPrefs.isRadialMenuEnabled(activity) ||
                                RadialMenuController.isShowing(activity) ||
                                QuickControlSheetController.isShowing(activity) ||
                                PeekSheetAndProfileController.isInPeekState(activity) ||
                                DynamicPillController.isCalibrating(activity)
                            ) {
                                return@Runnable
                            }
                            radialGestureActive = true
                            cancelChildTouchAt(armedDownTime, armedLocalX, armedLocalY)
                            RadialMenuController.openFromLongPress(activity, armedX, armedY)
                        }
                        longPressRunnable = r
                        mainHandler.postDelayed(r, 320L)
                    }
                }
            }

            MotionEvent.ACTION_POINTER_DOWN -> {
                cancelPendingLongPress()
                pointerDown = false
            }

            MotionEvent.ACTION_MOVE -> {
                if (radialGestureActive) {
                    RadialMenuController.handleTrackedTouchEvent(activity, event)
                    return true
                }
                val dx = event.rawX - downX
                val dy = event.rawY - downY
                if (longPressRunnable != null && (abs(dx) > touchSlop || abs(dy) > touchSlop)) {
                    cancelPendingLongPress()
                }
                if (drawerSwipeConsumed || peekSwipeConsumed) return true

                if (PeekSheetAndProfileController.isInPeekState(activity)) {
                    if (downX < screenW * 0.48f &&
                        abs(dx) > dp(48f) * sensScale &&
                        abs(dx) > abs(dy) * 1.35f
                    ) {
                        peekSwipeConsumed = true
                        cancelChildTouch(event)
                        if (dx < 0f) {
                            PeekSheetAndProfileController.expandToFullProfile(activity)
                        } else {
                            PeekSheetAndProfileController.closePeekToFeed(activity, animate = true)
                        }
                        return true
                    }
                } else if (downOnCreatorAvatar &&
                    dx < -dp(20f) * sensScale &&
                    abs(dx) > abs(dy) * 1.15f &&
                    PeekSheetAndProfileController.canOpenProfileDrawer(activity)
                ) {
                    drawerSwipeConsumed = true
                    cancelChildTouch(event)
                    PeekSheetAndProfileController.openProfileDrawer(activity)
                    return true
                }
            }

            MotionEvent.ACTION_UP -> {
                cancelPendingLongPress()
                pointerDown = false
                if (radialGestureActive) {
                    radialGestureActive = false
                    RadialMenuController.handleTrackedTouchEvent(activity, event)
                    return true
                }
                if (drawerSwipeConsumed) {
                    drawerSwipeConsumed = false
                    downOnCreatorAvatar = false
                    return true
                }
                if (peekSwipeConsumed) {
                    peekSwipeConsumed = false
                    return true
                }
                downOnCreatorAvatar = false

                if (PeekSheetAndProfileController.isInPeekState(activity)) {
                    val dx = event.rawX - downX
                    val dy = event.rawY - downY
                    if (downX < screenW * 0.48f &&
                        abs(dx) > dp(48f) * sensScale &&
                        abs(dx) > abs(dy) * 1.35f
                    ) {
                        if (dx < 0f) {
                            PeekSheetAndProfileController.expandToFullProfile(activity)
                        } else {
                            PeekSheetAndProfileController.closePeekToFeed(activity, animate = true)
                        }
                        return true
                    }
                } else if (decor != null && !RadialMenuController.isShowing(activity)) {
                    val dx = event.rawX - downX
                    val dy = event.rawY - downY
                    val glassBar = LiquidGlassController.getAttachedGlassBar(activity)
                    val host = TikTokViewResolver.findFragmentTabHost(decor)
                    val tabContainer = host?.let { TikTokViewResolver.findTabContainer(activity, it) }
                    val outerPager = host?.let { TikTokViewResolver.findOuterHorizontalPager(it) }
                    val onFeedRoot = outerPager == null || outerPager.scrollX <= dp(8f)
                    val onFeedTab = TikTokViewResolver.isOnFeedTab(activity, decor, tabContainer) &&
                        !TikTokViewResolver.isOwnProfileActive(activity, decor, tabContainer)
                    val aboveBarZone = downY < screenH - dp(96f)

                    if (glassBar != null &&
                        MergenPrefs.isMorphingBarEnabled(activity) &&
                        MergenPrefs.isLiquidGlassBarEnabled(activity) &&
                        onFeedRoot &&
                        onFeedTab &&
                        aboveBarZone &&
                        abs(dy) > abs(dx)
                    ) {
                        if (dy < -dp(65f) * sensScale) {
                            glassBar.setMorphed(true)
                        } else if (dy > dp(65f) * sensScale) {
                            glassBar.setMorphed(false)
                        }
                    }
                }
            }

            MotionEvent.ACTION_CANCEL -> {
                cancelPendingLongPress()
                pointerDown = false
                downOnCreatorAvatar = false
                if (radialGestureActive) {
                    radialGestureActive = false
                    RadialMenuController.handleTrackedTouchEvent(activity, event)
                    return true
                }
                if (drawerSwipeConsumed || peekSwipeConsumed) {
                    drawerSwipeConsumed = false
                    peekSwipeConsumed = false
                    return true
                }
            }
        }

        return original.dispatchTouchEvent(event)
    }

    private fun cancelPendingLongPress() {
        longPressRunnable?.let {
            mainHandler.removeCallbacks(it)
            longPressRunnable = null
        }
    }

    private fun cancelChildTouchAt(downTime: Long, x: Float, y: Float) {
        val now = SystemClock.uptimeMillis()
        val cancel = MotionEvent.obtain(
            downTime,
            now,
            MotionEvent.ACTION_CANCEL,
            x,
            y,
            0
        )
        original.dispatchTouchEvent(cancel)
        cancel.recycle()
    }

    private fun cancelChildTouch(source: MotionEvent) {
        val now = SystemClock.uptimeMillis()
        val cancel = MotionEvent.obtain(
            source.downTime,
            now,
            MotionEvent.ACTION_CANCEL,
            source.x,
            source.y,
            0
        )
        original.dispatchTouchEvent(cancel)
        cancel.recycle()
    }

    companion object {
        private const val TAG_WINDOW_CALLBACK = 0x53415288

        fun attachOnce(activity: Activity) {
            val win = activity.window ?: return
            val decor = win.decorView ?: return
            if (decor.getTag(TAG_WINDOW_CALLBACK) != null) return
            val existing = win.callback ?: return
            if (existing is MergenWindowCallback) return
            decor.setTag(TAG_WINDOW_CALLBACK, true)
            win.callback = MergenWindowCallback(activity, existing)
        }
    }
}
