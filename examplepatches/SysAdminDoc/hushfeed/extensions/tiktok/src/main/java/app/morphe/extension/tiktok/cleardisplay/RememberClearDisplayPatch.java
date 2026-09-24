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
import app.morphe.extension.tiktok.settings.Settings;
import app.morphe.extension.tiktok.wellbeing.SessionBudget;
import java.lang.ref.WeakReference;

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
        void accept(boolean clear);
    }

    private static final Handler MAIN = new Handler(Looper.getMainLooper());
    private static String currentId;
    private static Runnable pending;
    private static boolean posting;
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
    };
    private static final View.OnAttachStateChangeListener ATTACH = new View.OnAttachStateChangeListener() {
        @Override public void onViewAttachedToWindow(View view) { }
        @Override public void onViewDetachedFromWindow(View view) {
            cancel();
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
        window = new WeakReference<>(view);
        view.getViewTreeObserver().addOnWindowFocusChangeListener(FOCUS);
        view.addOnAttachStateChangeListener(ATTACH);
    }

    private static void cancelOnMain() {
        if (Looper.myLooper() == Looper.getMainLooper()) cancel();
        else MAIN.post(RememberClearDisplayPatch::cancel);
    }

    // Kept for already-patched first-frame hooks.
    public static boolean getClearDisplayState() {
        clearNow = !Settings.AUTOMATIC_CLEAR_DISPLAY.get() && Settings.CLEAR_DISPLAY.get();
        return clearNow;
    }

    public static void onFirstFrame(Object controller) {
        WeakReference<Object> owner = new WeakReference<>(controller);
        MAIN.post(() -> {
            Object player = owner.get();
            if (player == null) return;
            Object activity = Reflect.readField(player, "activity");
            if (activity instanceof Activity) observeWindow(((Activity) activity).getWindow().getDecorView());
            String id = videoId(player);
            firstFrame(id, () -> {
                Object live = owner.get();
                Object context = Reflect.readField(live, "activity");
                return live != null && id != null && id.equals(videoId(live))
                        && context instanceof Activity && !((Activity) context).isFinishing()
                        && !((Activity) context).isDestroyed() && ((Activity) context).hasWindowFocus();
            }, RememberClearDisplayPatch::postClear);
        });
    }

    private static String videoId(Object controller) {
        return Reflect.string(readCurrentAweme(controller), "getAid", "aid");
    }

    static void firstFrame(String id, Condition stillCurrent, ClearEvent event) {
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
            if (clearNow && hushfeedCleared) emit(event, false);
            return;
        }
        if (!Settings.AUTOMATIC_CLEAR_DISPLAY.get()) {
            cancel();
            currentId = null;
            // Not under the daily hold, whose panel needs TikTok's tabs back (leaveForHold).
            if (Settings.CLEAR_DISPLAY.get() && !SessionBudget.isLocked()) emit(event, true);
            // Switched off while it had the controls hidden: TikTok brings them back on the next
            // video by itself, but the live state, which the tab strip hide reads, would say
            // hidden until TikTok's own clear display bar was used (S22, 2026-09-23).
            else if (automaticHidden) emit(event, false);
            return;
        }
        if (id.equals(currentId)) return;
        cancel();
        currentId = id;
        emit(event, false);
        pending = () -> {
            pending = null;
            if (Settings.AUTOMATIC_CLEAR_DISPLAY.get() && id.equals(currentId) && stillCurrent.holds()
                    && !SessionBudget.isLocked()) {
                emit(event, true);
                automaticHidden = true;
            }
        };
        MAIN.postDelayed(pending, Math.max(0, Math.min(30000, Settings.AUTOMATIC_CLEAR_DISPLAY_DELAY.get())));
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
        if (clearNow) emit(RememberClearDisplayPatch::postClear, false);
    }

    /** A fresh process's state, for the test classes that share this one's statics. */
    static void resetForTests() {
        cancel();
        currentId = null;
        clearNow = false;
        hushfeedCleared = false;
        automaticHidden = false;
        posting = false;
    }

    /** Whether the controls are hidden right now, automatically or by the user. */
    public static boolean isClearDisplayNow() {
        return clearNow;
    }

    private static void emit(ClearEvent event, boolean clear) {
        clearNow = clear;
        hushfeedCleared = clear;
        automaticHidden = false;
        posting = true;
        try { event.accept(clear); }
        catch (RuntimeException error) { Logger.printException(() -> "Could not change clear display", error); }
        finally { posting = false; }
    }

    static void cancel() {
        if (pending != null) MAIN.removeCallbacks(pending);
        pending = null;
    }

    public static void rememberClearDisplayEvent(Object event) {
        if (event == null) return;
        Object clear = Reflect.readField(event, "LIZ");
        Object type = Reflect.readField(event, "LIZIZ");
        if (!(clear instanceof Boolean) || !(type instanceof Integer)) return;
        if ((Integer) type == 3 || (Integer) type == 9) return;
        clearNow = (Boolean) clear;
        if (posting) return;
        // TikTok's own change: from here the state is the user's, not this patch's.
        hushfeedCleared = false;
        // TikTok's own change: the state is TikTok's or the user's from here.
        automaticHidden = false;
        cancelOnMain();
        // Paused, TikTok's own clear mode is not remembered over the choice kept for later.
        if (Setting.isPaused()) return;
        Settings.CLEAR_DISPLAY.save((Boolean) clear);
    }

    // Resolved from native first-frame code and clear-display event at patch time.
    private static Object readCurrentAweme(Object controller) { return null; }
    private static void postClear(boolean clear) { }
}
