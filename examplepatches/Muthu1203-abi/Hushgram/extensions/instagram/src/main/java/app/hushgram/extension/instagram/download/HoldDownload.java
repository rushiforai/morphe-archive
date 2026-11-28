/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.hushgram.extension.instagram.download;

import android.app.Activity;
import android.graphics.Rect;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.view.ActionMode;
import android.view.HapticFeedbackConstants;
import android.view.KeyEvent;
import android.view.KeyboardShortcutGroup;
import android.view.Menu;
import android.view.MenuItem;
import android.view.MotionEvent;
import android.view.SearchEvent;
import android.view.View;
import android.view.ViewConfiguration;
import android.view.ViewGroup;
import android.view.ViewParent;
import android.view.Window;
import android.view.WindowManager;
import android.view.accessibility.AccessibilityEvent;

import androidx.annotation.Nullable;

import java.lang.ref.WeakReference;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

import app.hushgram.extension.instagram.settings.FamilyNames;
import app.hushgram.extension.instagram.settings.Settings;
import app.hushgram.extension.shared.L10n;
import app.hushgram.extension.shared.Utils;
import app.hushgram.extension.shared.diagnostics.HookStatus;

/**
 * Hold to download: two fingers (or three) held still on a feed post's picture or video, or on a reel,
 * save what's under them.
 *
 * <p>The "Download any video" patch calls {@link #feedTouch} first thing in the touch method of a feed
 * post's media frame (right after Long press to zoom's call when that patch is in) and {@link #reelTouch}
 * first thing in a reel's gesture detector. Each looks at nothing but the event's action, and on a first
 * finger going down with the switch on it notes what the finger landed on and gives the activity's window
 * a {@link Watcher}. The watcher sees the window's touches before Instagram does. A touch with one finger
 * goes straight on after a look at its pointer count. When the chosen number of fingers is down on the
 * noted post's view, all of them landed before Instagram's own long press could start, and none moves past the
 * touch slop for the chosen time, Instagram's gesture gets a cancel, as it would when the system takes a
 * gesture away, the rest of the gesture is kept from it, and the post saves through the same save as
 * Download in its menu ({@link VideoDownload#save} on a feed post, {@link ReelDownload#save} on a reel).
 *
 * <p>A video in the feed can sit under a clickable cover of its own (the keep-watching screen a reel preview
 * ends on), which takes the first finger before the media frame's touch method ever runs. So the patch also
 * calls {@link #feedMade} as each frame's touch holder is made, which keeps the frame with its holder and
 * watches the frame's window. When the second finger lands with no hook having noted this gesture, the
 * watcher looks for a kept frame under every finger with nothing clickable from outside its row on top, and
 * holds on that one.
 *
 * <p>Instagram's one-finger long press never sees a difference: a second finger landing ends a long press
 * in Android's gesture detector, and a hold that starts after one is refused. Off, paused or before the
 * settings are ready, the hooks note nothing, so no window is watched; a window watched from before goes
 * back to its own callback on its next touch with more than one finger.
 */
public final class HoldDownload {
    static final String COUNT_SAVED = "hold saved";
    static final String COUNT_NOTHING = "hold had nothing to save";

    /** What a hold landed on. */
    enum Kind { FEED, REEL }

    /** What a first finger last went down on, as a hook saw it. */
    static final class Target {
        final Kind kind;
        final WeakReference<Object> owner;
        final WeakReference<View> view;
        final long downTime;
        final int pointer;
        final float rawX;
        final float rawY;

        Target(Kind kind, Object owner, View view, MotionEvent down) {
            this.kind = kind;
            this.owner = new WeakReference<>(owner);
            this.view = new WeakReference<>(view);
            this.downTime = down.getDownTime();
            this.pointer = down.getPointerId(0);
            this.rawX = down.getRawX();
            this.rawY = down.getRawY();
        }
    }

    /** What the hooks' owners keep, through {@link HoldTargets}. Replaced by tests. */
    interface Reads {
        Object feedMedia(Object holder);

        Object feedState(Object holder);

        Object feedFrame(Object holder);

        Object reelMedia(Object detector);
    }

    static Reads reads = new Reads() {
        @Override public Object feedMedia(Object holder) {
            return HoldTargets.feedMedia(holder);
        }

        @Override public Object feedState(Object holder) {
            return HoldTargets.feedState(holder);
        }

        @Override public Object feedFrame(Object holder) {
            return HoldTargets.feedFrame(holder);
        }

        @Override public Object reelMedia(Object detector) {
            return HoldTargets.reelMedia(detector);
        }
    };

    /** What a hold saves. Replaced by tests. */
    interface Saver {
        /** Saves what [owner], a [kind] owner, has on screen, and answers whether anything saves. */
        boolean save(Kind kind, Object owner, Activity activity);
    }

    static Saver saver = (kind, owner, activity) -> {
        if (kind == Kind.REEL) {
            Object media = reads.reelMedia(owner);
            return media != null && ReelDownload.save(null, media, activity);
        }
        Object post = reads.feedMedia(owner);
        return post != null && VideoDownload.save(post, reads.feedState(owner), activity);
    };

    /** The last first finger the hooks noted. Main thread only. */
    @Nullable
    static Target target;

    /** The feed frames whose touch holders were made, each with its holder, held weakly both ways. Main thread only. */
    private static final Map<View, WeakReference<Object>> made = new WeakHashMap<>();

    /** The kept frames that were not on a window yet, and wait for one. */
    private static final Map<View, Boolean> waiting = new WeakHashMap<>();

    /** Each watched window's watcher, held weakly both ways, so a closed screen takes its watcher with it. */
    private static final Map<Window, WeakReference<Watcher>> watchers = new WeakHashMap<>();

    private HoldDownload() {
    }

    /**
     * Called first thing in the touch method of a feed post's media frame with the frame's touch
     * [holder]. Never throws.
     */
    public static void feedTouch(Object holder, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                target = null;
                if (!on(Kind.FEED)) return;
                Object frame = reads.feedFrame(holder);
                if (frame instanceof View) note(Kind.FEED, holder, (View) frame, event);
            } else if (action == MotionEvent.ACTION_CANCEL) {
                forget(holder);
            }
        } catch (Throwable failure) {
            target = null;
            HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download (feed)", failure);
        }
    }

    /**
     * Called last thing in the constructor of a feed post's touch holder, with the new [holder]. Keeps its
     * media frame for a hold the frame's own touch method never sees, and watches the frame's window as
     * soon as it has one. Never throws.
     */
    public static void feedMade(Object holder) {
        try {
            if (!on(Kind.FEED)) return;
            Object frame = reads.feedFrame(holder);
            if (!(frame instanceof View)) return;
            View view = (View) frame;
            made.put(view, new WeakReference<>(holder));
            if (view.isAttachedToWindow()) {
                watchWindowOf(view);
            } else if (waiting.put(view, Boolean.TRUE) == null) {
                view.addOnAttachStateChangeListener(new View.OnAttachStateChangeListener() {
                    @Override public void onViewAttachedToWindow(View attached) {
                        attached.removeOnAttachStateChangeListener(this);
                        waiting.remove(attached);
                        try {
                            if (on(Kind.FEED)) watchWindowOf(attached);
                        } catch (Throwable failure) {
                            HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download (made)", failure);
                        }
                    }

                    @Override public void onViewDetachedFromWindow(View detached) {
                    }
                });
            }
        } catch (Throwable failure) {
            HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download (made)", failure);
        }
    }

    /**
     * Called first thing in a reel's gesture detector with the [detector] and the [view] touched.
     * Never throws.
     */
    public static void reelTouch(Object detector, View view, MotionEvent event) {
        try {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                target = null;
                if (view != null && on(Kind.REEL)) note(Kind.REEL, detector, view, event);
            } else if (action == MotionEvent.ACTION_CANCEL) {
                forget(detector);
            }
        } catch (Throwable failure) {
            target = null;
            HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download (reel)", failure);
        }
    }

    /**
     * Whether a hold on a [kind] owner saves: its switch, a download switch it can save with, and for a
     * reel Download on reels. Paused or before the settings are ready, no.
     */
    static boolean on(Kind kind) {
        if (!Utils.settingsReady() || !Settings.HOLD_TO_DOWNLOAD.get()) return false;
        if (!Settings.DOWNLOAD_VIDEOS.get() && !Settings.DOWNLOAD_PHOTOS.get()) return false;
        return kind != Kind.REEL || Settings.DOWNLOAD_REELS.get();
    }

    /** The callback [callback] passes touches on to when it's a Hold to download watcher, else [callback]. */
    public static Window.Callback innerOf(Window.Callback callback) {
        return callback instanceof Watcher ? ((Watcher) callback).inner : callback;
    }

    /** Whether [window] has a watcher in its callbacks. For tests. */
    static boolean watched(Window window) {
        WeakReference<Watcher> known = watchers.get(window);
        return known != null && known.get() != null;
    }

    /** Notes [owner]'s [view] under a first finger, when the view is in its activity's own window, and watches that window. */
    private static void note(Kind kind, Object owner, View view, MotionEvent down) {
        Window window = windowOf(view);
        if (window == null) return;
        target = new Target(kind, owner, view, down);
        watch(window);
    }

    /** Watches the window [view] is in, when it is its activity's own. */
    private static void watchWindowOf(View view) {
        Window window = windowOf(view);
        if (window != null) watch(window);
    }

    /** [view]'s activity's window, unless the view sits in a dialog or a popup, whose window no watcher sees. */
    @Nullable
    private static Window windowOf(View view) {
        Activity activity = FeedDownloadButton.activityOf(view);
        Window window = activity == null ? null : activity.getWindow();
        if (window == null || window.peekDecorView() == null || view.getRootView() != window.peekDecorView()) return null;
        return window;
    }

    private static void forget(Object owner) {
        Target noted = target;
        if (noted != null && noted.owner.get() == owner) target = null;
    }

    /** Puts a watcher on [window], or wakes the one it has. */
    private static void watch(Window window) {
        WeakReference<Watcher> known = watchers.get(window);
        Watcher watcher = known == null ? null : known.get();
        if (watcher != null) {
            watcher.active = true;
            return;
        }
        Window.Callback inner = window.getCallback();
        if (inner == null) return;
        watcher = new Watcher(window, inner);
        watchers.put(window, new WeakReference<>(watcher));
        window.setCallback(watcher);
    }

    /** How many fingers a hold takes. */
    private static int fingers() {
        return Settings.HOLD_FINGERS.get().count;
    }

    /** How long a hold lasts. */
    private static long holdMillis() {
        return Settings.HOLD_TIME.get().millis;
    }

    /**
     * Sits in a window's callbacks and follows its touches with more than one finger. Every call goes on
     * to the callback it wraps, the way AppCompat's own wrapper passes them. Main thread only.
     */
    static final class Watcher implements Window.Callback {
        /** No hold under way. */
        static final int IDLE = 0;
        /** Some of the fingers are down on a noted post. */
        static final int WAITING = 1;
        /** Every finger is down and the clock runs. */
        static final int ARMED = 2;
        /** It saved: the rest of the gesture is kept from Instagram. */
        static final int SAVED = 3;
        /** Not a hold: the rest of the gesture is Instagram's. */
        static final int REFUSED = 4;

        final Window window;
        final Window.Callback inner;
        private final Handler handler = new Handler(Looper.getMainLooper());
        private final Runnable fire = this::fire;
        /** False once the switch went off with this watcher still under another wrapper. */
        boolean active = true;
        int state = IDLE;
        @Nullable private Target held;
        private int[] ids = new int[0];
        private float[] xs = new float[0];
        private float[] ys = new float[0];
        private float slop;

        Watcher(Window window, Window.Callback inner) {
            this.window = window;
            this.inner = inner;
        }

        @Override public boolean dispatchTouchEvent(MotionEvent event) {
            if (state == IDLE && event.getPointerCount() < 2) return inner.dispatchTouchEvent(event);
            boolean kept;
            try {
                kept = follow(event);
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download", failure);
                stop(state == SAVED ? SAVED : REFUSED);
                kept = state == SAVED;
                int action = event.getActionMasked();
                if (action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL) state = IDLE;
            }
            return kept || inner.dispatchTouchEvent(event);
        }

        /** Moves the hold along with [event], and answers whether the event is kept from Instagram. */
        private boolean follow(MotionEvent event) {
            int action = event.getActionMasked();
            if (action == MotionEvent.ACTION_DOWN) {
                stop(IDLE);
                return false;
            }
            boolean ends = action == MotionEvent.ACTION_UP || action == MotionEvent.ACTION_CANCEL;
            switch (state) {
                case SAVED:
                    if (ends) state = IDLE;
                    return true;
                case REFUSED:
                    if (ends) state = IDLE;
                    return false;
                case ARMED:
                    if (ends) {
                        stop(IDLE);
                    } else if (action == MotionEvent.ACTION_POINTER_DOWN || action == MotionEvent.ACTION_POINTER_UP
                            || moved(event)) {
                        stop(REFUSED);
                    }
                    return false;
                default:
                    if (ends) {
                        state = IDLE;
                    } else if (action == MotionEvent.ACTION_POINTER_UP) {
                        state = REFUSED;
                    } else if (action == MotionEvent.ACTION_POINTER_DOWN) {
                        landed(event);
                    }
                    return false;
            }
        }

        /** Another finger is down. */
        private void landed(MotionEvent event) {
            Target noted = target;
            // No hook saw this gesture go down, as when a cover over the frame took it: look for the frame under the fingers.
            if (noted == null || noted.downTime != event.getDownTime()) noted = covered(event);
            if (!active || noted == null || !on(noted.kind)) {
                state = REFUSED;
                if (!active || !on(Kind.FEED)) retire();
                return;
            }
            View view = noted.view.get();
            int count = event.getPointerCount();
            // Every finger lands before Instagram's own long press could have started, on the post the first one noted.
            if (view == null || noted.downTime != event.getDownTime() || count > fingers()
                    || event.getEventTime() - event.getDownTime() > ViewConfiguration.getLongPressTimeout()) {
                state = REFUSED;
                return;
            }
            float touchSlop = ViewConfiguration.get(view.getContext()).getScaledTouchSlop();
            if (wandered(event, noted, touchSlop) || !under(event, view)) {
                state = REFUSED;
                return;
            }
            if (count < fingers()) {
                state = WAITING;
                return;
            }
            ids = new int[count];
            xs = new float[count];
            ys = new float[count];
            for (int i = 0; i < count; i++) {
                ids[i] = event.getPointerId(i);
                xs[i] = event.getX(i);
                ys[i] = event.getY(i);
            }
            slop = touchSlop;
            held = noted;
            state = ARMED;
            handler.postDelayed(fire, holdMillis());
        }

        /**
         * The kept feed frame all of [event]'s fingers are on (the smallest when frames overlap) as this
         * gesture's target, or null. Only a frame showing on screen counts, and only when no clickable view
         * from outside its row (a sheet, a screen over the feed) is on top at the first finger. A cover
         * inside the row does not matter, since it is the reason to look.
         */
        @Nullable
        private static Target covered(MotionEvent event) {
            View best = null;
            Object owner = null;
            long smallest = Long.MAX_VALUE;
            for (Map.Entry<View, WeakReference<Object>> kept : new ArrayList<>(made.entrySet())) {
                View view = kept.getKey();
                Object holder = kept.getValue().get();
                if (view == null || holder == null || !view.isAttachedToWindow() || !view.isShown() || !fingersOn(event, view)) continue;
                long area = (long) view.getWidth() * view.getHeight();
                if (area >= smallest || !nothingOutsideItsRowOver(view, event.getX(0), event.getY(0))) continue;
                best = view;
                owner = holder;
                smallest = area;
            }
            return best == null ? null : new Target(Kind.FEED, owner, best, event);
        }

        /** Whether every finger of [event] is on the part of [view] that shows. */
        private static boolean fingersOn(MotionEvent event, View view) {
            Rect shows = new Rect();
            if (!view.getLocalVisibleRect(shows)) return false;
            int[] at = new int[2];
            view.getLocationInWindow(at);
            for (int i = 0; i < event.getPointerCount(); i++) {
                if (!shows.contains(Math.round(event.getX(i) - at[0]), Math.round(event.getY(i) - at[1]))) return false;
            }
            return true;
        }

        /** Whether the topmost clickable view at the window's point (x, y) is none, or sits inside the row [frame] is in. */
        private static boolean nothingOutsideItsRowOver(View frame, float x, float y) {
            View hit = clickableAt(frame.getRootView(), x, y);
            if (hit == null) return true;
            View row = frame;
            int up = 0;
            for (ViewParent parent = frame.getParent(); parent instanceof View; parent = parent.getParent()) {
                if (isRecycler(parent)) break;
                row = (View) parent;
                // Without a list around it, the row is the frame's own few levels.
                if (++up == 6) break;
            }
            if (hit == row) return true;
            for (ViewParent at = hit.getParent(); at != null; at = at.getParent()) {
                if (at == row) return true;
            }
            return false;
        }

        /** The topmost clickable view under (x, y) in the window's coordinates, trying each group's children from the one drawn last. */
        @Nullable
        private static View clickableAt(View view, float x, float y) {
            if (view instanceof ViewGroup) {
                ViewGroup group = (ViewGroup) view;
                int[] at = new int[2];
                for (int i = group.getChildCount() - 1; i >= 0; i--) {
                    View child = group.getChildAt(i);
                    if (child.getVisibility() != View.VISIBLE || child.getAlpha() == 0f) continue;
                    child.getLocationInWindow(at);
                    if (x < at[0] || y < at[1] || x >= at[0] + child.getWidth() || y >= at[1] + child.getHeight()) continue;
                    View found = clickableAt(child, x, y);
                    if (found != null) return found;
                }
            }
            return view.isClickable() || view.isLongClickable() ? view : null;
        }

        /** Whether [parent] is a RecyclerView or a subclass of one, whatever Instagram named the subclass. */
        private static boolean isRecycler(ViewParent parent) {
            for (Class<?> type = parent.getClass(); type != null; type = type.getSuperclass()) {
                if (type.getSimpleName().equals("RecyclerView")) return true;
            }
            return false;
        }

        /** Whether the first finger moved past [slop] from where it went down: one that slid has started a scroll. */
        private static boolean wandered(MotionEvent event, Target noted, float slop) {
            int index = event.findPointerIndex(noted.pointer);
            if (index < 0) return true;
            // Raw places of other fingers came only in Android 10, so the window's offset carries them.
            float x = event.getX(index) + event.getRawX() - event.getX(0);
            float y = event.getY(index) + event.getRawY() - event.getY(0);
            float dx = x - noted.rawX;
            float dy = y - noted.rawY;
            return dx * dx + dy * dy > slop * slop;
        }

        /** Whether every finger of [event], in the window's coordinates, is on [view]. */
        private static boolean under(MotionEvent event, View view) {
            int[] at = new int[2];
            view.getLocationInWindow(at);
            for (int i = 0; i < event.getPointerCount(); i++) {
                float x = event.getX(i) - at[0];
                float y = event.getY(i) - at[1];
                if (x < 0 || y < 0 || x >= view.getWidth() || y >= view.getHeight()) return false;
            }
            return true;
        }

        /** Whether a held finger moved past the slop, or lifted. */
        private boolean moved(MotionEvent event) {
            for (int i = 0; i < ids.length; i++) {
                int index = event.findPointerIndex(ids[i]);
                if (index < 0) return true;
                float dx = event.getX(index) - xs[i];
                float dy = event.getY(index) - ys[i];
                if (dx * dx + dy * dy > slop * slop) return true;
            }
            return false;
        }

        private void stop(int next) {
            handler.removeCallbacks(fire);
            held = null;
            state = next;
        }

        /** The time is up with every finger still down: save, unless the post or the switch went away meanwhile. */
        private void fire() {
            if (state != ARMED) return;
            Target noted = held;
            stop(REFUSED);
            try {
                Object owner = noted == null ? null : noted.owner.get();
                View view = noted == null ? null : noted.view.get();
                if (owner == null || view == null || !active || !on(noted.kind) || !view.isAttachedToWindow() || !view.isShown()) {
                    return;
                }
                Activity activity = FeedDownloadButton.activityOf(view);
                if (activity == null || activity.isFinishing() || activity.getWindow() != window) return;
                // Instagram's own handling of these fingers ends the way it does when the system takes a gesture away.
                MotionEvent cancel = MotionEvent.obtain(noted.downTime, SystemClock.uptimeMillis(), MotionEvent.ACTION_CANCEL, 0f, 0f, 0);
                try {
                    inner.dispatchTouchEvent(cancel);
                } finally {
                    cancel.recycle();
                }
                state = SAVED;
                if (target == noted) target = null;
                view.performHapticFeedback(HapticFeedbackConstants.LONG_PRESS);
                HookStatus.invoked(FamilyNames.VIDEO_DOWNLOAD);
                if (saver.save(noted.kind, owner, activity)) {
                    HookStatus.counted(FamilyNames.VIDEO_DOWNLOAD, COUNT_SAVED);
                } else {
                    HookStatus.counted(FamilyNames.VIDEO_DOWNLOAD, COUNT_NOTHING);
                    Feedback.show(activity.getApplicationContext(), L10n.t(activity, "Nothing to download on this post"), false);
                }
            } catch (Throwable failure) {
                HookStatus.threw(FamilyNames.VIDEO_DOWNLOAD, "hold to download save", failure);
            }
        }

        /** Off: steps out of the window's callbacks, or when something wrapped it since, stays a pass-through. */
        private void retire() {
            stop(state);
            if (window.getCallback() == this) {
                window.setCallback(inner);
                watchers.remove(window);
            } else {
                active = false;
            }
        }

        @Override public void onWindowFocusChanged(boolean hasFocus) {
            // A dialog or the shade took the window's focus, and with it the fingers.
            if (!hasFocus && state != IDLE) stop(state == SAVED ? SAVED : REFUSED);
            inner.onWindowFocusChanged(hasFocus);
        }

        @Override public void onDetachedFromWindow() {
            stop(IDLE);
            inner.onDetachedFromWindow();
        }

        @Override public boolean dispatchKeyEvent(KeyEvent event) {
            return inner.dispatchKeyEvent(event);
        }

        @Override public boolean dispatchKeyShortcutEvent(KeyEvent event) {
            return inner.dispatchKeyShortcutEvent(event);
        }

        @Override public boolean dispatchTrackballEvent(MotionEvent event) {
            return inner.dispatchTrackballEvent(event);
        }

        @Override public boolean dispatchGenericMotionEvent(MotionEvent event) {
            return inner.dispatchGenericMotionEvent(event);
        }

        @Override public boolean dispatchPopulateAccessibilityEvent(AccessibilityEvent event) {
            return inner.dispatchPopulateAccessibilityEvent(event);
        }

        @Nullable @Override public View onCreatePanelView(int featureId) {
            return inner.onCreatePanelView(featureId);
        }

        @Override public boolean onCreatePanelMenu(int featureId, Menu menu) {
            return inner.onCreatePanelMenu(featureId, menu);
        }

        @Override public boolean onPreparePanel(int featureId, @Nullable View view, Menu menu) {
            return inner.onPreparePanel(featureId, view, menu);
        }

        @Override public boolean onMenuOpened(int featureId, Menu menu) {
            return inner.onMenuOpened(featureId, menu);
        }

        @Override public boolean onMenuItemSelected(int featureId, MenuItem item) {
            return inner.onMenuItemSelected(featureId, item);
        }

        @Override public void onWindowAttributesChanged(WindowManager.LayoutParams attrs) {
            inner.onWindowAttributesChanged(attrs);
        }

        @Override public void onContentChanged() {
            inner.onContentChanged();
        }

        @Override public void onAttachedToWindow() {
            inner.onAttachedToWindow();
        }

        @Override public void onPanelClosed(int featureId, Menu menu) {
            inner.onPanelClosed(featureId, menu);
        }

        @Override public boolean onSearchRequested() {
            return inner.onSearchRequested();
        }

        @Override public boolean onSearchRequested(SearchEvent searchEvent) {
            return inner.onSearchRequested(searchEvent);
        }

        @Nullable @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback) {
            return inner.onWindowStartingActionMode(callback);
        }

        @Nullable @Override public ActionMode onWindowStartingActionMode(ActionMode.Callback callback, int type) {
            return inner.onWindowStartingActionMode(callback, type);
        }

        @Override public void onActionModeStarted(ActionMode mode) {
            inner.onActionModeStarted(mode);
        }

        @Override public void onActionModeFinished(ActionMode mode) {
            inner.onActionModeFinished(mode);
        }

        @Override public void onProvideKeyboardShortcuts(List<KeyboardShortcutGroup> data, @Nullable Menu menu, int deviceId) {
            inner.onProvideKeyboardShortcuts(data, menu, deviceId);
        }

        @Override public void onPointerCaptureChanged(boolean hasCapture) {
            inner.onPointerCaptureChanged(hasCapture);
        }
    }
}
