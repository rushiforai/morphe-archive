/*
 * Forked from:
 * https://github.com/ReVanced/revanced-patches/blob/377d4e15016296b45d809697f7f69bce74badd3a/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/cleardisplay/RememberClearDisplayPatch.java
 * Mirror, since GitHub blocks the original: https://gitlab.com/ReVanced/revanced-patches/-/blob/main/extensions/tiktok/src/main/java/app/revanced/extension/tiktok/cleardisplay/RememberClearDisplayPatch.java
 */
package app.morphe.extension.tiktok.cleardisplay;

import android.app.Activity;
import android.content.SharedPreferences;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.ViewTreeObserver;
import app.morphe.extension.shared.Logger;
import app.morphe.extension.shared.settings.Setting;
import app.morphe.extension.tiktok.blockauthor.Reflect;
import app.morphe.extension.tiktok.feed.VideoOverlayHider;
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.wellbeing.SessionBudget;
import java.lang.ref.WeakReference;
import java.util.concurrent.atomic.AtomicBoolean;

public final class RememberClearDisplayPatch {
    // Not BooleanSupplier and Consumer: java.util.function arrived at API 24 and D8 cannot
    // supply a missing type, so a payload with a floor of API 23 fails to resolve this class
    // on Android 6 before any of it runs.
    /** Whether the video this was started for is still the one on screen. */
    interface Condition {
        boolean holds();
    }

    /** Where a clear display change is delivered. */
    interface ClearEvent {
        boolean accept(boolean clear);
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static String currentId;
    private static Runnable pending;
    private static Runnable onFocus;
    private static volatile long generation;
    private static boolean applied;
    private static boolean manuallyChanged;
    private static volatile boolean awaitingNative;
    private static WeakReference<Object> currentController = new WeakReference<>(null);
    private static WeakReference<Object> currentModel = new WeakReference<>(null);
    private static Condition activeCondition;
    private static String activeId;
    private static final AtomicBoolean progressQueued = new AtomicBoolean();
    private static Object nativeEvent;
    private static Object nativeCell;
    private static boolean nativeWanted;
    private static boolean nativeApplied;
    private static long nativeGeneration;
    private static String nativeId;
    private static Object nativeController;
    private static Object nativeModel;
    private static Condition nativeCondition;
    /**
     * Whether the app is in clear display right now. The persisted setting cannot answer
     * this: {@link #rememberClearDisplayEvent} is the only thing that writes it and it
     * returns early for anything posted from here, which is the whole automatic path.
     */
    private static volatile boolean clearNow;
    /**
     * Whether the controls are hidden because the automatic path hid them, as opposed to TikTok
     * or the user. Only these are brought back when the automatic path is switched off: a clear
     * display the user chose (remembered or not, since a paused process doesn't remember it) is
     * theirs.
     */
    private static volatile boolean automaticHidden;
    /**
     * Whether the live clear state was last set by this patch (remembered or automatic), as
     * opposed to TikTok's own bar. Only a clear this patch made is undone on an item with no id:
     * TikTok's own clear mode is the user's in-TikTok choice, and what TikTok does with it on
     * such an item is TikTok's business.
     */
    private static volatile boolean hushfeedCleared;
    private static boolean observingPreferences;
    private static WeakReference<View> window = new WeakReference<>(null);
    private static final SharedPreferences.OnSharedPreferenceChangeListener PREFERENCES = (preferences, key) -> {
        if (key == null || key.equals(Settings.AUTOMATIC_CLEAR_DISPLAY.key)
                || key.equals(Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.key)) cancelOnMain();
    };
    private static final ViewTreeObserver.OnWindowFocusChangeListener FOCUS = focused -> {
        if (!focused) cancel();
        else if (onFocus != null) onFocus.run();
    };
    private static final View.OnAttachStateChangeListener ATTACH = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) { }
        @Override public void onViewDetachedFromWindow(View view) {
            if (window.get() != view) return;
            cancel();
            onFocus = null;
            applied = false;
            if (!manuallyChanged) currentId = null;
            if (view.getViewTreeObserver().isAlive()) view.getViewTreeObserver().removeOnWindowFocusChangeListener(FOCUS);
            view.removeOnAttachStateChangeListener(this);
            if (window.get() == view) window.clear();
        }
    };

    static void observeWindow(View view) {
        if (window.get() == view) return;
        View old = window.get();
        if (old != null) {
            if (old.getViewTreeObserver().isAlive()) old.getViewTreeObserver().removeOnWindowFocusChangeListener(FOCUS);
            old.removeOnAttachStateChangeListener(ATTACH);
        }
        cancel();
        onFocus = null;
        applied = false;
        if (!manuallyChanged) currentId = null;
        window = new WeakReference<>(view);
        view.getViewTreeObserver().addOnWindowFocusChangeListener(FOCUS);
        view.addOnAttachStateChangeListener(ATTACH);
    }

    private static void cancelOnMain() {
        if (Looper.myLooper() == Looper.getMainLooper()) cancel();
        else MAIN.post(RememberClearDisplayPatch::cancel);
    }

    public static void onFirstFrame(Object controller) {
        WeakReference<Object> owner = new WeakReference<>(controller);
        MAIN.post(() -> {
            Object player = owner.get();
            if (player == null) return;
            Object activity = Reflect.readField(player, "activity");
            if (!(activity instanceof Activity) || ((Activity) activity).isFinishing()
                    || ((Activity) activity).isDestroyed()) return;
            observeWindow(((Activity) activity).getWindow().getDecorView());
            Object aweme = readCurrentAweme(player);
            if (currentController.get() != player || currentModel.get() != aweme) {
                cancel();
                applied = false;
                currentController = new WeakReference<>(player);
            }
            WeakReference<Object> model = new WeakReference<>(aweme);
            currentModel = model;
            String id = Reflect.string(model.get(), "getAid", "aid");
            firstFrame(id, () -> {
                Object live = owner.get();
                Object context = Reflect.readField(live, "activity");
                Object item = model.get();
                return live != null && currentController.get() == live && item != null
                        && item == readCurrentAweme(live) && id != null
                        && id.equals(Reflect.string(item, "getAid", "aid"))
                        && context instanceof Activity && !((Activity) context).isFinishing()
                        && !((Activity) context).isDestroyed() && ((Activity) context).hasWindowFocus();
            }, RememberClearDisplayPatch::postClear);
        });
    }

    /** Native progress can arrive after the first frame's panel has become eligible. */
    public static void onPlaybackProgress(Object controller, String id) {
        if (!awaitingNative || !progressQueued.compareAndSet(false, true)) return;
        long observed = generation;
        MAIN.post(() -> {
            progressQueued.set(false);
            if (observed != generation || !awaitingNative || pending != null || applied || manuallyChanged
                    || controller == null || currentController.get() != controller
                    || id == null || !id.equals(currentId) || !Settings.AUTOMATIC_CLEAR_DISPLAY.get()) return;
            if (onFocus != null) onFocus.run();
        });
    }

    static void firstFrame(String id, Condition stillCurrent, ClearEvent event) {
        activeId = id;
        activeCondition = stillCurrent;
        if (!observingPreferences) {
            Setting.preferences.preferences.registerOnSharedPreferenceChangeListener(PREFERENCES);
            observingPreferences = true;
        }
        if (id == null || id.isEmpty()) {
            // Never cleared by this patch, whose clears are per video id. TikTok brings its
            // controls back on a new item by itself, so the live state, which the tab strip hide
            // reads, follows; left standing it kept TikTok's top bar away on such an item after
            // a remembered or automatic clear. A clear mode the user set through TikTok's own
            // bar is theirs and is left alone here.
            cancel();
            currentId = null;
            onFocus = null;
            applied = false;
            manuallyChanged = false;
            if (clearNow && hushfeedCleared) emit(event, false);
            return;
        }
        // The production condition holds only a weak reference to the current controller.
        onFocus = () -> firstFrame(id, stillCurrent, event);
        if (!Settings.AUTOMATIC_CLEAR_DISPLAY.get()) {
            cancel();
            currentId = null;
            applied = false;
            manuallyChanged = false;
            // Not under the daily hold, whose panel needs TikTok's tabs back (leaveForHold).
            if (Settings.CLEAR_DISPLAY.get() && !SessionBudget.isLocked()) emit(event, true);
            // Switched off while it had the controls hidden: TikTok brings them back on the next
            // video by itself, but the live state, which the tab strip hide reads, would say
            // hidden until TikTok's own clear display bar was used (S22, 2026-09-23).
            else if (automaticHidden) emit(event, false);
            return;
        }
        if (!id.equals(currentId)) {
            cancel();
            currentId = id;
            applied = false;
            manuallyChanged = false;
            emit(event, false);
        }
        if (pending != null || applied || manuallyChanged) return;
        long attempt = generation;
        pending = () -> {
            if (attempt != generation) return;
            pending = null;
            if (Settings.AUTOMATIC_CLEAR_DISPLAY.get() && id.equals(currentId) && stillCurrent.holds()
                    && !SessionBudget.isLocked()) {
                if (emit(event, true)) {
                    applied = true;
                    automaticHidden = true;
                    awaitingNative = false;
                } else if (attempt == generation) awaitingNative = true;
            }
        };
        MAIN.postDelayed(pending, awaitingNative ? 0
                : Math.max(0, Math.min(30000, Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.get())));
    }

    /**
     * The daily hold went up over a cleared screen. Its panel says messages, profiles and search
     * still work, and clear display has taken away the tabs that lead there, so TikTok's controls
     * come back with it. Only a clear display this patch posted or saw TikTok post is undone, and
     * neither the remembered nor the automatic path clears again while the hold runs. The choice
     * itself stays saved, so the next video after the hold clears as before.
     */
    public static void leaveForHold() {
        if (Looper.myLooper() != Looper.getMainLooper()) {
            MAIN.post(RememberClearDisplayPatch::leaveForHold);
            return;
        }
        cancel();
        applied = false;
        if (clearNow) emit(RememberClearDisplayPatch::postClear, false);
    }

    /** A fresh process's state, for the test classes that share this one's statics. */
    static void resetForTests() {
        cancel();
        currentId = null;
        onFocus = null;
        applied = false;
        manuallyChanged = false;
        View old = window.get();
        if (old != null) {
            if (old.getViewTreeObserver().isAlive()) old.getViewTreeObserver().removeOnWindowFocusChangeListener(FOCUS);
            old.removeOnAttachStateChangeListener(ATTACH);
        }
        window.clear();
        clearNow = false;
        hushfeedCleared = false;
        automaticHidden = false;
        currentController.clear();
        currentModel.clear();
        activeCondition = null;
        activeId = null;
        nativeEvent = null;
        nativeCell = null;
        nativeController = null;
        nativeModel = null;
        nativeCondition = null;
        progressQueued.set(false);
    }

    /** Whether the controls are hidden right now, automatically or by the user. */
    public static boolean isClearDisplayNow() {
        return clearNow;
    }

    private static boolean emit(ClearEvent event, boolean clear) {
        long dispatch = generation;
        try {
            boolean accepted = event.accept(clear);
            if (dispatch != generation) return false;
            if (clear && !accepted) return false;
            if (clearNow != clear) {
                clearNow = clear;
                MAIN.post(VideoOverlayHider::refresh);
            }
            // Withdrawing our auxiliary hiding is safe even if TikTok already exited and
            // skipped its native no-op. That is not an acknowledgment of a native transition.
            if (accepted || !clear) {
                hushfeedCleared = clear;
                automaticHidden = false;
            }
            return accepted;
        } catch (RuntimeException error) {
            Logger.printException(() -> "Could not change clear display", error);
            return false;
        } finally {
            nativeEvent = null;
            nativeCell = null;
            nativeController = null;
            nativeModel = null;
            nativeCondition = null;
        }
    }

    static void cancel() {
        generation++;
        awaitingNative = false;
        if (pending != null) MAIN.removeCallbacks(pending);
        pending = null;
    }

    public static void rememberClearDisplayEvent(Object event) {
        if (event == null) return;
        Object clear = Reflect.readField(event, "LIZ");
        Object type = Reflect.readField(event, "LIZIZ");
        if (!(clear instanceof Boolean) || !(type instanceof Integer)) return;
        if ((Integer) type == 3 || (Integer) type == 9) return;
        if (event == nativeEvent) return;
        if (clearNow != (Boolean) clear) {
            clearNow = (Boolean) clear;
            MAIN.post(VideoOverlayHider::refresh);
        }
        // TikTok's own change: from here the state is the user's, not this patch's.
        hushfeedCleared = false;
        // TikTok's own change: the state is TikTok's or the user's from here.
        automaticHidden = false;
        long observed = generation;
        Runnable changed = () -> {
            if (observed != generation) return;
            manuallyChanged = true;
            cancel();
        };
        if (Looper.myLooper() == Looper.getMainLooper()) changed.run();
        else MAIN.post(changed);
        // Paused, TikTok's own clear mode is not remembered over the choice kept for later.
        if (Setting.isPaused()) return;
        Settings.CLEAR_DISPLAY.save((Boolean) clear);
    }

    // Resolved from native first-frame code and clear-display event at patch time.
    private static Object readCurrentAweme(Object controller) { return null; }
    private static boolean postClear(boolean clear) { return false; }

    static void beginNativeDispatch(Object event, boolean clear) {
        nativeEvent = event;
        nativeCell = null;
        nativeWanted = clear;
        nativeApplied = false;
        nativeGeneration = generation;
        nativeId = activeId;
        nativeController = currentController.get();
        nativeModel = currentModel.get();
        nativeCondition = activeCondition;
    }

    // Resolves the panel's exact PlayerController at patch time.
    public static void onNativePanelApply(Object event, Object cell, Object panel) { }

    /** Called only at the panel's current-holder apply, never its adjacent-cell refresh. */
    public static void beforeNativeApply(Object event, Object cell, Object controller) {
        if (event != nativeEvent || controller != nativeController || !nativeDispatchCurrent()) return;
        if (nativeModel == Reflect.invoke(cell, "getAweme")) {
            if (nativeCell != cell) nativeApplied = false;
            nativeCell = cell;
        }
    }

    /** Reached only after the native cell updated its controls and published completion. */
    public static void onNativeApplied(Object cell, boolean clear) {
        if (nativeDispatchCurrent() && cell == nativeCell && nativeWanted == clear
                && nativeModel == Reflect.invoke(cell, "getAweme")) nativeApplied = true;
    }

    static boolean finishNativeDispatch() {
        return nativeDispatchCurrent() && nativeApplied && nativeCell != null
                && nativeModel == Reflect.invoke(nativeCell, "getAweme");
    }

    private static boolean nativeDispatchCurrent() {
        return nativeEvent != null && nativeGeneration == generation && nativeId != null
                && nativeId.equals(activeId) && nativeController != null
                && nativeController == currentController.get() && nativeModel != null
                && nativeModel == currentModel.get() && nativeCondition != null && nativeCondition.holds();
    }
}
