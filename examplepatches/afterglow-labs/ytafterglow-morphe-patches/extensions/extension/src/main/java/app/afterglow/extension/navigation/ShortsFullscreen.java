package app.afterglow.extension.navigation;

import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewTreeObserver;
import java.lang.ref.WeakReference;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** Connects native Shorts clear mode to the native bottom-bar layout callbacks. */
public final class ShortsFullscreen {
    public interface ClearController {
        boolean afterglow_isClear();
        void afterglow_setClear(boolean clear);
    }
    public interface BottomController { void afterglow_refreshBottomHeight(); }
    public interface NavigationController {
        void afterglow_setBottomHidden(boolean hidden);
        boolean afterglow_selectShorts();
    }
    public interface GestureController {
        ClearController afterglow_clearController();
        boolean afterglow_canAutoHide();
        View afterglow_playerView();
    }

    private static WeakReference<ClearController> active = new WeakReference<>(null);
    private static WeakReference<View> content = new WeakReference<>(null);
    private static WeakReference<BottomBinding> bottom = new WeakReference<>(null);
    private static WeakReference<NavigationController> navigation = new WeakReference<>(null);
    private static WeakReference<GestureController> gesture = new WeakReference<>(null);
    private static boolean tabsHiddenByPinch, overlayCleared, pinching, automaticChange, multiplePointers, moved;
    private static float downX, downY;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static final Runnable REFRESH = ShortsFullscreen::preferenceChanged;
    private static final Runnable HIDE_OVERLAY = () -> {
        try {
            if (canChangeOverlay() && !pinching) setClearAutomatically(true);
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.idle", error); }
    };
    private static final Runnable SHOW_OVERLAY = () -> {
        try {
            if (canChangeOverlay() && !pinching) {
                setClearAutomatically(false);
                scheduleIdle();
            }
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.tap", error); }
    };
    private static final Runnable RESTORE_OVERLAY = () -> {
        try {
            if (canChangeOverlay()) {
                setClearAutomatically(overlayCleared);
                updateBottom();
                if (!overlayCleared) scheduleIdle();
            } else release(false);
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.restore", error); }
    };
    private static final View.OnAttachStateChangeListener CONTENT_ATTACHMENT = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) {}
        @Override public void onViewDetachedFromWindow(View view) {
            try { if (view == content.get()) release(false); }
            catch (Throwable error) { Afterglow.error("ShortsFullscreen.detach", error); }
        }
    };

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals("pinchToFullscreenShorts") && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private ShortsFullscreen() {}

    /** The native tab controller also owns the browse-content inset. */
    public static void bindNavigation(NavigationController controller) {
        navigation = new WeakReference<>(controller);
    }

    /** Called only after the native recognizer accepts a pinch on its own player view. */
    public static void begin(ClearController controller, View view) {
        try {
            if (!ShortsFullscreenPolicy.enabled() || controller == null || view == null) return;
            cancelIdle();
            pinching = true;
            View previous = content.get();
            if (previous != view) {
                if (previous != null) previous.removeOnAttachStateChangeListener(CONTENT_ATTACHMENT);
                view.addOnAttachStateChangeListener(CONTENT_ATTACHMENT);
                content = new WeakReference<>(view);
            }
            active = new WeakReference<>(controller);
            overlayCleared = controller.afterglow_isClear();
            updateBottom();
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.begin", error); }
    }

    public static void end(ClearController controller, View view) {
        try {
            if (controller != active.get() || view != content.get()) return;
            pinching = false;
            tabsHiddenByPinch = overlayCleared = controller.afterglow_isClear();
            updateBottom();
            if (!tabsHiddenByPinch) scheduleIdle();
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.end", error); }
    }

    /** Native pinch, Exit Clear Screen and controller reset all use this state. */
    public static void stateChanged(ClearController controller) {
        try {
            if (controller != active.get()) return;
            overlayCleared = controller.afterglow_isClear();
            if (!automaticChange) {
                tabsHiddenByPinch = overlayCleared;
                cancelIdle();
            }
            updateBottom();
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.state", error); }
    }

    public static void reset(ClearController controller) {
        try {
            if (controller != active.get()) return;
            cancelIdle();
            pinching = false;
            // A new reel resets native clear mode while reusing the attached
            // player. Reapply our chosen state after its new observers mount.
            // Leaving the player/window or opening a panel still releases it.
            if (canChangeOverlay()) MAIN.post(RESTORE_OVERLAY);
            else release(false);
        }
        catch (Throwable error) { Afterglow.error("ShortsFullscreen.reset", error); }
    }

    /** Observe the native dispatcher without consuming or replacing its gestures. */
    public static void touch(GestureController source, MotionEvent event) {
        try {
            ShortsOnlyMode.touch(source, event);
            if (!ShortsFullscreenPolicy.enabled() || source == null || event == null) return;
            if (gesture.get() != source) gesture = new WeakReference<>(source);
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                cancelIdle();
                multiplePointers = moved = false;
                downX = event.getX();
                downY = event.getY();
            } else if (action == MotionEvent.ACTION_POINTER_DOWN) {
                cancelIdle();
                multiplePointers = true;
            } else if (action == MotionEvent.ACTION_MOVE && !multiplePointers) {
                View view = content.get();
                if (view != null) {
                    int slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                    moved |= Math.abs(event.getX() - downX) > slop || Math.abs(event.getY() - downY) > slop;
                }
            } else if (action == MotionEvent.ACTION_UP) {
                // Run after native tap/hold dispatch. A pinch must keep its final state.
                if (!multiplePointers && !moved && source.afterglow_clearController() == active.get()) {
                    MAIN.removeCallbacks(SHOW_OVERLAY);
                    MAIN.post(SHOW_OVERLAY);
                }
            } else if (action == MotionEvent.ACTION_CANCEL) {
                cancelIdle();
            }
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.touch", error); }
    }

    private static boolean canChangeOverlay() {
        View view = content.get();
        GestureController source = gesture.get();
        ClearController controller = active.get();
        return ShortsFullscreenPolicy.enabled() && view != null && view.isAttachedToWindow()
                && view.isShown() && view.hasWindowFocus() && controller != null && source != null
                && source.afterglow_clearController() == controller && source.afterglow_canAutoHide();
    }

    private static void setClearAutomatically(boolean clear) {
        overlayCleared = clear;
        ClearController controller = active.get();
        if (controller == null || controller.afterglow_isClear() == clear) return;
        automaticChange = true;
        try { controller.afterglow_setClear(clear); }
        finally { automaticChange = false; }
    }

    private static void cancelIdle() {
        MAIN.removeCallbacks(HIDE_OVERLAY);
        MAIN.removeCallbacks(SHOW_OVERLAY);
        MAIN.removeCallbacks(RESTORE_OVERLAY);
    }

    private static void scheduleIdle() {
        cancelIdle();
        if (canChangeOverlay()) MAIN.postDelayed(HIDE_OVERLAY, 3000);
    }

    public static void bindBottom(BottomController controller, View view) {
        try {
            if (!Gate.installed(Gate.SHORTS) || controller == null || view == null) return;
            BottomBinding previous = bottom.get();
            if (previous != null && previous.view == view) return;
            if (previous != null) previous.apply(false);
            BottomBinding binding = new BottomBinding(controller, view);
            bottom = new WeakReference<>(binding);
            view.addOnAttachStateChangeListener(binding);
            if (view.isAttachedToWindow()) binding.onViewAttachedToWindow(view);
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.bindBottom", error); }
    }

    /** Keep every native content-height listener consistent while our bar is hidden. */
    public static int bottomHeight(int original) {
        BottomBinding binding = bottom.get();
        return binding != null && binding.hidden ? 0 : original;
    }

    private static boolean fullscreen() {
        View view = content.get();
        ClearController controller = active.get();
        return ShortsFullscreenPolicy.enabled() && view != null && view.isAttachedToWindow()
                && view.isShown() && controller != null && tabsHiddenByPinch;
    }

    private static boolean hidesBottom() {
        return ShortsOnlyMode.hidesTabs() || fullscreen();
    }

    static void updateBottom() {
        BottomBinding binding = bottom.get();
        if (binding != null) binding.apply(hidesBottom());
    }

    static boolean selectShorts() {
        NavigationController controller = navigation.get();
        return controller != null && controller.afterglow_selectShorts();
    }

    /** Escape clears any previous pinch ownership so navigation can return. */
    static void exitShortsOnlyMode() { release(true); }

    private static void preferenceChanged() {
        try {
            if (!ShortsFullscreenPolicy.enabled()) release(true);
            else updateBottom();
        } catch (Throwable error) { Afterglow.error("ShortsFullscreen.preference", error); }
    }

    private static void release(boolean showOverlay) {
        cancelIdle();
        tabsHiddenByPinch = overlayCleared = pinching = false;
        View view = content.get();
        ClearController controller = active.get();
        active.clear();
        content.clear();
        if (view != null) view.removeOnAttachStateChangeListener(CONTENT_ATTACHMENT);
        updateBottom();
        if (showOverlay && controller != null && view != null && view.isAttachedToWindow()) {
            controller.afterglow_setClear(false);
        }
    }

    private static final class BottomBinding implements View.OnAttachStateChangeListener,
            ViewTreeObserver.OnPreDrawListener {
        final View view;
        final WeakReference<BottomController> controller;
        ViewTreeObserver observer;
        boolean hidden;
        int nativeVisibility;

        BottomBinding(BottomController controller, View view) {
            this.controller = new WeakReference<>(controller);
            this.view = view;
        }

        @Override public void onViewAttachedToWindow(View view) {
            if (observer != null) return;
            observer = view.getViewTreeObserver();
            observer.addOnPreDrawListener(this);
        }

        @Override public void onViewDetachedFromWindow(View view) {
            if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
            observer = null;
            try { apply(false); }
            catch (Throwable error) { Afterglow.error("ShortsFullscreen.bottomDetach", error); }
        }

        @Override public boolean onPreDraw() {
            try {
                ShortsOnlyMode.beforeDraw(view);
                apply(hidesBottom());
            }
            catch (Throwable error) {
                if (observer != null && observer.isAlive()) observer.removeOnPreDrawListener(this);
                observer = null;
                try { apply(false); } catch (Throwable ignored) {}
                Afterglow.error("ShortsFullscreen.bottom", error);
            }
            return true;
        }

        void apply(boolean hide) {
            int visibility = view.getVisibility();
            boolean changed = hide != hidden;
            if (hide) {
                if (!hidden || visibility != View.GONE) nativeVisibility = visibility;
                hidden = true;
                if (visibility != View.GONE) {
                    view.setVisibility(View.GONE);
                    changed = true;
                }
            } else if (hidden) {
                hidden = false;
                if (visibility == View.GONE) view.setVisibility(nativeVisibility);
            }
            if (changed) {
                NavigationController tabs = navigation.get();
                if (tabs != null) tabs.afterglow_setBottomHidden(hide);
                BottomController target = controller.get();
                if (target != null) target.afterglow_refreshBottomHeight();
            }
        }
    }
}
