package app.afterglow.extension.navigation;

import android.app.Activity;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.widget.Toast;
import java.lang.ref.WeakReference;
import app.afterglow.extension.Afterglow;
import app.afterglow.extension.i18n.L10n;
import app.afterglow.extension.settings.AfterglowPrefs;
import app.afterglow.extension.settings.LiteMode;

/** iOS Shorts-only navigation and the two-finger, half-second escape gesture. */
public final class ShortsOnlyMode {
    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static WeakReference<ShortsFullscreen.GestureController> holdSource = new WeakReference<>(null);
    private static WeakReference<View> holdView = new WeakReference<>(null);
    private static WeakReference<View> entryView = new WeakReference<>(null);
    private static int firstPointer, secondPointer, slop;
    private static float firstX, firstY, secondX, secondY;
    private static boolean lastEnabled = enabled(), restorePending, entryPending, entryPosted;
    private static final Runnable REFRESH = ShortsOnlyMode::preferenceChanged;
    private static final Runnable ENTER = () -> {
        entryPosted = false;
        try {
            View view = entryView.get();
            if (!entryPending || !enabled() || view == null || !view.isAttachedToWindow()
                    || !view.hasWindowFocus()) return;
            if (ShortsFullscreen.selectShorts()) {
                entryPending = false;
                ShortsFullscreen.updateBottom();
            }
        } catch (Throwable error) {
            entryPending = false;
            AfterglowPrefs.setBool(ShortsHooks.SHORTS_ONLY_MODE, false);
            ShortsFullscreen.updateBottom();
            Afterglow.error("ShortsOnlyMode.enter", error);
        }
    };
    private static final Runnable RESTORE_TABS = () -> {
        try {
            restorePending = false;
            if (!enabled()) ShortsFullscreen.exitShortsOnlyMode();
            else ShortsFullscreen.updateBottom();
        } catch (Throwable error) { Afterglow.error("ShortsOnlyMode.restore", error); }
    };
    private static final Runnable HOLD = () -> {
        try {
            ShortsFullscreen.GestureController source = holdSource.get();
            View view = holdView.get();
            boolean accepted = enabled() && usable(source, view);
            cancelHold();
            if (!accepted) return;
            restorePending = true;
            MAIN.removeCallbacks(RESTORE_TABS);
            MAIN.postDelayed(RESTORE_TABS, 1000);
            AfterglowPrefs.setBool(ShortsHooks.SHORTS_ONLY_MODE, false);
            ShortsFullscreen.exitShortsOnlyMode();
            Toast.makeText(view.getContext(), L10n.get("ShortsModeTurnedOff", "Shorts-only mode turned off"),
                    Toast.LENGTH_SHORT).show();
        } catch (Throwable error) { Afterglow.error("ShortsOnlyMode.exit", error); }
    };

    static {
        AfterglowPrefs.addListener(key -> {
            if (key != null && !key.equals(ShortsHooks.SHORTS_ONLY_MODE) && !key.equals(LiteMode.KEY)) return;
            MAIN.removeCallbacks(REFRESH);
            MAIN.post(REFRESH);
        });
    }

    private ShortsOnlyMode() {}

    static boolean enabled() { return Gate.on(Gate.SHORTS, ShortsHooks.SHORTS_ONLY_MODE); }

    static boolean hidesTabs() { return (enabled() && !entryPending) || restorePending; }

    /** Native Back handlers still close panels; an unhandled Back keeps the Shorts root. */
    public static boolean consumeBack(boolean nativeHandled) { return nativeHandled || enabled(); }

    /** Wait for main's focused frame before issuing its native tab command. */
    static void beforeDraw(View view) {
        if (!entryPending || entryPosted || !enabled() || !view.isAttachedToWindow()
                || !view.hasWindowFocus()) return;
        entryView = new WeakReference<>(view);
        entryPosted = true;
        MAIN.post(ENTER);
    }

    private static void preferenceChanged() {
        try {
            boolean value = enabled();
            boolean entering = value && !lastEnabled;
            lastEnabled = value;
            cancelHold();
            if (value) {
                MAIN.removeCallbacks(RESTORE_TABS);
                restorePending = false;
            } else {
                MAIN.removeCallbacks(ENTER);
                entryPending = entryPosted = false;
                entryView.clear();
            }
            if (entering) {
                entryPending = true;
                Activity activity = Afterglow.mainActivity();
                if (activity != null && !activity.isFinishing() && !activity.isDestroyed()) {
                    // Foreground main, then use its real Shorts tab command on a focused frame.
                    // Native shortcut dispatch only handles the initial activity launch.
                    activity.startActivity(new Intent(Intent.ACTION_MAIN)
                            .setComponent(activity.getComponentName())
                            .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP | Intent.FLAG_ACTIVITY_SINGLE_TOP));
                }
            }
            ShortsFullscreen.updateBottom();
        } catch (Throwable error) { Afterglow.error("ShortsOnlyMode.preference", error); }
    }

    /** Observes events before native dispatch, including when pinch-to-fullscreen is OFF. */
    public static void touch(ShortsFullscreen.GestureController source, MotionEvent event) {
        try {
            if (!enabled() || source == null || event == null) { cancelHold(); return; }
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_POINTER_DOWN) {
                cancelHold();
                if (event.getPointerCount() != 2) return;
                View view = source.afterglow_playerView();
                if (!usable(source, view)) return;
                holdSource = new WeakReference<>(source);
                holdView = new WeakReference<>(view);
                firstPointer = event.getPointerId(0); secondPointer = event.getPointerId(1);
                firstX = event.getX(0); firstY = event.getY(0);
                secondX = event.getX(1); secondY = event.getY(1);
                slop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
                MAIN.postDelayed(HOLD, 500);
            } else if (action == MotionEvent.ACTION_MOVE && holdSource.get() != null) {
                int first = event.findPointerIndex(firstPointer), second = event.findPointerIndex(secondPointer);
                if (source != holdSource.get() || event.getPointerCount() != 2 || first < 0 || second < 0
                        || outsideSlop(event.getX(first), event.getY(first), firstX, firstY)
                        || outsideSlop(event.getX(second), event.getY(second), secondX, secondY)) cancelHold();
            } else if (action == MotionEvent.ACTION_DOWN || action == MotionEvent.ACTION_POINTER_UP
                    || action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL
                    || action == MotionEvent.ACTION_OUTSIDE) cancelHold();
        } catch (Throwable error) {
            cancelHold();
            Afterglow.error("ShortsOnlyMode.touch", error);
        }
    }

    private static boolean outsideSlop(float x, float y, float startX, float startY) {
        float dx = x - startX, dy = y - startY;
        return dx * dx + dy * dy > slop * slop;
    }

    private static boolean usable(ShortsFullscreen.GestureController source, View view) {
        return source != null && view != null && source.afterglow_playerView() == view
                && view.isAttachedToWindow() && view.isShown() && view.hasWindowFocus();
    }

    private static void cancelHold() {
        MAIN.removeCallbacks(HOLD);
        holdSource.clear();
        holdView.clear();
    }
}
