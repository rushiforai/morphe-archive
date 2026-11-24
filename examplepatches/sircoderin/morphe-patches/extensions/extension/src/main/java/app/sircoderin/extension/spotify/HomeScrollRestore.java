package app.sircoderin.extension.spotify;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.ViewTreeObserver;

import java.lang.ref.WeakReference;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.WeakHashMap;

/**
 * Restores Spotify Home's vertical and horizontal (carousel) scroll position after Back.
 *
 * Vertical position: on leave the top section (URI) and its offset are saved; on Back the list is hidden while Spotify
 * builds enough rows, then scrolled to that section and held there by an "anchor" enforced before each draw. The same
 * anchor mechanism keeps the section under the user in place when Spotify swaps in fresh Home content.
 *
 * Spotify's androidx is obfuscated: child positions and scrolling go through {@link HomeListBridge}, whose bodies the
 * patch replaces. All entry points are called on the main thread from patched Spotify code and never throw.
 */
@SuppressWarnings({"unused", "deprecation"})
public final class HomeScrollRestore {
    private static final String TAG = "SpotifyHomeRestore";
    private static final int ROW_SLACK = 5;
    private static final long DEADLINE_MS = 2500;
    private static final long SAVE_BURST_MS = 1000;
    private static final long RESTORE_ANCHOR_MS = 2000;
    private static final long SWAP_ANCHOR_MS = 1500;
    private static final int MAX_CORRECTIONS = 8;
    private static final int OFFSET_TOLERANCE = 2;

    private static final Handler HANDLER = new Handler(Looper.getMainLooper());

    /**
     * Carousel scroll states, keyed by section id. Spotify's carousel LayoutManager saves into such a map on detach
     * and restores from it on attach, but Spotify creates the map per view, so Back (which rebuilds Home's views)
     * lost every carousel position. The patch makes all carousels share this one instead (see carouselStates).
     */
    private static final LinkedHashMap<Object, Object> CAROUSEL_STATES = new LinkedHashMap<Object, Object>(64, 0.75f, true) {
        @Override protected boolean removeEldestEntry(Map.Entry<Object, Object> eldest) {
            return size() > 200;
        }
    };

    /** Per-list state. Back rebuilds the list view, so what was saved on leave lives in {@link #saved} instead. */
    private static final Map<View, State> STATES = new WeakHashMap<>();

    /** Where Home was left. Latest save wins; it outlives the list view it was taken from. */
    private static final class Saved {
        boolean valid;
        List<?> rows = Collections.emptyList();
        String key;
        int position;
        int offset;
        boolean atEnd;
    }

    private static Saved saved = new Saved();
    private static long lastSaveTime;

    private static final class Anchor {
        boolean restore; // RESTORE, else SWAP
        String key; // null: the end of the list
        int offset;
        long until;
        int corrections;
        long failedSignature = Long.MIN_VALUE;
        int satisfied;
    }

    private static final class State {
        /** Ready rows of the latest Home update. Each row carries its section URI ("spotify:section:<id>|<type>"). */
        List<?> lastList = Collections.emptyList();
        /** The rows as of the list's last drawn layout: child positions on screen index into these. */
        List<?> drawnRows = Collections.emptyList();
        Anchor anchor;
        WeakReference<ViewTreeObserver> hookedObserver = new WeakReference<>(null);

        // Pending restore (list hidden until enough rows exist).
        boolean pending;
        int need;
        Saved target;
        Runnable deadline;
        View.OnAttachStateChangeListener detachListener;
    }

    private HomeScrollRestore() {}

    private static State state(View list) {
        State st = STATES.get(list);
        if (st == null) {
            st = new State();
            STATES.put(list, st);
        }
        return st;
    }

    // ---- entry points ----

    /** Called right after getInt("viewDataHoldersSize"). Returns the count Spotify should use. */
    public static int onRestore(final View list, Bundle bundle, int savedCount) {
        try {
            // Spotify restores an empty second page right after Home (saved=0): nothing to do.
            if (savedCount <= 0) return savedCount;
            // The process was restarted and nothing was saved here. Spotify's own path would wait for savedCount
            // rows that are only built while scrolling, which leaves Home blank; show the rows at once instead.
            if (!saved.valid) {
                Log.d(TAG, "onRestore saved=" + savedCount + ": nothing saved in this process, showing rows at once");
                return 0;
            }
            final State st = state(list);
            cancelPending(st, list, false);
            st.pending = true;
            st.need = savedCount - ROW_SLACK;
            st.target = saved;
            st.anchor = null;
            list.setAlpha(0f);
            st.deadline = () -> {
                Log.d(TAG, "restore: deadline, restoring best effort");
                finishRestore(list, st);
            };
            HANDLER.postDelayed(st.deadline, DEADLINE_MS);
            st.detachListener = new View.OnAttachStateChangeListener() {
                @Override public void onViewAttachedToWindow(View v) {}

                @Override public void onViewDetachedFromWindow(View v) {
                    Log.d(TAG, "restore: list detached, cancelled");
                    cancelPending(st, v, true);
                }
            };
            list.addOnAttachStateChangeListener(st.detachListener);
            hookPreDraw(list, st);
            Log.d(TAG, "restore: waiting for " + st.need + " rows and section " + saved.key);
            nudge(list, st);
            return 0;
        } catch (Throwable t) {
            Log.d(TAG, "onRestore failed", t);
            try {
                cancelPending(state(list), list, true);
            } catch (Throwable ignored) {
            }
            return savedCount;
        }
    }

    /** Called at the start of every Home update. */
    public static void onEmission(View list, Object update) {
        try {
            State st = state(list);
            List<?> oldRows = st.drawnRows;
            List<?> rows = rowsOf(update);
            if (rows != null) st.lastList = rows;
            hookPreDraw(list, st);
            if (st.pending) {
                if (!list.isAttachedToWindow()) {
                    cancelPending(st, list, true);
                } else if (restoreReady(st)) {
                    finishRestore(list, st);
                } else {
                    Log.d(TAG, "restore: " + st.lastList.size() + "/" + st.need + " rows, waiting");
                }
                return;
            }
            keepTopRow(list, st, oldRows, st.lastList);
        } catch (Throwable t) {
            Log.d(TAG, "onEmission failed", t);
        }
    }

    /** Called when Home serializes its state (leaving Home). */
    public static void onSave(View list) {
        try {
            if (!(list instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) list;
            long now = SystemClock.uptimeMillis();
            boolean firstOfBurst = now - lastSaveTime > SAVE_BURST_MS;
            lastSaveTime = now;
            // The first save of a burst still sees the list intact.
            if (!firstOfBurst || group.getChildCount() == 0) return;
            State st = state(list);
            if (st.pending) return; // the list shows a hidden, nudged state; keep the previous save
            View child0 = group.getChildAt(0);
            List<?> rows = st.drawnRows.isEmpty() ? st.lastList : st.drawnRows;
            int pos = HomeListBridge.childPosition(child0);
            Saved s = new Saved();
            s.rows = rows;
            s.position = pos;
            s.key = pos >= 0 && pos < rows.size() ? rowKey(rows.get(pos)) : null;
            s.offset = child0.getTop() - list.getPaddingTop();
            s.atEnd = !list.canScrollVertically(1);
            s.valid = pos >= 0 && pos < rows.size();
            saved = s;
            Log.d(TAG, "save: " + rows.size() + " rows, top row " + pos + " " + s.key + " at " + s.offset
                    + (s.atEnd ? ", at the end" : "") + ", " + CAROUSEL_STATES.size() + " carousel states");
        } catch (Throwable t) {
            Log.d(TAG, "onSave failed", t);
        }
    }

    /** Called at the start of RecyclerView.onInterceptTouchEvent: the user touching the list ends its anchor. */
    public static void onListTouch(View list, MotionEvent event) {
        try {
            if (event.getActionMasked() != MotionEvent.ACTION_DOWN) return;
            State st = STATES.get(list);
            if (st != null && st.anchor != null) endAnchor(st, "touch");
        } catch (Throwable t) {
            Log.d(TAG, "onListTouch failed", t);
        }
    }

    /** Called from the carousel constructor in place of {@code new LinkedHashMap()}. */
    public static LinkedHashMap<Object, Object> carouselStates() {
        return CAROUSEL_STATES;
    }

    // ---- restore ----

    /**
     * While a restore is pending, scrolls the (invisible) list down by one screen every frame whenever it can move.
     * Each scroll moves Spotify's visible range, which makes its runtime ready the next rows and emit an update.
     * A single scroll isn't enough: it often runs before rows are laid out and then does nothing.
     */
    private static void nudge(final View list, final State st) {
        list.postOnAnimation(new Runnable() {
            @Override public void run() {
                try {
                    if (!st.pending) return; // restore finished or cancelled
                    if (restoreReady(st)) {
                        finishRestore(list, st);
                        return;
                    }
                    if (list.canScrollVertically(1)) list.scrollBy(0, list.getHeight());
                    list.postOnAnimation(this);
                } catch (Throwable t) {
                    Log.d(TAG, "nudge failed", t);
                }
            }
        });
    }

    /**
     * Whether the pending restore can run: Spotify builds Home's rows progressively as the list scrolls, and the
     * saved top section (for example the last row of Home) can come later than the saved row count suggests.
     */
    private static boolean restoreReady(State st) throws Exception {
        if (st.lastList.size() < st.need) return false;
        return st.target.key == null || indexOf(st.lastList, st.target.key) >= 0;
    }

    private static void finishRestore(final View list, final State st) {
        try {
            final Saved s = st.target;
            cancelPending(st, list, false);
            list.post(() -> {
                try {
                    applyRestore(list, st, s);
                } catch (Throwable t) {
                    Log.d(TAG, "restore failed", t);
                    list.setAlpha(1f);
                }
            });
        } catch (Throwable t) {
            Log.d(TAG, "finishRestore failed", t);
            list.setAlpha(1f);
        }
    }

    private static void applyRestore(View list, State st, Saved s) throws Exception {
        List<?> rows = st.lastList;
        Anchor a = new Anchor();
        a.restore = true;
        a.until = SystemClock.uptimeMillis() + RESTORE_ANCHOR_MS;
        if (s.atEnd) {
            int n = scrollToEnd(list);
            Log.d(TAG, "restore: Home was left at its end, scrolled " + n + " step(s) to it");
            st.anchor = a;
        } else if (!rows.isEmpty()) {
            int target = restoreTarget(s, rows);
            boolean ok = HomeListBridge.scrollToPositionWithOffset(list, target, s.offset, 0);
            Log.d(TAG, "restore: row " + target + " of " + rows.size() + " at " + s.offset + (ok ? "" : " (no scroll bridge)"));
            if (ok) {
                a.key = rowKey(rows.get(target));
                a.offset = s.offset;
                if (a.key != null) st.anchor = a;
            }
        }
        hookPreDraw(list, st);
        afterLayout(list, () -> list.setAlpha(1f));
    }

    /**
     * The index in {@code rows} of the saved top section. The Home rebuilt on Back (from cache) can order and count
     * rows differently. If the section is gone, uses its nearest saved neighbour that still exists, shifted by their
     * distance.
     */
    private static int restoreTarget(Saved s, List<?> rows) throws Exception {
        int pos = s.position;
        int target = indexOf(rows, s.key);
        if (target >= 0) {
            Log.d(TAG, "restore: top section " + (target == pos ? "unchanged at " : "moved from " + pos + " to ") + target);
            return target;
        }
        List<?> old = s.rows;
        for (int d = 1; d < old.size(); d++) {
            int before = pos - d >= 0 ? indexOf(rows, rowKey(old.get(pos - d))) : -1;
            int after = pos + d < old.size() ? indexOf(rows, rowKey(old.get(pos + d))) : -1;
            if (before >= 0) target = before + d;
            else if (after >= 0) target = after - d;
            if (before >= 0 || after >= 0) {
                target = Math.max(0, Math.min(rows.size() - 1, target));
                Log.d(TAG, "restore: top section gone, neighbour " + d + " row(s) away: " + pos + " -> " + target);
                return target;
            }
        }
        target = Math.max(0, Math.min(pos, rows.size() - 1));
        Log.d(TAG, "restore: no saved section among " + rows.size() + " rows, using " + target);
        return target;
    }

    private static void cancelPending(State st, View list, boolean restoreAlpha) {
        if (st.deadline != null) HANDLER.removeCallbacks(st.deadline);
        if (st.detachListener != null && list != null) list.removeOnAttachStateChangeListener(st.detachListener);
        st.deadline = null;
        st.detachListener = null;
        st.pending = false;
        if (restoreAlpha && list != null) list.setAlpha(1f);
    }

    // ---- anchor ----

    /**
     * Spotify replaces Home's rows wholesale when fresher content arrives (for example the network version a few
     * seconds after a cold start, with sections added or reordered), and the list keeps only the row number, so the
     * content under the user jumps by however many sections changed above. Like a well-behaved feed, anchor the
     * section at the top of the screen: note it and its offset now, before Spotify applies the new rows, and fix the
     * position before the next frame is drawn (see onListPreDraw).
     */
    private static void keepTopRow(View list, State st, List<?> oldRows, List<?> newRows) {
        try {
            if (!(list instanceof ViewGroup)) return;
            ViewGroup group = (ViewGroup) list;
            if (oldRows.isEmpty() || newRows.isEmpty() || oldRows == newRows) return;
            String head = "update " + oldRows.size() + " -> " + newRows.size() + " rows: ";
            Anchor cur = st.anchor;
            if (cur != null && SystemClock.uptimeMillis() < cur.until) {
                Log.d(TAG, head + "anchor active, keeping it");
                return;
            }
            if (group.getChildCount() == 0 || !list.isAttachedToWindow()) return;
            View child0 = group.getChildAt(0);
            int pos = HomeListBridge.childPosition(child0);
            if (pos < 0 || pos >= oldRows.size()) { Log.d(TAG, head + "top row position unknown (" + pos + ")"); return; }
            String key = rowKey(oldRows.get(pos));
            if (key == null) return;
            if (pos < newRows.size() && key.equals(rowKey(newRows.get(pos)))) return;
            Anchor a = new Anchor();
            a.key = key;
            a.offset = child0.getTop() - list.getPaddingTop();
            a.until = SystemClock.uptimeMillis() + SWAP_ANCHOR_MS;
            st.anchor = a;
            Log.d(TAG, head + "anchor set: top row " + pos + " moved, keeping " + key + " at " + a.offset);
        } catch (Throwable t) {
            Log.d(TAG, "keepTopRow failed", t);
        }
    }

    private static void endAnchor(State st, String reason) {
        Anchor a = st.anchor;
        if (a == null) return;
        st.anchor = null;
        Log.d(TAG, "anchor ended (" + (a.restore ? "restore" : "swap") + "): " + reason + " after " + a.corrections
                + " correction(s)");
    }

    private static void hookPreDraw(final View list, final State st) {
        ViewTreeObserver vto = list.getViewTreeObserver();
        if (st.hookedObserver.get() == vto) return;
        st.hookedObserver = new WeakReference<>(vto);
        vto.addOnPreDrawListener(() -> onListPreDraw(list, st));
    }

    /**
     * Runs after each layout of the list and before it is drawn. With an anchor set, checks that the anchored section
     * is at the top at its offset; if not, re-anchors the list and returns false, which cancels this draw and lays
     * out again, so the jumped frame is never shown.
     */
    private static boolean onListPreDraw(View list, State st) {
        List<?> rows = st.lastList;
        try {
            Anchor a = st.anchor;
            return a == null || !enforce((ViewGroup) list, st, a, rows);
        } catch (Throwable t) {
            Log.d(TAG, "anchor failed", t);
            st.anchor = null;
            return true;
        } finally {
            st.drawnRows = rows;
        }
    }

    /** Checks the anchor; returns true if it corrected the list (the draw must be cancelled). */
    private static boolean enforce(ViewGroup list, State st, Anchor a, List<?> rows) throws Exception {
        if (SystemClock.uptimeMillis() > a.until) {
            endAnchor(st, "timeout");
            return false;
        }
        if (list.getChildCount() == 0) return false;
        View child0 = list.getChildAt(0);
        int p = HomeListBridge.childPosition(child0);
        int off = child0.getTop() - list.getPaddingTop();
        int target = -1;
        boolean ok;
        if (a.key == null) {
            ok = !list.canScrollVertically(1);
        } else {
            target = indexOf(rows, a.key);
            if (target < 0) {
                endAnchor(st, "section gone");
                return false;
            }
            // For a swap, the right section on top is enough after one correction: the user may still be flinging.
            ok = p == target && (Math.abs(off - a.offset) <= OFFSET_TOLERANCE || (!a.restore && a.corrections > 0));
        }
        if (ok) {
            a.satisfied++;
            if (!a.restore || a.satisfied >= 2) endAnchor(st, "satisfied");
            return false;
        }
        a.satisfied = 0;
        if (a.corrections >= MAX_CORRECTIONS) {
            endAnchor(st, "giving up, top is row " + p + " at " + off);
            return false;
        }
        long sig = layoutSignature(list, p, off);
        if (sig == a.failedSignature) return false; // this exact layout already resisted a correction: draw, retry later
        a.failedSignature = sig;
        a.corrections++;
        if (a.key == null) {
            Log.d(TAG, "anchor corrected: scrolling back to the end");
            scrollToEnd(list);
        } else {
            Log.d(TAG, "anchor corrected: top is row " + p + " at " + off + ", moving row " + target + " to " + a.offset);
            if (!HomeListBridge.scrollToPositionWithOffset(list, target, a.offset, 0)) {
                endAnchor(st, "no scroll bridge");
                return false;
            }
        }
        return true;
    }

    /** Layout fingerprint: top position and offset, child count and the last child's bottom. */
    private static long layoutSignature(ViewGroup group, int top, int offset) {
        int n = group.getChildCount();
        int bottom = n == 0 ? 0 : group.getChildAt(n - 1).getBottom();
        return ((long) top << 48) ^ ((long) (offset & 0xFFFF) << 32) ^ ((long) n << 20) ^ (bottom & 0xFFFFF);
    }

    private static int scrollToEnd(View list) {
        int n = 0;
        while (n < 10 && list.canScrollVertically(1)) {
            list.scrollBy(0, Math.max(1, list.getHeight()));
            n++;
        }
        return n;
    }

    // ---- helpers ----

    private static int indexOf(List<?> rows, String key) throws Exception {
        if (key == null) return -1;
        for (int i = 0; i < rows.size(); i++) {
            if (key.equals(rowKey(rows.get(i)))) return i;
        }
        return -1;
    }

    private static Field rowKeyField;
    private static Class<?> rowKeyOwner;

    /** The row's section URI ("spotify:section:..."), or null. */
    private static String rowKey(Object row) throws Exception {
        if (row == null) return null;
        Class<?> cls = row.getClass();
        if (rowKeyOwner != cls) {
            rowKeyOwner = cls;
            rowKeyField = null;
            for (Field f : cls.getDeclaredFields()) {
                if (Modifier.isStatic(f.getModifiers())) continue;
                f.setAccessible(true);
                Object v = f.get(row);
                if (v instanceof String && ((String) v).startsWith("spotify:")) {
                    rowKeyField = f;
                    break;
                }
            }
        }
        if (rowKeyField == null) return null;
        Object v = rowKeyField.get(row);
        return v instanceof String ? (String) v : null;
    }

    private static void afterLayout(final View list, final Runnable r) {
        final ViewTreeObserver observer = list.getViewTreeObserver();
        observer.addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            @Override public void onGlobalLayout() {
                ViewTreeObserver vto = list.getViewTreeObserver();
                if (vto.isAlive()) vto.removeOnGlobalLayoutListener(this);
                try {
                    r.run();
                } catch (Throwable t) {
                    Log.d(TAG, "afterLayout failed", t);
                }
            }
        });
        list.requestLayout();
    }

    private static Field listField;
    private static Class<?> listFieldOwner;

    /** The ready rows of a Home update (its first List field), or null. */
    private static List<?> rowsOf(Object update) throws Exception {
        Class<?> cls = update.getClass();
        if (listField == null || listFieldOwner != cls) {
            Field found = null;
            for (Field f : cls.getDeclaredFields()) {
                if (List.class.isAssignableFrom(f.getType())) {
                    found = f;
                    break;
                }
            }
            if (found == null) throw new IllegalStateException("no List field on " + cls.getName());
            found.setAccessible(true);
            listField = found;
            listFieldOwner = cls;
        }
        return (List<?>) listField.get(update);
    }
}
